Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32F1C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:24:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7207.1787729079630772283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EGhdYfgl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 63A621A183A;
	Wed, 26 Aug 2026 07:24:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 383A7604EC;
	Wed, 26 Aug 2026 07:24:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18B3D11C7ABF1;
	Wed, 26 Aug 2026 09:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787729072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/E3SXr5l30ZNyatPfC90eKjLXjKx5jVtHnxu8ldtKTs=;
	b=EGhdYfglXn+h1HjUHUwn4IUlYwXT4mQ1vnJXa6fX/9KHoQY53dfRsDxI82WDkNSRlrHYnE
	3AstCF9Q80l9dBd7R6zlzqA3IVNQj4G3uzASl2jp4GHJCTDZpyTuAe5bXwDnc6Wj5/Fqja
	KTmdcKXhFpRhRbYDImnMwJ8GS3K0PI73I2pt61kwLA/4iINwlCvJ9mxaFWw7bICRYoVpwQ
	gGm1GDbC/OzgpmYNDyVBZAnr71R0tdnPvOicSwJY1NTT0Hr/C4qE+nmvRfsoXqUmpfr61J
	Q0WxqLJphQoclHEp8q0Bnsy1VuGzMx89wuCg3LnbyybhZ95Dp0yNIvXiBjs6hw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 09:24:30 +0200
Message-Id: <DKYP2D1JF8SZ.1PCEIIP9XWDCU@bootlin.com>
To: <anis.bougrine10@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v5 5/5] documentation.conf: add documentation
 for KERNEL_MODULE_INSTALL_PREFIX variable
Cc: <mathieu.dubois-briand@bootlin.com>,
 <richard.purdie@linuxfoundation.org>, <peter.kjellerstedt@axis.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
 <20260825204931.17628-6-anis.bougrine10@gmail.com>
In-Reply-To: <20260825204931.17628-6-anis.bougrine10@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244316

On Tue Aug 25, 2026 at 10:49 PM CEST, Anis Bougrine via lists.openembedded.=
org wrote:
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> ---
>  meta/conf/documentation.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 72513296e2..05945b9702 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -282,6 +282,7 @@ MAINTAINER[doc] =3D "The email address of the distrib=
ution maintainer."
>  MIRRORS[doc] =3D "Specifies additional paths from which the OpenEmbedded=
 build system gets source code."
>  MLPREFIX[doc] =3D "Specifies a prefix has been added to PN to create a s=
pecial version of a recipe or package, such as a Multilib version."
>  MODULE_TARBALL_DEPLOY[doc] =3D "Controls creation of the modules-*.tgz f=
ile. Set this variable to "0" to disable creation of this file, which conta=
ins all of the kernel modules resulting from a kernel build."
> +KERNEL_MODULE_INSTALL_PREFIX[doc] =3D "When a recipe inherits the module=
 class, this variable specifies the directory to which kernel modules are i=
nstalled on target."

You forgot to alphabetically order this new variable, I think

Antonin

