Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 374F977071
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 12:24:49 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h5so16047450igh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=A8if1bZ0vVk0tPCq9o+F/AfO1RnCUvjR1+4iGwGsNDQ=;
	b=UBX52TSY2gSbzpuarQnNKzlkviIX2DoMZKSu9hO8z7F0FrVO2cNc8c6ONP0StJ7gFB
	K8fCpEfvjGTZcTtzX3Wov/EDmYUbxbxO4ZdwjVW9dXUZsDHkyBLNcp1lNLwTq1vThLFf
	Tj2AwWEL1IGuvjWYPMcSMqZyWO0SpalWohQkv5e9r6CjipTef4FrMncWqF00Fwy90pou
	HrB9YOALXrPvcrTnYHLasUH4QWf+mrDdLtF28teBw2V8Y17Z7dALfED7Gw5ugKh6IJBV
	0F+WNlCifn9+jRA0noAMyWSWmRVXVIOZsaMukDaBLqQhhrslEEReT0YMJNFcBoh1uy9l
	R6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A8if1bZ0vVk0tPCq9o+F/AfO1RnCUvjR1+4iGwGsNDQ=;
	b=isHCIu9LfM+zHz7ql/NBK7F2Bf6vUeGGgaJQm0+S1iLV3PLAO6Vfri+FVXfBk+2Fc2
	EpDv6BeYIPQjItEfN8IjoHj6E7pv494k3Vz+tX4nYyMjW9J0dFDLTMSZPtR1pDtoYWQz
	O/I0MTyZOGCpr7VcNh4F54arTOzH8kCyo/h4UNcsv9mkrqrhlZ4I2ju9K3R8dFIWfxvB
	KThebNSOAh16ziKrlSsYOp59uIqsvVGZe0JzW5Et4gtSm4dPZqklEUnf25sv77cuwakK
	yrKxadIEvXOrb50hPX8nmEdqcuI0SKV8emdLlR5f/BXm0wdkgyJv386PFPhUsyCPwFEX
	WfUw==
X-Gm-Message-State: AG10YOS+5K9ocdAZf9PaK2LOpLK/h3p5gS/uAklwQYIf83sZ7tTggQN09773m7oh7kFHHFtRYTPAs+gMWV6+YS8i
X-Received: by 10.50.111.111 with SMTP id ih15mr12968024igb.78.1453638290547; 
	Sun, 24 Jan 2016 04:24:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sun, 24 Jan 2016 04:24:31 -0800 (PST)
In-Reply-To: <c4f289c43b404d30da3f0a77a4971ea84d7f97ea.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
	<c4f289c43b404d30da3f0a77a4971ea84d7f97ea.1453589999.git.derek@asterius.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 24 Jan 2016 12:24:31 +0000
Message-ID: <CAJTo0LZiU4D2ZN7dqb2DkZ1NgTbsArgNjFgS--8+=OPVeMjbog@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 01/13] meta-python: update pypi class to avoid setuptool inherit to be more flexible
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
X-List-Received-Date: Sun, 24 Jan 2016 12:24:51 -0000
Content-Type: multipart/alternative; boundary=089e0149be34f0c6ee052a1389f3

--089e0149be34f0c6ee052a1389f3
Content-Type: text/plain; charset=UTF-8

Hi Derek,

Wrong list I'm afraid - patches for meta-oe should go to openembedded-devel@
.

Ross

On 23 January 2016 at 23:09, Derek Straka <derek@asterius.io> wrote:

> ---
>  meta-python/classes/pypi.bbclass                               | 4 +---
>  meta-python/recipes-devtools/python/python-cffi_1.3.1.bb       | 3 +--
>  meta-python/recipes-devtools/python/python-chardet_2.3.0.bb    | 2 +-
>  meta-python/recipes-devtools/python/python-cryptography_1.1.bb | 4 ++--
>  meta-python/recipes-devtools/python/python-enum34_1.0.4.bb     | 2 +-
>  meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb   | 2 +-
>  meta-python/recipes-devtools/python/python-monotonic_0.4.bb    | 2 +-
>  meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb    | 2 +-
>  meta-python/recipes-devtools/python/python-pretend_1.0.8.bb    | 2 +-
>  meta-python/recipes-devtools/python/python-psutil_2.2.1.bb     | 2 +-
>  meta-python/recipes-devtools/python/python-py_1.4.26.bb        | 2 +-
>  meta-python/recipes-devtools/python/python-pycparser_2.10.bb   | 2 +-
>  meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb  | 2 +-
>  meta-python/recipes-devtools/python/python-pytest_2.7.0.bb     | 2 +-
>  meta-python/recipes-devtools/python/python-six_1.9.0.bb        | 2 +-
>  15 files changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/meta-python/classes/pypi.bbclass
> b/meta-python/classes/pypi.bbclass
> index 41a70e2..9b8f784 100644
> --- a/meta-python/classes/pypi.bbclass
> +++ b/meta-python/classes/pypi.bbclass
> @@ -16,6 +16,4 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>  HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>  SECTION = "devel/python"
>  SRC_URI += "${PYPI_SRC_URI}"
> -S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> -
> -inherit setuptools
> +S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
> b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
> index f3cdbd9..c3a6803 100644
> --- a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
> @@ -6,6 +6,5 @@ DEPENDS = "libffi python-pycparser"
>  SRC_URI[md5sum] = "deeba7c1fd32a66f1db587988d760c11"
>  SRC_URI[sha256sum] =
> "d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220"
>
> -inherit pypi
> -
> +inherit pypi setuptools
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> index 25326aa..dfc979b 100644
> --- a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
> @@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
>  SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
>  SRC_URI[sha256sum] =
> "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/
> python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/
> python-cryptography_1.1.bb
> index b3eee03..16806fb 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
> @@ -13,7 +13,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>  SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
>  SRC_URI[sha256sum] =
> "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
>
> -inherit pypi
> +inherit pypi setuptools
>
>  RDEPENDS_${PN} = "\
>                    python-pyasn1\
> @@ -50,4 +50,4 @@ do_install_ptest() {
>
>  FILES_${PN}-dbg += " \
>      ${libdir}/python2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
> -    "
> \ No newline at end of file
> +    "
> diff --git a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
> b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
> index 2ef5df1..3227c10 100644
> --- a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
> @@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =
> "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
>  SRC_URI[md5sum] = "ac80f432ac9373e7d162834b264034b6"
>  SRC_URI[sha256sum] =
> "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
> b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
> index 227de54..f7e30cf 100644
> --- a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
> +++ b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
> @@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
>  SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
>  SRC_URI[sha256sum] =
> "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> index c97ed48..875dee2 100644
> --- a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> +++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>  SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
>  SRC_URI[sha256sum] =
> "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
>
> -inherit pypi
> +inherit pypi setuptools
>
>  RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-re"
> diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> index faadcec..b8f5f3f 100644
> --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> @@ -3,7 +3,7 @@ LICENSE = "EPL-1.0"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
>  SRCNAME = "paho-mqtt"
>
> -inherit pypi
> +inherit pypi setuptools
>
>  RDEPENDS_${PN} = "\
>                 python-math \
> diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
> b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
> index 44b584e..ddc7b62 100644
> --- a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
> +++ b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
> @@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =
> "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
>  SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
>  SRC_URI[sha256sum] =
> "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> index 326d668..1d643eb 100644
> --- a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> @@ -9,4 +9,4 @@ RDEPENDS_${PN} += " \
>      python-subprocess \
>      "
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-py_1.4.26.bb
> b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
> index e606ed9..bb20a41 100644
> --- a/meta-python/recipes-devtools/python/python-py_1.4.26.bb
> +++ b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
> @@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>  SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
>  SRC_URI[sha256sum] =
> "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
> b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
> index fbb6486..3ff2412 100644
> --- a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
> +++ b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
> @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=d29d3ce07825100c58ca57eea171ab65"
>  SRC_URI[md5sum] = "d87aed98c8a9f386aa56d365fe4d515f"
>  SRC_URI[sha256sum] =
> "957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c"
>
> -inherit pypi
> +inherit pypi setuptools
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
> b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
> index 3fc5142..092accd 100644
> --- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
> +++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> "aed742a7dbe55eb7f02dbb26719f554b9e92198c4b3c7ac501ad03bbb6
>
>  SRC_URI += "file://import-simplejson-as-json.patch"
>
> -inherit pypi
> +inherit pypi setuptools
>
>  RDEPENDS_${PN} += "\
>    python-distutils \
> diff --git a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
> b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
> index 14dc85b..91b58af 100644
> --- a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
> @@ -7,4 +7,4 @@ SRC_URI[sha256sum] =
> "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d04
>
>  RDEPENDS_${PN} = "python-py"
>
> -inherit pypi
> +inherit pypi setuptools
> diff --git a/meta-python/recipes-devtools/python/python-six_1.9.0.bb
> b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
> index c6575f3..15bb0c9 100644
> --- a/meta-python/recipes-devtools/python/python-six_1.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
>  SRC_URI[md5sum] = "476881ef4012262dfc8adc645ee786c4"
>  SRC_URI[sha256sum] =
> "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
>
> -inherit pypi
> +inherit pypi setuptools
>
>  do_compile_append() {
>      export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0149be34f0c6ee052a1389f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Derek,<div><br></div><div>Wrong list I&#39;m afraid - p=
atches for meta-oe should go to openembedded-devel@.</div><div><br></div><d=
iv>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On 23 January 2016 at 23:09, Derek Straka <span dir=3D"ltr">&lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">---<br>
=C2=A0meta-python/classes/pypi.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 +---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-cffi_1.3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cffi_1.3.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-chardet_=
2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-chardet_2.3.0.bb</a>=
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-cryptogr=
aphy_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cryptography_1.1.b=
b</a> | 4 ++--<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-enum34_1=
.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-enum34_1.0.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-iso8601_=
0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python-iso8601_0.1.10.bb</a=
>=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-monotoni=
c_0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-monotonic_0.4.bb</a>=
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-paho-mqt=
t_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1.1.bb</a>=
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-pretend_=
1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python-pretend_1.0.8.bb</a>=
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-psutil_2=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-psutil_2.2.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-py_1.4.2=
6.bb" rel=3D"noreferrer" target=3D"_blank">python-py_1.4.26.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-pycparse=
r_2.10.bb" rel=3D"noreferrer" target=3D"_blank">python-pycparser_2.10.bb</a=
>=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-pyroute2=
_0.3.14.bb" rel=3D"noreferrer" target=3D"_blank">python-pyroute2_0.3.14.bb<=
/a>=C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-pytest_2=
.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pytest_2.7.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python-six_1.9.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python-six_1.9.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A015 files changed, 16 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bb=
class<br>
index 41a70e2..9b8f784 100644<br>
--- a/meta-python/classes/pypi.bbclass<br>
+++ b/meta-python/classes/pypi.bbclass<br>
@@ -16,6 +16,4 @@ PYPI_SRC_URI ?=3D &quot;${@pypi_src_uri(d)}&quot;<br>
=C2=A0HOMEPAGE ?=3D &quot;<a href=3D"https://pypi.python.org/pypi/${PYPI_PA=
CKAGE}/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/=
${PYPI_PACKAGE}/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
-S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
-<br>
-inherit setuptools<br>
+S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
\ No newline at end of file<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-c=
ffi_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cffi_1.3.1.bb</a>=
 b/meta-python/recipes-devtools/python/<a href=3D"http://python-cffi_1.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python-cffi_1.3.1.bb</a><br>
index f3cdbd9..c3a6803 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-cffi_1.3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cffi_1.3.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-cffi_1.3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cffi_1.3.1.bb</a><br>
@@ -6,6 +6,5 @@ DEPENDS =3D &quot;libffi python-pycparser&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;deeba7c1fd32a66f1db587988d760c11&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d45dd39a770b4afb591c82555f6a8bbc1ac7eb01=
9eda9b621eee1a0a72201220&quot;<br>
<br>
-inherit pypi<br>
-<br>
+inherit pypi setuptools<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-c=
hardet_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-chardet_2.3.0.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-chard=
et_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-chardet_2.3.0.bb</=
a><br>
index 25326aa..dfc979b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-chardet_=
2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-chardet_2.3.0.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-chardet_=
2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-chardet_2.3.0.bb</a><=
br>
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6f89e2100d=
9b6cdffcea4f398e37343&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;25274d664ccb5130adae08047416e1a8&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e53e38b3a4afe6d1132de62b7400a4ac363452dc=
5dfcf8d88e8e0cce663c68aa&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-c=
ryptography_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cryptograph=
y_1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
-cryptography_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cryptogra=
phy_1.1.bb</a><br>
index b3eee03..16806fb 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-cryptogr=
aphy_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cryptography_1.1.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-cryptogr=
aphy_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cryptography_1.1.b=
b</a><br>
@@ -13,7 +13,7 @@ S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;dd06da41535184f48f2c8e8b74dd570f&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;059bc6428b1d0e2317f505698602642f1d8dda5b=
120ec573a59a430d8cb7a32d&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python=
-pyasn1\<br>
@@ -50,4 +50,4 @@ do_install_ptest() {<br>
<br>
=C2=A0FILES_${PN}-dbg +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/python2.7/site-packages/${SRCNAME}/hazmat/bin=
dings/.debug \<br>
-=C2=A0 =C2=A0 &quot;<br>
\ No newline at end of file<br>
+=C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-e=
num34_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-enum34_1.0.4.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-enum34_=
1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-enum34_1.0.4.bb</a><b=
r>
index 2ef5df1..3227c10 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-enum34_1=
.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-enum34_1.0.4.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-enum34_1=
.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-enum34_1.0.4.bb</a><br=
>
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =3D &quot;file://enum/LICENSE;md5=3D0a97a5=
3a514564c20efd7b2e8976c87e&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;ac80f432ac9373e7d162834b264034b6&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d3c19f26a6a34629c18c775f59dfc5dd595764c7=
22b57a2da56ebfb69b94e447&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-i=
so8601_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python-iso8601_0.1.1=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-iso=
8601_0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python-iso8601_0.1.10.=
bb</a><br>
index 227de54..f7e30cf 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-iso8601_=
0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python-iso8601_0.1.10.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-iso8601_=
0.1.10.bb" rel=3D"noreferrer" target=3D"_blank">python-iso8601_0.1.10.bb</a=
><br>
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dffb8415711c=
f5d3b081b87c3d0aff737&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;23acb1029acfef9c32069c6c851c3a41&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e712ff3a18604833f5073e836aad795b21170b19=
bbef70947c441ed89d0ac0e1&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-m=
onotonic_0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-monotonic_0.4.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-monot=
onic_0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-monotonic_0.4.bb</=
a><br>
index c97ed48..875dee2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-monotoni=
c_0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-monotonic_0.4.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-monotoni=
c_0.4.bb" rel=3D"noreferrer" target=3D"_blank">python-monotonic_0.4.bb</a><=
br>
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd2794c0df5b=
907fdace235a619d80314&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;1919cc3aff2a1b907fe24c1f801343ef&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;852f656adbf623ee859def6ca2f5498f4cae3256=
f8320d5c50570ee8a0592ab6&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-ctypes ${PYTHON_PN}-re&quot;<b=
r>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
aho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1.1.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-paho-=
mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1.1.bb</=
a><br>
index faadcec..b8f5f3f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-paho-mqt=
t_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1.1.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-paho-mqt=
t_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1.1.bb</a><=
br>
@@ -3,7 +3,7 @@ LICENSE =3D &quot;EPL-1.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Deb48c6ee2cb9f5b8b=
9fe75e6f817bdfc&quot;<br>
=C2=A0SRCNAME =3D &quot;paho-mqtt&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-math \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
retend_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python-pretend_1.0.8.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-prete=
nd_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python-pretend_1.0.8.bb</=
a><br>
index 44b584e..ddc7b62 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-pretend_=
1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python-pretend_1.0.8.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-pretend_=
1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python-pretend_1.0.8.bb</a><=
br>
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D411780c=
0b7fa756753e94affeee5bc99&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;7147050a95c9f494248557b42b58ad79&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;930f2c1e18503e8f8c403abe2e02166c4a881941=
745147e712cdd4f49f3fb964&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
sutil_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-psutil_2.2.1.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-psutil_=
2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-psutil_2.2.1.bb</a><b=
r>
index 326d668..1d643eb 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-psutil_2=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-psutil_2.2.1.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-psutil_2=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-psutil_2.2.1.bb</a><br=
>
@@ -9,4 +9,4 @@ RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python-subprocess \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
y_1.4.26.bb" rel=3D"noreferrer" target=3D"_blank">python-py_1.4.26.bb</a> b=
/meta-python/recipes-devtools/python/<a href=3D"http://python-py_1.4.26.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-py_1.4.26.bb</a><br>
index e606ed9..bb20a41 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-py_1.4.2=
6.bb" rel=3D"noreferrer" target=3D"_blank">python-py_1.4.26.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-py_1.4.2=
6.bb" rel=3D"noreferrer" target=3D"_blank">python-py_1.4.26.bb</a><br>
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6bb0320b04=
a0a503f12f69fea479de9&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;30c3fd92a53f1a5ed6f3591c1fe75c0e&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;28dd0b90d29b386afb552efc4e355c889f4639ce=
93658a7872a2150ece28bb89&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
ycparser_2.10.bb" rel=3D"noreferrer" target=3D"_blank">python-pycparser_2.1=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-pyc=
parser_2.10.bb" rel=3D"noreferrer" target=3D"_blank">python-pycparser_2.10.=
bb</a><br>
index fbb6486..3ff2412 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-pycparse=
r_2.10.bb" rel=3D"noreferrer" target=3D"_blank">python-pycparser_2.10.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-pycparse=
r_2.10.bb" rel=3D"noreferrer" target=3D"_blank">python-pycparser_2.10.bb</a=
><br>
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd29d3ce0782=
5100c58ca57eea171ab65&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;d87aed98c8a9f386aa56d365fe4d515f&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;957d98b661c0b64b580ab6f94b125e09b6714154=
ee51de40bca16d3f0076b86c&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
yroute2_0.3.14.bb" rel=3D"noreferrer" target=3D"_blank">python-pyroute2_0.3=
.14.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
yroute2_0.3.14.bb" rel=3D"noreferrer" target=3D"_blank">python-pyroute2_0.3=
.14.bb</a><br>
index 3fc5142..092accd 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-pyroute2=
_0.3.14.bb" rel=3D"noreferrer" target=3D"_blank">python-pyroute2_0.3.14.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-pyroute2=
_0.3.14.bb" rel=3D"noreferrer" target=3D"_blank">python-pyroute2_0.3.14.bb<=
/a><br>
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D &quot;aed742a7dbe55eb7f02dbb26719f55=
4b9e92198c4b3c7ac501ad03bbb6<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://import-simplejson-as-json.patch&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0python-distutils \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
ytest_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pytest_2.7.0.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-pytest_=
2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pytest_2.7.0.bb</a><b=
r>
index 14dc85b..91b58af 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-pytest_2=
.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pytest_2.7.0.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-pytest_2=
.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pytest_2.7.0.bb</a><br=
>
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] =3D &quot;91dc842785417208d57e5e8dc8bb40=
f57316c45da24a50c53b49cb8d04<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;python-py&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-s=
ix_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-six_1.9.0.bb</a> b=
/meta-python/recipes-devtools/python/<a href=3D"http://python-six_1.9.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-six_1.9.0.bb</a><br>
index c6575f3..15bb0c9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-six_1.9.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python-six_1.9.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python-six_1.9.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python-six_1.9.0.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6f00d4a5071=
3fa859858dd9abaa35b21&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;476881ef4012262dfc8adc645ee786c4&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e24052411fc4fbd1f672635537c3fc2330d9481b=
18c0317695b46259512c91d5&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi setuptools<br>
<br>
=C2=A0do_compile_append() {<br>
=C2=A0 =C2=A0 =C2=A0export BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS}<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--089e0149be34f0c6ee052a1389f3--
