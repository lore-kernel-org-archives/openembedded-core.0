Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA1C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 08:48:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7988.1744966093789897692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 01:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Uir+OsUt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FA9643396;
	Fri, 18 Apr 2025 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744966092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IKCDbCipcdbo0RPk5X+z9nJHftfio9KIK1MJ/MnsKU=;
	b=Uir+OsUtp0Z5ZHGeyaZJAn3Xzb7wZFdjXda0PLBxSKSxHeHTtPTvmZ8iXEsy0yraJ/pR6K
	/1Zjb1hG/t5P2JVHVIKyZ3ytxdrDTNCOz10uPDJJRNew1eHwb1/A/5cPJ30wJXey0NF9u8
	63ilgXUGfiEPcMEyv4Oh7XNH+ZVDXqBKIxdy00+foFYmy6S86GfP9DZogvpVdsgjmKTETy
	ywG9UaomzBOlPZ1GENyp7SlMymQ/36VhJC7NHxoSkgUB2O2lDjoA9fNXMcKCoTT7k/pFvf
	xRrR/5XOyrBQXIMM4esDvHRyruNupFr4Gj9VLkB04f17daTHtJHb3mbBhf3brg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Apr 2025 10:48:11 +0200
Message-Id: <D99MUROJP27W.R1R8AFSIJZW9@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Haitao.Mi@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] spdx30: Provide software_packageUrl field in
 SPDX 3.0 SBOM.
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250415090304.139447-1-haitao.mi@windriver.com>
In-Reply-To: <20250415090304.139447-1-haitao.mi@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjfgrihhtrghordfoihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehop
 hgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 08:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215125

On Tue Apr 15, 2025 at 11:03 AM CEST, Haitao via lists.openembedded.org Mi =
wrote:
> From: Haitao Mi <haitao.mi@windriver.com>
>
> A purl is composed with these fields:
> scheme:type/namespace/name@version?qualifiers#subpath
>
> Set 'namespace' field through SPDX_PURL_NAMESPACE variable, the default
> value is ${DISTRO}.
>
> Insert private project info into 'qualifiers' field through
> PACKAGE_URL_QUALIFIERS_EXTEND variable, join the key=3Dvalue format
> with '&' symbol.
>
> Set 'subpath' field through SPDX_PURL_SUBPATH variable, default is empty.
>
> Signed-off-by: Haitao Mi <haitao.mi@windriver.com>
> ---

Hi,

Thanks for your patch.

It looks like this is causing some issue with oe-selftests, as can be
seen on the autobuilder:

2025-04-17 16:37:06,858 - oe-selftest - INFO - FAIL: sstatetests.SStateHash=
SameSigs3.test_sstate_multilib_or_not_native_samesigs (subunit.RemotedTestC=
ase)
2025-04-17 16:37:06,858 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2025-04-17 16:37:06,858 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/sstatetests.py", line 588, in test_sstate_multilib_or_not_na=
tive_samesigs
    self.assertCountEqual(files1, files2)
  File "/usr/lib64/python3.12/unittest/case.py", line 1216, in assertCountE=
qual
    self.fail(msg)
  File "/usr/lib64/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-fedora=
/build/build-st-1615629/tmp-sstatesamehash/stamps/x86_64-linux/e2fsprogs-na=
tive/1.47.1.do_create_spdx.sigdata.d0c055a026310db6c0ae4466d0dd7e8c7a6dae35=
3690b6c59b8551fdb9628ef3'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-fedora=
/build/build-st-1615629/tmp-sstatesamehash/stamps/x86_64-linux/e2fsprogs-na=
tive/1.47.1.do_collect_spdx_deps.sigdata.dc5f13f56a3a4a875716f8857636dc8f60=
3e559a734f95a49f8327e5c937d7bb'
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1323

Can you have a look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


