Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E925B10AB810
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 19:47:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57550.1774554428289891048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 12:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NUezJ1f9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5786E1A300F
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 19:47:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23A4E601FA;
	Thu, 26 Mar 2026 19:47:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8A7510450D90;
	Thu, 26 Mar 2026 20:47:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774554425; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nrfYXcB3620A1j9ohiOtvgcYNHV+RJTy5Ed4SFLAmYE=;
	b=NUezJ1f9L7iFnsZTIpx17V0iNvsYMKqgeE3i+GOH+Kq+rU9TChqMJbq3t5R2wRqUftMX0v
	R5NWYBKveq4Ac34PrTCdy0q25zGDkcaHEcQpFN2x8Olm9Rc3VHwkYJZm2lyV+2/H65X3H7
	M7tWaRK8wtZ+QYmBa93TRDI9auiCgH/7s1QvD6J0hMyorn9rYfsnTm74ynlbaIwuhy6cZ/
	GvVjKuQhG+AUt7dwIS8rrN2UAuCK889kMyx/XL1VILQ6wYKapo6K7fC6Mjhff6d+M0D9/k
	g+E5lnPlljblXnn7lexPubhbccf3+vuZ77iZJ6C0iRULbgKH0l88Z3DEaaDIIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 20:47:03 +0100
Message-Id: <DHCZ1JWF0Z8D.20KQY5K4UV33I@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major
 release
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 19:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234046

On Thu Mar 26, 2026 at 4:16 PM CET, Khem Raj via lists.openembedded.org wro=
te:
> From: Khem Raj <raj.khem@gmail.com>
>
> Includes support for new Intel (Wildcat Lake, Nova Lake with APX and AVX1=
0.2)
> Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features performan=
ce
> optimizations for AMD Zen 4 and Zen 5 architectures.
>
> Integrated Distributed ThinLTO is more mature, with enhancements
> like cache support for incremental builds and robust handling of temporar=
y artifacts.
>
> LLDB added first-class WebAssembly debugging support, including breakpoin=
ts and variable inspection.
>
> Support for Google Native Client (NaCl) is dropped in this release.
>
> Detailed ChangeLog [1]
>
> [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for the new version.

I have to ask you: I'm having issues to apply this patch, and I already
had issues with the previous one. Are you aware of this?

Applying: clang/llvm: Upgrade to 22.x major release
error: patch failed: meta/recipes-devtools/clang/clang/0001-Install-lldb-tb=
lgen.patch:1
error: meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch: pa=
tch does not apply
error: patch failed: meta/recipes-devtools/clang/clang/0001-clang-Support-b=
uilding-native-tools-when-cross-compi.patch:1
error: meta/recipes-devtools/clang/clang/0001-clang-Support-building-native=
-tools-when-cross-compi.patch: patch does not apply
error: patch failed: meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-=
libunwind-headers-when-LIBCXXABI_LIBU.patch:18
error: meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-head=
ers-when-LIBCXXABI_LIBU.patch: patch does not apply
error: patch failed: meta/recipes-devtools/clang/clang/0003-compiler-rt-Sim=
plify-cross-compilation.-Don-t-use-na.patch:21
error: meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-co=
mpilation.-Don-t-use-na.patch: patch does not apply
error: patch failed: meta/recipes-devtools/clang/clang/0005-llvm-allow-env-=
override-of-exe-and-libdir-path.patch:19
error: meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-ex=
e-and-libdir-path.patch: patch does not apply
...

I had to hand apply part of the previous series. For this one I used:
git cherry-pick -s contrib/yoe/mut~7..contrib/yoe/mut
I believe this should be correct.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


