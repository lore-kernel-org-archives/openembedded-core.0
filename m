Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC038C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:29:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.10482.1647613793082693836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 07:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=40kgt+Kh;
 spf=pass (domain: burtonini.com, ip: 209.85.128.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f48.google.com with SMTP id r7so4952228wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9tn3YT7W3YEoOzeeE7QlZ6dKhkMWCL1KyWQmAsnq//o=;
        b=40kgt+KhWRRl1lvx188QvCPcMnEdRLJUuogjuNCGH/VDVTLz3BsUvT1Bp4rry8g48D
         Rod/QCJpVxf4h2O65algrJrvkqNLN9wMNkTNyeYjiQpa3cYoUt8IOH2yr+eTvBNBqh5O
         xkL2GvtiOeGoTkgjythC23mdGgEktYVqv6DZDaqurxLGZfrGNtSiYLZh3QBBXpj+MxLO
         y0eZ1cso0rO95ce5AxQa0o1AL1rCrpmxelZ6LPDIX7YMJFAJ2Q27qDy0HCN+jRff+4yQ
         LOIbpQqfltWs7b+tQpn79+aYIhRH653iR7UJWjiFyaLfdxCukh/jaE8B+JlVGWlfdiqi
         Z3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9tn3YT7W3YEoOzeeE7QlZ6dKhkMWCL1KyWQmAsnq//o=;
        b=1s3F2vg9pxxBvMjNROxpTZ08cyHC/vbg/vQV2AphzM859pho0muTkF7wJn1XbbGA/l
         TBuEIaHUg74u9Tpdzk86SspR39eduFsrd3e+tCVIcmMx5jRirvR++OYs8hI8IC9WtU02
         V35+bC1OHyDO7LNYb2mLIJ1RUR2bClF+BbMnsZ1fvYyfZxNY8Gju4/VladtHbPUAC8nE
         Tp32xBBXkHsKi+7ljdmj0k/+EPi+mx9V+Hbp6EAjd3BDOavOEtncdwfB/8iQDiQet/PH
         WBNiyrVjvaqJSEyZpiwpRFSkzTkSqIaixqUBmzBvzJ40rnR43klnMpfLvKwegI9QP+7m
         /TGA==
X-Gm-Message-State: AOAM532+AX4Fyk20eHRcFPX9W14tU+YyO5ENhzc8xtIzhOg/Ksjl4gKX
	gP7UWCq58JWphCEuC/Nzwtk0UWsSUFy6qslHRdIJOA==
X-Google-Smtp-Source: 
 ABdhPJzt24eQP/Gfh9YhuYuL+oorl5XcpmPsDozZAXGsnejheGNO48Dj8JPk7Roe/J2H/xWOXBGQKEL3CEP0lkMDG/c=
X-Received: by 2002:a05:600c:2185:b0:38c:9091:892 with SMTP id
 e5-20020a05600c218500b0038c90910892mr581605wme.14.1647613791352; Fri, 18 Mar
 2022 07:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220318123645.508085-1-ross.burton@arm.com>
 <CAMKF1sqgpWPydnX_Ccodzm4uEf+fYD2h2maQzX1gkcrRw27ULw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqgpWPydnX_Ccodzm4uEf+fYD2h2maQzX1gkcrRw27ULw@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 18 Mar 2022 14:29:40 +0000
Message-ID: 
 <CAAnfSTv8t7mFKxEqfTXbXiFv_+RGp9Jayb3=kHWfMOoc1us+Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/setuptools_build_meta: rename to
 python_setuptools_build_meta
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 14:29:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163450

Good point, thanks.

Ross

On Fri, 18 Mar 2022 at 13:58, Khem Raj <raj.khem@gmail.com> wrote:
>
> there are few recipes in  master-next which will need this renaming
> too. So perhaps rebase it on top of master-next
>
> On Fri, Mar 18, 2022 at 5:36 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Rename this class to be python-prefixed to match the other new Python
> > build system classes.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  ..._build_meta.bbclass => python_setuptools_build_meta.bbclass} | 0
> >  meta/recipes-devtools/meson/meson_0.61.2.bb                     | 2 +-
> >  meta/recipes-devtools/python/python3-attrs_21.4.0.bb            | 2 +-
> >  meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb            | 2 +-
> >  meta/recipes-devtools/python/python3-git_3.1.27.bb              | 2 +-
> >  .../python/python3-importlib-metadata_4.11.3.bb                 | 2 +-
> >  meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb         | 2 +-
> >  meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb        | 2 +-
> >  meta/recipes-devtools/python/python3-mako_1.1.6.bb              | 2 +-
> >  meta/recipes-devtools/python/python3-markdown_3.3.6.bb          | 2 +-
> >  meta/recipes-devtools/python/python3-packaging_21.3.bb          | 2 +-
> >  meta/recipes-devtools/python/python3-pip_22.0.3.bb              | 2 +-
> >  meta/recipes-devtools/python/python3-pluggy_1.0.0.bb            | 2 +-
> >  meta/recipes-devtools/python/python3-py_1.11.0.bb               | 2 +-
> >  meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb       | 2 +-
> >  meta/recipes-devtools/python/python3-pytest_7.0.1.bb            | 2 +-
> >  meta/recipes-devtools/python/python3-pyyaml_6.0.bb              | 2 +-
> >  .../python/python3-setuptools-rust-native_1.1.2.bb              | 2 +-
> >  meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb    | 2 +-
> >  meta/recipes-devtools/python/python3-setuptools_59.5.0.bb       | 2 +-
> >  meta/recipes-devtools/python/python3-zipp_3.7.0.bb              | 2 +-
> >  21 files changed, 20 insertions(+), 20 deletions(-)
> >  rename meta/classes/{setuptools_build_meta.bbclass => python_setuptools_build_meta.bbclass} (100%)
> >
> > diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/python_setuptools_build_meta.bbclass
> > similarity index 100%
> > rename from meta/classes/setuptools_build_meta.bbclass
> > rename to meta/classes/python_setuptools_build_meta.bbclass
> > diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-devtools/meson/meson_0.61.2.bb
> > index 8304bfdac98..356f00ce875 100644
> > --- a/meta/recipes-devtools/meson/meson_0.61.2.bb
> > +++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
> > @@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb
> >  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> >  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > -inherit setuptools_build_meta
> > +inherit python_setuptools_build_meta
> >
> >  RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
> >
> > diff --git a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
> > index 20e4541f81c..1839ce62450 100644
> > --- a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
> > +++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
> >
> >  SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  RDEPENDS:${PN}:class-target += " \
> >      ${PYTHON_PN}-crypt \
> > diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
> > index 731aff299ba..6a4d1aef5cc 100644
> > --- a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
> > +++ b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
> > @@ -8,7 +8,7 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
> >  SRC_URI[md5sum] = "fe31390dab603728f756cd3d6830c80a"
> >  SRC_URI[sha256sum] = "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
> >
> > -inherit pypi setuptools_build_meta ptest
> > +inherit pypi python_setuptools_build_meta ptest
> >
> >  SRC_URI += " \
> >         file://run-ptest \
> > diff --git a/meta/recipes-devtools/python/python3-git_3.1.27.bb b/meta/recipes-devtools/python/python3-git_3.1.27.bb
> > index 3e7aa883f21..fb1bae8f8e4 100644
> > --- a/meta/recipes-devtools/python/python3-git_3.1.27.bb
> > +++ b/meta/recipes-devtools/python/python3-git_3.1.27.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
> >
> >  PYPI_PACKAGE = "GitPython"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  SRC_URI[sha256sum] = "1c885ce809e8ba2d88a29befeb385fcea06338d3640712b59ca623c220bb5704"
> >
> > diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
> > index b2da69b0551..d8e56ccb253 100644
> > --- a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
> > +++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  PYPI_PACKAGE = "importlib_metadata"
> >  UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
> > diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> > index 5338980e699..4643437b800 100644
> > --- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> > +++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
> > @@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4
> >
> >  DEPENDS += "python3-setuptools-scm-native"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> > diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
> > index 4c142296410..10b39e76b2d 100644
> > --- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
> > +++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
> >
> >  SRC_URI[sha256sum] = "636694eb41b3535ed608fe04129f26542b59ed99808b4f688aa32dcf55317a83"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
> >
> > diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> > index 23e13cff948..71e5d96ba1c 100644
> > --- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> > +++ b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
> >
> >  PYPI_PACKAGE = "Mako"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
> >
> > diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb b/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
> > index a46a9ae0667..5ce9fef7dd6 100644
> > --- a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
> > +++ b/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE = "https://python-markdown.github.io/"
> >  LICENSE = "BSD-3-Clause"
> >  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  PYPI_PACKAGE = "Markdown"
> >  SRC_URI[sha256sum] = "76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed1ecdb1e8cefc7006"
> > diff --git a/meta/recipes-devtools/python/python3-packaging_21.3.bb b/meta/recipes-devtools/python/python3-packaging_21.3.bb
> > index a81fd94d37a..e3b9a440c4e 100644
> > --- a/meta/recipes-devtools/python/python3-packaging_21.3.bb
> > +++ b/meta/recipes-devtools/python/python3-packaging_21.3.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
> >
> >  SRC_URI[sha256sum] = "dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
> > index 9ca8fbc1e5a..ee3e578b2c8 100644
> > --- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
> > +++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
> > @@ -4,7 +4,7 @@ SECTION = "devel/python"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  SRC_URI += "file://0001-change-shebang-to-python3.patch"
> >  SRC_URI += "file://no_shebang_mangling.patch"
> > diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
> > index 73bbcb02697..3f2895a061b 100644
> > --- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
> > +++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
> > @@ -10,7 +10,7 @@ RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
> >                     ${PYTHON_PN}-more-itertools \
> >  "
> >
> > -inherit pypi ptest setuptools_build_meta
> > +inherit pypi ptest python_setuptools_build_meta
> >
> >  SRC_URI += " \
> >         file://run-ptest \
> > diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
> > index 02027248f46..a2bd2d84fc1 100644
> > --- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
> > +++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
> > @@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4
> >
> >  DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
> > index ecd55672f5e..b4d9e3af393 100644
> > --- a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
> > +++ b/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e"
> >
> >  SRC_URI[sha256sum] = "d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  RDEPENDS:${PN} += " \
> >      ${PYTHON_PN}-numbers \
> > diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
> > index ea6ba80300a..19eb9b15e80 100644
> > --- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
> > +++ b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
> > @@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd498
> >
> >  DEPENDS += "python3-setuptools-scm-native"
> >
> > -inherit update-alternatives pypi setuptools_build_meta
> > +inherit update-alternatives pypi python_setuptools_build_meta
> >
> >  RDEPENDS:${PN}:class-target += " \
> >      ${PYTHON_PN}-atomicwrites \
> > diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
> > index 6fe726110db..d142a0fc3e2 100644
> > --- a/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
> > +++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
> >
> >  PYPI_PACKAGE = "PyYAML"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  SRC_URI[sha256sum] = "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2"
> >
> > diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
> > index bac7b6434a5..8ec9a86f007 100644
> > --- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
> > +++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
> > @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
> >  SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
> >  SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
> >
> > -inherit cargo pypi setuptools_build_meta native
> > +inherit cargo pypi python_setuptools_build_meta native
> >
> >  DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
> >
> > diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
> > index 182ccecbbfc..e09c598bf52 100644
> > --- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
> > +++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
> >  SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
> >
> >  PYPI_PACKAGE = "setuptools_scm"
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
> >
> > diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> > index 35bec19e33d..f2810e18d31 100644
> > --- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> > +++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> > @@ -4,7 +4,7 @@ SECTION = "devel/python"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=7a7126e068206290f3fe9f8d6c713ea6"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
> >
> > diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
> > index d0f936faf7c..495e7f51f01 100644
> > --- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
> > +++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
> > @@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebce
> >
> >  DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> >
> > -inherit pypi setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta
> >
> >  DEPENDS += "${PYTHON_PN}-toml-native"
> >
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163448): https://lists.openembedded.org/g/openembedded-core/message/163448
> > Mute This Topic: https://lists.openembedded.org/mt/89866907/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

