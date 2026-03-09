Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D74EF36F4
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:13:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8757.1773040386671859483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VG0fyeKE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7082C4286F;
	Mon,  9 Mar 2026 07:13:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 921B65FFB8;
	Mon,  9 Mar 2026 07:13:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D570110369906;
	Mon,  9 Mar 2026 08:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773040384; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gK/Xa8ztJu5p4kp69y5QrVzCAFbY4Cy9r9/dlAniX+Q=;
	b=VG0fyeKE61VDrO8rmkEquA8OqYDGqXGRIkBbvxlU75MjP+nNCkMkiCtW4Rusj1diFrz//P
	jxbDZszEeyKTOqfwVePChggtaBVdjG2cJ9+PVj1tGiCWNqCrmKE8GCT39OddOb4p5bFnm4
	K41Vi+UM2EuDpy5uGuF0o2hmsSGzmNla+EoRODbyuqL2W1vItGYGfx+mTEDRJogfUSO7PZ
	gpBnbOlV7QMcVSekLI0Y9clxk67KMBktQULOHu+sQLEzjtABUBjpx8qlbMiw6i6zHMjx5x
	VF5V1mjFmpEixWeaQbfcdbjV9PVBdV34wlIvsCwwWNNTghFRkEwNovmxG8g/Uw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 08:13:01 +0100
Message-Id: <DGY2CYFRS69Z.3CLMQ8NPRDMMZ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/7] glibc: Upgrade to 2.43 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232682

On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembedded=
.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> License-Update: Match to changes [1]
>
> Added free_sized, free_aligned_sized, memset_explicit, memalignment, and =
new time bases (TIME_MONOTONIC, etc.).
>
> Support for the Linux mseal system call to protect memory mappings (seali=
ng).
>
> Added support for the openat2 system call, allowing more granular file op=
ening options.
>
> New, optimized, and correctly rounded functions from the CORE-MATH projec=
t (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>
> Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by =
updating ldbl-96 implementation.
>
> Improved remainder, frexp, and frexpl.
>
> Experimental Clang Support: Added support for building with LLVM Clang (v=
ersion 18+) on AArch64/x86_64 Linux.
>
> New CPU Detection: Enhanced detection for newer CPU architectures.
>
> 64-bit atomics for 32bit x86 patch is no longer required since upstrea ha=
s dropped this logic in 2.43 release
>
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b0779e2=
90596e99ca6d96c301684a2d7cfe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Hemanth,

I also note this failure, that is probably also related to this series:

ERROR: libcap-native-2.77-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buil=
dtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/work/x=
86_64-linux/libcap-native/2.77/temp/run.do_compile.3180827' failed with exi=
t code 1
...
| gperf: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64=
-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitb=
ake-build-p7zx603b/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6: versi=
on `GLIBC_2.43' not found (required by gperf)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3357

Maybe also some selftest failures, such as:
2026-03-08 19:23:59,572 - oe-selftest - INFO - locales.LocalesTest.test_loc=
ales_off (subunit.RemotedTestCase)
2026-03-08 19:23:59,574 - oe-selftest - INFO -  ... FAIL
...
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-c, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps=
]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-=
deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
NOTE: recipe python3-3.14.3-r0: task do_package_qa: Succeeded

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3482
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3362
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3254

I know there is also a lot of errors that looks related to RPM in there,
these are probably because of another series.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


