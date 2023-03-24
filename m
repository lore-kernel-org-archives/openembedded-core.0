Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DCEC76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 10:29:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.97470.1679653766755659261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 03:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y74Auvvq;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id h9so1215801ljq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679653765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzBbdDIKZi2LsLG3/9k4zXq0JgYUAnwXIYX5V1P4Erc=;
        b=Y74Auvvq5mppnsuefleTYLFgGgw4k0KHEBCUkS95en1A+VsUNzkZ2LnWOHrqJSHbJs
         SWFVovFugUPM/qUxPh5Jwr0opmYtvOjQrgIGbSdFbUoPh/7dcCPeyE0rHDiSsSdqptjB
         qaZBJ3UlkgXylxBTs+B1BoC19rMGTLCWzkrxQvc/Q9NdOoAHAKMgPXjzPiA9pHE3VOWM
         0r0zNw+mW4+O+I1ClEWOdGSdz1RLaBt2JmAMhzv1MXLJZNCC4HqA8Mk+/EAqOQXr236h
         e6sTbG78QubnJf1cFqEycY0fTQt5X0OGxE0qFDLw4Nbjze33VK+VsdIPIi2oW4WPja0T
         iVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679653765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzBbdDIKZi2LsLG3/9k4zXq0JgYUAnwXIYX5V1P4Erc=;
        b=X4F/+w3QooTo5tGPGjlYoXG4rQdzm/95GuqNVqDw/0ZJNzU/T4yzHyVA1R+gqUA/+o
         /NX+XBuMO9XLJLJSNXxUjBbu94wF1go4u0iG7rySkAQc9bw4gqxMM0K6xzVda95k+SUK
         BpXRcJfIV8MEdsJAETQnXHxhD0ylu/oE8NshynptkUrMN+m5SEgCLB4aN/AcNORMU7Vz
         y8zp6Q4Lhy2tCKOylQEsPsZvfgkyZICRTwQXZ0IBQp+TuBmGDmokNNyik99T9xUmRSmh
         nVzMyqi0qaZtBE9xOicGUPc79r9nip8CO8R253pz98bJ2OxQWaZnG17zRCu4EseQu97f
         ydTA==
X-Gm-Message-State: AAQBX9fclgk8aLyPDA4kAZ7Ss1nLwgDKgSzluYPhBz/dGn3VIZUza77F
	L0PHKdQzA6oa43v06wbAaWXt6ltvVVn9eqQmJ3w=
X-Google-Smtp-Source: AKy350ZkIphCCS2h7lHqKizIhOncvwpVKvUh4Z+9XVJe6mZABDkLrXGx1RO0i4wyrLN3AV/KMZoZuiwXJcFiQbO1yRA=
X-Received: by 2002:a2e:6a12:0:b0:29a:9053:ed22 with SMTP id
 f18-20020a2e6a12000000b0029a9053ed22mr700887ljc.7.1679653764707; Fri, 24 Mar
 2023 03:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230324093326.3973899-1-kubiznak@2n.com> <20230324093326.3973899-3-kubiznak@2n.com>
In-Reply-To: <20230324093326.3973899-3-kubiznak@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Mar 2023 11:29:13 +0100
Message-ID: <CANNYZj-Abxph_jTa5BkrvWUyV=F9h_4K3nNRO0g-oNA10VKQ4A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/3] graphene: add glib PACKAGECONFIG
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 10:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179033

Shouldn't this be something like
PACKAGECONFIG[gobject-types] =3D
"-Dgobject_types=3Dtrue,-Dgobject_types=3Dfalse,glib-2.0"

?

Alex

On Fri, 24 Mar 2023 at 10:36, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wro=
te:
>
> When gobject-introspection is enabled, glib dependency is pulled in
> automatically. When it is disabled, glib dependency should be optional
> via PACKAGECONFIG.
>
> Default is to enable glib so that graphene-gobject is built
> (dependency of gtk4).
>
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
> index 120ee80b17..5c870147d0 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -11,8 +11,9 @@ SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c70=
27bcff52f5ec2367c25ec859da3
>
>  # Disable neon support by default on ARM-32 platforms because of the
>  # following upstream bug: https://github.com/ebassi/graphene/issues/215
> -PACKAGECONFIG ?=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'ne=
on', '', d)}"
> +PACKAGECONFIG ?=3D "glib ${@bb.utils.contains('TUNE_FEATURES', 'aarch64'=
, 'neon', '', d)}"
>
> +PACKAGECONFIG[glib] =3D ",,glib-2.0"
>  PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
>
>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179024): https://lists.openembedded.org/g/openembedde=
d-core/message/179024
> Mute This Topic: https://lists.openembedded.org/mt/97820022/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

