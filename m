Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F38C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:35:19 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.12973.1714743311144588708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GZ32ShNE;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.172, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61af74a010aso91338727b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714743310; x=1715348110; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFSwbTzdcBVRGYS1Je8uXqCYRGY9FBb19xfuEqZdedw=;
        b=GZ32ShNEDz34r5kPyYKXYLme4+WPLg6NHpE7rk+Hz/xS58mY5xFxhzT30JI/QMx6gZ
         4IXZd7a2v7VDaokJf/rNgPaAWEs3SbU/Mh6b5UzJiZ5BSKhP+hW0yMfpHOeVVxAoJY8/
         XX/HEHX9K5O4QCqyBk/vsQbdEUzikEG1V2iKkiAwZFW7M8WuRsZw1Q53JZhl6RughJwy
         yQZx1umg7aWEZclt9/RlKDFLvjyJxCnk9O++ha8HvIjhY6ctWGtjYZ1LqUXOoe0ZISoO
         y7n8KJCndw82dZi6ySRRJwPYR8r3BEefolbW3i9Oq5GznAEaDKgLX458GYIzImtQ0ZtQ
         MDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743310; x=1715348110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFSwbTzdcBVRGYS1Je8uXqCYRGY9FBb19xfuEqZdedw=;
        b=tlCTBOd1vY3QqX1+bNXTPSsfjgrFtBiVNZXEKFMzA5923IaH7lyM7BKiCiF+bg6Pcy
         IVvmO/q2VYPfareDUiYs9jVqGW0Z9JaT0/hGNx30OrlPZt4cMR/w6xMm/arTD1rdvZ0N
         7N1Lim1UyiwHuNBqKfDWPYdpJn1rDeIWkHLuEumF0ls7MitIuWiISqobF8A+FUS38uwE
         n7ABcgT9qidHdS4gkTTBe4LdtiWWRjdf2YE21I3MtQTXCt/bJD7d+SYT3OabkOcxXoEL
         EKn6Bomd1PZCN5PLegE2oIflqWIcUUj0EeY10Gb7l2uNUiBOJPVbjq2bBMDTYskfGSgp
         EWCQ==
X-Gm-Message-State: AOJu0YyggRjMba28ZyZj1sRA5bRxo2/WiEtrtGjje1PLofBuctkOP88M
	vjvex05oWcfRlkrXXkMaPiLxwDySZWy8baG29DfkbOGn49g/cP1yFYLDq8hN3YMzxyY8SyiNlH9
	g2de5WXxX8Hb8943y9tYtosFaq1vqx9Szs2OeNg==
X-Google-Smtp-Source: AGHT+IGQDv9vZLV/BbOETaeL37P4v/ydNQjJ7siU0Djcga7M62mGsF/nteGIZmhk4HWTCPe1lVP1PmsKQZuMSilS294=
X-Received: by 2002:a81:8346:0:b0:618:8a27:f06 with SMTP id
 t67-20020a818346000000b006188a270f06mr2588424ywf.9.1714743310270; Fri, 03 May
 2024 06:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240503061411.27610-1-nikhil.r@kpit.com>
In-Reply-To: <20240503061411.27610-1-nikhil.r@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 May 2024 06:34:59 -0700
Message-ID: <CAOSpxdaxOLtjejw3cweD65nb663Fk8BUdvzUO3oD3q2iqnhstw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libpciaccess: Remove duplicated
 license entry
To: nikhilar2410@gmail.com
Cc: openembedded-core@lists.openembedded.org, bindu.bhabu@kpit.com, 
	Nikhil R <nikhil.r@kpit.com>, Bhabu Bindu <bhabu.bindu@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198990

Since this is also an issue in master branch, I'll need you to submit
this patch for master first before I can take it in kirkstone.

Thanks,

Steve

On Thu, May 2, 2024 at 11:14=E2=80=AFPM nikhil via lists.openembedded.org
<nikhilar2410=3Dgmail.com@lists.openembedded.org> wrote:
>
> Remove duplicated MIT license entry for libpciaccess
>
> Duplication was done as part of below commit:
>
> Link: https://git.yoctoproject.org/poky/commit/meta/recipes-graphics/xorg=
-lib/libpciaccess_0.16.bb?h=3Dkirkstone&id=3Db0130fcf91daee0d905af755302fab=
e608da141c
>
> Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> ---
>  meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb b/meta/r=
ecipes-graphics/xorg-lib/libpciaccess_0.16.bb
> index d55315efc2..445f3751fe 100644
> --- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
> +++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
> @@ -11,7 +11,7 @@ SRC_URI +=3D "\
>  SRC_URI[md5sum] =3D "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
>  SRC_URI[sha256sum] =3D "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90=
c575bf1938b9f489"
>
> -LICENSE =3D "MIT & MIT"
> +LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D277aada5222b9a22fbf3471ff3687=
068"
>
>  REQUIRED_DISTRO_FEATURES =3D ""
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198968): https://lists.openembedded.org/g/openembedde=
d-core/message/198968
> Mute This Topic: https://lists.openembedded.org/mt/105883179/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

