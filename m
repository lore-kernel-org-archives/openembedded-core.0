Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347FDC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 08:24:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.6385.1653035073870514613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 01:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sb0+CmBj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h14so10468149wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Pp9CxJY1PtQOa381DvShFdTzeFLat1Nq4jIv2BVjAos=;
        b=Sb0+CmBjjOjsB2gsHZrlSp6At9YuZYnOnFkuNKcrRQ9JK0bBaYy8TBGtY7lQxeg/wK
         YPFQOHK0UG3Tv84SDcjvCXVQT8B+kiFk/d+jKVl6MzZttPhITabpPjoJf05fcPy61xVl
         7vXzytKKjLr530btr0f8zpJH/JsyemIZv8e7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Pp9CxJY1PtQOa381DvShFdTzeFLat1Nq4jIv2BVjAos=;
        b=Ur2+qT9tK+qguqR6IIUgjWH6ujl4yR22wBVP/mRLDQEseoOofFc56J06g2cHkmNi9U
         40WK3XDDL8ysE8gNM5UCYltVSkoZze//Lgk9Qgn73fS1ztBXiP/qQhISDWnHG4hNWvlx
         Ci1xuufx7OdkK6HjHMQiiq6WbBJWVqFf3IDC5JyBHNOO1PuZK4AwoaCOR7VEFHtjVJYQ
         tCZL8RAbqunxVb2q2LFfNZ4Wyb4FauDaNxb+aYjYprU/lKhyUmBl0v0VN96zs12txl8+
         ZrHa5gwGH1iopuR+3Efu93XhnavNBBFrJQIiE4voZlc3j8qovtzmeY3XwHLxLUTAEMak
         K+kA==
X-Gm-Message-State: AOAM532/oTWpJQUuXLyyqCMwvEH7o1o1Zju2hhNwsZTyvCxY9guMW9s2
	HgU10ETkobvgtCJXOjxcGeqiFA==
X-Google-Smtp-Source: 
 ABdhPJyOsAM5zK2/aupr7n770reUUCfziA4/msLPb3iFVf9DbqteYq4cVHpkF8BQ6NzyYqVGNw4Ecw==
X-Received: by 2002:adf:f550:0:b0:20e:69df:5f05 with SMTP id
 j16-20020adff550000000b0020e69df5f05mr5739006wrp.194.1653035072315;
        Fri, 20 May 2022 01:24:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3966:e4e8:2da7:ee66?
 ([2001:8b0:aba:5f3c:3966:e4e8:2da7:ee66])
        by smtp.gmail.com with ESMTPSA id
 v10-20020adf8b4a000000b0020ce1c1cf31sm1937801wra.21.2022.05.20.01.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 01:24:31 -0700 (PDT)
Message-ID: 
 <5ba8ced312bd0426cdec907f0172834f0823b59f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 1/3] eudev: Convert dependencies to
 PACKAGECONFIG
From: richard.purdie@linuxfoundation.org
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Date: Fri, 20 May 2022 09:24:31 +0100
In-Reply-To: <20220516194915.29231-1-alex.kiernan@gmail.com>
References: <20220516194915.29231-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 08:24:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165919

On Mon, 2022-05-16 at 20:49 +0100, Alex Kiernan wrote:
> GObject support was dropped in 252150e181c5 ("src/gudev: remove Gobject
> libudev support."), but some gir support appears to still exist.
>=20
> Fill out PACKAGECONFIG options.
>=20
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/recipes-core/udev/eudev_3.2.11.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/u=
dev/eudev_3.2.11.bb
> index 841039f6d745..0fd1b6ab2283 100644
> --- a/meta/recipes-core/udev/eudev_3.2.11.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LICENSE:libudev =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> =20
> -DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native kmod util-linux"
> +DEPENDS =3D "gperf-native"
> =20
>  PROVIDES =3D "udev"
> =20
> @@ -19,7 +19,7 @@ SRC_URI[sha256sum] =3D "19847cafec67897da855fde56f9dc7d=
92e21c50e450aa79068a7e704ed
>  UPSTREAM_CHECK_URI =3D "https://github.com/eudev-project/eudev/releases"
>  UPSTREAM_CHECK_REGEX =3D "eudev-(?P<pver>\d+(\.\d+)+)\.tar"
> =20
> -inherit autotools update-rc.d qemu pkgconfig features_check manpages
> +inherit autotools update-rc.d qemu pkgconfig features_check manpages gob=
ject-introspection

I like most of what this patch does, cleaning up this kind of thing is
great. I am a bit worried about the gobject-introspection inherit
though as this wasn't there before and brings with it a huge dependency
tree. For something as "core" as udev that is rather sad. Do we really
need it? Should we find a way to disable it by default?

Cheers,

Richard=20


