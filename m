Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 349DB65C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 11:51:10 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id k3-v6so1839291otl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 04:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yYc1Jdr78KR4WNcECSwYpzQwTC2E6ie3n2MlVLfw0pA=;
	b=AHM2I8dBDOcWuMAPeMULmI+lpCh8F/uWHJZ4D8RbyqGyTFznE3qMfOYX83SQOr0m96
	9abF03/dZt0xw0Z62HiZY8toGaRHhIWmQ3F/q1TbXDHEK5AH56IV3Ai6yrdMr5FXevMS
	lqvZZV0Ut7x3H8/sSE2Gn0Z1T+NlSOqQvX1mcBEb6V4OFRmwOyQzv49f1t2YgDHPwWuS
	67uqY4fwGxc0mizht+BylHY3rm8Slh11f39Xiu/d/p4wbmeypK0NB2isN35cGRrNlaVm
	wvlPrNO2VRCtjdaPA4Knp3YTxFRsYnvZwYowB67q6qxQX4AFqBWcMZnlKraPL434LBda
	Ty4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yYc1Jdr78KR4WNcECSwYpzQwTC2E6ie3n2MlVLfw0pA=;
	b=H17tDZG03P9t0rlSOpBZncg0WxDciY/xw6tk4G6LwEP/KvoTo++vF8UmcKEy4lTBUU
	+E7RPm+lDgBwQHIoEkTVARLjsTmQzUAKO/gs+CF4fhFSKIlzz6qJ31If5zUiw9GQt1qp
	66sGZg9f967AFkJ6BfisAtzu8JooTHcqxx7KqH9pPKxUJI7daSiGtliwz8isWdqDV+5q
	ae3Yfu5mawq+ttueBeI95R7sDWCyQwTcv98OV6rWWEn+440vwWl59w33fIgtJJOZlpul
	DI8xVNLTJNsst4A2d0S3cgCUKwevApMO6+YQVLjK7T3Iwy4gBLLXC30YS/PiUzFGpMXu
	69tQ==
X-Gm-Message-State: APt69E2mT4eP47B8c1vNlfX/eZDCMtfbQY/a9lDnGca+I9VBINNcc0M4
	uaT7GuOJ/wm3Dt9PxHZ9BTpwX27SWpdk6GXJefy7UA==
X-Google-Smtp-Source: AAOMgpcwFxej43AGjh9dyU/ywMh4zgT2y1vZw+z9Dme8cbLZeLHhdVgtJBYgo+mLPfaaTHDZTHFsOIg32cPQEQmUzRY=
X-Received: by 2002:a9d:124:: with SMTP id 33-v6mr3350149otu.65.1530100271069; 
	Wed, 27 Jun 2018 04:51:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 04:50:50
	-0700 (PDT)
In-Reply-To: <1529865706-12937-1-git-send-email-akuster808@gmail.com>
References: <1529865706-12937-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jun 2018 12:50:50 +0100
Message-ID: <CAJTo0LZDbEZtbc4HmbQWGzq2X5VGaJ48399cTxWxeubX--rppQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V5][PATCH] bind: update to ESV version 9.11.3
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
X-List-Received-Date: Wed, 27 Jun 2018 11:51:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+FILES_${PN} +=3D "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DI=
R}"
+FILES_python3-bind =3D "${sbindir}/dnssec-coverage ${sbindir}/dnssec-check=
ds \
+                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"

I think you meant to remove PYTHON_SITEPACKAGES_DIR from FILES_${PN}.

+PACKAGECONFIG[python3] =3D "--with-python=3D${PYTHON}
--with-python-install-dir=3D${D}/${PYTHON_SITEPACKAGES_DIR} ,
--without-python, python3-ply-native, python3-ply"

The Python module needs ply at runtime too?  Also, if this is the
case, surely you want the dependency to be on python3-bind and not
${PN}?

Ross

On 24 June 2018 at 19:41, Armin Kuster <akuster808@gmail.com> wrote:
> LIC_FILES_CHKSUM changed do to updated year
>
> removed:
> dont-test-on-host.patch, no longer implemented
> drop use-python3-and-fix-install-lib-path.patch, they added the ability t=
o pass in lib dir loctions
> drop bind-confgen-build-unix.o-once.patch, fix included in update
>
> Refresh other patches:
> add python3 flag for PACKAGECONFIG to pull in python
> add new config option --with-eddsa=3Dno (needs openssl support not releas=
ed)
>
> [v2]
> Remove python3 in default PACKACKECONFIG
> include https://patchwork.openembedded.org/patch/148257/
> Because of the newly added dependency on meta-python, the python(3)
> packageconfig is no longer "default-on".
>
> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>
> [v3]
> Made formating and spelling changes per Martin
>
> [v4]
> Minor typo fixes
> cleanup python3 support
>
> [v5]
> swtich to 9.11.3 ESV version
> fix isc python install
> keep *.la for dhcp
> update config options
> move mdig to same location as dig
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Acked-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 ++--
>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 ++--
>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 -------------
>  ...-searching-for-json-headers-searches-sysr.patch | 13 ++--
>  .../bind/bind/dont-test-on-host.patch              | 17 -----
>  .../use-python3-and-fix-install-lib-path.patch     | 36 ----------
>  .../bind/{bind_9.10.6.bb =3D> bind_9.11.3.bb}        | 81 ++++++++++++--=
--------
>  7 files changed, 59 insertions(+), 162 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-buil=
d-unix.o-once.patch
>  delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host=
.patch
>  delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-f=
ix-install-lib-path.patch
>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb =3D> bind_9.11.3.b=
b} (70%)
>
> diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAM=
ESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-gen.=
c-extend-DIRNAMESIZE-from-256-to-512.patch
> index 1215093..a8d601d 100644
> --- a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-f=
rom-256-to-512.patch
> +++ b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-f=
rom-256-to-512.patch
> @@ -7,11 +7,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   lib/dns/gen.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/lib/dns/gen.c b/lib/dns/gen.c
> -index 7a7dafb..51a0435 100644
> ---- a/lib/dns/gen.c
> -+++ b/lib/dns/gen.c
> -@@ -148,7 +148,7 @@ static const char copyright[] =3D
> +Index: bind-9.11.3/lib/dns/gen.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bind-9.11.3.orig/lib/dns/gen.c
> ++++ bind-9.11.3/lib/dns/gen.c
> +@@ -130,7 +130,7 @@ static const char copyright[] =3D
>   #define TYPECLASSBUF (TYPECLASSLEN + 1)
>   #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
>   #define ATTRIBUTESIZE 256
> @@ -20,6 +20,3 @@ index 7a7dafb..51a0435 100644
>
>   static struct cc {
>         struct cc *next;
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-t=
oo-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.=
c-fix-too-long-error.patch
> index 1ed858c..01874a4 100644
> --- a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long=
-error.patch
> +++ b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long=
-error.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com=
>
>   lib/dns/gen.c |    4 ++++
>   1 file changed, 4 insertions(+)
>
> -diff --git a/lib/dns/gen.c b/lib/dns/gen.c
> -index 51a0435..3d7214f 100644
> ---- a/lib/dns/gen.c
> -+++ b/lib/dns/gen.c
> -@@ -148,7 +148,11 @@ static const char copyright[] =3D
> +Index: bind-9.11.3/lib/dns/gen.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bind-9.11.3.orig/lib/dns/gen.c
> ++++ bind-9.11.3/lib/dns/gen.c
> +@@ -130,7 +130,11 @@ static const char copyright[] =3D
>   #define TYPECLASSBUF (TYPECLASSLEN + 1)
>   #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
>   #define ATTRIBUTESIZE 256
> @@ -29,6 +29,3 @@ index 51a0435..3d7214f 100644
>
>   static struct cc {
>         struct cc *next;
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.=
o-once.patch b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.=
o-once.patch
> deleted file mode 100644
> index 8bc4ea3..0000000
> --- a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.=
patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 9b40619ff6fddfef2758ba797789f8487f412df3 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Mon, 16 Feb 2015 00:50:01 -0800
> -Subject: [PATCH] confgen: don't build unix.o twice
> -
> -Fixed:
> -unix/os.o: file not recognized: File truncated
> -collect2: error: ld returned 1 exit status
> -
> -This is because os.o was built twice:
> -* The implicity rule (depends on unix/os.o)
> -* The "make all" in unix subdir (depends on unix/os.o)
> -
> -Depend on subdirs which is unix only rather than unix/os.o will fix the
> -problem.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Update context(trailing whitespace) for version 9.10.5-P3.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - bin/confgen/Makefile.in |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/bin/confgen/Makefile.in b/bin/confgen/Makefile.in
> -index dca272f..02becce 100644
> ---- a/bin/confgen/Makefile.in
> -+++ b/bin/confgen/Makefile.in
> -@@ -74,11 +74,11 @@ rndc-confgen.@O@: rndc-confgen.c
> - ddns-confgen.@O@: ddns-confgen.c
> -       ${LIBTOOL_MODE_COMPILE} ${CC} ${ALL_CFLAGS} -c ${srcdir}/ddns-con=
fgen.c
> -
> --rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${C=
ONFDEPLIBS}
> -+rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIB=
S} $(SUBDIRS)
> -       export BASEOBJS=3D"rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"=
; \
> -       ${FINALBUILDCMD}
> -
> --ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${C=
ONFDEPLIBS}
> -+ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIB=
S} $(SUBDIRS)
> -       export BASEOBJS=3D"ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"=
; \
> -       ${FINALBUILDCMD}
> -
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-fo=
r-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bi=
nd-ensure-searching-for-json-headers-searches-sysr.patch
> index 13df3bb..37e210e 100644
> --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-=
headers-searches-sysr.patch
> +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-=
headers-searches-sysr.patch
> @@ -31,11 +31,11 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriv=
er.com>
>   configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/configure.in b/configure.in
> -index c9ef3a601343..17a1f613e9ac 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -2139,7 +2139,7 @@ case "$use_libjson" in
> +Index: bind-9.11.3/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bind-9.11.3.orig/configure.in
> ++++ bind-9.11.3/configure.in
> +@@ -2574,7 +2574,7 @@ case "$use_libjson" in
>                 libjson_libs=3D""
>                 ;;
>         auto|yes)
> @@ -44,6 +44,3 @@ index c9ef3a601343..17a1f613e9ac 100644
>                 do
>                         if test -f "${d}/include/json/json.h"
>                         then
> ---
> -2.4.2
> -
> diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch =
b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
> deleted file mode 100644
> index b02ecb1..0000000
> --- a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Upstream-Status: Pending
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: bind-9.9.5/bin/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bind-9.9.5.orig/bin/Makefile.in
> -+++ bind-9.9.5/bin/Makefile.in
> -@@ -19,7 +19,7 @@ srcdir =3D     @srcdir@
> - VPATH =3D               @srcdir@
> - top_srcdir =3D  @top_srcdir@
> -
> --SUBDIRS =3D     named rndc dig delv dnssec tools tests nsupdate \
> -+SUBDIRS =3D     named rndc dig delv dnssec tools nsupdate \
> -               check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
> - TARGETS =3D
> -
> diff --git a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-inst=
all-lib-path.patch b/meta/recipes-connectivity/bind/bind/use-python3-and-fi=
x-install-lib-path.patch
> deleted file mode 100644
> index 9829f15..0000000
> --- a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib=
-path.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Use python3 rather default python which maybe links to python2 for oe. A=
nd add
> -option for setup.py to install files to right directory.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -diff --git a/bin/python/Makefile.in b/bin/python/Makefile.in
> -index a43a3c1..2e727f2 100644
> ---- a/bin/python/Makefile.in
> -+++ b/bin/python/Makefile.in
> -@@ -55,9 +55,9 @@ install:: ${TARGETS} installdirs
> -       ${INSTALL_DATA} ${srcdir}/dnssec-coverage.8 ${DESTDIR}${mandir}/m=
an8
> -       if test -n "${PYTHON}" ; then \
> -               if test -n "${DESTDIR}" ; then \
> --                      ${PYTHON} ${srcdir}/setup.py install --root=3D${D=
ESTDIR} --prefix=3D${prefix} ; \
> -+                      ${PYTHON} ${srcdir}/setup.py install --root=3D${D=
ESTDIR} --prefix=3D${prefix} --install-lib=3D${PYTHON_SITEPACKAGES_DIR} ; \
> -               else \
> --                      ${PYTHON} ${srcdir}/setup.py install --prefix=3D$=
{prefix} ; \
> -+                      ${PYTHON} ${srcdir}/setup.py install --prefix=3D$=
{prefix} --install-lib=3D${PYTHON_SITEPACKAGES_DIR} ; \
> -               fi \
> -       fi
> -
> -diff --git a/configure.in b/configure.in
> -index 314bb90..867923e 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -227,7 +227,7 @@ AC_ARG_WITH(python,
> - [  --with-python=3DPATH      specify path to python interpreter],
> -     use_python=3D"$withval", use_python=3D"unspec")
> -
> --python=3D"python python3 python3.5 python3.4 python3.3 python3.2 python=
2 python2.7"
> -+python=3D"python3 python3.5 python3.4 python3.3 python3.2 python2 pytho=
n2.7"
> -
> - testargparse=3D'try: import argparse
> - except: exit(1)'
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes=
-connectivity/bind/bind_9.11.3.bb
> similarity index 70%
> rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
> rename to meta/recipes-connectivity/bind/bind_9.11.3.bb
> index 20c8d7b..a4fe749 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.3.bb
> @@ -3,51 +3,50 @@ HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>  SECTION =3D "console/network"
>
>  LICENSE =3D "ISC & BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Ddba46507446198119bcde32a4fe=
aab43"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D6ba7c9fe0c888a943c79c93e6de=
744fb"
>
> -DEPENDS =3D "openssl libcap"
> +DEPENDS =3D "openssl libcap zlib"
>
>  SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://conf.patch \
> -           file://make-etc-initd-bind-stop-work.patch \
> -           file://dont-test-on-host.patch \
> -           file://generate-rndc-key.sh \
>             file://named.service \
>             file://bind9 \
> +           file://generate-rndc-key.sh \
> +           file://make-etc-initd-bind-stop-work.patch \
>             file://init.d-add-support-for-read-only-rootfs.patch \
> -           file://bind-confgen-build-unix.o-once.patch \
> -           file://0001-build-use-pkg-config-to-find-libxml2.patch \
>             file://bind-ensure-searching-for-json-headers-searches-sysr.p=
atch \
>             file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
> -           file://use-python3-and-fix-install-lib-path.patch \
> -           "
> +"
>
> -SRC_URI[md5sum] =3D "84e663284b17aee0df1ce6f248b137d7"
> -SRC_URI[sha256sum] =3D "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d=
1e0d050fdf47e69d"
> +SRC_URI[md5sum] =3D "4ed2a3f235595eadbd763b7ecb687ca0"
> +SRC_URI[sha256sum] =3D "0d9dde14b2ec7f9cdc3b69f19540c7a2e4eee7b6c727965d=
fae48810965876f5"
>
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>
> +inherit autotools update-rc.d systemd useradd pkgconfig
> +
> +# PACKAGECONFIGs readline and libedit should NOT be set at same time
> +PACKAGECONFIG ?=3D "readline"
> +PACKAGECONFIG[httpstats] =3D "--with-libxml2=3D${STAGING_DIR_HOST}${pref=
ix},--without-libxml2,libxml2"
> +PACKAGECONFIG[readline] =3D "--with-readline=3D-lreadline,,readline"
> +PACKAGECONFIG[libedit] =3D "--with-readline=3D-ledit,,libedit"
> +PACKAGECONFIG[urandom] =3D "--with-randomdev=3D/dev/urandom,--with-rando=
mdev=3D/dev/random,,"
> +PACKAGECONFIG[python3] =3D "--with-python=3D${PYTHON} --with-python-inst=
all-dir=3D${D}/${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-n=
ative, python3-ply"
>
>  ENABLE_IPV6 =3D "--enable-ipv6=3D${@bb.utils.contains('DISTRO_FEATURES',=
 'ipv6', 'yes', 'no', d)}"
>  EXTRA_OECONF =3D " ${ENABLE_IPV6} --with-libtool --enable-threads \
>                   --disable-devpoll --enable-epoll --with-gost=3Dno \
> -                 --with-gssapi=3Dno --with-ecdsa=3Dyes \
> +                 --with-gssapi=3Dno --with-ecdsa=3Dyes --with-eddsa=3Dno=
 \
>                   --sysconfdir=3D${sysconfdir}/bind \
>                   --with-openssl=3D${STAGING_DIR_HOST}${prefix} \
>                 "
>
> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native =
distutils3-base', '', d)}
>
> -export PYTHON_SITEPACKAGES_DIR
> -
> -# PACKAGECONFIGs readline and libedit should NOT be set at same time
> -PACKAGECONFIG ?=3D "readline"
> -PACKAGECONFIG[httpstats] =3D "--with-libxml2,--without-libxml2,libxml2"
> -PACKAGECONFIG[readline] =3D "--with-readline=3D-lreadline,,readline"
> -PACKAGECONFIG[libedit] =3D "--with-readline=3D-ledit,,libedit"
> -PACKAGECONFIG[urandom] =3D "--with-randomdev=3D/dev/urandom,--with-rando=
mdev=3D/dev/random,,"
> +# dhcp needs .la so keep them
> +REMOVE_LIBTOOL_LA =3D "0"
>
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/cache/bind --n=
o-create-home \
> @@ -58,19 +57,6 @@ INITSCRIPT_PARAMS =3D "defaults"
>
>  SYSTEMD_SERVICE_${PN} =3D "named.service"
>
> -PARALLEL_MAKE =3D ""
> -
> -RDEPENDS_${PN} =3D "python3-core"
> -RDEPENDS_${PN}-dev =3D ""
> -
> -PACKAGE_BEFORE_PN +=3D "${PN}-utils"
> -FILES_${PN}-utils =3D "${bindir}/host ${bindir}/dig"
> -FILES_${PN}-dev +=3D "${bindir}/isc-config.h"
> -FILES_${PN} +=3D "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_=
DIR}"
> -
> -PACKAGE_BEFORE_PN +=3D "${PN}-libs"
> -FILES_${PN}-libs =3D "${libdir}/*.so*"
> -
>  do_install_prepend() {
>         # clean host path in isc-config.sh before the hardlink created
>         # by "make install":
> @@ -79,6 +65,7 @@ do_install_prepend() {
>  }
>
>  do_install_append() {
> +
>         rm "${D}${bindir}/nslookup"
>         rm "${D}${mandir}/man1/nslookup.1"
>         rmdir "${D}${localstatedir}/run"
> @@ -88,7 +75,12 @@ do_install_append() {
>         install -d "${D}${sysconfdir}/init.d"
>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -       sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dn=
ssec-coverage ${D}${sbindir}/dnssec-checkds
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'fal=
se', d)}; then
> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
> +               ${D}${sbindir}/dnssec-coverage \
> +               ${D}${sbindir}/dnssec-checkds \
> +               ${D}${sbindir}/dnssec-keymgr
> +       fi
>
>         # Install systemd related files
>         install -d ${D}${sbindir}
> @@ -106,8 +98,6 @@ do_install_append() {
>                 install -d ${D}${sysconfdir}/tmpfiles.d
>                 echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir=
}/tmpfiles.d/bind.conf
>         fi
> -
> -    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/isc/*.pyc
>  }
>
>  CONFFILES_${PN} =3D " \
> @@ -121,3 +111,20 @@ CONFFILES_${PN} =3D " \
>         ${sysconfdir}/bind/db.root \
>         "
>
> +PACKAGE_BEFORE_PN +=3D "${PN}-utils"
> +FILES_${PN}-utils =3D "${bindir}/host ${bindir}/dig ${bindir}/mdig"
> +FILES_${PN}-dev +=3D "${bindir}/isc-config.h"
> +FILES_${PN} +=3D "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_=
DIR}"
> +
> +PACKAGE_BEFORE_PN +=3D "${PN}-libs"
> +FILES_${PN}-libs =3D "${libdir}/*.so*"
> +FILES_${PN}-staticdev +=3D "${libdir}/*.la"
> +
> +PACKAGE_BEFORE_PN +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python3',=
 'python3-bind', '', d)}"
> +FILES_python3-bind =3D "${sbindir}/dnssec-coverage ${sbindir}/dnssec-che=
ckds \
> +                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
> +
> +RDEPENDS_${PN} =3D "bash"
> +RDEPENDS_${PN}-utils =3D "bash"
> +RDEPENDS_${PN}-dev =3D ""
> +RDEPENDS_python3-bind =3D "python3-core"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

