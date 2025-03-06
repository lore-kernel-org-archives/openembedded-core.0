Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E82C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:31:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.18268.1741278697028572733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 08:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FrKM5V64;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BEE944430;
	Thu,  6 Mar 2025 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741278694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zpY6BsWe4Svie9s9lErtBt3tFxw4wmK1Wla1t/x09A=;
	b=FrKM5V64Ge6VbL/nGkQTQU79FsFppvEqSTwHVWelW6gU1WvWcwzJbjFQbBqUatFNaE54pv
	8u9CP0GnhLSs2IxxU0zS3UjZcP4AnI3UHOKj/2LnSETY5b3e4hgRJwWdN5G3nTBxbAQbaz
	Opka+mnc+l3psVG2C4Bjj501PIIwLpjhk/qfGGQ/9bKn7FHqrbGRP8gRnUcj+dezVAZGfw
	u/Iu8y3yj6hctyk8T7cKCZmf+n+8wNUbOxNSNj7XydfJ1m8AEkrSSQzQ7DbglkX0Y0MWwG
	RuCqD0kZ4Rf5VBQ2aYE9UQcc4hnrk5/c3J7V8MTys1Mlq0ECjRvzzwi1rmn4ig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 17:31:33 +0100
Message-Id: <D89BS4L9U96O.ZURDXXDPHQVV@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bin.lan.cn@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] babeltrace2: upgrade 2.0.6 -> 2.1.0
Cc: <randy.macleod@windriver.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250306085625.2864894-1-bin.lan.cn@windriver.com>
In-Reply-To: <20250306085625.2864894-1-bin.lan.cn@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuvefofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffegtdektddvvdehiedukeevtdfgleekieeluedthfekudffgfdufeeigeetffffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsggrsggvlhhtrhgrtggvrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsihhnrdhlrghnr
 dgtnhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 16:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212396

On Thu Mar 6, 2025 at 9:56 AM CET, Bin Lan via lists.openembedded.org wrote=
:
> From: Bin Lan <bin.lan.cn@windriver.com>
>
> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
> for tests/lib/test_plugin is removed.
> 0001-tests-do-not-run-some-tests.patch is used to disable
> some new test cases.
>
> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.=
0 PSF-2.0
>
> Changelog:
> Babeltrace 2.1, MIP 1 is available and adds many functions
> to support CTF 2 features.
> The Python bindings wrap all the library changes in the same
> systematic way as in Babeltrace 2.0. Add type hints to the
> public API to assist with static analysis of your applications.
>
> Details about the 2.1.0 release:
> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.=
html
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---

Hi,

Thanks for the new version, but now the autobuilder is also complaining
about a reproducibility issue:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/babeltrace2-ptest_2.1.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./core2-64/babeltrace2-ptest_2.1.0-r0_core2-64.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./core2_64/babeltrace2-ptest-2.1.0-r0.core2_64.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1162

The diffoscope output can be seen here: https://valkyrie.yocto.io/pub/repro=
-fail/oe-reproducible-20250306-y64pb4t5/packages/diff-html/

Can you fix this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


