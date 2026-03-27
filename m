Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159CA10BA44F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:42:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68548.1774600913804459347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U/GJbZoY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1FCE11A3019
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E00F460230;
	Fri, 27 Mar 2026 08:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A022210450E0E;
	Fri, 27 Mar 2026 09:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774600911; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bZVqF/TpSsZE7UitDnvjmSUwPtn52qMqogpsP7Fp7Vk=;
	b=U/GJbZoYQb1fcM/lHSnQ5GthrSCvDKpiNt3g7k3OMNWSB4kqJWfZE4FB/ODVacoxWYqbCi
	TQayjbIzyE5mfFbQqa2BNNToHELEezXARsjJEvV/KPCOZRKrLCKEPJAntQ22d/hiprQB4B
	msoTP0+PoVp4tR1gFSW/9fzyqP9nqfP+/73KOtx3oj7IjOX77HKBEtjTNQ2YJINGmJPQEo
	U+Pipg4xssha7tCLXvJGJ1R8PlY/PXjkALuYtue7c6UUBs19aLyO6kXdPIlgat0owFqeFn
	jCol3c5D36nt17Tb6tpNB0p1uyMDU1qvoREKePvtnOXQ1L90fGbUSdxmQ1LHrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 09:41:50 +0100
Message-Id: <DHDFIRLFWLM2.MENHJ5825HET@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] vte: upgrade 0.82.2 -> 0.84.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260326190427.2198044-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260326190427.2198044-1-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234071

On Thu Mar 26, 2026 at 8:04 PM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Drop patch which is now merged in simdutf[1] v7.7.1 used by vte[2]
>
> [1] https://github.com/simdutf/simdutf/commit/c6f8e887ef51bb80dd978180042=
b9b9f4f46800f
> [1] https://gitlab.gnome.org/GNOME/vte/-/blob/0.84.0/subprojects/simdutf.=
wrap?ref_type=3Dtags
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for your patch.

It looks like we have some build issues, at least on ARM64:

ERROR: vte-0.84.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/=
genericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/temp/run.do_=
compile.515741' failed with exit code 1
...
| FAILED: [code=3D1] subprojects/simdutf/libsimdutf.a.p/meson-generated_.._=
simdutf.cpp.o
| aarch64-poky-linux-g++ -march=3Darmv8-a+crc -mbranch-protection=3Dstandar=
d -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-secu=
rity -Werror=3Dformat-security --sysroot=3D/srv/pokybuild/yocto-worker/gene=
ricarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/recipe-sysroot -=
Isubprojects/simdutf/libsimdutf.a.p -Isubprojects/simdutf -I../sources/vte-=
0.84.0/subprojects/simdutf -fvisibility=3Dhidden -fdiagnostics-color=3Dalwa=
ys -D_GLIBCXX_ASSERTIONS=3D1 -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu++23 -O2 -g=
 -fcanon-prefix-map -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/generic=
arm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/sources/vte-0.84.0=
=3D/usr/src/debug/vte/0.84.0 -ffile-prefix-map=3D/srv/pokybuild/yocto-worke=
r/genericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/build=3D/u=
sr/src/debug/vte/0.84.0 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/gen=
ericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/recipe-sysroot=
=3D -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/genericarm64/build/buil=
d/tmp/work/armv8a-poky-linux/vte/0.84.0/recipe-sysroot-native=3D -pipe -fvi=
sibility-inlines-hidden -fPIC -isystem../sources/vte-0.84.0/subprojects/sim=
dutf/include -Wno-undef -Wno-missing-declarations -MD -MQ subprojects/simdu=
tf/libsimdutf.a.p/meson-generated_.._simdutf.cpp.o -MF subprojects/simdutf/=
libsimdutf.a.p/meson-generated_.._simdutf.cpp.o.d -o subprojects/simdutf/li=
bsimdutf.a.p/meson-generated_.._simdutf.cpp.o -c subprojects/simdutf/simdut=
f.cpp
| subprojects/simdutf/simdutf.cpp:1819:2: error: expected ';' after class d=
efinition
|  1819 | } // namespace arm64
|       |  ^
|       |  ;
| subprojects/simdutf/simdutf.cpp:11490:52: error: definition of 'bool simd=
utf::implementation::supported_by_runtime_system() const' is not in namespa=
ce enclosing 'simdutf::implementation' [-fpermissive]
| 11490 | bool implementation::supported_by_runtime_system() const {
|       |                                                    ^~~~~
| subprojects/simdutf/simdutf.cpp:11531:21: error: 'implementation' in name=
space 'simdutf::simdutf::arm64' does not name a type
| 11531 | static const arm64::implementation *get_arm64_singleton() {
|       |                     ^~~~~~~~~~~~~~
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3465
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3489

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


