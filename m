Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500A6EE01FB
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:41:32 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.3520.1694626886879672177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B0mfivZA;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1d5dabec19cso58056fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694626886; x=1695231686; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/M+MfmMKVFuUcJkoN+Bi9yVnZ83m9shnUyZssSIV1Y=;
        b=B0mfivZAUoN6IBjfCwplev2CU06ClSEobmgwGDbpFZJcsMi6dIgjy5cv/YqW/LCLqC
         szjglAVuk2HLkRUIoBlWnSh7CquEAdEg0S8gaIxtdNLfXcXKvhy0tLLZIQyaQWbqA/vw
         CYhqYfcuP3bDDWv0yJVAkhl8BtShzrO5I0WLVUnQJp+IkA+W2ndSF1IEUnQpWP5dWNMn
         +kR+ZapxN0XSNtwjFSc2NVZ09RKW3Fmz0n/xOEupXJsRjenJJGE2Qm1GydfSt3iQ+zId
         wszkGzc6F4wL+Hc/Ojay5qjtjLdYvwUtzfpqM7V9sfnuHRRixm1YLq87Uup7mY6/QAHz
         GcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694626886; x=1695231686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/M+MfmMKVFuUcJkoN+Bi9yVnZ83m9shnUyZssSIV1Y=;
        b=H2DKttYm+R9NGAA7dOKbBA0LCMYnJCwjuXf7Y/esCLvuuY6HxEl6UhXx+V7t1vIelO
         +pCsLzyi+ixIEav3sKQ1xbE2HQlCAETWFaJSJUWcxkr0wEgt8ivH7CpUtNqDmjcFPYK+
         HkJYCzVu3x3hUhii//QhR5YkoIWBP3Egt/gAV47eytEtNb4TpZHkbjEmsXNDR+p8Mf1L
         rTH/imfraCjYAJRCnH168x4xr3IUxewoRofBN4DDt9242WcLF6PHoE64pZRA1OZbYrBZ
         0UkHlwc/LhzKyWMBgtHYqYUOlZQCy5HPwSnwxzdX+8NtPCagQffjDE402ZvlhdUuyfIv
         zyzA==
X-Gm-Message-State: AOJu0YwkPcxPEwI3Bi2AmPzgvi7Fc8TjGxtqtZ6vJyyiI18dH0Vqfv87
	RLZ9qhDF2qIRKNdcI41kq/pY58OgC4xiOR3eIxcHvfIB
X-Google-Smtp-Source: AGHT+IHQQVmBU4F/pgrASWfRuvfjA7FpxHKwfw5sGMzogNeQzgqKcl6HzvIjz355Ic7E5PBK1vRCizOcRaggEJx6NEA=
X-Received: by 2002:a05:6870:b008:b0:1c8:c909:893a with SMTP id
 y8-20020a056870b00800b001c8c909893amr3415230oae.50.1694626886041; Wed, 13 Sep
 2023 10:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230913111845.585486-1-sanjanasanju1608@gmail.com>
In-Reply-To: <20230913111845.585486-1-sanjanasanju1608@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Sep 2023 10:41:00 -0700
Message-ID: <CAMKF1srnhOZFDiwREH1AQjt8=ZOyJfqFT8H6W7ZnrKjNOdQf-g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: Sanjana V <sanjanasanju1608@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187620

Thanks LGTM

On Wed, Sep 13, 2023 at 4:19=E2=80=AFAM Sanjana V <sanjanasanju1608@gmail.c=
om> wrote:
>
> Below commits on glibc-2.35 stable branch are updated.
>
> 561e9dadc0 x86: Fix incorrect scope of setting `shared_per_thread`
> 1c3ecf5858 x86: Use `3/4*sizeof(per-thread-L3)` as low bound for NT thres=
hold.
> 47c7d2eb03 x86: Fix slight bug in `shared_per_thread` cache size calculat=
ion.
> d1b1da26ea x86: Increase `non_temporal_threshold` to roughly `sizeof_L3 /=
 4`
> e19af583b4 elf: _dl_find_object may return 1 during early startup.
>
> Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 01b1abef7d..f23ceb5a25 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.35/master"
>  PV =3D "2.35"
> -SRCREV_glibc ?=3D "cbceb903c4d770acc7e4ba5641036516830ed69b"
> +SRCREV_glibc ?=3D "561e9dadc02f46a7ba2190c0a04259583479f6c9"
>  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187583): https://lists.openembedded.org/g/openembedde=
d-core/message/187583
> Mute This Topic: https://lists.openembedded.org/mt/101334533/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

