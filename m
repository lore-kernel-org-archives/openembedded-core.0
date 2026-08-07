Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3C5C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:02:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36092.1786078960465241389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hLboOzmp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D8701A1490;
	Fri,  7 Aug 2026 05:02:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6F4B603F0;
	Fri,  7 Aug 2026 05:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16ADE11C37128;
	Fri,  7 Aug 2026 07:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786078953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NlI6j9F8Kzb1iirEzMRlsozSxIBBQGKvFaakyhQU9Ws=;
	b=hLboOzmpzu4xxMFPvk3EFTN6xU9GC3S6uCe1GBgyWqiFHNgk4+Z6NsvEHPutL9dwUgPAz0
	M4hnPZHvJ5e26C1S30A7HlsHqij4p98nAGVtEN029B9F3b1RgQsRNxqS+rojJR9D1/I0/O
	qm49aIKaXMvzls64eIKnbSh8OAa7SAkGoAkK7moHU8rCoRUJ/R54slbOJ0LXxdihj3+MM8
	aU2zDx9p0cwF7aKw7p/IiiWxy8eD5wqQmNizHGH+yCCpmpTxV23TNENQ6tVerFosICK7Yy
	CJKIWhgPQwVdXC21t9/882IhbepS5FD+JvrqnKnimaR4vWpU3odEdCGM2Xx1rQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 07:02:31 +0200
Message-Id: <DKIG5B0QYAB7.15MM1X6A47OUK@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/3] mesa: Upgrade to 26.2.0
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260806051437.276400-1-zboszor@gmail.com>
In-Reply-To: <20260806051437.276400-1-zboszor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242975

On Thu Aug 6, 2026 at 7:14 AM CEST, Zoltan Boszormenyi via lists.openembedd=
ed.org wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html
>
> Removed upstream 0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
> Adapted 0001-freedreno-don-t-encode-build-path-into-binaries.patch
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

I believe you need to remove or refresh another patch:

ERROR: mesa-2_26.2.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-work=
er/genericx86-64/build/layers/openembedded-core/meta/recipes-graphics/mesa/=
files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch' on t=
arget directory '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/core2-64-poky-linux/mesa/26.2.0/sources/mesa-26.2.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/core2-64-poky-linux/mesa/26.2.0/recipe-sysroot-native/etc/qui=
ltrc push', 1, 'stdout: Applying patch 0001-src-intel-compiler-jay-jay_ir.h=
-do-not-used-typed-en.patch
patching file src/intel/compiler/jay/jay_ir.h

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4342

This happens in virtually all configurations. Can you have a look at the
issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


