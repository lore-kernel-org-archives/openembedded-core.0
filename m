Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EDEEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:12:06 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.18440.1686762723495879023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 10:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=U51uEPOG;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55afa2472d9so618043eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686762723; x=1689354723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIdJKCyDHnCHfZPlgwIrtZVJ0Wz17id5D+WOSL4B3u8=;
        b=U51uEPOGMHmYjOR1UmBftrbSkYQHrq8Ads7t5uJjkfwUGksoDpXXYo5p1/WfgIfz4p
         1Y26stKs6WD/7bp5sBX6a0onnobYmbpVVc0HQSZHkqkz/cd6Y9KeiwDu32LmGd2jN9AU
         ywRxVMHq0c3GQ70cR/nIRmV+6RxGDqUUbwzRGBRstU7k0MINeqBD2go7Y3sHUb940SVv
         6ncw1LunTv/RO3QG4Mv5KfLKCI3gISc5hM/Kjf9DmHnsqx02+c1gyNFmA7QAqu9kj2Xb
         JOYzGiEmDbrE+66yN55yF10vqomuNykxi6ux4O8Ke6FgkfcJ77Y7bq1ge3uW7oGkKyiG
         /fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686762723; x=1689354723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIdJKCyDHnCHfZPlgwIrtZVJ0Wz17id5D+WOSL4B3u8=;
        b=XE8suq1k+amh1dKbL72OVGGChvduwsQ5vg8DO956jDJLroI0/H1pvVZu/cyfcED59m
         M+INLOgAB3igAeQ4wKNB66MxZmtrYbGUuLoucqczlkEI3mMf6Ia3sNsZIwRztvCxyx+k
         WHBLxWte0i5Gl+kLVZVBRMVTIDs0tgj5NHFmhflmQHz3t+ZJiNIwadE+/LYjp0+0k4Qw
         7XY94NHAIOGtUgp70fm0WiN9W+thqZZ3CcgQ0BH5FUhnM1nFzeufwuQXQ8r/gnYb2Bmq
         mXctYKDnG8xkIJ+itX6rq2v6zq+pkX7yNPnHCNJTwxLl7IPmkgakd0V/HQgGMxf1No6z
         zcYA==
X-Gm-Message-State: AC+VfDx/4132ZhyFFpqcRGXCF6fGKLYIYPTclLvTU6cC2QXziExL64uI
	8s/3YjM1kVbO22CwDb4zsjKTb9T1h0fYnfa/vWQ=
X-Google-Smtp-Source: ACHHUZ4cQbmFDU/LvrxTl6knfDf8aCBKI/k06iadlY49SAacW76IeEXo/Y3urCzu7V1vgPwWlmZ/5uCjS1HPFa2HQnU=
X-Received: by 2002:a4a:d9cf:0:b0:55b:344d:79d with SMTP id
 l15-20020a4ad9cf000000b0055b344d079dmr1299449oou.0.1686762722624; Wed, 14 Jun
 2023 10:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230614092918.4065570-1-alex@linutronix.de> <20230614092918.4065570-26-alex@linutronix.de>
In-Reply-To: <20230614092918.4065570-26-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Jun 2023 10:11:36 -0700
Message-ID: <CAMKF1sps70DwarBXcWoC-oY-qyFVpBdQP+yB_xs-xaytJu6+ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/55] libxcrypt: upgrade 4.4.33 -> 4.4.34
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 17:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182822

On Wed, Jun 14, 2023 at 2:29=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...{libxcrypt-compat_4.4.33.bb =3D> libxcrypt-compat_4.4.34.bb} | 0
>  meta/recipes-core/libxcrypt/libxcrypt.inc                     | 4 ++--
>  .../libxcrypt/{libxcrypt_4.4.33.bb =3D> libxcrypt_4.4.34.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.33.bb =3D> libx=
crypt-compat_4.4.34.bb} (100%)
>  rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.33.bb =3D> libxcrypt_4=
.4.34.bb} (100%)
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb b/met=
a/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
> similarity index 100%
> rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
> rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-cor=
e/libxcrypt/libxcrypt.inc
> index 61b03810763..4d145cf3ccd 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSING;md5=3Dc0a30e2b15=
02c55a7f37e412cd6c6a4b \
>  inherit autotools pkgconfig
>
>  SRC_URI =3D "git://github.com/besser82/libxcrypt.git;branch=3D${SRCBRANC=
H};protocol=3Dhttps"
> -SRCREV =3D "d7fe1ac04c326dba7e0440868889d1dccb41a175"
> -SRCBRANCH ?=3D "develop"
> +SRCREV =3D "e80cfde51bb4fe4bcf27585810e0b4ea3d1e4d7d"
> +SRCBRANCH ?=3D "master"
>

branch change perhaps is unwanted here, If I look at
https://github.com/besser82/libxcrypt/commit/e80cfde51bb4fe4bcf27585810e0b4=
ea3d1e4d7d
its in develop branch

btw. there already is 4.4.35 release to fix minor build issues.

>  SRC_URI +=3D "file://fix_cflags_handling.patch"
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb b/meta/recip=
es-core/libxcrypt/libxcrypt_4.4.34.bb
> similarity index 100%
> rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
> rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.34.bb
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182771): https://lists.openembedded.org/g/openembedde=
d-core/message/182771
> Mute This Topic: https://lists.openembedded.org/mt/99524163/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

