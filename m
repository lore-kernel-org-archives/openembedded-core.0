Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481C3C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 05:57:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6176.1713419866048151686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 22:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Clg92WGi;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-349caee176bso277303f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713419864; x=1714024664; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSt2oiZcgWW/ZCi6Fb0a+XBOB/nu7q7mU0LAkySKJMc=;
        b=Clg92WGiYNGTaurxGylpqG56IQgwYi5xdZ9Ox448TUy+0OgQBiEaNnsLReWycTXu97
         sAsMHpt0b6CerHXWASseqqmaAFxLroKRJu9TJdxLrzxdj+1ay03jtp7e36uv3clN0hpd
         jKI0ZEQ5CBEi3EccevRfPj7VIyXZaoKAgEXKH0w9ZvE8FwJCKBsuxtKTLF4vqNxkh//s
         fLVXUNiXcNF1vl2azSl2tCbtB20Jeq4gurfN3fAxbUebXRR4C287Y4ff/arNprrpwnRf
         ZOc/bsYBHdhBYnXQnxS2Y7G+CJYWZwG2p86CFYBIz+NJtMVzBHvRJw7E9Cqy3lJx4IyI
         vg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713419864; x=1714024664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSt2oiZcgWW/ZCi6Fb0a+XBOB/nu7q7mU0LAkySKJMc=;
        b=iE8G6n7N8AHtZj2jNmJBvy5HMkYfAYXsdNbl4b8BSbPjp1wlH6X5ZNzGQvr/ViO9du
         xYGxZFw+OMiq398Epn/vNjGxUiZwNN3MHHtSSDI7jJsg6RuGeRdtKXVx819bRNfEyUKt
         htlIY+V5pinBfpkPv+i/ZSoUOE82+CCDkVBzfLPYcX17Uxdr8YmK8t4i3Xm8GwC/KIU3
         CsOWotYzfazt5fJ4JNITV8+Lo4TL7UbDUhEqZA1kT3M1TgunYhcg3B/mdcCJTCSZK2MU
         7tlUg/bgjBF49TTlqoKiJTyJv+MaW8Z6yu/+8GtkcacZZ40F+lGfViVoMOVsK2y5Yvlh
         7BCg==
X-Gm-Message-State: AOJu0YzWbstcSgmqz0jAFLUKrDVQmuI/47m7VIn2CLZBM+bVVkP2xxln
	kVLIbGCe/gIcyPdram5F1E5XJVUiknNWExVEYybVwlmYiwyJ3rPvb3+5qZrdkceT2VidS9AIvMC
	amTo702FBMVYP5kwRWPdh8IVhkU8=
X-Google-Smtp-Source: AGHT+IGqpc1A3dxve8/gJqxGXSVGMc7eItZJCgwnhNcU7gmm5rxkvCevnvKksTZeB1k0n6UCKAR1C2UswZNGxKtnD9o=
X-Received: by 2002:adf:f68a:0:b0:343:e824:d7f7 with SMTP id
 v10-20020adff68a000000b00343e824d7f7mr744191wrp.67.1713419864285; Wed, 17 Apr
 2024 22:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240417222826.3549176-1-jdmason@kudzu.us>
In-Reply-To: <20240417222826.3549176-1-jdmason@kudzu.us>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Apr 2024 07:57:31 +0200
Message-ID: <CA+chaQdwCJSSZ9vXw0VgbsWAMuRxt2F8St9Qz8d6GkNuKHy2+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] liba52: update SRC_URI
To: jdmason@kudzu.us
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 05:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198499

What is the difference between the tarballs that it requires checksum updat=
e?

On Thu, Apr 18, 2024 at 12:28=E2=80=AFAM Jon Mason via lists.openembedded.o=
rg
<jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
>
> The former SRC_URI was no longer working.  Update to one that is.  This
> required updating the md5sum and sha256sum.  NOTE: SOURCEFORGE_MIRROR
> (https://downloads.sourceforge.net) does not appear to be working for
> liba52.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipe=
s-multimedia/liba52/liba52_0.7.4.bb
> index 7a3b4a43c8d4..684dd590ca15 100644
> --- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> +++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> @@ -10,11 +10,11 @@ SECTION =3D "libs"
>
>  inherit autotools
>
> -SRC_URI =3D "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
> +SRC_URI =3D "https://sourceforge.net/projects/liba52/files/a52dec-${PV}.=
tar.gz \
>             file://buildcleanup.patch"
>
> -SRC_URI[md5sum] =3D "caa9f5bc44232dc8aeea773fea56be80"
> -SRC_URI[sha256sum] =3D "a21d724ab3b3933330194353687df82c475b5dfb997513ee=
f4c25de6c865ec33"
> +SRC_URI[md5sum] =3D "1a2e77b4f7aacd858961a6b727710551"
> +SRC_URI[sha256sum] =3D "c1931bc511dc48987fdba6888be577f3035e3f0b6b81d3ea=
3e766fca8d18e128"
>
>  UPSTREAM_CHECK_URI =3D "http://liba52.sourceforge.net/downloads.html"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198488): https://lists.openembedded.org/g/openembedde=
d-core/message/198488
> Mute This Topic: https://lists.openembedded.org/mt/105587757/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

