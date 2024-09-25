Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59ED6CCF9E3
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 15:16:18 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.18780.1727277371418683905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 08:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4eaBwqm;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-710d8cab1c3so4996461a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277370; x=1727882170; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AeILG29cR277417OuHJVdXUfvnzeV+eXgxlO91kdN0=;
        b=Y4eaBwqm3+Czr7knXkQeMWsRgOcHymOF7SZMcKs97x2enPKzAlKktwMwTV3ELJ8P7M
         s1WBp+GPPOCjWNwFGmLrH8jtWc4dZhy7IwY71g2FUOlSsheXahfSY/gP7B3yYO9zGUV5
         LADnrsQsn8UsbXxjmNalzBVSR+T5b0I0sTvMmifY+MegtmWaEHqkHq4byvvmmnoCVxGo
         bIuAvOnVjla+PWr7OPInq16f7/3cfY5axhiX3f830vYoHGCvBEDCNNYEo67XpKjvvO40
         jILm6Nbzq5FDCQbJWux0p0lQI8jJGT9ImuPTFR7StO9tq1b1prXlx6XzBunh7zFKGFXV
         7UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277370; x=1727882170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AeILG29cR277417OuHJVdXUfvnzeV+eXgxlO91kdN0=;
        b=MLeLZR5cEdKUXyYOzn1xwv7O2jdEOT5xQ5A9nt45KdGe8/Ye7Kpnwdw+L0gCcNhCo5
         ZxMnUvIV8LX7pGJ1RUze4CxJALLD7pHIx0agucepQwt8lyQ2r9oz0m+hCmPJ7tX6vO9m
         dXTMdoENHTV7gRUD283TIa5lj1KilYqFwFE9zCiHscn5BNPd2FksuB4vi4BzqnWXRo8m
         UuKtlU12vuPZwTywL0jJ/B+iYjNh775LbDt0/y5ebwlx/VldEuqwseJeee/SNRYr6lTz
         hpluZg7WWIopcAQdqkInHzWDy48WAV8X14ub24c1+rNep9DGTyMzoMBZsfeD6hmcPpHa
         HEtw==
X-Gm-Message-State: AOJu0Yx9faqZdV9esivILq4KjNIuAG1R5Z/mFCIuN/JYAZSSa6gUffSS
	N2vk02T3lIcGrW7ZBcym1NuWv77GXOXgHPrbwLMW+t7R8NuKtlVHwSW8Nf2ucBTW9nV3WAeKn++
	BLqmQC+gu91Ft+y2LTmrgJ0LfOIaSr1TK
X-Google-Smtp-Source: AGHT+IGw3KRtQr6tkGP18NWVpbTWDL7NgPH7fOQIRv6z1MagYX2ErAfXyy50CfwVluw4t4WL1+dBqsgcEqAKykPlm6M=
X-Received: by 2002:a05:6830:6d0b:b0:710:f0ee:2592 with SMTP id
 46e09a7af769-713c7e2eb68mr1314654a34.22.1727277370661; Wed, 25 Sep 2024
 08:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240925133238.1013647-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20240925133238.1013647-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2024 08:15:44 -0700
Message-ID: <CAMKF1sr2L6QLP0LWoB5NZox46zsPrek+4vg1fBGDukmnGC=5ZQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] binutils: stable 2.42 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204962

lgtm

On Wed, Sep 25, 2024 at 6:33=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Below commits on binutils-2.42 stable branch are updated.
>
> 8a6764d35e5 libctf: fix ref leak of names of newly-inserted non-root-visi=
ble types
> d9ddfab9be2 ld: Move foo before delete in dl5.cc
> 3e92ae5088c ld: Avoid folding new and delete pairs
>
> Results before updates as below:
>
> No. of expected passes            302
> No. of unexpected failures        2
> No. of untested testcases         1
> No. of unsupported tests          7
>
> Results after updates as below:
>
> No. of expected passes            302
> No. of unexpected failures        2
> No. of untested testcases         1
> No. of unsupported tests          7
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 24efe495ec..5d5ba3d6dc 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
>
>  CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version =
2.40 and earlier"
>
> -SRCREV ?=3D "71ef12cbf140a637e4ea4e2239ee5daedc8640de"
> +SRCREV ?=3D "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204956): https://lists.openembedded.org/g/openembedde=
d-core/message/204956
> Mute This Topic: https://lists.openembedded.org/mt/108647574/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

