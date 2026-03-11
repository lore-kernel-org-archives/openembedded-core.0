Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95C81125820
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:43:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21273.1773236590146427196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XqvWK70I;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C8951A2D3B;
	Wed, 11 Mar 2026 13:43:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D455260004;
	Wed, 11 Mar 2026 13:43:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C16C10369994;
	Wed, 11 Mar 2026 14:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773236587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BsLD7YF3ZuTwyFdydUkqYAd3tXWtUvNV+Wc7+ZDEB5A=;
	b=XqvWK70IuqY2q+DSpmzJ/7Xxh2vsgLEXGwijKalVTpiTAyMvJyJBO+6RrKBNPUlSp5Ji0w
	92zc94yRm6KT+ZJsh1rPjN+b2UHdlau9G9OpQcqoRjnOx6r/g/lJuWYF7fKnzzRigfTqA9
	8jCiwEb0k4R+gXf6q3A8zO/QW4Pf+K8wEwY0YTeXM2zB1PP9U3PbEkzl/towd/qMPghUnG
	JzMq6ow/TZx9hkACjwaVnk3TT/Ctj6c11O+aasCfpVdvArKStXwpNUhCd//l0kOKzT4ckR
	Irq9j6WO0yqZZtipeG+kphGqpluULgP0+f47rAqe1+eEefXSRku4TUdBlzVfYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:43:05 +0100
Message-Id: <DGZZWPDHTXLA.21EF97RXLFL6F@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/6] glibc: Upgrade to 2.43 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Randy.MacLeod@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232884

On Tue Mar 10, 2026 at 6:43 PM CET, Hemanth Kumar M D via lists.openembedde=
d.org wrote:
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
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---

Hi Hemanth,

Thanks for the new version. It looks better, but we still have at least
one ptest issue:

Failed ptests:
{'glib-2.0': ['glib/gdatetime.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1216
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3225
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3252

Test logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260311-60/testresults/qemuriscv=
64-ptest/core-image-ptest-glib-2.0/
https://valkyrie.yocto.io/pub/non-release/20260311-60/testresults/qemuarm64=
-ptest/core-image-ptest-glib-2.0/
https://valkyrie.yocto.io/pub/non-release/20260311-60/testresults/qemux86-6=
4-ptest/core-image-ptest-glib-2.0/

We also have this busybox ptest failure, only on arm64. I suspect it is
related to this series, but I will launch a build to confirm.

Failed ptests:
{'busybox': ['printf_understands_%s_\'"x\'_"\'y"_"\'zTAIL"',
             'printf_handles_positive_numbers_for_%f']}

https://valkyrie.yocto.io/pub/non-release/20260311-60/testresults/qemuarm64=
-ptest/core-image-ptest-busybox/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


