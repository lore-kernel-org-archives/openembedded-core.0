Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADB2C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 01:33:17 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.8999.1683077588603554264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 18:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sM5XVwHC;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6a5ef766282so3704437a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683077587; x=1685669587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g24u6lClGeKB5yK/PANUXf3ybCpNJ/2Q+OoDbpMspfM=;
        b=sM5XVwHCegdHV1UMtvryw9/jgmXj7mhwYYmrckoOyIsXLZXhSbw3psAm2fApCRc/DW
         AYrmXyjqjqXBvPQLvlVWK+zmLVbEGwy6Z9FipR2S6TPduW+oXX86CuCi4FrnlEhS0fV7
         cYLxMTgs+xdKqtbNyTgCcZ2OxsghHutsO0P+WBGcgDOl7b/Dm2Et0E+pS1PdS665908j
         nBmr+u48rBMwLO4IznjYZwziujANVeOp2MPPTu3n4g4tcAULPAcXDLpCA5gDVFthxikQ
         mF/KhHoylTGXg8mLKblkpuLwNXj/90GNv22Pg/3JBLeqEjNwh1bmoAVbDcRHrKji45Du
         WArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683077587; x=1685669587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g24u6lClGeKB5yK/PANUXf3ybCpNJ/2Q+OoDbpMspfM=;
        b=QWWGY1sz1pNxn8E71ffH0VkXanDLy8axRqYNcIxgVhbBnjk/wPqGRtbIApEjNpqzF0
         dIYB2/izkUZzWr1RqhHWzGiEvocitktni2OY895awAiEGAbRbSsDAzOuKAAE3bC7JqDs
         4OE5JWHg6I8Ot+Us/m6r4vX6eALwxjv8pyFKnGvAwiMz3a2iP8idWfSML4SEIz9vuD/v
         iU1v10oOkrrXbWDIjbEzlu023jHmmY/0neTx88a634gY4SRP9aQjgERbypilD+ValLTq
         LmsX3L7JT9YlwpFwnqh4AxRthraj2+nKiOBD+NYc/Da387WPacKOID2JRwFMz+QjEGef
         JlRw==
X-Gm-Message-State: AC+VfDwhK8O9hQe0zRnuiG33sVh0VuwwnbuV0HHikp8tIgpWSpJgU4ty
	nm1Q/sdsGrui+gsuQFan+fZWz07zjsJEUbKv71UIX6GCcN4=
X-Google-Smtp-Source: ACHHUZ7gPKNVm8qOI1a+xBThI1GdTVstAQhpz56ZZCKsFezgKtnWnBnv1OF4Hkzv5+p308VgObSmNfHrw8Wtwd48vHs=
X-Received: by 2002:a05:6830:1042:b0:696:1583:642 with SMTP id
 b2-20020a056830104200b0069615830642mr10330378otp.21.1683077587556; Tue, 02
 May 2023 18:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230502174300.2261694-1-tgamblin@baylibre.com>
In-Reply-To: <20230502174300.2261694-1-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 18:32:41 -0700
Message-ID: <CAMKF1srR7Xoj8rFi6XPRvGZOqLzg0+RtZUayBqvQsvQLtSPs_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] python3-calver: Add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 01:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180781

On Tue, May 2, 2023 at 10:43=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
> calver is "a setuptools extension for automatically defining your Python
> package version as a calendar version." It is required for
> python3-trove-classifiers (another new recipe), which in turn is
> required for the upgrade of python3-hatchling from 1.13.0 to work.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26=
.bb
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 2f83132aeb..bd95a13ff6 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -56,6 +56,7 @@ PTESTS_FAST =3D "\
>      popt \
>      python3-atomicwrites \
>      python3-bcrypt \
> +    python3-calver \
>      python3-hypothesis \
>      python3-jinja2 \
>      python3-jsonpointer \
> diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/m=
eta/recipes-devtools/python/python3-calver_2022.6.26.bb
> new file mode 100644
> index 0000000000..32b6cfbd42
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Setuptools extension for CalVer package versions"
> +HOMEPAGE =3D "https://github.com/di/calver"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +
> +SRC_URI =3D " \
> +    git://github.com/di/calver;branch=3Dmaster;protocol=3Dhttps \
> +    file://run-ptest \

run-ptest is in SRC_URI but I dont see it anywere added in patch
series, perhaps it got missed in git add ?

> +"
> +SRC_URI[sha256sum] =3D "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d3=
3fd4a52d74894f8b"
> +SRCREV ?=3D "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
> +
> +inherit python_setuptools_build_meta ptest
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-pretend \
> +    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests ${D}${PTEST_PATH}/
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180763): https://lists.openembedded.org/g/openembedde=
d-core/message/180763
> Mute This Topic: https://lists.openembedded.org/mt/98644392/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

