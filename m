Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157E0EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 17:04:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1394.1689181491296037902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 10:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=U3Bvw+RE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so77517605e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689181489; x=1691773489;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UOcl6d16vPU1kNVdeoOx32RseiLEqd85COUwC+XDHEY=;
        b=U3Bvw+REN2Ag/8umOlcEcynSUr5ZTLhkyASRkurWYFsM9GHmDWat57H6tpIxmfd1e7
         DBafmem3kHmSROqdKPc0xd/sq835ZWXdHIxsYfTWX60Vg/X/R75icrcUNYOswuLZX4Z0
         jMVRk6VzeezuQW9J/SL1HdKEY6zIGOeAdQOKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689181489; x=1691773489;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOcl6d16vPU1kNVdeoOx32RseiLEqd85COUwC+XDHEY=;
        b=MKoOE1UvtUUz8MCB+1vCF8CPPi4x4R+DQTw9651XUCHsOXbzqna7yuWqeOpwehul5M
         qowPirq8RLOsDMPSju7lP5YDwj1YBIroYoxHFH1Y2hnh5BWhnRTNt5fQlT47OEBHjMhK
         gNHXFVQ8HJD4mia9HhsvJ32YUj3DmL/kZY/2mDTg0ONdrAFl9XNWGwYYGzlCcxS8fzz+
         cYAa4l5QfuCFLvaPW+Pp4ko1OJmesmIw/W8cgJH4XfpKAIclDoUXJgnKBiyEbh4un7dr
         7I+GGqvd4TxCdshu1ddD3soG+iXXhNrvqtVGe0zuHQyvsVpmAmobTBm5cgEEWAit3YiY
         MjpA==
X-Gm-Message-State: ABy/qLaiaqiSXCtqcBSVAn9ulihMmOo0fblXIvxegzUpjluui3qFg6MB
	nkr1cObniKXsaUMRiHPFpDeTvA==
X-Google-Smtp-Source: APBJJlFCQEViLBO9HP1MwH3Jm9BamFrfQdNFJfmuNAh4ajUnMy9i7pyoc3L3CrReSdJ+WFjzCn5T2Q==
X-Received: by 2002:a1c:7712:0:b0:3fa:71db:56ff with SMTP id t18-20020a1c7712000000b003fa71db56ffmr19685884wmi.40.1689181489435;
        Wed, 12 Jul 2023 10:04:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003fbfa6066acsm5579820wmi.40.2023.07.12.10.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 10:04:40 -0700 (PDT)
Message-ID: <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jul 2023 18:04:39 +0100
In-Reply-To: <20230712122558.711029-1-p.lobacz@welotec.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 17:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184208

On Wed, 2023-07-12 at 14:25 +0200, Piotr =C5=81obacz wrote:
> Include support for ACLs and extended file attributes for native
> builds, depending on which distro target features has been turned
> on.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/conf/bitbake.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..20684a5126 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,12 +904,12 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> =20
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6"
>  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> =20
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl =
wayland"
> +DISTRO_FEATURES_FILTER_NATIVE ?=3D "acl api-documentation debuginfod ope=
ngl wayland xattr"
>  DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod open=
gl wayland"
> =20
>  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-=
data ldconfig"

Just to be clear, I know what Alex said but after further thought, acl
needs to move into DISTRO_FEATURES_NATIVE in my opinion (and Ross'
too).

I suspect Alex will agree with that too after thinking about the
arguments I put forward about simplifying sstate reuse.

Cheers,

Richard

