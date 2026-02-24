Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DA0F3C9A0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:45:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23206.1771947905153764146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O8m3yJoc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71DD8C143E8;
	Tue, 24 Feb 2026 15:45:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 960335FD9D;
	Tue, 24 Feb 2026 15:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C83C210368F1B;
	Tue, 24 Feb 2026 16:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771947901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TzMqsus/BxvkZjj1kZZ0Z3bUdbLcpJsQUAtJUbqDspM=;
	b=O8m3yJocC3uDN6abVkPEK+0f58NDiVSbeOKIjDK6sCD17p4+74i9215E8coL5DR2No45EB
	fKix0POZgQ2s/fqD/6zxx1Y8kwY1Bpeh0W39iWQr4ssX3uV6kgjUxpDzIxf2c0UoY0eH6Y
	d6w9zTgtkIFPUSBsPENJZsDXdnipXgpusJUhriSRt6Axul0cEqS5knpvLrbvcWeOS2tOXU
	mLVtmSNeMoFg1BwOEkS/vKKWD1Xd/440QUmR+FW3BMfFrCs7XJiBiXQVXIYnbxkPWOeMKC
	823wO6dUE+Oit4hDsAWcq340X95WE4uiJVm/XTsyoioUGQU+yd3p/cdN75nsbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 16:44:58 +0100
Message-Id: <DGNB3UO240VX.2N0QPFPWP24JB@bootlin.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade from 25.3.3 to 25.3.6
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224030657.123463-1-changqing.li@windriver.com>
In-Reply-To: <20260224030657.123463-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231867

On Tue Feb 24, 2026 at 4:06 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> Release Note:
> https://docs.mesa3d.org/relnotes/25.3.6.html
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 1607fddd4b..dff1a66f7c 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -22,8 +22,8 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
>             file://0002-rocket-drop-file-names-from-the-generated-file.pa=
tch \
>  "
> =20
> -SRC_URI[sha256sum] =3D "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd=
3d4a8f45c535ef6b"
> -PV =3D "25.3.3"
> +SRC_URI[sha256sum] =3D "59217efeac3b64e7ced958324b9db7494f1e0741aeb22d78=
0276514cc1b8f206"
> +PV =3D "25.3.6"
> =20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> =20

Hi Changqing,

Thanks for your patch. I note there is already a message on the list
upgrading to 26.0.

https://lists.openembedded.org/g/openembedded-core/message/231117

Your patch might still be interesting if for any reason we decide not
to switch to 26.0, but I will not pick it in my branch right away.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


