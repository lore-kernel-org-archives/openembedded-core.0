Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A78C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 20:14:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.82743.1680552868798609644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 13:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TWWzDd53;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso18809344wmo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680552867;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNXstjIwAvtLsvdPEaSBrdbduXOABpmyK5UE4xiCYrQ=;
        b=TWWzDd53C22cxACiSRbmKQtzRT//ZsVncI0M/F6NsqA5Q9PiUoG+YamC8rTzcJzrvC
         aN9tBBh7pCYozNOho1VCVuPgFxrkiwYEuIfId0DpjzZwyf4DW6zH8TwHyarbwIsuXRrb
         DF6ncOOTMTV/GyXBOK+D6lDDn01TwtpHj8B6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680552867;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JNXstjIwAvtLsvdPEaSBrdbduXOABpmyK5UE4xiCYrQ=;
        b=rpS+v7WKy/xhIt24/rPcgfKf/GDFlgn8EmMoiaOrR7/UgnF2S21CpQiUNHdka1pbFe
         jDvJRES6YgMIN3rLT+SXv2M4aHh+mhxn8mInCD73AxWo+RXq4daKpL3D2u2sdxvq8DDk
         NwjJLtLIgU1dQ+1ZQSOkv4Ed35QIJTIzUAa/PHYZ4cSsxWddMZXjULPN2mRy8u+/IH4M
         2olLxujbY/VvJoID3l/CJ/2zMg2aCVCGxdMeLFZL93uRO9DfxxjhNRr/g5b33hKfGJ/b
         mkCp+3qiXrMglIqNPWbgqMP5vN1Fr/cxW5j3DIibBFOa4ObQ9b4byO6/XJV/WJAAWiRr
         YFPQ==
X-Gm-Message-State: AAQBX9dtZUANl8Mv+0NCLYTvmVBrgMWBSNfY0+yQPo0wSAVzgQEzlV/W
	vs8a2nxgdBUgLK3poyWHruv0wA==
X-Google-Smtp-Source: AKy350ZgKHf+e97iFb6bCKzNIfDO13NfjJjrHIW+F9cxLw53ZejefOWJ5MbkwdEH/+qW++0aIzSooA==
X-Received: by 2002:a05:600c:3658:b0:3ef:4138:9eef with SMTP id y24-20020a05600c365800b003ef41389eefmr436379wmq.36.1680552867033;
        Mon, 03 Apr 2023 13:14:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff0f:d6ee:8211:76e0? ([2001:8b0:aba:5f3c:ff0f:d6ee:8211:76e0])
        by smtp.gmail.com with ESMTPSA id m26-20020a05600c3b1a00b003ede2c4701dsm20305771wms.14.2023.04.03.13.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:14:26 -0700 (PDT)
Message-ID: <974f5837cdf9f57176e1af6d02c49a5b2cb03db1.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 01/10] gobject-introspection: reduce
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Apr 2023 21:14:25 +0100
In-Reply-To: <20230331114634.3578244-1-kubiznak@2n.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 20:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179653

On Fri, 2023-03-31 at 13:46 +0200, Petr Kubiz=C5=88=C3=A1k wrote:
> When GI_DATA_ENABLED is 'False' (e.g. because
> 'gobject-introspection-data' is not in DISTRO_FEATURES),
> gobject-introspection, gobject-introspection-native and qemu-native
> should not be added to DEPENDS. This is to reduce dependency chain
> when g-i is disabled.
>=20
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/cla=
sses-recipe/gobject-introspection.bbclass
> index 0c7b7d200a..98edb93761 100644
> --- a/meta/classes-recipe/gobject-introspection.bbclass
> +++ b/meta/classes-recipe/gobject-introspection.bbclass
> @@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['', '${G=
IRMESONBUILD}'][d.getVar('G
> =20
>  # Generating introspection data depends on a combination of native and t=
arget
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS:append:class-target =3D " gobject-introspection gobject-introspe=
ction-native qemu-native"
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'gobject-introspection gobject-introspection-native qemu-native',=
 '', d)}"
> =20
>  # Even though introspection is disabled on -native, gobject-introspectio=
n package is still
>  # needed for m4 macros.
> @@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk =3D " gobject-introspe=
ction-native"
>  export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
> =20
>  do_configure:prepend:class-target () {
> -    # introspection.m4 pre-packaged with upstream tarballs does not yet
> -    # have our fixes
> -    mkdir -p ${S}/m4
> -    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}"=
 =3D "1" ] ; then
> +        # introspection.m4 pre-packaged with upstream tarballs does not =
yet
> +        # have our fixes
> +        mkdir -p ${S}/m4
> +        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S=
}/m4
> +    fi
>  }

Automated testing picked up this issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/6802

which looks like a missing glib2.0-native dependency for vte?

Cheers,

Richard

