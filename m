Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07073EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 14:07:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9149.1688047666143489515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 07:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=PHw+H+nQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3141c8a6f30so424383f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688047664; x=1690639664;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Yudwncr7amrqcP1e3YPI7DN+I83YFIr4TxegfRlIJI=;
        b=PHw+H+nQR/S9wg84t6AOMGUCENtEgfQ+r5iSEHJb/DhJ6yoYxB3AYwCb5RuvuUl++B
         SyxhPENKWA8nHMnaovBrrytI8W6N8BGpnY2G8wxJ0+kZPTk138n6AH9k/w9VKlKhQy3E
         R0D2eiVkGXFXxrdFJjYHSd/KPiNuQfGd04KGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688047664; x=1690639664;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Yudwncr7amrqcP1e3YPI7DN+I83YFIr4TxegfRlIJI=;
        b=Dfje2keZGQD5efEY+eVx+m1B7sBLIcn6RIynVrn5wnh42HLZc1ZmUGfEfIho1pRsXy
         rLZRwgZeaNiBKQIehJPOirFmjdSK7WejfrIaAXojiJ3Xs9IXX8XchPTJEFzIuDD+Vgr7
         6mHiC/GBskcYGDlAJrRGILD6RbXQexTH4SAykp/qobsNEb4pMtA31sZ6A+7Ea2Q9f3SD
         cJktBmK5O3HPkAs5tkrXobG28A0t+QQ6L2PXimx+RoVVqrVbdGNIFyugRlgUizemUOLv
         7IKOWAHeTMU2YsOR+CKBW67Fu8ZIZqbSJqSvYOfqJOl5uj9KG2bgjhEMTkSTp9KSRV99
         8+gQ==
X-Gm-Message-State: ABy/qLZD/OgVlBGoXDCVdpN1bDIZU+Agi3joKdW8vhOgL3XuJLS3WKvL
	jZGu2HOatrF82gULuMj+2tWpjA==
X-Google-Smtp-Source: APBJJlFsrBTaluz/mn2b6CCQVw/cTX9m6Tz4vW7T4o0/ajV+/sBmRbdllAdPhNhxaMo80s3ZftKoQA==
X-Received: by 2002:a5d:6446:0:b0:314:1494:fe28 with SMTP id d6-20020a5d6446000000b003141494fe28mr1952862wrw.53.1688047664274;
        Thu, 29 Jun 2023 07:07:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id u12-20020adfdd4c000000b0030903d44dbcsm16014887wrm.33.2023.06.29.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:07:43 -0700 (PDT)
Message-ID: <36bd8483782bbbdf9a24c3f5fe9f1ccabf25554f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] uninative-tarball.xz -
 reproducibility fix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Berger <oecore.mailinglist@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Date: Thu, 29 Jun 2023 15:07:43 +0100
In-Reply-To: <20230629140258.5635-1-Robert.Berger@ReliableEmbeddedSystems.com>
References: 
	<20230629140258.5635-1-Robert.Berger@ReliableEmbeddedSystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 14:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183630

On Thu, 2023-06-29 at 16:02 +0200, Robert Berger wrote:
> added --clamp-mtime --mtime to the tar command
>=20
> see:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15148
>=20
> Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
> ---
>  meta/classes-recipe/populate_sdk_base.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b23ea26d40..c804e7520a 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -86,7 +86,7 @@ python () {
>         d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r =
${SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TY=
PE} .')
>      else:
>         d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
> -       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${S=
DKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUT=
PUTNAME}.${SDK_ARCHIVE_TYPE}')
> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${S=
DKTAROPTS} ${SDKTAROPTS_ADDON} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOY=
DIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>  }
> =20
>  SDK_RDEPENDS =3D "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
> @@ -286,6 +286,7 @@ python check_sdk_sysroots() {
>  }
> =20
>  SDKTAROPTS =3D "--owner=3Droot --group=3Droot"
> +SDKTAROPTS_ADDON ?=3D "--clamp-mtime --mtime=3D@${SOURCE_DATE_EPOCH}"
> =20

Thanks, looks good. I did wonder if we could just put this in
SDKTAROPTS though? Do we really need to add a new variable?

Cheers,

Richard


