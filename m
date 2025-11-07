Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA12CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 07:26:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6317.1762500404113948587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 23:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O8vQJpx6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0E774E4158D;
	Fri,  7 Nov 2025 07:26:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE5AE6070B;
	Fri,  7 Nov 2025 07:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC10F11851725;
	Fri,  7 Nov 2025 08:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762500401; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=83KHSeTY4mSQ0ttjHxzeVuo+pDJFgWJW5uXSuZxKtjE=;
	b=O8vQJpx6BLNJ3fttdoO5SdYm/ZT9IDSvlz+iGw9cUowh449WAwDk7yo39YiR5yDOrAJ5Cq
	7HBYtXIt0PJ+jHx51H2bOFspWCe5/BhrDIeH4eyqj1LrnEbiPrL+3TPQLmcEIVaVBte6Fb
	6nAQwKgPCnorxGunN3t9WxdrQejoPwjvHrIJq+zZCXstwRbbXxCmN3cz4E7bj2GNzC9OOY
	e5l7RK48m4fGHcYd8cjxvQbJSbglfsCQ5EhV/u1gIoV+lYokQ2iqmJnGtvpwXqun/xT43S
	jCfdJjAcgV3PIsZjc3/vBAUeolLoELJEJtqifRdTd3usFCy81Qy03PftVEga9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 08:26:36 +0100
Message-Id: <DE2A8WAMFQ8I.33H1IHF8RV2DJ@bootlin.com>
Subject: Re: [PATCH v4] libxml2: upgrade 2.14.6 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Hongxu Jia" <hongxu.jia@windriver.com>,
 <openembedded-core@lists.openembedded.org>, <skandigraun@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251105023236.310076-1-hongxu.jia@windriver.com>
In-Reply-To: <20251105023236.310076-1-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226016

On Wed Nov 5, 2025 at 3:32 AM CET, Hongxu Jia wrote:
> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>
> Due to upstream [disable python bindings by default][2] and are
> planned to be removed in the 2.16 release[3][4]. If we still enable
> python bindings by --with-python=3Dyes, due to upstream [doc: Build docs
> with Doxygen and xsltproc][5], build python binding requires doxygen
> otherwise build will fail, and we do not provide doxygen in oe-core,
> so remove python package directly.
>
> Refresh install-tests.patch and run-ptest to not install python test
> cases
>
> Drop CVE-2025-6021.patch which is obsolete
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf=
123eb7358690c214b0b
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7=
b98c8a12e6b2a6ae542
> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff=
3e6eef6dec2376317e2
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Thanks for the new version.

It's not clear to me how, but it looks like this update is breaking rust
build:

ERROR: rust-1.90.0-r0 do_test_compile: Execution of '/srv/pokybuild/yocto-w=
orker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rus=
t/1.90.0/temp/run.do_test_compile.3947248' failed with exit code 1
...

alues("optimized-c"))' --check-cfg 'cfg(__aarch64_swp8_rel, values("optimiz=
ed-c"))' --check-cfg 'cfg(__aarch64_swp8_acq_rel, values("optimized-c"))' -=
-check-cfg 'cfg(target_feature, values("vis3"))' --check-cfg 'cfg(feature, =
values("checked"))' --check-cfg 'cfg(assert_no_panic)' --check-cfg 'cfg(thu=
mb)' --check-cfg 'cfg(thumb_1)' --check-cfg 'cfg(f16_enabled)' --check-cfg =
'cfg(f128_enabled)' --check-cfg 'cfg(intrinsics_enabled)' --check-cfg 'cfg(=
arch_enabled)' --check-cfg 'cfg(optimizations_enabled)' --check-cfg 'cfg(fe=
ature, values("unstable-public-internals"))' --check-cfg 'cfg(optimizations=
_enabled)' --check-cfg 'cfg(x86_no_sse)' --check-cfg 'cfg(kernel_user_helpe=
rs)' --check-cfg 'cfg(feature, values("mem-unaligned"))'`
| error: rustc interrupted by SIGSEGV, printing backtrace
|
| /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/=
cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-unkn=
own-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0xd2ab55) [0x=
7f3ae2d2ab55]
| /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/sysro=
ots-uninative/x86_64-linux/lib/libc.so.6(+0x3bba0) [0x7f3ae1e4aba0]
| /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/=
cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-unkn=
own-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0x8527820) [0=
x7f3aea527820]
|
| note: we would appreciate a report at https://github.com/rust-lang/rust
| help: you can increase rustc's stack size by setting RUST_MIN_STACK=3D167=
77216
| rustc exited with signal: 11 (SIGSEGV)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2610
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/672
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/2613

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


