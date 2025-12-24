Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93415E75451
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 12:27:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.119696.1766579242643409433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 04:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AZ4pz6k8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 53DA41A23D7;
	Wed, 24 Dec 2025 12:27:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 297F66073D;
	Wed, 24 Dec 2025 12:27:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B59110AB1154;
	Wed, 24 Dec 2025 13:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766579239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WE8du2vBu9pRlYtlTXTctteOD7P/SNRx2n6XUSe9/v4=;
	b=AZ4pz6k8Jojj926Rk+KHkqvAN/HKlfOvnCsumbWlk0Stt+RpLFGJaGgCb7RKPZWG67nZuc
	WqL2nRWvLxcybRRkJJQh/O8xlrjHe306rkkqI8qUhMbE6LBVqIHRCfBVgyXu5YGivoUDfc
	wptAPaWZ5LpWN5HQhAJzpyU1BL0UxZYJM1tvd3E3KfL9VnP6hlD+/PVrZQkhgGHzyYwRPK
	iHHD/X6xvqvxM9/Bn5gnqCS4AEQA5QddtQfeu08sn/JRm3SZjVPSSKIi/Pf0WO7zVSPlgD
	xMR29j7BYLxUPP+5qCNnjC9tEp+ZFtJmWlffWupRTi74FMAG+v/gk6DUJ//DTg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 13:27:16 +0100
Message-Id: <DF6G2PMRSXXY.21IIG4AHJPEJW@bootlin.com>
Subject: Re: [OE-core] [PATCH] llvm/clang: Upgrade to 21.1.8 release
Cc: <Sundeep.Kokkonda@windriver.com>, <hemanth.250302@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Yash.Shinde@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251223094504.2919922-1-Yash.Shinde@windriver.com>
In-Reply-To: <20251223094504.2919922-1-Yash.Shinde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 12:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228529

On Tue Dec 23, 2025 at 10:45 AM CET, Yash Shinde via lists.openembedded.org=
 wrote:
> From: HemanthKumar M D <hemanth.250302@gmail.com>
>
> Brings following bugfixes on top of 21.1.7
>
> 2078da43e25a (HEAD, tag: llvmorg-21.1.8, origin/release/21.x) [Github] Re=
move use of setup-windows and install-ninja in llvm tests
> b6360d3bc7a9 [Github] Remove install-ninja/setup-windows
> 7eb4bfe053d6 [ExtractAPI] Format typedef params correctly (#171516)
> 51e5074676d4 [compiler-rt][sanitizer] fix i386 build for Haiku (#171075)
> d2e835bd4638 [SelectOptimize] Fix incorrect -1 immediate for large intege=
rs (#170860)
> 4b24e73d34ca [WebAssembly] Remove FAKE_USEs before ExplicitLocals (#16076=
8)
> 4582a800c588 release/21.x: [clang-format] Fix a regression in annotating =
star before lambda (#170969)
> a5658809ac4a [clang-format] Fix a crash in AlignArrayOfStructures (#16709=
9)
> 94c40c61c1ce [clang-format] Don't swap `(const override)` with QAS_Right =
(#167191)
> b845b4cd771e [rtsan] Handle attributed IR function declarations (#169577)
> f68f64eb8130 Bump version to 21.1.8
>
> Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---

Hi Yash,

Thanks for your patch.

You will also need to update the llvm-project-source entry in
meta/conf/distro/include/maintainers.inc to avoid QA error:

2025-12-24 09:48:11,352 - oe-selftest - INFO - distrodata.Distrodata.test_m=
aintainers (subunit.RemotedTestCase)
2025-12-24 09:48:11,353 - oe-selftest - INFO -  ... FAIL
...
AssertionError:
The following recipes do not have a maintainer assigned to them. Please add=
 an entry to meta/conf/distro/include/maintainers.inc file.
llvm-project-source-21.1.8 (/srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-sou=
rce.bb)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2905
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2800
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3043

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


