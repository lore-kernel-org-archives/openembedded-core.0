Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E5CC54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 09:18:01 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.39265.1710926279074979280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 02:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LC2fUwsg;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so85794971fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 02:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710926277; x=1711531077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mgRTaKmZsOgVquhYoqfSiOvrafwfYLR/zAGyKIFsNkA=;
        b=LC2fUwsg8rk1NB8r1jtKyZx0IOy8tLvvK97itCkK2dtdyv2yJ71/grmakuQ0pUrimI
         Eb9850DtmNTC+14PocVck7ROMHXhm1outAs/hpML3qiHEhVHwO+rPE8tjF/RdIIQgvvd
         AxlXM92aVG5eTGjiNjmsOGRb6dShVSrVgIF7wbXNCnORVwIg45Q7zsEDYX47EitBTVRc
         PTSBY9KucnyziTw9e7v2+0jD7XdopA9PafdJ8/UW089LLEmHbRIq1avD38/ecBJqNI9a
         SxOOsJ3XGUeRsHluilC5Hp+tDDe7L1co396B8fGUWY5Lmi8/6Oe/z9C/UnTDgQTpw8l3
         xT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710926277; x=1711531077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgRTaKmZsOgVquhYoqfSiOvrafwfYLR/zAGyKIFsNkA=;
        b=QLr9WnbQZKrVcfh1/8ZbauxyvL47H4G5CEhGjYYoyfAr+3Tl3rriiXrhXVx8PsPmCm
         MVgpFnMxsSvlTlb6LxX/9IpVhJULZMHoMe2169kyMyPaOXQnJgNWqkNi6l9Q33r2g1LF
         7Me2OpfHuD0nG7IEXHT1HsL3d6TIfqIRsZpFclQ77+RFoV7SuTzHzUYhpcMSVfANJc5d
         u8LP1ZkUK1/NcxfJwXNkXn3/aWfnZCbzatLOI/5IyL7RQXMKk3VMZvz9LSgp1ifTT5lo
         XJuId4Pp/2Fw2FXPTJ7zJPvCM3ERvhISfkENhU5QVTukhIT5Wdr973P3+320aT3OTPsv
         J3HQ==
X-Gm-Message-State: AOJu0YxJjnEtr90LMKaJZoSbL6Klu+PEKZRoGN1WYtSE7Mp+7aKDnHFi
	u6ZZS7bVN3MwEzFAILRtKtwYn6I95jtcAh8OEoR2HHKbIRjxWPjBhaa0MTefhMKQFJI0vN4a5v4
	NtWqjCzgJY99fIcfOwuYRnBwyL5g=
X-Google-Smtp-Source: AGHT+IESYEZuKX2zRqYWJ8iLglK8unPtjAtx9ZjAqj0ewFM3lNmw9dNtd+XB60iPudIpB0wbCb9c3JC4GIwVfLIcie4=
X-Received: by 2002:a2e:b7ca:0:b0:2d4:e03:b52c with SMTP id
 p10-20020a2eb7ca000000b002d40e03b52cmr10876260ljo.50.1710926276963; Wed, 20
 Mar 2024 02:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240320085846.206946-1-f_l_k@t-online.de>
In-Reply-To: <20240320085846.206946-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Mar 2024 10:17:45 +0100
Message-ID: <CANNYZj-Wy7pFVNGYE7ccYvr3sToKk4vBPsw4bnyg4gBBrUadrw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/2] glib-2.0: update 2.78.4 -> 2.80.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197351

On Wed, 20 Mar 2024 at 09:58, Markus Volk <f_l_k@t-online.de> wrote:
>  --- a/gio/meson.build
>  +++ b/gio/meson.build
> -@@ -884,14 +884,14 @@ pkg.generate(libgio,
> +@@ -886,14 +886,6 @@ pkg.generate(libgio,
> +     'schemasdir=' + '${datadir}' / schemas_subdir,
>       'dtdsdir=' + '${datadir}' / dtds_subdir,
> -     'bindir=' + '${prefix}' / get_option('bindir'),
>       'giomoduledir=' + pkgconfig_giomodulesdir,
>  -    'gio=' + '${bindir}' / 'gio',
>  -    'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
> @@ -30,25 +30,17 @@ index 5f91586..1a95f4f 100644
>  -    'gdbus_codegen=' + '${bindir}' / 'gdbus-codegen',
>  -    'gresource=' + '${bindir}' / 'gresource',
>  -    'gsettings=' + '${bindir}' / 'gsettings',
> -+    'gio=gio',
> -+    'gio_querymodules=gio-querymodules',
> -+    'glib_compile_schemas=glib-compile-schemas',
> -+    'glib_compile_resources=glib-compile-resources',
> -+    'gdbus=gdbus',
> -+    'gdbus_codegen=gdbus-codegen',
> -+    'gresource=gresource',
> -+    'gsettings=gsettings',
>     ],
>     version : glib_version,
>     install_dir : glib_pkgconfigreldir,

Is this correctly rebased? The patch is meant to replace lines, and
the rebased version removes them instead.

Alex

