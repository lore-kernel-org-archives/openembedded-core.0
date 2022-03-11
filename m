Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBF9C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 12:03:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.4529.1647000178546501836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=KMos+yo2;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so947672wme.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=bodeokY8npciF3N1WNceooINDayOjJfMCUc4mk+Slbs=;
        b=KMos+yo2B06g9cSMotlm0MN3/ZJl5641sVl5FazjehBGf0dH5cmnCXUUMSyk2v2ZYM
         5RsQgM8UILOlQqhM9od4wIINY0tDHWKuADviQqUHCunuOiIWlEluDmRrZsT/01rP5aJP
         DFyvckXEhEvgBzyenFyscZzvVSFIkSzO53JFtWkNFfYzFExvsSg0SuTu13/P6tsoopgF
         qJ/SNzFoIpUvHTGtMumr5Uth7Ze1rR0wZ9hB9CyUTVg2DFw6fpv/NCuhpjb0C4m3cNDs
         cMZq3x1de4MnsEWkFkepJzsQFzAFxbChVxuFSGejA9q9zyz4uLBGJ/3jgslBcOOd31A1
         NjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=bodeokY8npciF3N1WNceooINDayOjJfMCUc4mk+Slbs=;
        b=hcxv8lNk3vytvpOVEKdbI8ogC3E/BqlKer7iGD3IVaIHvspceLcQ7hcoP2hpFS1WeK
         YsDmMtHIvz7tUFKknyRTZMRCL15jn4bI6v6eadVLuIW2nz81RnyoKW57oQpRN0WXRxz7
         lVKexgZ9goadlbCjby9atCqwPiNypgAXChlbv4aA0M17d3o+9P7WD0/VyugrMQk8fAP/
         BFxL+vvw3r83yKYLs9oOEB3rd3ZZ6GhyEzyHRy0WiSC+93dvyXuoCB2DFz9eKjeHhDqm
         xxyT0MzK6jglatD7KPdaEV/oQpAN7G2FyNlSs8vDl4QiO5veSAvbv6oxE7i3J0pcbFK+
         aUDA==
X-Gm-Message-State: AOAM533KqmRh/9GuZ2YWPKp53LxZKjXKDcRvRc8Tc0eLHnAHBbiYnjsL
	1KsmdOx94Iw3mIddcA3wlBTJkOnOvkbv4jlEgJIkF6hoNHMvOQ==
X-Google-Smtp-Source: 
 ABdhPJw1Iejwmz/ZEmlYM0JKBIPoI9HoCAHoO1c8VlgYpoeFmhm+AXzDuWUzI8VV430ZwcWtY73XtlBB4mrbl1hpTBM=
X-Received: by 2002:a05:600c:2219:b0:389:bc8b:ac48 with SMTP id
 z25-20020a05600c221900b00389bc8bac48mr14984429wml.14.1647000176465; Fri, 11
 Mar 2022 04:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20220311120205.3020751-1-ross.burton@arm.com>
 <20220311120205.3020751-2-ross.burton@arm.com>
In-Reply-To: <20220311120205.3020751-2-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 11 Mar 2022 12:02:45 +0000
Message-ID: 
 <CAAnfSTup9KVFq6toWtQbAo3svQLJF=-20-qPHP1ruW2KXHgMvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] meta: rename pip_install_wheel.bbclass to
 python_pep517.bbclass
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 12:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163050

A fixup failed to land in this, v2 incoming.

Ross

On Fri, 11 Mar 2022 at 12:02, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> pip_install_wheel shouldn't restricted to just using Pip to install
> wheels (the installer module is simplier and likely a better option),
> and in the future may be extended to also provide do_compile() using
> the build module.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/flit_core.bbclass                |  6 ++---
>  ...ll_wheel.bbclass => python_pep517.bbclass} | 27 ++++++++++---------
>  meta/classes/setuptools3.bbclass              |  8 +++---
>  meta/classes/setuptools_build_meta.bbclass    |  6 ++---
>  .../python/python3-flit-core_3.7.1.bb         |  2 +-
>  .../python/python3-wheel_0.37.1.bb            |  2 +-
>  6 files changed, 27 insertions(+), 24 deletions(-)
>  rename meta/classes/{pip_install_wheel.bbclass => python_pep517.bbclass} (56%)
>
> diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
> index ce162bb75b..1ef8ce9429 100644
> --- a/meta/classes/flit_core.bbclass
> +++ b/meta/classes/flit_core.bbclass
> @@ -1,4 +1,4 @@
> -inherit pip_install_wheel python3native python3-dir setuptools3-base
> +inherit python_pep517 python3native python3-dir setuptools3-base
>
>  DEPENDS += "python3 python3-flit-core-native"
>
> @@ -12,8 +12,8 @@ PEP517_SOURCE_PATH ?= "${S}"
>  # TODO: ideally this uses pypa/build
>  flit_core_do_compile () {
>      cd ${PEP517_SOURCE_PATH}
> -    nativepython3 -mflit_core.wheel --outdir ${PIP_INSTALL_DIST_PATH}
> +    nativepython3 -mflit_core.wheel --outdir ${PEP517_WHEEL_PATH}
>  }
> -do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
> +do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
>
>  EXPORT_FUNCTIONS do_configure do_compile
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/python_pep517.bbclass
> similarity index 56%
> rename from meta/classes/pip_install_wheel.bbclass
> rename to meta/classes/python_pep517.bbclass
> index 29cd544aa3..76660e70f8 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/python_pep517.bbclass
> @@ -1,9 +1,12 @@
> +# Common infrastructure for Python packages that use PEP-517 compliant packaging.
> +# https://www.python.org/dev/peps/pep-0517/
> +
>  DEPENDS:append = " python3-pip-native"
>
>  # The directory where wheels should be written too. Build classes
>  # will ideally [cleandirs] this but we don't do that here in case
>  # a recipe wants to install prebuilt wheels.
> -PIP_INSTALL_DIST_PATH ?= "${WORKDIR}/dist"
> +PEP517_WHEEL_PATH ?= "${WORKDIR}/dist"
>
>  PIP_INSTALL_ARGS = "\
>      -vvvv \
> @@ -15,24 +18,24 @@ PIP_INSTALL_ARGS = "\
>      --prefix=${prefix} \
>  "
>
> -PIP_INSTALL_PYTHON = "python3"
> -PIP_INSTALL_PYTHON:class-native = "nativepython3"
> +PEP517_INSTALL_PYTHON = "python3"
> +PEP517_INSTALL_PYTHON:class-native = "nativepython3"
>
> -pip_install_wheel_do_install () {
> -    COUNT=$(find ${PIP_INSTALL_DIST_PATH} -name '*.whl' | wc -l)
> +python_pep517_do_install () {
> +    COUNT=$(find ${PEP517_WHEEL_PATH} -name '*.whl' | wc -l)
>      if test $COUNT -eq 0; then
> -        bbfatal No wheels found in ${PIP_INSTALL_DIST_PATH}
> +        bbfatal No wheels found in ${PEP517_WHEEL_PATH}
>      elif test $COUNT -gt 1; then
> -        bbfatal More than one wheel found in ${PIP_INSTALL_DIST_PATH}, this should not happen
> +        bbfatal More than one wheel found in ${PEP517_WHEEL_PATH}, this should not happen
>      fi
>
> -    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PIP_INSTALL_DIST_PATH}/*.whl
> +    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PEP517_WHEEL_PATH}/*.whl
>
>      cd ${D}
>      for i in ${D}${bindir}/* ${D}${sbindir}/*; do
>          if [ -f "$i" ]; then
> -            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
> -            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
> +            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}," $i
> +            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PEP517_INSTALL_PYTHON}:g" $i
>              sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
>              # Not everything we find may be Python, so ignore errors
>              nativepython3 -mpy_compile $(realpath --relative-to=${D} $i) || true
> @@ -41,9 +44,9 @@ pip_install_wheel_do_install () {
>  }
>
>  # A manual do_install that just uses unzip for bootstrapping purposes. Callers should DEPEND on unzip-native.
> -pip_install_wheel_do_bootstrap_install () {
> +python_pep517_do_bootstrap_install () {
>      install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> +    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PEP517_WHEEL_PATH}/*.whl
>  }
>
>  EXPORT_FUNCTIONS do_install
> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
> index dcf3561b8d..556bc801af 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -1,4 +1,4 @@
> -inherit setuptools3-base pip_install_wheel
> +inherit setuptools3-base python_pep517
>
>  # bdist_wheel builds in ./dist
>  #B = "${WORKDIR}/build"
> @@ -17,14 +17,14 @@ setuptools3_do_compile() {
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
> -        bdist_wheel --verbose --dist-dir ${PIP_INSTALL_DIST_PATH} ${SETUPTOOLS_BUILD_ARGS} || \
> +        bdist_wheel --verbose --dist-dir ${PEP517_WHEEL_PATH} ${SETUPTOOLS_BUILD_ARGS} || \
>          bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUILD_ARGS}' execution failed."
>  }
>  setuptools3_do_compile[vardepsexclude] = "MACHINE"
> -do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
> +do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
>
>  setuptools3_do_install() {
> -        pip_install_wheel_do_install
> +        python_pep517_do_install
>  }
>
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setuptools_build_meta.bbclass
> index 787fbd5f36..424be85608 100644
> --- a/meta/classes/setuptools_build_meta.bbclass
> +++ b/meta/classes/setuptools_build_meta.bbclass
> @@ -1,4 +1,4 @@
> -inherit pip_install_wheel setuptools3-base
> +inherit setuptools3-base python_pep517
>
>  DEPENDS += "python3-setuptools-native python3-wheel-native"
>
> @@ -12,8 +12,8 @@ setuptools_build_meta_do_configure () {
>  # TODO: ideally this uses pypa/build
>  setuptools_build_meta_do_compile () {
>      cd ${PEP517_SOURCE_PATH}
> -    nativepython3 -c "from setuptools import build_meta; build_meta.build_wheel('${PIP_INSTALL_DIST_PATH}')"
> +    nativepython3 -c "from setuptools import build_meta; build_meta.build_wheel('${PEP517_WHEEL_PATH}')"
>  }
> -do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
> +do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
>
>  EXPORT_FUNCTIONS do_configure do_compile
> diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
> index 1f14345d50..b12b8e42d7 100644
> --- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
> +++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
> @@ -21,7 +21,7 @@ PYPI_PACKAGE = "flit"
>  PEP517_SOURCE_PATH = "${S}/flit_core"
>
>  do_install:class-native () {
> -    pip_install_wheel_do_bootstrap_install
> +    python_pep517_do_bootstrap_install
>  }
>
>  PACKAGES =+ "${PN}-tests"
> diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> index cf0d8191b4..a339e65824 100644
> --- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> +++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> @@ -13,7 +13,7 @@ SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
>  DEPENDS:remove:class-native = "python3-pip-native"
>
>  do_install:class-native () {
> -    pip_install_wheel_do_bootstrap_install
> +    python_pep517_do_bootstrap_install
>
>      # pip install would normally generate [project.scripts] in ${bindir}
>      install -d ${D}/${bindir}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163049): https://lists.openembedded.org/g/openembedded-core/message/163049
> Mute This Topic: https://lists.openembedded.org/mt/89708482/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

