Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 82D9071C7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 20:29:28 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id 35so22885916uak.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 12:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ET2oOC6+ZBvf5nx0kPvaYPcAO2icTzwLFhzti1sh/uk=;
	b=qLeesVg0EaGJBpdsydwE/v7deAcDkcJh+Hsdvb21fVBlZCwOdZ0K44tje2WyVzRkHd
	6NXEoYexKBHO24H2zqj55S9+Dv4Ujmjx2sFwKW+UbJev7HzE0YAoBqIQXZV4hYSgCXE7
	FhtUL/Y91zOjceyZr4MmlaOcfs3czJblzbzrOILxUOU1GU7/l6b2cmm17jK12fuDFfDk
	SCwfSVgQtP7ilJ21IJ216Sfkd9+Q9f7X6+cxCNA1lArU7JmOf14gQrLMtyfORWSfKaDJ
	2+wVVVQLO7gxOIMGjPf7UmGPZMdVH286ZOZfJ4zPPqNGRlMTKjzTQFDxlmRsVOstXVLj
	B/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ET2oOC6+ZBvf5nx0kPvaYPcAO2icTzwLFhzti1sh/uk=;
	b=rNiniDnvzDzEQAmkyOQlTzaqRSHUlpTWS4rc+fWMK0K8lZNh4/rOqV+qVdmQLTeI5C
	8Pb9AzaFvLo+q4CLQ6YEWuXLsXR9UblpgIe8qz9Gxxmamb4gLACP12eohbe+/ZBMDRKw
	NkUxYjzwAR0Lppp0z7V1xz3OwNUvy9xtaQIBzpLXwb4kO9HTAm5Bj8g/D5poQzPwlVSb
	fONCx/5kXdzM6hNqrvJUfmbLSabwezTorTu9RHaykyIL+p1HpAxNfvWeuzn/+S+Q5yM6
	Z+PiBr4b86OL9Vuj/H8H2Ts2aOH18ZppFGwbEC/QnaJ8w4qFbi59WyZ9lUWRDxv2sX4/
	yN1Q==
X-Gm-Message-State: AIkVDXIiG7Tr10NMmpehzaM81Eck2wvRvQvg5LcmUPPgjrVtbkiTmeo5XrBvfQkbIiRz3T5kdD9Jd95QZV8MZQ==
X-Received: by 10.159.55.142 with SMTP id q14mr8892571uaq.107.1484252968630;
	Thu, 12 Jan 2017 12:29:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 12 Jan 2017 12:28:58 -0800 (PST)
In-Reply-To: <1484250364-30461-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1484250364-30461-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jan 2017 12:28:58 -0800
Message-ID: <CAMKF1spRgcUQ0_cnsFdJojA1fFwXUtGBc_Zgh69snu6SbbnLkQ@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-setuptools: upgrade to 31.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2017 20:29:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 12, 2017 at 11:46 AM, Edwin Plauchu
<edwin.plauchu.camacho@linux.intel.com> wrote:
> It is a simultaneous upgrade for python 2 and 3 over setuptools.
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc |  4 +--
>  .../python/python-setuptools_32.1.1.bb             | 38 ++++++++++++++++++++++
>  .../python/python3-setuptools_32.1.1.bb            | 37 +++++++++++++++++++++
>  3 files changed, 77 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python-setuptools_32.1.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
>

I dont see 31.0.0 recipe being deleted with this update. Is there a
reason for that ?

> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
> index 858595c..40f47d4 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -9,8 +9,8 @@ SRCNAME = "setuptools"
>
>  SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "66da89eeb1f33c2b947f316cfb3d7c7e"
> -SRC_URI[sha256sum] = "0818cc0de692c3a5c83ca83aa7ec7ba6bc206f278735f1e0267b8d0e095cfe7a"
> +SRC_URI[md5sum] = "8b67868c3430e978833ebd0d1b766694"
> +SRC_URI[sha256sum] = "8303fb24306385f09bf8b0e5a385c1548e42e8efc08558d64049bc0d55ea012d"
>
>  UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
>
> diff --git a/meta/recipes-devtools/python/python-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python-setuptools_32.1.1.bb
> new file mode 100644
> index 0000000..526474c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-setuptools_32.1.1.bb
> @@ -0,0 +1,38 @@
> +require python-setuptools.inc
> +
> +PROVIDES = "python-distribute"
> +
> +DEPENDS += "python"
> +DEPENDS_class-native += "python-native"
> +
> +inherit distutils
> +
> +DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
> +
> +RDEPENDS_${PN} = "\
> +  python-stringold \
> +  python-email \
> +  python-shell \
> +  python-distutils \
> +  python-compression \
> +  python-pkgutil \
> +  python-plistlib \
> +  python-numbers \
> +  python-html \
> +  python-netserver \
> +  python-ctypes \
> +  python-subprocess \
> +  python-unittest \
> +  python-compile \
> +"
> +
> +RDEPENDS_${PN}_class-native = "\
> +  python-distutils \
> +  python-compression \
> +"
> +
> +RREPLACES_${PN} = "python-distribute"
> +RPROVIDES_${PN} = "python-distribute"
> +RCONFLICTS_${PN} = "python-distribute"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
> new file mode 100644
> index 0000000..65af6f0
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
> @@ -0,0 +1,37 @@
> +require python-setuptools.inc
> +
> +DEPENDS += "python3"
> +DEPENDS_class-native += "python3-native"
> +
> +inherit distutils3
> +
> +DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
> +
> +# The installer puts the wrong path in the setuptools.pth file.  Correct it.
> +do_install_append() {
> +    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
> +    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
> +    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
> +}
> +
> +RDEPENDS_${PN} = "\
> +  python3-distutils \
> +  python3-compression \
> +"
> +RDEPENDS_${PN}_class-target = "\
> +  python3-ctypes \
> +  python3-distutils \
> +  python3-email \
> +  python3-importlib \
> +  python3-numbers \
> +  python3-compression \
> +  python3-shell \
> +  python3-subprocess \
> +  python3-textutils \
> +  python3-pkgutil \
> +  python3-threading \
> +  python3-misc \
> +  python3-unittest \
> +  python3-xml \
> +"
> +BBCLASSEXTEND = "native"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

