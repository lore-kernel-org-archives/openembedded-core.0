Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E188E98E0B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 09:02:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31742.1771837323384512659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 01:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kFWzSMnz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A52F1A116B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:02:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 009B45FD43;
	Mon, 23 Feb 2026 09:02:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16EAE10368F2B;
	Mon, 23 Feb 2026 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771837305; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bSBOCsOTCHEtt+J3h9Eafm+oCAeKZj02EyB+K6gEQjU=;
	b=kFWzSMnzIqpsjk8XiNJH2aAQp4sz5lCa/iUbAdJf73cPEhzX7whaZEspf4Zu5gRRbCw760
	VIl1D813KkSwrvQX+2U2zSn69UcvFAIwZ3CTdvmF88XjzqK9XjiS349SKNWJ2YASGaY2Fw
	ShziYe9Bhet2VuO2i7T+Twheal48CfOMuXRJmKLbYfj2/eBojOfvINmSJdMXwp0wlRNdkb
	S4cHrO5EBLnV0miIwaaNK+0eDFkzftYOq8I6SCmpabGoAGv+gAY9jS0+1tk0GuAr+lHVUM
	Lss1WRSq/GEINH/gNrb6JKPNPTEFTo2cTqBuIckVp5la/JDFkQdeZXAjmX5pfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 10:01:44 +0100
Message-Id: <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260127053941.792825-1-raj.khem@gmail.com>
In-Reply-To: <20260127053941.792825-1-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231659

On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via lists.openembedded.org wro=
te:
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

Hi Khem,

I have some build issue with this patch. Yet I had some merge
conflicts, so maybe my resolutions were not correct.

ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv/pokyb=
uild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-pokys=
dk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864' failed w=
ith exit code 1
...
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/gcc=
-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: initial=
ization discards 'const' qualifier from pointer target type [-Werror=3Ddisc=
arded-qualifiers]
|   330 |               char *q =3D strchr (p + 1, '}');
|       |                         ^~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3240
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3229

The branch that was tested if you want to check: https://git.yoctoproject.o=
rg/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie/a-=
full-3260

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


