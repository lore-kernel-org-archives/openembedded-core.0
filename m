Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3266E660
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 14:59:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s14-v6so6319182wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=NKZ9o3XV1M2d1JN6w6xqU3lYo78OEYCLM9HfZc9aOjU=;
	b=KeR+cMMVHDKTM2kqKMz9VjpUc57w4Nkxu0h11IW5JlHycSRRqiisJZe0LjL3NbNxI/
	ATnBxWd2sNDp3dab4e5aEFp2PqMEts0pEgOReBhduc/SxnyaBewx2QE/raGsONvYjUeY
	+SsfQIDCCKQrgG8QS7B+hELVa6CBx+pbMtH1Z0XwXwjyM81PEj8iHaTuynw+QEBxj1Gh
	gia/PBaPanMIbJZKAIYDxha2CdyrjK0gqY4A7UsBKRcZPd+D8PTK46WZg0bPcbO0SS5J
	0XZxe1W+nsKppZn0WXlEFx7RaSaj1gbYeLrJqtRFeltTNcWb1BEggfWgkXvTWhes4aqd
	5kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=NKZ9o3XV1M2d1JN6w6xqU3lYo78OEYCLM9HfZc9aOjU=;
	b=DZX/9VMMioTW42tEvLezDiJfZpAT/sVdElHuX0TWm/nFWM43GockEPV0J+6lUzqski
	mW0LuNrsKfxUki0548mngxEpYlUI3ePf0JY0YYEsrqzKhY5VQVK2/dhgfxFnuOKPnvXh
	UUgMj6ukaVP570MNQzwUKTraq3T0tAyQTJ7cjS7W6ZyVA1tk5BG1GRxfApd7Aq+iKntz
	ik7tNtrtUxZROOJdI/XYfqqq/xBAwNKMuJVdCSCGL/vGy52ZeuvcRtEZKjq/Pm6g/9ve
	RuY13BjB1muuhSHXLr9xZYn+ha/WlweI14JiOVF1M0tGKp+X0kj8yEN4vhPfgd1OJiU/
	DuNg==
X-Gm-Message-State: APzg51D66Pha+QXV0/r+kVCGpGUgQS/Gk8XHGT21idlLnPqlW8+Wipuz
	3Av/2DSVKApMzvIISxBr13s9YvYV
X-Google-Smtp-Source: ANB0VdazNlXZ7eLpqdZtAouirJoy3UTZO4dPabpnfqbma0BGyMyFhmQc53OXA/YM5ekUD5KQRlRpoA==
X-Received: by 2002:a5d:68c9:: with SMTP id
	p9-v6mr6356634wrw.108.1536332379261; 
	Fri, 07 Sep 2018 07:59:39 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	72-v6sm7601092wrb.48.2018.09.07.07.59.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 07:59:37 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Fri, 7 Sep 2018 16:59:35 +0200
In-Reply-To: <20180907145533.31088-1-sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
References: <20180907145533.31088-1-sno@netbsd.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: =?utf-8?Q?Sven_H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 07 Sep 2018 14:59:40 -0000
X-Groupsio-MsgNum: 116048
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EA7C1826-3CD7-41C5-8C41-969A842615B8";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_EA7C1826-3CD7-41C5-8C41-969A842615B8
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_36B8F7CE-20A3-4443-BA4C-CD3294B989BC"

--Apple-Mail=_36B8F7CE-20A3-4443-BA4C-CD3294B989BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Am 07.09.2018 um 16:55 schrieb Jens Rehsack <sno@NetBSD.org>:
>=20
> Update python3 to recent 3.7.0 release.
>=20
> Details about new features and bug-fixes can be taken from
> * https://docs.python.org/3/whatsnew/3.7.html
> * https://docs.python.org/3/whatsnew/3.6.html
>=20
> Instead of using a common inc with python2 and override most of
> it's settings, introduce a dedicated python3.inc.
>=20
> Remove patches when they were fixed upstream and rebase the
> remaining ones. If necessary, the patches are adopted to
> keep the idea when upstream code was changed.
>=20
> Open TODO: track patches in a -STABLE rebased git branch for
> easier rebasing or upstream submitting.
>=20
> Enhancement requests for Yocto project
> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12375
> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12901
> are solved by this.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> meta/classes/python3-dir.bbclass              |   6 +-
> .../python/python3-native_3.5.5.bb            | 112 ------
> .../python/python3-native_3.7.0.bb            |  74 ++++
> meta/recipes-devtools/python/python3.inc      |  80 ++++
> ...hell-version-of-python-config-that-w.patch |  21 +-
> ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
> .../python3/0001-cross-compile-support.patch  |  66 ++--
> ...d-target-to-split-profile-generation.patch |  40 --
> .../python3/03-fix-tkinter-detection.patch    |  12 +-
> .../python3/030-fixup-include-dirs.patch      |   9 -
> .../080-distutils-dont_adjust_files.patch     |   4 +-
> .../python/python3/150-fix-setupterm.patch    |  17 -
> ...GS-for-extensions-when-cross-compili.patch |  53 ++-
> .../python3/avoid-ncursesw-include-path.patch |  18 +-
> .../python3/avoid_warning_about_tkinter.patch |  18 +-
> .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
> ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
> .../python/python3/python-3.3-multilib.patch  | 241 ++++++------
> .../python/python3/python3-manifest.json      |   2 +-
> ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
> .../python/python3/regen-all.patch            |  25 --
> ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  36 +-
> .../python3/sysroot-include-headers.patch     |  23 +-
> .../python3/uuid_when_cross_compiling.patch   |  22 ++
> meta/recipes-devtools/python/python3_3.5.5.bb | 346 ------------------
> meta/recipes-devtools/python/python3_3.7.0.bb | 316 ++++++++++++++++
> 26 files changed, 783 insertions(+), 888 deletions(-)
> delete mode 100644 =
meta/recipes-devtools/python/python3-native_3.5.5.bb
> create mode 100644 =
meta/recipes-devtools/python/python3-native_3.7.0.bb
> create mode 100644 meta/recipes-devtools/python/python3.inc
> delete mode 100644 =
meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.p=
y-to-initialize-dist.patch
> delete mode 100644 =
meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-pro=
file-generation.patch
> delete mode 100644 =
meta/recipes-devtools/python/python3/150-fix-setupterm.patch
> delete mode 100644 =
meta/recipes-devtools/python/python3/regen-all.patch
> create mode 100644 =
meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
> delete mode 100644 meta/recipes-devtools/python/python3_3.5.5.bb
> create mode 100644 meta/recipes-devtools/python/python3_3.7.0.bb
>=20
> diff --git a/meta/classes/python3-dir.bbclass =
b/meta/classes/python3-dir.bbclass
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
> PYTHON_ABI =3D "m"
> PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
> PYTHON_PN =3D "python3"
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb =
b/meta/recipes-devtools/python/python3-native_3.5.5.bb
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
> -SRC_URI =3D =
"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
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
> =
-file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch =
\
> -file://sysroot-include-headers.patch \
> -file://unixccompiler.patch \
> -${DISTRO_SRC_URI} \
> -file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> =
-file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch =
\
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -file://regen-all.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "f3763edf9824d5d3a15f5f646083b6e0"
> -SRC_URI[sha256sum] =3D =
"063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
> -
> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Db6ec515b22618f55fa07276b897bacea"
> -
> -# exclude pre-releases for both python 2.x and 3.x
> -UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -
> -S =3D "${WORKDIR}/Python-${PV}"
> -
> -EXTRANATIVEPATH +=3D "bzip2-native"
> -DEPENDS =3D "openssl-native bzip2-replacement-native zlib-native =
readline-native sqlite3-native gdbm-native"
> -
> -inherit native
> -
> -EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} =
--without-ensurepip"
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
> -	autoreconf --verbose --install --force --exclude=3Dautopoint =
../Python-${PV}/Modules/_ctypes/libffi
> -	sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM =
\*/,' ${B}/pyconfig.h
> -}
> -
> -# Regenerate all of the generated files
> -# This ensures that pgen and friends get created during the compile =
phase
> -#
> -do_compile_prepend() {
> -    # Assuming https://bugs.python.org/issue33080 has been addressed =
in Makefile.
> -    oe_runmake regen-all
> -}
> -
> -do_install() {
> -	install -d ${D}${libdir}/pkgconfig
> -	oe_runmake 'DESTDIR=3D${D}' install
> -	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -		install -m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}
> -	fi
> -	install -d ${D}${bindir}/${PN}
> -	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> -
> -	# Make sure we use /usr/bin/env python
> -	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python =
${D}${bindir}/${PN}`; do
> -		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> -	done
> -
> -        # Add a symlink to the native Python so that scripts can just =
invoke
> -        # "nativepython" and get the right one without needing =
absolute paths
> -        # (these often end up too long for the #! parser in the =
kernel as the
> -        # buffer is 128 bytes long).
> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> -}
> -
> -python(){
> -
> -    # Read JSON manifest
> -    import json
> -    pythondir =3D d.getVar('THISDIR',True)
> -    with open(pythondir+'/python3/python3-manifest.json') as =
manifest_file:
> -        python_manifest=3Djson.load(manifest_file)
> -
> -    rprovides =3D d.getVar('RPROVIDES').split()
> -
> -    # Hardcoded since it cant be python3-native-foo, should be =
python3-foo-native
> -    pn =3D 'python3'
> -
> -    for key in python_manifest:
> -        pypackage =3D pn + '-' + key + '-native'
> -        if pypackage not in rprovides:
> -              rprovides.append(pypackage)
> -
> -    d.setVar('RPROVIDES', ' '.join(rprovides))
> -}
> diff --git a/meta/recipes-devtools/python/python3-native_3.7.0.bb =
b/meta/recipes-devtools/python/python3-native_3.7.0.bb
> new file mode 100644
> index 0000000000..fdbc9888b9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-native_3.7.0.bb
> @@ -0,0 +1,74 @@
> +require recipes-devtools/python/python3.inc
> +
> +SRC_URI +=3D "\
> +    file://12-distutils-prefix-is-inside-staging-area.patch \
> +    =
file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> +"
> +
> +EXTRANATIVEPATH +=3D "bzip2-native"
> +DEPENDS =3D "openssl-native libffi-native bzip2-replacement-native =
zlib-native readline-native sqlite3-native gdbm-native"
> +
> +inherit native
> +
> +EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} =
--without-ensurepip"
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
> +# This ensures that pgen and friends get created during the compile =
phase
> +#
> +do_compile_prepend() {
> +    # Assuming https://bugs.python.org/issue33080 has been addressed =
in Makefile.
> +    oe_runmake regen-all
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/pkgconfig
> +	oe_runmake 'DESTDIR=3D${D}' install
> +	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +		install -m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}
> +	fi
> +	install -d ${D}${bindir}/${PN}
> +	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> +
> +	# Make sure we use /usr/bin/env python
> +	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python =
${D}${bindir}/${PN}`; do
> +		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> +	done
> +
> +        # Add a symlink to the native Python so that scripts can just =
invoke
> +        # "nativepython" and get the right one without needing =
absolute paths
> +        # (these often end up too long for the #! parser in the =
kernel as the
> +        # buffer is 128 bytes long).
> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +}
> +
> +python(){
> +
> +    # Read JSON manifest
> +    import json
> +    pythondir =3D d.getVar('THISDIR',True)
> +    with open(pythondir+'/python3/python3-manifest.json') as =
manifest_file:
> +        python_manifest=3Djson.load(manifest_file)
> +
> +    rprovides =3D d.getVar('RPROVIDES').split()
> +
> +    # Hardcoded since it cant be python3-native-foo, should be =
python3-foo-native
> +    pn =3D 'python3'
> +
> +    for key in python_manifest:
> +        pypackage =3D pn + '-' + key + '-native'
> +        if pypackage not in rprovides:
> +              rprovides.append(pypackage)
> +
> +    d.setVar('RPROVIDES', ' '.join(rprovides))
> +}
> diff --git a/meta/recipes-devtools/python/python3.inc =
b/meta/recipes-devtools/python/python3.inc
> new file mode 100644
> index 0000000000..44070fdbf7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3.inc
> @@ -0,0 +1,80 @@
> +SUMMARY =3D "The Python Programming Language"
> +HOMEPAGE =3D "http://www.python.org"
> +LICENSE =3D "PSFv2"
> +SECTION =3D "devel/python"
> +# bump this on every change in =
contrib/python/generate-manifest-2.7.py
> +INC_PR =3D "r1"
> +
> +PR =3D "${INC_PR}.0"
> +PYTHON_MAJMIN =3D "3.7"
> +DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> +DISTRO_SRC_URI_linuxstdbase =3D ""
> +SRC_URI =3D =
"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
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
> +    =
file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> +    ${DISTRO_SRC_URI} \
> +    file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "eb8c2a6b1447d50813c02714af4681f3"
> +SRC_URI[sha256sum] =3D =
"0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549"
> +
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Df257cc14f81685691652a3d3e1b5d754"
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
> +  --enable-ipv6=3D${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', =
'yes', 'no', d)} \
> +  ac_cv_header_bluetooth_bluetooth_h=3Dno ac_cv_header_bluetooth_h=3Dno=
 \
> +  ${PYTHONLSBOPTS} \
> +"
> +
> +do_configure_prepend() {
> +	libdirleaf=3D"$(echo ${libdir} | sed -e 's:${prefix}/::')"
> +	sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
> +		${S}/configure.ac
> +}
> +
> +do_install_prepend() {
> +	MAKESETTINGS=3D"$(egrep '^(ABIFLAGS|MULTIARCH)=3D' ${B}/Makefile =
| sed -E -e 's/[[:space:]]//g' -e 's/=3D/=3D"/' -e 's/$/"/')"
> +	eval ${MAKESETTINGS}
> +	if test "${ABIFLAGS}" !=3D "${PYTHON_ABI}"; then
> +	    die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' =
!=3D '${PYTHON_ABI}' from python3-dir.bbclass"
> +	fi
> +	if test "x${BUILD_OS}" =3D "x${TARGET_OS}"; then
> +		# no cross-compile at all
> +		=
_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
> +	else
> +		# at the very moment, it's the only available target
> +		=
_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_linux_${MULTIARCH}
> +	fi
> +}
> +
> +do_install_append () {
> +	sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
> +		-e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
> +		=
${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDA=
TA_NAME}.py
> +}
> diff --git =
a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch =
b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch
> index 8ea3f03fe0..aac34533ef 100644
> --- =
a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch
> +++ =
b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch
> @@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin =
<alex.kanavin@gmail.com>
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 236f005..5c4337f 100644
> +index 31b4bcabb3..7da6d6941e 100644
> --- a/Makefile.pre.in
> +++ b/Makefile.pre.in
> -@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in =
Misc/python-config.sh
> +@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.in =
Misc/python-config.sh
>  	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < =
$(srcdir)/Misc/python-config.in >python-config.py
> - 	# Replace makefile compat. variable references with shell script =
compat. ones; $(VAR) -> ${VAR}
> + 	@ # Replace makefile compat. variable references with shell =
script compat. ones; $(VAR) -> ${VAR}
>  	LC_ALL=3DC sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < =
Misc/python-config.sh >python-config
> --	# On Darwin, always use the python version of the script, the =
shell
> --	# version doesn't use the compiler customizations that are =
provided
> --	# in python (_osx_support.py).
> --	if test `uname -s` =3D Darwin; then \
> +-	@ # On Darwin, always use the python version of the script, the =
shell
> +-	@ # version doesn't use the compiler customizations that are =
provided
> +-	@ # in python (_osx_support.py).
> +-	@if test `uname -s` =3D Darwin; then \
> -		cp python-config.py python-config; \
> -	fi
> -+	# In OpenEmbedded, always use the python version of the script, =
the shell
> -+	# version is broken in multiple ways, and doesn't return correct =
directories
> ++	@ # In OpenEmbedded, always use the python version of the =
script, the shell
> ++	@ # version is broken in multiple ways, and doesn't return =
correct directories
> +	cp python-config.py python-config
>=20
>=20
>  # Install the include files
> ---
> -2.11.0
> -
> diff --git =
a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata=
.py-to-initialize-dist.patch =
b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata=
.py-to-initialize-dist.patch
> deleted file mode 100644
> index d1c92e9eed..0000000000
> --- =
a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata=
.py-to-initialize-dist.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -=46rom bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 =
2001
> -From: Libin Dang <libin.dang@windriver.com>
> -Date: Tue, 11 Apr 2017 14:12:15 +0800
> -Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
> - distutils.sysconfig
> -
> -Backport upstream commit
> =
-https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b2=
3d934159
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
> --        my_msg =3D "invalid Python installation: unable to open %s" =
% filename
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
> --        my_msg =3D "invalid Python installation: unable to open %s" =
% filename
> --        if hasattr(msg, "strerror"):
> --            my_msg =3D my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # On AIX, there are wrong paths to the linker scripts in the =
Makefile
> --    # -- these paths are relative to the Python source, but when =
installed
> --    # the scripts are in another directory.
> --    if python_build:
> --        g['LDSHARED'] =3D g['BLDSHARED']
> --
> -+    # _sysconfigdata is generated at build time, see the sysconfig =
module
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
> diff --git =
a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch =
b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> index 7cd7e3b490..a87b86015b 100644
> --- =
a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> +++ =
b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> @@ -1,4 +1,4 @@
> -=46rom ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 =
2001
> +=46rom 6ad4d2101b5d67bb2de166829879a5b1a0f1c18f Mon Sep 17 00:00:00 =
2001
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Date: Fri, 31 Mar 2017 15:42:46 +0300
> Subject: [PATCH] cross-compile support
> @@ -8,7 +8,7 @@ python instead of in-tree tools
>=20
> -Khem
>=20
> -Rebased on 3.5.4
> +Rebased on 3.7.0
>=20
> Upstream-Status: Inappropriate[Configuration Specific]
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> @@ -18,53 +18,53 @@ Signed-off-by: Derek Straka <derek@asterius.io>
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 144c1f8629..f252ac2417 100644
> +index d60d48e5f9..31b4bcabb3 100644
> --- a/Makefile.pre.in
> +++ b/Makefile.pre.in
> -@@ -223,6 +223,7 @@ LIBOBJS=3D	@LIBOBJS@
> -
> +@@ -233,6 +233,7 @@ LIBOBJS=3D	@LIBOBJS@
> +
>  PYTHON=3D		python$(EXE)
>  BUILDPYTHON=3D	python$(BUILDEXE)
> +HOSTPYTHON=3D    $(BUILDPYTHON)
> -
> +
>  PYTHON_FOR_REGEN=3D@PYTHON_FOR_REGEN@
> - PYTHON_FOR_BUILD=3D@PYTHON_FOR_BUILD@
> -@@ -277,6 +278,7 @@ LIBFFI_INCLUDEDIR=3D	@LIBFFI_INCLUDEDIR@
> + UPDATE_FILE=3D@PYTHON_FOR_REGEN@ =
$(srcdir)/Tools/scripts/update_file.py
> +@@ -285,6 +286,7 @@ LIBFFI_INCLUDEDIR=3D	@LIBFFI_INCLUDEDIR@
>  =
##########################################################################=

>  # Parser
>  PGEN=3D		Parser/pgen$(EXE)
> +HOSTPGEN=3D	$(PGEN)$(EXE)
> -
> - PSRCS=3D		\
> - 		Parser/acceler.c \
> -@@ -478,7 +480,7 @@ build_all_generate_profile:
> -
> +
> + POBJS=3D		\
> + 		Parser/acceler.o \
> +@@ -501,7 +503,7 @@ build_all_generate_profile:
> +
>  run_profile_task:
> - 	: # FIXME: can't run for a cross build
> + 	@ # FIXME: can't run for a cross build
> -	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) =
|| true
> +	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || =
true
> -
> +
>  build_all_merge_profile:
>  	$(LLVM_PROF_MERGER)
> -@@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
> +@@ -796,7 +798,7 @@ regen-grammar: $(PGEN)
>  	# Regenerate Include/graminit.h and Python/graminit.c
>  	# from Grammar/Grammar using pgen
>  	@$(MKDIR_P) Include
> -	$(PGEN) $(srcdir)/Grammar/Grammar \
> +	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
> - 		$(srcdir)/Include/graminit.h \
> - 		$(srcdir)/Python/graminit.c
> -
> -@@ -978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: =
$(PYTHON_HEADERS)
> + 		$(srcdir)/Include/graminit.h.new \
> + 		$(srcdir)/Python/graminit.c.new
> + 	$(UPDATE_FILE) $(srcdir)/Include/graminit.h =
$(srcdir)/Include/graminit.h.new
> +@@ -1034,7 +1036,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: =
$(PYTHON_HEADERS)
>  =
######################################################################
> -
> +
>  TESTOPTS=3D	$(EXTRATESTOPTS)
> -TESTPYTHON=3D	$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
> +TESTPYTHON=3D	$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
>  TESTRUNNER=3D	$(TESTPYTHON) =
$(srcdir)/Tools/scripts/run_tests.py
> - TESTTIMEOUT=3D	3600
> -
> -@@ -1470,7 +1472,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
> + TESTTIMEOUT=3D	1200
> +
> +@@ -1536,7 +1538,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
>  		fi; \
>  	done
>  	$(LN) -fsn include/python$(LDVERSION) =
$(DESTDIR)$(prefix)/Headers
> @@ -73,24 +73,24 @@ index 144c1f8629..f252ac2417 100644
>  	$(LN) -fsn $(VERSION) =
$(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
>  	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) =
$(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
>  	$(LN) -fsn Versions/Current/Headers =
$(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
> -@@ -1543,7 +1545,7 @@ Python/dtoa.o: Python/dtoa.c
> -
> +@@ -1609,7 +1611,7 @@ Python/dtoa.o: Python/dtoa.c
> +
>  # Run reindent on the library
>  reindent:
> -	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r =
$(srcdir)/Lib
> +	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r =
$(srcdir)/Lib
> -
> +
>  # Rerun configure with the same options as it was run last time,
>  # provided the config.status script exists
> -@@ -1678,7 +1680,7 @@ funny:
> -
> +@@ -1744,7 +1746,7 @@ funny:
> +
>  # Perform some verification checks on any modified files.
>  patchcheck: @DEF_MAKE_RULE@
> -	$(RUNSHARED) ./$(BUILDPYTHON) =
$(srcdir)/Tools/scripts/patchcheck.py
> +	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -
> +
>  # Dependencies
> -
> ---
> -2.11.0
> +
> +--
> +2.17.1
>=20
> diff --git =
a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-p=
rofile-generation.patch =
b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-p=
rofile-generation.patch
> deleted file mode 100644
> index bb01c5bcb4..0000000000
> --- =
a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-p=
rofile-generation.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -=46rom 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 =
2001
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
> - 	$(MAKE) profile-removal
> - 	$(MAKE) build_all_generate_profile
> - 	$(MAKE) profile-removal
> --	@echo "Running code to generate profile data (this can take a =
while):"
> --	$(MAKE) run_profile_task
> --	$(MAKE) build_all_merge_profile
> -+
> -+clean_and_use_profile:
> - 	@echo "Rebuilding with profile guided optimizations:"
> - 	$(MAKE) clean
> - 	$(MAKE) build_all_use_profile
> --	$(MAKE) profile-removal
> -
> - build_all_generate_profile:
> - 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) =
$(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS=3D"$(LIBS)"
> ---
> -2.17.1
> -
> diff --git =
a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch =
b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> index fddfd2b2f6..b916d04d05 100644
> --- =
a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> +++ =
b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> @@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]
> # will not be found.
> # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
>=20
> -Index: Python-3.3.0rc2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.0rc2.orig/setup.py	2012-09-20 15:24:14.009124003 =
-0700
> -+++ Python-3.3.0rc2/setup.py	2012-09-20 15:25:08.449124963 -0700
> -@@ -1620,7 +1620,7 @@
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..7f0e4d1010 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):
>                  dotversion =3D dotversion[:-1] + '.' + dotversion[-1]
>              tcl_include_sub =3D []
>              tk_include_sub =3D []
> @@ -17,7 +17,7 @@ Index: Python-3.3.0rc2/setup.py
>                  tcl_include_sub +=3D [dir + os.sep + "tcl" + =
dotversion]
>                  tk_include_sub +=3D [dir + os.sep + "tk" + =
dotversion]
>              tk_include_sub +=3D tcl_include_sub
> -@@ -1639,22 +1639,6 @@
> +@@ -1822,22 +1822,6 @@ class PyBuildExt(build_ext):
>              if dir not in include_dirs:
>                  include_dirs.append(dir)
>=20
> diff --git =
a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch =
b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> index 6beac7b805..c12f11c6e7 100644
> --- =
a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> +++ =
b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> @@ -22,12 +22,3 @@ Index: Python-3.3.2/setup.py
>=20
>          # Add paths specified in the environment variables LDFLAGS =
and
>          # CPPFLAGS for header and library files.
> -@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.base_prefix) !=3D '/usr' \
> -+        if not cross_compiling and os.path.normpath(sys.base_prefix) =
!=3D '/usr' \
> -                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -             # OSX note: Don't add LIBDIR and INCLUDEDIR to building =
a framework
> -             # (PYTHONFRAMEWORK is set) to avoid # linking problems =
when
> diff --git =
a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch =
b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch
> index b96419a638..1bd6e56117 100644
> --- =
a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch
> +++ =
b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch
> @@ -14,11 +14,11 @@ Upstream-Status: Inappropriate [Embedded-Specific]
>=20
>=20
>      def copy_scripts(self):
> --        """Copy each script listed in 'self.scripts'; if it's marked =
as a
> +-        r"""Copy each script listed in 'self.scripts'; if it's =
marked as a
> -        Python script in the Unix way (first line matches =
'first_line_re',
> -        ie. starts with "\#!" and contains "python"), then adjust the =
first
> -        line to refer to the current Python interpreter as we copy.
> -+        """Copy each script listed in 'self.scripts'
> ++        r"""Copy each script listed in 'self.scripts'
>          """
>          self.mkpath(self.build_dir)
>          outfiles =3D []
> diff --git =
a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch =
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
> diff --git =
a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch =
b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch
> index ae74ef531d..35b849e399 100644
> --- =
a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch
> +++ =
b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch
> @@ -9,6 +9,11 @@ profile-optimized build.
>=20
> Upstream-Status: Pending
>=20
> +2018-08:
> +  * Rebased Makefile.pre.in for 3.7
> +  * Remove patch for setup.py in favor of upstream fix
> +  -- Jens
> +
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  Makefile.pre.in | 4 ++--
> @@ -16,41 +21,31 @@ Signed-off-by: Markus Lehtonen =
<markus.lehtonen@linux.intel.com>
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index e2d5d3d..84bc3ff 100644
> +index 4c23c0e411..0871c98f29 100644
> --- a/Makefile.pre.in
> +++ b/Makefile.pre.in
> -@@ -478,7 +478,7 @@ profile-opt:
> - 	$(MAKE) profile-removal
> +@@ -497,6 +497,7 @@ profile-run-stamp:
>=20
>  build_all_generate_profile:
> --	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) =
$(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS=3D"$(LIBS)"
> -+	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) =
$(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS=3D"$(LIBS)"
> + 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(PGO_PROF_GEN_FLAG)" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" =
LIBS=3D"$(LIBS)"
> ++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG)" LDFLAGS=3D"$(LDFLAGS) =
$(PGO_PROF_GEN_FLAG)" LIBS=3D"$(LIBS)"
>=20
>  run_profile_task:
> - 	: # FIXME: can't run for a cross build
> -@@ -488,7 +488,7 @@ build_all_merge_profile:
> - 	$(LLVM_PROF_MERGER)
> -
> - build_all_use_profile:
> --	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) @LTOFLAGS@"
> -+	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) =
@LTOFLAGS@"
> + 	@ # FIXME: can't run for a cross build
> +@@ -510,14 +511,14 @@ build_all_merge_profile:
> + profile-opt: profile-run-stamp
> + 	@echo "Rebuilding with profile guided optimizations:"
> + 	-rm -f profile-clean-stamp
> +-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(PGO_PROF_USE_FLAG)" LDFLAGS=3D"$(LDFLAGS)"
> ++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG)" LDFLAGS=3D"$(LDFLAGS)"
>=20
>  # Compile and run with gcov
>  .PHONY=3Dcoverage coverage-lcov coverage-report
> -diff --git a/setup.py b/setup.py
> -index add3346..65e83b1 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
> -         # compilers
> -         if compiler is not None:
> -             if cross_compiling:
> --                (ccshared,cflags) =3D (os.environ.get('CCSHARED') or =
'', os.environ.get('CFLAGS') or '')
> -+                (ccshared,cflags) =3D (os.environ.get('CCSHARED') or =
'',
> -+                                     (os.environ.get('CFLAGS') or =
'') + ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
> -             else:
> -                 (ccshared,cflags) =3D =
sysconfig.get_config_vars('CCSHARED','CFLAGS')
> -             args['compiler_so'] =3D compiler + ' ' + ccshared + ' ' =
+ cflags
> ---
> -2.17.1
> -
> + coverage:
> + 	@echo "Building with support for coverage checking:"
> + 	$(MAKE) clean profile-removal
> +-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D"$(CFLAGS) -O0 -pg =
-fprofile-arcs -ftest-coverage" LIBS=3D"$(LIBS) -lgcov"
> ++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D"$(CFLAGS) $(EXTRA_CFLAGS) -O0 =
-pg -fprofile-arcs -ftest-coverage" LIBS=3D"$(LIBS) -lgcov"
> +
> + coverage-lcov:
> + 	@echo "Creating Coverage HTML report with LCOV:"
> diff --git =
a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch =
b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> index f29ae53371..7e1dc4ef5b 100644
> --- =
a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> +++ =
b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> @@ -6,16 +6,16 @@ hardcoded locations for include paths
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
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
>  # first curses header check
>  ac_save_cppflags=3D"$CPPFLAGS"
> --CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
> -+CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> + if test "$cross_compiling" =3D no; then
> +-  CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
> ++  CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> + fi
>=20
>  AC_CHECK_HEADERS(curses.h ncurses.h)
> -
> diff --git =
a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch =
b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index a3cc48c9a4..ebdd64b7b5 100644
> --- =
a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++ =
b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -5,13 +5,17 @@ Avoid a warning by not adding this module to missing =
variable.
> Upstream-Status: Inappropriate [distribution]
>=20
> Also simply disable the tk module since its not in DEPENDS.
> +
> +2018-08: Rebased for 3.7.0
> +  -- Jens
> +
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>=20
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
>          self.extensions.extend(exts)
>=20
>          # Call the method for detecting whether _tkinter can be =
compiled
> @@ -25,5 +29,5 @@ Index: Python-3.5.3/setup.py
> +        #if '_tkinter' not in [e.name for e in self.extensions]:
> +        #    missing.append('_tkinter')
>=20
> - ##         # Uncomment these lines if you want to play with =
xxmodule.c
> - ##         ext =3D Extension('xx', ['xxmodule.c'])
> +         # Build the _uuid module if possible
> +         uuid_incs =3D find_file("uuid.h", inc_dirs, =
["/usr/include/uuid"])
> diff --git =
a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch =
b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> index 97214f9aa4..689baf00ad 100644
> --- =
a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> +++ =
b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> @@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that it would =
work when lib64.
>=20
> Upstream-Status: Pending
>=20
> +2018-08: rebased and adopted for 3.7
> +  -- Jens
> +
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  configure.ac |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configure.ac b/configure.ac
> -index 63aef8e..aefb27f 100644
> +index 2b8aa4d592..0da15fbbdf 100644
> --- a/configure.ac
> +++ b/configure.ac
> -@@ -4366,7 +4366,7 @@ AC_MSG_RESULT($LDVERSION)
> -
> +@@ -4674,9 +4674,9 @@ AC_MSG_RESULT($LDVERSION)
>  dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
>  AC_SUBST(PY_ENABLE_SHARED)
> --LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> -+LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + if test x$PLATFORM_TRIPLET =3D x; then
> +-  LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> ++  LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + else
> +-  =
LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_T=
RIPLET}"
> ++  =
LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPL=
ET}"
> + fi
>  AC_SUBST(LIBPL)
>=20
> - # Check whether right shifting a negative integer extends the sign =
bit
> ---
> -1.7.9.5
> -
> diff --git =
a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch =
b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch
> index 5c3af6b626..1ce4defe95 100644
> --- =
a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch
> +++ =
b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch
> @@ -47,16 +47,19 @@ And the semaphore issue also caused =
multiprocessing.Queue().put() hung.
>=20
> Upstream-Status: Submitted =
[https://github.com/python/cpython/pull/2999]
>=20
> +2018-08: rebased for 3.7
> +  -- Jens
> +
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  setup.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/setup.py b/setup.py
> -index 4f0f522..d05707d 100644
> +index a97a7559ca..633eba8f1e 100644
> --- a/setup.py
> +++ b/setup.py
> -@@ -1606,8 +1606,10 @@ class PyBuildExt(build_ext):
> +@@ -1580,8 +1580,10 @@ class PyBuildExt(build_ext):
>          elif host_platform.startswith('netbsd'):
>              macros =3D dict()
>              libraries =3D []
> @@ -69,14 +72,11 @@ index 4f0f522..d05707d 100644
>              macros =3D dict()
>              libraries =3D ['rt']
>=20
> -@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):
> -         if sysconfig.get_config_var('WITH_THREAD'):
> -             exts.append ( Extension('_multiprocessing', =
multiprocessing_srcs,
> -                                     =
define_macros=3Dlist(macros.items()),
> -+                                    libraries=3Dlibraries,
> -                                     =
include_dirs=3D["Modules/_multiprocessing"]))
> -         else:
> -             missing.append('_multiprocessing')
> ---
> -2.7.4
> -
> +@@ -1599,6 +1601,7 @@ class PyBuildExt(build_ext):
> +
> +         exts.append ( Extension('_multiprocessing', =
multiprocessing_srcs,
> +                                 define_macros=3Dlist(macros.items()),
> ++                                libraries=3Dlibraries,
> +                                 =
include_dirs=3D["Modules/_multiprocessing"]))
> +         # End multiprocessing
> +
> diff --git =
a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch =
b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> index cc35dc1617..d5bafbfba1 100644
> --- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> +++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> @@ -4,7 +4,7 @@ Date: Tue, 14 May 2013 15:00:26 -0700
> Subject: [PATCH 01/13] get the sys.lib from python itself and do not =
use
>  hardcoded value of 'lib'
>=20
> -02/2015 Rebased for 3.4.2
> +08/2018 Rebased for 3.7.0
>=20
> Upstream-Status: Pending
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> @@ -25,12 +25,12 @@ Signed-off-by: Alejandro Hernandez =
<alejandro.hernandez@linux.intel.com>
>  setup.py                         |  9 ++++-----
>  12 files changed, 97 insertions(+), 23 deletions(-)
>=20
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
>  #endif
>=20
> +PyAPI_FUNC(const char *) Py_GetArch(void);
> @@ -39,10 +39,10 @@ Index: Python-3.5.4/Include/pythonrun.h
>  #ifndef Py_LIMITED_API
>  PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags =
*);
>  PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, =
PyCompilerFlags *);
> -Index: Python-3.5.4/Lib/distutils/command/install.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/distutils/command/install.py
> -+++ Python-3.5.4/Lib/distutils/command/install.py
> +diff --git a/Lib/distutils/command/install.py =
b/Lib/distutils/command/install.py
> +index 0258d3deae..352fd8f792 100644
> +--- a/Lib/distutils/command/install.py
> ++++ b/Lib/distutils/command/install.py
> @@ -19,6 +19,8 @@ from site import USER_BASE
>  from site import USER_SITE
>  HAS_USER_SITE =3D True
> @@ -63,11 +63,11 @@ Index: =
Python-3.5.4/Lib/distutils/command/install.py
>          'headers': =
'$base/include/python$py_version_short$abiflags/$dist_name',
>          'scripts': '$base/bin',
>          'data'   : '$base',
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
>      docmodule =3D docclass =3D docroutine =3D docother =3D =
docproperty =3D docdata =3D fail
>=20
>      def getdocloc(self, object,
> @@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py
>                                         "python%d.%d" %  =
sys.version_info[:2])):
>          """Return the location of module docs or None"""
>=20
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
>          seen.add(prefix)
>=20
>          if os.sep =3D=3D '/':
> -            sitepackages.append(os.path.join(prefix, "lib",
> +-                                        "python%d.%d" % =
sys.version_info[:2],
> +            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> ++                                        "python%d.%d" % =
sys.version_info[:2],
>                                          "site-packages"))
>          else:
>              sitepackages.append(prefix)
> -            sitepackages.append(os.path.join(prefix, "lib", =
"site-packages"))
> +            sitepackages.append(os.path.join(prefix, sys.lib, =
"site-packages"))
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
> @@ -20,10 +20,10 @@ __all__ =3D [
>=20
>  _INSTALL_SCHEMES =3D {
> @@ -129,7 +130,7 @@ Index: Python-3.5.4/Lib/sysconfig.py
>          'include': '{installed_base}/include/python',
>          'platinclude': '{installed_base}/include/python',
>          'scripts': '{base}/bin',
> -@@ -61,10 +61,10 @@ _INSTALL_SCHEMES =3D {
> +@@ -62,10 +62,10 @@ _INSTALL_SCHEMES =3D {
>          'data': '{userbase}',
>          },
>      'posix_user': {
> @@ -144,28 +145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py
>          'include': '{userbase}/include/python{py_version_short}',
>          'scripts': '{userbase}/bin',
>          'data': '{userbase}',
> -Index: Python-3.5.4/Lib/trace.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.5.4.orig/Lib/trace.py
> -+++ Python-3.5.4/Lib/trace.py
> -@@ -749,10 +749,10 @@ def main(argv=3DNone):
> -                 # should I also call expanduser? (after all, could =
use $HOME)
> +diff --git a/Lib/trace.py b/Lib/trace.py
> +index 86b2101763..f3c32ec317 100755
> +--- a/Lib/trace.py
> ++++ b/Lib/trace.py
> +@@ -659,7 +659,7 @@ def main():
> +     opts =3D parser.parse_args()
> +
> +     if opts.ignore_dir:
> +-        rel_path =3D 'lib', =
'python{0.major}.{0.minor}'.format(sys.version_info)
> ++        rel_path =3D sys.lib, =
'python{0.major}.{0.minor}'.format(sys.version_info)
> +         _prefix =3D os.path.join(sys.base_prefix, *rel_path)
> +         _exec_prefix =3D os.path.join(sys.base_exec_prefix, =
*rel_path)
>=20
> -                 s =3D s.replace("$prefix",
> --                              os.path.join(sys.base_prefix, "lib",
> -+                              os.path.join(sys.base_prefix, sys.lib,
> -                                            "python" + =
sys.version[:3]))
> -                 s =3D s.replace("$exec_prefix",
> --                              os.path.join(sys.base_exec_prefix, =
"lib",
> -+                              os.path.join(sys.base_exec_prefix, =
sys.lib,
> -                                            "python" + =
sys.version[:3]))
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
>=20
>  # Machine-dependent subdirectories
>  MACHDEP=3D	@MACHDEP@
> @@ -174,7 +171,7 @@ Index: Python-3.5.4/Makefile.pre.in
>=20
>  # Multiarch directory (may be empty)
>  MULTIARCH=3D	@MULTIARCH@
> -@@ -128,7 +130,7 @@ LIBDIR=3D		@libdir@
> +@@ -134,7 +136,7 @@ LIBDIR=3D		@libdir@
>  MANDIR=3D		@mandir@
>  INCLUDEDIR=3D	@includedir@
>  CONFINCLUDEDIR=3D	$(exec_prefix)/include
> @@ -183,7 +180,7 @@ Index: Python-3.5.4/Makefile.pre.in
>  ABIFLAGS=3D	@ABIFLAGS@
>=20
>  # Detailed destination directories
> -@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
> +@@ -754,6 +756,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c =
Makefile
>  		-DEXEC_PREFIX=3D'"$(exec_prefix)"' \
>  		-DVERSION=3D'"$(VERSION)"' \
>  		-DVPATH=3D'"$(VPATH)"' \
> @@ -191,8 +188,8 @@ Index: Python-3.5.4/Makefile.pre.in
>  		-o $@ $(srcdir)/Modules/getpath.c
>=20
>  Programs/python.o: $(srcdir)/Programs/python.c
> -@@ -813,7 +816,7 @@ regen-opcode:
> - Python/compile.o Python/symtable.o Python/ast.o: =
$(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
> +@@ -842,7 +845,7 @@ regen-opcode:
> + Python/compile.o Python/symtable.o Python/ast_unparse.o =
Python/ast.o: $(srcdir)/Include/graminit.h =
$(srcdir)/Include/Python-ast.h
>=20
>  Python/getplatform.o: $(srcdir)/Python/getplatform.c
> -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' =
-o $@ $(srcdir)/Python/getplatform.c
> @@ -200,11 +197,11 @@ Index: Python-3.5.4/Makefile.pre.in
>=20
>  Python/importdl.o: $(srcdir)/Python/importdl.c
>  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ =
$(srcdir)/Python/importdl.c
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
>  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant =
defined"
>  #endif
>=20
> @@ -218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c
>  #ifndef LANDMARK
>  #define LANDMARK L"os.py"
>  #endif
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
> +-    calculate->lib_python =3D Py_DecodeLocale("lib/python" VERSION, =
&len);
> ++    calculate->lib_python =3D Py_DecodeLocale(LIB_PYTHON, &len);
> +     if (!calculate->lib_python) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> +diff --git a/Python/getplatform.c b/Python/getplatform.c
> +index 81a0f7ac53..bc7127ae3e 100644
> +--- a/Python/getplatform.c
> ++++ b/Python/getplatform.c
> @@ -10,3 +10,23 @@ Py_GetPlatform(void)
>  {
> - 	return PLATFORM;
> +     return PLATFORM;
>  }
> +
> +#ifndef ARCH
> @@ -263,11 +252,11 @@ Index: Python-3.5.4/Python/getplatform.c
> +{
> +	return LIB;
> +}
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
>                          PyUnicode_FromString(Py_GetCopyright()));
>      SET_SYS_FROM_STRING("platform",
>                          PyUnicode_FromString(Py_GetPlatform()));
> @@ -275,16 +264,16 @@ Index: Python-3.5.4/Python/sysmodule.c
> +                        PyUnicode_FromString(Py_GetArch()));
> +    SET_SYS_FROM_STRING("lib",
> +                        PyUnicode_FromString(Py_GetLib()));
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
>=20
> +AC_SUBST(ARCH)
> +AC_MSG_CHECKING(ARCH)
> @@ -322,13 +311,13 @@ Index: Python-3.5.4/configure.ac
> +esac
> +AC_MSG_RESULT($LIB)
>=20
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
>          # directories (i.e. '.' and 'Include') must be first.  See =
issue
>          # 10520.
>          if not cross_compiling:
> @@ -337,17 +326,16 @@ Index: Python-3.5.4/setup.py
>              add_dir_to_list(self.compiler.include_dirs, =
'/usr/local/include')
>          # only change this for cross builds for 3.3, issues on Mageia
>          if cross_compiling:
> -@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):
> -         # be assumed that no additional -I,-L directives are needed.
> -         if not cross_compiling:
> -             lib_dirs =3D self.compiler.library_dirs + [
> --                '/lib64', '/usr/lib64',
> --                '/lib', '/usr/lib',
> -+                '/' + sys.lib, '/usr/' + sys.lib,
> -                 ]
> -             inc_dirs =3D self.compiler.include_dirs + =
['/usr/include']
> -         else:
> -@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):
> +@@ -579,7 +579,7 @@ class PyBuildExt(build_ext):
> +             add_dir_to_list(self.compiler.include_dirs,
> +                             sysconfig.get_config_var("INCLUDEDIR"))
> +
> +-        system_lib_dirs =3D ['/lib64', '/usr/lib64', '/lib', =
'/usr/lib']
> ++        system_lib_dirs =3D ['/' + sys.lib, '/usr/' + sys.lib]
> +         system_include_dirs =3D ['/usr/include']
> +         # lib_dirs and inc_dirs are used to search for files;
> +         # if a file is found in one of those directories, it can
> +@@ -836,11 +836,11 @@ class PyBuildExt(build_ext):
>              elif curses_library:
>                  readline_libs.append(curses_library)
>              elif self.compiler.find_library_file(lib_dirs +
> @@ -361,3 +349,26 @@ Index: Python-3.5.4/setup.py
>                                     =
extra_link_args=3Dreadline_extra_link_args,
>                                     libraries=3Dreadline_libs) )
>          else:
> +@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):
> +
> +                 # check lib directories parallel to the location of =
the header
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
> +                                 sqlite_dirs_to_check + lib_dirs, =
'sqlite3')
> diff --git =
a/meta/recipes-devtools/python/python3/python3-manifest.json =
b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 90a41fbf29..51e605f0d6 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -206,7 +206,7 @@
>             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
>             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
>             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
>             "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
>             "${libdir}/python${PYTHON_MAJMIN}/abc.py",
>             "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
> diff --git =
a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch =
b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch
> index a4f8bd4710..c6aa581b4c 100644
> --- =
a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch
> +++ =
b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch
> @@ -5,21 +5,24 @@ Subject: [PATCH] python3 use CROSSPYTHONPATH for =
PYTHON_FOR_BUILD
>=20
> Upstream-Status: Inappropriate [Cross compile specific]
>=20
> +2018-08: Rebased and adopted for 3.7
> +  -- Jens
> +
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  configure.ac | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
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
>  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>  	fi
>          AC_MSG_RESULT($interp)
> --	PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell =
test -f pybuilddir.txt && echo $(abs_builddir)/`cat =
pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
> -+	PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) =
PYTHONPATH=3D$(CROSSPYTHONPATH) '$interp
> +-	PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell =
test -f pybuilddir.txt && echo $(abs_builddir)/`cat =
pybuilddir.txt`:)$(srcdir)/Lib =
_PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTI=
ARCH) '$interp
> ++	PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) =
PYTHONPATH=3D$(CROSSPYTHONPATH) =
_PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTI=
ARCH) '$interp
>      fi
>  elif test "$cross_compiling" =3D maybe; then
>      AC_MSG_ERROR([Cross compiling required --host=3DHOST-TUPLE and =
--build=3DARCH])
> diff --git a/meta/recipes-devtools/python/python3/regen-all.patch =
b/meta/recipes-devtools/python/python3/regen-all.patch
> deleted file mode 100644
> index 36b9d9d919..0000000000
> --- a/meta/recipes-devtools/python/python3/regen-all.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -python3-native: run regen-importlib target correctly
> -
> -regen-importlib depends on other regen- targets, so we must be sure =
to
> -run it after (most of) the others.  In reality, we do not need to run =
it
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
> - =
##########################################################################=
##
> - # Regenerate all generated files
> -
> --regen-all: regen-opcode regen-opcode-targets regen-typeslots =
regen-grammar regen-ast regen-importlib
> -+regen-all: regen-opcode regen-opcode-targets regen-typeslots =
regen-grammar regen-ast
> -+	$(MAKE) regen-importlib
> -
> - =
##########################################################################=
##
> - # Special rules for object files
> diff --git =
a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch =
b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch
> index 32ecab9fec..058cfdbc2d 100644
> --- =
a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch
> +++ =
b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch
> @@ -36,12 +36,12 @@ The software will still work, but it will not use =
the .pyc file as it should.
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst
> -index 0af8fb1..841f3e8 100644
> +index d720e01050..c8cc738f3d 100644
> --- a/Doc/library/py_compile.rst
> +++ b/Doc/library/py_compile.rst
> -@@ -53,6 +53,10 @@ byte-code cache files in the directory containing =
the source code.
> -    :func:`compile` function.  The default of ``-1`` selects the =
optimization
> -    level of the current interpreter.
> +@@ -59,6 +59,10 @@ byte-code cache files in the directory containing =
the source code.
> +    *invalidation_mode* will be forced to
> +    :attr:`PycInvalidationMode.CHECKED_HASH`.
>=20
> +   If the SOURCE_DATE_EPOCH environment variable is set, the .py file =
mtime
> +   and timestamp entry in .pyc file header, will be limited to this =
value.
> @@ -51,27 +51,27 @@ index 0af8fb1..841f3e8 100644
>        Changed default value of *cfile* to be :PEP:`3147`-compliant.  =
Previous
>        default was *file* + ``'c'`` (``'o'`` if optimization was =
enabled).
> diff --git a/Lib/py_compile.py b/Lib/py_compile.py
> -index 11c5b50..62dcdc7 100644
> +index 16dc0a011f..b7c28e4fdd 100644
> --- a/Lib/py_compile.py
> +++ b/Lib/py_compile.py
> -@@ -137,6 +137,10 @@ def compile(file, cfile=3DNone, dfile=3DNone, =
doraise=3DFalse, optimize=3D-1):
> -     except FileExistsError:
> +@@ -149,6 +149,10 @@ def compile(file, cfile=3DNone, dfile=3DNone, =
doraise=3DFalse, optimize=3D-1,
>          pass
> -     source_stats =3D loader.path_stats(file)
> -+    sde =3D os.environ.get('SOURCE_DATE_EPOCH')
> -+    if sde and source_stats['mtime'] > int(sde):
> -+        source_stats['mtime'] =3D int(sde)
> -+        os.utime(file, (source_stats['mtime'], =
source_stats['mtime']))
> -     bytecode =3D importlib._bootstrap_external._code_to_bytecode(
> +     if invalidation_mode =3D=3D PycInvalidationMode.TIMESTAMP:
> +         source_stats =3D loader.path_stats(file)
> ++        sde =3D os.environ.get('SOURCE_DATE_EPOCH')
> ++        if sde and source_stats['mtime'] > int(sde):
> ++            source_stats['mtime'] =3D int(sde)
> ++            os.utime(file, (source_stats['mtime'], =
source_stats['mtime']))
> +         bytecode =3D =
importlib._bootstrap_external._code_to_timestamp_pyc(
>              code, source_stats['mtime'], source_stats['size'])
> -     mode =3D importlib._bootstrap_external._calc_mode(file)
> +     else:
> diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py
> -index 4a6caa5..3d09963 100644
> +index 8fc0b3308c..1445a14548 100644
> --- a/Lib/test/test_py_compile.py
> +++ b/Lib/test/test_py_compile.py
> -@@ -98,6 +98,25 @@ def test_bad_coding(self):
> -         self.assertFalse(os.path.exists(
> -             importlib.util.cache_from_source(bad_coding)))
> +@@ -110,6 +110,25 @@ class PyCompileTests(unittest.TestCase):
> +                 fp.read(), 'test', {})
> +         self.assertEqual(flags, 0b11)
>=20
> +    def test_source_date_epoch(self):
> +        testtime =3D 123456789
> diff --git =
a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch =
b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> index 785b5567f2..d5983544c4 100644
> --- =
a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> +++ =
b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> @@ -6,26 +6,27 @@ Should fix things like
> configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 =
-DNDEBUG -fno-inline -D__SOFTFP__ =
--sysroot=3D/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/be=
aglebone -c -O2 -pipe -g -feliminate-unused-debug-types  =
-I/usr/include/ncursesw conftest.c >&5
> cc1: warning: include location "/usr/include/ncursesw" is unsafe for =
cross-compilation [-Wpoison-system-directories]
>=20
> +2018-08: Rebased to 3.7.0
> +  -- Jens
>=20
> Signed-off-by: Khem Raj
> Upstream-Status: Pending
>=20
> -
> -Index: Python-3.3.2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/setup.py	2013-07-30 01:30:48.000000000 =
-0700
> -+++ Python-3.3.2/setup.py	2013-07-30 01:41:11.697862723 -0700
> -@@ -1210,7 +1210,7 @@
> -         panel_library =3D 'panel'
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..41e88a152b 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1333,7 +1333,7 @@ class PyBuildExt(build_ext):
>          if curses_library =3D=3D 'ncursesw':
>              curses_defines.append(('HAVE_NCURSESW', '1'))
> --            curses_includes.append('/usr/include/ncursesw')
> -+            curses_includes.append('=3D/usr/include/ncursesw')
> +             if not cross_compiling:
> +-                curses_includes.append('/usr/include/ncursesw')
> ++                curses_includes.append('=3D/usr/include/ncursesw')
>              # Bug 1464056: If _curses.so links with ncursesw,
>              # _curses_panel.so must link with panelw.
>              panel_library =3D 'panelw'
> -@@ -1819,7 +1819,7 @@
> -         if host_platform =3D=3D 'darwin':
> +@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
> +                 return
>              # OS X 10.5 comes with libffi.dylib; the include files =
are
>              # in /usr/include/ffi
> -            inc_dirs.append('/usr/include/ffi')
> diff --git =
a/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch =
b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
> new file mode 100644
> index 0000000000..76623ce9e7
> --- /dev/null
> +++ =
b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
> @@ -0,0 +1,22 @@
> +Subject: [PATCH] util-linux uuid support
> +
> +Scan for uuid.h in include/uuid/ as well as in include/ to catch
> +the uuid/uuid.h well supported but accidently not detected.
> +
> +Signed-off-by: Jens Rehsack <sno@NetBSD.org>
> +diff --git a/setup.py b/setup.py
> +index a97a7559ca..01d8f24fdd 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1596,8 +1596,9 @@ class PyBuildExt(build_ext):
> +         #    missing.append('_tkinter')
> +
> +         # Build the _uuid module if possible
> +-        uuid_incs =3D find_file("uuid.h", inc_dirs, =
["/usr/include/uuid"])
> +-        if uuid_incs is not None:
> ++        uuid_incs =3D find_file("uuid.h", inc_dirs, [])
> ++        uuid_uuid_incs =3D find_file("uuid/uuid.h", inc_dirs, [])
> ++        if uuid_incs is not None or uuid_uuid_incs is not None:
> +             if self.compiler.find_library_file(lib_dirs, 'uuid'):
> +                 uuid_libs =3D ['uuid']
> +             else:
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb =
b/meta/recipes-devtools/python/python3_3.5.5.bb
> deleted file mode 100644
> index 9e31fa6f29..0000000000
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
> -DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase =3D ""
> -SRC_URI =3D =
"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> -file://python-config.patch \
> -file://0001-cross-compile-support.patch \
> -file://030-fixup-include-dirs.patch \
> -file://070-dont-clean-ipkg-install.patch \
> -file://080-distutils-dont_adjust_files.patch \
> -file://130-readline-setup.patch \
> -file://150-fix-setupterm.patch \
> =
-file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch =
\
> -file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -${DISTRO_SRC_URI} \
> -"
> -
> -SRC_URI +=3D "\
> -            file://03-fix-tkinter-detection.patch \
> -            file://avoid_warning_about_tkinter.patch \
> -            file://cgi_py.patch \
> -            file://host_include_contamination.patch \
> -            file://python-3.3-multilib.patch \
> -            file://shutil-follow-symlink-fix.patch \
> -            file://sysroot-include-headers.patch \
> -            file://unixccompiler.patch \
> -            file://avoid-ncursesw-include-path.patch \
> -            =
file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> -            file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -            =
file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -            file://configure.ac-fix-LIBPL.patch \
> -            =
file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
> -            file://pass-missing-libraries-to-Extension-for-mul.patch =
\
> -            =
file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
> -            =
file://0002-Makefile-add-target-to-split-profile-generation.patch \
> -           "
> -SRC_URI[md5sum] =3D "f3763edf9824d5d3a15f5f646083b6e0"
> -SRC_URI[sha256sum] =3D =
"063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
> -
> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Db6ec515b22618f55fa07276b897bacea"
> -
> -# exclude pre-releases for both python 2.x and 3.x
> -UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -
> -S =3D "${WORKDIR}/Python-${PV}"
> -
> -inherit autotools multilib_header python3native pkgconfig =
update-alternatives qemu
> -
> -MULTILIB_SUFFIX =3D "${@d.getVar('base_libdir',1).split('/')[-1]}"
> -
> -ALTERNATIVE_${PN}-dev =3D "python-config"
> -ALTERNATIVE_LINK_NAME[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config"
> -ALTERNATIVE_TARGET[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> -
> -CONFIGUREOPTS +=3D " --with-system-ffi "
> -
> -CACHED_CONFIGUREVARS =3D "ac_cv_have_chflags=3Dno \
> -                ac_cv_have_lchflags=3Dno \
> -                ac_cv_have_long_long_format=3Dyes \
> -                ac_cv_buggy_getaddrinfo=3Dno \
> -                ac_cv_file__dev_ptmx=3Dyes \
> -                ac_cv_file__dev_ptc=3Dno \
> -"
> -
> -TARGET_CC_ARCH +=3D "-DNDEBUG -fno-inline"
> -SDK_CC_ARCH +=3D "-DNDEBUG -fno-inline"
> -EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"
> -EXTRA_OECONF +=3D =
"CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dyn=
load/ --without-ensurepip --enable-optimizations"
> -PYTHON3_PROFILE_TASK ?=3D "${S}/Tools/pybench/pybench.py -n 1"
> -
> -export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> -export _PYTHON_PROJECT_BASE =3D "${B}"
> -export _PYTHON_PROJECT_SRC =3D "${S}"
> -export CCSHARED =3D "-fPIC"
> -
> -# Fix cross compilation of different modules
> -export CROSSPYTHONPATH =3D =
"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/l=
ib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> -
> -# No ctypes option for python 3
> -PYTHONLSBOPTS =3D ""
> -
> -PACKAGECONFIG ??=3D "readline"
> -PACKAGECONFIG[readline] =3D ",,readline"
> -
> -do_configure_append() {
> -	rm -f ${S}/Makefile.orig
> -	autoreconf -Wcross --verbose --install --force =
--exclude=3Dautopoint ../Python-${PV}/Modules/_ctypes/libffi
> -}
> -
> -do_compile() {
> -        # regenerate platform specific files, because they depend on =
system headers
> -        cd ${S}/Lib/plat-linux*
> -        include=3D${STAGING_INCDIR} =
${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
> -                ${STAGING_INCDIR}/dlfcn.h \
> -                ${STAGING_INCDIR}/linux/cdrom.h \
> -                ${STAGING_INCDIR}/netinet/in.h \
> -                ${STAGING_INCDIR}/sys/types.h
> -        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
> -        cd -
> -
> -	# remove any bogus LD_LIBRARY_PATH
> -	sed -i -e s,RUNSHARED=3D.*,RUNSHARED=3D, Makefile
> -
> -	if [ ! -f Makefile.orig ]; then
> -		install -m 0644 Makefile Makefile.orig
> -	fi
> -	sed -i -e 's,^CONFIGURE_LDFLAGS=3D.*,CONFIGURE_LDFLAGS=3D-L. =
-L${STAGING_LIBDIR},g' \
> -		-e 's,libdir=3D${libdir},libdir=3D${STAGING_LIBDIR},g' \
> -		-e =
's,libexecdir=3D${libexecdir},libexecdir=3D${STAGING_DIR_HOST}${libexecdir=
},g' \
> -		-e 's,^LIBDIR=3D.*,LIBDIR=3D${STAGING_LIBDIR},g' \
> -		-e =
's,includedir=3D${includedir},includedir=3D${STAGING_INCDIR},g' \
> -		-e 's,^INCLUDEDIR=3D.*,INCLUDE=3D${STAGING_INCDIR},g' \
> -		-e =
's,^CONFINCLUDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR},g' \
> -		Makefile
> -	# save copy of it now, because if we do it in do_install and
> -	# then call do_install twice we get Makefile.orig =3D=3D =
Makefile.sysroot
> -	install -m 0644 Makefile Makefile.sysroot
> -
> -        oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -                =
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -                STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -                STAGING_INCDIR=3D${STAGING_INCDIR} \
> -                STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> -                LIB=3D${baselib} \
> -                ARCH=3D${TARGET_ARCH} \
> -                OPT=3D"${CFLAGS}" profile-opt
> -
> -        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', =
'true', 'false', d)}; then
> -                qemu_binary=3D"${@qemu_wrapper_cmdline(d, =
'${STAGING_DIR_TARGET}', ['${B}', =
'${STAGING_DIR_TARGET}/${base_libdir}'])}"
> -                cat > pgo-image-qemuwrapper << EOF
> -#!/bin/sh
> -set -x
> -$qemu_binary "\$@"
> -EOF
> -                chmod +x pgo-image-qemuwrapper
> -                ./pgo-image-qemuwrapper ${B}/python =
${PYTHON3_PROFILE_TASK} || true
> -	fi
> -
> -        oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -                =
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -                STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -                STAGING_INCDIR=3D${STAGING_INCDIR} \
> -                STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> -                LIB=3D${baselib} \
> -                ARCH=3D${TARGET_ARCH} \
> -                OPT=3D"${CFLAGS}" clean_and_use_profile
> -}
> -
> -do_install() {
> -	# make install needs the original Makefile, or otherwise the =
inclues would
> -	# go to ${D}${STAGING...}/...
> -	install -m 0644 Makefile.orig Makefile
> -
> -	install -d ${D}${libdir}/pkgconfig
> -	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
> -
> -	# rerun the build once again with original makefile this time
> -	# run install in a separate step to avoid compile/install race
> -	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen=
 \
> -		=
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -		STAGING_INCDIR=3D${STAGING_INCDIR} \
> -		STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> -		LIB=3D${baselib} \
> -		ARCH=3D${TARGET_ARCH} \
> -		DESTDIR=3D${D} LIBDIR=3D${libdir} build_all_use_profile
> -
> -	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen=
 \
> -		=
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -		STAGING_INCDIR=3D${STAGING_INCDIR} \
> -		STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> -		LIB=3D${baselib} \
> -		ARCH=3D${TARGET_ARCH} \
> -		DESTDIR=3D${D} LIBDIR=3D${libdir} install
> -
> -	# avoid conflict with 2to3 from Python 2
> -	rm -f ${D}/${bindir}/2to3
> -
> -	install -m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> -	install -m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}=
/Makefile
> -
> -	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -		install -m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}
> -	fi
> -
> -	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> -}
> -
> -do_install_append_class-nativesdk () {
> -	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} =
TERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:=
/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'
> -}
> -
> -SSTATE_SCAN_FILES +=3D "Makefile"
> -PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
> -
> -py_package_preprocess () {
> -	# copy back the old Makefile to fix target package
> -	install -m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> -	install -m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_A=
BI}/Makefile
> -	# Remove references to buildmachine paths in target Makefile and =
_sysconfigdata
> -	sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e =
s:'--with-libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
> -		-e 's|${DEBUG_PREFIX_MAP}||g' \
> -		-e 's:${HOSTTOOLS_DIR}/::g' \
> -		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> -		-e 's:${RECIPE_SYSROOT}::g' \
> -		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> -		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile =
\
> -		=
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_A=
BI}/Makefile \
> -		=
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
> -		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> -
> -	# Recompile _sysconfigdata after modifying it
> -	cd ${PKGD}
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -	     -c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -	     -c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', =
optimize=3D1)"
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -	     -c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', =
optimize=3D2)"
> -	cd -
> -
> -	mv ${PKGD}/${bindir}/python3.5m-config =
${PKGD}/${bindir}/python3.5m-config-${MULTILIB_SUFFIX}
> -}
> -
> -# manual dependency additions
> -RPROVIDES_${PN}-modules =3D "${PN}"
> -RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " =
nativesdk-python3-modules"
> -RRECOMMENDS_${PN}-crypt =3D "openssl"
> -RRECOMMENDS_${PN}-crypt_class-nativesdk =3D "nativesdk-openssl"
> -
> -FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN}"
> -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} =
${bindir}/pydoc3"
> -FILES_${PN}-idle +=3D "${bindir}/idle3 =
${bindir}/idle${PYTHON_MAJMIN}"
> -
> -PACKAGES =3D+ "${PN}-pyvenv"
> -FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} =
${bindir}/pyvenv"
> -
> -# package libpython3
> -PACKAGES =3D+ "libpython3 libpython3-staticdev"
> -FILES_libpython3 =3D "${libdir}/libpython*.so.*"
> -FILES_libpython3-staticdev +=3D =
"${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHO=
N_BINABI}.a"
> -INSANE_SKIP_${PN}-dev +=3D "dev-elf"
> -
> -# catch all the rest (unsorted)
> -PACKAGES +=3D "${PN}-misc"
> -RDEPENDS_${PN}-misc +=3D "${PN}-core ${PN}-email ${PN}-codecs"
> -RDEPENDS_${PN}-modules +=3D "${PN}-misc"
> -FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> -
> -# catch manpage
> -PACKAGES +=3D "${PN}-man"
> -FILES_${PN}-man =3D "${datadir}/man"
> -
> -BBCLASSEXTEND =3D "nativesdk"
> -
> -RPROVIDES_${PN} +=3D "${PN}-modules"
> -
> -# We want bytecode precompiled .py files (.pyc's) by default
> -# but the user may set it on their own conf
> -INCLUDE_PYCS ?=3D "1"
> -
> -python(){
> -    import json
> -
> -    filename =3D os.path.join(d.getVar('THISDIR'), 'python3', =
'python3-manifest.json')
> -    # This python changes the datastore based on the contents of a =
file, so mark
> -    # that dependency.
> -    bb.parse.mark_dependency(d, filename)
> -
> -    with open(filename) as manifest_file:
> -        python_manifest=3Djson.load(manifest_file)
> -
> -    include_pycs =3D d.getVar('INCLUDE_PYCS')
> -
> -    packages =3D d.getVar('PACKAGES').split()
> -    pn =3D d.getVar('PN')
> -
> -    newpackages=3D[]
> -    for key in python_manifest:
> -        pypackage=3D pn + '-' + key
> -
> -        if pypackage not in packages:
> -            # We need to prepend, otherwise python-misc gets =
everything
> -            # so we use a new variable
> -            newpackages.append(pypackage)
> -
> -        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> -        d.setVar('FILES_' + pypackage, '')
> -        for value in python_manifest[key]['files']:
> -            d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -    	# Add cached files
> -        if include_pycs =3D=3D '1':
> -            for value in python_manifest[key]['cached']:
> -                    d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -        d.setVar('RDEPENDS_' + pypackage, '')
> -        for value in python_manifest[key]['rdepends']:
> -            # Make it work with or without $PN
> -            if '${PN}' in value:
> -                value=3Dvalue.split('-')[1]
> -            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + =
value)
> -        d.setVar('SUMMARY_' + pypackage, =
python_manifest[key]['summary'])
> -
> -    # We need to ensure staticdev packages match for files first so =
we sort in reverse
> -    newpackages.sort(reverse=3DTrue)
> -    # Prepending so to avoid python-misc getting everything
> -    packages =3D newpackages + packages
> -    d.setVar('PACKAGES', ' '.join(packages))
> -    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> -}
> -
> -# Files needed to create a new manifest
> -SRC_URI +=3D "file://create_manifest3.py file://get_module_deps3.py =
file://python3-manifest.json"
> -
> -do_create_manifest() {
> -    # This task should be run with every new release of Python.
> -    # We must ensure that PACKAGECONFIG enables everything when =
creating
> -    # a new manifest, this is to base our new manifest on a complete
> -    # native python build, containing all dependencies, otherwise the =
task
> -    # wont be able to find the required files.
> -    # e.g. BerkeleyDB is an optional build dependency so it may or =
may not
> -    # be present, we must ensure it is.
> -
> -    cd ${WORKDIR}
> -    # This needs to be executed by python-native and NOT by HOST's =
python
> -    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
> -    cp python3-manifest.json.new =
${THISDIR}/python3/python3-manifest.json
> -}
> -
> -# bitbake python -c create_manifest
> -addtask do_create_manifest
> -
> -# Make sure we have native python ready when we create a new manifest
> -do_create_manifest[depends] +=3D "python3:do_prepare_recipe_sysroot"
> -do_create_manifest[depends] +=3D "python3:do_patch"
> diff --git a/meta/recipes-devtools/python/python3_3.7.0.bb =
b/meta/recipes-devtools/python/python3_3.7.0.bb
> new file mode 100644
> index 0000000000..22e9799424
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3_3.7.0.bb
> @@ -0,0 +1,316 @@
> +require recipes-devtools/python/python3.inc
> +
> +DEPENDS =3D "libffi bzip2 gdbm openssl sqlite3 zlib xz \
> +           util-linux libtirpc libnsl2 virtual/libintl virtual/crypt"
> +DEPENDS +=3D "${@["qemu-native qemu-helper-native", =
""][(bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 0, 1, d))]}"
> +
> +PYTHON_BINABI =3D "${PYTHON_MAJMIN}${PYTHON_ABI}"
> +
> +SRC_URI +=3D =
"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> +    file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
> +    file://cgi_py.patch \
> +    file://host_include_contamination.patch \
> +    file://uuid_when_cross_compiling.patch \
> +    file://avoid-ncursesw-include-path.patch \
> +    file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> +    file://configure.ac-fix-LIBPL.patch \
> +    file://pass-missing-libraries-to-Extension-for-mul.patch \
> +    file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch =
\
> +"
> +
> +inherit multilib_header python3native update-alternatives qemu
> +
> +MULTILIB_SUFFIX =3D "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +ALTERNATIVE_${PN}-dev =3D "python-config"
> +ALTERNATIVE_LINK_NAME[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config"
> +ALTERNATIVE_TARGET[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> +
> +CACHED_CONFIGUREVARS =3D "ac_cv_have_chflags=3Dno \
> +                ac_cv_have_lchflags=3Dno \
> +                ac_cv_have_long_long_format=3Dyes \
> +                ac_cv_buggy_getaddrinfo=3Dno \
> +                ac_cv_file__dev_ptmx=3Dyes \
> +                ac_cv_file__dev_ptc=3Dno \
> +"
> +
> +TARGET_CC_ARCH +=3D "-DNDEBUG -fno-inline"
> +SDK_CC_ARCH +=3D "-DNDEBUG -fno-inline"
> +EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"
> +EXTRA_OECONF +=3D =
"CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dyn=
load/ --without-ensurepip --enable-optimizations"
> +PYTHON3_PROFILE_TASK ?=3D "${S}/Tools/pybench/pybench.py -n 1"
> +
> +export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> +export _PYTHON_PROJECT_BASE =3D "${B}"
> +export _PYTHON_PROJECT_SRC =3D "${S}"
> +export CCSHARED =3D "-fPIC"
> +
> +# Fix cross compilation of different modules
> +export CROSSPYTHONPATH =3D =
"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/l=
ib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> +
> +# No ctypes option for python 3
> +PYTHONLSBOPTS =3D ""
> +
> +PACKAGECONFIG ??=3D "readline"
> +PACKAGECONFIG[readline] =3D ",,readline"
> +
> +do_compile() {
> +        # regenerate platform specific files, because they depend on =
system headers
> +        #cd ${S}/Lib/plat-linux*
> +        #include=3D${STAGING_INCDIR} =
${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +        #        ${S}/Tools/scripts/h2py.py -i '(u_long)' \
> +        #        ${STAGING_INCDIR}/dlfcn.h \
> +        #        ${STAGING_INCDIR}/linux/cdrom.h \
> +        #        ${STAGING_INCDIR}/netinet/in.h \
> +        #        ${STAGING_INCDIR}/sys/types.h
> +        #sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
> +        #cd -
> +
> +	# remove any bogus LD_LIBRARY_PATH
> +	sed -i -e s,RUNSHARED=3D.*,RUNSHARED=3D, Makefile
> +
> +	if [ ! -f Makefile.orig ]; then
> +		install -m 0644 Makefile Makefile.orig
> +	fi
> +	sed -i -e 's,^CONFIGURE_LDFLAGS=3D.*,CONFIGURE_LDFLAGS=3D-L. =
-L${STAGING_LIBDIR},g' \
> +		-e 's,libdir=3D${libdir},libdir=3D${STAGING_LIBDIR},g' \
> +		-e =
's,libexecdir=3D${libexecdir},libexecdir=3D${STAGING_DIR_HOST}${libexecdir=
},g' \
> +		-e 's,^LIBDIR=3D.*,LIBDIR=3D${STAGING_LIBDIR},g' \
> +		-e =
's,includedir=3D${includedir},includedir=3D${STAGING_INCDIR},g' \
> +		-e 's,^INCLUDEDIR=3D.*,INCLUDE=3D${STAGING_INCDIR},g' \
> +		-e =
's,^CONFINCLUDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR},g' \
> +		Makefile
> +
> +        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', =
'true', 'false', d)}; then
> +                qemu_binary=3D"${@qemu_wrapper_cmdline(d, =
'${STAGING_DIR_TARGET}', ['${B}', =
'${STAGING_DIR_TARGET}/${base_libdir}'])}"
> +                cat > ${B}/pgo-image-qemuwrapper << EOF
> +#!/bin/sh
> +set -x
> +$qemu_binary "\$@"
> +EOF
> +                chmod +x ${B}/pgo-image-qemuwrapper
> +                ./pgo-image-qemuwrapper ${B}/python =
${PYTHON3_PROFILE_TASK} || true
> +                sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) =
./$(BUILDPYTHON) $(PROFILE_TASK),'"${B}/pgo-image-qemuwrapper =
${B}/python ${PYTHON3_PROFILE_TASK}," \
> +                        Makefile
> +	else
> +                sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) =
./$(BUILDPYTHON) $(PROFILE_TASK),,' \
> +                        Makefile
> +	fi
> +
> +	# save copy of it now, because if we do it in do_install and
> +	# then call do_install twice we get Makefile.orig =3D=3D =
Makefile.sysroot
> +	install -m 0644 Makefile Makefile.sysroot
> +
> +        oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> +                =
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +                STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +                STAGING_INCDIR=3D${STAGING_INCDIR} \
> +                STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> +                LIB=3D${baselib} \
> +                ARCH=3D${TARGET_ARCH} \
> +                OPT=3D"${CFLAGS}" profile-opt
> +}
> +
> +do_install() {
> +	# make install needs the original Makefile, or otherwise the =
inclues would
> +	# go to ${D}${STAGING...}/...
> +	install -m 0644 Makefile.orig Makefile
> +
> +	install -d ${D}${libdir}/pkgconfig
> +	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
> +
> +	# rerun the build once again with original makefile this time
> +	# run install in a separate step to avoid compile/install race
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen=
 \
> +		=
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +		STAGING_INCDIR=3D${STAGING_INCDIR} \
> +		STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> +		LIB=3D${baselib} \
> +		ARCH=3D${TARGET_ARCH} \
> +		DESTDIR=3D${D} LIBDIR=3D${libdir} build_all
> +
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen=
 \
> +		=
HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +		STAGING_INCDIR=3D${STAGING_INCDIR} \
> +		STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> +		LIB=3D${baselib} \
> +		ARCH=3D${TARGET_ARCH} \
> +		DESTDIR=3D${D} LIBDIR=3D${libdir} install
> +
> +	# avoid conflict with 2to3 from Python 2
> +	rm -f ${D}/${bindir}/2to3
> +
> +	set -x
> +        install -m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +	install -m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}=
/Makefile
> +
> +	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +		install -m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}
> +	fi
> +
> +	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +}
> +
> +do_install_append_class-nativesdk () {
> +	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} =
TERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:=
/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'
> +}
> +
> +SSTATE_SCAN_FILES +=3D "Makefile"
> +PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
> +
> +py_package_preprocess () {
> +	MAKESETTINGS=3D"$(egrep '^(ABIFLAGS|MULTIARCH)=3D' ${B}/Makefile =
| sed -E -e 's/[[:space:]]//g' -e 's/=3D/=3D"/' -e 's/$/"/')"
> +	eval ${MAKESETTINGS}
> +	if test "${ABIFLAGS}" !=3D "${PYTHON_ABI}"; then
> +	    die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' =
!=3D '${PYTHON_ABI}' from python3-dir.bbclass"
> +	fi
> +	if test "x${BUILD_OS}" =3D "x${TARGET_OS}"; then
> +		# no cross-compile at all
> +		=
_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
> +	else
> +		# at the very moment, it's the only available target
> +		=
_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_linux_${MULTIARCH}
> +	fi
> +
> +	# copy back the old Makefile to fix target package
> +	install -m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +	install -m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIAR=
CH}/Makefile
> +	# Remove references to buildmachine paths in target Makefile and =
_sysconfigdata
> +	sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e =
s:'--with-libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
> +		-e 's|${DEBUG_PREFIX_MAP}||g' \
> +		-e 's:${HOSTTOOLS_DIR}/::g' \
> +		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +		-e 's:${RECIPE_SYSROOT}::g' \
> +		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> +		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile =
\
> +		=
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIAR=
CH}/Makefile \
> +		=
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFI=
GDATA_NAME}.py \
> +		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> +
> +	# Recompile _sysconfigdata after modifying it
> +	cd ${PKGD}
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +	     -c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCO=
NFIGDATA_NAME}.py')"
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +	     -c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCO=
NFIGDATA_NAME}.py', optimize=3D1)"
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +	     -c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCO=
NFIGDATA_NAME}.py', optimize=3D2)"
> +	cd -
> +
> +	mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config =
${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> +}
> +
> +# manual dependency additions
> +RPROVIDES_${PN}-modules =3D "${PN}"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " =
nativesdk-python3-modules"
> +RRECOMMENDS_${PN}-crypt =3D "openssl"
> +RRECOMMENDS_${PN}-crypt_class-nativesdk =3D "nativesdk-openssl"
> +
> +FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN}"
> +FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} =
${bindir}/pydoc3"
> +FILES_${PN}-idle +=3D "${bindir}/idle3 =
${bindir}/idle${PYTHON_MAJMIN}"
> +
> +PACKAGES =3D+ "${PN}-pyvenv"
> +FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} =
${bindir}/pyvenv"
> +
> +# package libpython3
> +PACKAGES =3D+ "libpython3 libpython3-staticdev"
> +FILES_libpython3 =3D "${libdir}/libpython*.so.*"
> +FILES_libpython3-staticdev +=3D =
"${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}*/libpython${PYTH=
ON_BINABI}.a"
> +INSANE_SKIP_${PN}-dev +=3D "dev-elf"
> +
> +# catch all the rest (unsorted)
> +PACKAGES +=3D "${PN}-misc"
> +RDEPENDS_${PN}-misc +=3D "${PN}-core ${PN}-email ${PN}-codecs"
> +RDEPENDS_${PN}-modules +=3D "${PN}-misc"
> +FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> +
> +# catch manpage
> +PACKAGES +=3D "${PN}-man"
> +FILES_${PN}-man =3D "${datadir}/man"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> +
> +RPROVIDES_${PN} +=3D "${PN}-modules"
> +
> +# We want bytecode precompiled .py files (.pyc's) by default
> +# but the user may set it on their own conf
> +INCLUDE_PYCS ?=3D "1"
> +
> +python(){
> +    import json
> +
> +    filename =3D os.path.join(d.getVar('THISDIR'), 'python3', =
'python3-manifest.json')
> +    # This python changes the datastore based on the contents of a =
file, so mark
> +    # that dependency.
> +    bb.parse.mark_dependency(d, filename)
> +
> +    with open(filename) as manifest_file:
> +        python_manifest=3Djson.load(manifest_file)
> +
> +    include_pycs =3D d.getVar('INCLUDE_PYCS')
> +
> +    packages =3D d.getVar('PACKAGES').split()
> +    pn =3D d.getVar('PN')
> +
> +    newpackages=3D[]
> +    for key in python_manifest:
> +        pypackage=3D pn + '-' + key
> +
> +        if pypackage not in packages:
> +            # We need to prepend, otherwise python-misc gets =
everything
> +            # so we use a new variable
> +            newpackages.append(pypackage)
> +
> +        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> +        d.setVar('FILES_' + pypackage, '')
> +        for value in python_manifest[key]['files']:
> +            d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +    	# Add cached files
> +        if include_pycs =3D=3D '1':
> +            for value in python_manifest[key]['cached']:
> +                    d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +        d.setVar('RDEPENDS_' + pypackage, '')
> +        for value in python_manifest[key]['rdepends']:
> +            # Make it work with or without $PN
> +            if '${PN}' in value:
> +                value=3Dvalue.split('-')[1]
> +            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + =
value)
> +        d.setVar('SUMMARY_' + pypackage, =
python_manifest[key]['summary'])
> +
> +    # We need to ensure staticdev packages match for files first so =
we sort in reverse
> +    newpackages.sort(reverse=3DTrue)
> +    # Prepending so to avoid python-misc getting everything
> +    packages =3D newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> +}
> +
> +# Files needed to create a new manifest
> +SRC_URI +=3D "file://create_manifest3.py file://get_module_deps3.py =
file://python3-manifest.json"
> +
> +do_create_manifest() {
> +    # This task should be run with every new release of Python.
> +    # We must ensure that PACKAGECONFIG enables everything when =
creating
> +    # a new manifest, this is to base our new manifest on a complete
> +    # native python build, containing all dependencies, otherwise the =
task
> +    # wont be able to find the required files.
> +    # e.g. BerkeleyDB is an optional build dependency so it may or =
may not
> +    # be present, we must ensure it is.
> +
> +    cd ${WORKDIR}
> +    # This needs to be executed by python-native and NOT by HOST's =
python
> +    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
> +    cp python3-manifest.json.new =
${THISDIR}/python3/python3-manifest.json
> +}
> +
> +# bitbake python -c create_manifest
> +addtask do_create_manifest
> +
> +# Make sure we have native python ready when we create a new manifest
> +do_create_manifest[depends] +=3D "python3:do_prepare_recipe_sysroot"
> +do_create_manifest[depends] +=3D "python3:do_patch"
> --
> 2.17.1
>=20


I had weird build issues on nativesdk-gpgme after that update, but this =
went
magically away after rebasing my repo to poky/master. I hope it works =
generally.

BTW: I could need some hints how to debug build_ext or unixcompiler, =
respectively.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_36B8F7CE-20A3-4443-BA4C-CD3294B989BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Am =
07.09.2018 um 16:55 schrieb Jens Rehsack &lt;<a =
href=3D"mailto:sno@NetBSD.org" class=3D"">sno@NetBSD.org</a>&gt;:<br =
class=3D""><div><blockquote type=3D"cite" class=3D""><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Update=
 python3 to recent 3.7.0 release.<br class=3D""><br class=3D"">Details =
about new features and bug-fixes can be taken from<br class=3D"">* <a =
href=3D"https://docs.python.org/3/whatsnew/3.7.html" =
class=3D"">https://docs.python.org/3/whatsnew/3.7.html</a><br class=3D"">*=
 <a href=3D"https://docs.python.org/3/whatsnew/3.6.html" =
class=3D"">https://docs.python.org/3/whatsnew/3.6.html</a><br =
class=3D""><br class=3D"">Instead of using a common inc with python2 and =
override most of<br class=3D"">it's settings, introduce a dedicated =
python3.inc.<br class=3D""><br class=3D"">Remove patches when they were =
fixed upstream and rebase the<br class=3D"">remaining ones. If =
necessary, the patches are adopted to<br class=3D"">keep the idea when =
upstream code was changed.<br class=3D""><br class=3D"">Open TODO: track =
patches in a -STABLE rebased git branch for<br class=3D"">easier =
rebasing or upstream submitting.<br class=3D""><br class=3D"">Enhancement =
requests for Yocto project<br class=3D"">* <a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12375" =
class=3D"">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12375</a><b=
r class=3D"">* <a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12901" =
class=3D"">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12901</a><b=
r class=3D"">are solved by this.<br class=3D""><br =
class=3D"">Signed-off-by: Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt;<br =
class=3D"">---<br class=3D""> meta/classes/python3-dir.bbclass =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| &nbsp;&nbsp;6 +-<br class=3D""> .../python/python3-native_3.5.5.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 112 =
------<br class=3D""> .../python/python3-native_3.7.0.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;74 ++++<br class=3D""> meta/recipes-devtools/python/python3.inc =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;80 ++++<br class=3D""> =
...hell-version-of-python-config-that-w.patch | &nbsp;21 +-<br class=3D"">=
 ..._sysconfigdata.py-to-initialize-dist.patch | &nbsp;66 ----<br =
class=3D""> .../python3/0001-cross-compile-support.patch &nbsp;| =
&nbsp;66 ++--<br class=3D""> =
...d-target-to-split-profile-generation.patch | &nbsp;40 --<br class=3D"">=
 .../python3/03-fix-tkinter-detection.patch &nbsp;&nbsp;&nbsp;| &nbsp;12 =
+-<br class=3D""> .../python3/030-fixup-include-dirs.patch =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;9 -<br class=3D""> =
.../080-distutils-dont_adjust_files.patch &nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;4 +-<br class=3D""> =
.../python/python3/150-fix-setupterm.patch &nbsp;&nbsp;&nbsp;| &nbsp;17 =
-<br class=3D""> ...GS-for-extensions-when-cross-compili.patch | =
&nbsp;53 ++-<br class=3D""> =
.../python3/avoid-ncursesw-include-path.patch | &nbsp;18 +-<br class=3D"">=
 .../python3/avoid_warning_about_tkinter.patch | &nbsp;18 +-<br =
class=3D""> .../python3/configure.ac-fix-LIBPL.patch =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;21 +-<br class=3D""> =
...ssing-libraries-to-Extension-for-mul.patch | &nbsp;26 +-<br class=3D"">=
 .../python/python3/python-3.3-multilib.patch &nbsp;| 241 =
++++++------<br class=3D""> .../python/python3/python3-manifest.json =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;2 +-<br class=3D""> =
...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | &nbsp;17 +-<br class=3D"">=
 .../python/python3/regen-all.patch =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;25 --<br class=3D""> ...port_SOURCE_DATE_EPOCH_in_py_compile.patch =
| &nbsp;36 +-<br class=3D""> .../python3/sysroot-include-headers.patch =
&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;23 +-<br class=3D""> =
.../python3/uuid_when_cross_compiling.patch &nbsp;&nbsp;| &nbsp;22 ++<br =
class=3D""> meta/recipes-devtools/python/python3_3.5.5.bb | 346 =
------------------<br class=3D""> =
meta/recipes-devtools/python/python3_3.7.0.bb | 316 ++++++++++++++++<br =
class=3D""> 26 files changed, 783 insertions(+), 888 deletions(-)<br =
class=3D""> delete mode 100644 =
meta/recipes-devtools/python/python3-native_3.5.5.bb<br class=3D""> =
create mode 100644 =
meta/recipes-devtools/python/python3-native_3.7.0.bb<br class=3D""> =
create mode 100644 meta/recipes-devtools/python/python3.inc<br class=3D"">=
 delete mode 100644 =
meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.p=
y-to-initialize-dist.patch<br class=3D""> delete mode 100644 =
meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-pro=
file-generation.patch<br class=3D""> delete mode 100644 =
meta/recipes-devtools/python/python3/150-fix-setupterm.patch<br =
class=3D""> delete mode 100644 =
meta/recipes-devtools/python/python3/regen-all.patch<br class=3D""> =
create mode 100644 =
meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch<br =
class=3D""> delete mode 100644 =
meta/recipes-devtools/python/python3_3.5.5.bb<br class=3D""> create mode =
100644 meta/recipes-devtools/python/python3_3.7.0.bb<br class=3D""><br =
class=3D"">diff --git a/meta/classes/python3-dir.bbclass =
b/meta/classes/python3-dir.bbclass<br class=3D"">index =
06bb046d9c..26d2b6668b 100644<br class=3D"">--- =
a/meta/classes/python3-dir.bbclass<br class=3D"">+++ =
b/meta/classes/python3-dir.bbclass<br class=3D"">@@ -1,4 +1,8 @@<br =
class=3D"">-PYTHON_BASEVERSION =3D "3.5"<br class=3D"">+PYTHON_BASEVERSION=
 =3D "3.7"<br class=3D"">+# [d][m]<br class=3D"">+# d: py_debug<br =
class=3D"">+# m: my_malloc<br class=3D"">+# u: wide-char unicode<br =
class=3D""> PYTHON_ABI =3D "m"<br class=3D""> PYTHON_DIR =3D =
"python${PYTHON_BASEVERSION}"<br class=3D""> PYTHON_PN =3D "python3"<br =
class=3D"">diff --git =
a/meta/recipes-devtools/python/python3-native_3.5.5.bb =
b/meta/recipes-devtools/python/python3-native_3.5.5.bb<br =
class=3D"">deleted file mode 100644<br class=3D"">index =
3098027d80..0000000000<br class=3D"">--- =
a/meta/recipes-devtools/python/python3-native_3.5.5.bb<br class=3D"">+++ =
/dev/null<br class=3D"">@@ -1,112 +0,0 @@<br class=3D"">-require =
recipes-devtools/python/python.inc<br class=3D"">-<br class=3D"">-PR =3D =
"${INC_PR}.0"<br class=3D"">-PYTHON_MAJMIN =3D "3.5"<br =
class=3D"">-DISTRO_SRC_URI ?=3D "<a href=3D"file://sitecustomize.py" =
class=3D"">file://sitecustomize.py</a>"<br =
class=3D"">-DISTRO_SRC_URI_linuxstdbase =3D ""<br class=3D"">-SRC_URI =3D =
"<a href=3D"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz" =
class=3D"">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> =
\<br class=3D"">-<a =
href=3D"file://12-distutils-prefix-is-inside-staging-area.patch" =
class=3D"">file://12-distutils-prefix-is-inside-staging-area.patch</a> =
\<br class=3D"">-<a href=3D"file://python-config.patch" =
class=3D"">file://python-config.patch</a> \<br class=3D"">-<a =
href=3D"file://0001-cross-compile-support.patch" =
class=3D"">file://0001-cross-compile-support.patch</a> \<br class=3D"">-<a=
 href=3D"file://030-fixup-include-dirs.patch" =
class=3D"">file://030-fixup-include-dirs.patch</a> \<br class=3D"">-<a =
href=3D"file://070-dont-clean-ipkg-install.patch" =
class=3D"">file://070-dont-clean-ipkg-install.patch</a> \<br =
class=3D"">-<a href=3D"file://080-distutils-dont_adjust_files.patch" =
class=3D"">file://080-distutils-dont_adjust_files.patch</a> \<br =
class=3D"">-<a href=3D"file://130-readline-setup.patch" =
class=3D"">file://130-readline-setup.patch</a> \<br class=3D"">-<a =
href=3D"file://150-fix-setupterm.patch" =
class=3D"">file://150-fix-setupterm.patch</a> \<br class=3D"">-<a =
href=3D"file://python-3.3-multilib.patch" =
class=3D"">file://python-3.3-multilib.patch</a> \<br class=3D"">-<a =
href=3D"file://03-fix-tkinter-detection.patch" =
class=3D"">file://03-fix-tkinter-detection.patch</a> \<br class=3D"">-<a =
href=3D"file://avoid_warning_about_tkinter.patch" =
class=3D"">file://avoid_warning_about_tkinter.patch</a> \<br =
class=3D"">-<a href=3D"file://shutil-follow-symlink-fix.patch" =
class=3D"">file://shutil-follow-symlink-fix.patch</a> \<br class=3D"">-<a =
href=3D"file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.p=
atch" =
class=3D"">file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDec=
o.patch</a> \<br class=3D"">-<a =
href=3D"file://sysroot-include-headers.patch" =
class=3D"">file://sysroot-include-headers.patch</a> \<br class=3D"">-<a =
href=3D"file://unixccompiler.patch" =
class=3D"">file://unixccompiler.patch</a> \<br =
class=3D"">-${DISTRO_SRC_URI} \<br class=3D"">-<a =
href=3D"file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch" =
class=3D"">file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch</a> \<br =
class=3D"">-<a =
href=3D"file://setup.py-check-cross_compiling-when-get-FLAGS.patch" =
class=3D"">file://setup.py-check-cross_compiling-when-get-FLAGS.patch</a> =
\<br class=3D"">-<a =
href=3D"file://0001-Do-not-use-the-shell-version-of-python-config-that-w.p=
atch" =
class=3D"">file://0001-Do-not-use-the-shell-version-of-python-config-that-=
w.patch</a> \<br class=3D"">-<a =
href=3D"file://support_SOURCE_DATE_EPOCH_in_py_compile.patch" =
class=3D"">file://support_SOURCE_DATE_EPOCH_in_py_compile.patch</a> \<br =
class=3D"">-<a href=3D"file://regen-all.patch" =
class=3D"">file://regen-all.patch</a> \<br class=3D"">-"<br =
class=3D"">-<br class=3D"">-SRC_URI[md5sum] =3D =
"f3763edf9824d5d3a15f5f646083b6e0"<br class=3D"">-SRC_URI[sha256sum] =3D =
"063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"<br =
class=3D"">-<br class=3D"">-LIC_FILES_CHKSUM =3D "<a =
href=3D"file://LICENSE;md5=3Db6ec515b22618f55fa07276b897bacea" =
class=3D"">file://LICENSE;md5=3Db6ec515b22618f55fa07276b897bacea</a>"<br =
class=3D"">-<br class=3D"">-# exclude pre-releases for both python 2.x =
and 3.x<br class=3D"">-UPSTREAM_CHECK_REGEX =3D =
"[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).tar"<br class=3D"">-<br =
class=3D"">-S =3D "${WORKDIR}/Python-${PV}"<br class=3D"">-<br =
class=3D"">-EXTRANATIVEPATH +=3D "bzip2-native"<br class=3D"">-DEPENDS =3D=
 "openssl-native bzip2-replacement-native zlib-native readline-native =
sqlite3-native gdbm-native"<br class=3D"">-<br class=3D"">-inherit =
native<br class=3D"">-<br class=3D"">-EXTRA_OECONF_append =3D " =
--bindir=3D${bindir}/${PN} --without-ensurepip"<br class=3D"">-<br =
class=3D"">-EXTRA_OEMAKE =3D '\<br class=3D"">- &nbsp;LIBC=3D"" \<br =
class=3D"">- &nbsp;STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \<br =
class=3D"">- &nbsp;STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \<br =
class=3D"">- &nbsp;LIB=3D${baselib} \<br class=3D"">- =
&nbsp;ARCH=3D${TARGET_ARCH} \<br class=3D"">-'<br class=3D"">-<br =
class=3D"">-# No ctypes option for python 3<br class=3D"">-PYTHONLSBOPTS =
=3D ""<br class=3D"">-<br class=3D"">-do_configure_append() {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>autoreconf --verbose --install --force --exclude=3Dautopoint =
../Python-${PV}/Modules/_ctypes/libffi<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>sed -i -e =
's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \*/,' =
${B}/pyconfig.h<br class=3D"">-}<br class=3D"">-<br class=3D"">-# =
Regenerate all of the generated files<br class=3D"">-# This ensures that =
pgen and friends get created during the compile phase<br class=3D"">-#<br =
class=3D"">-do_compile_prepend() {<br class=3D"">- &nbsp;&nbsp;&nbsp;# =
Assuming <a href=3D"https://bugs.python.org/issue33080" =
class=3D"">https://bugs.python.org/issue33080</a> has been addressed in =
Makefile.<br class=3D"">- &nbsp;&nbsp;&nbsp;oe_runmake regen-all<br =
class=3D"">-}<br class=3D"">-<br class=3D"">-do_install() {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/pkgconfig<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>oe_runmake 'DESTDIR=3D${D}' install<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if [ -e =
${WORKDIR}/sitecustomize.py ]; then<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${bindir}/${PN}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0755 Parser/pgen ${D}${bindir}/${PN}<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># Make sure we use /usr/bin/env python<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for =
PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; =
do<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>sed -i -e =
'1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>done<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
Add a symlink to the native Python so that scripts can just invoke<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# "nativepython" =
and get the right one without needing absolute paths<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# (these often end up too long =
for the #! parser in the kernel as the<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# buffer is 128 bytes =
long).<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ln -s =
python3-native/python3 ${D}${bindir}/nativepython3<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-python(){<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;# Read JSON manifest<br class=3D"">- =
&nbsp;&nbsp;&nbsp;import json<br class=3D"">- =
&nbsp;&nbsp;&nbsp;pythondir =3D d.getVar('THISDIR',True)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;with open(pythondir+'/python3/python3-manifest.json') =
as manifest_file:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;python_manifest=3Djson.load(mani=
fest_file)<br class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;rprovides =3D=
 d.getVar('RPROVIDES').split()<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;# Hardcoded since it cant be python3-native-foo, =
should be python3-foo-native<br class=3D"">- &nbsp;&nbsp;&nbsp;pn =3D =
'python3'<br class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;for key in =
python_manifest:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pypackage =3D pn + '-' + key + =
'-native'<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
pypackage not in rprovides:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;rprovides.append(pypackage)<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;d.setVar('RPROVIDES', ' '.join(rprovides))<br =
class=3D"">-}<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3-native_3.7.0.bb =
b/meta/recipes-devtools/python/python3-native_3.7.0.bb<br class=3D"">new =
file mode 100644<br class=3D"">index 0000000000..fdbc9888b9<br =
class=3D"">--- /dev/null<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3-native_3.7.0.bb<br class=3D"">@@ =
-0,0 +1,74 @@<br class=3D"">+require =
recipes-devtools/python/python3.inc<br class=3D"">+<br class=3D"">+SRC_URI=
 +=3D "\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///12-distutils-prefix-is-inside-staging-area.patch" =
class=3D"">file://12-distutils-prefix-is-inside-staging-area.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-Do-not-use-the-shell-version-of-python-config-that-w.=
patch" =
class=3D"">file://0001-Do-not-use-the-shell-version-of-python-config-that-=
w.patch</a> \<br class=3D"">+"<br class=3D"">+<br =
class=3D"">+EXTRANATIVEPATH +=3D "bzip2-native"<br class=3D"">+DEPENDS =3D=
 "openssl-native libffi-native bzip2-replacement-native zlib-native =
readline-native sqlite3-native gdbm-native"<br class=3D"">+<br =
class=3D"">+inherit native<br class=3D"">+<br =
class=3D"">+EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} =
--without-ensurepip"<br class=3D"">+<br class=3D"">+EXTRA_OEMAKE =3D =
'\<br class=3D"">+ &nbsp;LIBC=3D"" \<br class=3D"">+ =
&nbsp;STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \<br class=3D"">+ =
&nbsp;STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \<br class=3D"">+ =
&nbsp;LIB=3D${baselib} \<br class=3D"">+ &nbsp;ARCH=3D${TARGET_ARCH} =
\<br class=3D"">+'<br class=3D"">+<br class=3D"">+# No ctypes option for =
python 3<br class=3D"">+PYTHONLSBOPTS =3D ""<br class=3D"">+<br =
class=3D"">+# Regenerate all of the generated files<br class=3D"">+# =
This ensures that pgen and friends get created during the compile =
phase<br class=3D"">+#<br class=3D"">+do_compile_prepend() {<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;# Assuming <a =
href=3D"https://bugs.python.org/issue33080" =
class=3D"">https://bugs.python.org/issue33080</a> has been addressed in =
Makefile.<br class=3D"">+ &nbsp;&nbsp;&nbsp;oe_runmake regen-all<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+do_install() {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/pkgconfig<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>oe_runmake 'DESTDIR=3D${D}' install<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if [ -e =
${WORKDIR}/sitecustomize.py ]; then<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${bindir}/${PN}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0755 Parser/pgen ${D}${bindir}/${PN}<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># Make sure we use /usr/bin/env python<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for =
PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; =
do<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>sed -i -e =
'1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>done<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
Add a symlink to the native Python so that scripts can just invoke<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# "nativepython" =
and get the right one without needing absolute paths<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# (these often end up too long =
for the #! parser in the kernel as the<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# buffer is 128 bytes =
long).<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ln -s =
python3-native/python3 ${D}${bindir}/nativepython3<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+python(){<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;# Read JSON manifest<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;import json<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;pythondir =3D d.getVar('THISDIR',True)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;with open(pythondir+'/python3/python3-manifest.json') =
as manifest_file:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;python_manifest=3Djson.load(mani=
fest_file)<br class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;rprovides =3D=
 d.getVar('RPROVIDES').split()<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;# Hardcoded since it cant be python3-native-foo, =
should be python3-foo-native<br class=3D"">+ &nbsp;&nbsp;&nbsp;pn =3D =
'python3'<br class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;for key in =
python_manifest:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pypackage =3D pn + '-' + key + =
'-native'<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
pypackage not in rprovides:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;rprovides.append(pypackage)<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;d.setVar('RPROVIDES', ' '.join(rprovides))<br =
class=3D"">+}<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3.inc =
b/meta/recipes-devtools/python/python3.inc<br class=3D"">new file mode =
100644<br class=3D"">index 0000000000..44070fdbf7<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3.inc<br class=3D"">@@ -0,0 +1,80 =
@@<br class=3D"">+SUMMARY =3D "The Python Programming Language"<br =
class=3D"">+HOMEPAGE =3D "<a href=3D"http://www.python.org" =
class=3D"">http://www.python.org</a>"<br class=3D"">+LICENSE =3D =
"PSFv2"<br class=3D"">+SECTION =3D "devel/python"<br class=3D"">+# bump =
this on every change in contrib/python/generate-manifest-2.7.py<br =
class=3D"">+INC_PR =3D "r1"<br class=3D"">+<br class=3D"">+PR =3D =
"${INC_PR}.0"<br class=3D"">+PYTHON_MAJMIN =3D "3.7"<br =
class=3D"">+DISTRO_SRC_URI ?=3D "<a href=3D"file://sitecustomize.py" =
class=3D"">file://sitecustomize.py</a>"<br =
class=3D"">+DISTRO_SRC_URI_linuxstdbase =3D ""<br class=3D"">+SRC_URI =3D =
"<a href=3D"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz" =
class=3D"">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///python-config.patch" =
class=3D"">file://python-config.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///python-3.3-multilib.patch" =
class=3D"">file://python-3.3-multilib.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///03-fix-tkinter-detection.patch" =
class=3D"">file://03-fix-tkinter-detection.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///avoid_warning_about_tkinter.patch" =
class=3D"">file://avoid_warning_about_tkinter.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///unixccompiler.patch" =
class=3D"">file://unixccompiler.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///sysroot-include-headers.patch" =
class=3D"">file://sysroot-include-headers.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///shutil-follow-symlink-fix.patch" =
class=3D"">file://shutil-follow-symlink-fix.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///sysconfig.py-add-_PYTHON_PROJECT_SRC.patch" =
class=3D"">file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch</a> \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///setup.py-check-cross_compiling-when-get-FLAGS.patch" =
class=3D"">file://setup.py-check-cross_compiling-when-get-FLAGS.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-cross-compile-support.patch" =
class=3D"">file://0001-cross-compile-support.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///030-fixup-include-dirs.patch" =
class=3D"">file://030-fixup-include-dirs.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///070-dont-clean-ipkg-install.patch" =
class=3D"">file://070-dont-clean-ipkg-install.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///080-distutils-dont_adjust_files.patch" =
class=3D"">file://080-distutils-dont_adjust_files.patch</a> \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///130-readline-setup.patch" =
class=3D"">file://130-readline-setup.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.=
patch" =
class=3D"">file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDec=
o.patch</a> \<br class=3D"">+ &nbsp;&nbsp;&nbsp;${DISTRO_SRC_URI} \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///support_SOURCE_DATE_EPOCH_in_py_compile.patch" =
class=3D"">file://support_SOURCE_DATE_EPOCH_in_py_compile.patch</a> \<br =
class=3D"">+"<br class=3D"">+<br class=3D"">+SRC_URI[md5sum] =3D =
"eb8c2a6b1447d50813c02714af4681f3"<br class=3D"">+SRC_URI[sha256sum] =3D =
"0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549"<br =
class=3D"">+<br class=3D"">+LIC_FILES_CHKSUM =3D "<a =
href=3D"file://LICENSE;md5=3Df257cc14f81685691652a3d3e1b5d754" =
class=3D"">file://LICENSE;md5=3Df257cc14f81685691652a3d3e1b5d754</a>"<br =
class=3D"">+<br class=3D"">+# exclude pre-releases for both python 2.x =
and 3.x<br class=3D"">+UPSTREAM_CHECK_REGEX =3D =
"[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).tar"<br class=3D"">+<br =
class=3D"">+S =3D "${WORKDIR}/Python-${PV}"<br class=3D"">+<br =
class=3D"">+CVE_PRODUCT =3D "python"<br class=3D"">+<br =
class=3D"">+inherit autotools pkgconfig python3-dir<br class=3D"">+<br =
class=3D"">+EXTRA_OECONF =3D "\<br class=3D"">+ &nbsp;--with-pymalloc =
\<br class=3D"">+ &nbsp;--without-cxx-main \<br class=3D"">+ =
&nbsp;--enable-shared \<br class=3D"">+ &nbsp;--<a =
href=3D"mailto:enable-ipv6=3D${@bb.utils.contains" =
class=3D"">enable-ipv6=3D${@bb.utils.contains</a>('DISTRO_FEATURES', =
'ipv6', 'yes', 'no', d)} \<br class=3D"">+ =
&nbsp;ac_cv_header_bluetooth_bluetooth_h=3Dno =
ac_cv_header_bluetooth_h=3Dno \<br class=3D"">+ &nbsp;${PYTHONLSBOPTS} =
\<br class=3D"">+"<br class=3D"">+<br class=3D"">+do_configure_prepend() =
{<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>libdirleaf=3D"$(echo ${libdir} | sed -e =
's:${prefix}/::')"<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>sed -i -e =
"s:SEDMELIBLEAF:${libdirleaf}:g" \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${S}/configure.ac<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+do_install_prepend() {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>MAKESETTINGS=3D"$(egrep '^(ABIFLAGS|MULTIARCH)=3D' ${B}/Makefile =
| sed -E -e 's/[[:space:]]//g' -e 's/=3D/=3D"/' -e 's/$/"/')"<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>eval ${MAKESETTINGS}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if test "${ABIFLAGS}" !=3D =
"${PYTHON_ABI}"; then<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;&nbsp;&nbsp;die =
"do_install: configure determined ABIFLAGS '${ABIFLAGS}' !=3D =
'${PYTHON_ABI}' from python3-dir.bbclass"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if test "x${BUILD_OS}" =3D "x${TARGET_OS}"; then<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># no cross-compile at all<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH=
}<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>else<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># at the very moment, it's the =
only available target<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_linux_${MULTIARCH}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fi<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+do_install_append () {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>sed -i -e =
's:${HOSTTOOLS_DIR}/install:install:g' \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSC=
ONFIGDATA_NAME}.py<br class=3D"">+}<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch =
b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch<br class=3D"">index 8ea3f03fe0..aac34533ef =
100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-o=
f-python-config-that-w.patch<br class=3D"">@@ -14,25 +14,22 @@ =
Signed-off-by: Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;<br class=3D""> &nbsp;1 file =
changed, 3 insertions(+), 6 deletions(-)<br class=3D""><br class=3D""> =
diff --git a/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-index 236f005..5c4337f =
100644<br class=3D"">+index 31b4bcabb3..7da6d6941e 100644<br class=3D""> =
--- a/<a href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br=
 class=3D""> +++ b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-@@ -1348,12 +1348,9 @@ =
python-config: $(srcdir)/Misc/<a href=3D"http://python-config.in" =
class=3D"">python-config.in</a> Misc/python-config.sh<br class=3D"">+@@ =
-1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/<a =
href=3D"http://python-config.in" class=3D"">python-config.in</a> =
Misc/python-config.sh<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>sed -e =
"s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," &lt; $(srcdir)/Misc/<a =
href=3D"http://python-config.in" class=3D"">python-config.in</a> =
&gt;python-config.py<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Replace makefile compat. =
variable references with shell script compat. ones; $(VAR) -&gt; =
${VAR}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@ # Replace makefile compat. =
variable references with shell script compat. ones; $(VAR) -&gt; =
${VAR}<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>LC_ALL=3DC sed -e =
's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' &lt; Misc/python-config.sh =
&gt;python-config<br class=3D"">--<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># On Darwin, always use the =
python version of the script, the shell<br class=3D"">--<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># version =
doesn't use the compiler customizations that are provided<br =
class=3D"">--<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># in python (_osx_support.py).<br class=3D"">--<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if test =
`uname -s` =3D Darwin; then \<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>@ # On =
Darwin, always use the python version of the script, the shell<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@ # version doesn't use the compiler customizations that are =
provided<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@ # in python =
(_osx_support.py).<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@if test `uname -s` =3D Darwin; =
then \<br class=3D""> -<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cp python-config.py =
python-config; \<br class=3D""> -<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>fi<br class=3D"">-+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># In =
OpenEmbedded, always use the python version of the script, the shell<br =
class=3D"">-+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># version is broken in multiple ways, and doesn't return correct =
directories<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@ # In OpenEmbedded, always use =
the python version of the script, the shell<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>@ # =
version is broken in multiple ways, and doesn't return correct =
directories<br class=3D""> +<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cp python-config.py =
python-config<br class=3D""><br class=3D""><br class=3D""> &nbsp;# =
Install the include files<br class=3D"">--- <br class=3D"">-2.11.0<br =
class=3D"">-<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata=
.py-to-initialize-dist.patch =
b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata=
.py-to-initialize-dist.patch<br class=3D"">deleted file mode 100644<br =
class=3D"">index d1c92e9eed..0000000000<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata=
.py-to-initialize-dist.patch<br class=3D"">+++ /dev/null<br class=3D"">@@ =
-1,66 +0,0 @@<br class=3D"">-=46rom =
bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001<br =
class=3D"">-From: Libin Dang &lt;<a =
href=3D"mailto:libin.dang@windriver.com" =
class=3D"">libin.dang@windriver.com</a>&gt;<br class=3D"">-Date: Tue, 11 =
Apr 2017 14:12:15 +0800<br class=3D"">-Subject: [PATCH] Issue #21272: =
Use _sysconfigdata.py to initialize<br class=3D"">- =
distutils.sysconfig<br class=3D"">-<br class=3D"">-Backport upstream =
commit<br class=3D"">-<a =
href=3D"https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85=
ffbb4b23d934159" =
class=3D"">https://github.com/python/cpython/commit/409482251b06fe75c4ee56=
e85ffbb4b23d934159</a><br class=3D"">-<br class=3D"">-Upstream-Status: =
Backport<br class=3D"">-<br class=3D"">-Signed-off-by: Li Zhou &lt;<a =
href=3D"mailto:li.zhou@windriver.com" =
class=3D"">li.zhou@windriver.com</a>&gt;<br class=3D"">----<br =
class=3D"">- Lib/distutils/sysconfig.py | 35 =
++++-------------------------------<br class=3D"">- 1 file changed, 4 =
insertions(+), 31 deletions(-)<br class=3D"">-<br class=3D"">-diff --git =
a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py<br =
class=3D"">-index 6d5cfd0..9925d24 100644<br class=3D"">---- =
a/Lib/distutils/sysconfig.py<br class=3D"">-+++ =
b/Lib/distutils/sysconfig.py<br class=3D"">-@@ -424,38 +424,11 @@ =
_config_vars =3D None<br class=3D"">- <br class=3D"">- def =
_init_posix():<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;"""Initialize the =
module as appropriate for POSIX systems."""<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;g =3D {}<br class=3D"">-- &nbsp;&nbsp;&nbsp;# load the =
installed Makefile:<br class=3D"">-- &nbsp;&nbsp;&nbsp;try:<br =
class=3D"">-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filename =3D =
get_makefile_filename()<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;parse_makefile(filename, g)<br =
class=3D"">-- &nbsp;&nbsp;&nbsp;except OSError as msg:<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;my_msg =3D "invalid Python =
installation: unable to open %s" % filename<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if hasattr(msg, =
"strerror"):<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;my_msg =
=3D my_msg + " (%s)" % msg.strerror<br class=3D"">--<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;raise =
DistutilsPlatformError(my_msg)<br class=3D"">--<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;# load the installed pyconfig.h:<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;try:<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filename =3D =
get_config_h_filename()<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with open(filename) as =
file:<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;parse_co=
nfig_h(file, g)<br class=3D"">-- &nbsp;&nbsp;&nbsp;except OSError as =
msg:<br class=3D"">-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;my_msg =3D=
 "invalid Python installation: unable to open %s" % filename<br =
class=3D"">-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if hasattr(msg, =
"strerror"):<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;my_msg =
=3D my_msg + " (%s)" % msg.strerror<br class=3D"">--<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;raise =
DistutilsPlatformError(my_msg)<br class=3D"">--<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;# On AIX, there are wrong paths to the linker scripts =
in the Makefile<br class=3D"">-- &nbsp;&nbsp;&nbsp;# -- these paths are =
relative to the Python source, but when installed<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;# the scripts are in another directory.<br class=3D"">--=
 &nbsp;&nbsp;&nbsp;if python_build:<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g['LDSHARED'] =3D =
g['BLDSHARED']<br class=3D"">--<br class=3D"">-+ &nbsp;&nbsp;&nbsp;# =
_sysconfigdata is generated at build time, see the sysconfig module<br =
class=3D"">-+ &nbsp;&nbsp;&nbsp;from _sysconfigdata import =
build_time_vars<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;global =
_config_vars<br class=3D"">-- &nbsp;&nbsp;&nbsp;_config_vars =3D g<br =
class=3D"">-+ &nbsp;&nbsp;&nbsp;_config_vars =3D {}<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;_config_vars.update(build_time_vars)<br class=3D"">- =
<br class=3D"">- <br class=3D"">- def _init_nt():<br class=3D"">--- <br =
class=3D"">-1.8.3.1<br class=3D"">-<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch =
b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch<br=
 class=3D"">index 7cd7e3b490..a87b86015b 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch<br=
 class=3D"">+++ =
b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch<br=
 class=3D"">@@ -1,4 +1,4 @@<br class=3D"">-=46rom =
ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 2001<br =
class=3D"">+=46rom 6ad4d2101b5d67bb2de166829879a5b1a0f1c18f Mon Sep 17 =
00:00:00 2001<br class=3D""> From: Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;<br class=3D""> Date: Fri, 31 =
Mar 2017 15:42:46 +0300<br class=3D""> Subject: [PATCH] cross-compile =
support<br class=3D"">@@ -8,7 +8,7 @@ python instead of in-tree tools<br =
class=3D""><br class=3D""> -Khem<br class=3D""><br class=3D"">-Rebased =
on 3.5.4<br class=3D"">+Rebased on 3.7.0<br class=3D""><br class=3D""> =
Upstream-Status: Inappropriate[Configuration Specific]<br class=3D""> =
Signed-off-by: Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;<br class=3D"">@@ -18,53 +18,53 =
@@ Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" =
class=3D"">derek@asterius.io</a>&gt;<br class=3D""> &nbsp;1 file =
changed, 8 insertions(+), 6 deletions(-)<br class=3D""><br class=3D""> =
diff --git a/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-index =
144c1f8629..f252ac2417 100644<br class=3D"">+index =
d60d48e5f9..31b4bcabb3 100644<br class=3D""> --- a/<a =
href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br =
class=3D""> +++ b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-@@ -223,6 +223,7 @@ =
LIBOBJS=3D<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@LIBOBJS@<br class=3D"">-<br class=3D"">+@@ -233,6 +233,7 @@ =
LIBOBJS=3D<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@LIBOBJS@<br class=3D"">+ <br class=3D""> &nbsp;PYTHON=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>python$(EXE)<br class=3D""> &nbsp;BUILDPYTHON=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>python$(BUILDEXE)<br class=3D""> +HOSTPYTHON=3D =
&nbsp;&nbsp;&nbsp;$(BUILDPYTHON)<br class=3D"">-<br class=3D"">+ <br =
class=3D""> &nbsp;PYTHON_FOR_REGEN=3D@PYTHON_FOR_REGEN@<br class=3D"">- =
PYTHON_FOR_BUILD=3D@PYTHON_FOR_BUILD@<br class=3D"">-@@ -277,6 +278,7 @@ =
LIBFFI_INCLUDEDIR=3D<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@LIBFFI_INCLUDEDIR@<br class=3D"">+=
 UPDATE_FILE=3D@PYTHON_FOR_REGEN@ =
$(srcdir)/Tools/scripts/update_file.py<br class=3D"">+@@ -285,6 +286,7 =
@@ LIBFFI_INCLUDEDIR=3D<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@LIBFFI_INCLUDEDIR@<br class=3D""> =
&nbsp;####################################################################=
######<br class=3D""> &nbsp;# Parser<br class=3D""> &nbsp;PGEN=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Parser/pgen$(EXE)<br class=3D""> +HOSTPGEN=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(PGEN)$(EXE)<br class=3D"">-<br class=3D"">- PSRCS=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>\<br =
class=3D"">- <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Parser/acceler.c \<br class=3D"">-@@ -478,7 +480,7 @@ =
build_all_generate_profile:<br class=3D"">-<br class=3D"">+ <br =
class=3D"">+ POBJS=3D<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>\<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Parser/acceler.o \<br class=3D"">+@@ -501,7 +503,7 @@ =
build_all_generate_profile:<br class=3D"">+ <br class=3D""> =
&nbsp;run_profile_task:<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>: # FIXME: can't run for a cross =
build<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@ # FIXME: can't run for a cross =
build<br class=3D""> -<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(LLVM_PROF_FILE) $(RUNSHARED) =
./$(BUILDPYTHON) $(PROFILE_TASK) || true<br class=3D""> +<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || =
true<br class=3D"">-<br class=3D"">+ <br class=3D""> =
&nbsp;build_all_merge_profile:<br class=3D""> &nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(LLVM_PROF_MERGER)<br class=3D"">-@@ -772,7 +774,7 @@ =
regen-grammar: $(PGEN)<br class=3D"">+@@ -796,7 +798,7 @@ regen-grammar: =
$(PGEN)<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Regenerate Include/graminit.h =
and Python/graminit.c<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># from Grammar/Grammar using =
pgen<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@$(MKDIR_P) Include<br class=3D""> =
-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(PGEN) $(srcdir)/Grammar/Grammar \<br class=3D""> +<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(HOSTPGEN) $(srcdir)/Grammar/Grammar \<br class=3D"">- <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(srcdir)/Include/graminit.h \<br class=3D"">- <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(srcdir)/Python/graminit.c<br class=3D"">-<br class=3D"">-@@ =
-978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: =
$(PYTHON_HEADERS)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(srcdir)/Include/graminit.h.new =
\<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>$(srcdir)/Python/graminit.c.new<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(UPDATE_FILE) $(srcdir)/Include/graminit.h =
$(srcdir)/Include/graminit.h.new<br class=3D"">+@@ -1034,7 +1036,7 @@ =
$(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)<br =
class=3D""> =
&nbsp;####################################################################=
##<br class=3D"">-<br class=3D"">+ <br class=3D""> &nbsp;TESTOPTS=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(EXTRATESTOPTS)<br class=3D""> -TESTPYTHON=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)<br class=3D""> =
+TESTPYTHON=3D<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)<br class=3D""> =
&nbsp;TESTRUNNER=3D<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(TESTPYTHON) =
$(srcdir)/Tools/scripts/run_tests.py<br class=3D"">- TESTTIMEOUT=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>3600<br =
class=3D"">-<br class=3D"">-@@ -1470,7 +1472,7 @@ =
frameworkinstallstructure:<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(LDLIBRARY)<br class=3D"">+ =
TESTTIMEOUT=3D<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>1200<br class=3D"">+ <br class=3D"">+@@ -1536,7 +1538,7 @@ =
frameworkinstallstructure:<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(LDLIBRARY)<br class=3D""> =
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fi; \<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>done<br class=3D""> &nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(LN) =
-fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers<br =
class=3D"">@@ -73,24 +73,24 @@ index 144c1f8629..f252ac2417 100644<br =
class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(LN) -fsn $(VERSION) =
$(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current<br class=3D""> =
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) =
$(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)<br class=3D""> =
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(LN) -fsn Versions/Current/Headers =
$(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers<br class=3D"">-@@ -1543,7 =
+1545,7 @@ Python/dtoa.o: Python/dtoa.c<br class=3D"">-<br class=3D"">+@@ =
-1609,7 +1611,7 @@ Python/dtoa.o: Python/dtoa.c<br class=3D"">+ <br =
class=3D""> &nbsp;# Run reindent on the library<br class=3D""> =
&nbsp;reindent:<br class=3D""> -<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>./$(BUILDPYTHON) =
$(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib<br class=3D""> =
+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r =
$(srcdir)/Lib<br class=3D"">-<br class=3D"">+ <br class=3D""> &nbsp;# =
Rerun configure with the same options as it was run last time,<br =
class=3D""> &nbsp;# provided the config.status script exists<br =
class=3D"">-@@ -1678,7 +1680,7 @@ funny:<br class=3D"">-<br class=3D"">+@@=
 -1744,7 +1746,7 @@ funny:<br class=3D"">+ <br class=3D""> &nbsp;# =
Perform some verification checks on any modified files.<br class=3D""> =
&nbsp;patchcheck: @DEF_MAKE_RULE@<br class=3D""> -<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(RUNSHARED) ./$(BUILDPYTHON) =
$(srcdir)/Tools/scripts/patchcheck.py<br class=3D""> +<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(RUNSHARED) $(HOSTPYTHON) =
$(srcdir)/Tools/scripts/patchcheck.py<br class=3D"">-<br class=3D"">+ =
<br class=3D""> &nbsp;# Dependencies<br class=3D"">-<br class=3D"">---<br =
class=3D"">-2.11.0<br class=3D"">+ <br class=3D"">+-- <br =
class=3D"">+2.17.1<br class=3D""><br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-p=
rofile-generation.patch =
b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-p=
rofile-generation.patch<br class=3D"">deleted file mode 100644<br =
class=3D"">index bb01c5bcb4..0000000000<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-p=
rofile-generation.patch<br class=3D"">+++ /dev/null<br class=3D"">@@ =
-1,40 +0,0 @@<br class=3D"">-=46rom =
98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001<br =
class=3D"">-From: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com"=
 class=3D"">anuj.mittal@intel.com</a>&gt;<br class=3D"">-Date: Tue, 7 =
Aug 2018 16:43:17 +0800<br class=3D"">-Subject: [PATCH 2/2] Makefile: =
add target to split profile generation<br class=3D"">-<br class=3D"">-We =
don't want to have profile task invoked from here and want to use<br =
class=3D"">-qemu-user instead. Split the profile-opt task so qemu can be =
invoked<br class=3D"">-once binaries have been built with =
instrumentation and then we can go<br class=3D"">-ahead and build again =
using the profile data generated.<br class=3D"">-<br =
class=3D"">-Upstream-Status: Inappropriate [OE-specific]<br =
class=3D"">-<br class=3D"">-Signed-off-by: Anuj Mittal &lt;<a =
href=3D"mailto:anuj.mittal@intel.com" =
class=3D"">anuj.mittal@intel.com</a>&gt;<br class=3D"">----<br =
class=3D"">- <a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> | 6 ++----<br class=3D"">- 1 file =
changed, 2 insertions(+), 4 deletions(-)<br class=3D"">-<br =
class=3D"">-diff --git a/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-index 84bc3ff..017a2c4 =
100644<br class=3D"">---- a/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-+++ b/<a =
href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br =
class=3D"">-@@ -469,13 +469,11 @@ profile-opt:<br class=3D"">- <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
profile-removal<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) =
build_all_generate_profile<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) profile-removal<br =
class=3D"">--<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@echo "Running code to generate profile data (this can take a =
while):"<br class=3D"">--<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) run_profile_task<br =
class=3D"">--<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(MAKE) build_all_merge_profile<br class=3D"">-+<br =
class=3D"">-+clean_and_use_profile:<br class=3D"">- <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>@echo =
"Rebuilding with profile guided optimizations:"<br class=3D"">- <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
clean<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) build_all_use_profile<br =
class=3D"">--<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(MAKE) profile-removal<br class=3D"">- <br class=3D"">- =
build_all_generate_profile:<br class=3D"">- <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>$(MAKE) @DEF_MAKE_RULE@ =
CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) =
@LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" =
LIBS=3D"$(LIBS)"<br class=3D"">--- <br class=3D"">-2.17.1<br =
class=3D"">-<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch =
b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch<br =
class=3D"">index fddfd2b2f6..b916d04d05 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch<br =
class=3D"">+++ =
b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch<br =
class=3D"">@@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded =
specific]<br class=3D""> # will not be found.<br class=3D""> # =
Signed-Off: Michael 'Mickey' Lauer &lt;<a =
href=3D"mailto:mickey@vanille.de" class=3D"">mickey@vanille.de</a>&gt;<br =
class=3D""><br class=3D"">-Index: Python-3.3.0rc2/setup.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.3.0rc2.orig/setup.py<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>2012-09-20 15:24:14.009124003 -0700<br class=3D"">-+++ =
Python-3.3.0rc2/setup.py<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>2012-09-20 15:25:08.449124963 =
-0700<br class=3D"">-@@ -1620,7 +1620,7 @@<br class=3D"">+diff --git =
a/setup.py b/setup.py<br class=3D"">+index 37c5dd58a6..7f0e4d1010 =
100644<br class=3D"">+--- a/setup.py<br class=3D"">++++ b/setup.py<br =
class=3D"">+@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;dotversion =3D dotversion[:-1] + '.' + =
dotversion[-1]<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;tcl_include_sub =3D []<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;tk_include_sub =3D []<br class=3D"">@@ -17,7 +17,7 @@ Index: =
Python-3.3.0rc2/setup.py<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;tcl_include_sub +=3D [dir + os.sep + "tcl" + =
dotversion]<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;tk_include_sub +=3D [dir + os.sep + "tk" + =
dotversion]<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;tk_include_sub +=3D tcl_include_sub<br class=3D"">-@@ -1639,22 =
+1639,6 @@<br class=3D"">+@@ -1822,22 +1822,6 @@ class =
PyBuildExt(build_ext):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;if dir not in include_dirs:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;include_dirs.append(dir)<br class=3D""><br =
class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch =
b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch<br =
class=3D"">index 6beac7b805..c12f11c6e7 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch<br =
class=3D"">+++ =
b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch<br =
class=3D"">@@ -22,12 +22,3 @@ Index: Python-3.3.2/setup.py<br =
class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Add paths =
specified in the environment variables LDFLAGS and<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# CPPFLAGS for =
header and library files.<br class=3D"">-@@ -480,7 +481,7 @@ class =
PyBuildExt(build_ext):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for directory in =
reversed(options.dirs):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_=
dir_to_list(dir_list, directory)<br class=3D"">- <br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
os.path.normpath(sys.base_prefix) !=3D '/usr' \<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not cross_compiling and =
os.path.normpath(sys.base_prefix) !=3D '/usr' \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;and not =
sysconfig.get_config_var('PYTHONFRAMEWORK'):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
(PYTHONFRAMEWORK is set) to avoid # linking problems when<br =
class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch =
b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch<br class=3D"">index b96419a638..1bd6e56117 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.pat=
ch<br class=3D"">@@ -14,11 +14,11 @@ Upstream-Status: Inappropriate =
[Embedded-Specific]<br class=3D""><br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;def copy_scripts(self):<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"""Copy each script listed in =
'self.scripts'; if it's marked as a<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r"""Copy each script listed in =
'self.scripts'; if it's marked as a<br class=3D""> - =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Python script in the Unix way =
(first line matches 'first_line_re',<br class=3D""> - =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ie. starts with "\#!" and =
contains "python"), then adjust the first<br class=3D""> - =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;line to refer to the current =
Python interpreter as we copy.<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"""Copy each script listed in =
'self.scripts'<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r"""Copy each script listed in =
'self.scripts'<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"""<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.mkpath(self.bui=
ld_dir)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;outfiles =3D []<br =
class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch =
b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch<br =
class=3D"">deleted file mode 100644<br class=3D"">index =
78d7c78670..0000000000<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch<br =
class=3D"">+++ /dev/null<br class=3D"">@@ -1,17 +0,0 @@<br class=3D"">-Fix=
 warning with newer compiler<br class=3D"">-<br class=3D"">--Khem<br =
class=3D"">-<br class=3D"">-Upstream-Status: Pending<br class=3D"">-<br =
class=3D"">---- a/Modules/_cursesmodule.c<br class=3D"">-+++ =
b/Modules/_cursesmodule.c<br class=3D"">-@@ -116,7 +116,7 @@ char =
*PyCursesVersion =3D "2.2";<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;#defines many common symbols (such as "lines") =
which breaks the<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;curses module =
in other ways. &nbsp;So the code will just specify<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;explicit prototypes here. */<br =
class=3D"">--extern int setupterm(char *,int,int *);<br =
class=3D"">-+//extern int setupterm(char *,int,int *);<br class=3D"">- =
#ifdef __sgi<br class=3D"">- #include &lt;term.h&gt;<br class=3D"">- =
#endif<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch =
b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch<br class=3D"">index ae74ef531d..35b849e399 =
100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-w=
hen-cross-compili.patch<br class=3D"">@@ -9,6 +9,11 @@ profile-optimized =
build.<br class=3D""><br class=3D""> Upstream-Status: Pending<br =
class=3D""><br class=3D"">+2018-08:<br class=3D"">+ &nbsp;* Rebased <a =
href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a> for =
3.7<br class=3D"">+ &nbsp;* Remove patch for setup.py in favor of =
upstream fix<br class=3D"">+ &nbsp;-- Jens<br class=3D"">+<br class=3D""> =
Signed-off-by: Markus Lehtonen &lt;<a =
href=3D"mailto:markus.lehtonen@linux.intel.com" =
class=3D"">markus.lehtonen@linux.intel.com</a>&gt;<br class=3D""> ---<br =
class=3D""> &nbsp;<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> | 4 ++--<br class=3D"">@@ -16,41 +21,31 =
@@ Signed-off-by: Markus Lehtonen &lt;<a =
href=3D"mailto:markus.lehtonen@linux.intel.com" =
class=3D"">markus.lehtonen@linux.intel.com</a>&gt;<br class=3D""> =
&nbsp;2 files changed, 4 insertions(+), 3 deletions(-)<br class=3D""><br =
class=3D""> diff --git a/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-index e2d5d3d..84bc3ff =
100644<br class=3D"">+index 4c23c0e411..0871c98f29 100644<br class=3D""> =
--- a/<a href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br=
 class=3D""> +++ b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-@@ -478,7 +478,7 @@ =
profile-opt:<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) profile-removal<br =
class=3D"">+@@ -497,6 +497,7 @@ profile-run-stamp:<br class=3D""><br =
class=3D""> &nbsp;build_all_generate_profile:<br class=3D"">--<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
@DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_GEN_FLAG) =
@LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" =
LIBS=3D"$(LIBS)"<br class=3D"">-+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) @DEF_MAKE_RULE@ =
CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) =
@LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" =
LIBS=3D"$(LIBS)"<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) @DEF_MAKE_RULE@ =
CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_GEN_FLAG)" LDFLAGS=3D"$(LDFLAGS) =
$(PGO_PROF_GEN_FLAG)" LIBS=3D"$(LIBS)"<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
@DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS) =
$(PGO_PROF_GEN_FLAG)" LDFLAGS=3D"$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" =
LIBS=3D"$(LIBS)"<br class=3D""><br class=3D""> =
&nbsp;run_profile_task:<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>: # FIXME: can't run for a cross =
build<br class=3D"">-@@ -488,7 +488,7 @@ build_all_merge_profile:<br =
class=3D"">- <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(LLVM_PROF_MERGER)<br class=3D"">- <br class=3D"">- =
build_all_use_profile:<br class=3D"">--<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) @DEF_MAKE_RULE@ =
CFLAGS_NODIST=3D"$(CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" =
LDFLAGS=3D"$(LDFLAGS) @LTOFLAGS@"<br class=3D"">-+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
@DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS) =
$(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS=3D"$(LDFLAGS) @LTOFLAGS@"<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@ # FIXME: can't run for a cross build<br class=3D"">+@@ -510,14 =
+511,14 @@ build_all_merge_profile:<br class=3D"">+ profile-opt: =
profile-run-stamp<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@echo "Rebuilding with profile =
guided optimizations:"<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-rm -f profile-clean-stamp<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) =
$(PGO_PROF_USE_FLAG)" LDFLAGS=3D"$(LDFLAGS)"<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
@DEF_MAKE_RULE@ CFLAGS_NODIST=3D"$(CFLAGS) $(EXTRA_CFLAGS) =
$(PGO_PROF_USE_FLAG)" LDFLAGS=3D"$(LDFLAGS)"<br class=3D""><br class=3D"">=
 &nbsp;# Compile and run with gcov<br class=3D""> &nbsp;.PHONY=3Dcoverage =
coverage-lcov coverage-report<br class=3D"">-diff --git a/setup.py =
b/setup.py<br class=3D"">-index add3346..65e83b1 100644<br class=3D"">----=
 a/setup.py<br class=3D"">-+++ b/setup.py<br class=3D"">-@@ -263,7 =
+263,8 @@ class PyBuildExt(build_ext):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# compilers<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if compiler =
is not None:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if=
 cross_compiling:<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;(ccshared,cflags) =3D (os.environ.get('CCSHARED') or '', =
os.environ.get('CFLAGS') or '')<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;(ccshared,cflags) =3D (os.environ.get('CCSHARED') or =
'',<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(os.en=
viron.get('CFLAGS') or '') + ' ' + =
sysconfig.get_config_var('PY_CFLAGS_NODIST'))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;el=
se:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;(ccshared,cflags) =3D =
sysconfig.get_config_vars('CCSHARED','CFLAGS')<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ar=
gs['compiler_so'] =3D compiler + ' ' + ccshared + ' ' + cflags<br =
class=3D"">--- <br class=3D"">-2.17.1<br class=3D"">-<br class=3D"">+ =
coverage:<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>@echo "Building with support for =
coverage checking:"<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>$(MAKE) clean profile-removal<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D"$(CFLAGS) -O0 -pg =
-fprofile-arcs -ftest-coverage" LIBS=3D"$(LIBS) -lgcov"<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D"$(CFLAGS) $(EXTRA_CFLAGS) -O0 =
-pg -fprofile-arcs -ftest-coverage" LIBS=3D"$(LIBS) -lgcov"<br =
class=3D"">+ <br class=3D"">+ coverage-lcov:<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>@echo =
"Creating Coverage HTML report with LCOV:"<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch =
b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch<b=
r class=3D"">index f29ae53371..7e1dc4ef5b 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch<b=
r class=3D"">+++ =
b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch<b=
r class=3D"">@@ -6,16 +6,16 @@ hardcoded locations for include paths<br =
class=3D""><br class=3D""> Signed-off-by: Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D""><br class=3D"">-Index:=
 Python-3.4.2/configure.ac<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.4.2.orig/configure.ac<br class=3D"">-+++ =
Python-3.4.2/configure.ac<br class=3D"">-@@ -4434,7 +4434,7 @@ fi<br =
class=3D"">- <br class=3D"">+diff --git a/configure.ac b/configure.ac<br =
class=3D"">+index 2b8aa4d592..1f5bf4b4b0 100644<br class=3D"">+--- =
a/configure.ac<br class=3D"">++++ b/configure.ac<br class=3D"">+@@ =
-4976,7 +4976,7 @@ fi<br class=3D""> &nbsp;# first curses header =
check<br class=3D""> &nbsp;ac_save_cppflags=3D"$CPPFLAGS"<br =
class=3D"">--CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"<br =
class=3D"">-+CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"<br =
class=3D"">+ if test "$cross_compiling" =3D no; then<br class=3D"">+- =
&nbsp;CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"<br class=3D"">++ =
&nbsp;CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"<br class=3D"">+ =
fi<br class=3D""><br class=3D""> &nbsp;AC_CHECK_HEADERS(curses.h =
ncurses.h)<br class=3D"">- <br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch =
b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch<b=
r class=3D"">index a3cc48c9a4..ebdd64b7b5 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch<b=
r class=3D"">+++ =
b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch<b=
r class=3D"">@@ -5,13 +5,17 @@ Avoid a warning by not adding this module =
to missing variable.<br class=3D""> Upstream-Status: Inappropriate =
[distribution]<br class=3D""><br class=3D""> Also simply disable the tk =
module since its not in DEPENDS.<br class=3D"">+<br class=3D"">+2018-08: =
Rebased for 3.7.0<br class=3D"">+ &nbsp;-- Jens<br class=3D"">+<br =
class=3D""> Signed-off-by: Andrei Gherzan &lt;<a =
href=3D"mailto:andrei@gherzan.ro" class=3D"">andrei@gherzan.ro</a>&gt;<br =
class=3D""><br class=3D"">-Index: Python-3.5.3/setup.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.3.orig/setup.py<br class=3D"">-+++ =
Python-3.5.3/setup.py<br class=3D"">-@@ -1558,10 +1558,12 @@ class =
PyBuildExt(build_ext):<br class=3D"">+diff --git a/setup.py =
b/setup.py<br class=3D"">+index 37c5dd58a6..0321245761 100644<br =
class=3D"">+--- a/setup.py<br class=3D"">++++ b/setup.py<br class=3D"">+@@=
 -1608,10 +1608,12 @@ class PyBuildExt(build_ext):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.extensions.exte=
nd(exts)<br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Call the method =
for detecting whether _tkinter can be compiled<br class=3D"">@@ -25,5 =
+29,5 @@ Index: Python-3.5.3/setup.py<br class=3D""> + =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#if '_tkinter' not in [e.name =
for e in self.extensions]:<br class=3D""> + =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;missing.append('_tkinter')<br class=3D""><br =
class=3D"">- ## &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
Uncomment these lines if you want to play with xxmodule.c<br class=3D"">- =
## &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ext =3D =
Extension('xx', ['xxmodule.c'])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Build the _uuid module =
if possible<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid_incs =3D =
find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])<br class=3D"">diff =
--git =
a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch =
b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch<br =
class=3D"">index 97214f9aa4..689baf00ad 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch<br =
class=3D"">+++ =
b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch<br =
class=3D"">@@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that =
it would work when lib64.<br class=3D""><br class=3D""> Upstream-Status: =
Pending<br class=3D""><br class=3D"">+2018-08: rebased and adopted for =
3.7<br class=3D"">+ &nbsp;-- Jens<br class=3D"">+<br class=3D""> =
Signed-off-by: Robert Yang &lt;<a =
href=3D"mailto:liezhi.yang@windriver.com" =
class=3D"">liezhi.yang@windriver.com</a>&gt;<br class=3D""> ---<br =
class=3D""> &nbsp;configure.ac | &nbsp;&nbsp;&nbsp;2 +-<br class=3D""> =
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br class=3D""><br =
class=3D""> diff --git a/configure.ac b/configure.ac<br class=3D"">-index =
63aef8e..aefb27f 100644<br class=3D"">+index 2b8aa4d592..0da15fbbdf =
100644<br class=3D""> --- a/configure.ac<br class=3D""> +++ =
b/configure.ac<br class=3D"">-@@ -4366,7 +4366,7 @@ =
AC_MSG_RESULT($LDVERSION)<br class=3D"">- <br class=3D"">+@@ -4674,9 =
+4674,9 @@ AC_MSG_RESULT($LDVERSION)<br class=3D""> &nbsp;dnl define =
LIBPL after ABIFLAGS and LDVERSION is defined.<br class=3D""> =
&nbsp;AC_SUBST(PY_ENABLE_SHARED)<br =
class=3D"">--LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}=
"<br =
class=3D"">-+LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"<br=
 class=3D"">+ if test x$PLATFORM_TRIPLET =3D x; then<br class=3D"">+- =
&nbsp;LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"<br =
class=3D"">++ =
&nbsp;LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"<br =
class=3D"">+ else<br class=3D"">+- =
&nbsp;LIBPL=3D'$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLAT=
FORM_TRIPLET}"<br class=3D"">++ =
&nbsp;LIBPL=3D'$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM=
_TRIPLET}"<br class=3D"">+ fi<br class=3D""> &nbsp;AC_SUBST(LIBPL)<br =
class=3D""><br class=3D"">- # Check whether right shifting a negative =
integer extends the sign bit<br class=3D"">--- <br class=3D"">-1.7.9.5<br =
class=3D"">-<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch =
b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch<br class=3D"">index 5c3af6b626..1ce4defe95 100644<br =
class=3D"">--- =
a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension=
-for-mul.patch<br class=3D"">@@ -47,16 +47,19 @@ And the semaphore issue =
also caused multiprocessing.Queue().put() hung.<br class=3D""><br =
class=3D""> Upstream-Status: Submitted [<a =
href=3D"https://github.com/python/cpython/pull/2999" =
class=3D"">https://github.com/python/cpython/pull/2999</a>]<br =
class=3D""><br class=3D"">+2018-08: rebased for 3.7<br class=3D"">+ =
&nbsp;-- Jens<br class=3D"">+<br class=3D""> Signed-off-by: Hongxu Jia =
&lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
class=3D"">hongxu.jia@windriver.com</a>&gt;<br class=3D""> ---<br =
class=3D""> &nbsp;setup.py | 7 +++++--<br class=3D""> &nbsp;1 file =
changed, 5 insertions(+), 2 deletions(-)<br class=3D""><br class=3D""> =
diff --git a/setup.py b/setup.py<br class=3D"">-index 4f0f522..d05707d =
100644<br class=3D"">+index a97a7559ca..633eba8f1e 100644<br class=3D""> =
--- a/setup.py<br class=3D""> +++ b/setup.py<br class=3D"">-@@ -1606,8 =
+1606,10 @@ class PyBuildExt(build_ext):<br class=3D"">+@@ -1580,8 =
+1580,10 @@ class PyBuildExt(build_ext):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;elif =
host_platform.startswith('netbsd'):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;macros =3D dict()<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;libraries =3D []<br class=3D"">@@ -69,14 +72,11 @@ index =
4f0f522..d05707d 100644<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;macros =3D dict()<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;libraries =3D ['rt']<br class=3D""><br class=3D"">-@@ -1626,6 =
+1628,7 @@ class PyBuildExt(build_ext):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
sysconfig.get_config_var('WITH_THREAD'):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ex=
ts.append ( Extension('_multiprocessing', multiprocessing_srcs,<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;define=
_macros=3Dlist(macros.items()),<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libraries=3D=
libraries,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;includ=
e_dirs=3D["Modules/_multiprocessing"]))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mi=
ssing.append('_multiprocessing')<br class=3D"">--- <br =
class=3D"">-2.7.4<br class=3D"">-<br class=3D"">+@@ -1599,6 +1601,7 @@ =
class PyBuildExt(build_ext):<br class=3D"">+ <br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exts.append ( =
Extension('_multiprocessing', multiprocessing_srcs,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;define_macros=3Dlist(macros.it=
ems()),<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libraries=3Dlibraries,<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;include_dirs=3D["Modules/_mult=
iprocessing"]))<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# End multiprocessing<br =
class=3D"">+ <br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch =
b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch<br =
class=3D"">index cc35dc1617..d5bafbfba1 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch<br =
class=3D"">+++ =
b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch<br =
class=3D"">@@ -4,7 +4,7 @@ Date: Tue, 14 May 2013 15:00:26 -0700<br =
class=3D""> Subject: [PATCH 01/13] get the sys.lib from python itself =
and do not use<br class=3D""> &nbsp;hardcoded value of 'lib'<br =
class=3D""><br class=3D"">-02/2015 Rebased for 3.4.2<br =
class=3D"">+08/2018 Rebased for 3.7.0<br class=3D""><br class=3D""> =
Upstream-Status: Pending<br class=3D""> Signed-off-by: Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">@@ -25,12 +25,12 @@ =
Signed-off-by: Alejandro Hernandez &lt;<a =
href=3D"mailto:alejandro.hernandez@linux.intel.com" =
class=3D"">alejandro.hernandez@linux.intel.com</a>&gt;<br class=3D""> =
&nbsp;setup.py =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;9 ++++-----<br class=3D""> &nbsp;12 files changed, 97 =
insertions(+), 23 deletions(-)<br class=3D""><br class=3D"">-Index: =
Python-3.5.4/Include/pythonrun.h<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Include/pythonrun.h<br class=3D"">-+++ =
Python-3.5.4/Include/pythonrun.h<br class=3D"">-@@ -23,6 +23,9 @@ =
typedef struct {<br class=3D"">- } PyCompilerFlags;<br class=3D"">+diff =
--git a/Include/pythonrun.h b/Include/pythonrun.h<br class=3D"">+index =
6f0c6fc655..95a597b412 100644<br class=3D"">+--- =
a/Include/pythonrun.h<br class=3D"">++++ b/Include/pythonrun.h<br =
class=3D"">+@@ -7,6 +7,9 @@<br class=3D"">+ extern "C" {<br class=3D""> =
&nbsp;#endif<br class=3D""><br class=3D""> +PyAPI_FUNC(const char *) =
Py_GetArch(void);<br class=3D"">@@ -39,10 +39,10 @@ Index: =
Python-3.5.4/Include/pythonrun.h<br class=3D""> &nbsp;#ifndef =
Py_LIMITED_API<br class=3D""> &nbsp;PyAPI_FUNC(int) =
PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);<br class=3D""> =
&nbsp;PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, =
PyCompilerFlags *);<br class=3D"">-Index: =
Python-3.5.4/Lib/distutils/command/install.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Lib/distutils/command/install.py<br =
class=3D"">-+++ Python-3.5.4/Lib/distutils/command/install.py<br =
class=3D"">+diff --git a/Lib/distutils/command/install.py =
b/Lib/distutils/command/install.py<br class=3D"">+index =
0258d3deae..352fd8f792 100644<br class=3D"">+--- =
a/Lib/distutils/command/install.py<br class=3D"">++++ =
b/Lib/distutils/command/install.py<br class=3D""> @@ -19,6 +19,8 @@ from =
site import USER_BASE<br class=3D""> &nbsp;from site import USER_SITE<br =
class=3D""> &nbsp;HAS_USER_SITE =3D True<br class=3D"">@@ -63,11 +63,11 =
@@ Index: Python-3.5.4/Lib/distutils/command/install.py<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'headers': =
'$base/include/python$py_version_short$abiflags/$dist_name',<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'scripts': =
'$base/bin',<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'data' =
&nbsp;&nbsp;: '$base',<br class=3D"">-Index: =
Python-3.5.4/Lib/pydoc.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Lib/pydoc.py<br class=3D"">-+++ =
Python-3.5.4/Lib/pydoc.py<br class=3D"">-@@ -389,7 +389,7 @@ class =
Doc:<br class=3D"">+diff --git a/Lib/pydoc.py b/Lib/pydoc.py<br =
class=3D"">+index 8a6b27b16e..fc55893b18 100644<br class=3D"">+--- =
a/Lib/pydoc.py<br class=3D"">++++ b/Lib/pydoc.py<br class=3D"">+@@ =
-399,7 +399,7 @@ class Doc:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docmodule =3D docclass =3D docroutine =3D =
docother =3D docproperty =3D docdata =3D fail<br class=3D""><br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;def getdocloc(self, object,<br =
class=3D"">@@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;"python%d.%d" % &nbsp;sys.version_info[:2])):<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"""Return the =
location of module docs or None"""<br class=3D""><br class=3D"">-Index: =
Python-3.5.4/Lib/site.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Lib/site.py<br class=3D"">-+++ =
Python-3.5.4/Lib/site.py<br class=3D"">-@@ -303,12 +303,12 @@ def =
getsitepackages(prefixes=3DNone):<br class=3D"">+diff --git =
a/Lib/site.py b/Lib/site.py<br class=3D"">+index ffd132b389..3ca8270d49 =
100644<br class=3D"">+--- a/Lib/site.py<br class=3D"">++++ =
b/Lib/site.py<br class=3D"">+@@ -334,12 +334,12 @@ def =
getsitepackages(prefixes=3DNone):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seen.add(prefix)<br =
class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if os.sep =3D=3D =
'/':<br class=3D""> - =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sitepack=
ages.append(os.path.join(prefix, "lib",<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;"python%d.%d" % sys.version_info[:2],<br class=3D""> + =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sitepack=
ages.append(os.path.join(prefix, sys.lib,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;"python" + sys.version[:3],<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;"python%d.%d" % sys.version_info[:2],<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;"site-packages"))<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:<br class=3D"">=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;sitepackages.append(prefix)<br class=3D""> - =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sitepack=
ages.append(os.path.join(prefix, "lib", "site-packages"))<br class=3D""> =
+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sitepack=
ages.append(os.path.join(prefix, sys.lib, "site-packages"))<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
sys.platform =3D=3D "darwin":<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
for framework builds *only* we add the standard Apple<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
locations.<br class=3D"">-Index: Python-3.5.4/Lib/sysconfig.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Lib/sysconfig.py<br class=3D"">-+++ =
Python-3.5.4/Lib/sysconfig.py<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;return sitepackages<br class=3D"">+ <br =
class=3D"">+ def addsitepackages(known_paths, prefixes=3DNone):<br =
class=3D"">+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br =
class=3D"">+index e0f9c18531..9869363977 100644<br class=3D"">+--- =
a/Lib/sysconfig.py<br class=3D"">++++ b/Lib/sysconfig.py<br class=3D""> =
@@ -20,10 +20,10 @@ __all__ =3D [<br class=3D""><br class=3D""> =
&nbsp;_INSTALL_SCHEMES =3D {<br class=3D"">@@ -129,7 +130,7 @@ Index: =
Python-3.5.4/Lib/sysconfig.py<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'include': =
'{installed_base}/include/python',<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'platinclude': =
'{installed_base}/include/python',<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'scripts': =
'{base}/bin',<br class=3D"">-@@ -61,10 +61,10 @@ _INSTALL_SCHEMES =3D =
{<br class=3D"">+@@ -62,10 +62,10 @@ _INSTALL_SCHEMES =3D {<br class=3D"">=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'data': =
'{userbase}',<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'posix_user': {<br class=3D"">@@ -144,28 =
+145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'include': =
'{userbase}/include/python{py_version_short}',<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'scripts': =
'{userbase}/bin',<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'data': =
'{userbase}',<br class=3D"">-Index: Python-3.5.4/Lib/trace.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Lib/trace.py<br class=3D"">-+++ =
Python-3.5.4/Lib/trace.py<br class=3D"">-@@ -749,10 +749,10 @@ def =
main(argv=3DNone):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;# should I also call expanduser? (after all, could =
use $HOME)<br class=3D"">+diff --git a/Lib/trace.py b/Lib/trace.py<br =
class=3D"">+index 86b2101763..f3c32ec317 100755<br class=3D"">+--- =
a/Lib/trace.py<br class=3D"">++++ b/Lib/trace.py<br class=3D"">+@@ =
-659,7 +659,7 @@ def main():<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;opts =3D parser.parse_args()<br class=3D"">+ <br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;if opts.ignore_dir:<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rel_path =3D 'lib', =
'python{0.major}.{0.minor}'.format(sys.version_info)<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rel_path =3D sys.lib, =
'python{0.major}.{0.minor}'.format(sys.version_info)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_prefix =3D =
os.path.join(sys.base_prefix, *rel_path)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_exec_prefix =3D =
os.path.join(sys.base_exec_prefix, *rel_path)<br class=3D""><br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;s =3D s.replace("$prefix",<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;os.path.join(sys.base_prefix, "lib",<br =
class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;os.path.join(sys.base_prefix, sys.lib,<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"python" + sys.version[:3]))<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;s =3D s.replace("$exec_prefix",<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;os.path.join(sys.base_exec_prefix, "lib",<br =
class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;os.path.join(sys.base_exec_prefix, sys.lib,<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"python" + sys.version[:3]))<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;s =3D os.path.normpath(s)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;ignore_dirs.append(s)<br class=3D"">-Index: =
Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-+++ Python-3.5.4/<a =
href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br =
class=3D"">-@@ -109,6 +109,8 @@ CFLAGS_ALIASING=3D@CFLAGS_ALIASING@<br =
class=3D"">+diff --git a/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">+index =
31b4bcabb3..713215e57d 100644<br class=3D"">+--- a/<a =
href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br =
class=3D"">++++ b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">+@@ -114,6 +114,8 @@ =
CFLAGS_ALIASING=3D@CFLAGS_ALIASING@<br class=3D""><br class=3D""> =
&nbsp;# Machine-dependent subdirectories<br class=3D""> =
&nbsp;MACHDEP=3D<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@MACHDEP@<br class=3D"">@@ -174,7 +171,7 @@ Index: =
Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D""><br class=3D""> &nbsp;# =
Multiarch directory (may be empty)<br class=3D""> &nbsp;MULTIARCH=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@MULTIARCH@<br class=3D"">-@@ -128,7 +130,7 @@ LIBDIR=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@libdir@<br class=3D"">+@@ -134,7 +136,7 @@ LIBDIR=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@libdir@<br class=3D""> &nbsp;MANDIR=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@mandir@<br class=3D""> &nbsp;INCLUDEDIR=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@includedir@<br class=3D""> &nbsp;CONFINCLUDEDIR=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(exec_prefix)/include<br class=3D"">@@ -183,7 +180,7 @@ Index: =
Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D""> &nbsp;ABIFLAGS=3D<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>@ABIFLAGS@<br class=3D""><br class=3D""> &nbsp;# Detailed =
destination directories<br class=3D"">-@@ -731,6 +733,7 @@ =
Modules/getpath.o: $(srcdir)/Modules/get<br class=3D"">+@@ -754,6 +756,7 =
@@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile<br class=3D""> =
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DEXEC_PREFIX=3D'"$(exec_prefix)"' \<br class=3D""> &nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DVERSION=3D'"$(VERSION)"' \<br class=3D""> &nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-DVPATH=3D'"$(VPATH)"' \<br class=3D"">@@ -191,8 +188,8 @@ Index: =
Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D""> &nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-o $@ =
$(srcdir)/Modules/getpath.c<br class=3D""><br class=3D""> =
&nbsp;Programs/python.o: $(srcdir)/Programs/python.c<br class=3D"">-@@ =
-813,7 +816,7 @@ regen-opcode:<br class=3D"">- Python/compile.o =
Python/symtable.o Python/ast.o: $(srcdir)/Include/graminit.h =
$(srcdir)/Include/Python-ast.h<br class=3D"">+@@ -842,7 +845,7 @@ =
regen-opcode:<br class=3D"">+ Python/compile.o Python/symtable.o =
Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h =
$(srcdir)/Include/Python-ast.h<br class=3D""><br class=3D""> =
&nbsp;Python/getplatform.o: $(srcdir)/Python/getplatform.c<br class=3D""> =
-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' -o $@ =
$(srcdir)/Python/getplatform.c<br class=3D"">@@ -200,11 +197,11 @@ =
Index: Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D""><br class=3D""> =
&nbsp;Python/importdl.o: $(srcdir)/Python/importdl.c<br class=3D""> =
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ =
$(srcdir)/Python/importdl.c<br class=3D"">-Index: =
Python-3.5.4/Modules/getpath.c<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Modules/getpath.c<br class=3D"">-+++ =
Python-3.5.4/Modules/getpath.c<br class=3D"">-@@ -105,6 +105,13 @@<br =
class=3D"">+diff --git a/Modules/getpath.c b/Modules/getpath.c<br =
class=3D"">+index 041cb14b4b..d52d1e1cdb 100644<br class=3D"">+--- =
a/Modules/getpath.c<br class=3D"">++++ b/Modules/getpath.c<br =
class=3D"">+@@ -106,6 +106,13 @@ extern "C" {<br class=3D""> =
&nbsp;#error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant =
defined"<br class=3D""> &nbsp;#endif<br class=3D""><br class=3D"">@@ =
-218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c<br class=3D""> =
&nbsp;#ifndef LANDMARK<br class=3D""> &nbsp;#define LANDMARK L"os.py"<br =
class=3D""> &nbsp;#endif<br class=3D"">-@@ -113,6 +120,7 @@ static =
wchar_t prefix[MAXPATHLEN+1];<br class=3D"">- static wchar_t =
exec_prefix[MAXPATHLEN+1];<br class=3D"">- static wchar_t =
progpath[MAXPATHLEN+1];<br class=3D"">- static wchar_t =
*module_search_path =3D NULL;<br class=3D"">-+static wchar_t *lib_python =
=3D L"" LIB_PYTHON;<br class=3D"">- <br class=3D"">- /* Get file status. =
Encode the path to the locale encoding. */<br class=3D"">- <br =
class=3D"">-@@ -494,7 +502,7 @@ calculate_path(void)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;_pythonpath =3D Py_DecodeLocale(PYTHONPATH, =
NULL);<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;_prefix =3D =
Py_DecodeLocale(PREFIX, NULL);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;_exec_prefix =3D Py_DecodeLocale(EXEC_PREFIX, =
NULL);<br class=3D"">-- &nbsp;&nbsp;&nbsp;lib_python =3D =
Py_DecodeLocale("lib/python" VERSION, NULL);<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;lib_python =3D Py_DecodeLocale(LIB_PYTHON, NULL);<br =
class=3D"">- <br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;if (!_pythonpath =
|| !_prefix || !_exec_prefix || !lib_python) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Py_FatalError(<br =
class=3D"">-Index: Python-3.5.4/Python/getplatform.c<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Python/getplatform.c<br class=3D"">-+++ =
Python-3.5.4/Python/getplatform.c<br class=3D"">+@@ -867,7 +874,7 @@ =
calculate_init(PyCalculatePath *calculate,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;if (!calculate-&gt;prefix) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
DECODE_LOCALE_ERR("EXEC_PREFIX define", len);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;calculate-&gt;lib_python =3D =
Py_DecodeLocale("lib/python" VERSION, &amp;len);<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;calculate-&gt;lib_python =3D =
Py_DecodeLocale(LIB_PYTHON, &amp;len);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;if (!calculate-&gt;lib_python) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
DECODE_LOCALE_ERR("EXEC_PREFIX define", len);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">+diff --git =
a/Python/getplatform.c b/Python/getplatform.c<br class=3D"">+index =
81a0f7ac53..bc7127ae3e 100644<br class=3D"">+--- =
a/Python/getplatform.c<br class=3D"">++++ b/Python/getplatform.c<br =
class=3D""> @@ -10,3 +10,23 @@ Py_GetPlatform(void)<br class=3D""> =
&nbsp;{<br class=3D"">- <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return PLATFORM;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;return PLATFORM;<br class=3D""> &nbsp;}<br =
class=3D""> +<br class=3D""> +#ifndef ARCH<br class=3D"">@@ -263,11 =
+252,11 @@ Index: Python-3.5.4/Python/getplatform.c<br class=3D""> +{<br =
class=3D""> +<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return LIB;<br class=3D""> +}<br class=3D"">-Index: =
Python-3.5.4/Python/sysmodule.c<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/Python/sysmodule.c<br class=3D"">-+++ =
Python-3.5.4/Python/sysmodule.c<br class=3D"">-@@ -1827,6 +1827,10 @@ =
_PySys_Init(void)<br class=3D"">+diff --git a/Python/sysmodule.c =
b/Python/sysmodule.c<br class=3D"">+index 177b830762..38112b831e =
100644<br class=3D"">+--- a/Python/sysmodule.c<br class=3D"">++++ =
b/Python/sysmodule.c<br class=3D"">+@@ -2324,6 +2324,10 @@ =
_PySys_BeginInit(PyObject **sysmod)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;PyUnicode_FromString(Py_GetCopyright()));<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SET_SYS_FROM_STRING("platform",<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;PyUnicode_FromString(Py_GetPlatform()));<br class=3D"">@@ -275,16 =
+264,16 @@ Index: Python-3.5.4/Python/sysmodule.c<br class=3D""> + =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PyUnicode_=
FromString(Py_GetArch()));<br class=3D""> + =
&nbsp;&nbsp;&nbsp;SET_SYS_FROM_STRING("lib",<br class=3D""> + =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PyUnicode_=
FromString(Py_GetLib()));<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;SET_SYS_FROM_STRING("executable",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PyUn=
icode_FromWideChar(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Py_GetProgramFullPath(), -1));<br =
class=3D"">-Index: Python-3.5.4/configure.ac<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/configure.ac<br class=3D"">-+++ =
Python-3.5.4/configure.ac<br class=3D"">-@@ -885,6 +885,41 @@ =
PLATDIR=3Dplat-$MACHDEP<br class=3D"">- AC_SUBST(PLATDIR)<br class=3D"">- =
AC_SUBST(PLATFORM_TRIPLET)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;SET_SYS_FROM_STRING("maxsize",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PyLo=
ng_FromSsize_t(PY_SSIZE_T_MAX));<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;SET_SYS_FROM_STRING("float_info",<br =
class=3D"">+diff --git a/configure.ac b/configure.ac<br class=3D"">+index =
5b66624d78..1c88696532 100644<br class=3D"">+--- a/configure.ac<br =
class=3D"">++++ b/configure.ac<br class=3D"">+@@ -867,6 +867,41 @@ =
AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],<br class=3D"">+ =
LDFLAGS=3D"$save_LDFLAGS"<br class=3D"">+ AC_SUBST(NO_AS_NEEDED)<br =
class=3D""><br class=3D""> +AC_SUBST(ARCH)<br class=3D""> =
+AC_MSG_CHECKING(ARCH)<br class=3D"">@@ -322,13 +311,13 @@ Index: =
Python-3.5.4/configure.ac<br class=3D""> +esac<br class=3D""> =
+AC_MSG_RESULT($LIB)<br class=3D""><br class=3D"">- AC_MSG_CHECKING([for =
-Wl,--no-as-needed])<br class=3D"">- save_LDFLAGS=3D"$LDFLAGS"<br =
class=3D"">-Index: Python-3.5.4/setup.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/setup.py<br class=3D"">-+++ =
Python-3.5.4/setup.py<br class=3D"">-@@ -494,7 +494,7 @@ class =
PyBuildExt(build_ext):<br class=3D"">+ # checks for UNIX variants that =
set C preprocessor variables<br class=3D"">+ AC_USE_SYSTEM_EXTENSIONS<br =
class=3D"">+diff --git a/setup.py b/setup.py<br class=3D"">+index =
37c5dd58a6..b82b7177bc 100644<br class=3D"">+--- a/setup.py<br =
class=3D"">++++ b/setup.py<br class=3D"">+@@ -541,7 +541,7 @@ class =
PyBuildExt(build_ext):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# directories =
(i.e. '.' and 'Include') must be first. &nbsp;See issue<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# 10520.<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not =
cross_compiling:<br class=3D"">@@ -337,17 +326,16 @@ Index: =
Python-3.5.4/setup.py<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# only =
change this for cross builds for 3.3, issues on Mageia<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
cross_compiling:<br class=3D"">-@@ -552,8 +552,7 @@ class =
PyBuildExt(build_ext):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# be assumed that no =
additional -I,-L directives are needed.<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not =
cross_compiling:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;li=
b_dirs =3D self.compiler.library_dirs + [<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;'/lib64', '/usr/lib64',<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;'/lib', '/usr/lib',<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;'/' + sys.lib, '/usr/' + sys.lib,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;]<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;in=
c_dirs =3D self.compiler.include_dirs + ['/usr/include']<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:<br class=3D"">-@@ =
-745,11 +744,11 @@ class PyBuildExt(build_ext):<br class=3D"">+@@ -579,7 =
+579,7 @@ class PyBuildExt(build_ext):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ad=
d_dir_to_list(self.compiler.include_dirs,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;sysconfig.get_config_var("INCLUDEDIR"))<br =
class=3D"">+ <br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;system_lib_dirs =3D ['/lib64', =
'/usr/lib64', '/lib', '/usr/lib']<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;system_lib_dirs =3D ['/' + =
sys.lib, '/usr/' + sys.lib]<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;system_include_dirs =3D =
['/usr/include']<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# lib_dirs and inc_dirs =
are used to search for files;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# if a file is found in =
one of those directories, it can<br class=3D"">+@@ -836,11 +836,11 @@ =
class PyBuildExt(build_ext):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;elif curses_library:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;readline_libs.append(curses_library)<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;elif self.compiler.find_library_file(lib_dirs +<br class=3D"">@@ =
-361,3 +349,26 @@ Index: Python-3.5.4/setup.py<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;extra_=
link_args=3Dreadline_extra_link_args,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;librar=
ies=3Dreadline_libs) )<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:<br =
class=3D"">+@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):<br =
class=3D"">+ <br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;# check lib directories parallel to the location =
of the header<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;db_dirs_to_check =3D [<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db_incdir.replace("include", =
'lib64'),<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db_incdir.replace("include", =
'lib'),<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;db_incdir.replace("include", =
sys.lib),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;]<br class=3D"">+ <br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;if host_platform !=3D 'darwin':<br class=3D"">+@@ =
-1166,10 +1165,8 @@ class PyBuildExt(build_ext):<br class=3D"">+ <br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
sqlite_incdir:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq=
lite_dirs_to_check =3D [<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.path.join(sqlite_incdir, '..', 'lib64'),<br =
class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.path.join(sqlite_incdir, '..', 'lib'),<br class=3D"">+-=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.path.join(sqlite_incdir, '..', '..', 'lib64'),<br =
class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.path.join(sqlite_incdir, '..', '..', 'lib'),<br =
class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.path.join(sqlite_incdir, '..', sys.lib),<br =
class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;os.path.join(sqlite_incdir, '..', '..', sys.lib),<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]<=
br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq=
lite_libfile =3D self.compiler.find_library_file(<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sqlite_dirs_to_check + =
lib_dirs, 'sqlite3')<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/python3-manifest.json =
b/meta/recipes-devtools/python/python3/python3-manifest.json<br =
class=3D"">index 90a41fbf29..51e605f0d6 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/python3-manifest.json<br =
class=3D"">+++ =
b/meta/recipes-devtools/python/python3/python3-manifest.json<br =
class=3D"">@@ -206,7 +206,7 @@<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"$=
{libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"$=
{libdir}/python${PYTHON_MAJMIN}/_markupbase.py",<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"$=
{libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"${libdi=
r}/python${PYTHON_MAJMIN}/_sysconfigdata.py",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"${libdi=
r}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"$=
{libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"$=
{libdir}/python${PYTHON_MAJMIN}/abc.py",<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"$=
{libdir}/python${PYTHON_MAJMIN}/argparse.py",<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch =
b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch<br class=3D"">index a4f8bd4710..c6aa581b4c 100644<br =
class=3D"">--- =
a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYT=
HON_FOR_BUILD.patch<br class=3D"">@@ -5,21 +5,24 @@ Subject: [PATCH] =
python3 use CROSSPYTHONPATH for PYTHON_FOR_BUILD<br class=3D""><br =
class=3D""> Upstream-Status: Inappropriate [Cross compile specific]<br =
class=3D""><br class=3D"">+2018-08: Rebased and adopted for 3.7<br =
class=3D"">+ &nbsp;-- Jens<br class=3D"">+<br class=3D""> Signed-off-by: =
Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com" =
class=3D"">jackie.huang@windriver.com</a>&gt;<br class=3D""> ---<br =
class=3D""> &nbsp;configure.ac | 2 +-<br class=3D""> &nbsp;1 file =
changed, 1 insertion(+), 1 deletion(-)<br class=3D""><br =
class=3D"">-Index: Python-3.5.4/configure.ac<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.5.4.orig/configure.ac<br class=3D"">-+++ =
Python-3.5.4/configure.ac<br class=3D"">-@@ -73,7 +73,7 @@ if test =
"$cross_compiling" =3D yes; then<br class=3D"">+diff --git =
a/configure.ac b/configure.ac<br class=3D"">+index =
2b8aa4d592..a361436f4f 100644<br class=3D"">+--- a/configure.ac<br =
class=3D"">++++ b/configure.ac<br class=3D"">+@@ -75,7 +75,7 @@ if test =
"$cross_compiling" =3D yes; then<br class=3D""> &nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not =
found])<br class=3D""> &nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>fi<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AC_MSG_RESULT($inter=
p)<br class=3D"">--<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell =
test -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`cat =
pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp<br =
class=3D"">-+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) =
PYTHONPATH=3D$(CROSSPYTHONPATH) '$interp<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell =
test -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`cat =
pybuilddir.txt`:)$(srcdir)/Lib =
_PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTI=
ARCH) '$interp<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) =
_PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) =
PYTHONPATH=3D$(CROSSPYTHONPATH) =
_PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTI=
ARCH) '$interp<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fi<br =
class=3D""> &nbsp;elif test "$cross_compiling" =3D maybe; then<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AC_MSG_ERROR([Cross compiling =
required --host=3DHOST-TUPLE and --build=3DARCH])<br class=3D"">diff =
--git a/meta/recipes-devtools/python/python3/regen-all.patch =
b/meta/recipes-devtools/python/python3/regen-all.patch<br =
class=3D"">deleted file mode 100644<br class=3D"">index =
36b9d9d919..0000000000<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/regen-all.patch<br class=3D"">+++ =
/dev/null<br class=3D"">@@ -1,25 +0,0 @@<br class=3D"">-python3-native: =
run regen-importlib target correctly<br class=3D"">-<br =
class=3D"">-regen-importlib depends on other regen- targets, so we must =
be sure to<br class=3D"">-run it after (most of) the others. &nbsp;In =
reality, we do not need to run it<br class=3D"">-at all since "make" =
will invoke it, if necessary. &nbsp;We do not want to<br class=3D"">-rely =
on that, though.<br class=3D"">-<br class=3D"">-Upstream-Status: =
Pending<br class=3D"">-<br class=3D"">-Signed-off-by: Joe Slater &lt;<a =
href=3D"mailto:joe.slater@windriver.com" =
class=3D"">joe.slater@windriver.com</a>&gt;<br class=3D"">-<br =
class=3D"">-<br class=3D"">-<br class=3D"">---- a/<a =
href=3D"http://Makefile.pre.in" class=3D"">Makefile.pre.in</a><br =
class=3D"">-+++ b/<a href=3D"http://Makefile.pre.in" =
class=3D"">Makefile.pre.in</a><br class=3D"">-@@ -709,7 +709,8 @@ =
regen-importlib: Programs/_freeze_import<br class=3D"">- =
##########################################################################=
##<br class=3D"">- # Regenerate all generated files<br class=3D"">- <br =
class=3D"">--regen-all: regen-opcode regen-opcode-targets =
regen-typeslots regen-grammar regen-ast regen-importlib<br =
class=3D"">-+regen-all: regen-opcode regen-opcode-targets =
regen-typeslots regen-grammar regen-ast<br class=3D"">-+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>$(MAKE) =
regen-importlib<br class=3D"">- <br class=3D"">- =
##########################################################################=
##<br class=3D"">- # Special rules for object files<br class=3D"">diff =
--git =
a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch =
b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch<br class=3D"">index 32ecab9fec..058cfdbc2d 100644<br =
class=3D"">--- =
a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_com=
pile.patch<br class=3D"">@@ -36,12 +36,12 @@ The software will still =
work, but it will not use the .pyc file as it should.<br class=3D""> =
&nbsp;3 files changed, 27 insertions(+)<br class=3D""><br class=3D""> =
diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst<br =
class=3D"">-index 0af8fb1..841f3e8 100644<br class=3D"">+index =
d720e01050..c8cc738f3d 100644<br class=3D""> --- =
a/Doc/library/py_compile.rst<br class=3D""> +++ =
b/Doc/library/py_compile.rst<br class=3D"">-@@ -53,6 +53,10 @@ byte-code =
cache files in the directory containing the source code.<br class=3D"">- =
&nbsp;&nbsp;&nbsp;:func:`compile` function. &nbsp;The default of ``-1`` =
selects the optimization<br class=3D"">- &nbsp;&nbsp;&nbsp;level of the =
current interpreter.<br class=3D"">+@@ -59,6 +59,10 @@ byte-code cache =
files in the directory containing the source code.<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;*invalidation_mode* will be forced to<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;:attr:`PycInvalidationMode.CHECKED_HASH`.<br =
class=3D""><br class=3D""> + &nbsp;&nbsp;If the SOURCE_DATE_EPOCH =
environment variable is set, the .py file mtime<br class=3D""> + =
&nbsp;&nbsp;and timestamp entry in .pyc file header, will be limited to =
this value.<br class=3D"">@@ -51,27 +51,27 @@ index 0af8fb1..841f3e8 =
100644<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Changed =
default value of *cfile* to be :PEP:`3147`-compliant. &nbsp;Previous<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default was *file* =
+ ``'c'`` (``'o'`` if optimization was enabled).<br class=3D""> diff =
--git a/Lib/py_compile.py b/Lib/py_compile.py<br class=3D"">-index =
11c5b50..62dcdc7 100644<br class=3D"">+index 16dc0a011f..b7c28e4fdd =
100644<br class=3D""> --- a/Lib/py_compile.py<br class=3D""> +++ =
b/Lib/py_compile.py<br class=3D"">-@@ -137,6 +137,10 @@ def =
compile(file, cfile=3DNone, dfile=3DNone, doraise=3DFalse, =
optimize=3D-1):<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;except =
FileExistsError:<br class=3D"">+@@ -149,6 +149,10 @@ def compile(file, =
cfile=3DNone, dfile=3DNone, doraise=3DFalse, optimize=3D-1,<br class=3D"">=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pass<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;source_stats =3D =
loader.path_stats(file)<br class=3D"">-+ &nbsp;&nbsp;&nbsp;sde =3D =
os.environ.get('SOURCE_DATE_EPOCH')<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;if sde and source_stats['mtime'] &gt; int(sde):<br =
class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;source_stats['mtime'] =3D =
int(sde)<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.utime(file, =
(source_stats['mtime'], source_stats['mtime']))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;bytecode =3D =
importlib._bootstrap_external._code_to_bytecode(<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;if invalidation_mode =3D=3D =
PycInvalidationMode.TIMESTAMP:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;source_stats =3D =
loader.path_stats(file)<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sde =3D =
os.environ.get('SOURCE_DATE_EPOCH')<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if sde and =
source_stats['mtime'] &gt; int(sde):<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;source_s=
tats['mtime'] =3D int(sde)<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;os.utime=
(file, (source_stats['mtime'], source_stats['mtime']))<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bytecode =3D =
importlib._bootstrap_external._code_to_timestamp_pyc(<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;code, source_stats['mtime'], source_stats['size'])<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;mode =3D =
importlib._bootstrap_external._calc_mode(file)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;else:<br class=3D""> diff --git =
a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py<br =
class=3D"">-index 4a6caa5..3d09963 100644<br class=3D"">+index =
8fc0b3308c..1445a14548 100644<br class=3D""> --- =
a/Lib/test/test_py_compile.py<br class=3D""> +++ =
b/Lib/test/test_py_compile.py<br class=3D"">-@@ -98,6 +98,25 @@ def =
test_bad_coding(self):<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.assertFalse(os.path.e=
xists(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;im=
portlib.util.cache_from_source(bad_coding)))<br class=3D"">+@@ -110,6 =
+110,25 @@ class PyCompileTests(unittest.TestCase):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;fp.read(), 'test', {})<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.assertEqual(flags, =
0b11)<br class=3D""><br class=3D""> + &nbsp;&nbsp;&nbsp;def =
test_source_date_epoch(self):<br class=3D""> + =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;testtime =3D 123456789<br =
class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch =
b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch<br =
class=3D"">index 785b5567f2..d5983544c4 100644<br class=3D"">--- =
a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch<br =
class=3D"">+++ =
b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch<br =
class=3D"">@@ -6,26 +6,27 @@ Should fix things like<br class=3D""> =
configure:6972: arm-angstrom-linux-gnueabi-gcc &nbsp;-march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 =
-DNDEBUG -fno-inline -D__SOFTFP__ =
--sysroot=3D/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/be=
aglebone -c -O2 -pipe -g -feliminate-unused-debug-types =
&nbsp;-I/usr/include/ncursesw conftest.c &gt;&amp;5<br class=3D""> cc1: =
warning: include location "/usr/include/ncursesw" is unsafe for =
cross-compilation [-Wpoison-system-directories]<br class=3D""><br =
class=3D"">+2018-08: Rebased to 3.7.0<br class=3D"">+ &nbsp;-- Jens<br =
class=3D""><br class=3D""> Signed-off-by: Khem Raj<br class=3D""> =
Upstream-Status: Pending<br class=3D""><br class=3D"">-<br =
class=3D"">-Index: Python-3.3.2/setup.py<br =
class=3D"">-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">---- Python-3.3.2.orig/setup.py<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>2013-07-30 01:30:48.000000000 =
-0700<br class=3D"">-+++ Python-3.3.2/setup.py<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>2013-07-30 01:41:11.697862723 -0700<br class=3D"">-@@ -1210,7 =
+1210,7 @@<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;panel_library =3D =
'panel'<br class=3D"">+diff --git a/setup.py b/setup.py<br =
class=3D"">+index 37c5dd58a6..41e88a152b 100644<br class=3D"">+--- =
a/setup.py<br class=3D"">++++ b/setup.py<br class=3D"">+@@ -1333,7 =
+1333,7 @@ class PyBuildExt(build_ext):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if curses_library =
=3D=3D 'ncursesw':<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;curses_defines.append(('HAVE_NCURSESW', '1'))<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;curses_i=
ncludes.append('/usr/include/ncursesw')<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;curses_i=
ncludes.append('=3D/usr/include/ncursesw')<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if=
 not cross_compiling:<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;curses_includes.append('/usr/include/ncursesw')<br =
class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;curses_includes.append('=3D/usr/include/ncursesw')<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;# Bug 1464056: If _curses.so links with ncursesw,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;# _curses_panel.so must link with panelw.<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;panel_library =3D 'panelw'<br class=3D"">-@@ -1819,7 +1819,7 @@<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
host_platform =3D=3D 'darwin':<br class=3D"">+@@ -1968,7 +1968,7 @@ =
class PyBuildExt(build_ext):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;return<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;# OS X 10.5 comes with libffi.dylib; the include files are<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;# in /usr/include/ffi<br class=3D""> - =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inc_dirs=
.append('/usr/include/ffi')<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch =
b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch<br =
class=3D"">new file mode 100644<br class=3D"">index =
0000000000..76623ce9e7<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch<br =
class=3D"">@@ -0,0 +1,22 @@<br class=3D"">+Subject: [PATCH] util-linux =
uuid support<br class=3D"">+<br class=3D"">+Scan for uuid.h in =
include/uuid/ as well as in include/ to catch<br class=3D"">+the =
uuid/uuid.h well supported but accidently not detected.<br class=3D"">+<br=
 class=3D"">+Signed-off-by: Jens Rehsack &lt;<a =
href=3D"mailto:sno@NetBSD.org" class=3D"">sno@NetBSD.org</a>&gt;<br =
class=3D"">+diff --git a/setup.py b/setup.py<br class=3D"">+index =
a97a7559ca..01d8f24fdd 100644<br class=3D"">+--- a/setup.py<br =
class=3D"">++++ b/setup.py<br class=3D"">+@@ -1596,8 +1596,9 @@ class =
PyBuildExt(build_ext):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;missing.append('_tkinter')<br class=3D"">+ <br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Build the =
_uuid module if possible<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid_incs =3D =
find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])<br class=3D"">+- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if uuid_incs is not None:<br =
class=3D"">++ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid_incs =3D =
find_file("uuid.h", inc_dirs, [])<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuid_uuid_incs =3D =
find_file("uuid/uuid.h", inc_dirs, [])<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if uuid_incs is not None or =
uuid_uuid_incs is not None:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if=
 self.compiler.find_library_file(lib_dirs, 'uuid'):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;uuid_libs =3D ['uuid']<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;el=
se:<br class=3D"">diff --git =
a/meta/recipes-devtools/python/python3_3.5.5.bb =
b/meta/recipes-devtools/python/python3_3.5.5.bb<br class=3D"">deleted =
file mode 100644<br class=3D"">index 9e31fa6f29..0000000000<br =
class=3D"">--- a/meta/recipes-devtools/python/python3_3.5.5.bb<br =
class=3D"">+++ /dev/null<br class=3D"">@@ -1,346 +0,0 @@<br =
class=3D"">-require recipes-devtools/python/python.inc<br class=3D"">-<br =
class=3D"">-DEPENDS =3D "python3-native libffi bzip2 gdbm openssl \<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sqlite3 zlib =
virtual/libintl xz qemu-native \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qemu-helper-na=
tive virtual/crypt"<br class=3D"">-<br class=3D"">-PR =3D =
"${INC_PR}.0"<br class=3D"">-PYTHON_MAJMIN =3D "3.5"<br =
class=3D"">-PYTHON_BINABI =3D "${PYTHON_MAJMIN}m"<br =
class=3D"">-DISTRO_SRC_URI ?=3D "<a href=3D"file://sitecustomize.py" =
class=3D"">file://sitecustomize.py</a>"<br =
class=3D"">-DISTRO_SRC_URI_linuxstdbase =3D ""<br class=3D"">-SRC_URI =3D =
"<a href=3D"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz" =
class=3D"">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> =
\<br class=3D"">-<a href=3D"file://python-config.patch" =
class=3D"">file://python-config.patch</a> \<br class=3D"">-<a =
href=3D"file://0001-cross-compile-support.patch" =
class=3D"">file://0001-cross-compile-support.patch</a> \<br class=3D"">-<a=
 href=3D"file://030-fixup-include-dirs.patch" =
class=3D"">file://030-fixup-include-dirs.patch</a> \<br class=3D"">-<a =
href=3D"file://070-dont-clean-ipkg-install.patch" =
class=3D"">file://070-dont-clean-ipkg-install.patch</a> \<br =
class=3D"">-<a href=3D"file://080-distutils-dont_adjust_files.patch" =
class=3D"">file://080-distutils-dont_adjust_files.patch</a> \<br =
class=3D"">-<a href=3D"file://130-readline-setup.patch" =
class=3D"">file://130-readline-setup.patch</a> \<br class=3D"">-<a =
href=3D"file://150-fix-setupterm.patch" =
class=3D"">file://150-fix-setupterm.patch</a> \<br class=3D"">-<a =
href=3D"file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.p=
atch" =
class=3D"">file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDec=
o.patch</a> \<br class=3D"">-<a =
href=3D"file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch" =
class=3D"">file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch</a> =
\<br class=3D"">-<a =
href=3D"file://support_SOURCE_DATE_EPOCH_in_py_compile.patch" =
class=3D"">file://support_SOURCE_DATE_EPOCH_in_py_compile.patch</a> \<br =
class=3D"">-${DISTRO_SRC_URI} \<br class=3D"">-"<br class=3D"">-<br =
class=3D"">-SRC_URI +=3D "\<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///03-fix-tkinter-detection.patch" =
class=3D"">file://03-fix-tkinter-detection.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///avoid_warning_about_tkinter.patch" =
class=3D"">file://avoid_warning_about_tkinter.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///cgi_py.patch" class=3D"">file://cgi_py.patch</a> \<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///host_include_contamination.patch" =
class=3D"">file://host_include_contamination.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///python-3.3-multilib.patch" =
class=3D"">file://python-3.3-multilib.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///shutil-follow-symlink-fix.patch" =
class=3D"">file://shutil-follow-symlink-fix.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///sysroot-include-headers.patch" =
class=3D"">file://sysroot-include-headers.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///unixccompiler.patch" =
class=3D"">file://unixccompiler.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///avoid-ncursesw-include-path.patch" =
class=3D"">file://avoid-ncursesw-include-path.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch" =
class=3D"">file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch</=
a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///sysconfig.py-add-_PYTHON_PROJECT_SRC.patch" =
class=3D"">file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch</a> \<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///setup.py-check-cross_compiling-when-get-FLAGS.patch" =
class=3D"">file://setup.py-check-cross_compiling-when-get-FLAGS.patch</a> =
\<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///configure.ac-fix-LIBPL.patch" =
class=3D"">file://configure.ac-fix-LIBPL.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.=
patch" =
class=3D"">file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dis=
t.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///pass-missing-libraries-to-Extension-for-mul.patch" =
class=3D"">file://pass-missing-libraries-to-Extension-for-mul.patch</a> =
\<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///Use-correct-CFLAGS-for-extensions-when-cross-compili.patch=
" =
class=3D"">file://Use-correct-CFLAGS-for-extensions-when-cross-compili.pat=
ch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0002-Makefile-add-target-to-split-profile-generation.patch=
" =
class=3D"">file://0002-Makefile-add-target-to-split-profile-generation.pat=
ch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"<br =
class=3D"">-SRC_URI[md5sum] =3D "f3763edf9824d5d3a15f5f646083b6e0"<br =
class=3D"">-SRC_URI[sha256sum] =3D =
"063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"<br =
class=3D"">-<br class=3D"">-LIC_FILES_CHKSUM =3D "<a =
href=3D"file://LICENSE;md5=3Db6ec515b22618f55fa07276b897bacea" =
class=3D"">file://LICENSE;md5=3Db6ec515b22618f55fa07276b897bacea</a>"<br =
class=3D"">-<br class=3D"">-# exclude pre-releases for both python 2.x =
and 3.x<br class=3D"">-UPSTREAM_CHECK_REGEX =3D =
"[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).tar"<br class=3D"">-<br =
class=3D"">-S =3D "${WORKDIR}/Python-${PV}"<br class=3D"">-<br =
class=3D"">-inherit autotools multilib_header python3native pkgconfig =
update-alternatives qemu<br class=3D"">-<br class=3D"">-MULTILIB_SUFFIX =
=3D "${@d.getVar('base_libdir',1).split('/')[-1]}"<br class=3D"">-<br =
class=3D"">-ALTERNATIVE_${PN}-dev =3D "python-config"<br =
class=3D"">-ALTERNATIVE_LINK_NAME[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config"<br =
class=3D"">-ALTERNATIVE_TARGET[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"<br =
class=3D"">-<br class=3D"">-CONFIGUREOPTS +=3D " --with-system-ffi "<br =
class=3D"">-<br class=3D"">-CACHED_CONFIGUREVARS =3D =
"ac_cv_have_chflags=3Dno \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_have_lchflags=3Dno \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_have_long_long_format=3Dyes \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_buggy_getaddrinfo=3Dno \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_file__dev_ptmx=3Dyes \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_file__dev_ptc=3Dno \<br class=3D"">-"<br =
class=3D"">-<br class=3D"">-TARGET_CC_ARCH +=3D "-DNDEBUG =
-fno-inline"<br class=3D"">-SDK_CC_ARCH +=3D "-DNDEBUG -fno-inline"<br =
class=3D"">-EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"<br =
class=3D"">-EXTRA_OECONF +=3D =
"CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dyn=
load/ --without-ensurepip --enable-optimizations"<br =
class=3D"">-PYTHON3_PROFILE_TASK ?=3D "${S}/Tools/pybench/pybench.py -n =
1"<br class=3D"">-<br class=3D"">-export CROSS_COMPILE =3D =
"${TARGET_PREFIX}"<br class=3D"">-export _PYTHON_PROJECT_BASE =3D =
"${B}"<br class=3D"">-export _PYTHON_PROJECT_SRC =3D "${S}"<br =
class=3D"">-export CCSHARED =3D "-fPIC"<br class=3D"">-<br class=3D"">-# =
Fix cross compilation of different modules<br class=3D"">-export =
CROSSPYTHONPATH =3D =
"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/l=
ib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"<br =
class=3D"">-<br class=3D"">-# No ctypes option for python 3<br =
class=3D"">-PYTHONLSBOPTS =3D ""<br class=3D"">-<br =
class=3D"">-PACKAGECONFIG ??=3D "readline"<br =
class=3D"">-PACKAGECONFIG[readline] =3D ",,readline"<br class=3D"">-<br =
class=3D"">-do_configure_append() {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rm -f =
${S}/Makefile.orig<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>autoreconf -Wcross --verbose =
--install --force --exclude=3Dautopoint =
../Python-${PV}/Modules/_ctypes/libffi<br class=3D"">-}<br class=3D"">-<br=
 class=3D"">-do_compile() {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# regenerate platform specific =
files, because they depend on system headers<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd ${S}/Lib/plat-linux*<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;include=3D${STAGING_INCDIR} =
${STAGING_BINDIR_NATIVE}/python3-native/python3 \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;${S}/Tools/scripts/h2py.py -i '(u_long)' \<br class=3D"">-=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;${STAGING_INCDIR}/dlfcn.h \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;${STAGING_INCDIR}/linux/cdrom.h \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;${STAGING_INCDIR}/netinet/in.h \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;${STAGING_INCDIR}/sys/types.h<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sed -e =
's,${STAGING_DIR_HOST},,g' -i *.py<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd -<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># remove any bogus LD_LIBRARY_PATH<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>sed -i -e =
s,RUNSHARED=3D.*,RUNSHARED=3D, Makefile<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if [ ! -f Makefile.orig ]; then<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile Makefile.orig<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>sed -i -e 's,^CONFIGURE_LDFLAGS=3D.*,CONFIGURE_LDFLAGS=3D-L. =
-L${STAGING_LIBDIR},g' \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's,libdir=3D${libdir},libdir=3D${STAGING_LIBDIR},g' \<br class=3D"">-<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's,libexecdir=3D${libexecdir},libexecdir=3D${STAGING_DIR_HOST}${libexecdir=
},g' \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's,^LIBDIR=3D.*,LIBDIR=3D${STAGING_LIBDIR},g' \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's,includedir=3D${includedir},includedir=3D${STAGING_INCDIR},g' \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-e 's,^INCLUDEDIR=3D.*,INCLUDE=3D${STAGING_INCDIR},g' \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-e 's,^CONFINCLUDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR},g' =
\<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Makefile<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># save copy of it now, because if =
we do it in do_install and <br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># then call do_install twice we =
get Makefile.orig =3D=3D Makefile.sysroot<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile Makefile.sysroot<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/pytho=
n3 \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;LIB=3D${baselib} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ARCH=3D${TARGET_ARCH} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;OPT=3D"${CFLAGS}" profile-opt<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', =
'false', d)}; then<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;qemu_binary=3D"${@qemu_wrapper_cmdline(d, =
'${STAGING_DIR_TARGET}', ['${B}', =
'${STAGING_DIR_TARGET}/${base_libdir}'])}"<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;cat &gt; pgo-image-qemuwrapper &lt;&lt; EOF<br =
class=3D"">-#!/bin/sh<br class=3D"">-set -x<br class=3D"">-$qemu_binary =
"\$@"<br class=3D"">-EOF<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;chmod +x pgo-image-qemuwrapper<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;./pgo-image-qemuwrapper ${B}/python =
${PYTHON3_PROFILE_TASK} || true<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/pytho=
n3 \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;LIB=3D${baselib} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ARCH=3D${TARGET_ARCH} \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;OPT=3D"${CFLAGS}" clean_and_use_profile<br =
class=3D"">-}<br class=3D"">-<br class=3D"">-do_install() {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># make install needs the original Makefile, or otherwise the =
inclues would<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># go to ${D}${STAGING...}/...<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -m 0644 Makefile.orig Makefile<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/pkgconfig<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-d ${D}${libdir}/python${PYTHON_MAJMIN}/config<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># rerun the build once again with original makefile this time<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># run install in a separate step to avoid compile/install race<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen =
\<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>LIB=3D${baselib} \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>ARCH=3D${TARGET_ARCH} \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>DESTDIR=3D${D} LIBDIR=3D${libdir} build_all_use_profile<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>LIB=3D${baselib} \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>ARCH=3D${TARGET_ARCH} \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>DESTDIR=3D${D} LIBDIR=3D${libdir} install<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># avoid conflict with 2to3 from Python 2<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rm -f =
${D}/${bindir}/2to3<br class=3D"">-<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile<br class=3D"">-<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}=
/Makefile<br class=3D"">-<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if [ -e =
${WORKDIR}/sitecustomize.py ]; then<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">-<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>oe_multilib_header =
python${PYTHON_BINABI}/pyconfig.h<br class=3D"">-}<br class=3D"">-<br =
class=3D"">-do_install_append_class-nativesdk () {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} =
TERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:=
/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'<br =
class=3D"">-}<br class=3D"">-<br class=3D"">-SSTATE_SCAN_FILES +=3D =
"Makefile"<br class=3D"">-PACKAGE_PREPROCESS_FUNCS +=3D =
"py_package_preprocess"<br class=3D"">-<br =
class=3D"">-py_package_preprocess () {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># copy =
back the old Makefile to fix target package<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_A=
BI}/Makefile<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Remove references to =
buildmachine paths in target Makefile and _sysconfigdata<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e =
s:'--with-libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-e 's|${DEBUG_PREFIX_MAP}||g' \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's:${HOSTTOOLS_DIR}/::g' \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's:${RECIPE_SYSROOT_NATIVE}::g' \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's:${RECIPE_SYSROOT}::g' \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${P=
YTHON_ABI}/Makefile \<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${PKGD}/${bindir}/python${PYTHON_BINABI}-config<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># Recompile _sysconfigdata after modifying it<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd =
${PKGD}<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;-c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;-c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', =
optimize=3D1)"<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;-c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', =
optimize=3D2)"<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cd -<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mv ${PKGD}/${bindir}/python3.5m-config =
${PKGD}/${bindir}/python3.5m-config-${MULTILIB_SUFFIX}<br class=3D"">-}<br=
 class=3D"">-<br class=3D"">-# manual dependency additions<br =
class=3D"">-RPROVIDES_${PN}-modules =3D "${PN}"<br =
class=3D"">-RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " =
nativesdk-python3-modules"<br class=3D"">-RRECOMMENDS_${PN}-crypt =3D =
"openssl"<br class=3D"">-RRECOMMENDS_${PN}-crypt_class-nativesdk =3D =
"nativesdk-openssl"<br class=3D"">-<br class=3D"">-FILES_${PN}-2to3 +=3D =
"${bindir}/2to3-${PYTHON_MAJMIN}"<br class=3D"">-FILES_${PN}-pydoc +=3D =
"${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"<br =
class=3D"">-FILES_${PN}-idle +=3D "${bindir}/idle3 =
${bindir}/idle${PYTHON_MAJMIN}"<br class=3D"">-<br class=3D"">-PACKAGES =
=3D+ "${PN}-pyvenv"<br class=3D"">-FILES_${PN}-pyvenv +=3D =
"${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"<br class=3D"">-<br =
class=3D"">-# package libpython3<br class=3D"">-PACKAGES =3D+ =
"libpython3 libpython3-staticdev"<br class=3D"">-FILES_libpython3 =3D =
"${libdir}/libpython*.so.*"<br class=3D"">-FILES_libpython3-staticdev +=3D=
 =
"${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHO=
N_BINABI}.a"<br class=3D"">-INSANE_SKIP_${PN}-dev +=3D "dev-elf"<br =
class=3D"">-<br class=3D"">-# catch all the rest (unsorted)<br =
class=3D"">-PACKAGES +=3D "${PN}-misc"<br class=3D"">-RDEPENDS_${PN}-misc =
+=3D "${PN}-core ${PN}-email ${PN}-codecs"<br =
class=3D"">-RDEPENDS_${PN}-modules +=3D "${PN}-misc"<br =
class=3D"">-FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"<br =
class=3D"">-<br class=3D"">-# catch manpage<br class=3D"">-PACKAGES +=3D =
"${PN}-man"<br class=3D"">-FILES_${PN}-man =3D "${datadir}/man"<br =
class=3D"">-<br class=3D"">-BBCLASSEXTEND =3D "nativesdk"<br =
class=3D"">-<br class=3D"">-RPROVIDES_${PN} +=3D "${PN}-modules"<br =
class=3D"">-<br class=3D"">-# We want bytecode precompiled .py files =
(.pyc's) by default<br class=3D"">-# but the user may set it on their =
own conf<br class=3D"">-INCLUDE_PYCS ?=3D "1"<br class=3D"">-<br =
class=3D"">-python(){<br class=3D"">- &nbsp;&nbsp;&nbsp;import json<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;filename =3D =
os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')<br =
class=3D"">- &nbsp;&nbsp;&nbsp;# This python changes the datastore based =
on the contents of a file, so mark<br class=3D"">- &nbsp;&nbsp;&nbsp;# =
that dependency.<br class=3D"">- =
&nbsp;&nbsp;&nbsp;bb.parse.mark_dependency(d, filename)<br class=3D"">-<br=
 class=3D"">- &nbsp;&nbsp;&nbsp;with open(filename) as manifest_file:<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;python_manifest=3Djson.load(mani=
fest_file)<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;include_pycs =3D d.getVar('INCLUDE_PYCS')<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;packages =3D =
d.getVar('PACKAGES').split()<br class=3D"">- &nbsp;&nbsp;&nbsp;pn =3D =
d.getVar('PN')<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;newpackages=3D[]<br class=3D"">- &nbsp;&nbsp;&nbsp;for =
key in python_manifest:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pypackage=3D pn + '-' + key<br =
class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if pypackage not in =
packages:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# We =
need to prepend, otherwise python-misc gets everything<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# so =
we use a new variable<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;newpacka=
ges.append(pypackage)<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# "Build" python's manifest =
FILES, RDEPENDS and SUMMARY<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('FILES_' + pypackage, =
'')<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for value =
in python_manifest[key]['files']:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.append=
Var('FILES_' + pypackage, ' ' + value)<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Add cached files<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if include_pycs =3D=3D '1':<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for =
value in python_manifest[key]['cached']:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.appendVar('FILES_' + =
pypackage, ' ' + value)<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('RDEPENDS_' + =
pypackage, '')<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for value in =
python_manifest[key]['rdepends']:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Make =
it work with or without $PN<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
'${PN}' in value:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;value=3Dvalue.split('-')[1]<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.append=
Var('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('SUMMARY_' + =
pypackage, python_manifest[key]['summary'])<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;# We need to ensure staticdev packages =
match for files first so we sort in reverse<br class=3D"">- =
&nbsp;&nbsp;&nbsp;newpackages.sort(reverse=3DTrue)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;# Prepending so to avoid python-misc getting =
everything<br class=3D"">- &nbsp;&nbsp;&nbsp;packages =3D newpackages + =
packages<br class=3D"">- &nbsp;&nbsp;&nbsp;d.setVar('PACKAGES', ' =
'.join(packages))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;d.setVar('ALLOW_EMPTY_${PN}-modules', '1')<br =
class=3D"">-}<br class=3D"">-<br class=3D"">-# Files needed to create a =
new manifest<br class=3D"">-SRC_URI +=3D "<a =
href=3D"file://create_manifest3.py" =
class=3D"">file://create_manifest3.py</a> <a =
href=3D"file:///get_module_deps3.py" =
class=3D"">file://get_module_deps3.py</a> <a =
href=3D"file://python3-manifest.json" =
class=3D"">file://python3-manifest.json</a>"<br class=3D"">-<br =
class=3D"">-do_create_manifest() {<br class=3D"">- &nbsp;&nbsp;&nbsp;# =
This task should be run with every new release of Python.<br class=3D"">- =
&nbsp;&nbsp;&nbsp;# We must ensure that PACKAGECONFIG enables everything =
when creating<br class=3D"">- &nbsp;&nbsp;&nbsp;# a new manifest, this =
is to base our new manifest on a complete<br class=3D"">- =
&nbsp;&nbsp;&nbsp;# native python build, containing all dependencies, =
otherwise the task<br class=3D"">- &nbsp;&nbsp;&nbsp;# wont be able to =
find the required files.<br class=3D"">- &nbsp;&nbsp;&nbsp;# e.g. =
BerkeleyDB is an optional build dependency so it may or may not<br =
class=3D"">- &nbsp;&nbsp;&nbsp;# be present, we must ensure it is.<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;cd ${WORKDIR}<br =
class=3D"">- &nbsp;&nbsp;&nbsp;# This needs to be executed by =
python-native and NOT by HOST's python<br class=3D"">- =
&nbsp;&nbsp;&nbsp;nativepython3 create_manifest3.py ${PYTHON_MAJMIN}<br =
class=3D"">- &nbsp;&nbsp;&nbsp;cp python3-manifest.json.new =
${THISDIR}/python3/python3-manifest.json<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-# bitbake python -c create_manifest<br =
class=3D"">-addtask do_create_manifest<br class=3D"">-<br class=3D"">-# =
Make sure we have native python ready when we create a new manifest<br =
class=3D"">-do_create_manifest[depends] +=3D =
"python3:do_prepare_recipe_sysroot"<br =
class=3D"">-do_create_manifest[depends] +=3D "python3:do_patch"<br =
class=3D"">diff --git a/meta/recipes-devtools/python/python3_3.7.0.bb =
b/meta/recipes-devtools/python/python3_3.7.0.bb<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000000..22e9799424<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/meta/recipes-devtools/python/python3_3.7.0.bb<br class=3D"">@@ -0,0 =
+1,316 @@<br class=3D"">+require recipes-devtools/python/python3.inc<br =
class=3D"">+<br class=3D"">+DEPENDS =3D "libffi bzip2 gdbm openssl =
sqlite3 zlib xz \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;util-linux =
libtirpc libnsl2 virtual/libintl virtual/crypt"<br class=3D"">+DEPENDS =
+=3D "${@["qemu-native qemu-helper-native", =
""][(bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 0, 1, =
d))]}"<br class=3D"">+<br class=3D"">+PYTHON_BINABI =3D =
"${PYTHON_MAJMIN}${PYTHON_ABI}"<br class=3D"">+<br class=3D"">+SRC_URI =
+=3D "<a =
href=3D"http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz" =
class=3D"">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch" =
class=3D"">file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a href=3D"file:///cgi_py.patch" =
class=3D"">file://cgi_py.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///host_include_contamination.patch" =
class=3D"">file://host_include_contamination.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///uuid_when_cross_compiling.patch" =
class=3D"">file://uuid_when_cross_compiling.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a href=3D"file:///avoid-ncursesw-include-path.patch" =
class=3D"">file://avoid-ncursesw-include-path.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch" =
class=3D"">file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch</=
a> \<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///configure.ac-fix-LIBPL.patch" =
class=3D"">file://configure.ac-fix-LIBPL.patch</a> \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///pass-missing-libraries-to-Extension-for-mul.patch" =
class=3D"">file://pass-missing-libraries-to-Extension-for-mul.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///Use-correct-CFLAGS-for-extensions-when-cross-compili.patch=
" =
class=3D"">file://Use-correct-CFLAGS-for-extensions-when-cross-compili.pat=
ch</a> \<br class=3D"">+"<br class=3D"">+<br class=3D"">+inherit =
multilib_header python3native update-alternatives qemu<br class=3D"">+<br =
class=3D"">+MULTILIB_SUFFIX =3D =
"${@d.getVar('base_libdir',1).split('/')[-1]}"<br class=3D"">+<br =
class=3D"">+ALTERNATIVE_${PN}-dev =3D "python-config"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config"<br =
class=3D"">+ALTERNATIVE_TARGET[python-config] =3D =
"${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"<br =
class=3D"">+<br class=3D"">+CACHED_CONFIGUREVARS =3D =
"ac_cv_have_chflags=3Dno \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_have_lchflags=3Dno \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_have_long_long_format=3Dyes \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_buggy_getaddrinfo=3Dno \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_file__dev_ptmx=3Dyes \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ac_cv_file__dev_ptc=3Dno \<br class=3D"">+"<br =
class=3D"">+<br class=3D"">+TARGET_CC_ARCH +=3D "-DNDEBUG =
-fno-inline"<br class=3D"">+SDK_CC_ARCH +=3D "-DNDEBUG -fno-inline"<br =
class=3D"">+EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"<br =
class=3D"">+EXTRA_OECONF +=3D =
"CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dyn=
load/ --without-ensurepip --enable-optimizations"<br =
class=3D"">+PYTHON3_PROFILE_TASK ?=3D "${S}/Tools/pybench/pybench.py -n =
1"<br class=3D"">+<br class=3D"">+export CROSS_COMPILE =3D =
"${TARGET_PREFIX}"<br class=3D"">+export _PYTHON_PROJECT_BASE =3D =
"${B}"<br class=3D"">+export _PYTHON_PROJECT_SRC =3D "${S}"<br =
class=3D"">+export CCSHARED =3D "-fPIC"<br class=3D"">+<br class=3D"">+# =
Fix cross compilation of different modules<br class=3D"">+export =
CROSSPYTHONPATH =3D =
"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/l=
ib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"<br =
class=3D"">+<br class=3D"">+# No ctypes option for python 3<br =
class=3D"">+PYTHONLSBOPTS =3D ""<br class=3D"">+<br =
class=3D"">+PACKAGECONFIG ??=3D "readline"<br =
class=3D"">+PACKAGECONFIG[readline] =3D ",,readline"<br class=3D"">+<br =
class=3D"">+do_compile() {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# regenerate platform specific =
files, because they depend on system headers<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#cd ${S}/Lib/plat-linux*<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#include=3D${STAGING_INCDIR} =
${STAGING_BINDIR_NATIVE}/python3-native/python3 \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${S}/Tools/scripts/h2py.py -i =
'(u_long)' \<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${STAGING_INCDIR}/dlfcn.h \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${STAGING_INCDIR}/linux/cdrom.h =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${STAGING_INCDIR}/netinet/in.h =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${STAGING_INCDIR}/sys/types.h<br=
 class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#sed -e =
's,${STAGING_DIR_HOST},,g' -i *.py<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#cd -<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># remove any bogus LD_LIBRARY_PATH<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>sed -i -e =
s,RUNSHARED=3D.*,RUNSHARED=3D, Makefile<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if [ ! -f Makefile.orig ]; then<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile Makefile.orig<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>sed -i -e 's,^CONFIGURE_LDFLAGS=3D.*,CONFIGURE_LDFLAGS=3D-L. =
-L${STAGING_LIBDIR},g' \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's,libdir=3D${libdir},libdir=3D${STAGING_LIBDIR},g' \<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's,libexecdir=3D${libexecdir},libexecdir=3D${STAGING_DIR_HOST}${libexecdir=
},g' \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's,^LIBDIR=3D.*,LIBDIR=3D${STAGING_LIBDIR},g' \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's,includedir=3D${includedir},includedir=3D${STAGING_INCDIR},g' \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-e 's,^INCLUDEDIR=3D.*,INCLUDE=3D${STAGING_INCDIR},g' \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-e 's,^CONFINCLUDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR},g' =
\<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Makefile<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', =
'false', d)}; then<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;qemu_binary=3D"${@qemu_wrapper_cmdline(d, =
'${STAGING_DIR_TARGET}', ['${B}', =
'${STAGING_DIR_TARGET}/${base_libdir}'])}"<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;cat &gt; ${B}/pgo-image-qemuwrapper &lt;&lt; EOF<br =
class=3D"">+#!/bin/sh<br class=3D"">+set -x<br class=3D"">+$qemu_binary =
"\$@"<br class=3D"">+EOF<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;chmod +x ${B}/pgo-image-qemuwrapper<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;./pgo-image-qemuwrapper ${B}/python =
${PYTHON3_PROFILE_TASK} || true<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) =
./$(BUILDPYTHON) $(PROFILE_TASK),'"${B}/pgo-image-qemuwrapper =
${B}/python ${PYTHON3_PROFILE_TASK}," \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Makefile<b=
r class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>else<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) =
./$(BUILDPYTHON) $(PROFILE_TASK),,' \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Makefile<b=
r class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fi<br class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># save copy of it now, because if =
we do it in do_install and <br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># then call do_install twice we =
get Makefile.orig =3D=3D Makefile.sysroot<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile Makefile.sysroot<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;oe_runmake =
HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/pytho=
n3 \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;LIB=3D${baselib} \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ARCH=3D${TARGET_ARCH} \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;OPT=3D"${CFLAGS}" profile-opt<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+do_install() {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span># make =
install needs the original Makefile, or otherwise the inclues would<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># go to ${D}${STAGING...}/...<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile.orig Makefile<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-d ${D}${libdir}/pkgconfig<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d =
${D}${libdir}/python${PYTHON_MAJMIN}/config<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># rerun the build once again with original makefile this time<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># run install in a separate step to avoid compile/install race<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen =
\<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>LIB=3D${baselib} \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>ARCH=3D${TARGET_ARCH} \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>DESTDIR=3D${D} LIBDIR=3D${libdir} build_all<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python3-native/pgen =
\<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python3-native/python3 \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_INCDIR=3D${STAGING_INCDIR} \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>LIB=3D${baselib} \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>ARCH=3D${TARGET_ARCH} \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>DESTDIR=3D${D} LIBDIR=3D${libdir} install<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># avoid conflict with 2to3 from Python 2<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rm -f =
${D}/${bindir}/2to3<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>set -x<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;install -m 0644 =
Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 Makefile.sysroot =
${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}=
/Makefile<br class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if [ -e =
${WORKDIR}/sitecustomize.py ]; then<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-m 0644 ${WORKDIR}/sitecustomize.py =
${D}/${libdir}/python${PYTHON_MAJMIN}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>oe_multilib_header =
python${PYTHON_BINABI}/pyconfig.h<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+do_install_append_class-nativesdk () {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} =
TERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:=
/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+SSTATE_SCAN_FILES +=3D =
"Makefile"<br class=3D"">+PACKAGE_PREPROCESS_FUNCS +=3D =
"py_package_preprocess"<br class=3D"">+<br =
class=3D"">+py_package_preprocess () {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>MAKESETTINGS=3D"$(egrep '^(ABIFLAGS|MULTIARCH)=3D' ${B}/Makefile =
| sed -E -e 's/[[:space:]]//g' -e 's/=3D/=3D"/' -e 's/$/"/')"<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>eval ${MAKESETTINGS}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if test "${ABIFLAGS}" !=3D =
"${PYTHON_ABI}"; then<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;&nbsp;&nbsp;die =
"do_install: configure determined ABIFLAGS '${ABIFLAGS}' !=3D =
'${PYTHON_ABI}' from python3-dir.bbclass"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if test "x${BUILD_OS}" =3D "x${TARGET_OS}"; then<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># no cross-compile at all<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH=
}<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>else<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># at the very moment, it's the =
only available target<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>_PYTHON_SYSCONFIGDATA_NAME=3D${PYTHON_ABI}_linux_${MULTIARCH}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fi<br class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># copy back the old Makefile to =
fix target package<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -m 0644 =
${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -m 0644 ${B}/Makefile.orig =
${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIAR=
CH}/Makefile<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Remove references to =
buildmachine paths in target Makefile and _sysconfigdata<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e =
s:'--with-libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>-e 's|${DEBUG_PREFIX_MAP}||g' \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's:${HOSTTOOLS_DIR}/::g' \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's:${RECIPE_SYSROOT_NATIVE}::g' \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>-e =
's:${RECIPE_SYSROOT}::g' \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>-e =
's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${=
MULTIARCH}/Makefile \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_S=
YSCONFIGDATA_NAME}.py \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${PKGD}/${bindir}/python${PYTHON_BINABI}-config<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># Recompile _sysconfigdata after modifying it<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd =
${PKGD}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;-c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCO=
NFIGDATA_NAME}.py')"<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;-c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCO=
NFIGDATA_NAME}.py', optimize=3D1)"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;&nbsp;-c "from py_compile import compile; =
compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCO=
NFIGDATA_NAME}.py', optimize=3D2)"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd -<br =
class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mv =
${PKGD}/${bindir}/python${PYTHON_BINABI}-config =
${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+# manual dependency =
additions<br class=3D"">+RPROVIDES_${PN}-modules =3D "${PN}"<br =
class=3D"">+RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " =
nativesdk-python3-modules"<br class=3D"">+RRECOMMENDS_${PN}-crypt =3D =
"openssl"<br class=3D"">+RRECOMMENDS_${PN}-crypt_class-nativesdk =3D =
"nativesdk-openssl"<br class=3D"">+<br class=3D"">+FILES_${PN}-2to3 +=3D =
"${bindir}/2to3-${PYTHON_MAJMIN}"<br class=3D"">+FILES_${PN}-pydoc +=3D =
"${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"<br =
class=3D"">+FILES_${PN}-idle +=3D "${bindir}/idle3 =
${bindir}/idle${PYTHON_MAJMIN}"<br class=3D"">+<br class=3D"">+PACKAGES =
=3D+ "${PN}-pyvenv"<br class=3D"">+FILES_${PN}-pyvenv +=3D =
"${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"<br class=3D"">+<br =
class=3D"">+# package libpython3<br class=3D"">+PACKAGES =3D+ =
"libpython3 libpython3-staticdev"<br class=3D"">+FILES_libpython3 =3D =
"${libdir}/libpython*.so.*"<br class=3D"">+FILES_libpython3-staticdev +=3D=
 =
"${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}*/libpython${PYTH=
ON_BINABI}.a"<br class=3D"">+INSANE_SKIP_${PN}-dev +=3D "dev-elf"<br =
class=3D"">+<br class=3D"">+# catch all the rest (unsorted)<br =
class=3D"">+PACKAGES +=3D "${PN}-misc"<br class=3D"">+RDEPENDS_${PN}-misc =
+=3D "${PN}-core ${PN}-email ${PN}-codecs"<br =
class=3D"">+RDEPENDS_${PN}-modules +=3D "${PN}-misc"<br =
class=3D"">+FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"<br =
class=3D"">+<br class=3D"">+# catch manpage<br class=3D"">+PACKAGES +=3D =
"${PN}-man"<br class=3D"">+FILES_${PN}-man =3D "${datadir}/man"<br =
class=3D"">+<br class=3D"">+BBCLASSEXTEND =3D "nativesdk"<br =
class=3D"">+<br class=3D"">+RPROVIDES_${PN} +=3D "${PN}-modules"<br =
class=3D"">+<br class=3D"">+# We want bytecode precompiled .py files =
(.pyc's) by default<br class=3D"">+# but the user may set it on their =
own conf<br class=3D"">+INCLUDE_PYCS ?=3D "1"<br class=3D"">+<br =
class=3D"">+python(){<br class=3D"">+ &nbsp;&nbsp;&nbsp;import json<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;filename =3D =
os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;# This python changes the datastore based =
on the contents of a file, so mark<br class=3D"">+ &nbsp;&nbsp;&nbsp;# =
that dependency.<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;bb.parse.mark_dependency(d, filename)<br class=3D"">+<br=
 class=3D"">+ &nbsp;&nbsp;&nbsp;with open(filename) as manifest_file:<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;python_manifest=3Djson.load(mani=
fest_file)<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;include_pycs =3D d.getVar('INCLUDE_PYCS')<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;packages =3D =
d.getVar('PACKAGES').split()<br class=3D"">+ &nbsp;&nbsp;&nbsp;pn =3D =
d.getVar('PN')<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;newpackages=3D[]<br class=3D"">+ &nbsp;&nbsp;&nbsp;for =
key in python_manifest:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pypackage=3D pn + '-' + key<br =
class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if pypackage not in =
packages:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# We =
need to prepend, otherwise python-misc gets everything<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# so =
we use a new variable<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;newpacka=
ges.append(pypackage)<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# "Build" python's manifest =
FILES, RDEPENDS and SUMMARY<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('FILES_' + pypackage, =
'')<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for value =
in python_manifest[key]['files']:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.append=
Var('FILES_' + pypackage, ' ' + value)<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span># Add cached files<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if include_pycs =3D=3D '1':<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for =
value in python_manifest[key]['cached']:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.appendVar('FILES_' + =
pypackage, ' ' + value)<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('RDEPENDS_' + =
pypackage, '')<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for value in =
python_manifest[key]['rdepends']:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Make =
it work with or without $PN<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
'${PN}' in value:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;value=3Dvalue.split('-')[1]<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.append=
Var('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('SUMMARY_' + =
pypackage, python_manifest[key]['summary'])<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;# We need to ensure staticdev packages =
match for files first so we sort in reverse<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;newpackages.sort(reverse=3DTrue)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;# Prepending so to avoid python-misc getting =
everything<br class=3D"">+ &nbsp;&nbsp;&nbsp;packages =3D newpackages + =
packages<br class=3D"">+ &nbsp;&nbsp;&nbsp;d.setVar('PACKAGES', ' =
'.join(packages))<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;d.setVar('ALLOW_EMPTY_${PN}-modules', '1')<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+# Files needed to create a =
new manifest<br class=3D"">+SRC_URI +=3D "<a =
href=3D"file://create_manifest3.py" =
class=3D"">file://create_manifest3.py</a> <a =
href=3D"file:///get_module_deps3.py" =
class=3D"">file://get_module_deps3.py</a> <a =
href=3D"file://python3-manifest.json" =
class=3D"">file://python3-manifest.json</a>"<br class=3D"">+<br =
class=3D"">+do_create_manifest() {<br class=3D"">+ &nbsp;&nbsp;&nbsp;# =
This task should be run with every new release of Python.<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;# We must ensure that PACKAGECONFIG enables everything =
when creating<br class=3D"">+ &nbsp;&nbsp;&nbsp;# a new manifest, this =
is to base our new manifest on a complete<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;# native python build, containing all dependencies, =
otherwise the task<br class=3D"">+ &nbsp;&nbsp;&nbsp;# wont be able to =
find the required files.<br class=3D"">+ &nbsp;&nbsp;&nbsp;# e.g. =
BerkeleyDB is an optional build dependency so it may or may not<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;# be present, we must ensure it is.<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;cd ${WORKDIR}<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;# This needs to be executed by =
python-native and NOT by HOST's python<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;nativepython3 create_manifest3.py ${PYTHON_MAJMIN}<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;cp python3-manifest.json.new =
${THISDIR}/python3/python3-manifest.json<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+# bitbake python -c create_manifest<br =
class=3D"">+addtask do_create_manifest<br class=3D"">+<br class=3D"">+# =
Make sure we have native python ready when we create a new manifest<br =
class=3D"">+do_create_manifest[depends] +=3D =
"python3:do_prepare_recipe_sysroot"<br =
class=3D"">+do_create_manifest[depends] +=3D "python3:do_patch"<br =
class=3D"">-- <br class=3D"">2.17.1<br class=3D""><br =
class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">I had weird build issues on =
nativesdk-gpgme after that update, but this went</div><div =
class=3D"">magically away after rebasing my repo to poky/master. I hope =
it works generally.</div><div class=3D""><br class=3D""></div><div =
class=3D"">BTW: I could need some hints how to debug build_ext or =
unixcompiler, respectively.</div><div class=3D""><br =
class=3D""></div>Cheers<br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_36B8F7CE-20A3-4443-BA4C-CD3294B989BC--

--Apple-Mail=_EA7C1826-3CD7-41C5-8C41-969A842615B8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluSklgACgkQRJmWrtzl
Cp0dnw//YR+doVS7g/Ay+oYU+QOamL9VDf3+bSEr1M8SYZLz/quWw2/+WbiG/Rp/
BzGzTW7WArKt2IzEOPWLkr4BqpDqGVckC1/UOObKqjnzOp6AV0kFtTEkEdpb6MT6
iPidDhaYa6KOGprLw+uE6CZmErz2vq9u9IjWLbeJ8NqUxcMHHEI/eYbTJ29IWqmV
quXlEIfoTBqmYSxgmeiq8QBOdU/Ew6upk4kFTzGqAn9kHQB9gQC1h7+/3mEh2N4r
KuOqLa6XbYd4pAzjMOhxDZ9mYJ/eJbqeFapPoeHoqKwxFh8mXA9GbVa2zBmkNzn5
/jAwUDgNgpfp7T+/PsxYOBUwxPLNKmCC8fUunmvEFWf8Lc/sSdmizn2wkKuByub/
zBcBsQRD0s3tLso0vj/AKt9nZ3Wuajl9NOQ2tD2XSGJU+Mr4HmhSmmlOG370uvZY
WiqI6a4TaHzlzsl3W6iZLf7Uf1h+ugSdgGrbktwKrNkJht8jwD64UIEHPswrdKma
+KSNoflggZYnVLRe1Wit+Ur/UAF2LQSDmgvismVJgMFBcWgCyAvpKo2vbMUkpoNz
EAVowbbArn/HDEGvhmzEad5sHlmWvG/iHiNmcCqAwtrvm2LFFygSPxacA5EFHtqf
uLW98BP90vK9SjFnd/ZGfT7G2Sw8FzzVgXtn/mpDZXfnER5j2jw=
=DG7M
-----END PGP SIGNATURE-----

--Apple-Mail=_EA7C1826-3CD7-41C5-8C41-969A842615B8--
