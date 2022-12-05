Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEF5C63704
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 22:30:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.30881.1670279441904248382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 14:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/ZPB19O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id f18so20997716wrj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bndM8/ewanrubJ2IhCtuXduKJTWvrDwwopmuB7et4RY=;
        b=R/ZPB19OL/j0sXa3Nn3DWe0Zhdbxyq3oAoMVeQqYZSFS3FL8kj5xo2gTDg/WIxXEL5
         D0yQCyzgOQBndXobWidyhsZWRVeoobhad/w1ap4H+w30gFeOYuRNPVkD257rBc1hkHYQ
         oVSzUF0t8fEbcNj7ZAZ/og4rZjcYLoyQIsGiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bndM8/ewanrubJ2IhCtuXduKJTWvrDwwopmuB7et4RY=;
        b=NfNT/uXH0ePpxWhem/ylXHzH+G6Cf1B0ijhfg8U7GHL5Pkh0CvCyN2bmqtnSBsVyMV
         jq9rz7BKpAmfz0BJKMnwztg7I5p57XiXkLrOA4Zn+0d073CVKNuNwkfxOsJTdCrJ7DJi
         8wH3rZqTVzPtt1EKGyGR1cpB3TLpQ01gPglGWhfUV+VDykjTVusokEWVQ+nAi8SQOlaT
         CDvxqcr7Qj3OcYqcUghQ/Cnq2UDi/qfJrXOy6myfZ/sv2keph2JvKak8TvTIb5FtvbXV
         Es9ml884NQLUyaagHDahqrOE8lsV5oCujOZG9jtA1RfbVBs0QALiYdI7oGoXX+zGs3oK
         HsCg==
X-Gm-Message-State: ANoB5plLKDEuM4uhHQNSeWjjD7jr2rmgnRE+u71Fqkvpw/Svij/g7w3n
	3QpkwnqjqeIuNfBEjCDDnIujaw==
X-Google-Smtp-Source: AA0mqf6Fn5FOhUG2QPb+GAt4nMoD9omis8upls4yfP4u03bXBER4HZBsi9qWU7Z2sLuLiKR4JYwX4g==
X-Received: by 2002:a5d:6d42:0:b0:242:4dd5:327b with SMTP id k2-20020a5d6d42000000b002424dd5327bmr7118703wri.363.1670279440250;
        Mon, 05 Dec 2022 14:30:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d6:2c80:98d5:dc63? ([2001:8b0:aba:5f3c:d6:2c80:98d5:dc63])
        by smtp.gmail.com with ESMTPSA id e14-20020adff34e000000b0024228b0b932sm18652653wrp.27.2022.12.05.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 14:30:39 -0800 (PST)
Message-ID: <febe3d80e804684b2cd8f1be280bca7193e8ff9c.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] gstreamer-vaapi: rename USE_X11 variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Mon, 05 Dec 2022 22:30:38 +0000
In-Reply-To: <20221205201330.2184787-1-f_l_k@t-online.de>
References: <20221205201330.2184787-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 22:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174308

On Mon, 2022-12-05 at 21:13 +0100, Markus Volk wrote:
> Rename USE_X11 to HAVE_X11 to avoid naming conflict with eglplatform.h
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-replace-USE_X11-by-HAVE_X11.patch    | 319 ++++++++++++++++++
>  .../gstreamer/gstreamer1.0-vaapi_1.20.4.bb    |   9 +-
>  2 files changed, 324 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/=
0001-replace-USE_X11-by-HAVE_X11.patch
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-re=
place-USE_X11-by-HAVE_X11.patch b/meta/recipes-multimedia/gstreamer/gstream=
er1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch
> new file mode 100644
> index 0000000000..8cb17a8a0b
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-U=
SE_X11-by-HAVE_X11.patch
> @@ -0,0 +1,319 @@
> +From ff9c63505183f7620b68d7d848ad6b16a7497c75 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 5 Dec 2022 20:56:43 +0100
> +Subject: [PATCH] replace USE_X11 by HAVE_X11
> +
> +currently used variable collides with eglplatform.h
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Patch-Status: Inappropriate
> +---
> + ChangeLog                                |  2 +-
> + gst-libs/gst/vaapi/gstvaapidisplay.c     |  2 +-
> + gst-libs/gst/vaapi/gstvaapidisplay_egl.c |  4 ++--
> + gst-libs/gst/vaapi/meson.build           |  4 ++--
> + gst/vaapi/gstvaapipluginutil.c           | 12 ++++++------
> + gst/vaapi/gstvaapisink.c                 |  4 ++--
> + gst/vaapi/gstvaapivideocontext.c         |  4 ++--
> + meson.build                              | 10 +++++-----
> + tests/examples/meson.build               |  2 +-
> + tests/internal/output.c                  |  4 ++--
> + tests/internal/test-display.c            |  4 ++--
> + tests/internal/test-windows.c            |  4 ++--
> + 12 files changed, 28 insertions(+), 28 deletions(-)
> +

FWIW I do agree with Alex, we can't afford to carry a patch like this
ourselves and we should discuss it with upstream as it is presumably
something they'd want to fix. If they reject it for some reason, that
is a different discussion.

Cheers,

Richard




