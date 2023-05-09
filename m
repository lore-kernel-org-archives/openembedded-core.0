Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75DEC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 06:43:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.25592.1683614613552032449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 23:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=TdS8Qkjr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-306f2b42a86so3381166f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683614612; x=1686206612;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+0RtcPMLZMZQqAsQt7FkLzPWmtDmG2JLZUyWPva470=;
        b=TdS8QkjrxGfTeqnhq6N9bGlLrfYjLpdkwPQM8VhuDwOdxzqReiguTi9TLNwkeZL4s1
         Ov8ALCr7l0/rZsiH6+HxT6Nb9kbwHA3Yk0G1fSXw9ijsq8ltY1OVuF06J5h+eaCmf8zc
         nkLg2tdYXwEZ9tzVi4S7+npOlKfsCb0eu4kc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683614612; x=1686206612;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+0RtcPMLZMZQqAsQt7FkLzPWmtDmG2JLZUyWPva470=;
        b=R+6sZpQCbwzndpTujZq1iF4PcbvfccQEwPgK4Ok9tuNaej9lqNkNIMhmk7fNlny9E5
         8xWVgNU72vLqih9pVSVUuv1H/nlyMDPSzPfEcAAr2hUOcdRWIe5uHtyW1z7VPau5lMDu
         kvBEdIKqKQAVsfZU/SFcid9DMYeypwYMSESbAv/i7wVxaNbzO+7X28scU1DvW8ZD54KG
         FurylSVSeAXeOeF5GrqA7GGt9y2uJajUZBMXOb4JYa072ESUpxVZA34XlGjPCzzV0NtL
         rCkX2uRhOmRk+aPCRuupMIkEPvptsc7KrggEJNxjW/ndah3m8JOLgOP3U6HSSjXF+/XH
         bEvA==
X-Gm-Message-State: AC+VfDypkX7gcw71ato++k/yjgcLixrC4QkJos3YMFjCg4Bofi3YxEDm
	whg/E5KCsXQHIaLsxfK4qGwgVg==
X-Google-Smtp-Source: ACHHUZ6iM0YmiW6A5+5GPaCV2x3ELN8898J3Sx09O/s9W3uDCqqtRjgwnQpq9Agurip0KFYcizdFoQ==
X-Received: by 2002:a5d:63c3:0:b0:307:809b:614a with SMTP id c3-20020a5d63c3000000b00307809b614amr8808339wrw.29.1683614611764;
        Mon, 08 May 2023 23:43:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:23ab:96f5:f781:1fe8? ([2001:8b0:aba:5f3c:23ab:96f5:f781:1fe8])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d6b52000000b002ff2c39d072sm13321228wrw.104.2023.05.08.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:43:31 -0700 (PDT)
Message-ID: <31965b4662774442d0d1f09099f7df01bf21b9cf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5] python3-calver: Add recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 May 2023 07:43:30 +0100
In-Reply-To: <20230505185121.2063085-1-tgamblin@baylibre.com>
References: <20230505185121.2063085-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 06:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181034

On Fri, 2023-05-05 at 14:51 -0400, Trevor Gamblin wrote:
> calver is "a setuptools extension for automatically defining your Python
> package version as a calendar version." It is required for
> python3-trove-classifiers (another new recipe), which in turn is
> required for the upgrade of python3-hatchling from 1.13.0 to work.
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v5 moves these revision notes to the correct place.
> v4 adds the run-ptest script and adds maintainer info.
> v3 clarifies that the recipe now includes ptests, where v2 didn't make
> this clear and v1 didn't have them at all.
>=20
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../python/python3-calver/run-ptest           |  3 ++
>  .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-calver/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26=
.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 682ec2cfdf..4853a905ef 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -603,6 +603,7 @@ RECIPE_MAINTAINER:pn-python3-attrs =3D "Tim Orling <t=
im.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-babel =3D "Tim Orling <tim.orling@konsulko.=
com>"
>  RECIPE_MAINTAINER:pn-python3-bcrypt =3D "Tim Orling <tim.orling@konsulko=
.com>"
>  RECIPE_MAINTAINER:pn-python3-build =3D "Ross Burton <ross.burton@arm.com=
>"
> +RECIPE_MAINTAINER:pn-python3-calver =3D "Trevor Gamblin <tgamblin@baylib=
re.com>"
>  RECIPE_MAINTAINER:pn-python3-certifi =3D "Tim Orling <tim.orling@konsulk=
o.com>"
>  RECIPE_MAINTAINER:pn-python3-cffi =3D "Tim Orling <tim.orling@konsulko.c=
om>"
>  RECIPE_MAINTAINER:pn-python3-chardet =3D "Tim Orling <tim.orling@konsulk=
o.com>"
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
> diff --git a/meta/recipes-devtools/python/python3-calver/run-ptest b/meta=
/recipes-devtools/python/python3-calver/run-ptest
> new file mode 100644
> index 0000000000..8d2017d39c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-calver/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
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

Fails reproducibility testing I'm afraid:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2824

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230508-ghttew8=
9/packages/diff-html/

Looks like a date encoded into the dist-info directory name.

Cheers,

Richard


