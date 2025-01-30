Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869FFC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 14:24:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.16410.1738247051620732855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 06:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ly05EeLc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 569C144301;
	Thu, 30 Jan 2025 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738247049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCcXmBiRkgYRmq3f0q5bR7JTd3bK1bdxCSztqhLla5A=;
	b=ly05EeLcIGP44TNZtz1v8i/WDZZgfh2ayG9qdUfoxNhtOaFpSQZzevbrayaFb6BPGB/HUt
	9jAv8a4X7ke/l4BVGOGUyOJKhGxODPMAbEZmFO1yIz6VvgOUCEAUUS/GH/IiUTLl1Qee8g
	1vUMWC80Wj7SJvssGQYdamVJkYyvTJM4M+bx/kXZ/RZODbwFj7GgTQz+vQ5Wk3tptzIYTw
	0STHIITaJxErZ8ebaQ6GPMNHCHCSKcHDxYBiz+tO9chfL493fqO6BT0YAnQZuCbZKdhfO+
	DRtQJEzwKQ6ZvSc32pHiU6QsfDazcyruDL+mhfKY2M5DpsE9KkoNfHF6xMC34Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jan 2025 15:24:09 +0100
Message-Id: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
Subject: Re: [OE-core][PATCH v3 1/2] rpm-sequoia: New recipe for version
 1.7.0
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Randy MacLeod"
 <randy.macleod@windriver.com>, "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250129124741.4115324-1-zboszor@gmail.com>
In-Reply-To: <20250129124741.4115324-1-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeggfetgeehgeejhefhhfegleekhefgleefueektedvkeeitddtveegfeduueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrt
 ghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 14:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210446

On Wed Jan 29, 2025 at 1:47 PM CET, Zoltan Boszormenyi via lists.openembedd=
ed.org wrote:
> rpm 4.20 removed the built-in code to handle signed packages
> and uses rpm-sequoia as a more feature complete library.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

Thanks for your patch.

I believe this is breaking the oe-selftests on the autobuilder, with the
following error:

2025-01-30 08:53:43,254 - oe-selftest - INFO - 13: 4/35 61/618 (51.96s) (0 =
failed) (distrodata.Distrodata.test_maintainers)
2025-01-30 08:53:43,254 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/distrodata.py", line 105, in test_maintainers
                self.fail("""
                ~~~~~~~~~^^^^
    The following recipes do not have a maintainer assigned to them. Please=
 add an entry to meta/conf/distro/include/maintainers.inc file.
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    """ + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError:
The following recipes do not have a maintainer assigned to them. Please add=
 an entry to meta/conf/distro/include/maintainers.inc file.
rpm-sequoia (/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/reci=
pes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/828/step=
s/14/logs/stdio

Can you fix the described issue please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


