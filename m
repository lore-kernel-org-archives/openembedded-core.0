Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3399C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 20:55:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.106.1654030496389448871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 13:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TYOXKBia;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x17so11157249wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 13:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=QRyFdmB7b8WOsgL1+E/Bwzbh30Y00Nc89dlWSVpRv0s=;
        b=TYOXKBiad0zG/2E5iy0eG3kBdmzc3C3xZpoqBEgugc4keFz98hN7STeJaBMzX2mHYx
         /BLRfq2JNqNNQj9P6mhO9Qhj/OV/2N9RqejAZmMZDP6QJKVJ3/edXoVg1BnR69XOy+X7
         WbvdCHKQozBBW0sLZcz9Ut7oknMDqu+mHZ75s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=QRyFdmB7b8WOsgL1+E/Bwzbh30Y00Nc89dlWSVpRv0s=;
        b=wrfOGdzKXf5bOrUUCrXPtP1KTYIAU3lO+nas5m2wm+OXy6FMTs+Oprcs5pLZx3dEsP
         T/eff/bB1RLfFx3gz2I59dxNbuqXJG3DL0/Dz62Lps923trWVzsf96SniuPJstSd+0l2
         9c1dcz3sz/941jhX75MMtk54C1RCspNj2wKjv3F5yj/ugGgpoI8xk779ED4P3HVk1cBQ
         rYkxPEmpcMJyfllHPxMt6EwwnvTUHg4/ER7KpVUmhX64wn9qLl2ygUMso6+MPY/0MsRe
         83IzSulRkj6j6zr4kjribjSpPVByqqM8subRwpIHjEmEzonDJQXxeifAXeN31/1k3fI/
         rkzg==
X-Gm-Message-State: AOAM532Pn6nU/fPxsyfs4oJ8EG4TfJKqWeTimwzGMoDZitGLGRi/fmS3
	OoeorObOfithXDmVZGnqRAbFdA==
X-Google-Smtp-Source: 
 ABdhPJz4g5EpScYVciDxePuMEMfNciwalolVpkcgVctRDUmOFGsXifanZDP9VS0nS4MkOKF3oktVvw==
X-Received: by 2002:adf:f706:0:b0:20e:6788:c2b6 with SMTP id
 r6-20020adff706000000b0020e6788c2b6mr50680606wrp.633.1654030494773;
        Tue, 31 May 2022 13:54:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef3f:2828:995f:4993?
 ([2001:8b0:aba:5f3c:ef3f:2828:995f:4993])
        by smtp.gmail.com with ESMTPSA id
 f28-20020a5d58fc000000b0020d098935dbsm12479749wrd.58.2022.05.31.13.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 13:54:54 -0700 (PDT)
Message-ID: 
 <ee7da03f7988fdfb22e800182644de692adfa59c.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 4/4] libsdl2: dont mix opengl and gles backends
 for wayland
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2022 21:54:53 +0100
In-Reply-To: <20220531190620.186764-4-f_l_k@t-online.de>
References: <20220531190620.186764-1-f_l_k@t-online.de>
	 <20220531190620.186764-4-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 20:55:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166333

On Tue, 2022-05-31 at 21:06 +0200, Markus Volk wrote:
> This fixes "Could not initialize egl display" in libsdl2 apps for
> wayland without DISTRO_FEATURE x11
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.22.bb
> index 8519e7f732..e057b5cbbc 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> @@ -56,14 +56,16 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -D=
SDL_ARTS=3DOFF \
> =20
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> -PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d=
)}"
> +PACKAGECONFIG_GL ?=3D " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', =
d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gles2', '=
', d)} \
> +"
> =20
>  PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
>  PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
>  PACKAGECONFIG ??=3D " \
>      ${PACKAGECONFIG_GL} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11'=
, d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
wayland', d)} \
>      ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
>  "
>  PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"

If you have opengl, x11 and wayland in DISTRO_FEATURES, does that cause
an issue? It would seem to change the config?

Cheers,

Richard

