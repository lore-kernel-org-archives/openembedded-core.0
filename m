Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECFEC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 19:14:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.46106.1656357270742602321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 12:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MCfj3rvt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so1304213wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=WtmwTG3tAtUHc2TN9j6Zub20wIV7Wicpiw63lYMKm0Y=;
        b=MCfj3rvtCVSvbzgsg7V2XO9B32Fq6kbaSgt+S4NPSYLdnD7xxWtcIngU8Sik6mXG89
         ng3tCcDRXvbZv2XHq60ts3si4bmQjM2EjqsKyTjvXHsAGyfryOTX34ikgrtgmXdSUjkz
         b480kBDBOUEJux1DtlK/IrliYzEVxWQxVnlOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=WtmwTG3tAtUHc2TN9j6Zub20wIV7Wicpiw63lYMKm0Y=;
        b=EqUAiilaNqBZz8l7Cb6nAH8v/Ut6GfXNttHm9UnXicASVi/QR+QBu3ei+c6S+3CWpr
         Lmcr6XgOew5IYTE7epn19s68k+Kcw2PpJpCoUr1h6k80o9MD/0JgCE5siIFtS8xVs+oY
         StHKTI8XRhf9vcq1Y0o3gUhVmji6FlT7D8HeM/6I2KbmMzhhBZY+UqzwYFSo9KKjB9sp
         tq5Y6RwFM3ankquY0CTXunfCnHKAibwylmqfhEuBkvOt+h1ys3KHLIJZvUr3/rYkFqau
         Xd8g28ee9fKIQQ29puihfix+4PvPPYuzZxX96lapTZq7vSLfQ5gqYR3QFW8pxXHxbWHp
         1E9g==
X-Gm-Message-State: AJIora+tCY6ahZy3azf3RQMP0+WSHUQLF9/OjTU0jcWxAILDfxjh4mhz
	MWnfI+exl6WcEyvQvgQUuBiirbc4Tw/sHQ==
X-Google-Smtp-Source: 
 AGRyM1tzHvVI1NHRwnvGKsuf4bxKgc053Ji13O1vKa+oTOeo/7ns61PCei9ZQCSyWijCPNNaJ1TRMA==
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr17119879wmp.38.1656357268572;
        Mon, 27 Jun 2022 12:14:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1624:49b4:7dc4:c660?
 ([2001:8b0:aba:5f3c:1624:49b4:7dc4:c660])
        by smtp.gmail.com with ESMTPSA id
 q12-20020a5d61cc000000b0021cf31e1f7csm3331772wrv.102.2022.06.27.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:14:27 -0700 (PDT)
Message-ID: 
 <7bdfec55599094a196f35ce4e84e651b8179d120.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Date: Mon, 27 Jun 2022 20:14:26 +0100
In-Reply-To: <16FB9273F36F7F78.24408@lists.openembedded.org>
References: <16FB9273F36F7F78.24408@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 19:14:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167330

On Fri, 2022-06-24 at 14:45 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Seems sad to have to do this but openssh is moving to use sftp instead
> of scp to move files. This means scp from Fedora 36 will no longer be
> able to move files to/from a dropbear based image. This breaks a number
> of our key QA tests and I suspect will cause users pain too.
>=20
> The sftp server from openssh is small and standalone so adding it to
> the packagegroup seems to be the best way to preserve user sanity. If
> people really don't want it, they can just use dropbear instead of the
> packageground.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../packagegroups/packagegroup-core-ssh-dropbear.bb             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbe=
ar.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> index 4f844ad9255..b969ab7ca01 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> @@ -3,4 +3,4 @@ PR =3D "r1"
> =20
>  inherit packagegroup
> =20
> -RDEPENDS:${PN} =3D "dropbear"
> +RDEPENDS:${PN} =3D "dropbear openssh-sftp-server"


If we want kirkstone or dunfell to work on Fedora 36 we're going to
need this. Unfortunately it will break images with -dev packages in
them.

The fixes for master for that are not appropriate for
kirkstone/dunfell, they're quite invasive for master.

As such you may need to disable the -dev package dependencies for
dropbear/openssh, something like:

RDEPENDS:openssh-dev[nodeprrecs] =3D "1"
RDEPENDS:dropbear-dev[nodeprrecs] =3D "1"

in the appropriate places. I mention this now whilst I remember the
context!

Cheers,

Richard




