Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2F25792BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:28:35 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z78-v6so1763060qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YTMgf77v+eLdN1bj26jPEN00jQdQaYNi9N7uDctEbNQ=;
	b=qN6pmC+tOQgrgAGLfrj6N5aBB99XWX552z6GzmW9m/RtGW4FoWwv4VjZM1Tu0SOSO1
	v3imEQ8Xg9+JnmU7EuHqNd227wzlgt26kOyfFuJgQPKS200StFgFE652g5reAASOdD1+
	1/ZfjzD/8ZlbWdDP1LJIlqzcgV5WTttEHyySR82XrGkaNCCIvdwxI5rAB33bF2y4gFYc
	gyThBrKbBLVZ+7QwfAvI9eM/7TYbUjoJu7QlIek13maXmorKWmty1r5pKsLgFP4GfBYM
	LWyON66nPP0d1+aWByrFLyf09oq+RRGUJuCCu2zWJny+Xo9xdzJhg8uutQDQAjoXI9xc
	HNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YTMgf77v+eLdN1bj26jPEN00jQdQaYNi9N7uDctEbNQ=;
	b=L1Y0BQm6pDKb4wac9bQLnlPyBxZT1SqaUlNIv1foUKsbrDneNC3Wk2/UmULux8vBA/
	g/oAEh1muqPDncXTCv3B/fK0g7cml9ZueDx2PYkS+8Cy9qeoeU3/t1/U8qq0cYfdy3MZ
	NbrOtFOTUkKVvPhU3HUk7+jJ/uuieisHaHexGA80UaZp97kr/vEPQ3aIO0fXbd1rKqva
	hNBdQ2dGVpqMO7Wstfi8qrJkjnQN0SPmMzCuEtSLWzPirI6BgP5svqKUB4OoJXZ4gH9m
	/AlN+zK9W1la2Fyc0iF41NG9wbkwukPOnqWBQuNtyucIcnJ3z3JHVl2VEW4IZfJkkJX5
	rNCg==
X-Gm-Message-State: APzg51A151WycTuzxtQRJvQ7+M/NZLyhEvD2yQAErIFIvguu5id3Efj4
	RFuzmb8Asa5PmtNcm2mRb2PUDus6kwZS/oQwN3w=
X-Google-Smtp-Source: ANB0VdbPAA3lN1x4CcNEOFEP96aOjcyV9iXzrHa2xGMziGU4Y0Wh0QqnJy3ouXo0e7qqYM164GPojaUoAS/RaiQkvLg=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr16064762qki.315.1535732915932; 
	Fri, 31 Aug 2018 09:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180831154710.26856-1-sno@netbsd.org>
In-Reply-To: <20180831154710.26856-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:28:09 -0700
Message-ID: <CAMKF1spBNObo8H52PCKNh_tRRj_3C0_+QQ_X9-1wGj8hiqckzA@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: svenha@external.miltenyibiotec.de, igork@miltenyibiotec.de,
	gerald.klix@klix.ch, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 31 Aug 2018 16:28:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 8:48 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Update python3 to recent 3.7.0 release.
>
> This is the first state of the package which compiles and
> packages, further tests on target and in sysroot-native have
> to be done before.
>
> Please review, give feedback etc.
>

I open an enhancement request for it not so long ago
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12901

Perhaps that bug should be mentioned here.

> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/python3-dir.bbclass              |   6 +-
>  .../python/python3-native_3.5.5.bb            | 112 ------
>  .../python/python3-native_3.7.0.bb            |  74 ++++
>  meta/recipes-devtools/python/python3.inc      |  74 ++++
>  ...hell-version-of-python-config-that-w.patch |  21 +-
>  ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
>  .../python3/0001-cross-compile-support.patch  |  66 ++--
>  ...d-target-to-split-profile-generation.patch |  40 --
>  .../python3/03-fix-tkinter-detection.patch    |  12 +-
>  .../python3/030-fixup-include-dirs.patch      |   9 -
>  .../080-distutils-dont_adjust_files.patch     |   4 +-
>  .../python/python3/150-fix-setupterm.patch    |  17 -
>  ...GS-for-extensions-when-cross-compili.patch |  53 ++-
>  .../python3/avoid-ncursesw-include-path.patch |  18 +-
>  .../python3/avoid_warning_about_tkinter.patch |  18 +-
>  .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
>  ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
>  .../python/python3/python-3.3-multilib.patch  | 241 ++++++------
>  ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
>  .../python/python3/regen-all.patch            |  25 --
>  ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  36 +-
>  .../python3/sysroot-include-headers.patch     |  23 +-
>  meta/recipes-devtools/python/python3_3.5.5.bb | 346 ------------------
>  meta/recipes-devtools/python/python3_3.7.0.bb | 309 ++++++++++++++++
>  24 files changed, 747 insertions(+), 887 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-native_3.5.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-native_3.7.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3.inc
>  delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21272=
-Use-_sysconfigdata.py-to-initialize-dist.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/0002-Makefile-ad=
d-target-to-split-profile-generation.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/150-fix-setupter=
m.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/regen-all.patch
>  delete mode 100644 meta/recipes-devtools/python/python3_3.5.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3_3.7.0.bb
>
> diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.=
bbclass
> index 06bb046d9c..26d2b6668b 100644
> --- a/meta/classes/python3-dir.bbclass
> +++ b/meta/classes/python3-dir.bbclass
> @@ -1,4 +1,8 @@
> -PYTHON_BASEVERSION =3D "3.5"
> +PYTHON_BASEVERSION =3D "3.7"
> +# [d][m]
> +# d: py_debug
> +# m: my_malloc
> +# u: wide-char unicode
>  PYTHON_ABI =3D "m"
>  PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
>  PYTHON_PN =3D "python3"
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/=
recipes-devtools/python/python3-native_3.5.5.bb
> deleted file mode 100644
> index 3098027d80..0000000000
> --- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -require recipes-devtools/python/python.inc
> -
> -PR =3D "${INC_PR}.0"
> -PYTHON_MAJMIN =3D "3.5"
> -DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase =3D ""
> -SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz =
\
> -file://12-distutils-prefix-is-inside-staging-area.patch \
> -file://python-config.patch \
> -file://0001-cross-compile-support.patch \
> -file://030-fixup-include-dirs.patch \
> -file://070-dont-clean-ipkg-install.patch \
> -file://080-distutils-dont_adjust_files.patch \
> -file://130-readline-setup.patch \
> -file://150-fix-setupterm.patch \
> -file://python-3.3-multilib.patch \
> -file://03-fix-tkinter-detection.patch \
> -file://avoid_warning_about_tkinter.patch \
> -file://shutil-follow-symlink-fix.patch \
> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> -file://sysroot-include-headers.patch \
> -file://unixccompiler.patch \
> -${DISTRO_SRC_URI} \
> -file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -file://regen-all.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "f3763edf9824d5d3a15f5f646083b6e0"
> -SRC_URI[sha256sum] =3D "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7e=
d382a83165d45009"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db6ec515b22618f55fa07276b897ba=
cea"
> -
> -# exclude pre-releases for both python 2.x and 3.x
> -UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -
> -S =3D "${WORKDIR}/Python-${PV}"
> -
> -EXTRANATIVEPATH +=3D "bzip2-native"
> -DEPENDS =3D "openssl-native bzip2-replacement-native zlib-native readlin=
e-native sqlite3-native gdbm-native"
> -
> -inherit native
> -
> -EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} --without-ensurepip=
"
> -
> -EXTRA_OEMAKE =3D '\
> -  LIBC=3D"" \
> -  STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \
> -  STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \
> -  LIB=3D${baselib} \
> -  ARCH=3D${TARGET_ARCH} \
> -'
> -
> -# No ctypes option for python 3
> -PYTHONLSBOPTS =3D ""
> -
> -do_configure_append() {
> -       autoreconf --verbose --install --force --exclude=3Dautopoint ../P=
ython-${PV}/Modules/_ctypes/libffi
> -       sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \=
*/,' ${B}/pyconfig.h
> -}
> -
> -# Regenerate all of the generated files
> -# This ensures that pgen and friends get created during the compile phas=
e
> -#
> -do_compile_prepend() {
> -    # Assuming https://bugs.python.org/issue33080 has been addressed in =
Makefile.
> -    oe_runmake regen-all
> -}
> -
> -do_install() {
> -       install -d ${D}${libdir}/pkgconfig
> -       oe_runmake 'DESTDIR=3D${D}' install
> -       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -               install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir=
}/python${PYTHON_MAJMIN}
> -       fi
> -       install -d ${D}${bindir}/${PN}
> -       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> -
> -       # Make sure we use /usr/bin/env python
> -       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}=
/${PN}`; do
> -               sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> -       done
> -
> -        # Add a symlink to the native Python so that scripts can just in=
voke
> -        # "nativepython" and get the right one without needing absolute =
paths
> -        # (these often end up too long for the #! parser in the kernel a=
s the
> -        # buffer is 128 bytes long).
> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> -}
> -
> -python(){
> -
> -    # Read JSON manifest
> -    import json
> -    pythondir =3D d.getVar('THISDIR',True)
> -    with open(pythondir+'/python3/python3-manifest.json') as manifest_fi=
le:
> -        python_manifest=3Djson.load(manifest_file)
> -
> -    rprovides =3D d.getVar('RPROVIDES').split()
> -
> -    # Hardcoded since it cant be python3-native-foo, should be python3-f=
oo-native
> -    pn =3D 'python3'
> -
> -    for key in python_manifest:
> -        pypackage =3D pn + '-' + key + '-native'
> -        if pypackage not in rprovides:
> -              rprovides.append(pypackage)
> -
> -    d.setVar('RPROVIDES', ' '.join(rprovides))
> -}
> diff --git a/meta/recipes-devtools/python/python3-native_3.7.0.bb b/meta/=
recipes-devtools/python/python3-native_3.7.0.bb
> new file mode 100644
> index 0000000000..fdbc9888b9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-native_3.7.0.bb
> @@ -0,0 +1,74 @@
> +require recipes-devtools/python/python3.inc
> +
> +SRC_URI +=3D "\
> +    file://12-distutils-prefix-is-inside-staging-area.patch \
> +    file://0001-Do-not-use-the-shell-version-of-python-config-that-w.pat=
ch \
> +"
> +
> +EXTRANATIVEPATH +=3D "bzip2-native"
> +DEPENDS =3D "openssl-native libffi-native bzip2-replacement-native zlib-=
native readline-native sqlite3-native gdbm-native"
> +
> +inherit native
> +
> +EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} --without-ensurepip=
"
> +
> +EXTRA_OEMAKE =3D '\
> +  LIBC=3D"" \
> +  STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \
> +  STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \
> +  LIB=3D${baselib} \
> +  ARCH=3D${TARGET_ARCH} \
> +'
> +
> +# No ctypes option for python 3
> +PYTHONLSBOPTS =3D ""
> +
> +# Regenerate all of the generated files
> +# This ensures that pgen and friends get created during the compile phas=
e
> +#
> +do_compile_prepend() {
> +    # Assuming https://bugs.python.org/issue33080 has been addressed in =
Makefile.
> +    oe_runmake regen-all
> +}
> +
> +do_install() {
> +       install -d ${D}${libdir}/pkgconfig
> +       oe_runmake 'DESTDIR=3D${D}' install
> +       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +               install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir=
}/python${PYTHON_MAJMIN}
> +       fi
> +       install -d ${D}${bindir}/${PN}
> +       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> +
> +       # Make sure we use /usr/bin/env python
> +       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}=
/${PN}`; do
> +               sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> +       done
> +
> +        # Add a symlink to the native Python so that scripts can just in=
voke
> +        # "nativepython" and get the right one without needing absolute =
paths
> +        # (these often end up too long for the #! parser in the kernel a=
s the
> +        # buffer is 128 bytes long).
> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +}
> +
> +python(){
> +
> +    # Read JSON manifest
> +    import json
> +    pythondir =3D d.getVar('THISDIR',True)
> +    with open(pythondir+'/python3/python3-manifest.json') as manifest_fi=
le:
> +        python_manifest=3Djson.load(manifest_file)
> +
> +    rprovides =3D d.getVar('RPROVIDES').split()
> +
> +    # Hardcoded since it cant be python3-native-foo, should be python3-f=
oo-native
> +    pn =3D 'python3'
> +
> +    for key in python_manifest:
> +        pypackage =3D pn + '-' + key + '-native'
> +        if pypackage not in rprovides:
> +              rprovides.append(pypackage)
> +
> +    d.setVar('RPROVIDES', ' '.join(rprovides))
> +}
> diff --git a/meta/recipes-devtools/python/python3.inc b/meta/recipes-devt=
ools/python/python3.inc
> new file mode 100644
> index 0000000000..45914b66ca
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3.inc
> @@ -0,0 +1,74 @@
> +SUMMARY =3D "The Python Programming Language"
> +HOMEPAGE =3D "http://www.python.org"
> +LICENSE =3D "PSFv2"
> +SECTION =3D "devel/python"
> +# bump this on every change in contrib/python/generate-manifest-2.7.py
> +INC_PR =3D "r1"
> +
> +PR =3D "${INC_PR}.0"
> +PYTHON_MAJMIN =3D "3.7"
> +DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> +DISTRO_SRC_URI_linuxstdbase =3D ""
> +SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz =
\
> +    file://python-config.patch \
> +    file://python-3.3-multilib.patch \
> +    file://03-fix-tkinter-detection.patch \
> +    file://avoid_warning_about_tkinter.patch \
> +    file://unixccompiler.patch \
> +    file://sysroot-include-headers.patch \
> +    file://shutil-follow-symlink-fix.patch \
> +    file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> +    file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> +    file://0001-cross-compile-support.patch \
> +    file://030-fixup-include-dirs.patch \
> +    file://070-dont-clean-ipkg-install.patch \
> +    file://080-distutils-dont_adjust_files.patch \
> +    file://130-readline-setup.patch \
> +    file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.pat=
ch \
> +    ${DISTRO_SRC_URI} \
> +    file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "eb8c2a6b1447d50813c02714af4681f3"
> +SRC_URI[sha256sum] =3D "0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4=
126dd1c40a8b3549"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df257cc14f81685691652a3d3e1b5d=
754"
> +
> +# exclude pre-releases for both python 2.x and 3.x
> +UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> +
> +S =3D "${WORKDIR}/Python-${PV}"
> +
> +CVE_PRODUCT =3D "python"
> +
> +inherit autotools pkgconfig python3-dir
> +
> +EXTRA_OECONF =3D "\
> +  --with-pymalloc \
> +  --without-cxx-main \
> +  --enable-shared \
> +  --enable-ipv6=3D${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes',=
 'no', d)} \
> +  ac_cv_header_bluetooth_bluetooth_h=3Dno ac_cv_header_bluetooth_h=3Dno =
\
> +  ${PYTHONLSBOPTS} \
> +"
> +
> +do_configure_prepend() {
> +       libdirleaf=3D"$(echo ${libdir} | sed -e 's:${prefix}/::')"
> +       sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
> +               ${S}/configure.ac
> +}
> +
> +do_install_prepend() {
> +       MAKESETTINGS=3D"$(egrep '^(ABIFLAGS|MULTIARCH)=3D' ${B}/Makefile =
| sed -E -e 's/[[:space:]]//g' -e 's/=3D/=3D"/' -e 's/$/"/')"
> +       eval ${MAKESETTINGS}
> +       if test "${ABIFLAGS}" !=3D "${PYTHON_ABI}"; then
> +           die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' =
!=3D '${PYTHON_ABI}' from python3-dir.bbclass"
> +       fi
> +       _PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIAR=
CH}
> +}
> +
> +do_install_append () {
> +       sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
> +               -e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
> +               ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_P=
YTHON_SYSCONFIGDATA_NAME}.py
> +}
> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-she=
ll-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/pyt=
hon3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> index 8ea3f03fe0..aac34533ef 100644
> --- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-vers=
ion-of-python-config-that-w.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-vers=
ion-of-python-config-that-w.patch
> @@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 236f005..5c4337f 100644
> +index 31b4bcabb3..7da6d6941e 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in Mi=
sc/python-config.sh
> +@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.in Mi=
sc/python-config.sh
>         sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcd=
ir)/Misc/python-config.in >python-config.py
> -       # Replace makefile compat. variable references with shell script =
compat. ones; $(VAR) -> ${VAR}
> +       @ # Replace makefile compat. variable references with shell scrip=
t compat. ones; $(VAR) -> ${VAR}
>         LC_ALL=3DC sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/p=
ython-config.sh >python-config
> --      # On Darwin, always use the python version of the script, the she=
ll
> --      # version doesn't use the compiler customizations that are provid=
ed
> --      # in python (_osx_support.py).
> --      if test `uname -s` =3D Darwin; then \
> +-      @ # On Darwin, always use the python version of the script, the s=
hell
> +-      @ # version doesn't use the compiler customizations that are prov=
ided
> +-      @ # in python (_osx_support.py).
> +-      @if test `uname -s` =3D Darwin; then \
>  -              cp python-config.py python-config; \
>  -      fi
> -+      # In OpenEmbedded, always use the python version of the script, t=
he shell
> -+      # version is broken in multiple ways, and doesn't return correct =
directories
> ++      @ # In OpenEmbedded, always use the python version of the script,=
 the shell
> ++      @ # version is broken in multiple ways, and doesn't return correc=
t directories
>  +      cp python-config.py python-config
>
>
>   # Install the include files
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_s=
ysconfigdata.py-to-initialize-dist.patch b/meta/recipes-devtools/python/pyt=
hon3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> deleted file mode 100644
> index d1c92e9eed..0000000000
> --- a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfi=
gdata.py-to-initialize-dist.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
> -From: Libin Dang <libin.dang@windriver.com>
> -Date: Tue, 11 Apr 2017 14:12:15 +0800
> -Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
> - distutils.sysconfig
> -
> -Backport upstream commit
> -https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b=
23d934159
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - Lib/distutils/sysconfig.py | 35 ++++-------------------------------
> - 1 file changed, 4 insertions(+), 31 deletions(-)
> -
> -diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index 6d5cfd0..9925d24 100644
> ---- a/Lib/distutils/sysconfig.py
> -+++ b/Lib/distutils/sysconfig.py
> -@@ -424,38 +424,11 @@ _config_vars =3D None
> -
> - def _init_posix():
> -     """Initialize the module as appropriate for POSIX systems."""
> --    g =3D {}
> --    # load the installed Makefile:
> --    try:
> --        filename =3D get_makefile_filename()
> --        parse_makefile(filename, g)
> --    except OSError as msg:
> --        my_msg =3D "invalid Python installation: unable to open %s" % f=
ilename
> --        if hasattr(msg, "strerror"):
> --            my_msg =3D my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # load the installed pyconfig.h:
> --    try:
> --        filename =3D get_config_h_filename()
> --        with open(filename) as file:
> --            parse_config_h(file, g)
> --    except OSError as msg:
> --        my_msg =3D "invalid Python installation: unable to open %s" % f=
ilename
> --        if hasattr(msg, "strerror"):
> --            my_msg =3D my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # On AIX, there are wrong paths to the linker scripts in the Makefi=
le
> --    # -- these paths are relative to the Python source, but when instal=
led
> --    # the scripts are in another directory.
> --    if python_build:
> --        g['LDSHARED'] =3D g['BLDSHARED']
> --
> -+    # _sysconfigdata is generated at build time, see the sysconfig modu=
le
> -+    from _sysconfigdata import build_time_vars
> -     global _config_vars
> --    _config_vars =3D g
> -+    _config_vars =3D {}
> -+    _config_vars.update(build_time_vars)
> -
> -
> - def _init_nt():
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-devtools/python/python3/0001-cross-compile-supp=
ort.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support=
.patch
> index 7cd7e3b490..a87b86015b 100644
> --- a/meta/recipes-devtools/python/python3/0001-cross-compile-support.pat=
ch
> +++ b/meta/recipes-devtools/python/python3/0001-cross-compile-support.pat=
ch
> @@ -1,4 +1,4 @@
> -From ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 2001
> +From 6ad4d2101b5d67bb2de166829879a5b1a0f1c18f Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 31 Mar 2017 15:42:46 +0300
>  Subject: [PATCH] cross-compile support
> @@ -8,7 +8,7 @@ python instead of in-tree tools
>
>  -Khem
>
> -Rebased on 3.5.4
> +Rebased on 3.7.0
>
>  Upstream-Status: Inappropriate[Configuration Specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> @@ -18,53 +18,53 @@ Signed-off-by: Derek Straka <derek@asterius.io>
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 144c1f8629..f252ac2417 100644
> +index d60d48e5f9..31b4bcabb3 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -223,6 +223,7 @@ LIBOBJS=3D   @LIBOBJS@
> -
> +@@ -233,6 +233,7 @@ LIBOBJS=3D   @LIBOBJS@
> +
>   PYTHON=3D               python$(EXE)
>   BUILDPYTHON=3D  python$(BUILDEXE)
>  +HOSTPYTHON=3D    $(BUILDPYTHON)
> -
> +
>   PYTHON_FOR_REGEN=3D@PYTHON_FOR_REGEN@
> - PYTHON_FOR_BUILD=3D@PYTHON_FOR_BUILD@
> -@@ -277,6 +278,7 @@ LIBFFI_INCLUDEDIR=3D @LIBFFI_INCLUDEDIR@
> + UPDATE_FILE=3D@PYTHON_FOR_REGEN@ $(srcdir)/Tools/scripts/update_file.py
> +@@ -285,6 +286,7 @@ LIBFFI_INCLUDEDIR=3D @LIBFFI_INCLUDEDIR@
>   #######################################################################=
###
>   # Parser
>   PGEN=3D         Parser/pgen$(EXE)
>  +HOSTPGEN=3D     $(PGEN)$(EXE)
> -
> - PSRCS=3D                \
> -               Parser/acceler.c \
> -@@ -478,7 +480,7 @@ build_all_generate_profile:
> -
> +
> + POBJS=3D                \
> +               Parser/acceler.o \
> +@@ -501,7 +503,7 @@ build_all_generate_profile:
> +
>   run_profile_task:
> -       : # FIXME: can't run for a cross build
> +       @ # FIXME: can't run for a cross build
>  -      $(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) |=
| true
>  +      $(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || t=
rue
> -
> +
>   build_all_merge_profile:
>         $(LLVM_PROF_MERGER)
> -@@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
> +@@ -796,7 +798,7 @@ regen-grammar: $(PGEN)
>         # Regenerate Include/graminit.h and Python/graminit.c
>         # from Grammar/Grammar using pgen
>         @$(MKDIR_P) Include
>  -      $(PGEN) $(srcdir)/Grammar/Grammar \
>  +      $(HOSTPGEN) $(srcdir)/Grammar/Grammar \
> -               $(srcdir)/Include/graminit.h \
> -               $(srcdir)/Python/graminit.c
> -
> -@@ -978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTH=
ON_HEADERS)
> +               $(srcdir)/Include/graminit.h.new \
> +               $(srcdir)/Python/graminit.c.new
> +       $(UPDATE_FILE) $(srcdir)/Include/graminit.h $(srcdir)/Include/gra=
minit.h.new
> +@@ -1034,7 +1036,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PY=
THON_HEADERS)
>   ######################################################################
> -
> +
>   TESTOPTS=3D     $(EXTRATESTOPTS)
>  -TESTPYTHON=3D   $(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
>  +TESTPYTHON=3D   $(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
>   TESTRUNNER=3D   $(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
> - TESTTIMEOUT=3D  3600
> -
> -@@ -1470,7 +1472,7 @@ frameworkinstallstructure:       $(LDLIBRARY)
> + TESTTIMEOUT=3D  1200
> +
> +@@ -1536,7 +1538,7 @@ frameworkinstallstructure:       $(LDLIBRARY)
>                 fi; \
>         done
>         $(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
> @@ -73,24 +73,24 @@ index 144c1f8629..f252ac2417 100644
>         $(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Vers=
ions/Current
>         $(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHON=
FRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
>         $(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKIN=
STALLDIR)/Headers
> -@@ -1543,7 +1545,7 @@ Python/dtoa.o: Python/dtoa.c
> -
> +@@ -1609,7 +1611,7 @@ Python/dtoa.o: Python/dtoa.c
> +
>   # Run reindent on the library
>   reindent:
>  -      ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)=
/Lib
>  +      $(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Li=
b
> -
> +
>   # Rerun configure with the same options as it was run last time,
>   # provided the config.status script exists
> -@@ -1678,7 +1680,7 @@ funny:
> -
> +@@ -1744,7 +1746,7 @@ funny:
> +
>   # Perform some verification checks on any modified files.
>   patchcheck: @DEF_MAKE_RULE@
>  -      $(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.=
py
>  +      $(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -
> +
>   # Dependencies
> -
> ---
> -2.11.0
> +
> +--
> +2.17.1
>
> diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-targe=
t-to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/=
0002-Makefile-add-target-to-split-profile-generation.patch
> deleted file mode 100644
> index bb01c5bcb4..0000000000
> --- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-sp=
lit-profile-generation.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001
> -From: Anuj Mittal <anuj.mittal@intel.com>
> -Date: Tue, 7 Aug 2018 16:43:17 +0800
> -Subject: [PATCH 2/2] Makefile: add target to split profile generation
> -
> -We don't want to have profile task invoked from here and want to use
> -qemu-user instead. Split the profile-opt task so qemu can be invoked
> -once binaries have been built with instrumentation and then we can go
> -ahead and build again using the profile data generated.
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Makefile.pre.in | 6 ++----
> - 1 file changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 84bc3ff..017a2c4 100644
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -469,13 +469,11 @@ profile-opt:
> -       $(MAKE) profile-removal
> -       $(MAKE) build_all_generate_profile
> -       $(MAKE) profile-removal
> --      @echo "Running code to generate profile data (this can take a whi=
le):"
> --      $(MAKE) run_profile_task
> --      $(MAKE) build_all_merge_profile
> -+
> -+clean_and_use_profile:
> -       @echo "Rebuilding with profile guided optimizations:"
> -       $(MAKE) clean
> -       $(MAKE) build_all_use_profile
> --      $(MAKE) profile-removal
> -
> - build_all_generate_profile:
> -       $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS=
) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLA=
G) @LTOFLAGS@" LIBS=3D"$(LIBS)"
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/python/python3/03-fix-tkinter-detectio=
n.patch b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.pat=
ch
> index fddfd2b2f6..b916d04d05 100644
> --- a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> +++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> @@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]
>  # will not be found.
>  # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
>
> -Index: Python-3.3.0rc2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.0rc2.orig/setup.py      2012-09-20 15:24:14.009124003 -07=
00
> -+++ Python-3.3.0rc2/setup.py   2012-09-20 15:25:08.449124963 -0700
> -@@ -1620,7 +1620,7 @@
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..7f0e4d1010 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):
>                   dotversion =3D dotversion[:-1] + '.' + dotversion[-1]
>               tcl_include_sub =3D []
>               tk_include_sub =3D []
> @@ -17,7 +17,7 @@ Index: Python-3.3.0rc2/setup.py
>                   tcl_include_sub +=3D [dir + os.sep + "tcl" + dotversion=
]
>                   tk_include_sub +=3D [dir + os.sep + "tk" + dotversion]
>               tk_include_sub +=3D tcl_include_sub
> -@@ -1639,22 +1639,6 @@
> +@@ -1822,22 +1822,6 @@ class PyBuildExt(build_ext):
>               if dir not in include_dirs:
>                   include_dirs.append(dir)
>
> diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.=
patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> index 6beac7b805..c12f11c6e7 100644
> --- a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> +++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> @@ -22,12 +22,3 @@ Index: Python-3.3.2/setup.py
>
>           # Add paths specified in the environment variables LDFLAGS and
>           # CPPFLAGS for header and library files.
> -@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.base_prefix) !=3D '/usr' \
> -+        if not cross_compiling and os.path.normpath(sys.base_prefix) !=
=3D '/usr' \
> -                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a f=
ramework
> -             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
> diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adju=
st_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_ad=
just_files.patch
> index b96419a638..1bd6e56117 100644
> --- a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_file=
s.patch
> +++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_file=
s.patch
> @@ -14,11 +14,11 @@ Upstream-Status: Inappropriate [Embedded-Specific]
>
>
>       def copy_scripts(self):
> --        """Copy each script listed in 'self.scripts'; if it's marked as=
 a
> +-        r"""Copy each script listed in 'self.scripts'; if it's marked a=
s a
>  -        Python script in the Unix way (first line matches 'first_line_r=
e',
>  -        ie. starts with "\#!" and contains "python"), then adjust the f=
irst
>  -        line to refer to the current Python interpreter as we copy.
> -+        """Copy each script listed in 'self.scripts'
> ++        r"""Copy each script listed in 'self.scripts'
>           """
>           self.mkpath(self.build_dir)
>           outfiles =3D []
> diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch=
 b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
> deleted file mode 100644
> index 78d7c78670..0000000000
> --- a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Fix warning with newer compiler
> -
> --Khem
> -
> -Upstream-Status: Pending
> -
> ---- a/Modules/_cursesmodule.c
> -+++ b/Modules/_cursesmodule.c
> -@@ -116,7 +116,7 @@ char *PyCursesVersion =3D "2.2";
> -     #defines many common symbols (such as "lines") which breaks the
> -     curses module in other ways.  So the code will just specify
> -     explicit prototypes here. */
> --extern int setupterm(char *,int,int *);
> -+//extern int setupterm(char *,int,int *);
> - #ifdef __sgi
> - #include <term.h>
> - #endif
> diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-=
extensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/=
Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> index ae74ef531d..35b849e399 100644
> --- a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensi=
ons-when-cross-compili.patch
> +++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensi=
ons-when-cross-compili.patch
> @@ -9,6 +9,11 @@ profile-optimized build.
>
>  Upstream-Status: Pending
>
> +2018-08:
> +  * Rebased Makefile.pre.in for 3.7
> +  * Remove patch for setup.py in favor of upstream fix
> +  -- Jens
> +
>  Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>  ---
>   Makefile.pre.in | 4 ++--
> @@ -16,41 +21,31 @@ Signed-off-by: Markus Lehtonen <markus.lehtonen@linux=
.intel.com>
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index e2d5d3d..84bc3ff 100644
> +index 4c23c0e411..0871c98f29 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -478,7 +478,7 @@ profile-opt:
> -       $(MAKE) profile-removal
> +@@ -497,6 +497,7 @@ profile-run-stamp:
>
>   build_all_generate_profile:
> --      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_GEN=
_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" L=
IBS=3D"$(LIBS)"
> -+      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS=
) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLA=
G) @LTOFLAGS@" LIBS=3D"$(LIBS)"
> +       $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_GEN=
_FLAG)" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" LIBS=3D"$(LIBS)"
> ++      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS=
) $(PGO_PROF_GEN_FLAG)" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" LIBS=3D=
"$(LIBS)"
>
>   run_profile_task:
> -       : # FIXME: can't run for a cross build
> -@@ -488,7 +488,7 @@ build_all_merge_profile:
> -       $(LLVM_PROF_MERGER)
> -
> - build_all_use_profile:
> --      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_USE=
_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) @LTOFLAGS@"
> -+      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS=
) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) @LTOFLAGS@"
> +       @ # FIXME: can't run for a cross build
> +@@ -510,14 +511,14 @@ build_all_merge_profile:
> + profile-opt: profile-run-stamp
> +       @echo "Rebuilding with profile guided optimizations:"
> +       -rm -f profile-clean-stamp
> +-      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_USE=
_FLAG)" LDFLAGS=3D"$(LDFLAGS)"
> ++      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS=
) $(PGO_PROF_USE_FLAG)" LDFLAGS=3D"$(LDFLAGS)"
>
>   # Compile and run with gcov
>   .PHONY=3Dcoverage coverage-lcov coverage-report
> -diff --git a/setup.py b/setup.py
> -index add3346..65e83b1 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
> -         # compilers
> -         if compiler is not None:
> -             if cross_compiling:
> --                (ccshared,cflags) =3D (os.environ.get('CCSHARED') or ''=
, os.environ.get('CFLAGS') or '')
> -+                (ccshared,cflags) =3D (os.environ.get('CCSHARED') or ''=
,
> -+                                     (os.environ.get('CFLAGS') or '') +=
 ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
> -             else:
> -                 (ccshared,cflags) =3D sysconfig.get_config_vars('CCSHAR=
ED','CFLAGS')
> -             args['compiler_so'] =3D compiler + ' ' + ccshared + ' ' + c=
flags
> ---
> -2.17.1
> -
> + coverage:
> +       @echo "Building with support for coverage checking:"
> +       $(MAKE) clean profile-removal
> +-      $(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D"$(CFLAGS) -O0 -pg -fprofile-arc=
s -ftest-coverage" LIBS=3D"$(LIBS) -lgcov"
> ++      $(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D"$(CFLAGS) $(EXTRA_CFLAGS) -O0 -=
pg -fprofile-arcs -ftest-coverage" LIBS=3D"$(LIBS) -lgcov"
> +
> + coverage-lcov:
> +       @echo "Creating Coverage HTML report with LCOV:"
> diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-=
path.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-pa=
th.patch
> index f29ae53371..7e1dc4ef5b 100644
> --- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.pa=
tch
> +++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.pa=
tch
> @@ -6,16 +6,16 @@ hardcoded locations for include paths
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: Python-3.4.2/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.4.2.orig/configure.ac
> -+++ Python-3.4.2/configure.ac
> -@@ -4434,7 +4434,7 @@ fi
> -
> +diff --git a/configure.ac b/configure.ac
> +index 2b8aa4d592..1f5bf4b4b0 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -4976,7 +4976,7 @@ fi
>   # first curses header check
>   ac_save_cppflags=3D"$CPPFLAGS"
> --CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
> -+CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> + if test "$cross_compiling" =3D no; then
> +-  CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
> ++  CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> + fi
>
>   AC_CHECK_HEADERS(curses.h ncurses.h)
> -
> diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tki=
nter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkint=
er.patch
> index a3cc48c9a4..ebdd64b7b5 100644
> --- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.pa=
tch
> +++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.pa=
tch
> @@ -5,13 +5,17 @@ Avoid a warning by not adding this module to missing va=
riable.
>  Upstream-Status: Inappropriate [distribution]
>
>  Also simply disable the tk module since its not in DEPENDS.
> +
> +2018-08: Rebased for 3.7.0
> +  -- Jens
> +
>  Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>
> -Index: Python-3.5.3/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.3.orig/setup.py
> -+++ Python-3.5.3/setup.py
> -@@ -1558,10 +1558,12 @@ class PyBuildExt(build_ext):
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..0321245761 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1608,10 +1608,12 @@ class PyBuildExt(build_ext):
>           self.extensions.extend(exts)
>
>           # Call the method for detecting whether _tkinter can be compile=
d
> @@ -25,5 +29,5 @@ Index: Python-3.5.3/setup.py
>  +        #if '_tkinter' not in [e.name for e in self.extensions]:
>  +        #    missing.append('_tkinter')
>
> - ##         # Uncomment these lines if you want to play with xxmodule.c
> - ##         ext =3D Extension('xx', ['xxmodule.c'])
> +         # Build the _uuid module if possible
> +         uuid_incs =3D find_file("uuid.h", inc_dirs, ["/usr/include/uuid=
"])
> diff --git a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.=
patch b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> index 97214f9aa4..689baf00ad 100644
> --- a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> +++ b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> @@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that it would wor=
k when lib64.
>
>  Upstream-Status: Pending
>
> +2018-08: rebased and adopted for 3.7
> +  -- Jens
> +
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
>   configure.ac |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 63aef8e..aefb27f 100644
> +index 2b8aa4d592..0da15fbbdf 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -4366,7 +4366,7 @@ AC_MSG_RESULT($LDVERSION)
> -
> +@@ -4674,9 +4674,9 @@ AC_MSG_RESULT($LDVERSION)
>   dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
>   AC_SUBST(PY_ENABLE_SHARED)
> --LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> -+LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + if test x$PLATFORM_TRIPLET =3D x; then
> +-  LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> ++  LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + else
> +-  LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATF=
ORM_TRIPLET}"
> ++  LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_=
TRIPLET}"
> + fi
>   AC_SUBST(LIBPL)
>
> - # Check whether right shifting a negative integer extends the sign bit
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/python/python3/pass-missing-libraries-=
to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/pass-miss=
ing-libraries-to-Extension-for-mul.patch
> index 5c3af6b626..1ce4defe95 100644
> --- a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Exte=
nsion-for-mul.patch
> +++ b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Exte=
nsion-for-mul.patch
> @@ -47,16 +47,19 @@ And the semaphore issue also caused multiprocessing.Q=
ueue().put() hung.
>
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
>
> +2018-08: rebased for 3.7
> +  -- Jens
> +
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   setup.py | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index 4f0f522..d05707d 100644
> +index a97a7559ca..633eba8f1e 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1606,8 +1606,10 @@ class PyBuildExt(build_ext):
> +@@ -1580,8 +1580,10 @@ class PyBuildExt(build_ext):
>           elif host_platform.startswith('netbsd'):
>               macros =3D dict()
>               libraries =3D []
> @@ -69,14 +72,11 @@ index 4f0f522..d05707d 100644
>               macros =3D dict()
>               libraries =3D ['rt']
>
> -@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):
> -         if sysconfig.get_config_var('WITH_THREAD'):
> -             exts.append ( Extension('_multiprocessing', multiprocessing=
_srcs,
> -                                     define_macros=3Dlist(macros.items()=
),
> -+                                    libraries=3Dlibraries,
> -                                     include_dirs=3D["Modules/_multiproc=
essing"]))
> -         else:
> -             missing.append('_multiprocessing')
> ---
> -2.7.4
> -
> +@@ -1599,6 +1601,7 @@ class PyBuildExt(build_ext):
> +
> +         exts.append ( Extension('_multiprocessing', multiprocessing_src=
s,
> +                                 define_macros=3Dlist(macros.items()),
> ++                                libraries=3Dlibraries,
> +                                 include_dirs=3D["Modules/_multiprocessi=
ng"]))
> +         # End multiprocessing
> +
> diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.pat=
ch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> index cc35dc1617..d5bafbfba1 100644
> --- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> +++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> @@ -4,7 +4,7 @@ Date: Tue, 14 May 2013 15:00:26 -0700
>  Subject: [PATCH 01/13] get the sys.lib from python itself and do not use
>   hardcoded value of 'lib'
>
> -02/2015 Rebased for 3.4.2
> +08/2018 Rebased for 3.7.0
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> @@ -25,12 +25,12 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernand=
ez@linux.intel.com>
>   setup.py                         |  9 ++++-----
>   12 files changed, 97 insertions(+), 23 deletions(-)
>
> -Index: Python-3.5.4/Include/pythonrun.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Include/pythonrun.h
> -+++ Python-3.5.4/Include/pythonrun.h
> -@@ -23,6 +23,9 @@ typedef struct {
> - } PyCompilerFlags;
> +diff --git a/Include/pythonrun.h b/Include/pythonrun.h
> +index 6f0c6fc655..95a597b412 100644
> +--- a/Include/pythonrun.h
> ++++ b/Include/pythonrun.h
> +@@ -7,6 +7,9 @@
> + extern "C" {
>   #endif
>
>  +PyAPI_FUNC(const char *) Py_GetArch(void);
> @@ -39,10 +39,10 @@ Index: Python-3.5.4/Include/pythonrun.h
>   #ifndef Py_LIMITED_API
>   PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *=
);
>   PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlag=
s *);
> -Index: Python-3.5.4/Lib/distutils/command/install.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/distutils/command/install.py
> -+++ Python-3.5.4/Lib/distutils/command/install.py
> +diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/in=
stall.py
> +index 0258d3deae..352fd8f792 100644
> +--- a/Lib/distutils/command/install.py
> ++++ b/Lib/distutils/command/install.py
>  @@ -19,6 +19,8 @@ from site import USER_BASE
>   from site import USER_SITE
>   HAS_USER_SITE =3D True
> @@ -63,11 +63,11 @@ Index: Python-3.5.4/Lib/distutils/command/install.py
>           'headers': '$base/include/python$py_version_short$abiflags/$dis=
t_name',
>           'scripts': '$base/bin',
>           'data'   : '$base',
> -Index: Python-3.5.4/Lib/pydoc.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/pydoc.py
> -+++ Python-3.5.4/Lib/pydoc.py
> -@@ -389,7 +389,7 @@ class Doc:
> +diff --git a/Lib/pydoc.py b/Lib/pydoc.py
> +index 8a6b27b16e..fc55893b18 100644
> +--- a/Lib/pydoc.py
> ++++ b/Lib/pydoc.py
> +@@ -399,7 +399,7 @@ class Doc:
>       docmodule =3D docclass =3D docroutine =3D docother =3D docproperty =
=3D docdata =3D fail
>
>       def getdocloc(self, object,
> @@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py
>                                          "python%d.%d" %  sys.version_inf=
o[:2])):
>           """Return the location of module docs or None"""
>
> -Index: Python-3.5.4/Lib/site.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/site.py
> -+++ Python-3.5.4/Lib/site.py
> -@@ -303,12 +303,12 @@ def getsitepackages(prefixes=3DNone):
> +diff --git a/Lib/site.py b/Lib/site.py
> +index ffd132b389..3ca8270d49 100644
> +--- a/Lib/site.py
> ++++ b/Lib/site.py
> +@@ -334,12 +334,12 @@ def getsitepackages(prefixes=3DNone):
>           seen.add(prefix)
>
>           if os.sep =3D=3D '/':
>  -            sitepackages.append(os.path.join(prefix, "lib",
> +-                                        "python%d.%d" % sys.version_inf=
o[:2],
>  +            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> ++                                        "python%d.%d" % sys.version_inf=
o[:2],
>                                           "site-packages"))
>           else:
>               sitepackages.append(prefix)
>  -            sitepackages.append(os.path.join(prefix, "lib", "site-packa=
ges"))
>  +            sitepackages.append(os.path.join(prefix, sys.lib, "site-pac=
kages"))
> -         if sys.platform =3D=3D "darwin":
> -             # for framework builds *only* we add the standard Apple
> -             # locations.
> -Index: Python-3.5.4/Lib/sysconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/sysconfig.py
> -+++ Python-3.5.4/Lib/sysconfig.py
> +     return sitepackages
> +
> + def addsitepackages(known_paths, prefixes=3DNone):
> +diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> +index e0f9c18531..9869363977 100644
> +--- a/Lib/sysconfig.py
> ++++ b/Lib/sysconfig.py
>  @@ -20,10 +20,10 @@ __all__ =3D [
>
>   _INSTALL_SCHEMES =3D {
> @@ -129,7 +130,7 @@ Index: Python-3.5.4/Lib/sysconfig.py
>           'include': '{installed_base}/include/python',
>           'platinclude': '{installed_base}/include/python',
>           'scripts': '{base}/bin',
> -@@ -61,10 +61,10 @@ _INSTALL_SCHEMES =3D {
> +@@ -62,10 +62,10 @@ _INSTALL_SCHEMES =3D {
>           'data': '{userbase}',
>           },
>       'posix_user': {
> @@ -144,28 +145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py
>           'include': '{userbase}/include/python{py_version_short}',
>           'scripts': '{userbase}/bin',
>           'data': '{userbase}',
> -Index: Python-3.5.4/Lib/trace.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/trace.py
> -+++ Python-3.5.4/Lib/trace.py
> -@@ -749,10 +749,10 @@ def main(argv=3DNone):
> -                 # should I also call expanduser? (after all, could use =
$HOME)
> +diff --git a/Lib/trace.py b/Lib/trace.py
> +index 86b2101763..f3c32ec317 100755
> +--- a/Lib/trace.py
> ++++ b/Lib/trace.py
> +@@ -659,7 +659,7 @@ def main():
> +     opts =3D parser.parse_args()
> +
> +     if opts.ignore_dir:
> +-        rel_path =3D 'lib', 'python{0.major}.{0.minor}'.format(sys.vers=
ion_info)
> ++        rel_path =3D sys.lib, 'python{0.major}.{0.minor}'.format(sys.ve=
rsion_info)
> +         _prefix =3D os.path.join(sys.base_prefix, *rel_path)
> +         _exec_prefix =3D os.path.join(sys.base_exec_prefix, *rel_path)
>
> -                 s =3D s.replace("$prefix",
> --                              os.path.join(sys.base_prefix, "lib",
> -+                              os.path.join(sys.base_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s =3D s.replace("$exec_prefix",
> --                              os.path.join(sys.base_exec_prefix, "lib",
> -+                              os.path.join(sys.base_exec_prefix, sys.li=
b,
> -                                            "python" + sys.version[:3]))
> -                 s =3D os.path.normpath(s)
> -                 ignore_dirs.append(s)
> -Index: Python-3.5.4/Makefile.pre.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Makefile.pre.in
> -+++ Python-3.5.4/Makefile.pre.in
> -@@ -109,6 +109,8 @@ CFLAGS_ALIASING=3D@CFLAGS_ALIASING@
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 31b4bcabb3..713215e57d 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -114,6 +114,8 @@ CFLAGS_ALIASING=3D@CFLAGS_ALIASING@
>
>   # Machine-dependent subdirectories
>   MACHDEP=3D      @MACHDEP@
> @@ -174,7 +171,7 @@ Index: Python-3.5.4/Makefile.pre.in
>
>   # Multiarch directory (may be empty)
>   MULTIARCH=3D    @MULTIARCH@
> -@@ -128,7 +130,7 @@ LIBDIR=3D            @libdir@
> +@@ -134,7 +136,7 @@ LIBDIR=3D            @libdir@
>   MANDIR=3D               @mandir@
>   INCLUDEDIR=3D   @includedir@
>   CONFINCLUDEDIR=3D       $(exec_prefix)/include
> @@ -183,7 +180,7 @@ Index: Python-3.5.4/Makefile.pre.in
>   ABIFLAGS=3D     @ABIFLAGS@
>
>   # Detailed destination directories
> -@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
> +@@ -754,6 +756,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makef=
ile
>                 -DEXEC_PREFIX=3D'"$(exec_prefix)"' \
>                 -DVERSION=3D'"$(VERSION)"' \
>                 -DVPATH=3D'"$(VPATH)"' \
> @@ -191,8 +188,8 @@ Index: Python-3.5.4/Makefile.pre.in
>                 -o $@ $(srcdir)/Modules/getpath.c
>
>   Programs/python.o: $(srcdir)/Programs/python.c
> -@@ -813,7 +816,7 @@ regen-opcode:
> - Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/gram=
init.h $(srcdir)/Include/Python-ast.h
> +@@ -842,7 +845,7 @@ regen-opcode:
> + Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $=
(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
>
>   Python/getplatform.o: $(srcdir)/Python/getplatform.c
>  -              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' -o=
 $@ $(srcdir)/Python/getplatform.c
> @@ -200,11 +197,11 @@ Index: Python-3.5.4/Makefile.pre.in
>
>   Python/importdl.o: $(srcdir)/Python/importdl.c
>                 $(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)=
/Python/importdl.c
> -Index: Python-3.5.4/Modules/getpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Modules/getpath.c
> -+++ Python-3.5.4/Modules/getpath.c
> -@@ -105,6 +105,13 @@
> +diff --git a/Modules/getpath.c b/Modules/getpath.c
> +index 041cb14b4b..d52d1e1cdb 100644
> +--- a/Modules/getpath.c
> ++++ b/Modules/getpath.c
> +@@ -106,6 +106,13 @@ extern "C" {
>   #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant define=
d"
>   #endif
>
> @@ -218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c
>   #ifndef LANDMARK
>   #define LANDMARK L"os.py"
>   #endif
> -@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];
> - static wchar_t exec_prefix[MAXPATHLEN+1];
> - static wchar_t progpath[MAXPATHLEN+1];
> - static wchar_t *module_search_path =3D NULL;
> -+static wchar_t *lib_python =3D L"" LIB_PYTHON;
> -
> - /* Get file status. Encode the path to the locale encoding. */
> -
> -@@ -494,7 +502,7 @@ calculate_path(void)
> -     _pythonpath =3D Py_DecodeLocale(PYTHONPATH, NULL);
> -     _prefix =3D Py_DecodeLocale(PREFIX, NULL);
> -     _exec_prefix =3D Py_DecodeLocale(EXEC_PREFIX, NULL);
> --    lib_python =3D Py_DecodeLocale("lib/python" VERSION, NULL);
> -+    lib_python =3D Py_DecodeLocale(LIB_PYTHON, NULL);
> -
> -     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
> -         Py_FatalError(
> -Index: Python-3.5.4/Python/getplatform.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Python/getplatform.c
> -+++ Python-3.5.4/Python/getplatform.c
> +@@ -867,7 +874,7 @@ calculate_init(PyCalculatePath *calculate,
> +     if (!calculate->prefix) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> +-    calculate->lib_python =3D Py_DecodeLocale("lib/python" VERSION, &le=
n);
> ++    calculate->lib_python =3D Py_DecodeLocale(LIB_PYTHON, &len);
> +     if (!calculate->lib_python) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> +diff --git a/Python/getplatform.c b/Python/getplatform.c
> +index 81a0f7ac53..bc7127ae3e 100644
> +--- a/Python/getplatform.c
> ++++ b/Python/getplatform.c
>  @@ -10,3 +10,23 @@ Py_GetPlatform(void)
>   {
> -       return PLATFORM;
> +     return PLATFORM;
>   }
>  +
>  +#ifndef ARCH
> @@ -263,11 +252,11 @@ Index: Python-3.5.4/Python/getplatform.c
>  +{
>  +      return LIB;
>  +}
> -Index: Python-3.5.4/Python/sysmodule.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Python/sysmodule.c
> -+++ Python-3.5.4/Python/sysmodule.c
> -@@ -1827,6 +1827,10 @@ _PySys_Init(void)
> +diff --git a/Python/sysmodule.c b/Python/sysmodule.c
> +index 177b830762..38112b831e 100644
> +--- a/Python/sysmodule.c
> ++++ b/Python/sysmodule.c
> +@@ -2324,6 +2324,10 @@ _PySys_BeginInit(PyObject **sysmod)
>                           PyUnicode_FromString(Py_GetCopyright()));
>       SET_SYS_FROM_STRING("platform",
>                           PyUnicode_FromString(Py_GetPlatform()));
> @@ -275,16 +264,16 @@ Index: Python-3.5.4/Python/sysmodule.c
>  +                        PyUnicode_FromString(Py_GetArch()));
>  +    SET_SYS_FROM_STRING("lib",
>  +                        PyUnicode_FromString(Py_GetLib()));
> -     SET_SYS_FROM_STRING("executable",
> -                         PyUnicode_FromWideChar(
> -                                Py_GetProgramFullPath(), -1));
> -Index: Python-3.5.4/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/configure.ac
> -+++ Python-3.5.4/configure.ac
> -@@ -885,6 +885,41 @@ PLATDIR=3Dplat-$MACHDEP
> - AC_SUBST(PLATDIR)
> - AC_SUBST(PLATFORM_TRIPLET)
> +     SET_SYS_FROM_STRING("maxsize",
> +                         PyLong_FromSsize_t(PY_SSIZE_T_MAX));
> +     SET_SYS_FROM_STRING("float_info",
> +diff --git a/configure.ac b/configure.ac
> +index 5b66624d78..1c88696532 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -867,6 +867,41 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
> + LDFLAGS=3D"$save_LDFLAGS"
> + AC_SUBST(NO_AS_NEEDED)
>
>  +AC_SUBST(ARCH)
>  +AC_MSG_CHECKING(ARCH)
> @@ -322,13 +311,13 @@ Index: Python-3.5.4/configure.ac
>  +esac
>  +AC_MSG_RESULT($LIB)
>
> - AC_MSG_CHECKING([for -Wl,--no-as-needed])
> - save_LDFLAGS=3D"$LDFLAGS"
> -Index: Python-3.5.4/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/setup.py
> -+++ Python-3.5.4/setup.py
> -@@ -494,7 +494,7 @@ class PyBuildExt(build_ext):
> + # checks for UNIX variants that set C preprocessor variables
> + AC_USE_SYSTEM_EXTENSIONS
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..b82b7177bc 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -541,7 +541,7 @@ class PyBuildExt(build_ext):
>           # directories (i.e. '.' and 'Include') must be first.  See issu=
e
>           # 10520.
>           if not cross_compiling:
> @@ -337,17 +326,16 @@ Index: Python-3.5.4/setup.py
>               add_dir_to_list(self.compiler.include_dirs, '/usr/local/inc=
lude')
>           # only change this for cross builds for 3.3, issues on Mageia
>           if cross_compiling:
> -@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):
> -         # be assumed that no additional -I,-L directives are needed.
> -         if not cross_compiling:
> -             lib_dirs =3D self.compiler.library_dirs + [
> --                '/lib64', '/usr/lib64',
> --                '/lib', '/usr/lib',
> -+                '/' + sys.lib, '/usr/' + sys.lib,
> -                 ]
> -             inc_dirs =3D self.compiler.include_dirs + ['/usr/include']
> -         else:
> -@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):
> +@@ -579,7 +579,7 @@ class PyBuildExt(build_ext):
> +             add_dir_to_list(self.compiler.include_dirs,
> +                             sysconfig.get_config_var("INCLUDEDIR"))
> +
> +-        system_lib_dirs =3D ['/lib64', '/usr/lib64', '/lib', '/usr/lib'=
]
> ++        system_lib_dirs =3D ['/' + sys.lib, '/usr/' + sys.lib]
> +         system_include_dirs =3D ['/usr/include']
> +         # lib_dirs and inc_dirs are used to search for files;
> +         # if a file is found in one of those directories, it can
> +@@ -836,11 +836,11 @@ class PyBuildExt(build_ext):
>               elif curses_library:
>                   readline_libs.append(curses_library)
>               elif self.compiler.find_library_file(lib_dirs +
> @@ -361,3 +349,26 @@ Index: Python-3.5.4/setup.py
>                                      extra_link_args=3Dreadline_extra_lin=
k_args,
>                                      libraries=3Dreadline_libs) )
>           else:
> +@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):
> +
> +                 # check lib directories parallel to the location of the=
 header
> +                 db_dirs_to_check =3D [
> +-                    db_incdir.replace("include", 'lib64'),
> +-                    db_incdir.replace("include", 'lib'),
> ++                    db_incdir.replace("include", sys.lib),
> +                 ]
> +
> +                 if host_platform !=3D 'darwin':
> +@@ -1166,10 +1165,8 @@ class PyBuildExt(build_ext):
> +
> +         if sqlite_incdir:
> +             sqlite_dirs_to_check =3D [
> +-                os.path.join(sqlite_incdir, '..', 'lib64'),
> +-                os.path.join(sqlite_incdir, '..', 'lib'),
> +-                os.path.join(sqlite_incdir, '..', '..', 'lib64'),
> +-                os.path.join(sqlite_incdir, '..', '..', 'lib'),
> ++                os.path.join(sqlite_incdir, '..', sys.lib),
> ++                os.path.join(sqlite_incdir, '..', '..', sys.lib),
> +             ]
> +             sqlite_libfile =3D self.compiler.find_library_file(
> +                                 sqlite_dirs_to_check + lib_dirs, 'sqlit=
e3')
> diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHON=
PATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/pyth=
on3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> index a4f8bd4710..c6aa581b4c 100644
> --- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-fo=
r-PYTHON_FOR_BUILD.patch
> +++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-fo=
r-PYTHON_FOR_BUILD.patch
> @@ -5,21 +5,24 @@ Subject: [PATCH] python3 use CROSSPYTHONPATH for PYTHON=
_FOR_BUILD
>
>  Upstream-Status: Inappropriate [Cross compile specific]
>
> +2018-08: Rebased and adopted for 3.7
> +  -- Jens
> +
>  Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>  ---
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: Python-3.5.4/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/configure.ac
> -+++ Python-3.5.4/configure.ac
> -@@ -73,7 +73,7 @@ if test "$cross_compiling" =3D yes; then
> +diff --git a/configure.ac b/configure.ac
> +index 2b8aa4d592..a361436f4f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -75,7 +75,7 @@ if test "$cross_compiling" =3D yes; then
>             AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>         fi
>           AC_MSG_RESULT($interp)
> --      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHO=
N_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell test -f pyb=
uilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(s=
rcdir)/Lib/$(PLATDIR) '$interp
> -+      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHO=
N_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(CROSSPYTHONPATH) =
'$interp
> +-      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHO=
N_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell test -f pyb=
uilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PY=
THON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH=
) '$interp
> ++      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHO=
N_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(CROSSPYTHONPATH) =
_PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIA=
RCH) '$interp
>       fi
>   elif test "$cross_compiling" =3D maybe; then
>       AC_MSG_ERROR([Cross compiling required --host=3DHOST-TUPLE and --bu=
ild=3DARCH])
> diff --git a/meta/recipes-devtools/python/python3/regen-all.patch b/meta/=
recipes-devtools/python/python3/regen-all.patch
> deleted file mode 100644
> index 36b9d9d919..0000000000
> --- a/meta/recipes-devtools/python/python3/regen-all.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -python3-native: run regen-importlib target correctly
> -
> -regen-importlib depends on other regen- targets, so we must be sure to
> -run it after (most of) the others.  In reality, we do not need to run it
> -at all since "make" will invoke it, if necessary.  We do not want to
> -rely on that, though.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> -
> -
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -709,7 +709,8 @@ regen-importlib: Programs/_freeze_import
> - #######################################################################=
#####
> - # Regenerate all generated files
> -
> --regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-gram=
mar regen-ast regen-importlib
> -+regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-gram=
mar regen-ast
> -+      $(MAKE) regen-importlib
> -
> - #######################################################################=
#####
> - # Special rules for object files
> diff --git a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPO=
CH_in_py_compile.patch b/meta/recipes-devtools/python/python3/support_SOURC=
E_DATE_EPOCH_in_py_compile.patch
> index 32ecab9fec..058cfdbc2d 100644
> --- a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_p=
y_compile.patch
> +++ b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_p=
y_compile.patch
> @@ -36,12 +36,12 @@ The software will still work, but it will not use the=
 .pyc file as it should.
>   3 files changed, 27 insertions(+)
>
>  diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst
> -index 0af8fb1..841f3e8 100644
> +index d720e01050..c8cc738f3d 100644
>  --- a/Doc/library/py_compile.rst
>  +++ b/Doc/library/py_compile.rst
> -@@ -53,6 +53,10 @@ byte-code cache files in the directory containing the=
 source code.
> -    :func:`compile` function.  The default of ``-1`` selects the optimiz=
ation
> -    level of the current interpreter.
> +@@ -59,6 +59,10 @@ byte-code cache files in the directory containing the=
 source code.
> +    *invalidation_mode* will be forced to
> +    :attr:`PycInvalidationMode.CHECKED_HASH`.
>
>  +   If the SOURCE_DATE_EPOCH environment variable is set, the .py file m=
time
>  +   and timestamp entry in .pyc file header, will be limited to this val=
ue.
> @@ -51,27 +51,27 @@ index 0af8fb1..841f3e8 100644
>         Changed default value of *cfile* to be :PEP:`3147`-compliant.  Pr=
evious
>         default was *file* + ``'c'`` (``'o'`` if optimization was enabled=
).
>  diff --git a/Lib/py_compile.py b/Lib/py_compile.py
> -index 11c5b50..62dcdc7 100644
> +index 16dc0a011f..b7c28e4fdd 100644
>  --- a/Lib/py_compile.py
>  +++ b/Lib/py_compile.py
> -@@ -137,6 +137,10 @@ def compile(file, cfile=3DNone, dfile=3DNone, dorai=
se=3DFalse, optimize=3D-1):
> -     except FileExistsError:
> +@@ -149,6 +149,10 @@ def compile(file, cfile=3DNone, dfile=3DNone, dorai=
se=3DFalse, optimize=3D-1,
>           pass
> -     source_stats =3D loader.path_stats(file)
> -+    sde =3D os.environ.get('SOURCE_DATE_EPOCH')
> -+    if sde and source_stats['mtime'] > int(sde):
> -+        source_stats['mtime'] =3D int(sde)
> -+        os.utime(file, (source_stats['mtime'], source_stats['mtime']))
> -     bytecode =3D importlib._bootstrap_external._code_to_bytecode(
> +     if invalidation_mode =3D=3D PycInvalidationMode.TIMESTAMP:
> +         source_stats =3D loader.path_stats(file)
> ++        sde =3D os.environ.get('SOURCE_DATE_EPOCH')
> ++        if sde and source_stats['mtime'] > int(sde):
> ++            source_stats['mtime'] =3D int(sde)
> ++            os.utime(file, (source_stats['mtime'], source_stats['mtime'=
]))
> +         bytecode =3D importlib._bootstrap_external._code_to_timestamp_p=
yc(
>               code, source_stats['mtime'], source_stats['size'])
> -     mode =3D importlib._bootstrap_external._calc_mode(file)
> +     else:
>  diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py
> -index 4a6caa5..3d09963 100644
> +index 8fc0b3308c..1445a14548 100644
>  --- a/Lib/test/test_py_compile.py
>  +++ b/Lib/test/test_py_compile.py
> -@@ -98,6 +98,25 @@ def test_bad_coding(self):
> -         self.assertFalse(os.path.exists(
> -             importlib.util.cache_from_source(bad_coding)))
> +@@ -110,6 +110,25 @@ class PyCompileTests(unittest.TestCase):
> +                 fp.read(), 'test', {})
> +         self.assertEqual(flags, 0b11)
>
>  +    def test_source_date_epoch(self):
>  +        testtime =3D 123456789
> diff --git a/meta/recipes-devtools/python/python3/sysroot-include-headers=
.patch b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> index 785b5567f2..d5983544c4 100644
> --- a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> +++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> @@ -6,26 +6,27 @@ Should fix things like
>  configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb=
-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 -DNDEBUG -fno=
-inline -D__SOFTFP__ --sysroot=3D/build/v2013.06/build/tmp-angstrom_v2013_0=
6-eglibc/sysroots/beaglebone -c -O2 -pipe -g -feliminate-unused-debug-types=
  -I/usr/include/ncursesw conftest.c >&5
>  cc1: warning: include location "/usr/include/ncursesw" is unsafe for cro=
ss-compilation [-Wpoison-system-directories]
>
> +2018-08: Rebased to 3.7.0
> +  -- Jens
>
>  Signed-off-by: Khem Raj
>  Upstream-Status: Pending
>
> -
> -Index: Python-3.3.2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/setup.py 2013-07-30 01:30:48.000000000 -0700
> -+++ Python-3.3.2/setup.py      2013-07-30 01:41:11.697862723 -0700
> -@@ -1210,7 +1210,7 @@
> -         panel_library =3D 'panel'
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..41e88a152b 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1333,7 +1333,7 @@ class PyBuildExt(build_ext):
>           if curses_library =3D=3D 'ncursesw':
>               curses_defines.append(('HAVE_NCURSESW', '1'))
> --            curses_includes.append('/usr/include/ncursesw')
> -+            curses_includes.append('=3D/usr/include/ncursesw')
> +             if not cross_compiling:
> +-                curses_includes.append('/usr/include/ncursesw')
> ++                curses_includes.append('=3D/usr/include/ncursesw')
>               # Bug 1464056: If _curses.so links with ncursesw,
>               # _curses_panel.so must link with panelw.
>               panel_library =3D 'panelw'
> -@@ -1819,7 +1819,7 @@
> -         if host_platform =3D=3D 'darwin':
> +@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
> +                 return
>               # OS X 10.5 comes with libffi.dylib; the include files are
>               # in /usr/include/ffi
>  -            inc_dirs.append('/usr/include/ffi')
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes=
-devtools/python/python3_3.5.5.bb
> deleted file mode 100644
> index bfe91fb1c7..0000000000
> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> +++ /dev/null
> @@ -1,346 +0,0 @@
> -require recipes-devtools/python/python.inc
> -
> -DEPENDS =3D "python3-native libffi bzip2 gdbm openssl \
> -           sqlite3 zlib virtual/libintl xz qemu-native \
> -           qemu-helper-native virtual/crypt"
> -
> -PR =3D "${INC_PR}.0"
> -PYTHON_MAJMIN =3D "3.5"
> -PYTHON_BINABI =3D "${PYTHON_MAJMIN}m"
> -DISTR

