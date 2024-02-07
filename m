Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9E8C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 20:00:10 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.8165.1707336004859553394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 12:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuQDFsD/;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-21920c78c9fso539239fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707336004; x=1707940804; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3duN8bIw3vYP0hTfWIh21zEp2doQaxDAvy6aSdWJmA=;
        b=fuQDFsD/VZSA8pJQthtOVhFth2nbh5MfmgvKISxic0B55E8U10xQ/d4kuX3ZxW3GVh
         2rY0gM2gpIuZpPUzwIR8NqAm4TzMSKaKP5bUje+JRsYNPGy/o5QBTSvA1aSN7WYroETC
         xG6vTk8U6nmId3FKZl3hEhwSoqd3EaFmvcD04v5PhglzBBXwI/o0g/3s66jSbwjn60Zw
         L/rzrpdKM8JyrhONbwg66UuIKOdaXMjYpR2jmBuwLb+8y+BhbBiICUVVV6qK1yp9rwGE
         aDxfmsagoNrTMn5957ZgG9aodLwCYm3oDImJ28ksC3W1lCp3LHQ1DDbwujmJZ9EaabTy
         sKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707336004; x=1707940804;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3duN8bIw3vYP0hTfWIh21zEp2doQaxDAvy6aSdWJmA=;
        b=TwoUeZKg8J3AkC4VWfCCsmhVaUvBO/loKC6dm4X5nZsz14RerFNXhL141mAEPBPSES
         MW+rq6bV8HvpQuLL2/PKtTuP9ZaVFq/0x99pQ+krf+JrS9yWG91Ka/b+HirlLgMzIjsE
         7/7vR7lXtIRYzQzc4XAiiOP2wMW4H1HAx59vhPD2hqezLB1QU0gnQAyk1hQCWIkD9KI8
         3pidUgU4cAxjqNxmkmMAW/+rMaJLPblL/b05eN90ByiuX0+ZMcyEP5cIne/3JQXoLvAg
         Kb0qbOUDsyozGS1PEk3F0VH/y67fII6VIcm1MNayD6v/w5rTGSGQfJ9AMUH4YyNKBSa0
         tlGQ==
X-Gm-Message-State: AOJu0YzRI2+R33gAk5Fx3h3iDAWlLR20ywIJ+Gqf0LpVy6KSpdVKrHOC
	aSv4OeDHPUxtZgYJVJnVIxMjyR26QiMn72JVv7OH1vxumQ4NhgPQUpQZFSDY37ZzgigV7WxM6S7
	0o4/rKLK/IapFOzg0yHitumXFf4mbZagPlRMoaw==
X-Google-Smtp-Source: AGHT+IFvbOPIqC14llM8jP6iGSoBrvrArEqB+DBAkIuBth+FXOHXH1jxjGddzZzIkCsWvFz2ys2NyCai5+X5R/HI2yU=
X-Received: by 2002:a05:6870:b526:b0:219:b896:ce4d with SMTP id
 v38-20020a056870b52600b00219b896ce4dmr5773659oap.50.1707336003893; Wed, 07
 Feb 2024 12:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20240207060239.2202928-1-raj.khem@gmail.com> <20240207060239.2202928-2-raj.khem@gmail.com>
In-Reply-To: <20240207060239.2202928-2-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Feb 2024 11:59:38 -0800
Message-ID: <CAMKF1sp_9TJH3mcw72qYAAKjrw1fN7pfn2RhXtG0v7x737=ScQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] expat: Upgrade to 2.6.0
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 20:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195077

This will cause a cython ptest regression as reported here

https://github.com/python/cpython/issues/115133

There is a patch proposed for cython and in progress, we can hold on
to this patch for the moment.

On Tue, Feb 6, 2024 at 10:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Package and run benchmark as part of ptest
> This is a major release with following changes [1]
>
> [1] https://github.com/libexpat/libexpat/blob/R_2_6_0/expat/Changes
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/expat/expat/run-ptest                    | 2 +-
>  meta/recipes-core/expat/{expat_2.5.0.bb =3D> expat_2.6.0.bb} | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/expat/{expat_2.5.0.bb =3D> expat_2.6.0.bb} (82%=
)
>
> diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/=
expat/expat/run-ptest
> index dbf602ca800..ff7986db3cf 100644
> --- a/meta/recipes-core/expat/expat/run-ptest
> +++ b/meta/recipes-core/expat/expat/run-ptest
> @@ -5,5 +5,5 @@ TIME=3D$(which time)
>  echo "runtests"
>  ${TIME} -f 'Execution time: %e s' bash -c "./runtests -v"
>  echo "runtestspp"
> -${TIME} -f 'Execution time: %e s' bash -c "./runtestspp -v"
> +${TIME} -f 'Execution time: %e s' bash -c "./runtests_cxx -v"
>  echo
> diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/e=
xpat/expat_2.6.0.bb
> similarity index 82%
> rename from meta/recipes-core/expat/expat_2.5.0.bb
> rename to meta/recipes-core/expat/expat_2.6.0.bb
> index aa8d439d5fb..1f9f7b269a4 100644
> --- a/meta/recipes-core/expat/expat_2.5.0.bb
> +++ b/meta/recipes-core/expat/expat_2.6.0.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
>
> -SRC_URI[sha256sum] =3D "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f=
34998de11969ff67"
> +SRC_URI[sha256sum] =3D "ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12ed0e=
c6f55736b78d85ba"
>
>  EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
>
> @@ -24,7 +24,8 @@ RDEPENDS:${PN}-ptest +=3D "bash"
>  inherit cmake lib_package ptest github-releases
>
>  do_install_ptest:class-target() {
> -       install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
> +       install -m 755 ${B}/tests/runtests* ${D}${PTEST_PATH}
> +       install -m 755 ${B}/tests/benchmark/benchmark ${D}${PTEST_PATH}
>  }
>
>  BBCLASSEXTEND +=3D "native nativesdk"
> --
> 2.43.0
>

