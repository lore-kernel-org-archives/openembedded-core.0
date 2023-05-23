Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6275AC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 01:31:36 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.10238.1684805493628656734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 18:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cOWkGOkv;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6af873d1d8bso421480a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684805493; x=1687397493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZEsz51lRbSJCRxAreEw9DUtbyL3hINihgeoghcoqk8=;
        b=cOWkGOkvy0QyKmY+3UB/r8JoH0oWV/pXNlAWzrHTG4+aBK+iRg/uGFVG59Xe2SGCYA
         SUT+OiEr84CkL7gGzbs6Je9x+z320/htkK8MHNH6GDfEc4GoK/AEevGtpQMFy24Hk6Y9
         GGpEkTRGOIEt6ORcTuCcfBAXz6eXT+oLfiLiGWinQ5c1pnEePPLInWmQaEKx82fYEOXN
         8s2oow2lBdshJNTFI2yCtXqcw24nW4iJM0gDWjhePP6cW6HIT+VXn0K73+7RNzIRvvSA
         NyKRcUL3NCkAgYw/zEdkUNpyYQwZy7kUbGV5DPwzEdX6FcDpukAML7/KcNrC8VRQljWd
         TGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684805493; x=1687397493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZEsz51lRbSJCRxAreEw9DUtbyL3hINihgeoghcoqk8=;
        b=cUVaGDyOgcM8bLyy7yoABEVPOTl70QFdzE4zmzduQTgIq9c1AvAr3pYahm9NmB7KQG
         CjshC9Q9CHgTbMo2iK9uLZZg6Zyt+OaGzJU2HGc+guFtzxrYJXoiG2IZwvQvCYnEjcxM
         os1FoEpRIythNZ37PZmNNhaA9XGpFwsmrdGYrnT052WfW/2MzV+tg6hzYE+596A8TxSO
         sqd5SIKDt8aFeKoHpm0toF6WABhlwUq8CeC67HSbBw3/ZJYK0pOCD2dAGisvxTZwwJT+
         cKZR+t1IFs288wKdBkDVw3/m1IhRZcZUqQ9fN4GWpijYhMLDVtVzlisDjc2/j6QHWvxP
         BiVg==
X-Gm-Message-State: AC+VfDw/g6cJzcA/1ojZj/o6Z01XrftKvhYdvczayMGLMWLyt8Bs4MGK
	7IS8SGHEFSfhpjm0A2BcjCb7IFTMkN5qWossXfc=
X-Google-Smtp-Source: ACHHUZ41xr7UYDRBWutZyCgqVP9VMDNKOkr4xWN5B6WRjFYTjXJ2O1kDiZJjbaP2+ILvnA8GxzzfPTRdURDEtYshoVI=
X-Received: by 2002:a05:6808:485:b0:398:2b18:9aa7 with SMTP id
 z5-20020a056808048500b003982b189aa7mr748877oid.18.1684805492563; Mon, 22 May
 2023 18:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230523012131.50450-1-pkj@axis.com>
In-Reply-To: <20230523012131.50450-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2023 18:31:06 -0700
Message-ID: <CAMKF1srtrqLKp8LRa=7UAb=0TzMDBUvtzJpRtDE4gSFa89NZhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 1/2] musl: Correct SRC_URI
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 01:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181624

On Mon, May 22, 2023 at 6:21=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> When the protocol used to fetch the Git repository was changed from
> "git" to "https" in commit 139102a73d (recipes: Default to https git
> protocol where possible), the URI was not updated to match.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 19b07d6be9..7c8434f23f 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -12,7 +12,7 @@ PV =3D "${BASEVER}+git${SRCPV}"
>
>  # mirror is at git://github.com/kraj/musl.git
>
> -SRC_URI =3D "git://git.musl-libc.org/musl;branch=3Dmaster;protocol=3Dhtt=
ps \
> +SRC_URI =3D "git://git.musl-libc.org/git/musl;branch=3Dmaster;protocol=
=3Dhttps \

this change looks fine. Thanks

>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.pa=
tch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-t=
o-l.patch \
>            "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181621): https://lists.openembedded.org/g/openembedde=
d-core/message/181621
> Mute This Topic: https://lists.openembedded.org/mt/99078698/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

