Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25749D167FD
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:26:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7404.1767954356249425889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 02:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jG4ozTCs;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5AB7A4E4201C;
	Fri,  9 Jan 2026 10:25:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27A0260734;
	Fri,  9 Jan 2026 10:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 887D9103C8854;
	Fri,  9 Jan 2026 11:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767954353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yz6kEU/1i+Iz0fWDPq9hogpwImQIqF2RwkXLlfsahyA=;
	b=jG4ozTCsNYzbdbWPVFwhzOqnr0F4ZpOqE+66NXSeW852JkPy2oLEtgfsrOCNfHTVSzg5Cy
	EmeMbn6jq6FNn3odWtfBdHkZSJ1LYvTeRGNyAhIWkXtunpf4hH7PkFDAKRC7dOkDV3p3cn
	YyFxAbrGOTYo5zJNsxbitWKYHyLZOvzSF/MYSr+WaiFsaTh9KnxyWPaVVWfz7xuFcRysQx
	tY3i+3CIoh67y5ndaxXltK59l2keqPB3Z/19gnD405iG8fwuGWtDYyLYhepE/g3E0Rcp98
	EZkcPhMgG9IiU9hnU8tlvw0JRetQWmn1KPIEJp9U9rCTVawJJ+bFNFXxpU84HA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 11:25:51 +0100
Message-Id: <DFJZIGTTZE9I.AD2NHXSEB2TS@bootlin.com>
Subject: Re: [OE-Core][PATCH 1/2] rust: Install the Rust source
Cc: "Alistair Francis" <alistair.francis@wdc.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alistair23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260109045447.1933604-1-alistair.francis@wdc.com>
In-Reply-To: <20260109045447.1933604-1-alistair.francis@wdc.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 10:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229100

On Fri Jan 9, 2026 at 5:54 AM CET, Alistair Francis via lists.openembedded.=
org wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When building the Linux kernel with Rust support enabled the kernel
> expects to find the Rust source as the kernel build system will cross
> compile the core library.
>
> This patch uses the Rust tooling to install the Rust source when we
> install the compiller as well.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Hi Alistair,

Thanks for your patch.

It looks like the cargo patch does not apply correctly. Is this working
on your side on the master branch?

ERROR: cargo-native-1.92.0-r0 do_patch: Applying patch '/srv/pokybuild/yoct=
o-worker/genericx86-64/build/layers/openembedded-core/meta/recipes-devtools=
/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch=
' on target directory '/srv/pokybuild/yocto-worker/genericx86-64/build/buil=
d/tmp/work/x86_64-linux/cargo-native/1.92.0/sources/rustc-1.92.0-src/src/to=
ols/cargo'
...
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/x86_64-linux/cargo-native/1.92.0/recipe-sysroot-native/etc/qu=
iltrc push', 0, "stdout: Applying patch 0001-bootstrap-Ensure-host-document=
ation-is-built-before-.patch
can't find file to patch at input line 33
Perhaps you used the wrong -p or --strip option?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3012
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2980
...

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


