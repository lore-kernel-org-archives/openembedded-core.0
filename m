Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A593AC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 23:15:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.6157.1678403747599195986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 15:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JHlHDhii;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id p16so2291285wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678403746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sDCAO1lJhl0wyDnM6P4vpt1+rFjoru6vAKhe60jBDM=;
        b=JHlHDhiiDXPea8VH5UzDVTRIw2XOKiKUL9Sbyd2YW5CnZM1oFEB6EG6QqSxjb3J6jK
         mXSFvnTmsBIZhixpM2Sf37U5ud8xXiR5pachbBRvl/Zgct1YY7syHwL1+6/K4toIdCzU
         oDWeQaFn1JGIN+TcH2gjoNtXAOkWm6zlu/Kzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678403746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sDCAO1lJhl0wyDnM6P4vpt1+rFjoru6vAKhe60jBDM=;
        b=bG2b2xbZH0y96MvEJ0r0XVD6GzrSD/KLDSPYDq34yhWFdYaySPfMoE2X4vwWslyHgR
         X4uTFNb4GKBL9yPdiBzw9nJ+h3o7QMWOYG8WYqMvsZpoq7z+qDSAoTQ/aJ0g62S9SSLG
         HPXcKRU+PGEd/Mu4qFrpF1eq17eGtyv3qcYtXPlOJtk7OgGRXM5IcnsZJrRI1QbQ7jHD
         Dam00BFS70zRgAHEuF94ODavz2FK/2bXsR7xZ41alHtTLBlT2NoAGA7NKSoI1+uFhioc
         /b8ChGZxQuFOaWWGaHXlSYJlm7/lURzrNkVNOFhvgKZzUVnYiLdpAFPsaYpy1MIc7fIK
         nm9w==
X-Gm-Message-State: AO0yUKUpehRa6P2VNqJEvV2GKQ4HA+C9NrO1f4276pNxolP5WuOWdmUH
	ZpGjVO8kUXdgTT7mO7alL7wDmA==
X-Google-Smtp-Source: AK7set8pX6tEgWskjYEC5d2R8cdmbDJ/AmNhBLixhjCqKMUGwmugKCvFe13elveWNWRoyxek+GbVRg==
X-Received: by 2002:a05:600c:19d3:b0:3eb:3945:d3f9 with SMTP id u19-20020a05600c19d300b003eb3945d3f9mr888722wmq.4.1678403746065;
        Thu, 09 Mar 2023 15:15:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a9dd:6583:8973:50aa? ([2001:8b0:aba:5f3c:a9dd:6583:8973:50aa])
        by smtp.gmail.com with ESMTPSA id e23-20020a05600c219700b003dd1bd0b915sm1146059wme.22.2023.03.09.15.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 15:15:45 -0800 (PST)
Message-ID: <95c08f0a973b9adee2983ebfa51192f7b40a7806.camel@linuxfoundation.org>
Subject: Re: [OE-core][langdale 25/27] staging: Separate out different
 multiconfig manifests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Mar 2023 23:15:45 +0000
In-Reply-To: <08cf44a8c2f524edf1ed353bbf38ef31d9e810e1.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
	 <08cf44a8c2f524edf1ed353bbf38ef31d9e810e1.1678401759.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 23:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178302

On Thu, 2023-03-09 at 12:58 -1000, Steve Sakoman wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> """
> require conf/multilib.conf
> MACHINE =3D "qemuarm64"
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
>=20
> bitbake gcc-cross-canadian-arm
> """
>=20
> and then inspecting the lib32* manifest files under recipe-sysroot-native=
 shows
> them referencing lib32-recipe-sysroot instead of recipe-sysroot as used b=
y
> gcc-cross-canadian recipes.
>=20
> To fix this separate out the manifest by multilib. It is caching mechanis=
m to
> optimise disk usage so this doesn't break anything, just separated out so=
me files.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit 891d3faa3ed3d1cc231da58e5fa1325f05d5ade5)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes-global/staging.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
> index 5a1f43de78..e6d0d1d55c 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -275,6 +275,9 @@ python extend_recipe_sysroot() {
>      pn =3D d.getVar("PN")
>      stagingdir =3D d.getVar("STAGING_DIR")
>      sharedmanifests =3D d.getVar("COMPONENTS_DIR") + "/manifests"
> +    mlprefix =3D d.getVar("MLPREFIX")
> +    if mlprefix:
> +        sharedmanifests =3D sharedmanifests + "/" + mlprefix
>      recipesysroot =3D d.getVar("RECIPE_SYSROOT")
>      recipesysrootnative =3D d.getVar("RECIPE_SYSROOT_NATIVE")
> =20

The "real" fix merged today so this should probably wait to go with
that.

Cheers,

Richard

