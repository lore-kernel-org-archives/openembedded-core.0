Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EA9C636F0
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 18:17:14 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.3258.1724869032554486569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 11:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vk4f6gH+;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70f5a9bf18bso223708a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724869032; x=1725473832; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0B5mZzXnAuGFhDTwlNoD/dCBvlQq0VPwfdJEHlF+kM=;
        b=Vk4f6gH+u8K5koojonAwzjXJpMz2jpbUpsxlTTEEp2kIT4GIIw7xOQbnR2rOZQWfLx
         QQRUhRg0Yl94fype7yuorXA4yqc/mCiyQSbm1XlFyFIRt0DTP6Tt5Gqc82MOnACw+7Vf
         /fvl8lSK73phJvijmBaEIDNvXtt6KzWbafvG3a81kQsURG/npo0uZkZfm1N5J4MG6pg2
         hcFrvWCa4862WJr++BagQDQAg/ppmjHsJL+/vevKvIsv/lm23N8qoKvWtJSHGQ8wf25N
         vlyqPmpi9l2XAR5fkvK87aPqSj3q6soFZ2DTHWACIwtLK3NpRJd3GOESJrf0DN+XrJR6
         FOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724869032; x=1725473832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0B5mZzXnAuGFhDTwlNoD/dCBvlQq0VPwfdJEHlF+kM=;
        b=OmOlAGNe6RN0gi3TBI5fISpU153qjQinv9XHy8i3gwvpw8jgxDa3/UarlcA32dY6dx
         axwFOpXYI8WMQXFsacFD2PoKwlfcYF4ETk3F7PFdSAOwg/G/ZQaI0MFen5QtrT3C90Z3
         Q2i5Smaa6rlaT34ZWjiFWjwlv75S1cOcH+Aeo+9dmxgGAHxSjWZSKGqeLKlofy4M1g3s
         gojTE8zl5Bt37blXk6DLKK2Y6WgWFisWsyXGJTBRgYEdlE8r1T8o1JE/VlztFZl0c0hB
         6HpCQzutaMg3+L33x8R6aigJMaUZijBj78uRC6wu5lgIWddOZINhNPpSyJt74iP6GxGW
         D9lA==
X-Gm-Message-State: AOJu0YyObPLdaO3WVrSaHjCuNTkMY7mJlrLmHjQPxyr8R36RVxCvDT/I
	TKRN1OT+jkHyyzyFHFide3oeZLCuCMZulVOnNSwNwRLWxJ5Pg0UL9e8cOGTcLalFaghd9GUARvR
	3Ng9PI2w5OF1/X6m088AlgKq4EmA=
X-Google-Smtp-Source: AGHT+IGyTmvnCKoFWXZnDrdDrE4oJNDvxriEpsotGMsNn+Lx8jMzAODMXfp7MTBQgyN/A+qSkktplt+xEfzchkZjuYg=
X-Received: by 2002:a05:6830:3153:b0:70c:a547:1c43 with SMTP id
 46e09a7af769-70f5c3b60fbmr540433a34.9.1724869031696; Wed, 28 Aug 2024
 11:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240827052354.1319810-1-alex.kanavin@gmail.com> <20240827052354.1319810-7-alex.kanavin@gmail.com>
In-Reply-To: <20240827052354.1319810-7-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2024 11:16:45 -0700
Message-ID: <CAMKF1spsbNbQ=gRurCdnAFxoiKs5i-CKzafQOe_ce99NGzid8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/34] fmt: update 10.2.1 -> 11.0.2
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 18:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203888

breaks
mariadb-native - https://errors.yoctoproject.org/Errors/Details/800105/
gerbera - https://errors.yoctoproject.org/Errors/Details/800106/

On Mon, Aug 26, 2024 at 10:24=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/fmt/{fmt_10.2.1.bb =3D> fmt_11.0.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/fmt/{fmt_10.2.1.bb =3D> fmt_11.0.2.bb} (77%=
)
>
> diff --git a/meta/recipes-devtools/fmt/fmt_10.2.1.bb b/meta/recipes-devto=
ols/fmt/fmt_11.0.2.bb
> similarity index 77%
> rename from meta/recipes-devtools/fmt/fmt_10.2.1.bb
> rename to meta/recipes-devtools/fmt/fmt_11.0.2.bb
> index 1437eb48034..5a7041088cd 100644
> --- a/meta/recipes-devtools/fmt/fmt_10.2.1.bb
> +++ b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
> @@ -4,8 +4,8 @@ HOMEPAGE =3D "https://fmt.dev"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9257785fc4f3803a4b71b76c1412=
729"
>
> -SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3D10.x;protocol=3Dhttps"
> -SRCREV =3D "e69e5f977d458f2650bb346dadf2ad30c5320281"
> +SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttp=
s"
> +SRCREV =3D "0c9fce2ffefecfdce794e1859584e25877b7b592"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203782): https://lists.openembedded.org/g/openembedde=
d-core/message/203782
> Mute This Topic: https://lists.openembedded.org/mt/108118408/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

