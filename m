Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C8FCF58E2
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 07:25:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.12867.1726817101708271520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 00:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W5c4hdfa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so20627335e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726817100; x=1727421900; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXsveDDUi6Yu+jdy8F2bh5vO5gQIMtW586IkMyOyj+U=;
        b=W5c4hdfa3pvB35I3fwJV3VahOtN13tufXNBPFzLEpSLca2nCx0IBY0qWpxZv0yUcpA
         vFxGdBGOI2qHIp5YejQD17ASd+VKdfFreGQiclgVvjXIEerGt9+Ob2nXABkIsN1uB4B9
         g8qVxehCSCX47zl/9kmrKrmtxiJ4gZxTdxe8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817100; x=1727421900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gXsveDDUi6Yu+jdy8F2bh5vO5gQIMtW586IkMyOyj+U=;
        b=e3jajEBA7Sf0FhlhYi4pEu8QSGhdUvH5CL87pVbpr9XBA+3vNOi1q3xHL1SlnGsZ0R
         N4Io/kV87vM8BlCfzfy85nTA1r/b3xD4f8mpWksKeGI1m2gW4D/LLF7CgaWElk2BzHDp
         ogjSejkRkMMXS3uf990oZjkcXM2ZdadF/JWR3WVhEYrKsq3/EVVKdgj9D8SvJyZ+Zm4/
         srg+fwS7LFUCsZc8miTh55HQ/fhxneYsZKBPnU2YoAgRBayrEe6NxBtltTTm6FNuKqPf
         M0QA14iso0VDfhS/zMfZ+4XOMQ3md3buKIdk7SkNCI+cMNkltZ1MISYNB+6gvqTtQAZV
         gkAg==
X-Forwarded-Encrypted: i=1; AJvYcCWTYcyygf2cBS0PsQYMYlNHCpWudxf/yKW3LYU4L/JRF/UL1+PL3IlzM/gfzP7k0FoAXQUird29vosHvgcX+q2usA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2njNGjSIp1p5WcmtCgdDy0GsWiuxC3bMxX9q25cflYm2L5PIS
	jpwh/MY0U3/aPZH7VURxU5+bpm3nOaitPA+vKIazCohJ9x39pqdY34ntyKlUi0s=
X-Google-Smtp-Source: AGHT+IHdKbBi35GzdyJp8C9I9OpOBKgnOubIJnxbeJOKLqexw5lbdtj/4tanZg4SSvtSu0n1tZyPIw==
X-Received: by 2002:a05:600c:1d12:b0:42c:c401:6d6f with SMTP id 5b1f17b1804b1-42e7ac4b294mr18834015e9.16.1726817099659;
        Fri, 20 Sep 2024 00:24:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe:c6ec:26f9:aa4? ([2001:8b0:aba:5f3c:6fe:c6ec:26f9:aa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754a69a7sm41117925e9.34.2024.09.20.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:24:59 -0700 (PDT)
Message-ID: <334ed194df94eb08545734f935bef3e20a407e91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 01/12] python3-pefile: add recipe from
 meta-openembedded
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2024 08:24:58 +0100
In-Reply-To: <20240919143706.6074-2-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
	 <20240919143706.6074-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 07:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204724

On Thu, 2024-09-19 at 17:36 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> It is needed by systemd ukify tool and uki.bbclass to generate
> UEFI boot binaries.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0.../python/python3-pefile/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0.../python/python3-pefile_2023.2.7.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 28 +++++++++++++++++++
> =C2=A02 files changed, 31 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-pefile/run-=
ptest
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-pefile_2023=
.2.7.bb
>=20
> diff --git a/meta/recipes-devtools/python/python3-pefile/run-ptest b/meta=
/recipes-devtools/python/python3-pefile/run-ptest
> new file mode 100644
> index 0000000000..95ae72306f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pefile/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake --ignore=3D./tests/pefile_test.py
> diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/me=
ta/recipes-devtools/python/python3-pefile_2023.2.7.bb
> new file mode 100644
> index 0000000000..e30b362323
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Python PE parsing module"
> +DESCRIPTION =3D "A multi-platform Python module to parse and work with P=
ortable Executable (PE) files."
> +HOMEPAGE =3D "https://github.com/erocarrera/pefile"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38066667888b01d8118ff9cc23da1=
873"
> +
> +inherit setuptools3 ptest
> +SRCREV =3D "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
> +SRC_URI =3D "git://github.com/erocarrera/pefile;branch=3Dmaster;protocol=
=3Dhttps \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://run-=
ptest"
> +S =3D "${WORKDIR}/git"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_install_ptest() {
> +=C2=A0=C2=A0 install -d ${D}${PTEST_PATH}/tests
> +=C2=A0=C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +RDEPENDS:${PN} +=3D " \
> +=C2=A0=C2=A0=C2=A0 python3-mmap \
> +=C2=A0=C2=A0=C2=A0 python3-netclient \
> +=C2=A0=C2=A0=C2=A0 python3-stringold \
> +"
> +RDEPENDS:${PN}-ptest +=3D "\
> +=C2=A0=C2=A0=C2=A0 python3-pytest \
> +=C2=A0=C2=A0=C2=A0 python3-unittest-automake-output \
> +"

I've not gone into the series in detail but there was testing capacity
so I did run it through that. This recipe caused:

https://valkyrie.yoctoproject.org/#/builders/59/builds/140/steps/11/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/17/builds/144/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/37/builds/169/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/6/builds/153/steps/11/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/3/builds/162/steps/11/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/25/builds/154/steps/11/logs/st=
dio

Cheers,

Richard


