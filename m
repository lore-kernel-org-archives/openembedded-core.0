Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 00AA86C385
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 10:47:58 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id j79-v6so23173026itb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gs34jBAlhQCj0WVICfYjdg4z35QelVkzWwcTsvv+e68=;
	b=CnHBrw86b0xIMo+u8i0CalcTGND2I5wuZW/L0dzWcZmGVBitE46BMtEpTCXxFZAxQo
	hr8HBe+kKjeTA3MzrYEhfrTUX1NdNJBtPppa6B6zqCqygwWOTeo2UF1ZeXTw7v4p4jP8
	MxoJ2r4VTt9BqNJvQMOhb7s7kH5WsK7mM/EeAE/38Cu5LXGqYB7SYqWlU/FhuZ7x/bvm
	ASu0e4nuNpLU92CbL7hnqWpNU6yLRz+J8PcCI8K4eQRXzOwczr5BfK3TSChpFkRL5LBO
	N6zUON5yFXVLPvHpQmDLhts//bxNEMC538p39pp5wqzC06uArQEW3eLru2VVKVz2Zxlt
	iOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gs34jBAlhQCj0WVICfYjdg4z35QelVkzWwcTsvv+e68=;
	b=DTAlAj873zkJj1TqfehaGjJ5vl+rQpJw1ftHYo16E9OcN4sKtKLtVRJBK8w/6dhK7n
	96eGPxk/ZSeUnMb6S+INlEJh6CEviz7QQPEkMj979y+GK5HKQU8znCFibgqzwJH4aNZQ
	LiKIHEhgb5uvWJbTnFbR9IguotWvXPDw33/GCvnAvgbVelj8ZFZEMkaAGE3CyVJUZgAy
	vfX33E5K3dgAFA6ai/Ho0jnJNFkH29kh4a6vYVIJCN33a99R8z1ITqzF1/O1S8qOzMES
	/2qQtxAcw+w1CPKbyevrcC+81+cE0mW+0hcI1dCRco8GTx1Eegzuj0woxAw4JcZqcP4q
	osGg==
X-Gm-Message-State: AGRZ1gJ6jFM1E/Kg6fEp+mg3MwwlzzATkE+70F+LxdSfz3iBkLImraZy
	Dvl7jPbKiItY0IKCBe6KbkvDehoeRETuE9jf/KeosZ73q2U=
X-Google-Smtp-Source: AJdET5fakoHdtmfJVoy1apKUif2xuEJDVJN515sa3Uoc0aCN+tkuNwegyAZB3uAcEc9kK9SiXDZ1Of/eL4VQujInHXU=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr1405598itg.26.1542192478832; 
	Wed, 14 Nov 2018 02:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20181102172812.12120-1-sno@netbsd.org>
In-Reply-To: <20181102172812.12120-1-sno@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2018 10:47:41 +0000
Message-ID: <CAJTo0LbRiDVcGxuihyGkhDk3ATKb18r7Z5_pfSd3=C=0SHbaWQ@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3{,-native}: update to 3.7.1
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
X-List-Received-Date: Wed, 14 Nov 2018 10:47:59 -0000
Content-Type: multipart/alternative; boundary="000000000000e07d15057a9daac6"

--000000000000e07d15057a9daac6
Content-Type: text/plain; charset="UTF-8"

Getting reports that this breaks cross builds, for example python3-dbus.

tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot-native/usr/lib/
libpython3.7m.so: file not recognized: File format not recognized
With 3.5.6 the python3-dbus do_configure lokks like
"-L/home/dev/medusa/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot/usr/lib
-lpython3.5m"
With the patch 3.7.1 from the ml, it looks like
"L/home/dev/medusa-test/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot-native/usr/lib
-lpython3.7m"


Looks like the cross/sysconfig/etc code regressed and it's picking up the
native sysroot libraries for a cross build.

Ross




On Fri, 2 Nov 2018 at 17:28, Jens Rehsack <sno@netbsd.org> wrote:

> Update python3 to recent 3.7.1 release.
>
> Details about new features and bug-fixes can be taken from
> * https://docs.python.org/3/whatsnew/3.7.html
> * https://docs.python.org/3/whatsnew/3.6.html
>
> Remove patches when they were fixed upstream and rebase the
> remaining ones. If necessary, the patches are adopted to
> keep the idea when upstream code was changed. Also remove
> backports from 3.6 and 3.7 into 3.5.6 codebase for TLS
> and multiprocessing.
>
> Open TODO: track patches in a -STABLE rebased git branch for
> easier rebasing or upstream submitting.
>
> Enhancement requests for Yocto project
> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=12375
> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=12901
> are solved by this.
>
> Rebased until e349b239c8833bcdad9b1ff1a0702ace2db71959
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/python3-dir.bbclass              |   6 +-
>  .../python/python3-native_3.5.6.bb            | 100 ------
>  .../python/python3-native_3.7.1.bb            |  73 ++++
>  meta/recipes-devtools/python/python3.inc      |  65 +++-
>  ...hell-version-of-python-config-that-w.patch |  21 +-
>  ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
>  ...ontext-has-improved-default-settings.patch | 272 ---------------
>  ...d-target-to-split-profile-generation.patch |  40 ---
>  ...S-1.3-cipher-suites-and-OP_NO_TLSv1_.patch | 227 ------------
>  ...for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch | 173 ---------
>  ....3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch | 110 ------
>  ...ALPN-changes-for-OpenSSL-1.1.0f-2305.patch |  68 ----
>  .../python3/03-fix-tkinter-detection.patch    |  12 +-
>  .../python3/030-fixup-include-dirs.patch      |   9 -
>  .../080-distutils-dont_adjust_files.patch     |   4 +-
>  .../python/python3/150-fix-setupterm.patch    |  17 -
>  ...GS-for-extensions-when-cross-compili.patch |  53 ++-
>  .../python3/avoid-ncursesw-include-path.patch |  18 +-
>  .../python3/avoid_warning_about_tkinter.patch |  18 +-
>  .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
>  .../python/python3/float-endian.patch         |   9 +-
>  .../python/python3/ftplib.patch               |  60 ----
>  ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
>  .../python/python3/python-3.3-multilib.patch  | 241 +++++++------
>  .../python/python3/python3-manifest.json      |  36 +-
>  ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
>  .../python/python3/regen-all.patch            |  25 --
>  .../python/python3/signal.patch               |  56 ---
>  ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  97 ------
>  .../python3/sysroot-include-headers.patch     |  23 +-
>  .../python3/uuid_when_cross_compiling.patch   |  24 ++
>  meta/recipes-devtools/python/python3_3.5.6.bb | 329 ------------------
>  meta/recipes-devtools/python/python3_3.7.1.bb | 298 ++++++++++++++++
>  33 files changed, 704 insertions(+), 1910 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-native_3.5.6.bb
>  create mode 100644 meta/recipes-devtools/python/python3-native_3.7.1.bb
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/150-fix-setupterm.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/ftplib.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/regen-all.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/signal.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
>  create mode 100644
> meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
>  delete mode 100644 meta/recipes-devtools/python/python3_3.5.6.bb
>  create mode 100644 meta/recipes-devtools/python/python3_3.7.1.bb
>
> diff --git a/meta/classes/python3-dir.bbclass
> b/meta/classes/python3-dir.bbclass
> index 06bb046d9c..ad7ea8dd9a 100644
> --- a/meta/classes/python3-dir.bbclass
> +++ b/meta/classes/python3-dir.bbclass
> @@ -1,4 +1,8 @@
> -PYTHON_BASEVERSION = "3.5"
> +PYTHON_BASEVERSION = "3.7"
> +# [d][m][u]
> +# d: py_debug
> +# m: my_malloc
> +# u: wide-char unicode
>  PYTHON_ABI = "m"
>  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>  PYTHON_PN = "python3"
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb
> b/meta/recipes-devtools/python/python3-native_3.5.6.bb
> deleted file mode 100644
> index d5953cf4bb..0000000000
> --- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -require recipes-devtools/python/python3.inc
> -
> -DISTRO_SRC_URI ?= "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase = ""
> -SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> -file://12-distutils-prefix-is-inside-staging-area.patch \
> -file://python-config.patch \
> -file://030-fixup-include-dirs.patch \
> -file://070-dont-clean-ipkg-install.patch \
> -file://080-distutils-dont_adjust_files.patch \
> -file://130-readline-setup.patch \
> -file://150-fix-setupterm.patch \
> -file://python-3.3-multilib.patch \
> -file://03-fix-tkinter-detection.patch \
> -file://avoid_warning_about_tkinter.patch \
> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> -file://sysroot-include-headers.patch \
> -file://unixccompiler.patch \
> -${DISTRO_SRC_URI} \
> -file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -file://regen-all.patch \
> -file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
> -file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
> -file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
> -file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
> -file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
> -"
> -
> -EXTRANATIVEPATH += "bzip2-native"
> -DEPENDS = "openssl-native bzip2-replacement-native zlib-native
> readline-native sqlite3-native gdbm-native"
> -
> -inherit native
> -
> -EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
> -
> -EXTRA_OEMAKE = '\
> -  LIBC="" \
> -  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
> -  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
> -  LIB=${baselib} \
> -  ARCH=${TARGET_ARCH} \
> -'
> -
> -do_configure_append() {
> -       autoreconf --verbose --install --force --exclude=autopoint
> ../Python-${PV}/Modules/_ctypes/libffi
> -       sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM
> \*/,' ${B}/pyconfig.h
> -}
> -
> -# Regenerate all of the generated files
> -# This ensures that pgen and friends get created during the compile phase
> -#
> -do_compile_prepend() {
> -    # Assuming https://bugs.python.org/issue33080 has been addressed in
> Makefile.
> -    oe_runmake regen-all
> -}
> -
> -do_install() {
> -       install -d ${D}${libdir}/pkgconfig
> -       oe_runmake 'DESTDIR=${D}' install
> -       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -               install -m 0644 ${WORKDIR}/sitecustomize.py
> ${D}/${libdir}/python${PYTHON_MAJMIN}
> -       fi
> -       install -d ${D}${bindir}/${PN}
> -       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> -
> -       # Make sure we use /usr/bin/env python
> -       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python
> ${D}${bindir}/${PN}`; do
> -               sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> -       done
> -
> -        # Add a symlink to the native Python so that scripts can just
> invoke
> -        # "nativepython" and get the right one without needing absolute
> paths
> -        # (these often end up too long for the #! parser in the kernel as
> the
> -        # buffer is 128 bytes long).
> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> -}
> -
> -python(){
> -
> -    # Read JSON manifest
> -    import json
> -    pythondir = d.getVar('THISDIR',True)
> -    with open(pythondir+'/python3/python3-manifest.json') as
> manifest_file:
> -        python_manifest=json.load(manifest_file)
> -
> -    rprovides = d.getVar('RPROVIDES').split()
> -
> -    # Hardcoded since it cant be python3-native-foo, should be
> python3-foo-native
> -    pn = 'python3'
> -
> -    for key in python_manifest:
> -        pypackage = pn + '-' + key + '-native'
> -        if pypackage not in rprovides:
> -              rprovides.append(pypackage)
> -
> -    d.setVar('RPROVIDES', ' '.join(rprovides))
> -}
> diff --git a/meta/recipes-devtools/python/python3-native_3.7.1.bb
> b/meta/recipes-devtools/python/python3-native_3.7.1.bb
> new file mode 100644
> index 0000000000..3ef9f0a5e3
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-native_3.7.1.bb
> @@ -0,0 +1,73 @@
> +require recipes-devtools/python/python3.inc
> +
> +SRC_URI += "\
> +    file://12-distutils-prefix-is-inside-staging-area.patch \
> +
> file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> +"
> +
> +EXTRANATIVEPATH += "bzip2-native"
> +DEPENDS = "openssl-native libffi-native bzip2-replacement-native
> zlib-native \
> +           util-linux-native readline-native sqlite3-native gdbm-native \
> +"
> +
> +inherit native
> +
> +EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
> +
> +EXTRA_OEMAKE = '\
> +  LIBC="" \
> +  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
> +  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
> +  LIB=${baselib} \
> +  ARCH=${TARGET_ARCH} \
> +'
> +
> +# Regenerate all of the generated files
> +# This ensures that pgen and friends get created during the compile phase
> +#
> +do_compile_prepend() {
> +    # Assuming https://bugs.python.org/issue33080 has been addressed in
> Makefile.
> +    oe_runmake regen-all
> +}
> +
> +do_install() {
> +       install -d ${D}${libdir}/pkgconfig
> +       oe_runmake 'DESTDIR=${D}' install
> +       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +               install -m 0644 ${WORKDIR}/sitecustomize.py
> ${D}/${libdir}/python${PYTHON_MAJMIN}
> +       fi
> +       install -d ${D}${bindir}/${PN}
> +       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> +
> +       # Make sure we use /usr/bin/env python
> +       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python
> ${D}${bindir}/${PN}`; do
> +               sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> +       done
> +
> +        # Add a symlink to the native Python so that scripts can just
> invoke
> +        # "nativepython" and get the right one without needing absolute
> paths
> +        # (these often end up too long for the #! parser in the kernel as
> the
> +        # buffer is 128 bytes long).
> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +}
> +
> +python(){
> +
> +    # Read JSON manifest
> +    import json
> +    pythondir = d.getVar('THISDIR',True)
> +    with open(pythondir+'/python3/python3-manifest.json') as
> manifest_file:
> +        python_manifest=json.load(manifest_file)
> +
> +    rprovides = d.getVar('RPROVIDES').split()
> +
> +    # Hardcoded since it cant be python3-native-foo, should be
> python3-foo-native
> +    pn = 'python3'
> +
> +    for key in python_manifest:
> +        pypackage = pn + '-' + key + '-native'
> +        if pypackage not in rprovides:
> +              rprovides.append(pypackage)
> +
> +    d.setVar('RPROVIDES', ' '.join(rprovides))
> +}
> diff --git a/meta/recipes-devtools/python/python3.inc
> b/meta/recipes-devtools/python/python3.inc
> index f565b3f171..7ad11d3d1d 100644
> --- a/meta/recipes-devtools/python/python3.inc
> +++ b/meta/recipes-devtools/python/python3.inc
> @@ -3,41 +3,74 @@ HOMEPAGE = "http://www.python.org"
>  LICENSE = "PSFv2"
>  SECTION = "devel/python"
>
> -# TODO Remove this when we upgrade
> -INC_PR = "r1"
> -PR = "${INC_PR}.0"
> +PYTHON_MAJMIN = "3.7"
> +DISTRO_SRC_URI ?= "file://sitecustomize.py"
> +DISTRO_SRC_URI_linuxstdbase = ""
> +SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> +    file://python-config.patch \
> +    file://python-3.3-multilib.patch \
> +    file://03-fix-tkinter-detection.patch \
> +    file://avoid_warning_about_tkinter.patch \
> +    file://uuid_when_cross_compiling.patch \
> +    file://unixccompiler.patch \
> +    file://sysroot-include-headers.patch \
> +    file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> +    file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> +    file://030-fixup-include-dirs.patch \
> +    file://070-dont-clean-ipkg-install.patch \
> +    file://080-distutils-dont_adjust_files.patch \
> +    file://130-readline-setup.patch \
> +
> file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> +    ${DISTRO_SRC_URI} \
> +    file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
> +"
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
> +SRC_URI[md5sum] = "0a57e9022c07fad3dadb2eef58568edb"
> +SRC_URI[sha256sum] =
> "fa7e2b8e8c9402f192ad56dc4f814089d1c4466c97d780f5e5acc02c04243d6d"
>
> -# TODO consolidate patch set
> -SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
> -SRC_URI[sha256sum] =
> "f55cde04f521f273c7cba08912921cc5642cfc15ca7b22d5829f0aff4371155f"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>
> -CVE_PRODUCT = "python"
> -
> -PYTHON_MAJMIN = "3.5"
> -PYTHON_BINABI = "${PYTHON_MAJMIN}m"
> -
>  S = "${WORKDIR}/Python-${PV}"
>
> -inherit autotools bluetooth pkgconfig
> +CVE_PRODUCT = "python"
> +
> +inherit autotools bluetooth pkgconfig python3-dir
>
>  EXTRA_OECONF = "\
> -  --with-threads \
>    --with-pymalloc \
>    --without-cxx-main \
> -  --with-signal-module \
>    --enable-shared \
>    --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes',
> 'no', d)} \
>  "
>
>  PACKAGECONFIG[bluetooth] = ",ac_cv_header_bluetooth_bluetooth_h=no
> ac_cv_header_bluetooth_h=no,${BLUEZ}"
>
> +do_configure_prepend() {
> +       libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
> +       sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
> +               ${S}/configure.ac
> +}
> +
> +do_install_prepend() {
> +       MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed
> -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
> +       eval ${MAKESETTINGS}
> +       if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
> +           die "do_install: configure determined ABIFLAGS '${ABIFLAGS}'
> != '${PYTHON_ABI}' from python3-dir.bbclass"
> +       fi
> +       if test "x${BUILD_OS}" = "x${TARGET_OS}"; then
> +               # no cross-compile at all
> +
>  _PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
> +       else
> +               # at the very moment, it's the only available target
> +               _PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_linux_${MULTIARCH}
> +       fi
> +}
> +
>  do_install_append () {
>         sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
>                 -e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
> -               ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
> +
>  ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py
>  }
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> index 8ea3f03fe0..aac34533ef 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> @@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 236f005..5c4337f 100644
> +index 31b4bcabb3..7da6d6941e 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
> +@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
>         sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," <
> $(srcdir)/Misc/python-config.in >python-config.py
> -       # Replace makefile compat. variable references with shell script
> compat. ones; $(VAR) -> ${VAR}
> +       @ # Replace makefile compat. variable references with shell script
> compat. ones; $(VAR) -> ${VAR}
>         LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' <
> Misc/python-config.sh >python-config
> --      # On Darwin, always use the python version of the script, the shell
> --      # version doesn't use the compiler customizations that are provided
> --      # in python (_osx_support.py).
> --      if test `uname -s` = Darwin; then \
> +-      @ # On Darwin, always use the python version of the script, the
> shell
> +-      @ # version doesn't use the compiler customizations that are
> provided
> +-      @ # in python (_osx_support.py).
> +-      @if test `uname -s` = Darwin; then \
>  -              cp python-config.py python-config; \
>  -      fi
> -+      # In OpenEmbedded, always use the python version of the script,
> the shell
> -+      # version is broken in multiple ways, and doesn't return correct
> directories
> ++      @ # In OpenEmbedded, always use the python version of the script,
> the shell
> ++      @ # version is broken in multiple ways, and doesn't return correct
> directories
>  +      cp python-config.py python-config
>
>
>   # Install the include files
> ---
> -2.11.0
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> deleted file mode 100644
> index d1c92e9eed..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
> -From: Libin Dang <libin.dang@windriver.com>
> -Date: Tue, 11 Apr 2017 14:12:15 +0800
> -Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
> - distutils.sysconfig
> -
> -Backport upstream commit
> -
> https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
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
> -@@ -424,38 +424,11 @@ _config_vars = None
> -
> - def _init_posix():
> -     """Initialize the module as appropriate for POSIX systems."""
> --    g = {}
> --    # load the installed Makefile:
> --    try:
> --        filename = get_makefile_filename()
> --        parse_makefile(filename, g)
> --    except OSError as msg:
> --        my_msg = "invalid Python installation: unable to open %s" %
> filename
> --        if hasattr(msg, "strerror"):
> --            my_msg = my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # load the installed pyconfig.h:
> --    try:
> --        filename = get_config_h_filename()
> --        with open(filename) as file:
> --            parse_config_h(file, g)
> --    except OSError as msg:
> --        my_msg = "invalid Python installation: unable to open %s" %
> filename
> --        if hasattr(msg, "strerror"):
> --            my_msg = my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # On AIX, there are wrong paths to the linker scripts in the Makefile
> --    # -- these paths are relative to the Python source, but when
> installed
> --    # the scripts are in another directory.
> --    if python_build:
> --        g['LDSHARED'] = g['BLDSHARED']
> --
> -+    # _sysconfigdata is generated at build time, see the sysconfig module
> -+    from _sysconfigdata import build_time_vars
> -     global _config_vars
> --    _config_vars = g
> -+    _config_vars = {}
> -+    _config_vars.update(build_time_vars)
> -
> -
> - def _init_nt():
> ---
> -1.8.3.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
> b/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
> deleted file mode 100644
> index 321b4afa12..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
> +++ /dev/null
> @@ -1,272 +0,0 @@
> -From 758e7463c104f71b810c8588166747eeab6148d7 Mon Sep 17 00:00:00 2001
> -From: Christian Heimes <christian@python.org>
> -Date: Sat, 10 Sep 2016 22:43:48 +0200
> -Subject: [PATCH 1/4] Issue 28043: SSLContext has improved default settings
> -
> -The options OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE,
> OP_SINGLE_DH_USE, OP_SINGLE_ECDH_USE, OP_NO_SSLv2 (except for
> PROTOCOL_SSLv2), and OP_NO_SSLv3 (except for PROTOCOL_SSLv3) are set by
> default. The initial cipher suite list contains only HIGH ciphers, no NULL
> ciphers and MD5 ciphers (except for PROTOCOL_SSLv2).
> -
> -Upstream-Status: Backport
> -[
> https://github.com/python/cpython/commit/358cfd426ccc0fcd6a7940d306602138e76420ae
> ]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Doc/library/ssl.rst  |  9 ++++++-
> - Lib/ssl.py           | 30 +++++----------------
> - Lib/test/test_ssl.py | 62 +++++++++++++++++++++++---------------------
> - Modules/_ssl.c       | 31 ++++++++++++++++++++++
> - 4 files changed, 78 insertions(+), 54 deletions(-)
> -
> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> -index a2f008346b..14f2d68217 100644
> ---- a/Doc/library/ssl.rst
> -+++ b/Doc/library/ssl.rst
> -@@ -1151,7 +1151,14 @@ to speed up repeated connections from the same
> clients.
> -
> -    .. versionchanged:: 3.5.3
> -
> --      :data:`PROTOCOL_TLS` is the default value.
> -+      The context is created with secure default values. The options
> -+      :data:`OP_NO_COMPRESSION`, :data:`OP_CIPHER_SERVER_PREFERENCE`,
> -+      :data:`OP_SINGLE_DH_USE`, :data:`OP_SINGLE_ECDH_USE`,
> -+      :data:`OP_NO_SSLv2` (except for :data:`PROTOCOL_SSLv2`),
> -+      and :data:`OP_NO_SSLv3` (except for :data:`PROTOCOL_SSLv3`) are
> -+      set by default. The initial cipher suite list contains only
> ``HIGH``
> -+      ciphers, no ``NULL`` ciphers and no ``MD5`` ciphers (except for
> -+      :data:`PROTOCOL_SSLv2`).
> -
> -
> - :class:`SSLContext` objects have the following methods and attributes:
> -diff --git a/Lib/ssl.py b/Lib/ssl.py
> -index e1913904f3..4d302a78fa 100644
> ---- a/Lib/ssl.py
> -+++ b/Lib/ssl.py
> -@@ -446,32 +446,16 @@ def
> create_default_context(purpose=Purpose.SERVER_AUTH, *, cafile=None,
> -     if not isinstance(purpose, _ASN1Object):
> -         raise TypeError(purpose)
> -
> -+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
> -+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and
> OP_SINGLE_ECDH_USE
> -+    # by default.
> -     context = SSLContext(PROTOCOL_TLS)
> -
> --    # SSLv2 considered harmful.
> --    context.options |= OP_NO_SSLv2
> --
> --    # SSLv3 has problematic security and is only required for really old
> --    # clients such as IE6 on Windows XP
> --    context.options |= OP_NO_SSLv3
> --
> --    # disable compression to prevent CRIME attacks (OpenSSL 1.0+)
> --    context.options |= getattr(_ssl, "OP_NO_COMPRESSION", 0)
> --
> -     if purpose == Purpose.SERVER_AUTH:
> -         # verify certs and host name in client mode
> -         context.verify_mode = CERT_REQUIRED
> -         context.check_hostname = True
> -     elif purpose == Purpose.CLIENT_AUTH:
> --        # Prefer the server's ciphers by default so that we get stronger
> --        # encryption
> --        context.options |= getattr(_ssl, "OP_CIPHER_SERVER_PREFERENCE",
> 0)
> --
> --        # Use single use keys in order to improve forward secrecy
> --        context.options |= getattr(_ssl, "OP_SINGLE_DH_USE", 0)
> --        context.options |= getattr(_ssl, "OP_SINGLE_ECDH_USE", 0)
> --
> --        # disallow ciphers with known vulnerabilities
> -         context.set_ciphers(_RESTRICTED_SERVER_CIPHERS)
> -
> -     if cafile or capath or cadata:
> -@@ -497,12 +481,10 @@ def
> _create_unverified_context(protocol=PROTOCOL_TLS, *, cert_reqs=None,
> -     if not isinstance(purpose, _ASN1Object):
> -         raise TypeError(purpose)
> -
> -+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
> -+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and
> OP_SINGLE_ECDH_USE
> -+    # by default.
> -     context = SSLContext(protocol)
> --    # SSLv2 considered harmful.
> --    context.options |= OP_NO_SSLv2
> --    # SSLv3 has problematic security and is only required for really old
> --    # clients such as IE6 on Windows XP
> --    context.options |= OP_NO_SSLv3
> -
> -     if cert_reqs is not None:
> -         context.verify_mode = cert_reqs
> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> -index ffb7314f57..f91af7bd05 100644
> ---- a/Lib/test/test_ssl.py
> -+++ b/Lib/test/test_ssl.py
> -@@ -73,6 +73,12 @@ NULLBYTECERT = data_file("nullbytecert.pem")
> - DHFILE = data_file("dh1024.pem")
> - BYTES_DHFILE = os.fsencode(DHFILE)
> -
> -+# Not defined in all versions of OpenSSL
> -+OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
> -+OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
> -+OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
> -+OP_CIPHER_SERVER_PREFERENCE = getattr(ssl,
> "OP_CIPHER_SERVER_PREFERENCE", 0)
> -+
> -
> - def handle_error(prefix):
> -     exc_format = ' '.join(traceback.format_exception(*sys.exc_info()))
> -@@ -839,8 +845,9 @@ class ContextTests(unittest.TestCase):
> -         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
> -         # OP_ALL | OP_NO_SSLv2 | OP_NO_SSLv3 is the default value
> -         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
> --        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 0):
> --            default |= ssl.OP_NO_COMPRESSION
> -+        # SSLContext also enables these by default
> -+        default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
> -+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
> -         self.assertEqual(default, ctx.options)
> -         ctx.options |= ssl.OP_NO_TLSv1
> -         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
> -@@ -1205,16 +1212,29 @@ class ContextTests(unittest.TestCase):
> -             stats["x509"] += 1
> -             self.assertEqual(ctx.cert_store_stats(), stats)
> -
> -+    def _assert_context_options(self, ctx):
> -+        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> -+        if OP_NO_COMPRESSION != 0:
> -+            self.assertEqual(ctx.options & OP_NO_COMPRESSION,
> -+                             OP_NO_COMPRESSION)
> -+        if OP_SINGLE_DH_USE != 0:
> -+            self.assertEqual(ctx.options & OP_SINGLE_DH_USE,
> -+                             OP_SINGLE_DH_USE)
> -+        if OP_SINGLE_ECDH_USE != 0:
> -+            self.assertEqual(ctx.options & OP_SINGLE_ECDH_USE,
> -+                             OP_SINGLE_ECDH_USE)
> -+        if OP_CIPHER_SERVER_PREFERENCE != 0:
> -+            self.assertEqual(ctx.options & OP_CIPHER_SERVER_PREFERENCE,
> -+                             OP_CIPHER_SERVER_PREFERENCE)
> -+
> -     def test_create_default_context(self):
> -         ctx = ssl.create_default_context()
> -+
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
> -         self.assertTrue(ctx.check_hostname)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> --        self.assertEqual(
> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
> --        )
> -+        self._assert_context_options(ctx)
> -+
> -
> -         with open(SIGNING_CA) as f:
> -             cadata = f.read()
> -@@ -1222,40 +1242,24 @@ class ContextTests(unittest.TestCase):
> -                                          cadata=cadata)
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> --        self.assertEqual(
> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
> --        )
> -+        self._assert_context_options(ctx)
> -
> -         ctx = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> --        self.assertEqual(
> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
> --        )
> --        self.assertEqual(
> --            ctx.options & getattr(ssl, "OP_SINGLE_DH_USE", 0),
> --            getattr(ssl, "OP_SINGLE_DH_USE", 0),
> --        )
> --        self.assertEqual(
> --            ctx.options & getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
> --            getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
> --        )
> -+        self._assert_context_options(ctx)
> -
> -     def test__create_stdlib_context(self):
> -         ctx = ssl._create_stdlib_context()
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> -         self.assertFalse(ctx.check_hostname)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> -+        self._assert_context_options(ctx)
> -
> -         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> -+        self._assert_context_options(ctx)
> -
> -         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1,
> -                                          cert_reqs=ssl.CERT_REQUIRED,
> -@@ -1263,12 +1267,12 @@ class ContextTests(unittest.TestCase):
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
> -         self.assertTrue(ctx.check_hostname)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> -+        self._assert_context_options(ctx)
> -
> -         ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
> -+        self._assert_context_options(ctx)
> -
> -     def test_check_hostname(self):
> -         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> -index 86482677ae..0d5c121d2c 100644
> ---- a/Modules/_ssl.c
> -+++ b/Modules/_ssl.c
> -@@ -2330,6 +2330,7 @@ _ssl__SSLContext_impl(PyTypeObject *type, int
> proto_version)
> -     PySSLContext *self;
> -     long options;
> -     SSL_CTX *ctx = NULL;
> -+    int result;
> - #if defined(SSL_MODE_RELEASE_BUFFERS)
> -     unsigned long libver;
> - #endif
> -@@ -2393,8 +2394,38 @@ _ssl__SSLContext_impl(PyTypeObject *type, int
> proto_version)
> -         options |= SSL_OP_NO_SSLv2;
> -     if (proto_version != PY_SSL_VERSION_SSL3)
> -         options |= SSL_OP_NO_SSLv3;
> -+    /* Minimal security flags for server and client side context.
> -+     * Client sockets ignore server-side parameters. */
> -+#ifdef SSL_OP_NO_COMPRESSION
> -+    options |= SSL_OP_NO_COMPRESSION;
> -+#endif
> -+#ifdef SSL_OP_CIPHER_SERVER_PREFERENCE
> -+    options |= SSL_OP_CIPHER_SERVER_PREFERENCE;
> -+#endif
> -+#ifdef SSL_OP_SINGLE_DH_USE
> -+    options |= SSL_OP_SINGLE_DH_USE;
> -+#endif
> -+#ifdef SSL_OP_SINGLE_ECDH_USE
> -+    options |= SSL_OP_SINGLE_ECDH_USE;
> -+#endif
> -     SSL_CTX_set_options(self->ctx, options);
> -
> -+    /* A bare minimum cipher list without completly broken cipher suites.
> -+     * It's far from perfect but gives users a better head start. */
> -+    if (proto_version != PY_SSL_VERSION_SSL2) {
> -+        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL:!MD5");
> -+    } else {
> -+        /* SSLv2 needs MD5 */
> -+        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL");
> -+    }
> -+    if (result == 0) {
> -+        Py_DECREF(self);
> -+        ERR_clear_error();
> -+        PyErr_SetString(PySSLErrorObject,
> -+                        "No cipher can be selected.");
> -+        return NULL;
> -+    }
> -+
> - #if defined(SSL_MODE_RELEASE_BUFFERS)
> -     /* Set SSL_MODE_RELEASE_BUFFERS. This potentially greatly reduces
> memory
> -        usage for no cost at all. However, don't do this for OpenSSL
> versions
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
> b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
> deleted file mode 100644
> index 2b4ba316e4..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
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
> -@@ -469,13 +469,12 @@ profile-opt:
> -       $(MAKE) profile-removal
> -       $(MAKE) build_all_generate_profile
> -       $(MAKE) profile-removal
> --      @echo "Running code to generate profile data (this can take a
> while):"
> --      $(MAKE) run_profile_task
> --      $(MAKE) build_all_merge_profile
> -+
> -+clean_and_use_profile:
> -       @echo "Rebuilding with profile guided optimizations:"
> -       $(MAKE) clean
> -       $(MAKE) build_all_use_profile
> -       $(MAKE) profile-removal
> -
> - build_all_generate_profile:
> -       $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS)
> $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)
> @LTOFLAGS@" LIBS="$(LIBS)"
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
> b/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
> deleted file mode 100644
> index d48cad7586..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -From e950ea68dab006944af194c9910b8f2341d1437d Mon Sep 17 00:00:00 2001
> -From: Christian Heimes <christian@python.org>
> -Date: Thu, 7 Sep 2017 20:23:52 -0700
> -Subject: [PATCH] bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLSv1_3
> - (GH-1363) (#3444)
> -
> -* bpo-29136: Add TLS 1.3 support
> -
> -TLS 1.3 introduces a new, distinct set of cipher suites. The TLS 1.3
> -cipher suites don't overlap with cipher suites from TLS 1.2 and earlier.
> -Since Python sets its own set of permitted ciphers, TLS 1.3 handshake
> -will fail as soon as OpenSSL 1.1.1 is released. Let's enable the common
> -AES-GCM and ChaCha20 suites.
> -
> -Additionally the flag OP_NO_TLSv1_3 is added. It defaults to 0 (no op)
> with
> -OpenSSL prior to 1.1.1. This allows applications to opt-out from TLS 1.3
> -now.
> -
> -Signed-off-by: Christian Heimes <christian@python.org>.
> -(cherry picked from commit cb5b68abdeb1b1d56c581d5b4d647018703d61e3)
> -
> -Upstream-Status: Backport
> -[
> https://github.com/python/cpython/commit/cb5b68abdeb1b1d56c581d5b4d647018703d61e3
> ]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Doc/library/ssl.rst                           | 21 ++++++++++++++
> - Lib/ssl.py                                    |  7 +++++
> - Lib/test/test_ssl.py                          | 29 ++++++++++++++++++-
> - .../2017-09-04-16-39-49.bpo-29136.vSn1oR.rst  |  1 +
> - Modules/_ssl.c                                | 13 +++++++++
> - 5 files changed, 70 insertions(+), 1 deletion(-)
> - create mode 100644
> Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
> -
> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> -index 14f2d68217..29c5e94cf6 100644
> ---- a/Doc/library/ssl.rst
> -+++ b/Doc/library/ssl.rst
> -@@ -285,6 +285,11 @@ purposes.
> -
> -      3DES was dropped from the default cipher string.
> -
> -+   .. versionchanged:: 3.7
> -+
> -+     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256,
> TLS_AES_256_GCM_SHA384,
> -+     and TLS_CHACHA20_POLY1305_SHA256 were added to the default cipher
> string.
> -+
> -
> - Random generation
> - ^^^^^^^^^^^^^^^^^
> -@@ -719,6 +724,16 @@ Constants
> -
> -    .. versionadded:: 3.4
> -
> -+.. data:: OP_NO_TLSv1_3
> -+
> -+   Prevents a TLSv1.3 connection. This option is only applicable in
> conjunction
> -+   with :const:`PROTOCOL_TLS`. It prevents the peers from choosing
> TLSv1.3 as
> -+   the protocol version. TLS 1.3 is available with OpenSSL 1.1.1 or
> later.
> -+   When Python has been compiled against an older version of OpenSSL, the
> -+   flag defaults to *0*.
> -+
> -+   .. versionadded:: 3.7
> -+
> - .. data:: OP_CIPHER_SERVER_PREFERENCE
> -
> -    Use the server's cipher ordering preference, rather than the client's.
> -@@ -783,6 +798,12 @@ Constants
> -
> -    .. versionadded:: 3.3
> -
> -+.. data:: HAS_TLSv1_3
> -+
> -+   Whether the OpenSSL library has built-in support for the TLS 1.3
> protocol.
> -+
> -+   .. versionadded:: 3.7
> -+
> - .. data:: CHANNEL_BINDING_TYPES
> -
> -    List of supported TLS channel binding types.  Strings in this list
> -diff --git a/Lib/ssl.py b/Lib/ssl.py
> -index 4d302a78fa..f233e72e1f 100644
> ---- a/Lib/ssl.py
> -+++ b/Lib/ssl.py
> -@@ -122,6 +122,7 @@ _import_symbols('OP_')
> - _import_symbols('ALERT_DESCRIPTION_')
> - _import_symbols('SSL_ERROR_')
> - _import_symbols('VERIFY_')
> -+from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN, HAS_TLSv1_3
> -
> - from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN
> -
> -@@ -162,6 +163,7 @@ else:
> - # (OpenSSL's default setting is 'DEFAULT:!aNULL:!eNULL')
> - # Enable a better set of ciphers by default
> - # This list has been explicitly chosen to:
> -+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
> - #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
> - #   * Prefer ECDHE over DHE for better performance
> - #   * Prefer AEAD over CBC for better performance and security
> -@@ -173,6 +175,8 @@ else:
> - #   * Disable NULL authentication, NULL encryption, 3DES and MD5 MACs
> - #     for security reasons
> - _DEFAULT_CIPHERS = (
> -+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
> -+    'TLS13-AES-128-GCM-SHA256:'
> -
>  'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
> -     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
> -     '!aNULL:!eNULL:!MD5:!3DES'
> -@@ -180,6 +184,7 @@ _DEFAULT_CIPHERS = (
> -
> - # Restricted and more secure ciphers for the server side
> - # This list has been explicitly chosen to:
> -+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
> - #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
> - #   * Prefer ECDHE over DHE for better performance
> - #   * Prefer AEAD over CBC for better performance and security
> -@@ -190,6 +195,8 @@ _DEFAULT_CIPHERS = (
> - #   * Disable NULL authentication, NULL encryption, MD5 MACs, DSS, RC4,
> and
> - #     3DES for security reasons
> - _RESTRICTED_SERVER_CIPHERS = (
> -+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
> -+    'TLS13-AES-128-GCM-SHA256:'
> -
>  'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
> -     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
> -     '!aNULL:!eNULL:!MD5:!DSS:!RC4:!3DES'
> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> -index f91af7bd05..1acc12ec2d 100644
> ---- a/Lib/test/test_ssl.py
> -+++ b/Lib/test/test_ssl.py
> -@@ -150,6 +150,13 @@ class BasicSocketTests(unittest.TestCase):
> -             ssl.OP_NO_COMPRESSION
> -         self.assertIn(ssl.HAS_SNI, {True, False})
> -         self.assertIn(ssl.HAS_ECDH, {True, False})
> -+        ssl.OP_NO_SSLv2
> -+        ssl.OP_NO_SSLv3
> -+        ssl.OP_NO_TLSv1
> -+        ssl.OP_NO_TLSv1_3
> -+    if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
> -+            ssl.OP_NO_TLSv1_1
> -+            ssl.OP_NO_TLSv1_2
> -
> -     def test_str_for_enums(self):
> -         # Make sure that the PROTOCOL_* constants have enum-like string
> -@@ -3028,12 +3035,33 @@ else:
> -                     self.assertEqual(s.version(), 'TLSv1')
> -                 self.assertIs(s.version(), None)
> -
> -+        @unittest.skipUnless(ssl.HAS_TLSv1_3,
> -+                             "test requires TLSv1.3 enabled OpenSSL")
> -+        def test_tls1_3(self):
> -+            context = ssl.SSLContext(ssl.PROTOCOL_TLS)
> -+            context.load_cert_chain(CERTFILE)
> -+            # disable all but TLS 1.3
> -+            context.options |= (
> -+                ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2
> -+            )
> -+            with ThreadedEchoServer(context=context) as server:
> -+                with context.wrap_socket(socket.socket()) as s:
> -+                    s.connect((HOST, server.port))
> -+                    self.assertIn(s.cipher()[0], [
> -+                        'TLS13-AES-256-GCM-SHA384',
> -+                        'TLS13-CHACHA20-POLY1305-SHA256',
> -+                        'TLS13-AES-128-GCM-SHA256',
> -+                    ])
> -+
> -         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled
> OpenSSL")
> -         def test_default_ecdh_curve(self):
> -             # Issue #21015: elliptic curve-based Diffie Hellman key
> exchange
> -             # should be enabled by default on SSL contexts.
> -             context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
> -             context.load_cert_chain(CERTFILE)
> -+            # TLSv1.3 defaults to PFS key agreement and no longer has
> KEA in
> -+            # cipher name.
> -+            context.options |= ssl.OP_NO_TLSv1_3
> -             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enabled
> -             # explicitly using the 'ECCdraft' cipher alias.  Otherwise,
> -             # our default cipher list should prefer ECDH-based ciphers
> -@@ -3394,7 +3422,6 @@ else:
> -                         s.sendfile(file)
> -                         self.assertEqual(s.recv(1024), TEST_DATA)
> -
> --
> - def test_main(verbose=False):
> -     if support.verbose:
> -         import warnings
> -diff --git
> a/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
> b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
> -new file mode 100644
> -index 0000000000..e76997ef83
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
> -@@ -0,0 +1 @@
> -+Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.
> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> -index 0d5c121d2c..c71d89607c 100644
> ---- a/Modules/_ssl.c
> -+++ b/Modules/_ssl.c
> -@@ -4842,6 +4842,11 @@ PyInit__ssl(void)
> - #if HAVE_TLSv1_2
> -     PyModule_AddIntConstant(m, "OP_NO_TLSv1_1", SSL_OP_NO_TLSv1_1);
> -     PyModule_AddIntConstant(m, "OP_NO_TLSv1_2", SSL_OP_NO_TLSv1_2);
> -+#endif
> -+#ifdef SSL_OP_NO_TLSv1_3
> -+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", SSL_OP_NO_TLSv1_3);
> -+#else
> -+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", 0);
> - #endif
> -     PyModule_AddIntConstant(m, "OP_CIPHER_SERVER_PREFERENCE",
> -                             SSL_OP_CIPHER_SERVER_PREFERENCE);
> -@@ -4890,6 +4895,14 @@ PyInit__ssl(void)
> -     Py_INCREF(r);
> -     PyModule_AddObject(m, "HAS_ALPN", r);
> -
> -+#if defined(TLS1_3_VERSION) && !defined(OPENSSL_NO_TLS1_3)
> -+    r = Py_True;
> -+#else
> -+    r = Py_False;
> -+#endif
> -+    Py_INCREF(r);
> -+    PyModule_AddObject(m, "HAS_TLSv1_3", r);
> -+
> -     /* Mappings for error codes */
> -     err_codes_to_names = PyDict_New();
> -     err_names_to_codes = PyDict_New();
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
> b/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
> deleted file mode 100644
> index 56d591d1b5..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
> +++ /dev/null
> @@ -1,173 +0,0 @@
> -From 170a614904febd14ff6cfd7a75c9bccc114b3948 Mon Sep 17 00:00:00 2001
> -From: Christian Heimes <christian@python.org>
> -Date: Tue, 14 Aug 2018 16:56:32 +0200
> -Subject: [PATCH] bpo-32947: Fixes for TLS 1.3 and OpenSSL 1.1.1 (GH-8761)
> -
> -Backport of TLS 1.3 related fixes from 3.7.
> -
> -Misc fixes and workarounds for compatibility with OpenSSL 1.1.1 from git
> -master and TLS 1.3 support. With OpenSSL 1.1.1, Python negotiates TLS 1.3
> by
> -default. Some test cases only apply to TLS 1.2.
> -
> -OpenSSL 1.1.1 has added a new option OP_ENABLE_MIDDLEBOX_COMPAT for TLS
> -1.3. The feature is enabled by default for maximum compatibility with
> -broken middle boxes. Users should be able to disable the hack and
> CPython's test suite needs
> -it to verify default options
> -
> -Signed-off-by: Christian Heimes <christian@python.org>
> -
> -Upstream-Status: Backport
> -[
> https://github.com/python/cpython/commit/2a4ee8aa01d61b6a9c8e9c65c211e61bdb471826
> ]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Doc/library/ssl.rst                           |  9 ++++++
> - Lib/test/test_asyncio/test_events.py          |  6 +++-
> - Lib/test/test_ssl.py                          | 29 +++++++++++++++----
> - .../2018-08-14-08-57-01.bpo-32947.mqStVW.rst  |  2 ++
> - Modules/_ssl.c                                |  4 +++
> - 5 files changed, 44 insertions(+), 6 deletions(-)
> - create mode 100644
> Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
> -
> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> -index 29c5e94cf6..f63a3deec5 100644
> ---- a/Doc/library/ssl.rst
> -+++ b/Doc/library/ssl.rst
> -@@ -757,6 +757,15 @@ Constants
> -
> -    .. versionadded:: 3.3
> -
> -+.. data:: OP_ENABLE_MIDDLEBOX_COMPAT
> -+
> -+   Send dummy Change Cipher Spec (CCS) messages in TLS 1.3 handshake to
> make
> -+   a TLS 1.3 connection look more like a TLS 1.2 connection.
> -+
> -+   This option is only available with OpenSSL 1.1.1 and later.
> -+
> -+   .. versionadded:: 3.6.7
> -+
> - .. data:: OP_NO_COMPRESSION
> -
> -    Disable compression on the SSL channel.  This is useful if the
> application
> -diff --git a/Lib/test/test_asyncio/test_events.py
> b/Lib/test/test_asyncio/test_events.py
> -index 492a84a231..6f208474b9 100644
> ---- a/Lib/test/test_asyncio/test_events.py
> -+++ b/Lib/test/test_asyncio/test_events.py
> -@@ -1169,7 +1169,11 @@ class EventLoopTestsMixin:
> -                     self.loop.run_until_complete(f_c)
> -
> -         # close connection
> --        proto.transport.close()
> -+        # transport may be None with TLS 1.3, because connection is
> -+        # interrupted, server is unable to send session tickets, and
> -+        # transport is closed.
> -+        if proto.transport is not None:
> -+            proto.transport.close()
> -         server.close()
> -
> -     def test_legacy_create_server_ssl_match_failed(self):
> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> -index 1acc12ec2d..a2e1d32a62 100644
> ---- a/Lib/test/test_ssl.py
> -+++ b/Lib/test/test_ssl.py
> -@@ -78,6 +78,7 @@ OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
> - OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
> - OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
> - OP_CIPHER_SERVER_PREFERENCE = getattr(ssl,
> "OP_CIPHER_SERVER_PREFERENCE", 0)
> -+OP_ENABLE_MIDDLEBOX_COMPAT = getattr(ssl, "OP_ENABLE_MIDDLEBOX_COMPAT",
> 0)
> -
> -
> - def handle_error(prefix):
> -@@ -155,8 +156,8 @@ class BasicSocketTests(unittest.TestCase):
> -         ssl.OP_NO_TLSv1
> -         ssl.OP_NO_TLSv1_3
> -     if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
> --            ssl.OP_NO_TLSv1_1
> --            ssl.OP_NO_TLSv1_2
> -+        ssl.OP_NO_TLSv1_1
> -+        ssl.OP_NO_TLSv1_2
> -
> -     def test_str_for_enums(self):
> -         # Make sure that the PROTOCOL_* constants have enum-like string
> -@@ -854,7 +855,8 @@ class ContextTests(unittest.TestCase):
> -         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
> -         # SSLContext also enables these by default
> -         default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
> --                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
> -+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE |
> -+                    OP_ENABLE_MIDDLEBOX_COMPAT)
> -         self.assertEqual(default, ctx.options)
> -         ctx.options |= ssl.OP_NO_TLSv1
> -         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
> -@@ -1860,11 +1862,26 @@ else:
> -                         self.sock, server_side=True)
> -
>  self.server.selected_npn_protocols.append(self.sslconn.selected_npn_protocol())
> -
>  self.server.selected_alpn_protocols.append(self.sslconn.selected_alpn_protocol())
> --                except (ssl.SSLError, ConnectionResetError) as e:
> -+                except (ConnectionResetError, BrokenPipeError) as e:
> -                     # We treat ConnectionResetError as though it were an
> -                     # SSLError - OpenSSL on Ubuntu abruptly closes the
> -                     # connection when asked to use an unsupported
> protocol.
> -                     #
> -+                    # BrokenPipeError is raised in TLS 1.3 mode, when
> OpenSSL
> -+                    # tries to send session tickets after handshake.
> -+                    # https://github.com/openssl/openssl/issues/6342
> -+                    self.server.conn_errors.append(str(e))
> -+                    if self.server.chatty:
> -+                        handle_error(
> -+                            "\n server:  bad connection attempt from " +
> repr(
> -+                                self.addr) + ":\n")
> -+                    self.running = False
> -+                    self.close()
> -+                    return False
> -+                except (ssl.SSLError, OSError) as e:
> -+                    # OSError may occur with wrong protocols, e.g. both
> -+                    # sides use PROTOCOL_TLS_SERVER.
> -+                    #
> -                     # XXX Various errors can have happened here, for
> example
> -                     # a mismatching protocol version, an invalid
> certificate,
> -                     # or a low-level bug. This should be made more
> discriminating.
> -@@ -2974,7 +2991,7 @@ else:
> -                 # Block on the accept and wait on the connection to
> close.
> -                 evt.set()
> -                 remote, peer = server.accept()
> --                remote.recv(1)
> -+                remote.send(remote.recv(4))
> -
> -             t = threading.Thread(target=serve)
> -             t.start()
> -@@ -2982,6 +2999,8 @@ else:
> -             evt.wait()
> -             client = context.wrap_socket(socket.socket())
> -             client.connect((host, port))
> -+            client.send(b'data')
> -+            client.recv()
> -             client_addr = client.getsockname()
> -             client.close()
> -             t.join()
> -diff --git
> a/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
> b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
> -new file mode 100644
> -index 0000000000..28de360c36
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
> -@@ -0,0 +1,2 @@
> -+Add OP_ENABLE_MIDDLEBOX_COMPAT and test workaround for TLSv1.3 for future
> -+compatibility with OpenSSL 1.1.1.
> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
> -index c71d89607c..eb123a87ba 100644
> ---- a/Modules/_ssl.c
> -+++ b/Modules/_ssl.c
> -@@ -4858,6 +4858,10 @@ PyInit__ssl(void)
> -     PyModule_AddIntConstant(m, "OP_NO_COMPRESSION",
> -                             SSL_OP_NO_COMPRESSION);
> - #endif
> -+#ifdef SSL_OP_ENABLE_MIDDLEBOX_COMPAT
> -+    PyModule_AddIntConstant(m, "OP_ENABLE_MIDDLEBOX_COMPAT",
> -+                            SSL_OP_ENABLE_MIDDLEBOX_COMPAT);
> -+#endif
> -
> - #if HAVE_SNI
> -     r = Py_True;
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
> b/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
> deleted file mode 100644
> index b97d5501e1..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 0c9354362bfa5f90fbea8ff8237a1f1f5dba686f Mon Sep 17 00:00:00 2001
> -From: Christian Heimes <christian@python.org>
> -Date: Wed, 12 Sep 2018 15:20:31 +0800
> -Subject: [PATCH] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)
> -
> -Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
> -1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
> -default.
> -
> -Also update multissltests and Travis config to test with latest OpenSSL.
> -
> -Signed-off-by: Christian Heimes <christian@python.org>
> -(cherry picked from commit e8eb6cb7920ded66abc5d284319a8539bdc2bae3)
> -
> -Co-authored-by: Christian Heimes <christian@python.org
> -
> -Upstream-Status: Backport
> -[
> https://github.com/python/cpython/commit/3e630c541b35c96bfe5619165255e559f577ee71
> ]
> -
> -Tweaked patch to not take changes for multissltests and Travis config.
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Lib/test/test_ssl.py | 51 ++++++++++++++++++++++----------------------
> - 1 file changed, 26 insertions(+), 25 deletions(-)
> -
> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> -index a2e1d32a62..c484ead5ff 100644
> ---- a/Lib/test/test_ssl.py
> -+++ b/Lib/test/test_ssl.py
> -@@ -3024,17 +3024,21 @@ else:
> -                     sock.do_handshake()
> -                 self.assertEqual(cm.exception.errno, errno.ENOTCONN)
> -
> --        def test_default_ciphers(self):
> --            context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
> --            try:
> --                # Force a set of weak ciphers on our client context
> --                context.set_ciphers("DES")
> --            except ssl.SSLError:
> --                self.skipTest("no DES cipher available")
> --            with ThreadedEchoServer(CERTFILE,
> --                                    ssl_version=ssl.PROTOCOL_SSLv23,
> --                                    chatty=False) as server:
> --                with context.wrap_socket(socket.socket()) as s:
> -+        def test_no_shared_ciphers(self):
> -+            server_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
> -+            server_context.load_cert_chain(SIGNED_CERTFILE)
> -+            client_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
> -+            client_context.verify_mode = ssl.CERT_REQUIRED
> -+            client_context.check_hostname = True
> -+
> -+            client_context.set_ciphers("AES128")
> -+            server_context.set_ciphers("AES256")
> -+            # OpenSSL enables all TLS 1.3 ciphers, enforce TLS 1.2 for
> test
> -+            client_context.options |= ssl.OP_NO_TLSv1_3
> -+            with ThreadedEchoServer(context=server_context) as server:
> -+                with client_context.wrap_socket(
> -+                        socket.socket(),
> -+                        server_hostname="localhost") as s:
> -                     with self.assertRaises(OSError):
> -                         s.connect((HOST, server.port))
> -             self.assertIn("no shared cipher", str(server.conn_errors[0]))
> -@@ -3067,9 +3071,9 @@ else:
> -                 with context.wrap_socket(socket.socket()) as s:
> -                     s.connect((HOST, server.port))
> -                     self.assertIn(s.cipher()[0], [
> --                        'TLS13-AES-256-GCM-SHA384',
> --                        'TLS13-CHACHA20-POLY1305-SHA256',
> --                        'TLS13-AES-128-GCM-SHA256',
> -+                        'TLS_AES_256_GCM_SHA384',
> -+                        'TLS_CHACHA20_POLY1305_SHA256',
> -+                        'TLS_AES_128_GCM_SHA256',
> -                     ])
> -
> -         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled
> OpenSSL")
> -@@ -3391,22 +3395,19 @@ else:
> -             client_context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
> -             client_context.verify_mode = ssl.CERT_REQUIRED
> -             client_context.load_verify_locations(SIGNING_CA)
> --            if ssl.OPENSSL_VERSION_INFO >= (1, 0, 2):
> --                client_context.set_ciphers("AES128:AES256")
> --                server_context.set_ciphers("AES256")
> --                alg1 = "AES256"
> --                alg2 = "AES-256"
> --            else:
> --                client_context.set_ciphers("AES:3DES")
> --                server_context.set_ciphers("3DES")
> --                alg1 = "3DES"
> --                alg2 = "DES-CBC3"
> -+            client_context.set_ciphers("AES128:AES256")
> -+            server_context.set_ciphers("AES256")
> -+            expected_algs = [
> -+                "AES256", "AES-256",
> -+                 # TLS 1.3 ciphers are always enabled
> -+                 "TLS_CHACHA20", "TLS_AES",
> -+            ]
> -
> -             stats = server_params_test(client_context, server_context)
> -             ciphers = stats['server_shared_ciphers'][0]
> -             self.assertGreater(len(ciphers), 0)
> -             for name, tls_version, bits in ciphers:
> --                if not alg1 in name.split("-") and alg2 not in name:
> -+                if not any (alg in name for alg in expected_algs):
> -                     self.fail(name)
> -
> -         def test_read_write_after_close_raises_valuerror(self):
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
> b/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
> deleted file mode 100644
> index d609847204..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 7b40cb7293cb14e5c7c8ed123efaf9acb33edae2 Mon Sep 17 00:00:00 2001
> -From: Christian Heimes <christian@python.org>
> -Date: Tue, 15 Aug 2017 10:33:43 +0200
> -Subject: [PATCH] bpo-30714: ALPN changes for OpenSSL 1.1.0f (#2305)
> -
> -OpenSSL 1.1.0 to 1.1.0e aborted the handshake when server and client
> -could not agree on a protocol using ALPN. OpenSSL 1.1.0f changed that.
> -The most recent version now behaves like OpenSSL 1.0.2 again. The ALPN
> -callback can pretend to not been set.
> -
> -See https://github.com/openssl/openssl/pull/3158 for more details
> -
> -Signed-off-by: Christian Heimes <christian@python.org>
> -
> -Upstream-Status: Backport
> -[
> https://github.com/python/cpython/commit/7b40cb7293cb14e5c7c8ed123efaf9acb33edae2
> ]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Doc/library/ssl.rst                                          | 5 +++--
> - Lib/test/test_ssl.py                                         | 5 +++--
> - .../next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst      | 2 ++
> - 3 files changed, 8 insertions(+), 4 deletions(-)
> - create mode 100644
> Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
> -
> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
> -index 729a239a1b..0a09e7e9d4 100644
> ---- a/Doc/library/ssl.rst
> -+++ b/Doc/library/ssl.rst
> -@@ -1447,8 +1447,9 @@ to speed up repeated connections from the same
> clients.
> -    This method will raise :exc:`NotImplementedError` if :data:`HAS_ALPN`
> is
> -    False.
> -
> --   OpenSSL 1.1.0+ will abort the handshake and raise :exc:`SSLError` when
> --   both sides support ALPN but cannot agree on a protocol.
> -+   OpenSSL 1.1.0 to 1.1.0e will abort the handshake and raise
> :exc:`SSLError`
> -+   when both sides support ALPN but cannot agree on a protocol. 1.1.0f+
> -+   behaves like 1.0.2, :meth:`SSLSocket.selected_alpn_protocol` returns
> None.
> -
> -    .. versionadded:: 3.5
> -
> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
> -index d960d82065..104b7f377a 100644
> ---- a/Lib/test/test_ssl.py
> -+++ b/Lib/test/test_ssl.py
> -@@ -3268,8 +3268,9 @@ if _have_threads:
> -                 except ssl.SSLError as e:
> -                     stats = e
> -
> --                if expected is None and IS_OPENSSL_1_1:
> --                    # OpenSSL 1.1.0 raises handshake error
> -+                if (expected is None and IS_OPENSSL_1_1
> -+                        and ssl.OPENSSL_VERSION_INFO < (1, 1, 0, 6)):
> -+                    # OpenSSL 1.1.0 to 1.1.0e raises handshake error
> -                     self.assertIsInstance(stats, ssl.SSLError)
> -                 else:
> -                     msg = "failed trying %s (s) and %s (c).\n" \
> -diff --git
> a/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
> b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
> -new file mode 100644
> -index 0000000000..88394e585c
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
> -@@ -0,0 +1,2 @@
> -+Address ALPN callback changes for OpenSSL 1.1.0f. The latest version
> behaves
> -+like OpenSSL 1.0.2 and no longer aborts handshake.
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> index fddfd2b2f6..b916d04d05 100644
> --- a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> +++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> @@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]
>  # will not be found.
>  # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
>
> -Index: Python-3.3.0rc2/setup.py
> -===================================================================
> ---- Python-3.3.0rc2.orig/setup.py      2012-09-20 15:24:14.009124003 -0700
> -+++ Python-3.3.0rc2/setup.py   2012-09-20 15:25:08.449124963 -0700
> -@@ -1620,7 +1620,7 @@
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..7f0e4d1010 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):
>                   dotversion = dotversion[:-1] + '.' + dotversion[-1]
>               tcl_include_sub = []
>               tk_include_sub = []
> @@ -17,7 +17,7 @@ Index: Python-3.3.0rc2/setup.py
>                   tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
>                   tk_include_sub += [dir + os.sep + "tk" + dotversion]
>               tk_include_sub += tcl_include_sub
> -@@ -1639,22 +1639,6 @@
> +@@ -1822,22 +1822,6 @@ class PyBuildExt(build_ext):
>               if dir not in include_dirs:
>                   include_dirs.append(dir)
>
> diff --git
> a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
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
> --        if os.path.normpath(sys.base_prefix) != '/usr' \
> -+        if not cross_compiling and os.path.normpath(sys.base_prefix) !=
> '/usr' \
> -                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a
> framework
> -             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
> diff --git
> a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> index b96419a638..1bd6e56117 100644
> ---
> a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> +++
> b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> @@ -14,11 +14,11 @@ Upstream-Status: Inappropriate [Embedded-Specific]
>
>
>       def copy_scripts(self):
> --        """Copy each script listed in 'self.scripts'; if it's marked as a
> +-        r"""Copy each script listed in 'self.scripts'; if it's marked as
> a
>  -        Python script in the Unix way (first line matches
> 'first_line_re',
>  -        ie. starts with "\#!" and contains "python"), then adjust the
> first
>  -        line to refer to the current Python interpreter as we copy.
> -+        """Copy each script listed in 'self.scripts'
> ++        r"""Copy each script listed in 'self.scripts'
>           """
>           self.mkpath(self.build_dir)
>           outfiles = []
> diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
> b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
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
> -@@ -116,7 +116,7 @@ char *PyCursesVersion = "2.2";
> -     #defines many common symbols (such as "lines") which breaks the
> -     curses module in other ways.  So the code will just specify
> -     explicit prototypes here. */
> --extern int setupterm(char *,int,int *);
> -+//extern int setupterm(char *,int,int *);
> - #ifdef __sgi
> - #include <term.h>
> - #endif
> diff --git
> a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> index ae74ef531d..35b849e399 100644
> ---
> a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> +++
> b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
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
> @@ -16,41 +21,31 @@ Signed-off-by: Markus Lehtonen <
> markus.lehtonen@linux.intel.com>
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
> --      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS)
> $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)
> @LTOFLAGS@" LIBS="$(LIBS)"
> -+      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS)
> $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)
> @LTOFLAGS@" LIBS="$(LIBS)"
> +       $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS)
> $(PGO_PROF_GEN_FLAG)" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)"
> LIBS="$(LIBS)"
> ++      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS)
> $(PGO_PROF_GEN_FLAG)" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)"
> LIBS="$(LIBS)"
>
>   run_profile_task:
> -       : # FIXME: can't run for a cross build
> -@@ -488,7 +488,7 @@ build_all_merge_profile:
> -       $(LLVM_PROF_MERGER)
> -
> - build_all_use_profile:
> --      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS)
> $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
> -+      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS)
> $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
> +       @ # FIXME: can't run for a cross build
> +@@ -510,14 +511,14 @@ build_all_merge_profile:
> + profile-opt: profile-run-stamp
> +       @echo "Rebuilding with profile guided optimizations:"
> +       -rm -f profile-clean-stamp
> +-      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS)
> $(PGO_PROF_USE_FLAG)" LDFLAGS="$(LDFLAGS)"
> ++      $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS)
> $(PGO_PROF_USE_FLAG)" LDFLAGS="$(LDFLAGS)"
>
>   # Compile and run with gcov
>   .PHONY=coverage coverage-lcov coverage-report
> -diff --git a/setup.py b/setup.py
> -index add3346..65e83b1 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
> -         # compilers
> -         if compiler is not None:
> -             if cross_compiling:
> --                (ccshared,cflags) = (os.environ.get('CCSHARED') or '',
> os.environ.get('CFLAGS') or '')
> -+                (ccshared,cflags) = (os.environ.get('CCSHARED') or '',
> -+                                     (os.environ.get('CFLAGS') or '') +
> ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
> -             else:
> -                 (ccshared,cflags) =
> sysconfig.get_config_vars('CCSHARED','CFLAGS')
> -             args['compiler_so'] = compiler + ' ' + ccshared + ' ' +
> cflags
> ---
> -2.17.1
> -
> + coverage:
> +       @echo "Building with support for coverage checking:"
> +       $(MAKE) clean profile-removal
> +-      $(MAKE) @DEF_MAKE_RULE@ CFLAGS="$(CFLAGS) -O0 -pg -fprofile-arcs
> -ftest-coverage" LIBS="$(LIBS) -lgcov"
> ++      $(MAKE) @DEF_MAKE_RULE@ CFLAGS="$(CFLAGS) $(EXTRA_CFLAGS) -O0 -pg
> -fprofile-arcs -ftest-coverage" LIBS="$(LIBS) -lgcov"
> +
> + coverage-lcov:
> +       @echo "Creating Coverage HTML report with LCOV:"
> diff --git
> a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> index f29ae53371..7e1dc4ef5b 100644
> ---
> a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> +++
> b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> @@ -6,16 +6,16 @@ hardcoded locations for include paths
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: Python-3.4.2/configure.ac
> -===================================================================
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
>   ac_save_cppflags="$CPPFLAGS"
> --CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
> -+CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
> + if test "$cross_compiling" = no; then
> +-  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
> ++  CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
> + fi
>
>   AC_CHECK_HEADERS(curses.h ncurses.h)
> -
> diff --git
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index a3cc48c9a4..ebdd64b7b5 100644
> ---
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -5,13 +5,17 @@ Avoid a warning by not adding this module to missing
> variable.
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
> -===================================================================
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
>           # Call the method for detecting whether _tkinter can be compiled
> @@ -25,5 +29,5 @@ Index: Python-3.5.3/setup.py
>  +        #if '_tkinter' not in [e.name for e in self.extensions]:
>  +        #    missing.append('_tkinter')
>
> - ##         # Uncomment these lines if you want to play with xxmodule.c
> - ##         ext = Extension('xx', ['xxmodule.c'])
> +         # Build the _uuid module if possible
> +         uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
> diff --git
> a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> index 97214f9aa4..689baf00ad 100644
> --- a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> +++ b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> @@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that it would work
> when lib64.
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
> --LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> -+LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + if test x$PLATFORM_TRIPLET = x; then
> +-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> ++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + else
> +-
> LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
> ++
> LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
> + fi
>   AC_SUBST(LIBPL)
>
> - # Check whether right shifting a negative integer extends the sign bit
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/python/python3/float-endian.patch
> b/meta/recipes-devtools/python/python3/float-endian.patch
> index 6ba3f5c252..1511f00bc3 100644
> --- a/meta/recipes-devtools/python/python3/float-endian.patch
> +++ b/meta/recipes-devtools/python/python3/float-endian.patch
> @@ -21,19 +21,19 @@ Subject: [PATCH] Don't do runtime test to get float
> byte order
>   create mode 100644 m4/ax_c_float_words_bigendian.m4
>
>  diff --git a/configure.ac b/configure.ac
> -index c9b755f0f4..1215969871 100644
> +index 2b8aa4d592..80aa37125f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -9,6 +9,8 @@ AC_PREREQ(2.65)
> +@@ -11,6 +11,8 @@ AC_INIT(python, PYTHON_VERSION,
> https://bugs.python.org/)
>
> - AC_INIT(python, PYTHON_VERSION, https://bugs.python.org/)
> + AC_CONFIG_MACRO_DIR(m4)
>
>  +AC_CONFIG_MACRO_DIR(m4)
>  +
>   AC_SUBST(BASECPPFLAGS)
>   if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
>       # If we're building out-of-tree, we need to make sure the following
> -@@ -4128,77 +4130,19 @@ fi
> +@@ -4264,77 +4266,19 @@ fi
>   # * Check for various properties of floating point *
>   # **************************************************
>
> @@ -209,4 +209,3 @@ index 0000000000..216b90d803
>  +])# AX_C_FLOAT_WORDS_BIGENDIAN
>  --
>  2.11.0
> -
> diff --git a/meta/recipes-devtools/python/python3/ftplib.patch
> b/meta/recipes-devtools/python/python3/ftplib.patch
> deleted file mode 100644
> index 49c5b2736b..0000000000
> --- a/meta/recipes-devtools/python/python3/ftplib.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From cabe916dc694997d4892b58986e73a713d5a2f8d Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Thu, 16 Aug 2018 15:38:03 -0400
> -Subject: [PATCH] [3.6] bpo-34391: Fix ftplib test for TLS 1.3 (GH-8787)
> - (#8790)
> -
> -Read from data socket to avoid "[SSL] shutdown while in init" exception
> -during shutdown of the dummy server.
> -
> -Signed-off-by: Christian Heimes <christian@python.org>
> -
> -
> -<!-- issue-number: [bpo-34391](https://www.bugs.python.org/issue34391)
> -->
> -https://bugs.python.org/issue34391
> -<!-- /issue-number -->
> -(cherry picked from commit 1590c393360df059160145e7475754427bfc6680)
> -
> -
> -Co-authored-by: Christian Heimes <christian@python.org>
> ----
> - Lib/test/test_ftplib.py                                         | 5 +++++
> - Misc/NEWS.d/next/Tests/2018-08-16-18-48-47.bpo-34391.ouNfxC.rst | 1 +
> - 2 files changed, 6 insertions(+)
> - create mode 100644
> Misc/NEWS.d/next/Tests/2018-08-16-18-48-47.bpo-34391.ouNfxC.rst
> -
> -diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
> -index 44dd73aeca..4ff2f71afb 100644
> ---- a/Lib/test/test_ftplib.py
> -+++ b/Lib/test/test_ftplib.py
> -@@ -876,18 +876,23 @@ class TestTLS_FTPClass(TestCase):
> -         # clear text
> -         with self.client.transfercmd('list') as sock:
> -             self.assertNotIsInstance(sock, ssl.SSLSocket)
> -+            self.assertEqual(sock.recv(1024), LIST_DATA.encode('ascii'))
> -         self.assertEqual(self.client.voidresp(), "226 transfer complete")
> -
> -         # secured, after PROT P
> -         self.client.prot_p()
> -         with self.client.transfercmd('list') as sock:
> -             self.assertIsInstance(sock, ssl.SSLSocket)
> -+            # consume from SSL socket to finalize handshake and avoid
> -+            # "SSLError [SSL] shutdown while in init"
> -+            self.assertEqual(sock.recv(1024), LIST_DATA.encode('ascii'))
> -         self.assertEqual(self.client.voidresp(), "226 transfer complete")
> -
> -         # PROT C is issued, the connection must be in cleartext again
> -         self.client.prot_c()
> -         with self.client.transfercmd('list') as sock:
> -             self.assertNotIsInstance(sock, ssl.SSLSocket)
> -+            self.assertEqual(sock.recv(1024), LIST_DATA.encode('ascii'))
> -         self.assertEqual(self.client.voidresp(), "226 transfer complete")
> -
> -     def test_login(self):
> ---
> -2.11.0
> -
> diff --git
> a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> index 5c3af6b626..1ce4defe95 100644
> ---
> a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> +++
> b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> @@ -47,16 +47,19 @@ And the semaphore issue also caused
> multiprocessing.Queue().put() hung.
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
>               macros = dict()
>               libraries = []
> @@ -69,14 +72,11 @@ index 4f0f522..d05707d 100644
>               macros = dict()
>               libraries = ['rt']
>
> -@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):
> -         if sysconfig.get_config_var('WITH_THREAD'):
> -             exts.append ( Extension('_multiprocessing',
> multiprocessing_srcs,
> -                                     define_macros=list(macros.items()),
> -+                                    libraries=libraries,
> -
>  include_dirs=["Modules/_multiprocessing"]))
> -         else:
> -             missing.append('_multiprocessing')
> ---
> -2.7.4
> -
> +@@ -1599,6 +1601,7 @@ class PyBuildExt(build_ext):
> +
> +         exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
> +                                 define_macros=list(macros.items()),
> ++                                libraries=libraries,
> +
>  include_dirs=["Modules/_multiprocessing"]))
> +         # End multiprocessing
> +
> diff --git
> a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
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
> @@ -25,12 +25,12 @@ Signed-off-by: Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com>
>   setup.py                         |  9 ++++-----
>   12 files changed, 97 insertions(+), 23 deletions(-)
>
> -Index: Python-3.5.4/Include/pythonrun.h
> -===================================================================
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
>   PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
>   PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags
> *);
> -Index: Python-3.5.4/Lib/distutils/command/install.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/distutils/command/install.py
> -+++ Python-3.5.4/Lib/distutils/command/install.py
> +diff --git a/Lib/distutils/command/install.py
> b/Lib/distutils/command/install.py
> +index 0258d3deae..352fd8f792 100644
> +--- a/Lib/distutils/command/install.py
> ++++ b/Lib/distutils/command/install.py
>  @@ -19,6 +19,8 @@ from site import USER_BASE
>   from site import USER_SITE
>   HAS_USER_SITE = True
> @@ -63,11 +63,11 @@ Index: Python-3.5.4/Lib/distutils/command/install.py
>           'headers':
> '$base/include/python$py_version_short$abiflags/$dist_name',
>           'scripts': '$base/bin',
>           'data'   : '$base',
> -Index: Python-3.5.4/Lib/pydoc.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/pydoc.py
> -+++ Python-3.5.4/Lib/pydoc.py
> -@@ -389,7 +389,7 @@ class Doc:
> +diff --git a/Lib/pydoc.py b/Lib/pydoc.py
> +index 8a6b27b16e..fc55893b18 100644
> +--- a/Lib/pydoc.py
> ++++ b/Lib/pydoc.py
> +@@ -399,7 +399,7 @@ class Doc:
>       docmodule = docclass = docroutine = docother = docproperty = docdata
> = fail
>
>       def getdocloc(self, object,
> @@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py
>                                          "python%d.%d" %
> sys.version_info[:2])):
>           """Return the location of module docs or None"""
>
> -Index: Python-3.5.4/Lib/site.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/site.py
> -+++ Python-3.5.4/Lib/site.py
> -@@ -303,12 +303,12 @@ def getsitepackages(prefixes=None):
> +diff --git a/Lib/site.py b/Lib/site.py
> +index ffd132b389..3ca8270d49 100644
> +--- a/Lib/site.py
> ++++ b/Lib/site.py
> +@@ -334,12 +334,12 @@ def getsitepackages(prefixes=None):
>           seen.add(prefix)
>
>           if os.sep == '/':
>  -            sitepackages.append(os.path.join(prefix, "lib",
> +-                                        "python%d.%d" %
> sys.version_info[:2],
>  +            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> ++                                        "python%d.%d" %
> sys.version_info[:2],
>                                           "site-packages"))
>           else:
>               sitepackages.append(prefix)
>  -            sitepackages.append(os.path.join(prefix, "lib",
> "site-packages"))
>  +            sitepackages.append(os.path.join(prefix, sys.lib,
> "site-packages"))
> -         if sys.platform == "darwin":
> -             # for framework builds *only* we add the standard Apple
> -             # locations.
> -Index: Python-3.5.4/Lib/sysconfig.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/sysconfig.py
> -+++ Python-3.5.4/Lib/sysconfig.py
> +     return sitepackages
> +
> + def addsitepackages(known_paths, prefixes=None):
> +diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> +index e0f9c18531..9869363977 100644
> +--- a/Lib/sysconfig.py
> ++++ b/Lib/sysconfig.py
>  @@ -20,10 +20,10 @@ __all__ = [
>
>   _INSTALL_SCHEMES = {
> @@ -129,7 +130,7 @@ Index: Python-3.5.4/Lib/sysconfig.py
>           'include': '{installed_base}/include/python',
>           'platinclude': '{installed_base}/include/python',
>           'scripts': '{base}/bin',
> -@@ -61,10 +61,10 @@ _INSTALL_SCHEMES = {
> +@@ -62,10 +62,10 @@ _INSTALL_SCHEMES = {
>           'data': '{userbase}',
>           },
>       'posix_user': {
> @@ -144,28 +145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py
>           'include': '{userbase}/include/python{py_version_short}',
>           'scripts': '{userbase}/bin',
>           'data': '{userbase}',
> -Index: Python-3.5.4/Lib/trace.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/trace.py
> -+++ Python-3.5.4/Lib/trace.py
> -@@ -749,10 +749,10 @@ def main(argv=None):
> -                 # should I also call expanduser? (after all, could use
> $HOME)
> +diff --git a/Lib/trace.py b/Lib/trace.py
> +index 86b2101763..f3c32ec317 100755
> +--- a/Lib/trace.py
> ++++ b/Lib/trace.py
> +@@ -659,7 +659,7 @@ def main():
> +     opts = parser.parse_args()
> +
> +     if opts.ignore_dir:
> +-        rel_path = 'lib',
> 'python{0.major}.{0.minor}'.format(sys.version_info)
> ++        rel_path = sys.lib,
> 'python{0.major}.{0.minor}'.format(sys.version_info)
> +         _prefix = os.path.join(sys.base_prefix, *rel_path)
> +         _exec_prefix = os.path.join(sys.base_exec_prefix, *rel_path)
>
> -                 s = s.replace("$prefix",
> --                              os.path.join(sys.base_prefix, "lib",
> -+                              os.path.join(sys.base_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s = s.replace("$exec_prefix",
> --                              os.path.join(sys.base_exec_prefix, "lib",
> -+                              os.path.join(sys.base_exec_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s = os.path.normpath(s)
> -                 ignore_dirs.append(s)
> -Index: Python-3.5.4/Makefile.pre.in
> -===================================================================
> ---- Python-3.5.4.orig/Makefile.pre.in
> -+++ Python-3.5.4/Makefile.pre.in
> -@@ -109,6 +109,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 31b4bcabb3..713215e57d 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -114,6 +114,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
>
>   # Machine-dependent subdirectories
>   MACHDEP=      @MACHDEP@
> @@ -174,7 +171,7 @@ Index: Python-3.5.4/Makefile.pre.in
>
>   # Multiarch directory (may be empty)
>   MULTIARCH=    @MULTIARCH@
> -@@ -128,7 +130,7 @@ LIBDIR=            @libdir@
> +@@ -134,7 +136,7 @@ LIBDIR=            @libdir@
>   MANDIR=               @mandir@
>   INCLUDEDIR=   @includedir@
>   CONFINCLUDEDIR=       $(exec_prefix)/include
> @@ -183,7 +180,7 @@ Index: Python-3.5.4/Makefile.pre.in
>   ABIFLAGS=     @ABIFLAGS@
>
>   # Detailed destination directories
> -@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
> +@@ -754,6 +756,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c
> Makefile
>                 -DEXEC_PREFIX='"$(exec_prefix)"' \
>                 -DVERSION='"$(VERSION)"' \
>                 -DVPATH='"$(VPATH)"' \
> @@ -191,8 +188,8 @@ Index: Python-3.5.4/Makefile.pre.in
>                 -o $@ $(srcdir)/Modules/getpath.c
>
>   Programs/python.o: $(srcdir)/Programs/python.c
> -@@ -813,7 +816,7 @@ regen-opcode:
> - Python/compile.o Python/symtable.o Python/ast.o:
> $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
> +@@ -842,7 +845,7 @@ regen-opcode:
> + Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o:
> $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
>
>   Python/getplatform.o: $(srcdir)/Python/getplatform.c
>  -              $(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@
> $(srcdir)/Python/getplatform.c
> @@ -200,11 +197,11 @@ Index: Python-3.5.4/Makefile.pre.in
>
>   Python/importdl.o: $(srcdir)/Python/importdl.c
>                 $(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@
> $(srcdir)/Python/importdl.c
> -Index: Python-3.5.4/Modules/getpath.c
> -===================================================================
> ---- Python-3.5.4.orig/Modules/getpath.c
> -+++ Python-3.5.4/Modules/getpath.c
> -@@ -105,6 +105,13 @@
> +diff --git a/Modules/getpath.c b/Modules/getpath.c
> +index 041cb14b4b..d52d1e1cdb 100644
> +--- a/Modules/getpath.c
> ++++ b/Modules/getpath.c
> +@@ -106,6 +106,13 @@ extern "C" {
>   #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
>   #endif
>
> @@ -218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c
>   #ifndef LANDMARK
>   #define LANDMARK L"os.py"
>   #endif
> -@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];
> - static wchar_t exec_prefix[MAXPATHLEN+1];
> - static wchar_t progpath[MAXPATHLEN+1];
> - static wchar_t *module_search_path = NULL;
> -+static wchar_t *lib_python = L"" LIB_PYTHON;
> -
> - /* Get file status. Encode the path to the locale encoding. */
> -
> -@@ -494,7 +502,7 @@ calculate_path(void)
> -     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
> -     _prefix = Py_DecodeLocale(PREFIX, NULL);
> -     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
> --    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
> -+    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
> -
> -     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
> -         Py_FatalError(
> -Index: Python-3.5.4/Python/getplatform.c
> -===================================================================
> ---- Python-3.5.4.orig/Python/getplatform.c
> -+++ Python-3.5.4/Python/getplatform.c
> +@@ -867,7 +874,7 @@ calculate_init(PyCalculatePath *calculate,
> +     if (!calculate->prefix) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> +-    calculate->lib_python = Py_DecodeLocale("lib/python" VERSION, &len);
> ++    calculate->lib_python = Py_DecodeLocale(LIB_PYTHON, &len);
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
> -===================================================================
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
> -===================================================================
> ---- Python-3.5.4.orig/configure.ac
> -+++ Python-3.5.4/configure.ac
> -@@ -885,6 +885,41 @@ PLATDIR=plat-$MACHDEP
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
> + LDFLAGS="$save_LDFLAGS"
> + AC_SUBST(NO_AS_NEEDED)
>
>  +AC_SUBST(ARCH)
>  +AC_MSG_CHECKING(ARCH)
> @@ -322,13 +311,13 @@ Index: Python-3.5.4/configure.ac
>  +esac
>  +AC_MSG_RESULT($LIB)
>
> - AC_MSG_CHECKING([for -Wl,--no-as-needed])
> - save_LDFLAGS="$LDFLAGS"
> -Index: Python-3.5.4/setup.py
> -===================================================================
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
>           # directories (i.e. '.' and 'Include') must be first.  See issue
>           # 10520.
>           if not cross_compiling:
> @@ -337,17 +326,16 @@ Index: Python-3.5.4/setup.py
>               add_dir_to_list(self.compiler.include_dirs,
> '/usr/local/include')
>           # only change this for cross builds for 3.3, issues on Mageia
>           if cross_compiling:
> -@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):
> -         # be assumed that no additional -I,-L directives are needed.
> -         if not cross_compiling:
> -             lib_dirs = self.compiler.library_dirs + [
> --                '/lib64', '/usr/lib64',
> --                '/lib', '/usr/lib',
> -+                '/' + sys.lib, '/usr/' + sys.lib,
> -                 ]
> -             inc_dirs = self.compiler.include_dirs + ['/usr/include']
> -         else:
> -@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):
> +@@ -579,7 +579,7 @@ class PyBuildExt(build_ext):
> +             add_dir_to_list(self.compiler.include_dirs,
> +                             sysconfig.get_config_var("INCLUDEDIR"))
> +
> +-        system_lib_dirs = ['/lib64', '/usr/lib64', '/lib', '/usr/lib']
> ++        system_lib_dirs = ['/' + sys.lib, '/usr/' + sys.lib]
> +         system_include_dirs = ['/usr/include']
> +         # lib_dirs and inc_dirs are used to search for files;
> +         # if a file is found in one of those directories, it can
> +@@ -836,11 +836,11 @@ class PyBuildExt(build_ext):
>               elif curses_library:
>                   readline_libs.append(curses_library)
>               elif self.compiler.find_library_file(lib_dirs +
> @@ -361,3 +349,26 @@ Index: Python-3.5.4/setup.py
>
>  extra_link_args=readline_extra_link_args,
>                                      libraries=readline_libs) )
>           else:
> +@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):
> +
> +                 # check lib directories parallel to the location of the
> header
> +                 db_dirs_to_check = [
> +-                    db_incdir.replace("include", 'lib64'),
> +-                    db_incdir.replace("include", 'lib'),
> ++                    db_incdir.replace("include", sys.lib),
> +                 ]
> +
> +                 if host_platform != 'darwin':
> +@@ -1166,10 +1165,8 @@ class PyBuildExt(build_ext):
> +
> +         if sqlite_incdir:
> +             sqlite_dirs_to_check = [
> +-                os.path.join(sqlite_incdir, '..', 'lib64'),
> +-                os.path.join(sqlite_incdir, '..', 'lib'),
> +-                os.path.join(sqlite_incdir, '..', '..', 'lib64'),
> +-                os.path.join(sqlite_incdir, '..', '..', 'lib'),
> ++                os.path.join(sqlite_incdir, '..', sys.lib),
> ++                os.path.join(sqlite_incdir, '..', '..', sys.lib),
> +             ]
> +             sqlite_libfile = self.compiler.find_library_file(
> +                                 sqlite_dirs_to_check + lib_dirs,
> 'sqlite3')
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> index f922561368..aff5b63289 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -27,24 +27,17 @@
>      "asyncio": {
>          "summary": "Python Asynchronous I/",
>          "rdepends": [
> -            "compression",
>              "core",
> -            "crypt",
>              "io",
>              "logging",
> -            "math",
> -            "multiprocessing",
>              "netclient",
> -            "pickle",
> -            "shell",
> -            "stringold",
> -            "threading",
> -            "unixadmin"
> +            "stringold"
>          ],
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/asyncio",
>              "${libdir}/python${PYTHON_MAJMIN}/concurrent",
> -            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
> +            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
>          ],
>          "cached": []
>      },
> @@ -149,7 +142,7 @@
>              "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
>              "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
>              "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
>              "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
>              "${libdir}/python${PYTHON_MAJMIN}/abc.py",
>              "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
> @@ -162,6 +155,7 @@
>              "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
>              "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
>              "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
>              "${libdir}/python${PYTHON_MAJMIN}/copy.py",
>              "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
>              "${libdir}/python${PYTHON_MAJMIN}/csv.py",
> @@ -191,6 +185,7 @@
>
>  "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time.*.so",
>
>  "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
> +
> "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
> @@ -256,6 +251,7 @@
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
>
>  "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
>
>  "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
> +
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
> @@ -323,9 +319,13 @@
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
>              "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
>          ],
>          "cached": [
> @@ -729,7 +729,9 @@
>      "multiprocessing": {
>          "summary": "Python multiprocessing support",
>          "rdepends": [
> -            "core"
> +            "core",
> +            "io",
> +            "pickle"
>          ],
>          "files": [
>
>  "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
> @@ -740,18 +742,14 @@
>      "netclient": {
>          "summary": "Python Internet Protocol clients",
>          "rdepends": [
> -            "compression",
>              "core",
>              "crypt",
> -            "ctypes",
>              "datetime",
>              "email",
>              "io",
>              "math",
>              "mime",
> -            "shell",
> -            "stringold",
> -            "unixadmin"
> +            "stringold"
>          ],
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/base64.py",
> @@ -759,6 +757,7 @@
>              "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
>              "${libdir}/python${PYTHON_MAJMIN}/http",
>              "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
>              "${libdir}/python${PYTHON_MAJMIN}/nntplib.py",
>              "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
> @@ -1043,13 +1042,12 @@
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
>              "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/dummy_threading.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/queue.py"
>          ],
>          "cached": [
>
>  "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
>
>  "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
> -
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
>          ]
>      },
> diff --git
> a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> index a4f8bd4710..c6aa581b4c 100644
> ---
> a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> +++
> b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> @@ -5,21 +5,24 @@ Subject: [PATCH] python3 use CROSSPYTHONPATH for
> PYTHON_FOR_BUILD
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
> -===================================================================
> ---- Python-3.5.4.orig/configure.ac
> -+++ Python-3.5.4/configure.ac
> -@@ -73,7 +73,7 @@ if test "$cross_compiling" = yes; then
> +diff --git a/configure.ac b/configure.ac
> +index 2b8aa4d592..a361436f4f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -75,7 +75,7 @@ if test "$cross_compiling" = yes; then
>             AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>         fi
>           AC_MSG_RESULT($interp)
> --      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f
> pybuilddir.txt && echo $(abs_builddir)/`cat
> pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
> -+      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM)
> PYTHONPATH=$(CROSSPYTHONPATH) '$interp
> +-      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f
> pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib
> _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH)
> '$interp
> ++      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM)
> PYTHONPATH=$(CROSSPYTHONPATH)
> _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH)
> '$interp
>       fi
>   elif test "$cross_compiling" = maybe; then
>       AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and
> --build=ARCH])
> diff --git a/meta/recipes-devtools/python/python3/regen-all.patch
> b/meta/recipes-devtools/python/python3/regen-all.patch
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
> -
> ############################################################################
> - # Regenerate all generated files
> -
> --regen-all: regen-opcode regen-opcode-targets regen-typeslots
> regen-grammar regen-ast regen-importlib
> -+regen-all: regen-opcode regen-opcode-targets regen-typeslots
> regen-grammar regen-ast
> -+      $(MAKE) regen-importlib
> -
> -
> ############################################################################
> - # Special rules for object files
> diff --git a/meta/recipes-devtools/python/python3/signal.patch
> b/meta/recipes-devtools/python/python3/signal.patch
> deleted file mode 100644
> index 534a097771..0000000000
> --- a/meta/recipes-devtools/python/python3/signal.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 4315389df3c4e8c1f94a18ab11a4b234762132b1 Mon Sep 17 00:00:00 2001
> -From: Antoine Pitrou <pitrou@free.fr>
> -Date: Mon, 23 Apr 2018 22:22:49 +0200
> -Subject: [PATCH] [3.6] bpo-33329: Fix multiprocessing regression on newer
> - glibcs (GH-6575) (GH-6582)
> -
> -Starting with glibc 2.27.9000-xxx, sigaddset() can return EINVAL for some
> -reserved signal numbers between 1 and NSIG.  The `range(1, NSIG)` idiom
> -is commonly used to select all signals for blocking with
> `pthread_sigmask`.
> -So we ignore the sigaddset() return value until we expose sigfillset()
> -to provide a better idiom.
> -(cherry picked from commit 25038ecfb665bef641abf8cb61afff7505b0e008)
> ----
> - .../next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst  |  1 +
> - Modules/signalmodule.c                                     | 14
> ++++++++------
> - 2 files changed, 9 insertions(+), 6 deletions(-)
> - create mode 100644
> Misc/NEWS.d/next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst
> -
> -diff --git a/Modules/signalmodule.c b/Modules/signalmodule.c
> -index e0d06b434d..138e74e8a9 100644
> ---- a/Modules/signalmodule.c
> -+++ b/Modules/signalmodule.c
> -@@ -744,7 +744,6 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mask)
> -     int result = -1;
> -     PyObject *iterator, *item;
> -     long signum;
> --    int err;
> -
> -     sigemptyset(mask);
> -
> -@@ -766,11 +765,14 @@ iterable_to_sigset(PyObject *iterable, sigset_t
> *mask)
> -         Py_DECREF(item);
> -         if (signum == -1 && PyErr_Occurred())
> -             goto error;
> --        if (0 < signum && signum < NSIG)
> --            err = sigaddset(mask, (int)signum);
> --        else
> --            err = 1;
> --        if (err) {
> -+        if (0 < signum && signum < NSIG) {
> -+            /* bpo-33329: ignore sigaddset() return value as it can fail
> -+             * for some reserved signals, but we want the `range(1,
> NSIG)`
> -+             * idiom to allow selecting all valid signals.
> -+             */
> -+            (void) sigaddset(mask, (int)signum);
> -+        }
> -+        else {
> -             PyErr_Format(PyExc_ValueError,
> -                          "signal number %ld out of range", signum);
> -             goto error;
> ---
> -2.11.0
> -
> diff --git
> a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
> b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
> deleted file mode 100644
> index 32ecab9fec..0000000000
> ---
> a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -The compiled .pyc files contain time stamp corresponding to the compile
> time.
> -This prevents binary reproducibility. This patch allows to achieve binary
> -reproducibility by overriding the build time stamp by the value
> -exported via SOURCE_DATE_EPOCH.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> -
> -From aeab488630fdb1b56a8d0b0c13fa88706b2afe9b Mon Sep 17 00:00:00 2001
> -From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
> -Date: Sat, 25 Feb 2017 06:42:28 +0100
> -Subject: [PATCH] bpo-29708: support SOURCE_DATE_EPOCH env var in
> py_compile
> -
> -to allow for reproducible builds of python packages
> -
> -See https://reproducible-builds.org/ for why this is good
> -and https://reproducible-builds.org/specs/source-date-epoch/
> -for the definition of this variable.
> -
> -Background:
> -In some distributions like openSUSE, binary rpms contain precompiled .pyc
> files.
> -
> -And packages like amqp or twisted dynamically generate .py files at build
> time
> -so those have the current time and that timestamp gets embedded
> -into the .pyc file header.
> -When we then adapt file timestamps in rpms to be constant,
> -the timestamp in the .pyc header will no more match
> -the .py timestamp in the filesystem.
> -The software will still work, but it will not use the .pyc file as it
> should.
> ----
> - Doc/library/py_compile.rst  |  4 ++++
> - Lib/py_compile.py           |  4 ++++
> - Lib/test/test_py_compile.py | 19 +++++++++++++++++++
> - 3 files changed, 27 insertions(+)
> -
> -diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst
> -index 0af8fb1..841f3e8 100644
> ---- a/Doc/library/py_compile.rst
> -+++ b/Doc/library/py_compile.rst
> -@@ -53,6 +53,10 @@ byte-code cache files in the directory containing the
> source code.
> -    :func:`compile` function.  The default of ``-1`` selects the
> optimization
> -    level of the current interpreter.
> -
> -+   If the SOURCE_DATE_EPOCH environment variable is set, the .py file
> mtime
> -+   and timestamp entry in .pyc file header, will be limited to this
> value.
> -+   See https://reproducible-builds.org/specs/source-date-epoch/ for
> more info.
> -+
> -    .. versionchanged:: 3.2
> -       Changed default value of *cfile* to be :PEP:`3147`-compliant.
> Previous
> -       default was *file* + ``'c'`` (``'o'`` if optimization was enabled).
> -diff --git a/Lib/py_compile.py b/Lib/py_compile.py
> -index 11c5b50..62dcdc7 100644
> ---- a/Lib/py_compile.py
> -+++ b/Lib/py_compile.py
> -@@ -137,6 +137,10 @@ def compile(file, cfile=None, dfile=None,
> doraise=False, optimize=-1):
> -     except FileExistsError:
> -         pass
> -     source_stats = loader.path_stats(file)
> -+    sde = os.environ.get('SOURCE_DATE_EPOCH')
> -+    if sde and source_stats['mtime'] > int(sde):
> -+        source_stats['mtime'] = int(sde)
> -+        os.utime(file, (source_stats['mtime'], source_stats['mtime']))
> -     bytecode = importlib._bootstrap_external._code_to_bytecode(
> -             code, source_stats['mtime'], source_stats['size'])
> -     mode = importlib._bootstrap_external._calc_mode(file)
> -diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py
> -index 4a6caa5..3d09963 100644
> ---- a/Lib/test/test_py_compile.py
> -+++ b/Lib/test/test_py_compile.py
> -@@ -98,6 +98,25 @@ def test_bad_coding(self):
> -         self.assertFalse(os.path.exists(
> -             importlib.util.cache_from_source(bad_coding)))
> -
> -+    def test_source_date_epoch(self):
> -+        testtime = 123456789
> -+        orig_sde = os.getenv("SOURCE_DATE_EPOCH")
> -+        os.environ["SOURCE_DATE_EPOCH"] = str(testtime)
> -+        py_compile.compile(self.source_path, self.pyc_path)
> -+        if orig_sde:
> -+            os.environ["SOURCE_DATE_EPOCH"] = orig_sde
> -+        else:
> -+            del os.environ["SOURCE_DATE_EPOCH"]
> -+        self.assertTrue(os.path.exists(self.pyc_path))
> -+        self.assertFalse(os.path.exists(self.cache_path))
> -+        statinfo = os.stat(self.source_path)
> -+        self.assertEqual(statinfo.st_mtime, testtime)
> -+        f = open(self.pyc_path, "rb")
> -+        f.read(4)
> -+        timebytes = f.read(4) # read timestamp from pyc header
> -+        f.close()
> -+        self.assertEqual(timebytes, (testtime).to_bytes(4, 'little'))
> -+
> -     @unittest.skipIf(sys.flags.optimize > 0, 'test does not work with
> -O')
> -     def test_double_dot_no_clobber(self):
> -         # http://bugs.python.org/issue22966
> diff --git
> a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> index 785b5567f2..d5983544c4 100644
> --- a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> +++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> @@ -6,26 +6,27 @@ Should fix things like
>  configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
> -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 -DNDEBUG
> -fno-inline -D__SOFTFP__
> --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone
> -c -O2 -pipe -g -feliminate-unused-debug-types  -I/usr/include/ncursesw
> conftest.c >&5
>  cc1: warning: include location "/usr/include/ncursesw" is unsafe for
> cross-compilation [-Wpoison-system-directories]
>
> +2018-08: Rebased to 3.7.0
> +  -- Jens
>
>  Signed-off-by: Khem Raj
>  Upstream-Status: Pending
>
> -
> -Index: Python-3.3.2/setup.py
> -===================================================================
> ---- Python-3.3.2.orig/setup.py 2013-07-30 01:30:48.000000000 -0700
> -+++ Python-3.3.2/setup.py      2013-07-30 01:41:11.697862723 -0700
> -@@ -1210,7 +1210,7 @@
> -         panel_library = 'panel'
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..41e88a152b 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1333,7 +1333,7 @@ class PyBuildExt(build_ext):
>           if curses_library == 'ncursesw':
>               curses_defines.append(('HAVE_NCURSESW', '1'))
> --            curses_includes.append('/usr/include/ncursesw')
> -+            curses_includes.append('=/usr/include/ncursesw')
> +             if not cross_compiling:
> +-                curses_includes.append('/usr/include/ncursesw')
> ++                curses_includes.append('=/usr/include/ncursesw')
>               # Bug 1464056: If _curses.so links with ncursesw,
>               # _curses_panel.so must link with panelw.
>               panel_library = 'panelw'
> -@@ -1819,7 +1819,7 @@
> -         if host_platform == 'darwin':
> +@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
> +                 return
>               # OS X 10.5 comes with libffi.dylib; the include files are
>               # in /usr/include/ffi
>  -            inc_dirs.append('/usr/include/ffi')
> diff --git
> a/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
> b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
> new file mode 100644
> index 0000000000..464f873112
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
> @@ -0,0 +1,24 @@
> +Subject: [PATCH] util-linux uuid support
> +
> +Scan for uuid.h in include/uuid/ as well as in include/ to catch
> +the uuid/uuid.h well supported but accidently not detected.
> +
> +Upstream-Status: Pending
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
> +-        uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
> +-        if uuid_incs is not None:
> ++        uuid_incs = find_file("uuid.h", inc_dirs, [])
> ++        uuid_uuid_incs = find_file("uuid/uuid.h", inc_dirs, [])
> ++        if uuid_incs is not None or uuid_uuid_incs is not None:
> +             if self.compiler.find_library_file(lib_dirs, 'uuid'):
> +                 uuid_libs = ['uuid']
> +             else:
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
> b/meta/recipes-devtools/python/python3_3.5.6.bb
> deleted file mode 100644
> index 2a4547694a..0000000000
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ /dev/null
> @@ -1,329 +0,0 @@
> -require recipes-devtools/python/python3.inc
> -
> -DEPENDS = "python3-native libffi bzip2 gdbm openssl \
> -           sqlite3 zlib virtual/libintl xz qemu-native \
> -           qemu-helper-native virtual/crypt"
> -
> -DISTRO_SRC_URI ?= "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase = ""
> -SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> -file://python-config.patch \
> -file://030-fixup-include-dirs.patch \
> -file://070-dont-clean-ipkg-install.patch \
> -file://080-distutils-dont_adjust_files.patch \
> -file://130-readline-setup.patch \
> -file://150-fix-setupterm.patch \
> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> -file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -${DISTRO_SRC_URI} \
> -"
> -
> -SRC_URI += "\
> -            file://03-fix-tkinter-detection.patch \
> -            file://avoid_warning_about_tkinter.patch \
> -            file://cgi_py.patch \
> -            file://host_include_contamination.patch \
> -            file://python-3.3-multilib.patch \
> -            file://sysroot-include-headers.patch \
> -            file://unixccompiler.patch \
> -            file://avoid-ncursesw-include-path.patch \
> -            file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> \
> -            file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -            file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -            file://configure.ac-fix-LIBPL.patch \
> -
> file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
> -            file://pass-missing-libraries-to-Extension-for-mul.patch \
> -
> file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
> -
> file://0002-Makefile-add-target-to-split-profile-generation.patch \
> -            file://float-endian.patch \
> -            file://ftplib.patch \
> -            file://signal.patch \
> -
> file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
> -
> file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
> -
> file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
> -
> file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
> -
> file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
> -            file://run-ptest \
> -           "
> -
> -inherit multilib_header python3native update-alternatives qemu ptest
> -
> -MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> -
> -ALTERNATIVE_${PN}-dev = "python-config"
> -ALTERNATIVE_LINK_NAME[python-config] =
> "${bindir}/python${PYTHON_BINABI}-config"
> -ALTERNATIVE_TARGET[python-config] =
> "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> -
> -CONFIGUREOPTS += " --with-system-ffi "
> -
> -CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
> -                ac_cv_have_lchflags=no \
> -                ac_cv_have_long_long_format=yes \
> -                ac_cv_buggy_getaddrinfo=no \
> -                ac_cv_file__dev_ptmx=yes \
> -                ac_cv_file__dev_ptc=no \
> -"
> -
> -TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
> -SDK_CC_ARCH += "-DNDEBUG -fno-inline"
> -EXTRA_OEMAKE += "CROSS_COMPILE=yes"
> -EXTRA_OECONF +=
> "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/
> --without-ensurepip"
> -
> -PYTHON3_PROFILE_TASK ?= "./python -m test.regrtest --pgo test_grammar
> test_opcodes test_dict test_builtin test_exceptions test_types test_support
> || true"
> -
> -export CROSS_COMPILE = "${TARGET_PREFIX}"
> -export CCSHARED = "-fPIC"
> -
> -# Fix cross compilation of different modules
> -export CROSSPYTHONPATH =
> "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> -
> -PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
> 'qemu-usermode', 'pgo', '', d)}"
> -PACKAGECONFIG[readline] = ",,readline"
> -# Use profile guided optimisation by running PyBench inside qemu-user
> -PACKAGECONFIG[pgo] = "--enable-optimizations"
> -
> -do_configure_append() {
> -       rm -f ${S}/Makefile.orig
> -}
> -
> -run_make() {
> -       oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -               HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3
> \
> -               STAGING_LIBDIR=${STAGING_LIBDIR} \
> -               STAGING_INCDIR=${STAGING_INCDIR} \
> -               STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> -               LIB=${baselib} \
> -               ARCH=${TARGET_ARCH} \
> -               OPT="${CFLAGS}" \
> -               "$@"
> -}
> -
> -do_compile() {
> -       # regenerate platform specific files, because they depend on
> system headers
> -       cd ${S}/Lib/plat-linux*
> -       include=${STAGING_INCDIR}
> ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -               ${S}/Tools/scripts/h2py.py -i '(u_long)' \
> -               ${STAGING_INCDIR}/dlfcn.h \
> -               ${STAGING_INCDIR}/linux/cdrom.h \
> -               ${STAGING_INCDIR}/netinet/in.h \
> -               ${STAGING_INCDIR}/sys/types.h
> -       sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
> -       cd -
> -
> -       # remove any bogus LD_LIBRARY_PATH
> -       sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
> -
> -       if [ ! -f Makefile.orig ]; then
> -               install -m 0644 Makefile Makefile.orig
> -       fi
> -       sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L.
> -L${STAGING_LIBDIR},g' \
> -               -e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
> -               -e
> 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
> -               -e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
> -               -e
> 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
> -               -e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
> -               -e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
> -               Makefile
> -       # save copy of it now, because if we do it in do_install and
> -       # then call do_install twice we get Makefile.orig ==
> Makefile.sysroot
> -       install -m 0644 Makefile Makefile.sysroot
> -
> -       if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false',
> d)}; then
> -               run_make profile-opt
> -               qemu_binary="${@qemu_wrapper_cmdline(d,
> '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> -               cat >pgo-wrapper <<EOF
> -#!/bin/sh
> -cd ${B}
> -$qemu_binary "\$@"
> -EOF
> -               chmod +x pgo-wrapper
> -               bbnote Gathering profiling data
> -               ./pgo-wrapper ${PYTHON3_PROFILE_TASK}
> -               bbnote Profiling data gathered, rebuilding
> -               run_make clean_and_use_profile
> -       else
> -               run_make libpython3.so
> -               run_make
> -       fi
> -}
> -
> -do_install() {
> -       # make install needs the original Makefile, or otherwise the
> inclues would
> -       # go to ${D}${STAGING...}/...
> -       install -m 0644 Makefile.orig Makefile
> -
> -       install -d ${D}${libdir}/pkgconfig
> -       install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
> -
> -       # rerun the build once again with original makefile this time
> -       # run install in a separate step to avoid compile/install race
> -       if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false',
> d)}; then
> -               run_make DESTDIR=${D} LIBDIR=${libdir}
> build_all_use_profile
> -       else
> -               run_make DESTDIR=${D} LIBDIR=${libdir}
> -       fi
> -
> -       run_make DESTDIR=${D} LIBDIR=${libdir} install
> -
> -       # avoid conflict with 2to3 from Python 2
> -       rm -f ${D}/${bindir}/2to3
> -
> -       install -m 0644 Makefile.sysroot
> ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> -       install -m 0644 Makefile.sysroot
> ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
> -
> -       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -               install -m 0644 ${WORKDIR}/sitecustomize.py
> ${D}/${libdir}/python${PYTHON_MAJMIN}
> -       fi
> -
> -       oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> -}
> -
> -do_install_append_class-nativesdk () {
> -       create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> PYTHONHOME='${prefix}'
> TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE='1'
> -}
> -
> -SSTATE_SCAN_FILES += "Makefile"
> -PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
> -
> -py_package_preprocess () {
> -       # copy back the old Makefile to fix target package
> -       install -m 0644 ${B}/Makefile.orig
> ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> -       install -m 0644 ${B}/Makefile.orig
> ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
> -       # Remove references to buildmachine paths in target Makefile and
> _sysconfigdata
> -       sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e
> s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> -               -e 's|${DEBUG_PREFIX_MAP}||g' \
> -               -e 's:${HOSTTOOLS_DIR}/::g' \
> -               -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> -               -e 's:${RECIPE_SYSROOT}::g' \
> -               -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> -               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
> -
>  ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
> \
> -               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
> \
> -               ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> -
> -       # Recompile _sysconfigdata after modifying it
> -       cd ${PKGD}
> -       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
> -       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=1)"
> -       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=2)"
> -       cd -
> -
> -       mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> -}
> -
> -PACKAGES_remove = "${PN}"
> -
> -# manual dependency additions
> -RPROVIDES_${PN}-modules = "${PN}"
> -RRECOMMENDS_${PN}-core_append_class-nativesdk = "
> nativesdk-python3-modules"
> -RRECOMMENDS_${PN}-crypt = "openssl ca-certificates"
> -
> -FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
> -FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> -FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> -
> -PACKAGES =+ "${PN}-pyvenv"
> -FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
> -
> -# package libpython3
> -PACKAGES =+ "libpython3 libpython3-staticdev"
> -FILES_libpython3 = "${libdir}/libpython*.so.*"
> -FILES_libpython3-staticdev +=
> "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
> -INSANE_SKIP_${PN}-dev += "dev-elf"
> -
> -# catch all the rest (unsorted)
> -PACKAGES += "${PN}-misc"
> -RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
> -RDEPENDS_${PN}-modules += "${PN}-misc"
> -FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
> -
> -# catch manpage
> -PACKAGES += "${PN}-man"
> -FILES_${PN}-man = "${datadir}/man"
> -
> -RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
> -
> -RDEPENDS_${PN}-dev = ""
> -
> -BBCLASSEXTEND = "nativesdk"
> -
> -# We want bytecode precompiled .py files (.pyc's) by default
> -# but the user may set it on their own conf
> -INCLUDE_PYCS ?= "1"
> -
> -python(){
> -    import collections, json
> -
> -    filename = os.path.join(d.getVar('THISDIR'), 'python3',
> 'python3-manifest.json')
> -    # This python changes the datastore based on the contents of a file,
> so mark
> -    # that dependency.
> -    bb.parse.mark_dependency(d, filename)
> -
> -    with open(filename) as manifest_file:
> -        python_manifest=json.load(manifest_file,
> object_pairs_hook=collections.OrderedDict)
> -
> -    include_pycs = d.getVar('INCLUDE_PYCS')
> -
> -    packages = d.getVar('PACKAGES').split()
> -    pn = d.getVar('PN')
> -
> -    newpackages=[]
> -    for key in python_manifest:
> -        pypackage= pn + '-' + key
> -
> -        if pypackage not in packages:
> -            # We need to prepend, otherwise python-misc gets everything
> -            # so we use a new variable
> -            newpackages.append(pypackage)
> -
> -        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> -        d.setVar('FILES_' + pypackage, '')
> -        for value in python_manifest[key]['files']:
> -            d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -       # Add cached files
> -        if include_pycs == '1':
> -            for value in python_manifest[key]['cached']:
> -                    d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -        for value in python_manifest[key]['rdepends']:
> -            # Make it work with or without $PN
> -            if '${PN}' in value:
> -                value=value.split('-')[1]
> -            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> -        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> -
> -    # Prepending so to avoid python-misc getting everything
> -    packages = newpackages + packages
> -    d.setVar('PACKAGES', ' '.join(packages))
> -    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> -}
> -
> -# Files needed to create a new manifest
> -SRC_URI += "file://create_manifest3.py file://get_module_deps3.py
> file://python3-manifest.json"
> -
> -do_create_manifest() {
> -    # This task should be run with every new release of Python.
> -    # We must ensure that PACKAGECONFIG enables everything when creating
> -    # a new manifest, this is to base our new manifest on a complete
> -    # native python build, containing all dependencies, otherwise the task
> -    # wont be able to find the required files.
> -    # e.g. BerkeleyDB is an optional build dependency so it may or may not
> -    # be present, we must ensure it is.
> -
> -    cd ${WORKDIR}
> -    # This needs to be executed by python-native and NOT by HOST's python
> -    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
> -    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
> -}
> -
> -# bitbake python -c create_manifest
> -addtask do_create_manifest
> -
> -# Make sure we have native python ready when we create a new manifest
> -do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
> -do_create_manifest[depends] += "python3:do_patch"
> diff --git a/meta/recipes-devtools/python/python3_3.7.1.bb
> b/meta/recipes-devtools/python/python3_3.7.1.bb
> new file mode 100644
> index 0000000000..9604d95b03
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3_3.7.1.bb
> @@ -0,0 +1,298 @@
> +# Maintainers hint: with every new release of Python, the task
> +# create_manifest - please see for detailed documentation
> +# inside do_create_manifest
> +require recipes-devtools/python/python3.inc
> +
> +DEPENDS = "libffi bzip2 gdbm openssl sqlite3 zlib xz \
> +           util-linux libtirpc libnsl2 virtual/libintl virtual/crypt\
> +"
> +DEPENDS += "${@["qemu-native qemu-helper-native",
> ""][bb.utils.contains('PACKAGECONFIG', 'pgo', 0, 1, d)]}"
> +
> +PYTHON_BINABI = "${PYTHON_MAJMIN}${PYTHON_ABI}"
> +
> +SRC_URI += "\
> +    file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
> +    file://cgi_py.patch \
> +    file://host_include_contamination.patch \
> +    file://avoid-ncursesw-include-path.patch \
> +    file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> +    file://configure.ac-fix-LIBPL.patch \
> +    file://pass-missing-libraries-to-Extension-for-mul.patch \
> +    file://float-endian.patch \
> +    file://run-ptest \
> +"
> +
> +inherit multilib_header python3native update-alternatives qemu ptest
> +
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +ALTERNATIVE_${PN}-dev = "python-config"
> +ALTERNATIVE_LINK_NAME[python-config] =
> "${bindir}/python${PYTHON_BINABI}-config"
> +ALTERNATIVE_TARGET[python-config] =
> "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> +
> +CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
> +                ac_cv_have_lchflags=no \
> +                ac_cv_have_long_long_format=yes \
> +                ac_cv_buggy_getaddrinfo=no \
> +                ac_cv_file__dev_ptmx=yes \
> +                ac_cv_file__dev_ptc=no \
> +"
> +
> +TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
> +SDK_CC_ARCH += "-DNDEBUG -fno-inline"
> +EXTRA_OEMAKE += "CROSS_COMPILE=yes"
> +EXTRA_OECONF +=
> "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/
> --without-ensurepip"
> +PYTHON3_PROFILE_TASK ?= "./python -m test.regrtest --pgo test_grammar
> test_opcodes test_dict test_builtin test_exceptions test_types test_support"
> +
> +export CROSS_COMPILE = "${TARGET_PREFIX}"
> +export CCSHARED = "-fPIC"
> +
> +# Fix cross compilation of different modules
> +export CROSSPYTHONPATH =
> "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> +
> +PACKAGECONFIG ??= "pgo readline ${@bb.utils.contains('DISTRO_FEATURES',
> 'bluetooth', 'bluetooth', '', d)}"
> +PACKAGECONFIG[readline] = ",,readline"
> +# Use profile guided optimisation by running PyBench inside qemu-user
> +PACKAGECONFIG[pgo] = "--enable-optimizations"
> +
> +run_make() {
> +       oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> +               HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3
> \
> +               STAGING_LIBDIR=${STAGING_LIBDIR} \
> +               STAGING_INCDIR=${STAGING_INCDIR} \
> +               STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> +               LIB=${baselib} \
> +               ARCH=${TARGET_ARCH} \
> +               OPT="${CFLAGS}" \
> +               "$@"
> +}
> +
> +do_compile() {
> +       # remove any bogus LD_LIBRARY_PATH
> +       sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
> +
> +       if [ ! -f Makefile.orig ]; then
> +               install -m 0644 Makefile Makefile.orig
> +       fi
> +       sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L.
> -L${STAGING_LIBDIR},g' \
> +               -e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
> +               -e
> 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
> +               -e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
> +               -e
> 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
> +               -e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
> +               -e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
> +               Makefile
> +
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false',
> d)}; then
> +               qemu_binary="${@qemu_wrapper_cmdline(d,
> '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> +               cat > ${B}/pgo-wrapper << EOF
> +#!/bin/sh
> +set -x
> +cd ${B}
> +$qemu_binary "\$@"
> +EOF
> +               chmod +x ${B}/pgo-wrapper
> +               bbnote Updating Makefile to gather profiling data during
> build
> +               sed -i  -e 's,$(LLVM_PROF_FILE) $(RUNSHARED)
> ./$(BUILDPYTHON) $(PROFILE_TASK),${B}/pgo-wrapper ./python
> $(PROFILE_TASK),' \
> +                       -e
> 's,PROFILE_TASK=.*,PROFILE_TASK=${PYTHON3_PROFILE_TASK},' \
> +                       Makefile
> +       else
> +               sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED)
> ./$(BUILDPYTHON) $(PROFILE_TASK),:,' \
> +                       Makefile
> +       fi
> +
> +       # save copy of it now, because if we do it in do_install and
> +       # then call do_install twice we get Makefile.orig ==
> Makefile.sysroot
> +       install -m 0644 Makefile Makefile.sysroot
> +
> +        run_make profile-opt
> +}
> +
> +do_install() {
> +       # make install needs the original Makefile, or otherwise the
> inclues would
> +       # go to ${D}${STAGING...}/...
> +       install -m 0644 Makefile.orig Makefile
> +
> +       install -d ${D}${libdir}/pkgconfig
> +       install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
> +
> +       # rerun the build once again with original makefile this time
> +       # run install in a separate step to avoid compile/install race
> +       run_make DESTDIR=${D} LIBDIR=${libdir} build_all
> +       run_make DESTDIR=${D} LIBDIR=${libdir} install
> +
> +       # avoid conflict with 2to3 from Python 2
> +       rm -f ${D}/${bindir}/2to3
> +
> +       set -x
> +        install -m 0644 Makefile.sysroot
> ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +       install -m 0644 Makefile.sysroot
> ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
> +
> +       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +               install -m 0644 ${WORKDIR}/sitecustomize.py
> ${D}/${libdir}/python${PYTHON_MAJMIN}
> +       fi
> +
> +       oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +}
> +
> +do_install_append_class-nativesdk () {
> +       create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> PYTHONHOME='${prefix}'
> TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE='1'
> +}
> +
> +SSTATE_SCAN_FILES += "Makefile"
> +PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
> +
> +py_package_preprocess () {
> +       MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed
> -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
> +       eval ${MAKESETTINGS}
> +       if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
> +           die "do_install: configure determined ABIFLAGS '${ABIFLAGS}'
> != '${PYTHON_ABI}' from python3-dir.bbclass"
> +       fi
> +       if test "x${BUILD_OS}" = "x${TARGET_OS}"; then
> +               # no cross-compile at all
> +
>  _PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
> +       else
> +               # at the very moment, it's the only available target
> +               _PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_linux_${MULTIARCH}
> +       fi
> +
> +       # copy back the old Makefile to fix target package
> +       install -m 0644 ${B}/Makefile.orig
> ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +       install -m 0644 ${B}/Makefile.orig
> ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
> +       # Remove references to buildmachine paths in target Makefile and
> _sysconfigdata
> +       sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e
> s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> +               -e 's|${DEBUG_PREFIX_MAP}||g' \
> +               -e 's:${HOSTTOOLS_DIR}/::g' \
> +               -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +               -e 's:${RECIPE_SYSROOT}::g' \
> +               -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> +               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
> +
>  ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
> \
> +
>  ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py
> \
> +               ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> +
> +       # Recompile _sysconfigdata after modifying it
> +       cd ${PKGD}
> +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py')"
> +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py',
> optimize=1)"
> +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py',
> optimize=2)"
> +       cd -
> +
> +       mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> +}
> +
> +PACKAGES_remove = "${PN}"
> +
> +# manual dependency additions
> +RPROVIDES_${PN}-modules = "${PN}"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk = "
> nativesdk-python3-modules"
> +RRECOMMENDS_${PN}-crypt = "openssl ca-certificates"
> +
> +FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
> +FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> +FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> +
> +PACKAGES =+ "${PN}-pyvenv"
> +FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
> +
> +# package libpython3
> +PACKAGES =+ "libpython3 libpython3-staticdev"
> +FILES_libpython3 = "${libdir}/libpython*.so.*"
> +FILES_libpython3-staticdev +=
> "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}*/libpython${PYTHON_BINABI}.a"
> +INSANE_SKIP_${PN}-dev += "dev-elf"
> +
> +# catch all the rest (unsorted)
> +PACKAGES += "${PN}-misc"
> +RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
> +RDEPENDS_${PN}-modules += "${PN}-misc"
> +FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
> +
> +# catch manpage
> +PACKAGES += "${PN}-man"
> +FILES_${PN}-man = "${datadir}/man"
> +
> +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
> +
> +RDEPENDS_${PN}-dev = ""
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> +# We want bytecode precompiled .py files (.pyc's) by default
> +# but the user may set it on their own conf
> +INCLUDE_PYCS ?= "1"
> +
> +python(){
> +    import collections, json
> +
> +    filename = os.path.join(d.getVar('THISDIR'), 'python3',
> 'python3-manifest.json')
> +    # This python changes the datastore based on the contents of a file,
> so mark
> +    # that dependency.
> +    bb.parse.mark_dependency(d, filename)
> +
> +    with open(filename) as manifest_file:
> +        python_manifest=json.load(manifest_file,
> object_pairs_hook=collections.OrderedDict)
> +
> +    include_pycs = d.getVar('INCLUDE_PYCS')
> +
> +    packages = d.getVar('PACKAGES').split()
> +    pn = d.getVar('PN')
> +
> +    newpackages=[]
> +    for key in python_manifest:
> +        pypackage= pn + '-' + key
> +
> +        if pypackage not in packages:
> +            # We need to prepend, otherwise python-misc gets everything
> +            # so we use a new variable
> +            newpackages.append(pypackage)
> +
> +        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> +        d.setVar('FILES_' + pypackage, '')
> +        for value in python_manifest[key]['files']:
> +            d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +       # Add cached files
> +        if include_pycs == '1':
> +            for value in python_manifest[key]['cached']:
> +                    d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +        for value in python_manifest[key]['rdepends']:
> +            # Make it work with or without $PN
> +            if '${PN}' in value:
> +                value=value.split('-')[1]
> +            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> +        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> +
> +    # Prepending so to avoid python-misc getting everything
> +    packages = newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> +}
> +
> +# Files needed to create a new manifest
> +SRC_URI += "file://create_manifest3.py file://get_module_deps3.py
> file://python3-manifest.json"
> +
> +do_create_manifest() {
> +    # This task should be run with every new release of Python.
> +    # We must ensure that PACKAGECONFIG enables everything when creating
> +    # a new manifest, this is to base our new manifest on a complete
> +    # native python build, containing all dependencies, otherwise the task
> +    # wont be able to find the required files.
> +    # e.g. BerkeleyDB is an optional build dependency so it may or may not
> +    # be present, we must ensure it is.
> +
> +    cd ${WORKDIR}
> +    # This needs to be executed by python-native and NOT by HOST's python
> +    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
> +    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
> +}
> +
> +# bitbake python -c create_manifest
> +addtask do_create_manifest
> +
> +# Make sure we have native python ready when we create a new manifest
> +do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
> +do_create_manifest[depends] += "python3:do_patch"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e07d15057a9daac6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Getting reports that this breaks cross builds, for example=
 python3-dbus.<br><br><blockquote style=3D"margin:0 0 0 40px;border:none;pa=
dding:0px">tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-db=
us/1.2.6-r0/recipe-sysroot-native/usr/lib/<a href=3D"http://libpython3.7m.s=
o">libpython3.7m.so</a>: file not recognized: File format not recognized<br=
>With 3.5.6 the python3-dbus do_configure lokks like &quot;-L/home/dev/medu=
sa/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/=
python3-dbus/1.2.6-r0/recipe-sysroot/usr/lib -lpython3.5m&quot;<br>With the=
 patch 3.7.1 from the ml, it looks like &quot;L/home/dev/medusa-test/build/=
yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-d=
bus/1.2.6-r0/recipe-sysroot-native/usr/lib -lpython3.7m&quot;</blockquote><=
div><br></div>Looks like the cross/sysconfig/etc code regressed and it&#39;=
s picking up the native sysroot libraries for a cross build.<div><br></div>=
<div>Ross<br><br><br></div></div><br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Fri, 2 Nov 2018 at 17:28, Jens Rehsack &lt;<a href=3D"mailto:s=
no@netbsd.org">sno@netbsd.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Update python3 to recent 3.7.1 release.<br>
<br>
Details about new features and bug-fixes can be taken from<br>
* <a href=3D"https://docs.python.org/3/whatsnew/3.7.html" rel=3D"noreferrer=
" target=3D"_blank">https://docs.python.org/3/whatsnew/3.7.html</a><br>
* <a href=3D"https://docs.python.org/3/whatsnew/3.6.html" rel=3D"noreferrer=
" target=3D"_blank">https://docs.python.org/3/whatsnew/3.6.html</a><br>
<br>
Remove patches when they were fixed upstream and rebase the<br>
remaining ones. If necessary, the patches are adopted to<br>
keep the idea when upstream code was changed. Also remove<br>
backports from 3.6 and 3.7 into 3.5.6 codebase for TLS<br>
and multiprocessing.<br>
<br>
Open TODO: track patches in a -STABLE rebased git branch for<br>
easier rebasing or upstream submitting.<br>
<br>
Enhancement requests for Yocto project<br>
* <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12375" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D12375</a><br>
* <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12901" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D12901</a><br>
are solved by this.<br>
<br>
Rebased until e349b239c8833bcdad9b1ff1a0702ace2db71959<br>
<br>
Signed-off-by: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" target=3D=
"_blank">sno@netbsd.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/python3-dir.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../python/<a href=3D"http://python3-native_3.5.6.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-native_3.5.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 100 ------<br>
=C2=A0.../python/<a href=3D"http://python3-native_3.7.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-native_3.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 73 ++++<br>
=C2=A0meta/recipes-devtools/python/python3.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
65 +++-<br>
=C2=A0...hell-version-of-python-config-that-w.patch |=C2=A0 21 +-<br>
=C2=A0..._sysconfigdata.py-to-initialize-dist.patch |=C2=A0 66 ----<br>
=C2=A0...ontext-has-improved-default-settings.patch | 272 ---------------<b=
r>
=C2=A0...d-target-to-split-profile-generation.patch |=C2=A0 40 ---<br>
=C2=A0...S-1.3-cipher-suites-and-OP_NO_TLSv1_.patch | 227 ------------<br>
=C2=A0...for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch | 173 ---------<br>
=C2=A0....3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch | 110 ------<br>
=C2=A0...ALPN-changes-for-OpenSSL-1.1.0f-2305.patch |=C2=A0 68 ----<br>
=C2=A0.../python3/03-fix-tkinter-detection.patch=C2=A0 =C2=A0 |=C2=A0 12 +-=
<br>
=C2=A0.../python3/030-fixup-include-dirs.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 -<br>
=C2=A0.../080-distutils-dont_adjust_files.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../python/python3/150-fix-setupterm.patch=C2=A0 =C2=A0 |=C2=A0 17 -<=
br>
=C2=A0...GS-for-extensions-when-cross-compili.patch |=C2=A0 53 ++-<br>
=C2=A0.../python3/avoid-ncursesw-include-path.patch |=C2=A0 18 +-<br>
=C2=A0.../python3/avoid_warning_about_tkinter.patch |=C2=A0 18 +-<br>
=C2=A0.../python3/configure.ac-fix-LIBPL.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
21 +-<br>
=C2=A0.../python/python3/float-endian.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../python/python3/ftplib.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 60 ----<br>
=C2=A0...ssing-libraries-to-Extension-for-mul.patch |=C2=A0 26 +-<br>
=C2=A0.../python/python3/python-3.3-multilib.patch=C2=A0 | 241 +++++++-----=
-<br>
=C2=A0.../python/python3/python3-manifest.json=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
36 +-<br>
=C2=A0...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |=C2=A0 17 +-<br>
=C2=A0.../python/python3/regen-all.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 25 --<br>
=C2=A0.../python/python3/signal.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 56 ---<br>
=C2=A0...port_SOURCE_DATE_EPOCH_in_py_compile.patch |=C2=A0 97 ------<br>
=C2=A0.../python3/sysroot-include-headers.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
23 +-<br>
=C2=A0.../python3/uuid_when_cross_compiling.patch=C2=A0 =C2=A0|=C2=A0 24 ++=
<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a> | 329 --------------=
----<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.1.bb</a> | 298 ++++++++++++++=
++<br>
=C2=A033 files changed, 704 insertions(+), 1910 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-native_3.5.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3=
.5.6.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-native_3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3=
.7.1.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21=
272-Use-_sysconfigdata.py-to-initialize-dist.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-28=
043-SSLContext-has-improved-default-settings.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0002-Makefile=
-add-target-to-split-profile-generation.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0002-bpo-2913=
6-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0003-bpo-3294=
7-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0004-bpo-3357=
0-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0005-bpo-3071=
4-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/150-fix-setup=
term.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/ftplib.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/regen-all.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/signal.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/support_SOURC=
E_DATE_EPOCH_in_py_compile.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/uuid_when_cro=
ss_compiling.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3_3.5.6.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a><br=
>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3_3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.7.1.bb</a><br=
>
<br>
diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bb=
class<br>
index 06bb046d9c..ad7ea8dd9a 100644<br>
--- a/meta/classes/python3-dir.bbclass<br>
+++ b/meta/classes/python3-dir.bbclass<br>
@@ -1,4 +1,8 @@<br>
-PYTHON_BASEVERSION =3D &quot;3.5&quot;<br>
+PYTHON_BASEVERSION =3D &quot;3.7&quot;<br>
+# [d][m][u]<br>
+# d: py_debug<br>
+# m: my_malloc<br>
+# u: wide-char unicode<br>
=C2=A0PYTHON_ABI =3D &quot;m&quot;<br>
=C2=A0PYTHON_DIR =3D &quot;python${PYTHON_BASEVERSION}&quot;<br>
=C2=A0PYTHON_PN =3D &quot;python3&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-native_=
3.5.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.6.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-native_3.5.6.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-native_3.5.6.bb</a><br>
deleted file mode 100644<br>
index d5953cf4bb..0000000000<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-native_3.5.6.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.6.bb</a><br>
+++ /dev/null<br>
@@ -1,100 +0,0 @@<br>
-require recipes-devtools/python/python3.inc<br>
-<br>
-DISTRO_SRC_URI ?=3D &quot;file://sitecustomize.py&quot;<br>
-DISTRO_SRC_URI_linuxstdbase =3D &quot;&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/python/$%7BPV%7D/Py=
thon-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://www.pyth=
on.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
-file://12-distutils-prefix-is-inside-staging-area.patch \<br>
-file://python-config.patch \<br>
-file://030-fixup-include-dirs.patch \<br>
-file://070-dont-clean-ipkg-install.patch \<br>
-file://080-distutils-dont_adjust_files.patch \<br>
-file://130-readline-setup.patch \<br>
-file://150-fix-setupterm.patch \<br>
-file://python-3.3-multilib.patch \<br>
-file://03-fix-tkinter-detection.patch \<br>
-file://avoid_warning_about_tkinter.patch \<br>
-file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \<b=
r>
-file://sysroot-include-headers.patch \<br>
-file://unixccompiler.patch \<br>
-${DISTRO_SRC_URI} \<br>
-file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \<br>
-file://setup.py-check-cross_compiling-when-get-FLAGS.patch \<br>
-file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \<b=
r>
-file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \<br>
-file://regen-all.patch \<br>
-file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \<b=
r>
-file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \<b=
r>
-file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \<b=
r>
-file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \<br=
>
-file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \<br>
-&quot;<br>
-<br>
-EXTRANATIVEPATH +=3D &quot;bzip2-native&quot;<br>
-DEPENDS =3D &quot;openssl-native bzip2-replacement-native zlib-native read=
line-native sqlite3-native gdbm-native&quot;<br>
-<br>
-inherit native<br>
-<br>
-EXTRA_OECONF_append =3D &quot; --bindir=3D${bindir}/${PN} --without-ensure=
pip&quot;<br>
-<br>
-EXTRA_OEMAKE =3D &#39;\<br>
-=C2=A0 LIBC=3D&quot;&quot; \<br>
-=C2=A0 STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \<br>
-=C2=A0 STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \<br>
-=C2=A0 LIB=3D${baselib} \<br>
-=C2=A0 ARCH=3D${TARGET_ARCH} \<br>
-&#39;<br>
-<br>
-do_configure_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0autoreconf --verbose --install --force --exclud=
e=3Dautopoint ../Python-${PV}/Modules/_ctypes/libffi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,#define HAVE_GETRANDOM 1,/\* #=
undef HAVE_GETRANDOM \*/,&#39; ${B}/pyconfig.h<br>
-}<br>
-<br>
-# Regenerate all of the generated files<br>
-# This ensures that pgen and friends get created during the compile phase<=
br>
-#<br>
-do_compile_prepend() {<br>
-=C2=A0 =C2=A0 # Assuming <a href=3D"https://bugs.python.org/issue33080" re=
l=3D"noreferrer" target=3D"_blank">https://bugs.python.org/issue33080</a> h=
as been addressed in Makefile.<br>
-=C2=A0 =C2=A0 oe_runmake regen-all<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/pkgconfig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; install<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/sitecustomize.py ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${W=
ORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}/${PN}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 Parser/pgen ${D}${bindir}/${PN}=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure we use /usr/bin/env python<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/py=
thon ${D}${bindir}/${PN}`; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s|^=
#!.*|#!/usr/bin/env python3|&#39; $PYTHSCRIPT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add a symlink to the native Python so that s=
cripts can just invoke<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;nativepython&quot; and get the right o=
ne without needing absolute paths<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (these often end up too long for the #! pars=
er in the kernel as the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # buffer is 128 bytes long).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s python3-native/python3 ${D}${bindir}/nat=
ivepython3<br>
-}<br>
-<br>
-python(){<br>
-<br>
-=C2=A0 =C2=A0 # Read JSON manifest<br>
-=C2=A0 =C2=A0 import json<br>
-=C2=A0 =C2=A0 pythondir =3D d.getVar(&#39;THISDIR&#39;,True)<br>
-=C2=A0 =C2=A0 with open(pythondir+&#39;/python3/python3-manifest.json&#39;=
) as manifest_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest=3Djson.load(manifest_file)<br>
-<br>
-=C2=A0 =C2=A0 rprovides =3D d.getVar(&#39;RPROVIDES&#39;).split()<br>
-<br>
-=C2=A0 =C2=A0 # Hardcoded since it cant be python3-native-foo, should be p=
ython3-foo-native<br>
-=C2=A0 =C2=A0 pn =3D &#39;python3&#39;<br>
-<br>
-=C2=A0 =C2=A0 for key in python_manifest:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pypackage =3D pn + &#39;-&#39; + key + &#39;-n=
ative&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypackage not in rprovides:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides.append(pypackag=
e)<br>
-<br>
-=C2=A0 =C2=A0 d.setVar(&#39;RPROVIDES&#39;, &#39; &#39;.join(rprovides))<b=
r>
-}<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-native_=
3.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.7.1.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-native_3.7.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-native_3.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..3ef9f0a5e3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-native_3.7.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-native_3.7.1.bb</a><br>
@@ -0,0 +1,73 @@<br>
+require recipes-devtools/python/python3.inc<br>
+<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 file://12-distutils-prefix-is-inside-staging-area.patch \<br=
>
+=C2=A0 =C2=A0 file://0001-Do-not-use-the-shell-version-of-python-config-th=
at-w.patch \<br>
+&quot;<br>
+<br>
+EXTRANATIVEPATH +=3D &quot;bzip2-native&quot;<br>
+DEPENDS =3D &quot;openssl-native libffi-native bzip2-replacement-native zl=
ib-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-native readline-native=
 sqlite3-native gdbm-native \<br>
+&quot;<br>
+<br>
+inherit native<br>
+<br>
+EXTRA_OECONF_append =3D &quot; --bindir=3D${bindir}/${PN} --without-ensure=
pip&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &#39;\<br>
+=C2=A0 LIBC=3D&quot;&quot; \<br>
+=C2=A0 STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \<br>
+=C2=A0 STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \<br>
+=C2=A0 LIB=3D${baselib} \<br>
+=C2=A0 ARCH=3D${TARGET_ARCH} \<br>
+&#39;<br>
+<br>
+# Regenerate all of the generated files<br>
+# This ensures that pgen and friends get created during the compile phase<=
br>
+#<br>
+do_compile_prepend() {<br>
+=C2=A0 =C2=A0 # Assuming <a href=3D"https://bugs.python.org/issue33080" re=
l=3D"noreferrer" target=3D"_blank">https://bugs.python.org/issue33080</a> h=
as been addressed in Makefile.<br>
+=C2=A0 =C2=A0 oe_runmake regen-all<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/pkgconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/sitecustomize.py ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${W=
ORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}/${PN}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 Parser/pgen ${D}${bindir}/${PN}=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure we use /usr/bin/env python<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/py=
thon ${D}${bindir}/${PN}`; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s|^=
#!.*|#!/usr/bin/env python3|&#39; $PYTHSCRIPT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add a symlink to the native Python so that s=
cripts can just invoke<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;nativepython&quot; and get the right o=
ne without needing absolute paths<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (these often end up too long for the #! pars=
er in the kernel as the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # buffer is 128 bytes long).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s python3-native/python3 ${D}${bindir}/nat=
ivepython3<br>
+}<br>
+<br>
+python(){<br>
+<br>
+=C2=A0 =C2=A0 # Read JSON manifest<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 pythondir =3D d.getVar(&#39;THISDIR&#39;,True)<br>
+=C2=A0 =C2=A0 with open(pythondir+&#39;/python3/python3-manifest.json&#39;=
) as manifest_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest=3Djson.load(manifest_file)<br>
+<br>
+=C2=A0 =C2=A0 rprovides =3D d.getVar(&#39;RPROVIDES&#39;).split()<br>
+<br>
+=C2=A0 =C2=A0 # Hardcoded since it cant be python3-native-foo, should be p=
ython3-foo-native<br>
+=C2=A0 =C2=A0 pn =3D &#39;python3&#39;<br>
+<br>
+=C2=A0 =C2=A0 for key in python_manifest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pypackage =3D pn + &#39;-&#39; + key + &#39;-n=
ative&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypackage not in rprovides:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides.append(pypackag=
e)<br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&#39;RPROVIDES&#39;, &#39; &#39;.join(rprovides))<b=
r>
+}<br>
diff --git a/meta/recipes-devtools/python/python3.inc b/meta/recipes-devtoo=
ls/python/python3.inc<br>
index f565b3f171..7ad11d3d1d 100644<br>
--- a/meta/recipes-devtools/python/python3.inc<br>
+++ b/meta/recipes-devtools/python/python3.inc<br>
@@ -3,41 +3,74 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.python.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.python.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;PSFv2&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
<br>
-# TODO Remove this when we upgrade<br>
-INC_PR =3D &quot;r1&quot;<br>
-PR =3D &quot;${INC_PR}.0&quot;<br>
+PYTHON_MAJMIN =3D &quot;3.7&quot;<br>
+DISTRO_SRC_URI ?=3D &quot;file://sitecustomize.py&quot;<br>
+DISTRO_SRC_URI_linuxstdbase =3D &quot;&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/python/$%7BPV%7D/Py=
thon-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://www.pyth=
on.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 file://python-config.patch \<br>
+=C2=A0 =C2=A0 file://python-3.3-multilib.patch \<br>
+=C2=A0 =C2=A0 file://03-fix-tkinter-detection.patch \<br>
+=C2=A0 =C2=A0 file://avoid_warning_about_tkinter.patch \<br>
+=C2=A0 =C2=A0 file://uuid_when_cross_compiling.patch \<br>
+=C2=A0 =C2=A0 file://unixccompiler.patch \<br>
+=C2=A0 =C2=A0 file://sysroot-include-headers.patch \<br>
+=C2=A0 =C2=A0 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \<br>
+=C2=A0 =C2=A0 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \=
<br>
+=C2=A0 =C2=A0 file://030-fixup-include-dirs.patch \<br>
+=C2=A0 =C2=A0 file://070-dont-clean-ipkg-install.patch \<br>
+=C2=A0 =C2=A0 file://080-distutils-dont_adjust_files.patch \<br>
+=C2=A0 =C2=A0 file://130-readline-setup.patch \<br>
+=C2=A0 =C2=A0 file://0001-h2py-Fix-issue-13032-where-it-fails-with-Unicode=
Deco.patch \<br>
+=C2=A0 =C2=A0 ${DISTRO_SRC_URI} \<br>
+=C2=A0 =C2=A0 file://Use-correct-CFLAGS-for-extensions-when-cross-compili.=
patch \<br>
+&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db6ec515b22618f55fa07276b89=
7bacea&quot;<br>
+SRC_URI[md5sum] =3D &quot;0a57e9022c07fad3dadb2eef58568edb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fa7e2b8e8c9402f192ad56dc4f814089d1c4466c97d78=
0f5e5acc02c04243d6d&quot;<br>
<br>
-# TODO consolidate patch set<br>
-SRC_URI[md5sum] =3D &quot;f5a99f765e765336a3ebbb2a24ca2be3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f55cde04f521f273c7cba08912921cc5642cfc15ca7b2=
2d5829f0aff4371155f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df257cc14f81685691652a3d3e1=
b5d754&quot;<br>
<br>
=C2=A0# exclude pre-releases for both python 2.x and 3.x<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).=
tar&quot;<br>
<br>
-CVE_PRODUCT =3D &quot;python&quot;<br>
-<br>
-PYTHON_MAJMIN =3D &quot;3.5&quot;<br>
-PYTHON_BINABI =3D &quot;${PYTHON_MAJMIN}m&quot;<br>
-<br>
=C2=A0S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
<br>
-inherit autotools bluetooth pkgconfig<br>
+CVE_PRODUCT =3D &quot;python&quot;<br>
+<br>
+inherit autotools bluetooth pkgconfig python3-dir<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;\<br>
-=C2=A0 --with-threads \<br>
=C2=A0 =C2=A0--with-pymalloc \<br>
=C2=A0 =C2=A0--without-cxx-main \<br>
-=C2=A0 --with-signal-module \<br>
=C2=A0 =C2=A0--enable-shared \<br>
=C2=A0 =C2=A0--enable-ipv6=3D${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;ipv6&#39;, &#39;yes&#39;, &#39;no&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG[bluetooth] =3D &quot;,ac_cv_header_bluetooth_bluetooth_=
h=3Dno ac_cv_header_bluetooth_h=3Dno,${BLUEZ}&quot;<br>
<br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libdirleaf=3D&quot;$(echo ${libdir} | sed -e &#=
39;s:${prefix}/::&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s:SEDMELIBLEAF:${libdirleaf}:g&=
quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/<a href=3D"htt=
p://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
+}<br>
+<br>
+do_install_prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MAKESETTINGS=3D&quot;$(egrep &#39;^(ABIFLAGS|MU=
LTIARCH)=3D&#39; ${B}/Makefile | sed -E -e &#39;s/[[:space:]]//g&#39; -e &#=
39;s/=3D/=3D&quot;/&#39; -e &#39;s/$/&quot;/&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eval ${MAKESETTINGS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${ABIFLAGS}&quot; !=3D &quot;${PY=
THON_ABI}&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;do_install: configure d=
etermined ABIFLAGS &#39;${ABIFLAGS}&#39; !=3D &#39;${PYTHON_ABI}&#39; from =
python3-dir.bbclass&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${BUILD_OS}&quot; =3D &quot;x${T=
ARGET_OS}&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# no cross-compile =
at all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_PYTHON_SYSCONFIGDA=
TA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# at the very momen=
t, it&#39;s the only available target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_PYTHON_SYSCONFIGDA=
TA_NAME=3D${PYTHON_ABI}_linux_${MULTIARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s:${HOSTTOOLS_DIR}/install:insta=
ll:g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${HOSTTOO=
LS_DIR}/mkdir:mkdir:g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${libdir}/pyth=
on${PYTHON_MAJMIN}/_sysconfigdata.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${libdir}/pyth=
on${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py<br>
=C2=A0}<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell=
-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch<br>
index 8ea3f03fe0..aac34533ef 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-versio=
n-of-python-config-that-w.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-versio=
n-of-python-config-that-w.patch<br>
@@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
=C2=A0 1 file changed, 3 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 236f005..5c4337f 100644<br>
+index 31b4bcabb3..7da6d6941e 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/<a href=3D"http://pyt=
hon-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> Mi=
sc/python-config.sh<br>
+@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/<a href=3D"http://pyt=
hon-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> Mi=
sc/python-config.sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;s,@EXENAME@,$(BINDIR)/python$(LDVE=
RSION)$(EXE),&quot; &lt; $(srcdir)/Misc/<a href=3D"http://python-config.in"=
 rel=3D"noreferrer" target=3D"_blank">python-config.in</a> &gt;python-confi=
g.py<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Replace makefile compat. variable references =
with shell script compat. ones; $(VAR) -&gt; ${VAR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # Replace makefile compat. variable reference=
s with shell script compat. ones; $(VAR) -&gt; ${VAR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC sed -e &#39;s,\$$(\([A-Za-z0-9_]*\))=
,\$$\{\1\},g&#39; &lt; Misc/python-config.sh &gt;python-config<br>
--=C2=A0 =C2=A0 =C2=A0 # On Darwin, always use the python version of the sc=
ript, the shell<br>
--=C2=A0 =C2=A0 =C2=A0 # version doesn&#39;t use the compiler customization=
s that are provided<br>
--=C2=A0 =C2=A0 =C2=A0 # in python (_osx_support.py).<br>
--=C2=A0 =C2=A0 =C2=A0 if test `uname -s` =3D Darwin; then \<br>
+-=C2=A0 =C2=A0 =C2=A0 @ # On Darwin, always use the python version of the =
script, the shell<br>
+-=C2=A0 =C2=A0 =C2=A0 @ # version doesn&#39;t use the compiler customizati=
ons that are provided<br>
+-=C2=A0 =C2=A0 =C2=A0 @ # in python (_osx_support.py).<br>
+-=C2=A0 =C2=A0 =C2=A0 @if test `uname -s` =3D Darwin; then \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp python-config.py=
 python-config; \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 fi<br>
-+=C2=A0 =C2=A0 =C2=A0 # In OpenEmbedded, always use the python version of =
the script, the shell<br>
-+=C2=A0 =C2=A0 =C2=A0 # version is broken in multiple ways, and doesn&#39;=
t return correct directories<br>
++=C2=A0 =C2=A0 =C2=A0 @ # In OpenEmbedded, always use the python version o=
f the script, the shell<br>
++=C2=A0 =C2=A0 =C2=A0 @ # version is broken in multiple ways, and doesn&#3=
9;t return correct directories<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 cp python-config.py python-config<br>
<br>
<br>
=C2=A0 # Install the include files<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sys=
configdata.py-to-initialize-dist.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch<br>
deleted file mode 100644<br>
index d1c92e9eed..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigd=
ata.py-to-initialize-dist.patch<br>
+++ /dev/null<br>
@@ -1,66 +0,0 @@<br>
-From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001<br>
-From: Libin Dang &lt;<a href=3D"mailto:libin.dang@windriver.com" target=3D=
"_blank">libin.dang@windriver.com</a>&gt;<br>
-Date: Tue, 11 Apr 2017 14:12:15 +0800<br>
-Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize<br>
- distutils.sysconfig<br>
-<br>
-Backport upstream commit<br>
-<a href=3D"https://github.com/python/cpython/commit/409482251b06fe75c4ee56=
e85ffbb4b23d934159" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159</a><br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" target=
=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
----<br>
- Lib/distutils/sysconfig.py | 35 ++++-------------------------------<br>
- 1 file changed, 4 insertions(+), 31 deletions(-)<br>
-<br>
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py<br>
-index 6d5cfd0..9925d24 100644<br>
---- a/Lib/distutils/sysconfig.py<br>
-+++ b/Lib/distutils/sysconfig.py<br>
-@@ -424,38 +424,11 @@ _config_vars =3D None<br>
- <br>
- def _init_posix():<br>
-=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Initialize the module as appropriate=
 for POSIX systems.&quot;&quot;&quot;<br>
--=C2=A0 =C2=A0 g =3D {}<br>
--=C2=A0 =C2=A0 # load the installed Makefile:<br>
--=C2=A0 =C2=A0 try:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D get_makefile_filename()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_makefile(filename, g)<br>
--=C2=A0 =C2=A0 except OSError as msg:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D &quot;invalid Python installation:=
 unable to open %s&quot; % filename<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(msg, &quot;strerror&quot;):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D my_msg + &quot; (%s)=
&quot; % msg.strerror<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DistutilsPlatformError(my_msg)<br>
--<br>
--=C2=A0 =C2=A0 # load the installed pyconfig.h:<br>
--=C2=A0 =C2=A0 try:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D get_config_h_filename()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(filename) as file:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_config_h(file, g)<br>
--=C2=A0 =C2=A0 except OSError as msg:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D &quot;invalid Python installation:=
 unable to open %s&quot; % filename<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(msg, &quot;strerror&quot;):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D my_msg + &quot; (%s)=
&quot; % msg.strerror<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DistutilsPlatformError(my_msg)<br>
--<br>
--=C2=A0 =C2=A0 # On AIX, there are wrong paths to the linker scripts in th=
e Makefile<br>
--=C2=A0 =C2=A0 # -- these paths are relative to the Python source, but whe=
n installed<br>
--=C2=A0 =C2=A0 # the scripts are in another directory.<br>
--=C2=A0 =C2=A0 if python_build:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 g[&#39;LDSHARED&#39;] =3D g[&#39;BLDSHARED&#3=
9;]<br>
--<br>
-+=C2=A0 =C2=A0 # _sysconfigdata is generated at build time, see the syscon=
fig module<br>
-+=C2=A0 =C2=A0 from _sysconfigdata import build_time_vars<br>
-=C2=A0 =C2=A0 =C2=A0global _config_vars<br>
--=C2=A0 =C2=A0 _config_vars =3D g<br>
-+=C2=A0 =C2=A0 _config_vars =3D {}<br>
-+=C2=A0 =C2=A0 _config_vars.update(build_time_vars)<br>
- <br>
- <br>
- def _init_nt():<br>
--- <br>
-1.8.3.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLConte=
xt-has-improved-default-settings.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch<br>
deleted file mode 100644<br>
index 321b4afa12..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-=
improved-default-settings.patch<br>
+++ /dev/null<br>
@@ -1,272 +0,0 @@<br>
-From 758e7463c104f71b810c8588166747eeab6148d7 Mon Sep 17 00:00:00 2001<br>
-From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" target=
=3D"_blank">christian@python.org</a>&gt;<br>
-Date: Sat, 10 Sep 2016 22:43:48 +0200<br>
-Subject: [PATCH 1/4] Issue 28043: SSLContext has improved default settings=
<br>
-<br>
-The options OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_U=
SE, OP_SINGLE_ECDH_USE, OP_NO_SSLv2 (except for PROTOCOL_SSLv2), and OP_NO_=
SSLv3 (except for PROTOCOL_SSLv3) are set by default. The initial cipher su=
ite list contains only HIGH ciphers, no NULL ciphers and MD5 ciphers (excep=
t for PROTOCOL_SSLv2).<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/python/cpython/commit/358cfd426ccc0fcd6a794=
0d306602138e76420ae" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python/cpython/commit/358cfd426ccc0fcd6a7940d306602138e76420ae</a>]<br>
-<br>
-Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
----<br>
- Doc/library/ssl.rst=C2=A0 |=C2=A0 9 ++++++-<br>
- Lib/ssl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 +++++------------=
----<br>
- Lib/test/test_ssl.py | 62 +++++++++++++++++++++++---------------------<br=
>
- Modules/_ssl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++++++++++++++++++++<br>
- 4 files changed, 78 insertions(+), 54 deletions(-)<br>
-<br>
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst<br>
-index a2f008346b..14f2d68217 100644<br>
---- a/Doc/library/ssl.rst<br>
-+++ b/Doc/library/ssl.rst<br>
-@@ -1151,7 +1151,14 @@ to speed up repeated connections from the same clie=
nts.<br>
- <br>
-=C2=A0 =C2=A0 .. versionchanged:: 3.5.3<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 :data:`PROTOCOL_TLS` is the default value.<br>
-+=C2=A0 =C2=A0 =C2=A0 The context is created with secure default values. T=
he options<br>
-+=C2=A0 =C2=A0 =C2=A0 :data:`OP_NO_COMPRESSION`, :data:`OP_CIPHER_SERVER_P=
REFERENCE`,<br>
-+=C2=A0 =C2=A0 =C2=A0 :data:`OP_SINGLE_DH_USE`, :data:`OP_SINGLE_ECDH_USE`=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 :data:`OP_NO_SSLv2` (except for :data:`PROTOCOL_SSLv=
2`),<br>
-+=C2=A0 =C2=A0 =C2=A0 and :data:`OP_NO_SSLv3` (except for :data:`PROTOCOL_=
SSLv3`) are<br>
-+=C2=A0 =C2=A0 =C2=A0 set by default. The initial cipher suite list contai=
ns only ``HIGH``<br>
-+=C2=A0 =C2=A0 =C2=A0 ciphers, no ``NULL`` ciphers and no ``MD5`` ciphers =
(except for<br>
-+=C2=A0 =C2=A0 =C2=A0 :data:`PROTOCOL_SSLv2`).<br>
- <br>
- <br>
- :class:`SSLContext` objects have the following methods and attributes:<br=
>
-diff --git a/Lib/ssl.py b/Lib/ssl.py<br>
-index e1913904f3..4d302a78fa 100644<br>
---- a/Lib/ssl.py<br>
-+++ b/Lib/ssl.py<br>
-@@ -446,32 +446,16 @@ def create_default_context(purpose=3DPurpose.SERVER_=
AUTH, *, cafile=3DNone,<br>
-=C2=A0 =C2=A0 =C2=A0if not isinstance(purpose, _ASN1Object):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise TypeError(purpose)<br>
- <br>
-+=C2=A0 =C2=A0 # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSI=
ON,<br>
-+=C2=A0 =C2=A0 # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SING=
LE_ECDH_USE<br>
-+=C2=A0 =C2=A0 # by default.<br>
-=C2=A0 =C2=A0 =C2=A0context =3D SSLContext(PROTOCOL_TLS)<br>
- <br>
--=C2=A0 =C2=A0 # SSLv2 considered harmful.<br>
--=C2=A0 =C2=A0 context.options |=3D OP_NO_SSLv2<br>
--<br>
--=C2=A0 =C2=A0 # SSLv3 has problematic security and is only required for r=
eally old<br>
--=C2=A0 =C2=A0 # clients such as IE6 on Windows XP<br>
--=C2=A0 =C2=A0 context.options |=3D OP_NO_SSLv3<br>
--<br>
--=C2=A0 =C2=A0 # disable compression to prevent CRIME attacks (OpenSSL 1.0=
+)<br>
--=C2=A0 =C2=A0 context.options |=3D getattr(_ssl, &quot;OP_NO_COMPRESSION&=
quot;, 0)<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0if purpose =3D=3D Purpose.SERVER_AUTH:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# verify certs and host name in client m=
ode<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context.verify_mode =3D CERT_REQUIRED<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context.check_hostname =3D True<br>
-=C2=A0 =C2=A0 =C2=A0elif purpose =3D=3D Purpose.CLIENT_AUTH:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Prefer the server&#39;s ciphers by default =
so that we get stronger<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 # encryption<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 context.options |=3D getattr(_ssl, &quot;OP_C=
IPHER_SERVER_PREFERENCE&quot;, 0)<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use single use keys in order to improve for=
ward secrecy<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 context.options |=3D getattr(_ssl, &quot;OP_S=
INGLE_DH_USE&quot;, 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 context.options |=3D getattr(_ssl, &quot;OP_S=
INGLE_ECDH_USE&quot;, 0)<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 # disallow ciphers with known vulnerabilities=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context.set_ciphers(_RESTRICTED_SERVER_C=
IPHERS)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if cafile or capath or cadata:<br>
-@@ -497,12 +481,10 @@ def _create_unverified_context(protocol=3DPROTOCOL_T=
LS, *, cert_reqs=3DNone,<br>
-=C2=A0 =C2=A0 =C2=A0if not isinstance(purpose, _ASN1Object):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise TypeError(purpose)<br>
- <br>
-+=C2=A0 =C2=A0 # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSI=
ON,<br>
-+=C2=A0 =C2=A0 # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SING=
LE_ECDH_USE<br>
-+=C2=A0 =C2=A0 # by default.<br>
-=C2=A0 =C2=A0 =C2=A0context =3D SSLContext(protocol)<br>
--=C2=A0 =C2=A0 # SSLv2 considered harmful.<br>
--=C2=A0 =C2=A0 context.options |=3D OP_NO_SSLv2<br>
--=C2=A0 =C2=A0 # SSLv3 has problematic security and is only required for r=
eally old<br>
--=C2=A0 =C2=A0 # clients such as IE6 on Windows XP<br>
--=C2=A0 =C2=A0 context.options |=3D OP_NO_SSLv3<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if cert_reqs is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context.verify_mode =3D cert_reqs<br>
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py<br>
-index ffb7314f57..f91af7bd05 100644<br>
---- a/Lib/test/test_ssl.py<br>
-+++ b/Lib/test/test_ssl.py<br>
-@@ -73,6 +73,12 @@ NULLBYTECERT =3D data_file(&quot;nullbytecert.pem&quot;=
)<br>
- DHFILE =3D data_file(&quot;dh1024.pem&quot;)<br>
- BYTES_DHFILE =3D os.fsencode(DHFILE)<br>
- <br>
-+# Not defined in all versions of OpenSSL<br>
-+OP_NO_COMPRESSION =3D getattr(ssl, &quot;OP_NO_COMPRESSION&quot;, 0)<br>
-+OP_SINGLE_DH_USE =3D getattr(ssl, &quot;OP_SINGLE_DH_USE&quot;, 0)<br>
-+OP_SINGLE_ECDH_USE =3D getattr(ssl, &quot;OP_SINGLE_ECDH_USE&quot;, 0)<br=
>
-+OP_CIPHER_SERVER_PREFERENCE =3D getattr(ssl, &quot;OP_CIPHER_SERVER_PREFE=
RENCE&quot;, 0)<br>
-+<br>
- <br>
- def handle_error(prefix):<br>
-=C2=A0 =C2=A0 =C2=A0exc_format =3D &#39; &#39;.join(traceback.format_excep=
tion(*sys.exc_info()))<br>
-@@ -839,8 +845,9 @@ class ContextTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv=
1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# OP_ALL | OP_NO_SSLv2 | OP_NO_SSLv3 is =
the default value<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default =3D (ssl.OP_ALL | ssl.OP_NO_SSLv=
2 | ssl.OP_NO_SSLv3)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not IS_LIBRESSL and ssl.OPENSSL_VERSION_IN=
FO &gt;=3D (1, 1, 0):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default |=3D ssl.OP_NO_COMPRESS=
ION<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # SSLContext also enables these by default<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default |=3D (OP_NO_COMPRESSION | OP_CIPHER_S=
ERVER_PREFERENCE |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OP_=
SINGLE_DH_USE | OP_SINGLE_ECDH_USE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(default, ctx.options)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx.options |=3D ssl.OP_NO_TLSv1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(default | ssl.OP_NO_TLS=
v1, ctx.options)<br>
-@@ -1205,16 +1212,29 @@ class ContextTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats[&quot;x509&quot;] +=
=3D 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.cert_=
store_stats(), stats)<br>
- <br>
-+=C2=A0 =C2=A0 def _assert_context_options(self, ctx):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if OP_NO_COMPRESSION !=3D 0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &a=
mp; OP_NO_COMPRESSION,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OP_NO_COMPRESSION)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if OP_SINGLE_DH_USE !=3D 0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &a=
mp; OP_SINGLE_DH_USE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OP_SINGLE_DH_USE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if OP_SINGLE_ECDH_USE !=3D 0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &a=
mp; OP_SINGLE_ECDH_USE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OP_SINGLE_ECDH_USE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if OP_CIPHER_SERVER_PREFERENCE !=3D 0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &a=
mp; OP_CIPHER_SERVER_PREFERENCE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OP_CIPHER_SERVER_PREFERENCE)<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0def test_create_default_context(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl.create_default_context()<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_SSLv23)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_REQUIRED)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(ctx.check_hostname)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.options &amp; getattr(ssl, =
&quot;OP_NO_COMPRESSION&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getattr(ssl, &quot;OP_NO_COMPRE=
SSION&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
-+<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(SIGNING_CA) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cadata =3D f.read()<br>
-@@ -1222,40 +1242,24 @@ class ContextTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
adata=3Dcadata)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_SSLv23)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_REQUIRED)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.options &amp; getattr(ssl, =
&quot;OP_NO_COMPRESSION&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getattr(ssl, &quot;OP_NO_COMPRE=
SSION&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl.create_default_context(ssl.P=
urpose.CLIENT_AUTH)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_SSLv23)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_NONE)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.options &amp; getattr(ssl, =
&quot;OP_NO_COMPRESSION&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getattr(ssl, &quot;OP_NO_COMPRE=
SSION&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.options &amp; getattr(ssl, =
&quot;OP_SINGLE_DH_USE&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getattr(ssl, &quot;OP_SINGLE_DH=
_USE&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.options &amp; getattr(ssl, =
&quot;OP_SINGLE_ECDH_USE&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getattr(ssl, &quot;OP_SINGLE_EC=
DH_USE&quot;, 0),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test__create_stdlib_context(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl._create_stdlib_context()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_SSLv23)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_NONE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertFalse(ctx.check_hostname)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl._create_stdlib_context(ssl.P=
ROTOCOL_TLSv1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_TLSv1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_NONE)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl._create_stdlib_context(ssl.P=
ROTOCOL_TLSv1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
ert_reqs=3Dssl.CERT_REQUIRED,<br>
-@@ -1263,12 +1267,12 @@ class ContextTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_TLSv1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_REQUIRED)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(ctx.check_hostname)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl._create_stdlib_context(purpo=
se=3Dssl.Purpose.CLIENT_AUTH)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.protocol, ssl.PROTO=
COL_SSLv23)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ctx.verify_mode, ssl.CE=
RT_NONE)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ctx.options &amp; ssl.OP_NO_=
SSLv2, ssl.OP_NO_SSLv2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._assert_context_options(ctx)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test_check_hostname(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv=
1)<br>
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c<br>
-index 86482677ae..0d5c121d2c 100644<br>
---- a/Modules/_ssl.c<br>
-+++ b/Modules/_ssl.c<br>
-@@ -2330,6 +2330,7 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_=
version)<br>
-=C2=A0 =C2=A0 =C2=A0PySSLContext *self;<br>
-=C2=A0 =C2=A0 =C2=A0long options;<br>
-=C2=A0 =C2=A0 =C2=A0SSL_CTX *ctx =3D NULL;<br>
-+=C2=A0 =C2=A0 int result;<br>
- #if defined(SSL_MODE_RELEASE_BUFFERS)<br>
-=C2=A0 =C2=A0 =C2=A0unsigned long libver;<br>
- #endif<br>
-@@ -2393,8 +2394,38 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto=
_version)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options |=3D SSL_OP_NO_SSLv2;<br>
-=C2=A0 =C2=A0 =C2=A0if (proto_version !=3D PY_SSL_VERSION_SSL3)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options |=3D SSL_OP_NO_SSLv3;<br>
-+=C2=A0 =C2=A0 /* Minimal security flags for server and client side contex=
t.<br>
-+=C2=A0 =C2=A0 =C2=A0* Client sockets ignore server-side parameters. */<br=
>
-+#ifdef SSL_OP_NO_COMPRESSION<br>
-+=C2=A0 =C2=A0 options |=3D SSL_OP_NO_COMPRESSION;<br>
-+#endif<br>
-+#ifdef SSL_OP_CIPHER_SERVER_PREFERENCE<br>
-+=C2=A0 =C2=A0 options |=3D SSL_OP_CIPHER_SERVER_PREFERENCE;<br>
-+#endif<br>
-+#ifdef SSL_OP_SINGLE_DH_USE<br>
-+=C2=A0 =C2=A0 options |=3D SSL_OP_SINGLE_DH_USE;<br>
-+#endif<br>
-+#ifdef SSL_OP_SINGLE_ECDH_USE<br>
-+=C2=A0 =C2=A0 options |=3D SSL_OP_SINGLE_ECDH_USE;<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0SSL_CTX_set_options(self-&gt;ctx, options);<br>
- <br>
-+=C2=A0 =C2=A0 /* A bare minimum cipher list without completly broken ciph=
er suites.<br>
-+=C2=A0 =C2=A0 =C2=A0* It&#39;s far from perfect but gives users a better =
head start. */<br>
-+=C2=A0 =C2=A0 if (proto_version !=3D PY_SSL_VERSION_SSL2) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D SSL_CTX_set_cipher_list(ctx, &quot=
;HIGH:!aNULL:!eNULL:!MD5&quot;);<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* SSLv2 needs MD5 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D SSL_CTX_set_cipher_list(ctx, &quot=
;HIGH:!aNULL:!eNULL&quot;);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (result =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Py_DECREF(self);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_clear_error();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PyErr_SetString(PySSLErrorObject,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;No cipher can be selected.&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
- #if defined(SSL_MODE_RELEASE_BUFFERS)<br>
-=C2=A0 =C2=A0 =C2=A0/* Set SSL_MODE_RELEASE_BUFFERS. This potentially grea=
tly reduces memory<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 usage for no cost at all. However, don&#39;t d=
o this for OpenSSL versions<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-=
to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/00=
02-Makefile-add-target-to-split-profile-generation.patch<br>
deleted file mode 100644<br>
index 2b4ba316e4..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-spli=
t-profile-generation.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001<br>
-From: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_=
blank">anuj.mittal@intel.com</a>&gt;<br>
-Date: Tue, 7 Aug 2018 16:43:17 +0800<br>
-Subject: [PATCH 2/2] Makefile: add target to split profile generation<br>
-<br>
-We don&#39;t want to have profile task invoked from here and want to use<b=
r>
-qemu-user instead. Split the profile-opt task so qemu can be invoked<br>
-once binaries have been built with instrumentation and then we can go<br>
-ahead and build again using the profile data generated.<br>
-<br>
-Upstream-Status: Inappropriate [OE-specific]<br>
-<br>
-Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
----<br>
- <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_blank">M=
akefile.pre.in</a> | 6 ++----<br>
- 1 file changed, 2 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" rel=3D=
"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 84bc3ff..017a2c4 100644<br>
---- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a><br>
-+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a><br>
-@@ -469,13 +469,12 @@ profile-opt:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) profile-removal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) build_all_generate_profile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) profile-removal<br>
--=C2=A0 =C2=A0 =C2=A0 @echo &quot;Running code to generate profile data (t=
his can take a while):&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 $(MAKE) run_profile_task<br>
--=C2=A0 =C2=A0 =C2=A0 $(MAKE) build_all_merge_profile<br>
-+<br>
-+clean_and_use_profile:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Rebuilding with profile guided opti=
mizations:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) clean<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) build_all_use_profile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) profile-removal<br>
- <br>
- build_all_generate_profile:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$=
(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@&quot; LDFLAGS=3D&q=
uot;$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@&quot; LIBS=3D&quot;$(LIBS)&q=
uot;<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.=
3-cipher-suites-and-OP_NO_TLSv1_.patch b/meta/recipes-devtools/python/pytho=
n3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch<br>
deleted file mode 100644<br>
index d48cad7586..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-ciphe=
r-suites-and-OP_NO_TLSv1_.patch<br>
+++ /dev/null<br>
@@ -1,227 +0,0 @@<br>
-From e950ea68dab006944af194c9910b8f2341d1437d Mon Sep 17 00:00:00 2001<br>
-From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" target=
=3D"_blank">christian@python.org</a>&gt;<br>
-Date: Thu, 7 Sep 2017 20:23:52 -0700<br>
-Subject: [PATCH] bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLSv1_3<br=
>
- (GH-1363) (#3444)<br>
-<br>
-* bpo-29136: Add TLS 1.3 support<br>
-<br>
-TLS 1.3 introduces a new, distinct set of cipher suites. The TLS 1.3<br>
-cipher suites don&#39;t overlap with cipher suites from TLS 1.2 and earlie=
r.<br>
-Since Python sets its own set of permitted ciphers, TLS 1.3 handshake<br>
-will fail as soon as OpenSSL 1.1.1 is released. Let&#39;s enable the commo=
n<br>
-AES-GCM and ChaCha20 suites.<br>
-<br>
-Additionally the flag OP_NO_TLSv1_3 is added. It defaults to 0 (no op) wit=
h<br>
-OpenSSL prior to 1.1.1. This allows applications to opt-out from TLS 1.3<b=
r>
-now.<br>
-<br>
-Signed-off-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.org=
" target=3D"_blank">christian@python.org</a>&gt;.<br>
-(cherry picked from commit cb5b68abdeb1b1d56c581d5b4d647018703d61e3)<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/python/cpython/commit/cb5b68abdeb1b1d56c581=
d5b4d647018703d61e3" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python/cpython/commit/cb5b68abdeb1b1d56c581d5b4d647018703d61e3</a>]<br>
-<br>
-Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
----<br>
- Doc/library/ssl.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++++++++++++++<br>
- Lib/ssl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++=
+++<br>
- Lib/test/test_ssl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 ++++++++++++++++++-<br>
- .../2017-09-04-16-39-49.bpo-29136.vSn1oR.rst=C2=A0 |=C2=A0 1 +<br>
- Modules/_ssl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++<br>
- 5 files changed, 70 insertions(+), 1 deletion(-)<br>
- create mode 100644 Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136=
.vSn1oR.rst<br>
-<br>
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst<br>
-index 14f2d68217..29c5e94cf6 100644<br>
---- a/Doc/library/ssl.rst<br>
-+++ b/Doc/library/ssl.rst<br>
-@@ -285,6 +285,11 @@ purposes.<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 3DES was dropped from the default cipher string.<br>
- <br>
-+=C2=A0 =C2=A0.. versionchanged:: 3.7<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES=
_256_GCM_SHA384,<br>
-+=C2=A0 =C2=A0 =C2=A0and TLS_CHACHA20_POLY1305_SHA256 were added to the de=
fault cipher string.<br>
-+<br>
- <br>
- Random generation<br>
- ^^^^^^^^^^^^^^^^^<br>
-@@ -719,6 +724,16 @@ Constants<br>
- <br>
-=C2=A0 =C2=A0 .. versionadded:: 3.4<br>
- <br>
-+.. data:: OP_NO_TLSv1_3<br>
-+<br>
-+=C2=A0 =C2=A0Prevents a TLSv1.3 connection. This option is only applicabl=
e in conjunction<br>
-+=C2=A0 =C2=A0with :const:`PROTOCOL_TLS`. It prevents the peers from choos=
ing TLSv1.3 as<br>
-+=C2=A0 =C2=A0the protocol version. TLS 1.3 is available with OpenSSL 1.1.=
1 or later.<br>
-+=C2=A0 =C2=A0When Python has been compiled against an older version of Op=
enSSL, the<br>
-+=C2=A0 =C2=A0flag defaults to *0*.<br>
-+<br>
-+=C2=A0 =C2=A0.. versionadded:: 3.7<br>
-+<br>
- .. data:: OP_CIPHER_SERVER_PREFERENCE<br>
- <br>
-=C2=A0 =C2=A0 Use the server&#39;s cipher ordering preference, rather than=
 the client&#39;s.<br>
-@@ -783,6 +798,12 @@ Constants<br>
- <br>
-=C2=A0 =C2=A0 .. versionadded:: 3.3<br>
- <br>
-+.. data:: HAS_TLSv1_3<br>
-+<br>
-+=C2=A0 =C2=A0Whether the OpenSSL library has built-in support for the TLS=
 1.3 protocol.<br>
-+<br>
-+=C2=A0 =C2=A0.. versionadded:: 3.7<br>
-+<br>
- .. data:: CHANNEL_BINDING_TYPES<br>
- <br>
-=C2=A0 =C2=A0 List of supported TLS channel binding types.=C2=A0 Strings i=
n this list<br>
-diff --git a/Lib/ssl.py b/Lib/ssl.py<br>
-index 4d302a78fa..f233e72e1f 100644<br>
---- a/Lib/ssl.py<br>
-+++ b/Lib/ssl.py<br>
-@@ -122,6 +122,7 @@ _import_symbols(&#39;OP_&#39;)<br>
- _import_symbols(&#39;ALERT_DESCRIPTION_&#39;)<br>
- _import_symbols(&#39;SSL_ERROR_&#39;)<br>
- _import_symbols(&#39;VERIFY_&#39;)<br>
-+from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN, HAS_TLSv1_3<br>
- <br>
- from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN<br>
- <br>
-@@ -162,6 +163,7 @@ else:<br>
- # (OpenSSL&#39;s default setting is &#39;DEFAULT:!aNULL:!eNULL&#39;)<br>
- # Enable a better set of ciphers by default<br>
- # This list has been explicitly chosen to:<br>
-+#=C2=A0 =C2=A0* TLS 1.3 ChaCha20 and AES-GCM cipher suites<br>
- #=C2=A0 =C2=A0* Prefer cipher suites that offer perfect forward secrecy (=
DHE/ECDHE)<br>
- #=C2=A0 =C2=A0* Prefer ECDHE over DHE for better performance<br>
- #=C2=A0 =C2=A0* Prefer AEAD over CBC for better performance and security<=
br>
-@@ -173,6 +175,8 @@ else:<br>
- #=C2=A0 =C2=A0* Disable NULL authentication, NULL encryption, 3DES and MD=
5 MACs<br>
- #=C2=A0 =C2=A0 =C2=A0for security reasons<br>
- _DEFAULT_CIPHERS =3D (<br>
-+=C2=A0 =C2=A0 &#39;TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA25=
6:&#39;<br>
-+=C2=A0 =C2=A0 &#39;TLS13-AES-128-GCM-SHA256:&#39;<br>
-=C2=A0 =C2=A0 =C2=A0&#39;ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:E=
CDH+AES256:DH+AES256:&#39;<br>
-=C2=A0 =C2=A0 =C2=A0&#39;ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:R=
SA+AES:RSA+HIGH:&#39;<br>
-=C2=A0 =C2=A0 =C2=A0&#39;!aNULL:!eNULL:!MD5:!3DES&#39;<br>
-@@ -180,6 +184,7 @@ _DEFAULT_CIPHERS =3D (<br>
- <br>
- # Restricted and more secure ciphers for the server side<br>
- # This list has been explicitly chosen to:<br>
-+#=C2=A0 =C2=A0* TLS 1.3 ChaCha20 and AES-GCM cipher suites<br>
- #=C2=A0 =C2=A0* Prefer cipher suites that offer perfect forward secrecy (=
DHE/ECDHE)<br>
- #=C2=A0 =C2=A0* Prefer ECDHE over DHE for better performance<br>
- #=C2=A0 =C2=A0* Prefer AEAD over CBC for better performance and security<=
br>
-@@ -190,6 +195,8 @@ _DEFAULT_CIPHERS =3D (<br>
- #=C2=A0 =C2=A0* Disable NULL authentication, NULL encryption, MD5 MACs, D=
SS, RC4, and<br>
- #=C2=A0 =C2=A0 =C2=A03DES for security reasons<br>
- _RESTRICTED_SERVER_CIPHERS =3D (<br>
-+=C2=A0 =C2=A0 &#39;TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA25=
6:&#39;<br>
-+=C2=A0 =C2=A0 &#39;TLS13-AES-128-GCM-SHA256:&#39;<br>
-=C2=A0 =C2=A0 =C2=A0&#39;ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:E=
CDH+AES256:DH+AES256:&#39;<br>
-=C2=A0 =C2=A0 =C2=A0&#39;ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:R=
SA+AES:RSA+HIGH:&#39;<br>
-=C2=A0 =C2=A0 =C2=A0&#39;!aNULL:!eNULL:!MD5:!DSS:!RC4:!3DES&#39;<br>
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py<br>
-index f91af7bd05..1acc12ec2d 100644<br>
---- a/Lib/test/test_ssl.py<br>
-+++ b/Lib/test/test_ssl.py<br>
-@@ -150,6 +150,13 @@ class BasicSocketTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssl.OP_NO_COMPRESSION<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(ssl.HAS_SNI, {True, False}=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(ssl.HAS_ECDH, {True, False=
})<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_SSLv2<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_SSLv3<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_3<br>
-+=C2=A0 =C2=A0 if ssl.OPENSSL_VERSION_INFO &gt;=3D (1, 0, 1):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_2<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test_str_for_enums(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure that the PROTOCOL_* constant=
s have enum-like string<br>
-@@ -3028,12 +3035,33 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.assertEqual(s.version(), &#39;TLSv1&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertI=
s(s.version(), None)<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @unittest.skipUnless(ssl.HAS_TLSv1_3,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;test requires TLSv1.3 enabled OpenSSL&=
quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def test_tls1_3(self):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context =3D ssl.SSLContext(ssl.=
PROTOCOL_TLS)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.load_cert_chain(CERTFIL=
E)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # disable all but TLS 1.3<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.options |=3D (<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1 |=
 ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ThreadedEchoServer(context=
=3Dcontext) as server:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with context.wrap=
_socket(socket.socket()) as s:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s.c=
onnect((HOST, server.port))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.assertIn(s.cipher()[0], [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS13-AES-256-GCM-SHA384&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS13-CHACHA20-POLY1305-SHA256&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS13-AES-128-GCM-SHA256&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<=
br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@unittest.skipUnless(ssl.HAS_ECDH, &quot=
;test requires ECDH-enabled OpenSSL&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def test_default_ecdh_curve(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Issue #21015: elliptic c=
urve-based Diffie Hellman key exchange<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# should be enabled by def=
ault on SSL contexts.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context =3D ssl.SSLContext=
(ssl.PROTOCOL_SSLv23)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0context.load_cert_chain(CE=
RTFILE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TLSv1.3 defaults to PFS key a=
greement and no longer has KEA in<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cipher name.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.options |=3D ssl.OP_NO_=
TLSv1_3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Prior to OpenSSL 1.0.0, =
ECDH ciphers have to be enabled<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# explicitly using the &#3=
9;ECCdraft&#39; cipher alias.=C2=A0 Otherwise,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# our default cipher list =
should prefer ECDH-based ciphers<br>
-@@ -3394,7 +3422,6 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s.sendfile(file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.assertEqual(s.recv(1024), TEST_DATA)<br>
- <br>
--<br>
- def test_main(verbose=3DFalse):<br>
-=C2=A0 =C2=A0 =C2=A0if support.verbose:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import warnings<br>
-diff --git a/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR=
.rst b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst<br=
>
-new file mode 100644<br>
-index 0000000000..e76997ef83<br>
---- /dev/null<br>
-+++ b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst<br=
>
-@@ -0,0 +1 @@<br>
-+Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.<br>
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c<br>
-index 0d5c121d2c..c71d89607c 100644<br>
---- a/Modules/_ssl.c<br>
-+++ b/Modules/_ssl.c<br>
-@@ -4842,6 +4842,11 @@ PyInit__ssl(void)<br>
- #if HAVE_TLSv1_2<br>
-=C2=A0 =C2=A0 =C2=A0PyModule_AddIntConstant(m, &quot;OP_NO_TLSv1_1&quot;, =
SSL_OP_NO_TLSv1_1);<br>
-=C2=A0 =C2=A0 =C2=A0PyModule_AddIntConstant(m, &quot;OP_NO_TLSv1_2&quot;, =
SSL_OP_NO_TLSv1_2);<br>
-+#endif<br>
-+#ifdef SSL_OP_NO_TLSv1_3<br>
-+=C2=A0 =C2=A0 PyModule_AddIntConstant(m, &quot;OP_NO_TLSv1_3&quot;, SSL_O=
P_NO_TLSv1_3);<br>
-+#else<br>
-+=C2=A0 =C2=A0 PyModule_AddIntConstant(m, &quot;OP_NO_TLSv1_3&quot;, 0);<b=
r>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0PyModule_AddIntConstant(m, &quot;OP_CIPHER_SERVER_PREF=
ERENCE&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_OP_CIPHER_SERVER_PREFERENCE);<br>
-@@ -4890,6 +4895,14 @@ PyInit__ssl(void)<br>
-=C2=A0 =C2=A0 =C2=A0Py_INCREF(r);<br>
-=C2=A0 =C2=A0 =C2=A0PyModule_AddObject(m, &quot;HAS_ALPN&quot;, r);<br>
- <br>
-+#if defined(TLS1_3_VERSION) &amp;&amp; !defined(OPENSSL_NO_TLS1_3)<br>
-+=C2=A0 =C2=A0 r =3D Py_True;<br>
-+#else<br>
-+=C2=A0 =C2=A0 r =3D Py_False;<br>
-+#endif<br>
-+=C2=A0 =C2=A0 Py_INCREF(r);<br>
-+=C2=A0 =C2=A0 PyModule_AddObject(m, &quot;HAS_TLSv1_3&quot;, r);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0/* Mappings for error codes */<br>
-=C2=A0 =C2=A0 =C2=A0err_codes_to_names =3D PyDict_New();<br>
-=C2=A0 =C2=A0 =C2=A0err_names_to_codes =3D PyDict_New();<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-=
TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch b/meta/recipes-devtools/python/pytho=
n3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch<br>
deleted file mode 100644<br>
index 56d591d1b5..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3=
-and-OpenSSL-1.1.1-GH-876.patch<br>
+++ /dev/null<br>
@@ -1,173 +0,0 @@<br>
-From 170a614904febd14ff6cfd7a75c9bccc114b3948 Mon Sep 17 00:00:00 2001<br>
-From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" target=
=3D"_blank">christian@python.org</a>&gt;<br>
-Date: Tue, 14 Aug 2018 16:56:32 +0200<br>
-Subject: [PATCH] bpo-32947: Fixes for TLS 1.3 and OpenSSL 1.1.1 (GH-8761)<=
br>
-<br>
-Backport of TLS 1.3 related fixes from 3.7.<br>
-<br>
-Misc fixes and workarounds for compatibility with OpenSSL 1.1.1 from git<b=
r>
-master and TLS 1.3 support. With OpenSSL 1.1.1, Python negotiates TLS 1.3 =
by<br>
-default. Some test cases only apply to TLS 1.2.<br>
-<br>
-OpenSSL 1.1.1 has added a new option OP_ENABLE_MIDDLEBOX_COMPAT for TLS<br=
>
-1.3. The feature is enabled by default for maximum compatibility with<br>
-broken middle boxes. Users should be able to disable the hack and CPython&=
#39;s test suite needs<br>
-it to verify default options<br>
-<br>
-Signed-off-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.org=
" target=3D"_blank">christian@python.org</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/python/cpython/commit/2a4ee8aa01d61b6a9c8e9=
c65c211e61bdb471826" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python/cpython/commit/2a4ee8aa01d61b6a9c8e9c65c211e61bdb471826</a>]<br>
-<br>
-Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
----<br>
- Doc/library/ssl.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++<br>
- Lib/test/test_asyncio/test_events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++-<br>
- Lib/test/test_ssl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 +++++++++++++++----<br>
- .../2018-08-14-08-57-01.bpo-32947.mqStVW.rst=C2=A0 |=C2=A0 2 ++<br>
- Modules/_ssl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++<br>
- 5 files changed, 44 insertions(+), 6 deletions(-)<br>
- create mode 100644 Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947=
.mqStVW.rst<br>
-<br>
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst<br>
-index 29c5e94cf6..f63a3deec5 100644<br>
---- a/Doc/library/ssl.rst<br>
-+++ b/Doc/library/ssl.rst<br>
-@@ -757,6 +757,15 @@ Constants<br>
- <br>
-=C2=A0 =C2=A0 .. versionadded:: 3.3<br>
- <br>
-+.. data:: OP_ENABLE_MIDDLEBOX_COMPAT<br>
-+<br>
-+=C2=A0 =C2=A0Send dummy Change Cipher Spec (CCS) messages in TLS 1.3 hand=
shake to make<br>
-+=C2=A0 =C2=A0a TLS 1.3 connection look more like a TLS 1.2 connection.<br=
>
-+<br>
-+=C2=A0 =C2=A0This option is only available with OpenSSL 1.1.1 and later.<=
br>
-+<br>
-+=C2=A0 =C2=A0.. versionadded:: 3.6.7<br>
-+<br>
- .. data:: OP_NO_COMPRESSION<br>
- <br>
-=C2=A0 =C2=A0 Disable compression on the SSL channel.=C2=A0 This is useful=
 if the application<br>
-diff --git a/Lib/test/test_asyncio/test_events.py b/Lib/test/test_asyncio/=
test_events.py<br>
-index 492a84a231..6f208474b9 100644<br>
---- a/Lib/test/test_asyncio/test_events.py<br>
-+++ b/Lib/test/test_asyncio/test_events.py<br>
-@@ -1169,7 +1169,11 @@ class EventLoopTestsMixin:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.loop.run_until_complete(f_c)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# close connection<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 proto.transport.close()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # transport may be None with TLS 1.3, because=
 connection is<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # interrupted, server is unable to send sessi=
on tickets, and<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # transport is closed.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if proto.transport is not None:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proto.transport.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server.close()<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test_legacy_create_server_ssl_match_failed(self):<=
br>
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py<br>
-index 1acc12ec2d..a2e1d32a62 100644<br>
---- a/Lib/test/test_ssl.py<br>
-+++ b/Lib/test/test_ssl.py<br>
-@@ -78,6 +78,7 @@ OP_NO_COMPRESSION =3D getattr(ssl, &quot;OP_NO_COMPRESSI=
ON&quot;, 0)<br>
- OP_SINGLE_DH_USE =3D getattr(ssl, &quot;OP_SINGLE_DH_USE&quot;, 0)<br>
- OP_SINGLE_ECDH_USE =3D getattr(ssl, &quot;OP_SINGLE_ECDH_USE&quot;, 0)<br=
>
- OP_CIPHER_SERVER_PREFERENCE =3D getattr(ssl, &quot;OP_CIPHER_SERVER_PREFE=
RENCE&quot;, 0)<br>
-+OP_ENABLE_MIDDLEBOX_COMPAT =3D getattr(ssl, &quot;OP_ENABLE_MIDDLEBOX_COM=
PAT&quot;, 0)<br>
- <br>
- <br>
- def handle_error(prefix):<br>
-@@ -155,8 +156,8 @@ class BasicSocketTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssl.OP_NO_TLSv1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssl.OP_NO_TLSv1_3<br>
-=C2=A0 =C2=A0 =C2=A0if ssl.OPENSSL_VERSION_INFO &gt;=3D (1, 0, 1):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_1<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_2<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl.OP_NO_TLSv1_2<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test_str_for_enums(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure that the PROTOCOL_* constant=
s have enum-like string<br>
-@@ -854,7 +855,8 @@ class ContextTests(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default =3D (ssl.OP_ALL | ssl.OP_NO_SSLv=
2 | ssl.OP_NO_SSLv3)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# SSLContext also enables these by defau=
lt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default |=3D (OP_NO_COMPRESSION | OP_CIP=
HER_SERVER_PREFERENCE |<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OP_=
SINGLE_DH_USE | OP_SINGLE_ECDH_USE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OP_=
SINGLE_DH_USE | OP_SINGLE_ECDH_USE |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OP_=
ENABLE_MIDDLEBOX_COMPAT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(default, ctx.options)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx.options |=3D ssl.OP_NO_TLSv1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(default | ssl.OP_NO_TLS=
v1, ctx.options)<br>
-@@ -1860,11 +1862,26 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.sock, server_side=3DTrue)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.server.selected_npn_protocols.append(self.sslconn.selected_npn_prot=
ocol())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.server.selected_alpn_protocols.append(self.sslconn.selected_alpn_pr=
otocol())<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ssl.SSLEr=
ror, ConnectionResetError) as e:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (Connectio=
nResetError, BrokenPipeError) as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# We treat ConnectionResetError as though it were an<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# SSLError - OpenSSL on Ubuntu abruptly closes the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# connection when asked to use an unsupported protocol.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0#<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # B=
rokenPipeError is raised in TLS 1.3 mode, when OpenSSL<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # t=
ries to send session tickets after handshake.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # <=
a href=3D"https://github.com/openssl/openssl/issues/6342" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openssl/openssl/issues/6342</a><br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.server.conn_errors.append(str(e))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
self.server.chatty:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 handle_error(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n server:=C2=A0 bad connection attempt from=
 &quot; + repr(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addr) + &quot;:\n&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.running =3D False<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.close()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn False<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ssl.SSLEr=
ror, OSError) as e:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # O=
SError may occur with wrong protocols, e.g. both<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # s=
ides use PROTOCOL_TLS_SERVER.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# XXX Various errors can have happened here, for example<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# a mismatching protocol version, an invalid certificate,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# or a low-level bug. This should be made more discriminating.<br>
-@@ -2974,7 +2991,7 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Block on t=
he accept and wait on the connection to close.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evt.set()<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote, peer=
 =3D server.accept()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.recv(1)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.send(remot=
e.recv(4))<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D threading.Thread(tar=
get=3Dserve)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.start()<br>
-@@ -2982,6 +2999,8 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evt.wait()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client =3D context.wrap_so=
cket(socket.socket())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client.connect((host, port=
))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client.send(b&#39;data&#39;)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client.recv()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_addr =3D client.get=
sockname()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.join()<br>
-diff --git a/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW=
.rst b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst<br=
>
-new file mode 100644<br>
-index 0000000000..28de360c36<br>
---- /dev/null<br>
-+++ b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst<br=
>
-@@ -0,0 +1,2 @@<br>
-+Add OP_ENABLE_MIDDLEBOX_COMPAT and test workaround for TLSv1.3 for future=
<br>
-+compatibility with OpenSSL 1.1.1.<br>
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c<br>
-index c71d89607c..eb123a87ba 100644<br>
---- a/Modules/_ssl.c<br>
-+++ b/Modules/_ssl.c<br>
-@@ -4858,6 +4858,10 @@ PyInit__ssl(void)<br>
-=C2=A0 =C2=A0 =C2=A0PyModule_AddIntConstant(m, &quot;OP_NO_COMPRESSION&quo=
t;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_OP_NO_COMPRESSION);<br>
- #endif<br>
-+#ifdef SSL_OP_ENABLE_MIDDLEBOX_COMPAT<br>
-+=C2=A0 =C2=A0 PyModule_AddIntConstant(m, &quot;OP_ENABLE_MIDDLEBOX_COMPAT=
&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SSL_OP_ENABLE_MIDDLEBOX_COMPAT);<br>
-+#endif<br>
- <br>
- #if HAVE_SNI<br>
-=C2=A0 =C2=A0 =C2=A0r =3D Py_True;<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ci=
phers-for-OpenSSL-1.1.1-GH-6976.patch b/meta/recipes-devtools/python/python=
3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch<br>
deleted file mode 100644<br>
index b97d5501e1..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-f=
or-OpenSSL-1.1.1-GH-6976.patch<br>
+++ /dev/null<br>
@@ -1,110 +0,0 @@<br>
-From 0c9354362bfa5f90fbea8ff8237a1f1f5dba686f Mon Sep 17 00:00:00 2001<br>
-From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" target=
=3D"_blank">christian@python.org</a>&gt;<br>
-Date: Wed, 12 Sep 2018 15:20:31 +0800<br>
-Subject: [PATCH] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)<br=
>
-<br>
-Change TLS 1.3 cipher suite settings for compatibility with OpenSSL<br>
-1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by<br=
>
-default.<br>
-<br>
-Also update multissltests and Travis config to test with latest OpenSSL.<b=
r>
-<br>
-Signed-off-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.org=
" target=3D"_blank">christian@python.org</a>&gt;<br>
-(cherry picked from commit e8eb6cb7920ded66abc5d284319a8539bdc2bae3)<br>
-<br>
-Co-authored-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.or=
g" target=3D"_blank">christian@python.org</a><br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/python/cpython/commit/3e630c541b35c96bfe561=
9165255e559f577ee71" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python/cpython/commit/3e630c541b35c96bfe5619165255e559f577ee71</a>]<br>
-<br>
-Tweaked patch to not take changes for multissltests and Travis config.<br>
-<br>
-Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
----<br>
- Lib/test/test_ssl.py | 51 ++++++++++++++++++++++----------------------<br=
>
- 1 file changed, 26 insertions(+), 25 deletions(-)<br>
-<br>
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py<br>
-index a2e1d32a62..c484ead5ff 100644<br>
---- a/Lib/test/test_ssl.py<br>
-+++ b/Lib/test/test_ssl.py<br>
-@@ -3024,17 +3024,21 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sock.do_handshake()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertE=
qual(cm.exception.errno, errno.ENOTCONN)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 def test_default_ciphers(self):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context =3D ssl.SSLContext(ssl.=
PROTOCOL_SSLv23)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Force a set of =
weak ciphers on our client context<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.set_ciphe=
rs(&quot;DES&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ssl.SSLError:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&qu=
ot;no DES cipher available&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ThreadedEchoServer(CERTFIL=
E,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl_version=3Dssl.PROT=
OCOL_SSLv23,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chatty=3DFalse) as ser=
ver:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with context.wrap=
_socket(socket.socket()) as s:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def test_no_shared_ciphers(self):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_context =3D ssl.SSLConte=
xt(ssl.PROTOCOL_SSLv23)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_context.load_cert_chain(=
SIGNED_CERTFILE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context =3D ssl.SSLConte=
xt(ssl.PROTOCOL_SSLv23)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.verify_mode =3D =
ssl.CERT_REQUIRED<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.check_hostname =
=3D True<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.set_ciphers(&quo=
t;AES128&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_context.set_ciphers(&quo=
t;AES256&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # OpenSSL enables all TLS 1.3 c=
iphers, enforce TLS 1.2 for test<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.options |=3D ssl=
.OP_NO_TLSv1_3<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ThreadedEchoServer(context=
=3Dserver_context) as server:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with client_conte=
xt.wrap_socket(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 socket.socket(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 server_hostname=3D&quot;localhost&quot;) as s:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0with self.assertRaises(OSError):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s.connect((HOST, server.port))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&quot;no sha=
red cipher&quot;, str(server.conn_errors[0]))<br>
-@@ -3067,9 +3071,9 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with context=
.wrap_socket(socket.socket()) as s:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s.connect((HOST, server.port))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.assertIn(s.cipher()[0], [<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS13-AES-256-GCM-SHA384&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS13-CHACHA20-POLY1305-SHA256&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS13-AES-128-GCM-SHA256&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS_AES_256_GCM_SHA384&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS_CHACHA20_POLY1305_SHA256&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;TLS_AES_128_GCM_SHA256&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0])<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@unittest.skipUnless(ssl.HAS_ECDH, &quot=
;test requires ECDH-enabled OpenSSL&quot;)<br>
-@@ -3391,22 +3395,19 @@ else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_context =3D ssl.SSL=
Context(ssl.PROTOCOL_TLSv1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_context.verify_mode=
 =3D ssl.CERT_REQUIRED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client_context.load_verify=
_locations(SIGNING_CA)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ssl.OPENSSL_VERSION_INFO &gt=
;=3D (1, 0, 2):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.se=
t_ciphers(&quot;AES128:AES256&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_context.se=
t_ciphers(&quot;AES256&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alg1 =3D &quot;AE=
S256&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alg2 =3D &quot;AE=
S-256&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.se=
t_ciphers(&quot;AES:3DES&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_context.se=
t_ciphers(&quot;3DES&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alg1 =3D &quot;3D=
ES&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alg2 =3D &quot;DE=
S-CBC3&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_context.set_ciphers(&quo=
t;AES128:AES256&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_context.set_ciphers(&quo=
t;AES256&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_algs =3D [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;AES256&quot=
;, &quot;AES-256&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# TLS 1.3 c=
iphers are always enabled<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;TLS_C=
HACHA20&quot;, &quot;TLS_AES&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats =3D server_params_te=
st(client_context, server_context)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ciphers =3D stats[&#39;ser=
ver_shared_ciphers&#39;][0]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertGreater(len(cip=
hers), 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name, tls_version, bit=
s in ciphers:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not alg1 in na=
me.split(&quot;-&quot;) and alg2 not in name:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not any (alg i=
n name for alg in expected_algs):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.fail(name)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def test_read_write_after_close_raises_v=
aluerror(self):<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-chang=
es-for-OpenSSL-1.1.0f-2305.patch b/meta/recipes-devtools/python/python3/000=
5-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch<br>
deleted file mode 100644<br>
index d609847204..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-=
OpenSSL-1.1.0f-2305.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From 7b40cb7293cb14e5c7c8ed123efaf9acb33edae2 Mon Sep 17 00:00:00 2001<br>
-From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" target=
=3D"_blank">christian@python.org</a>&gt;<br>
-Date: Tue, 15 Aug 2017 10:33:43 +0200<br>
-Subject: [PATCH] bpo-30714: ALPN changes for OpenSSL 1.1.0f (#2305)<br>
-<br>
-OpenSSL 1.1.0 to 1.1.0e aborted the handshake when server and client<br>
-could not agree on a protocol using ALPN. OpenSSL 1.1.0f changed that.<br>
-The most recent version now behaves like OpenSSL 1.0.2 again. The ALPN<br>
-callback can pretend to not been set.<br>
-<br>
-See <a href=3D"https://github.com/openssl/openssl/pull/3158" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openssl/openssl/pull/3158</a> fo=
r more details<br>
-<br>
-Signed-off-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.org=
" target=3D"_blank">christian@python.org</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/python/cpython/commit/7b40cb7293cb14e5c7c8e=
d123efaf9acb33edae2" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python/cpython/commit/7b40cb7293cb14e5c7c8ed123efaf9acb33edae2</a>]<br>
-<br>
-Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
----<br>
- Doc/library/ssl.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 5 +++--<br>
- Lib/test/test_ssl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
- .../next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst=C2=A0 =C2=A0 =C2=
=A0 | 2 ++<br>
- 3 files changed, 8 insertions(+), 4 deletions(-)<br>
- create mode 100644 Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.S=
p7bTF.rst<br>
-<br>
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst<br>
-index 729a239a1b..0a09e7e9d4 100644<br>
---- a/Doc/library/ssl.rst<br>
-+++ b/Doc/library/ssl.rst<br>
-@@ -1447,8 +1447,9 @@ to speed up repeated connections from the same clien=
ts.<br>
-=C2=A0 =C2=A0 This method will raise :exc:`NotImplementedError` if :data:`=
HAS_ALPN` is<br>
-=C2=A0 =C2=A0 False.<br>
- <br>
--=C2=A0 =C2=A0OpenSSL 1.1.0+ will abort the handshake and raise :exc:`SSLE=
rror` when<br>
--=C2=A0 =C2=A0both sides support ALPN but cannot agree on a protocol.<br>
-+=C2=A0 =C2=A0OpenSSL 1.1.0 to 1.1.0e will abort the handshake and raise :=
exc:`SSLError`<br>
-+=C2=A0 =C2=A0when both sides support ALPN but cannot agree on a protocol.=
 1.1.0f+<br>
-+=C2=A0 =C2=A0behaves like 1.0.2, :meth:`SSLSocket.selected_alpn_protocol`=
 returns None.<br>
- <br>
-=C2=A0 =C2=A0 .. versionadded:: 3.5<br>
- <br>
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py<br>
-index d960d82065..104b7f377a 100644<br>
---- a/Lib/test/test_ssl.py<br>
-+++ b/Lib/test/test_ssl.py<br>
-@@ -3268,8 +3268,9 @@ if _have_threads:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except ssl.S=
SLError as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0stats =3D e<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if expected is No=
ne and IS_OPENSSL_1_1:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # O=
penSSL 1.1.0 raises handshake error<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (expected is N=
one and IS_OPENSSL_1_1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 and ssl.OPENSSL_VERSION_INFO &lt; (1, 1, 0, 6)):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # O=
penSSL 1.1.0 to 1.1.0e raises handshake error<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.assertIsInstance(stats, ssl.SSLError)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0msg =3D &quot;failed trying %s (s) and %s (c).\n&quot; \<br>
-diff --git a/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.r=
st b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst<br>
-new file mode 100644<br>
-index 0000000000..88394e585c<br>
---- /dev/null<br>
-+++ b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst<br>
-@@ -0,0 +1,2 @@<br>
-+Address ALPN callback changes for OpenSSL 1.1.0f. The latest version beha=
ves<br>
-+like OpenSSL 1.0.2 and no longer aborts handshake.<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.=
patch b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch=
<br>
index fddfd2b2f6..b916d04d05 100644<br>
--- a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch<b=
r>
+++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch<b=
r>
@@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]<br>
=C2=A0# will not be found.<br>
=C2=A0# Signed-Off: Michael &#39;Mickey&#39; Lauer &lt;<a href=3D"mailto:mi=
ckey@vanille.de" target=3D"_blank">mickey@vanille.de</a>&gt;<br>
<br>
-Index: Python-3.3.0rc2/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.3.0rc2.orig/setup.py=C2=A0 =C2=A0 =C2=A0 2012-09-20 15:24:14.=
009124003 -0700<br>
-+++ Python-3.3.0rc2/setup.py=C2=A0 =C2=A02012-09-20 15:25:08.449124963 -07=
00<br>
-@@ -1620,7 +1620,7 @@<br>
+diff --git a/setup.py b/setup.py<br>
+index 37c5dd58a6..7f0e4d1010 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dotversion =
=3D dotversion[:-1] + &#39;.&#39; + dotversion[-1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcl_include_sub =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tk_include_sub =3D []<br>
@@ -17,7 +17,7 @@ Index: Python-3.3.0rc2/setup.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcl_include_=
sub +=3D [dir + os.sep + &quot;tcl&quot; + dotversion]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tk_include_s=
ub +=3D [dir + os.sep + &quot;tk&quot; + dotversion]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tk_include_sub +=3D tcl_in=
clude_sub<br>
-@@ -1639,22 +1639,6 @@<br>
+@@ -1822,22 +1822,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dir not in include_dirs=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_dirs=
.append(dir)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.pa=
tch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch<br>
index 6beac7b805..c12f11c6e7 100644<br>
--- a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch<br>
+++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch<br>
@@ -22,12 +22,3 @@ Index: Python-3.3.2/setup.py<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add paths specified in the environment=
 variables LDFLAGS and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # CPPFLAGS for header and library files.=
<br>
-@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for directory in reversed(options.dirs):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0add_dir_to_list(dir_list, directory)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.normpath(sys.base_prefix) !=3D &#3=
9;/usr&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cross_compiling and os.path.normpath(s=
ys.base_prefix) !=3D &#39;/usr&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and not sysc=
onfig.get_config_var(&#39;PYTHONFRAMEWORK&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# OSX note: Don&#39;t add =
LIBDIR and INCLUDEDIR to building a framework<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# (PYTHONFRAMEWORK is set)=
 to avoid # linking problems when<br>
diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust=
_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_adju=
st_files.patch<br>
index b96419a638..1bd6e56117 100644<br>
--- a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.=
patch<br>
+++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.=
patch<br>
@@ -14,11 +14,11 @@ Upstream-Status: Inappropriate [Embedded-Specific]<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 def copy_scripts(self):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Copy each script listed in =
&#39;self.scripts&#39;; if it&#39;s marked as a<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r&quot;&quot;&quot;Copy each script listed in=
 &#39;self.scripts&#39;; if it&#39;s marked as a<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Python script in the Unix way (first lin=
e matches &#39;first_line_re&#39;,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ie. starts with &quot;\#!&quot; and cont=
ains &quot;python&quot;), then adjust the first<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 line to refer to the current Python inte=
rpreter as we copy.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Copy each script listed in =
&#39;self.scripts&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r&quot;&quot;&quot;Copy each script listed in=
 &#39;self.scripts&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.mkpath(self.build_dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfiles =3D []<br>
diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch b=
/meta/recipes-devtools/python/python3/150-fix-setupterm.patch<br>
deleted file mode 100644<br>
index 78d7c78670..0000000000<br>
--- a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch<br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-Fix warning with newer compiler<br>
-<br>
--Khem<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
---- a/Modules/_cursesmodule.c<br>
-+++ b/Modules/_cursesmodule.c<br>
-@@ -116,7 +116,7 @@ char *PyCursesVersion =3D &quot;2.2&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0#defines many common symbols (such as &quot;lines&quot=
;) which breaks the<br>
-=C2=A0 =C2=A0 =C2=A0curses module in other ways.=C2=A0 So the code will ju=
st specify<br>
-=C2=A0 =C2=A0 =C2=A0explicit prototypes here. */<br>
--extern int setupterm(char *,int,int *);<br>
-+//extern int setupterm(char *,int,int *);<br>
- #ifdef __sgi<br>
- #include &lt;term.h&gt;<br>
- #endif<br>
diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-ex=
tensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/Us=
e-correct-CFLAGS-for-extensions-when-cross-compili.patch<br>
index ae74ef531d..35b849e399 100644<br>
--- a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extension=
s-when-cross-compili.patch<br>
+++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extension=
s-when-cross-compili.patch<br>
@@ -9,6 +9,11 @@ profile-optimized build.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
+2018-08:<br>
+=C2=A0 * Rebased <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" tar=
get=3D"_blank">Makefile.pre.in</a> for 3.7<br>
+=C2=A0 * Remove patch for setup.py in favor of upstream fix<br>
+=C2=A0 -- Jens<br>
+<br>
=C2=A0Signed-off-by: Markus Lehtonen &lt;<a href=3D"mailto:markus.lehtonen@=
linux.intel.com" target=3D"_blank">markus.lehtonen@linux.intel.com</a>&gt;<=
br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a> | 4 ++--<br>
@@ -16,41 +21,31 @@ Signed-off-by: Markus Lehtonen &lt;<a href=3D"mailto:ma=
rkus.lehtonen@linux.intel.com" target=3D"_blank">markus.lehtonen@linux.inte=
l.com</a>&gt;<br>
=C2=A0 2 files changed, 4 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index e2d5d3d..84bc3ff 100644<br>
+index 4c23c0e411..0871c98f29 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -478,7 +478,7 @@ profile-opt:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) profile-removal<br>
+@@ -497,6 +497,7 @@ profile-run-stamp:<br>
<br>
=C2=A0 build_all_generate_profile:<br>
--=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@&quot; LDFLAGS=3D&quot;$(LDFLAGS) $(PGO_=
PROF_GEN_FLAG) @LTOFLAGS@&quot; LIBS=3D&quot;$(LIBS)&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@&quot; LDFLAGS=3D&quot;$=
(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@&quot; LIBS=3D&quot;$(LIBS)&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$=
(CFLAGS) $(PGO_PROF_GEN_FLAG)&quot; LDFLAGS=3D&quot;$(LDFLAGS) $(PGO_PROF_G=
EN_FLAG)&quot; LIBS=3D&quot;$(LIBS)&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG)&quot; LDFLAGS=3D&quot;$(LDFLAGS) $=
(PGO_PROF_GEN_FLAG)&quot; LIBS=3D&quot;$(LIBS)&quot;<br>
<br>
=C2=A0 run_profile_task:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0: # FIXME: can&#39;t run for a cross build<br>
-@@ -488,7 +488,7 @@ build_all_merge_profile:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LLVM_PROF_MERGER)<br>
- <br>
- build_all_use_profile:<br>
--=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@&quot; LDFLAGS=3D&quot;$(LDFLAGS) @LTOFL=
AGS@&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@&quot; LDFLAGS=3D&quot;$=
(LDFLAGS) @LTOFLAGS@&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # FIXME: can&#39;t run for a cross build<br>
+@@ -510,14 +511,14 @@ build_all_merge_profile:<br>
+ profile-opt: profile-run-stamp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Rebuilding with profile guided opti=
mizations:&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-rm -f profile-clean-stamp<br>
+-=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(PGO_PROF_USE_FLAG)&quot; LDFLAGS=3D&quot;$(LDFLAGS)&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$(CFLA=
GS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG)&quot; LDFLAGS=3D&quot;$(LDFLAGS)&q=
uot;<br>
<br>
=C2=A0 # Compile and run with gcov<br>
=C2=A0 .PHONY=3Dcoverage coverage-lcov coverage-report<br>
-diff --git a/setup.py b/setup.py<br>
-index add3346..65e83b1 100644<br>
---- a/setup.py<br>
-+++ b/setup.py<br>
-@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# compilers<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if compiler is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cross_compiling:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ccshared,cflags)=
 =3D (os.environ.get(&#39;CCSHARED&#39;) or &#39;&#39;, os.environ.get(&#39=
;CFLAGS&#39;) or &#39;&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ccshared,cflags)=
 =3D (os.environ.get(&#39;CCSHARED&#39;) or &#39;&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(os.environ.get(=
&#39;CFLAGS&#39;) or &#39;&#39;) + &#39; &#39; + sysconfig.get_config_var(&=
#39;PY_CFLAGS_NODIST&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ccshared,cf=
lags) =3D sysconfig.get_config_vars(&#39;CCSHARED&#39;,&#39;CFLAGS&#39;)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args[&#39;compiler_so&#39;=
] =3D compiler + &#39; &#39; + ccshared + &#39; &#39; + cflags<br>
--- <br>
-2.17.1<br>
-<br>
+ coverage:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Building with support for coverage =
checking:&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) clean profile-removal<br>
+-=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D&quot;$(CFLAGS) -O0=
 -pg -fprofile-arcs -ftest-coverage&quot; LIBS=3D&quot;$(LIBS) -lgcov&quot;=
<br>
++=C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS=3D&quot;$(CFLAGS) $(E=
XTRA_CFLAGS) -O0 -pg -fprofile-arcs -ftest-coverage&quot; LIBS=3D&quot;$(LI=
BS) -lgcov&quot;<br>
+ <br>
+ coverage-lcov:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Creating Coverage HTML report with =
LCOV:&quot;<br>
diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-pa=
th.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path=
.patch<br>
index f29ae53371..7e1dc4ef5b 100644<br>
--- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patc=
h<br>
+++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patc=
h<br>
@@ -6,16 +6,16 @@ hardcoded locations for include paths<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
-Index: Python-3.4.2/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.4.2.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
-+++ Python-3.4.2/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -4434,7 +4434,7 @@ fi<br>
- <br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 2b8aa4d592..1f5bf4b4b0 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -4976,7 +4976,7 @@ fi<br>
=C2=A0 # first curses header check<br>
=C2=A0 ac_save_cppflags=3D&quot;$CPPFLAGS&quot;<br>
--CPPFLAGS=3D&quot;$CPPFLAGS -I/usr/include/ncursesw&quot;<br>
-+CPPFLAGS=3D&quot;$CPPFLAGS -I=3D/usr/include/ncursesw&quot;<br>
+ if test &quot;$cross_compiling&quot; =3D no; then<br>
+-=C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS -I/usr/include/ncursesw&quot;<br>
++=C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS -I=3D/usr/include/ncursesw&quot;<br>
+ fi<br>
<br>
=C2=A0 AC_CHECK_HEADERS(curses.h ncurses.h)<br>
- <br>
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkint=
er.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter=
.patch<br>
index a3cc48c9a4..ebdd64b7b5 100644<br>
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patc=
h<br>
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patc=
h<br>
@@ -5,13 +5,17 @@ Avoid a warning by not adding this module to missing vari=
able.<br>
=C2=A0Upstream-Status: Inappropriate [distribution]<br>
<br>
=C2=A0Also simply disable the tk module since its not in DEPENDS.<br>
+<br>
+2018-08: Rebased for 3.7.0<br>
+=C2=A0 -- Jens<br>
+<br>
=C2=A0Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro=
" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
<br>
-Index: Python-3.5.3/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.3.orig/setup.py<br>
-+++ Python-3.5.3/setup.py<br>
-@@ -1558,10 +1558,12 @@ class PyBuildExt(build_ext):<br>
+diff --git a/setup.py b/setup.py<br>
+index 37c5dd58a6..0321245761 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -1608,10 +1608,12 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.extensions.extend(exts)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Call the method for detecting whether =
_tkinter can be compiled<br>
@@ -25,5 +29,5 @@ Index: Python-3.5.3/setup.py<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if &#39;_tkinter&#39; not in [<a href=
=3D"http://e.name" rel=3D"noreferrer" target=3D"_blank">e.name</a> for e in=
 self.extensions]:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 missing.append(&#39;_tkin=
ter&#39;)<br>
<br>
- ##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uncomment these lines if you want t=
o play with xxmodule.c<br>
- ##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext =3D Extension(&#39;xx&#39;, [&#39=
;xxmodule.c&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build the _uuid module if possible<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid_incs =3D find_file(&quot;uuid.h&quo=
t;, inc_dirs, [&quot;/usr/include/uuid&quot;])<br>
diff --git a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.pa=
tch b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch<br>
index 97214f9aa4..689baf00ad 100644<br>
--- a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch<br>
+++ b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch<br>
@@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that it would work =
when lib64.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
+2018-08: rebased and adopted for 3.7<br>
+=C2=A0 -- Jens<br>
+<br>
=C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> |=C2=A0 =C2=A0 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 63aef8e..aefb27f 100644<br>
+index 2b8aa4d592..0da15fbbdf 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -4366,7 +4366,7 @@ AC_MSG_RESULT($LDVERSION)<br>
- <br>
+@@ -4674,9 +4674,9 @@ AC_MSG_RESULT($LDVERSION)<br>
=C2=A0 dnl define LIBPL after ABIFLAGS and LDVERSION is defined.<br>
=C2=A0 AC_SUBST(PY_ENABLE_SHARED)<br>
--LIBPL=3D&#39;$(prefix)&#39;&quot;/lib/python${VERSION}/config-${LDVERSION=
}&quot;<br>
-+LIBPL=3D&#39;$(LIBDIR)&#39;&quot;/python${VERSION}/config-${LDVERSION}&qu=
ot;<br>
+ if test x$PLATFORM_TRIPLET =3D x; then<br>
+-=C2=A0 LIBPL=3D&#39;$(prefix)&#39;&quot;/lib/python${VERSION}/config-${LD=
VERSION}&quot;<br>
++=C2=A0 LIBPL=3D&#39;$(LIBDIR)&#39;&quot;/python${VERSION}/config-${LDVERS=
ION}&quot;<br>
+ else<br>
+-=C2=A0 LIBPL=3D&#39;$(prefix)&#39;&quot;/lib/python${VERSION}/config-${LD=
VERSION}-${PLATFORM_TRIPLET}&quot;<br>
++=C2=A0 LIBPL=3D&#39;$(LIBDIR)&#39;&quot;/python${VERSION}/config-${LDVERS=
ION}-${PLATFORM_TRIPLET}&quot;<br>
+ fi<br>
=C2=A0 AC_SUBST(LIBPL)<br>
<br>
- # Check whether right shifting a negative integer extends the sign bit<br=
>
--- <br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/float-endian.patch b/meta=
/recipes-devtools/python/python3/float-endian.patch<br>
index 6ba3f5c252..1511f00bc3 100644<br>
--- a/meta/recipes-devtools/python/python3/float-endian.patch<br>
+++ b/meta/recipes-devtools/python/python3/float-endian.patch<br>
@@ -21,19 +21,19 @@ Subject: [PATCH] Don&#39;t do runtime test to get float=
 byte order<br>
=C2=A0 create mode 100644 m4/ax_c_float_words_bigendian.m4<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index c9b755f0f4..1215969871 100644<br>
+index 2b8aa4d592..80aa37125f 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -9,6 +9,8 @@ AC_PREREQ(2.65)<br>
+@@ -11,6 +11,8 @@ AC_INIT(python, PYTHON_VERSION, <a href=3D"https://bugs.=
python.org/" rel=3D"noreferrer" target=3D"_blank">https://bugs.python.org/<=
/a>)<br>
<br>
- AC_INIT(python, PYTHON_VERSION, <a href=3D"https://bugs.python.org/" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.python.org/</a>)<br>
+ AC_CONFIG_MACRO_DIR(m4)<br>
<br>
=C2=A0+AC_CONFIG_MACRO_DIR(m4)<br>
=C2=A0+<br>
=C2=A0 AC_SUBST(BASECPPFLAGS)<br>
=C2=A0 if test &quot;$srcdir&quot; !=3D . -a &quot;$srcdir&quot; !=3D &quot=
;$(pwd)&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 # If we&#39;re building out-of-tree, we need to make s=
ure the following<br>
-@@ -4128,77 +4130,19 @@ fi<br>
+@@ -4264,77 +4266,19 @@ fi<br>
=C2=A0 # * Check for various properties of floating point *<br>
=C2=A0 # **************************************************<br>
<br>
@@ -209,4 +209,3 @@ index 0000000000..216b90d803<br>
=C2=A0+])# AX_C_FLOAT_WORDS_BIGENDIAN<br>
=C2=A0-- <br>
=C2=A02.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/ftplib.patch b/meta/recip=
es-devtools/python/python3/ftplib.patch<br>
deleted file mode 100644<br>
index 49c5b2736b..0000000000<br>
--- a/meta/recipes-devtools/python/python3/ftplib.patch<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From cabe916dc694997d4892b58986e73a713d5a2f8d Mon Sep 17 00:00:00 2001<br>
-From: &quot;Miss Islington (bot)&quot;<br>
- &lt;<a href=3D"mailto:31488909%2Bmiss-islington@users.noreply.github.com"=
 target=3D"_blank">31488909+miss-islington@users.noreply.github.com</a>&gt;=
<br>
-Date: Thu, 16 Aug 2018 15:38:03 -0400<br>
-Subject: [PATCH] [3.6] bpo-34391: Fix ftplib test for TLS 1.3 (GH-8787)<br=
>
- (#8790)<br>
-<br>
-Read from data socket to avoid &quot;[SSL] shutdown while in init&quot; ex=
ception<br>
-during shutdown of the dummy server.<br>
-<br>
-Signed-off-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.org=
" target=3D"_blank">christian@python.org</a>&gt;<br>
-<br>
-<br>
-&lt;!-- issue-number: [bpo-34391](<a href=3D"https://www.bugs.python.org/i=
ssue34391" rel=3D"noreferrer" target=3D"_blank">https://www.bugs.python.org=
/issue34391</a>) --&gt;<br>
-<a href=3D"https://bugs.python.org/issue34391" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.python.org/issue34391</a><br>
-&lt;!-- /issue-number --&gt;<br>
-(cherry picked from commit 1590c393360df059160145e7475754427bfc6680)<br>
-<br>
-<br>
-Co-authored-by: Christian Heimes &lt;<a href=3D"mailto:christian@python.or=
g" target=3D"_blank">christian@python.org</a>&gt;<br>
----<br>
- Lib/test/test_ftplib.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
- Misc/NEWS.d/next/Tests/2018-08-16-18-48-47.bpo-34391.ouNfxC.rst | 1 +<br>
- 2 files changed, 6 insertions(+)<br>
- create mode 100644 Misc/NEWS.d/next/Tests/2018-08-16-18-48-47.bpo-34391.o=
uNfxC.rst<br>
-<br>
-diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py<br>
-index 44dd73aeca..4ff2f71afb 100644<br>
---- a/Lib/test/test_ftplib.py<br>
-+++ b/Lib/test/test_ftplib.py<br>
-@@ -876,18 +876,23 @@ class TestTLS_FTPClass(TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# clear text<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.client.transfercmd(&#39;list&#=
39;) as sock:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotIsInstance(s=
ock, ssl.SSLSocket)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(sock.recv(1024=
), LIST_DATA.encode(&#39;ascii&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(self.client.voidresp(),=
 &quot;226 transfer complete&quot;)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# secured, after PROT P<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.client.prot_p()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.client.transfercmd(&#39;list&#=
39;) as sock:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIsInstance(sock=
, ssl.SSLSocket)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # consume from SSL socket to fi=
nalize handshake and avoid<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;SSLError [SSL] shutdown=
 while in init&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(sock.recv(1024=
), LIST_DATA.encode(&#39;ascii&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(self.client.voidresp(),=
 &quot;226 transfer complete&quot;)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# PROT C is issued, the connection must =
be in cleartext again<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.client.prot_c()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.client.transfercmd(&#39;list&#=
39;) as sock:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotIsInstance(s=
ock, ssl.SSLSocket)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(sock.recv(1024=
), LIST_DATA.encode(&#39;ascii&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(self.client.voidresp(),=
 &quot;226 transfer complete&quot;)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def test_login(self):<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/pass-missing-libraries-to=
-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/pass-missin=
g-libraries-to-Extension-for-mul.patch<br>
index 5c3af6b626..1ce4defe95 100644<br>
--- a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extens=
ion-for-mul.patch<br>
+++ b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extens=
ion-for-mul.patch<br>
@@ -47,16 +47,19 @@ And the semaphore issue also caused multiprocessing.Que=
ue().put() hung.<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpyt=
hon/pull/2999" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyth=
on/cpython/pull/2999</a>]<br>
<br>
+2018-08: rebased for 3.7<br>
+=C2=A0 -- Jens<br>
+<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 setup.py | 7 +++++--<br>
=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 4f0f522..d05707d 100644<br>
+index a97a7559ca..633eba8f1e 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -1606,8 +1606,10 @@ class PyBuildExt(build_ext):<br>
+@@ -1580,8 +1580,10 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif host_platform.startswith(&#39;netbs=
d&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 macros =3D dict()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries =3D []<br>
@@ -69,14 +72,11 @@ index 4f0f522..d05707d 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 macros =3D dict()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries =3D [&#39;rt&#39=
;]<br>
<br>
-@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if sysconfig.get_config_var(&#39;WITH_TH=
READ&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exts.append ( Extension(&#=
39;_multiprocessing&#39;, multiprocessing_srcs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0define_macros=3D=
list(macros.items()),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dlibraries,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_dirs=3D[=
&quot;Modules/_multiprocessing&quot;]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing.append(&#39;_multi=
processing&#39;)<br>
--- <br>
-2.7.4<br>
-<br>
+@@ -1599,6 +1601,7 @@ class PyBuildExt(build_ext):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exts.append ( Extension(&#39;_multiproce=
ssing&#39;, multiprocessing_srcs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0define_macros=3Dlist(macros.it=
ems()),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dlibraries,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_dirs=3D[&quot;Modules/=
_multiprocessing&quot;]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# End multiprocessing<br>
+ <br>
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch=
 b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch<br>
index cc35dc1617..d5bafbfba1 100644<br>
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch<br>
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch<br>
@@ -4,7 +4,7 @@ Date: Tue, 14 May 2013 15:00:26 -0700<br>
=C2=A0Subject: [PATCH 01/13] get the sys.lib from python itself and do not =
use<br>
=C2=A0 hardcoded value of &#39;lib&#39;<br>
<br>
-02/2015 Rebased for 3.4.2<br>
+08/2018 Rebased for 3.7.0<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
@@ -25,12 +25,12 @@ Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailt=
o:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro.hernande=
z@linux.intel.com</a>&gt;<br>
=C2=A0 setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++-----<br>
=C2=A0 12 files changed, 97 insertions(+), 23 deletions(-)<br>
<br>
-Index: Python-3.5.4/Include/pythonrun.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Include/pythonrun.h<br>
-+++ Python-3.5.4/Include/pythonrun.h<br>
-@@ -23,6 +23,9 @@ typedef struct {<br>
- } PyCompilerFlags;<br>
+diff --git a/Include/pythonrun.h b/Include/pythonrun.h<br>
+index 6f0c6fc655..95a597b412 100644<br>
+--- a/Include/pythonrun.h<br>
++++ b/Include/pythonrun.h<br>
+@@ -7,6 +7,9 @@<br>
+ extern &quot;C&quot; {<br>
=C2=A0 #endif<br>
<br>
=C2=A0+PyAPI_FUNC(const char *) Py_GetArch(void);<br>
@@ -39,10 +39,10 @@ Index: Python-3.5.4/Include/pythonrun.h<br>
=C2=A0 #ifndef Py_LIMITED_API<br>
=C2=A0 PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlag=
s *);<br>
=C2=A0 PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerF=
lags *);<br>
-Index: Python-3.5.4/Lib/distutils/command/install.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Lib/distutils/command/install.py<br>
-+++ Python-3.5.4/Lib/distutils/command/install.py<br>
+diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/inst=
all.py<br>
+index 0258d3deae..352fd8f792 100644<br>
+--- a/Lib/distutils/command/install.py<br>
++++ b/Lib/distutils/command/install.py<br>
=C2=A0@@ -19,6 +19,8 @@ from site import USER_BASE<br>
=C2=A0 from site import USER_SITE<br>
=C2=A0 HAS_USER_SITE =3D True<br>
@@ -63,11 +63,11 @@ Index: Python-3.5.4/Lib/distutils/command/install.py<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;headers&#39;: &#39;$base/include/py=
thon$py_version_short$abiflags/$dist_name&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;scripts&#39;: &#39;$base/bin&#39;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;data&#39;=C2=A0 =C2=A0: &#39;$base&=
#39;,<br>
-Index: Python-3.5.4/Lib/pydoc.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Lib/pydoc.py<br>
-+++ Python-3.5.4/Lib/pydoc.py<br>
-@@ -389,7 +389,7 @@ class Doc:<br>
+diff --git a/Lib/pydoc.py b/Lib/pydoc.py<br>
+index 8a6b27b16e..fc55893b18 100644<br>
+--- a/Lib/pydoc.py<br>
++++ b/Lib/pydoc.py<br>
+@@ -399,7 +399,7 @@ class Doc:<br>
=C2=A0 =C2=A0 =C2=A0 docmodule =3D docclass =3D docroutine =3D docother =3D=
 docproperty =3D docdata =3D fail<br>
<br>
=C2=A0 =C2=A0 =C2=A0 def getdocloc(self, object,<br>
@@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;python%d.%d&quot; %=C2=A0 sys.version_info[:2])):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return the location of=
 module docs or None&quot;&quot;&quot;<br>
<br>
-Index: Python-3.5.4/Lib/site.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Lib/site.py<br>
-+++ Python-3.5.4/Lib/site.py<br>
-@@ -303,12 +303,12 @@ def getsitepackages(prefixes=3DNone):<br>
+diff --git a/Lib/site.py b/Lib/site.py<br>
+index ffd132b389..3ca8270d49 100644<br>
+--- a/Lib/site.py<br>
++++ b/Lib/site.py<br>
+@@ -334,12 +334,12 @@ def getsitepackages(prefixes=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seen.add(prefix)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.sep =3D=3D &#39;/&#39;:<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.pat=
h.join(prefix, &quot;lib&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;py=
thon%d.%d&quot; % sys.version_info[:2],<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.pat=
h.join(prefix, sys.lib,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;python&quot; + sys.version[:3],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;py=
thon%d.%d&quot; % sys.version_info[:2],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;site-packages&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(prefix=
)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.pat=
h.join(prefix, &quot;lib&quot;, &quot;site-packages&quot;))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sitepackages.append(os.pat=
h.join(prefix, sys.lib, &quot;site-packages&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if sys.platform =3D=3D &quot;darwin&quot=
;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# for framework builds *on=
ly* we add the standard Apple<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# locations.<br>
-Index: Python-3.5.4/Lib/sysconfig.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Lib/sysconfig.py<br>
-+++ Python-3.5.4/Lib/sysconfig.py<br>
+=C2=A0 =C2=A0 =C2=A0return sitepackages<br>
+ <br>
+ def addsitepackages(known_paths, prefixes=3DNone):<br>
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
+index e0f9c18531..9869363977 100644<br>
+--- a/Lib/sysconfig.py<br>
++++ b/Lib/sysconfig.py<br>
=C2=A0@@ -20,10 +20,10 @@ __all__ =3D [<br>
<br>
=C2=A0 _INSTALL_SCHEMES =3D {<br>
@@ -129,7 +130,7 @@ Index: Python-3.5.4/Lib/sysconfig.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;include&#39;: &#39;{installed_base}=
/include/python&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platinclude&#39;: &#39;{installed_b=
ase}/include/python&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;scripts&#39;: &#39;{base}/bin&#39;,=
<br>
-@@ -61,10 +61,10 @@ _INSTALL_SCHEMES =3D {<br>
+@@ -62,10 +62,10 @@ _INSTALL_SCHEMES =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;data&#39;: &#39;{userbase}&#39;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 &#39;posix_user&#39;: {<br>
@@ -144,28 +145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;include&#39;: &#39;{userbase}/inclu=
de/python{py_version_short}&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;scripts&#39;: &#39;{userbase}/bin&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;data&#39;: &#39;{userbase}&#39;,<br=
>
-Index: Python-3.5.4/Lib/trace.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Lib/trace.py<br>
-+++ Python-3.5.4/Lib/trace.py<br>
-@@ -749,10 +749,10 @@ def main(argv=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# should I a=
lso call expanduser? (after all, could use $HOME)<br>
+diff --git a/Lib/trace.py b/Lib/trace.py<br>
+index 86b2101763..f3c32ec317 100755<br>
+--- a/Lib/trace.py<br>
++++ b/Lib/trace.py<br>
+@@ -659,7 +659,7 @@ def main():<br>
+=C2=A0 =C2=A0 =C2=A0opts =3D parser.parse_args()<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if opts.ignore_dir:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rel_path =3D &#39;lib&#39;, &#39;python{0.maj=
or}.{0.minor}&#39;.format(sys.version_info)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 rel_path =3D sys.lib, &#39;python{0.major}.{0=
.minor}&#39;.format(sys.version_info)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_prefix =3D os.path.join(sys.base_prefix=
, *rel_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exec_prefix =3D os.path.join(sys.base_e=
xec_prefix, *rel_path)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D s.repl=
ace(&quot;$prefix&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sys.base_prefix, &quot;lib&quo=
t;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sys.base_prefix, sys.lib,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;python&quot; + sys.version[:3]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D s.repl=
ace(&quot;$exec_prefix&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sys.base_exec_prefix, &quot;li=
b&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sys.base_exec_prefix, sys.lib,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;python&quot; + sys.version[:3]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D os.pat=
h.normpath(s)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignore_dirs.=
append(s)<br>
-Index: Python-3.5.4/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" =
target=3D"_blank">Makefile.pre.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer=
" target=3D"_blank">Makefile.pre.in</a><br>
-+++ Python-3.5.4/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" tar=
get=3D"_blank">Makefile.pre.in</a><br>
-@@ -109,6 +109,8 @@ CFLAGS_ALIASING=3D@CFLAGS_ALIASING@<br>
+diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" rel=3D=
"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
+index 31b4bcabb3..713215e57d 100644<br>
+--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a><br>
++++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a><br>
+@@ -114,6 +114,8 @@ CFLAGS_ALIASING=3D@CFLAGS_ALIASING@<br>
<br>
=C2=A0 # Machine-dependent subdirectories<br>
=C2=A0 MACHDEP=3D=C2=A0 =C2=A0 =C2=A0 @MACHDEP@<br>
@@ -174,7 +171,7 @@ Index: Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
<br>
=C2=A0 # Multiarch directory (may be empty)<br>
=C2=A0 MULTIARCH=3D=C2=A0 =C2=A0 @MULTIARCH@<br>
-@@ -128,7 +130,7 @@ LIBDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @li=
bdir@<br>
+@@ -134,7 +136,7 @@ LIBDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @li=
bdir@<br>
=C2=A0 MANDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@man=
dir@<br>
=C2=A0 INCLUDEDIR=3D=C2=A0 =C2=A0@includedir@<br>
=C2=A0 CONFINCLUDEDIR=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0$(exec_prefix)/include<b=
r>
@@ -183,7 +180,7 @@ Index: Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
=C2=A0 ABIFLAGS=3D=C2=A0 =C2=A0 =C2=A0@ABIFLAGS@<br>
<br>
=C2=A0 # Detailed destination directories<br>
-@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get<br>
+@@ -754,6 +756,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefil=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DEXEC_PREFIX=3D&#3=
9;&quot;$(exec_prefix)&quot;&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DVERSION=3D&#39;&q=
uot;$(VERSION)&quot;&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DVPATH=3D&#39;&quo=
t;$(VPATH)&quot;&#39; \<br>
@@ -191,8 +188,8 @@ Index: Python-3.5.4/<a href=3D"http://Makefile.pre.in" =
rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $@ $(srcdir)/Mod=
ules/getpath.c<br>
<br>
=C2=A0 Programs/python.o: $(srcdir)/Programs/python.c<br>
-@@ -813,7 +816,7 @@ regen-opcode:<br>
- Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/gramin=
it.h $(srcdir)/Include/Python-ast.h<br>
+@@ -842,7 +845,7 @@ regen-opcode:<br>
+ Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(s=
rcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h<br>
<br>
=C2=A0 Python/getplatform.o: $(srcdir)/Python/getplatform.c<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) -c $(PY_CORE_=
CFLAGS) -DPLATFORM=3D&#39;&quot;$(MACHDEP)&quot;&#39; -o $@ $(srcdir)/Pytho=
n/getplatform.c<br>
@@ -200,11 +197,11 @@ Index: Python-3.5.4/<a href=3D"http://Makefile.pre.in=
" rel=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
<br>
=C2=A0 Python/importdl.o: $(srcdir)/Python/importdl.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) -c $(PY_CORE_=
CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c<br>
-Index: Python-3.5.4/Modules/getpath.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Modules/getpath.c<br>
-+++ Python-3.5.4/Modules/getpath.c<br>
-@@ -105,6 +105,13 @@<br>
+diff --git a/Modules/getpath.c b/Modules/getpath.c<br>
+index 041cb14b4b..d52d1e1cdb 100644<br>
+--- a/Modules/getpath.c<br>
++++ b/Modules/getpath.c<br>
+@@ -106,6 +106,13 @@ extern &quot;C&quot; {<br>
=C2=A0 #error &quot;PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constan=
t defined&quot;<br>
=C2=A0 #endif<br>
<br>
@@ -218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c<br>
=C2=A0 #ifndef LANDMARK<br>
=C2=A0 #define LANDMARK L&quot;os.py&quot;<br>
=C2=A0 #endif<br>
-@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];<br>
- static wchar_t exec_prefix[MAXPATHLEN+1];<br>
- static wchar_t progpath[MAXPATHLEN+1];<br>
- static wchar_t *module_search_path =3D NULL;<br>
-+static wchar_t *lib_python =3D L&quot;&quot; LIB_PYTHON;<br>
- <br>
- /* Get file status. Encode the path to the locale encoding. */<br>
- <br>
-@@ -494,7 +502,7 @@ calculate_path(void)<br>
-=C2=A0 =C2=A0 =C2=A0_pythonpath =3D Py_DecodeLocale(PYTHONPATH, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0_prefix =3D Py_DecodeLocale(PREFIX, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0_exec_prefix =3D Py_DecodeLocale(EXEC_PREFIX, NULL);<b=
r>
--=C2=A0 =C2=A0 lib_python =3D Py_DecodeLocale(&quot;lib/python&quot; VERSI=
ON, NULL);<br>
-+=C2=A0 =C2=A0 lib_python =3D Py_DecodeLocale(LIB_PYTHON, NULL);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!_pythonpath || !_prefix || !_exec_prefix || !lib_=
python) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Py_FatalError(<br>
-Index: Python-3.5.4/Python/getplatform.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Python/getplatform.c<br>
-+++ Python-3.5.4/Python/getplatform.c<br>
+@@ -867,7 +874,7 @@ calculate_init(PyCalculatePath *calculate,<br>
+=C2=A0 =C2=A0 =C2=A0if (!calculate-&gt;prefix) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DECODE_LOCALE_ERR(&quot;EXEC_PREF=
IX define&quot;, len);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 calculate-&gt;lib_python =3D Py_DecodeLocale(&quot;lib/pyth=
on&quot; VERSION, &amp;len);<br>
++=C2=A0 =C2=A0 calculate-&gt;lib_python =3D Py_DecodeLocale(LIB_PYTHON, &a=
mp;len);<br>
+=C2=A0 =C2=A0 =C2=A0if (!calculate-&gt;lib_python) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DECODE_LOCALE_ERR(&quot;EXEC_PREF=
IX define&quot;, len);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/Python/getplatform.c b/Python/getplatform.c<br>
+index 81a0f7ac53..bc7127ae3e 100644<br>
+--- a/Python/getplatform.c<br>
++++ b/Python/getplatform.c<br>
=C2=A0@@ -10,3 +10,23 @@ Py_GetPlatform(void)<br>
=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return PLATFORM;<br>
+=C2=A0 =C2=A0 =C2=A0return PLATFORM;<br>
=C2=A0 }<br>
=C2=A0+<br>
=C2=A0+#ifndef ARCH<br>
@@ -263,11 +252,11 @@ Index: Python-3.5.4/Python/getplatform.c<br>
=C2=A0+{<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 return LIB;<br>
=C2=A0+}<br>
-Index: Python-3.5.4/Python/sysmodule.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/Python/sysmodule.c<br>
-+++ Python-3.5.4/Python/sysmodule.c<br>
-@@ -1827,6 +1827,10 @@ _PySys_Init(void)<br>
+diff --git a/Python/sysmodule.c b/Python/sysmodule.c<br>
+index 177b830762..38112b831e 100644<br>
+--- a/Python/sysmodule.c<br>
++++ b/Python/sysmodule.c<br>
+@@ -2324,6 +2324,10 @@ _PySys_BeginInit(PyObject **sysmod)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PyUnicode_FromString(Py_GetCopyright()));<br>
=C2=A0 =C2=A0 =C2=A0 SET_SYS_FROM_STRING(&quot;platform&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PyUnicode_FromString(Py_GetPlatform()));<br>
@@ -275,16 +264,16 @@ Index: Python-3.5.4/Python/sysmodule.c<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PyUnicode_FromString(Py_GetArch()));<br>
=C2=A0+=C2=A0 =C2=A0 SET_SYS_FROM_STRING(&quot;lib&quot;,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PyUnicode_FromString(Py_GetLib()));<br>
-=C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;executable&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PyUnicode_FromWideChar(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Py_GetProgramFullPath(), -1));<br>
-Index: Python-3.5.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
-+++ Python-3.5.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -885,6 +885,41 @@ PLATDIR=3Dplat-$MACHDEP<br>
- AC_SUBST(PLATDIR)<br>
- AC_SUBST(PLATFORM_TRIPLET)<br>
+=C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;maxsize&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PyLong_FromSsize_t(PY_SSIZE_T_MAX));<br>
+=C2=A0 =C2=A0 =C2=A0SET_SYS_FROM_STRING(&quot;float_info&quot;,<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 5b66624d78..1c88696532 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -867,6 +867,41 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],<br>
+ LDFLAGS=3D&quot;$save_LDFLAGS&quot;<br>
+ AC_SUBST(NO_AS_NEEDED)<br>
<br>
=C2=A0+AC_SUBST(ARCH)<br>
=C2=A0+AC_MSG_CHECKING(ARCH)<br>
@@ -322,13 +311,13 @@ Index: Python-3.5.4/<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0+esac<br>
=C2=A0+AC_MSG_RESULT($LIB)<br>
<br>
- AC_MSG_CHECKING([for -Wl,--no-as-needed])<br>
- save_LDFLAGS=3D&quot;$LDFLAGS&quot;<br>
-Index: Python-3.5.4/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/setup.py<br>
-+++ Python-3.5.4/setup.py<br>
-@@ -494,7 +494,7 @@ class PyBuildExt(build_ext):<br>
+ # checks for UNIX variants that set C preprocessor variables<br>
+ AC_USE_SYSTEM_EXTENSIONS<br>
+diff --git a/setup.py b/setup.py<br>
+index 37c5dd58a6..b82b7177bc 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -541,7 +541,7 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # directories (i.e. &#39;.&#39; and &#39=
;Include&#39;) must be first.=C2=A0 See issue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 10520.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cross_compiling:<br>
@@ -337,17 +326,16 @@ Index: Python-3.5.4/setup.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_dir_to_list(self.compi=
ler.include_dirs, &#39;/usr/local/include&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # only change this for cross builds for =
3.3, issues on Mageia<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cross_compiling:<br>
-@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# be assumed that no additional -I,-L di=
rectives are needed.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not cross_compiling:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lib_dirs =3D self.compiler=
.library_dirs + [<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;/lib64&#39;,=
 &#39;/usr/lib64&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;/lib&#39;, &=
#39;/usr/lib&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;/&#39; + sys=
.lib, &#39;/usr/&#39; + sys.lib,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inc_dirs =3D self.compiler=
.include_dirs + [&#39;/usr/include&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):<br>
+@@ -579,7 +579,7 @@ class PyBuildExt(build_ext):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_dir_to_list(self.compi=
ler.include_dirs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysconfig.get_config_var(&quot;INCLUDEDIR&qu=
ot;))<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 system_lib_dirs =3D [&#39;/lib64&#39;, &#39;/=
usr/lib64&#39;, &#39;/lib&#39;, &#39;/usr/lib&#39;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 system_lib_dirs =3D [&#39;/&#39; + sys.lib, &=
#39;/usr/&#39; + sys.lib]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system_include_dirs =3D [&#39;/usr/inclu=
de&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# lib_dirs and inc_dirs are used to sear=
ch for files;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# if a file is found in one of those dir=
ectories, it can<br>
+@@ -836,11 +836,11 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif curses_library:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 readline_lib=
s.append(curses_library)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.compiler.find_li=
brary_file(lib_dirs +<br>
@@ -361,3 +349,26 @@ Index: Python-3.5.4/setup.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_link_args=
=3Dreadline_extra_link_args,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries=3Dread=
line_libs) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check lib =
directories parallel to the location of the header<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0db_dirs_to_c=
heck =3D [<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db_=
incdir.replace(&quot;include&quot;, &#39;lib64&#39;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db_=
incdir.replace(&quot;include&quot;, &#39;lib&#39;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 db_=
incdir.replace(&quot;include&quot;, sys.lib),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if host_plat=
form !=3D &#39;darwin&#39;:<br>
+@@ -1166,10 +1165,8 @@ class PyBuildExt(build_ext):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if sqlite_incdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite_dirs_to_check =3D [=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sqli=
te_incdir, &#39;..&#39;, &#39;lib64&#39;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sqli=
te_incdir, &#39;..&#39;, &#39;lib&#39;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sqli=
te_incdir, &#39;..&#39;, &#39;..&#39;, &#39;lib64&#39;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sqli=
te_incdir, &#39;..&#39;, &#39;..&#39;, &#39;lib&#39;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sqli=
te_incdir, &#39;..&#39;, sys.lib),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(sqli=
te_incdir, &#39;..&#39;, &#39;..&#39;, sys.lib),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite_libfile =3D self.co=
mpiler.find_library_file(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite_dirs_to_check + lib_dir=
s, &#39;sqlite3&#39;)<br>
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json<br>
index f922561368..aff5b63289 100644<br>
--- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
@@ -27,24 +27,17 @@<br>
=C2=A0 =C2=A0 =C2=A0&quot;asyncio&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;summary&quot;: &quot;Python Asynchr=
onous I/&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rdepends&quot;: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compression&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;core&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;logging&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;multiprocessing&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;netclient&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/asyncio&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/concurrent&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/concurrent/futures&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/concurrent/futures&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_asyncio.*.so&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cached&quot;: []<br>
=C2=A0 =C2=A0 =C2=A0},<br>
@@ -149,7 +142,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/_collections_abc.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/_markupbase.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/_sitebuiltins.py&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/_sysconfigdata.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/_sysconfigdata*.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/_weakrefset.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/abc.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/argparse.py&quot;,<br>
@@ -162,6 +155,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/collections/abc.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/configparser.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/contextlib.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/contextvars.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/copy.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/copyreg.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/csv.py&quot;,<br>
@@ -191,6 +185,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/__pycache__/time.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_bisect.*.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_contextvars.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_csv.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_heapq.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_opcode.*.so&quot;,<br>
@@ -256,6 +251,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/codeop.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/configparser.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/contextlib.*.pyc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/__pycache__/contextvars.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/copy.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/copyreg.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/csv.*.pyc&quot;,<br>
@@ -323,9 +319,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/crypt.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/hashlib.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_blake2.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_crypt.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_hashlib.*.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_md5.*.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_sha1.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_sha256.*.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_sha3.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_sha512.*.so&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cached&quot;: [<br>
@@ -729,7 +729,9 @@<br>
=C2=A0 =C2=A0 =C2=A0&quot;multiprocessing&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;summary&quot;: &quot;Python multipr=
ocessing support&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rdepends&quot;: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/lib-dynload/_multiprocessing.*.so&quot;,<br>
@@ -740,18 +742,14 @@<br>
=C2=A0 =C2=A0 =C2=A0&quot;netclient&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;summary&quot;: &quot;Python Interne=
t Protocol clients&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rdepends&quot;: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compression&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;core&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypt&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ctypes&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;datetime&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;email&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;math&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mime&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/base64.py&quot;,<br>
@@ -759,6 +757,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/hmac.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/http&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/http/__pycache__&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_uuid.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/mimetypes.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/nntplib.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/poplib.py&quot;,<br>
@@ -1043,13 +1042,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/_dummy_thread.py&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/_threading_local.py&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/dummy_threading.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/lib-dynload/_queue.*.so&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/queue.py&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cached&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/_dummy_thread.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/_threading_local.*.pyc&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_M=
AJMIN}/__pycache__/dummy_threading.*.pyc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python${PYT=
HON_MAJMIN}/__pycache__/queue.*.pyc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
=C2=A0 =C2=A0 =C2=A0},<br>
diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPA=
TH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python=
3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch<br>
index a4f8bd4710..c6aa581b4c 100644<br>
--- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-=
PYTHON_FOR_BUILD.patch<br>
+++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-=
PYTHON_FOR_BUILD.patch<br>
@@ -5,21 +5,24 @@ Subject: [PATCH] python3 use CROSSPYTHONPATH for PYTHON_F=
OR_BUILD<br>
<br>
=C2=A0Upstream-Status: Inappropriate [Cross compile specific]<br>
<br>
+2018-08: Rebased and adopted for 3.7<br>
+=C2=A0 -- Jens<br>
+<br>
=C2=A0Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windri=
ver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-Index: Python-3.5.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.5.4.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
-+++ Python-3.5.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -73,7 +73,7 @@ if test &quot;$cross_compiling&quot; =3D yes; then<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 2b8aa4d592..a361436f4f 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -75,7 +75,7 @@ if test &quot;$cross_compiling&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([python$PACKAGE_VERS=
ION interpreter not found])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT($interp)<br>
--=C2=A0 =C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs=
_builddir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(=
shell test -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`cat pybuilddi=
r.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) &#39;$interp<br>
-+=C2=A0 =C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs=
_builddir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(=
CROSSPYTHONPATH) &#39;$interp<br>
+-=C2=A0 =C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs=
_builddir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(=
shell test -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`cat pybuilddi=
r.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAG=
S)_$(MACHDEP)_$(MULTIARCH) &#39;$interp<br>
++=C2=A0 =C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs=
_builddir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(=
CROSSPYTHONPATH) _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(=
MACHDEP)_$(MULTIARCH) &#39;$interp<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 elif test &quot;$cross_compiling&quot; =3D maybe; then<br>
=C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([Cross compiling required --host=3DHOST-T=
UPLE and --build=3DARCH])<br>
diff --git a/meta/recipes-devtools/python/python3/regen-all.patch b/meta/re=
cipes-devtools/python/python3/regen-all.patch<br>
deleted file mode 100644<br>
index 36b9d9d919..0000000000<br>
--- a/meta/recipes-devtools/python/python3/regen-all.patch<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-python3-native: run regen-importlib target correctly<br>
-<br>
-regen-importlib depends on other regen- targets, so we must be sure to<br>
-run it after (most of) the others.=C2=A0 In reality, we do not need to run=
 it<br>
-at all since &quot;make&quot; will invoke it, if necessary.=C2=A0 We do no=
t want to<br>
-rely on that, though.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
-<br>
-<br>
-<br>
---- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a><br>
-+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a><br>
-@@ -709,7 +709,8 @@ regen-importlib: Programs/_freeze_import<br>
- #########################################################################=
###<br>
- # Regenerate all generated files<br>
- <br>
--regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-gramma=
r regen-ast regen-importlib<br>
-+regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-gramma=
r regen-ast<br>
-+=C2=A0 =C2=A0 =C2=A0 $(MAKE) regen-importlib<br>
- <br>
- #########################################################################=
###<br>
- # Special rules for object files<br>
diff --git a/meta/recipes-devtools/python/python3/signal.patch b/meta/recip=
es-devtools/python/python3/signal.patch<br>
deleted file mode 100644<br>
index 534a097771..0000000000<br>
--- a/meta/recipes-devtools/python/python3/signal.patch<br>
+++ /dev/null<br>
@@ -1,56 +0,0 @@<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 4315389df3c4e8c1f94a18ab11a4b234762132b1 Mon Sep 17 00:00:00 2001<br>
-From: Antoine Pitrou &lt;<a href=3D"mailto:pitrou@free.fr" target=3D"_blan=
k">pitrou@free.fr</a>&gt;<br>
-Date: Mon, 23 Apr 2018 22:22:49 +0200<br>
-Subject: [PATCH] [3.6] bpo-33329: Fix multiprocessing regression on newer<=
br>
- glibcs (GH-6575) (GH-6582)<br>
-<br>
-Starting with glibc 2.27.9000-xxx, sigaddset() can return EINVAL for some<=
br>
-reserved signal numbers between 1 and NSIG.=C2=A0 The `range(1, NSIG)` idi=
om<br>
-is commonly used to select all signals for blocking with `pthread_sigmask`=
.<br>
-So we ignore the sigaddset() return value until we expose sigfillset()<br>
-to provide a better idiom.<br>
-(cherry picked from commit 25038ecfb665bef641abf8cb61afff7505b0e008)<br>
----<br>
- .../next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst=C2=A0 |=C2=A0 1=
 +<br>
- Modules/signalmodule.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 14 ++++++++------<br>
- 2 files changed, 9 insertions(+), 6 deletions(-)<br>
- create mode 100644 Misc/NEWS.d/next/Library/2018-04-23-13-21-39.bpo-33329=
.lQ-Eod.rst<br>
-<br>
-diff --git a/Modules/signalmodule.c b/Modules/signalmodule.c<br>
-index e0d06b434d..138e74e8a9 100644<br>
---- a/Modules/signalmodule.c<br>
-+++ b/Modules/signalmodule.c<br>
-@@ -744,7 +744,6 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mask)=
<br>
-=C2=A0 =C2=A0 =C2=A0int result =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0PyObject *iterator, *item;<br>
-=C2=A0 =C2=A0 =C2=A0long signum;<br>
--=C2=A0 =C2=A0 int err;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0sigemptyset(mask);<br>
- <br>
-@@ -766,11 +765,14 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mas=
k)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Py_DECREF(item);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (signum =3D=3D -1 &amp;&amp; PyErr_Oc=
curred())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 &lt; signum &amp;&amp; signum &lt; NSIG=
)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D sigaddset(mask, (int)si=
gnum);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D 1;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 &lt; signum &amp;&amp; signum &lt; NSIG=
) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* bpo-33329: ignore sigaddset(=
) return value as it can fail<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for some reserved signa=
ls, but we want the `range(1, NSIG)`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* idiom to allow selectin=
g all valid signals.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) sigaddset(mask, (int)sig=
num);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PyErr_Format(PyExc_ValueEr=
ror,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;signal number %ld out of range&quot;, signum);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH=
_in_py_compile.patch b/meta/recipes-devtools/python/python3/support_SOURCE_=
DATE_EPOCH_in_py_compile.patch<br>
deleted file mode 100644<br>
index 32ecab9fec..0000000000<br>
--- a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_=
compile.patch<br>
+++ /dev/null<br>
@@ -1,97 +0,0 @@<br>
-The compiled .pyc files contain time stamp corresponding to the compile ti=
me.<br>
-This prevents binary reproducibility. This patch allows to achieve binary<=
br>
-reproducibility by overriding the build time stamp by the value <br>
-exported via SOURCE_DATE_EPOCH. <br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
-<br>
-<br>
-From aeab488630fdb1b56a8d0b0c13fa88706b2afe9b Mon Sep 17 00:00:00 2001<br>
-From: &quot;Bernhard M. Wiedemann&quot; &lt;<a href=3D"mailto:bwiedemann@s=
use.de" target=3D"_blank">bwiedemann@suse.de</a>&gt;<br>
-Date: Sat, 25 Feb 2017 06:42:28 +0100<br>
-Subject: [PATCH] bpo-29708: support SOURCE_DATE_EPOCH env var in py_compil=
e<br>
-<br>
-to allow for reproducible builds of python packages<br>
-<br>
-See <a href=3D"https://reproducible-builds.org/" rel=3D"noreferrer" target=
=3D"_blank">https://reproducible-builds.org/</a> for why this is good<br>
-and <a href=3D"https://reproducible-builds.org/specs/source-date-epoch/" r=
el=3D"noreferrer" target=3D"_blank">https://reproducible-builds.org/specs/s=
ource-date-epoch/</a><br>
-for the definition of this variable.<br>
-<br>
-Background:<br>
-In some distributions like openSUSE, binary rpms contain precompiled .pyc =
files.<br>
-<br>
-And packages like amqp or twisted dynamically generate .py files at build =
time<br>
-so those have the current time and that timestamp gets embedded<br>
-into the .pyc file header.<br>
-When we then adapt file timestamps in rpms to be constant,<br>
-the timestamp in the .pyc header will no more match<br>
-the .py timestamp in the filesystem.<br>
-The software will still work, but it will not use the .pyc file as it shou=
ld.<br>
----<br>
- Doc/library/py_compile.rst=C2=A0 |=C2=A0 4 ++++<br>
- Lib/py_compile.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<=
br>
- Lib/test/test_py_compile.py | 19 +++++++++++++++++++<br>
- 3 files changed, 27 insertions(+)<br>
-<br>
-diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst<br>
-index 0af8fb1..841f3e8 100644<br>
---- a/Doc/library/py_compile.rst<br>
-+++ b/Doc/library/py_compile.rst<br>
-@@ -53,6 +53,10 @@ byte-code cache files in the directory containing the s=
ource code.<br>
-=C2=A0 =C2=A0 :func:`compile` function.=C2=A0 The default of ``-1`` select=
s the optimization<br>
-=C2=A0 =C2=A0 level of the current interpreter.<br>
- <br>
-+=C2=A0 =C2=A0If the SOURCE_DATE_EPOCH environment variable is set, the .p=
y file mtime<br>
-+=C2=A0 =C2=A0and timestamp entry in .pyc file header, will be limited to =
this value.<br>
-+=C2=A0 =C2=A0See <a href=3D"https://reproducible-builds.org/specs/source-=
date-epoch/" rel=3D"noreferrer" target=3D"_blank">https://reproducible-buil=
ds.org/specs/source-date-epoch/</a> for more info.<br>
-+<br>
-=C2=A0 =C2=A0 .. versionchanged:: 3.2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Changed default value of *cfile* to be :PEP:`31=
47`-compliant.=C2=A0 Previous<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default was *file* + ``&#39;c&#39;`` (``&#39;o&=
#39;`` if optimization was enabled).<br>
-diff --git a/Lib/py_compile.py b/Lib/py_compile.py<br>
-index 11c5b50..62dcdc7 100644<br>
---- a/Lib/py_compile.py<br>
-+++ b/Lib/py_compile.py<br>
-@@ -137,6 +137,10 @@ def compile(file, cfile=3DNone, dfile=3DNone, doraise=
=3DFalse, optimize=3D-1):<br>
-=C2=A0 =C2=A0 =C2=A0except FileExistsError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
-=C2=A0 =C2=A0 =C2=A0source_stats =3D loader.path_stats(file)<br>
-+=C2=A0 =C2=A0 sde =3D os.environ.get(&#39;SOURCE_DATE_EPOCH&#39;)<br>
-+=C2=A0 =C2=A0 if sde and source_stats[&#39;mtime&#39;] &gt; int(sde):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 source_stats[&#39;mtime&#39;] =3D int(sde)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.utime(file, (source_stats[&#39;mtime&#39;]=
, source_stats[&#39;mtime&#39;]))<br>
-=C2=A0 =C2=A0 =C2=A0bytecode =3D importlib._bootstrap_external._code_to_by=
tecode(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code, source_stats[&#39;mt=
ime&#39;], source_stats[&#39;size&#39;])<br>
-=C2=A0 =C2=A0 =C2=A0mode =3D importlib._bootstrap_external._calc_mode(file=
)<br>
-diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py<br>
-index 4a6caa5..3d09963 100644<br>
---- a/Lib/test/test_py_compile.py<br>
-+++ b/Lib/test/test_py_compile.py<br>
-@@ -98,6 +98,25 @@ def test_bad_coding(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertFalse(os.path.exists(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0importlib.util.cache_from_=
source(bad_coding)))<br>
- <br>
-+=C2=A0 =C2=A0 def test_source_date_epoch(self):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testtime =3D 123456789<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_sde =3D os.getenv(&quot;SOURCE_DATE_EPOC=
H&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&quot;SOURCE_DATE_EPOCH&quot;] =3D=
 str(testtime)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 py_compile.compile(self.source_path, self.pyc=
_path)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if orig_sde:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&quot;SOURCE_DATE_EP=
OCH&quot;] =3D orig_sde<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del os.environ[&quot;SOURCE_DAT=
E_EPOCH&quot;]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(self.pyc_path)=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(os.path.exists(self.cache_pa=
th))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 statinfo =3D os.stat(self.source_path)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(statinfo.st_mtime, testtime)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open(self.pyc_path, &quot;rb&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.read(4)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timebytes =3D f.read(4) # read timestamp from=
 pyc header<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(timebytes, (testtime).to_byt=
es(4, &#39;little&#39;))<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0@unittest.skipIf(sys.flags.optimize &gt; 0, &#39;test =
does not work with -O&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0def test_double_dot_no_clobber(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"http://bugs.python.org/issu=
e22966" rel=3D"noreferrer" target=3D"_blank">http://bugs.python.org/issue22=
966</a><br>
diff --git a/meta/recipes-devtools/python/python3/sysroot-include-headers.p=
atch b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch<b=
r>
index 785b5567f2..d5983544c4 100644<br>
--- a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch<br=
>
+++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch<br=
>
@@ -6,26 +6,27 @@ Should fix things like<br>
=C2=A0configure:6972: arm-angstrom-linux-gnueabi-gcc=C2=A0 -march=3Darmv7-a=
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 -DNDE=
BUG -fno-inline -D__SOFTFP__ --sysroot=3D/build/v2013.06/build/tmp-angstrom=
_v2013_06-eglibc/sysroots/beaglebone -c -O2 -pipe -g -feliminate-unused-deb=
ug-types=C2=A0 -I/usr/include/ncursesw conftest.c &gt;&amp;5<br>
=C2=A0cc1: warning: include location &quot;/usr/include/ncursesw&quot; is u=
nsafe for cross-compilation [-Wpoison-system-directories]<br>
<br>
+2018-08: Rebased to 3.7.0<br>
+=C2=A0 -- Jens<br>
<br>
=C2=A0Signed-off-by: Khem Raj<br>
=C2=A0Upstream-Status: Pending<br>
<br>
-<br>
-Index: Python-3.3.2/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.3.2.orig/setup.py 2013-07-30 01:30:48.000000000 -0700<br>
-+++ Python-3.3.2/setup.py=C2=A0 =C2=A0 =C2=A0 2013-07-30 01:41:11.69786272=
3 -0700<br>
-@@ -1210,7 +1210,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel_library =3D &#39;panel&#39;<br>
+diff --git a/setup.py b/setup.py<br>
+index 37c5dd58a6..41e88a152b 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -1333,7 +1333,7 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if curses_library =3D=3D &#39;ncursesw&#=
39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_defines.append((&#3=
9;HAVE_NCURSESW&#39;, &#39;1&#39;))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_includes.append(&#39;/us=
r/include/ncursesw&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_includes.append(&#39;=3D=
/usr/include/ncursesw&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not cross_compiling:<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_includes.a=
ppend(&#39;/usr/include/ncursesw&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_includes.a=
ppend(&#39;=3D/usr/include/ncursesw&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Bug 1464056: If _curses.=
so links with ncursesw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # _curses_panel.so must li=
nk with panelw.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_library =3D &#39;pan=
elw&#39;<br>
-@@ -1819,7 +1819,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if host_platform =3D=3D &#39;darwin&#39;=
:<br>
+@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # OS X 10.5 comes with lib=
ffi.dylib; the include files are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in /usr/include/ffi<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inc_dirs.append(&#39;/usr/=
include/ffi&#39;)<br>
diff --git a/meta/recipes-devtools/python/python3/uuid_when_cross_compiling=
.patch b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.pat=
ch<br>
new file mode 100644<br>
index 0000000000..464f873112<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch<=
br>
@@ -0,0 +1,24 @@<br>
+Subject: [PATCH] util-linux uuid support<br>
+<br>
+Scan for uuid.h in include/uuid/ as well as in include/ to catch<br>
+the uuid/uuid.h well supported but accidently not detected.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Jens Rehsack &lt;sno@NetBSD.org&gt;<br>
+diff --git a/setup.py b/setup.py<br>
+index a97a7559ca..01d8f24fdd 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -1596,8 +1596,9 @@ class PyBuildExt(build_ext):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0 missing.append(&#39;_tkin=
ter&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Build the _uuid module if possible<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid_incs =3D find_file(&quot;uuid.h&quot;, i=
nc_dirs, [&quot;/usr/include/uuid&quot;])<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if uuid_incs is not None:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid_incs =3D find_file(&quot;uuid.h&quot;, i=
nc_dirs, [])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid_uuid_incs =3D find_file(&quot;uuid/uuid.=
h&quot;, inc_dirs, [])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if uuid_incs is not None or uuid_uuid_incs is=
 not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.compiler.find_libr=
ary_file(lib_dirs, &#39;uuid&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid_libs =
=3D [&#39;uuid&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a> b/meta/recipes=
-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3_3.5.6.bb</a><br>
deleted file mode 100644<br>
index 2a4547694a..0000000000<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a><br>
+++ /dev/null<br>
@@ -1,329 +0,0 @@<br>
-require recipes-devtools/python/python3.inc<br>
-<br>
-DEPENDS =3D &quot;python3-native libffi bzip2 gdbm openssl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite3 zlib virtual/libintl xz q=
emu-native \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-helper-native virtual/crypt&=
quot;<br>
-<br>
-DISTRO_SRC_URI ?=3D &quot;file://sitecustomize.py&quot;<br>
-DISTRO_SRC_URI_linuxstdbase =3D &quot;&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/python/$%7BPV%7D/Py=
thon-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://www.pyth=
on.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
-file://python-config.patch \<br>
-file://030-fixup-include-dirs.patch \<br>
-file://070-dont-clean-ipkg-install.patch \<br>
-file://080-distutils-dont_adjust_files.patch \<br>
-file://130-readline-setup.patch \<br>
-file://150-fix-setupterm.patch \<br>
-file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \<b=
r>
-file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \<br>
-file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \<br>
-${DISTRO_SRC_URI} \<br>
-&quot;<br>
-<br>
-SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://03-fix-tkinter-detection.=
patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid_warning_about_tkint=
er.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cgi_py.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://host_include_contaminatio=
n.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-3.3-multilib.patch=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysroot-include-headers.p=
atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://unixccompiler.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid-ncursesw-include-pa=
th.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python3-use-CROSSPYTHONPA=
TH-for-PYTHON_FOR_BUILD.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysconfig.py-add-_PYTHON_=
PROJECT_SRC.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://setup.py-check-cross_comp=
iling-when-get-FLAGS.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.ac-fix-LIBPL.pa=
tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Issue-21272-Use-_sys=
configdata.py-to-initialize-dist.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://pass-missing-libraries-to=
-Extension-for-mul.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Use-correct-CFLAGS-for-ex=
tensions-when-cross-compili.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Makefile-add-target-=
to-split-profile-generation.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://float-endian.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ftplib.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://signal.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Issue-28043-SSLConte=
xt-has-improved-default-settings.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-bpo-29136-Add-TLS-1.=
3-cipher-suites-and-OP_NO_TLSv1_.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-bpo-32947-Fixes-for-=
TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-bpo-33570-TLS-1.3-ci=
phers-for-OpenSSL-1.1.1-GH-6976.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-bpo-30714-ALPN-chang=
es-for-OpenSSL-1.1.0f-2305.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-inherit multilib_header python3native update-alternatives qemu ptest<br>
-<br>
-MULTILIB_SUFFIX =3D &quot;${@d.getVar(&#39;base_libdir&#39;,1).split(&#39;=
/&#39;)[-1]}&quot;<br>
-<br>
-ALTERNATIVE_${PN}-dev =3D &quot;python-config&quot;<br>
-ALTERNATIVE_LINK_NAME[python-config] =3D &quot;${bindir}/python${PYTHON_BI=
NABI}-config&quot;<br>
-ALTERNATIVE_TARGET[python-config] =3D &quot;${bindir}/python${PYTHON_BINAB=
I}-config-${MULTILIB_SUFFIX}&quot;<br>
-<br>
-CONFIGUREOPTS +=3D &quot; --with-system-ffi &quot;<br>
-<br>
-CACHED_CONFIGUREVARS =3D &quot;ac_cv_have_chflags=3Dno \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_have_lchflag=
s=3Dno \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_have_long_lo=
ng_format=3Dyes \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_buggy_getadd=
rinfo=3Dno \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_file__dev_pt=
mx=3Dyes \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_file__dev_pt=
c=3Dno \<br>
-&quot;<br>
-<br>
-TARGET_CC_ARCH +=3D &quot;-DNDEBUG -fno-inline&quot;<br>
-SDK_CC_ARCH +=3D &quot;-DNDEBUG -fno-inline&quot;<br>
-EXTRA_OEMAKE +=3D &quot;CROSS_COMPILE=3Dyes&quot;<br>
-EXTRA_OECONF +=3D &quot;CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python$=
{PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip&quot;<br>
-<br>
-PYTHON3_PROFILE_TASK ?=3D &quot;./python -m test.regrtest --pgo test_gramm=
ar test_opcodes test_dict test_builtin test_exceptions test_types test_supp=
ort || true&quot;<br>
-<br>
-export CROSS_COMPILE =3D &quot;${TARGET_PREFIX}&quot;<br>
-export CCSHARED =3D &quot;-fPIC&quot;<br>
-<br>
-# Fix cross compilation of different modules<br>
-export CROSSPYTHONPATH =3D &quot;${STAGING_LIBDIR_NATIVE}/python${PYTHON_M=
AJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${=
S}/Lib:${S}/Lib/plat-linux&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.contains(&#39;MACHINE_FEATU=
RES&#39;, &#39;qemu-usermode&#39;, &#39;pgo&#39;, &#39;&#39;, d)}&quot;<br>
-PACKAGECONFIG[readline] =3D &quot;,,readline&quot;<br>
-# Use profile guided optimisation by running PyBench inside qemu-user<br>
-PACKAGECONFIG[pgo] =3D &quot;--enable-optimizations&quot;<br>
-<br>
-do_configure_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/Makefile.orig<br>
-}<br>
-<br>
-run_make() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PGEN=3D${STAGING_BINDIR_NATIVE}/pyth=
on3-native/pgen \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTPYTHON=3D${STAG=
ING_BINDIR_NATIVE}/python3-native/python3 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_LIBDIR=3D${=
STAGING_LIBDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_INCDIR=3D${=
STAGING_INCDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_BASELIBDIR=
=3D${STAGING_BASELIBDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIB=3D${baselib} \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${TARGET_ARC=
H} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;${CFLAG=
S}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$@&quot;<br>
-}<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate platform specific files, because t=
hey depend on system headers<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/Lib/plat-linux*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0include=3D${STAGING_INCDIR} ${STAGING_BINDIR_NA=
TIVE}/python3-native/python3 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/Tools/scripts/=
h2py.py -i &#39;(u_long)&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_INCDIR}/d=
lfcn.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_INCDIR}/l=
inux/cdrom.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_INCDIR}/n=
etinet/in.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_INCDIR}/s=
ys/types.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s,${STAGING_DIR_HOST},,g&#39; -i *.=
py<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# remove any bogus LD_LIBRARY_PATH<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s,RUNSHARED=3D.*,RUNSHARED=3D, Makefi=
le<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f Makefile.orig ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Mak=
efile Makefile.orig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,^CONFIGURE_LDFLAGS=3D.*,CONFIG=
URE_LDFLAGS=3D-L. -L${STAGING_LIBDIR},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,libdir=3D=
${libdir},libdir=3D${STAGING_LIBDIR},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,libexecdi=
r=3D${libexecdir},libexecdir=3D${STAGING_DIR_HOST}${libexecdir},g&#39; \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,^LIBDIR=
=3D.*,LIBDIR=3D${STAGING_LIBDIR},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,includedi=
r=3D${includedir},includedir=3D${STAGING_INCDIR},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,^INCLUDED=
IR=3D.*,INCLUDE=3D${STAGING_INCDIR},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,^CONFINCL=
UDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# save copy of it now, because if we do it in d=
o_install and <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# then call do_install twice we get Makefile.or=
ig =3D=3D Makefile.sysroot<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile Makefile.sysroot<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;pgo&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_make profile-op=
t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_binary=3D&quot=
;${@qemu_wrapper_cmdline(d, &#39;${STAGING_DIR_TARGET}&#39;, [&#39;${B}&#39=
;, &#39;${STAGING_DIR_TARGET}/${base_libdir}&#39;])}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &gt;pgo-wrapper=
 &lt;&lt;EOF<br>
-#!/bin/sh<br>
-cd ${B}<br>
-$qemu_binary &quot;\$@&quot;<br>
-EOF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x pgo-wrappe=
r<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote Gathering pr=
ofiling data<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./pgo-wrapper ${PYT=
HON3_PROFILE_TASK}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote Profiling da=
ta gathered, rebuilding<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_make clean_and_=
use_profile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_make libpython3=
.so<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_make<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# make install needs the original Makefile, or =
otherwise the inclues would<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# go to ${D}${STAGING...}/...<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile.orig Makefile<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/pkgconfig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/python${PYTHON_MAJMIN}=
/config<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# rerun the build once again with original make=
file this time<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# run install in a separate step to avoid compi=
le/install race<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;pgo&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_make DESTDIR=3D=
${D} LIBDIR=3D${libdir} build_all_use_profile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run_make DESTDIR=3D=
${D} LIBDIR=3D${libdir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0run_make DESTDIR=3D${D} LIBDIR=3D${libdir} inst=
all<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# avoid conflict with 2to3 from Python 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/2to3<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile.sysroot ${D}/${libdir}=
/python${PYTHON_MAJMIN}/config/Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile.sysroot ${D}/${libdir}=
/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/sitecustomize.py ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${W=
ORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header python${PYTHON_BINABI}/pycon=
fig.h<br>
-}<br>
-<br>
-do_install_append_class-nativesdk () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/python${PYTHON_MAJ=
MIN} PYTHONHOME=3D&#39;${prefix}&#39; TERMINFO_DIRS=3D&#39;${sysconfdir}/te=
rminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/term=
info&#39; PYTHONNOUSERSITE=3D&#39;1&#39;<br>
-}<br>
-<br>
-SSTATE_SCAN_FILES +=3D &quot;Makefile&quot;<br>
-PACKAGE_PREPROCESS_FUNCS +=3D &quot;py_package_preprocess&quot;<br>
-<br>
-py_package_preprocess () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# copy back the old Makefile to fix target pack=
age<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B}/Makefile.orig ${PKGD}/${li=
bdir}/python${PYTHON_MAJMIN}/config/Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B}/Makefile.orig ${PKGD}/${li=
bdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove references to buildmachine paths in ta=
rget Makefile and _sysconfigdata<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:--sysroot=3D${STAGING_DIR_TARG=
ET}::g&#39; -e s:&#39;--with-libtool-sysroot=3D${STAGING_DIR_TARGET}&#39;::=
g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_P=
REFIX_MAP}||g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${HOSTTOO=
LS_DIR}/::g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${RECIPE_=
SYSROOT_NATIVE}::g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${RECIPE_=
SYSROOT}::g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${BASE_WO=
RKDIR}/${MULTIMACH_TARGET_SYS}::g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/p=
ython${PYTHON_MAJMIN}/config/Makefile \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/p=
ython${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/p=
ython${PYTHON_MAJMIN}/_sysconfigdata.py \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${bindir}/p=
ython${PYTHON_BINABI}-config<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Recompile _sysconfigdata after modifying it<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${PKGD}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py&=
#39;)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py&=
#39;, optimize=3D1)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py&=
#39;, optimize=3D2)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-con=
fig ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}<br>
-}<br>
-<br>
-PACKAGES_remove =3D &quot;${PN}&quot;<br>
-<br>
-# manual dependency additions<br>
-RPROVIDES_${PN}-modules =3D &quot;${PN}&quot;<br>
-RRECOMMENDS_${PN}-core_append_class-nativesdk =3D &quot; nativesdk-python3=
-modules&quot;<br>
-RRECOMMENDS_${PN}-crypt =3D &quot;openssl ca-certificates&quot;<br>
-<br>
-FILES_${PN}-2to3 +=3D &quot;${bindir}/2to3-${PYTHON_MAJMIN}&quot;<br>
-FILES_${PN}-pydoc +=3D &quot;${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pyd=
oc3&quot;<br>
-FILES_${PN}-idle +=3D &quot;${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}=
&quot;<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-pyvenv&quot;<br>
-FILES_${PN}-pyvenv +=3D &quot;${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/=
pyvenv&quot;<br>
-<br>
-# package libpython3<br>
-PACKAGES =3D+ &quot;libpython3 libpython3-staticdev&quot;<br>
-FILES_libpython3 =3D &quot;${libdir}/libpython*.so.*&quot;<br>
-FILES_libpython3-staticdev +=3D &quot;${libdir}/python${PYTHON_MAJMIN}/con=
fig-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a&quot;<br>
-INSANE_SKIP_${PN}-dev +=3D &quot;dev-elf&quot;<br>
-<br>
-# catch all the rest (unsorted)<br>
-PACKAGES +=3D &quot;${PN}-misc&quot;<br>
-RDEPENDS_${PN}-misc +=3D &quot;${PN}-core ${PN}-email ${PN}-codecs&quot;<b=
r>
-RDEPENDS_${PN}-modules +=3D &quot;${PN}-misc&quot;<br>
-FILES_${PN}-misc =3D &quot;${libdir}/python${PYTHON_MAJMIN}&quot;<br>
-<br>
-# catch manpage<br>
-PACKAGES +=3D &quot;${PN}-man&quot;<br>
-FILES_${PN}-man =3D &quot;${datadir}/man&quot;<br>
-<br>
-RDEPENDS_${PN}-ptest =3D &quot;${PN}-modules ${PN}-tests unzip bzip2&quot;=
<br>
-<br>
-RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
-<br>
-# We want bytecode precompiled .py files (.pyc&#39;s) by default<br>
-# but the user may set it on their own conf<br>
-INCLUDE_PYCS ?=3D &quot;1&quot;<br>
-<br>
-python(){<br>
-=C2=A0 =C2=A0 import collections, json<br>
-<br>
-=C2=A0 =C2=A0 filename =3D os.path.join(d.getVar(&#39;THISDIR&#39;), &#39;=
python3&#39;, &#39;python3-manifest.json&#39;)<br>
-=C2=A0 =C2=A0 # This python changes the datastore based on the contents of=
 a file, so mark<br>
-=C2=A0 =C2=A0 # that dependency.<br>
-=C2=A0 =C2=A0 bb.parse.mark_dependency(d, filename)<br>
-<br>
-=C2=A0 =C2=A0 with open(filename) as manifest_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest=3Djson.load(manifest_file, obj=
ect_pairs_hook=3Dcollections.OrderedDict)<br>
-<br>
-=C2=A0 =C2=A0 include_pycs =3D d.getVar(&#39;INCLUDE_PYCS&#39;)<br>
-<br>
-=C2=A0 =C2=A0 packages =3D d.getVar(&#39;PACKAGES&#39;).split()<br>
-=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
-<br>
-=C2=A0 =C2=A0 newpackages=3D[]<br>
-=C2=A0 =C2=A0 for key in python_manifest:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pypackage=3D pn + &#39;-&#39; + key<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypackage not in packages:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to prepend, otherwise =
python-misc gets everything<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # so we use a new variable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newpackages.append(pypackage)<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;Build&quot; python&#39;s manifest FILE=
S, RDEPENDS and SUMMARY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + pypackage, &#39;&#=
39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key][&#39;files&#=
39;]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES_&#39; + p=
ypackage, &#39; &#39; + value)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add cached files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if include_pycs =3D=3D &#39;1&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key=
][&#39;cached&#39;]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.ap=
pendVar(&#39;FILES_&#39; + pypackage, &#39; &#39; + value)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key][&#39;rdepend=
s&#39;]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make it work with or without $=
PN<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;${PN}&#39; in value:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value=3Dvalue.spli=
t(&#39;-&#39;)[1]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; =
+ pypackage, &#39; &#39; + pn + &#39;-&#39; + value)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SUMMARY_&#39; + pypackage, pytho=
n_manifest[key][&#39;summary&#39;])<br>
-<br>
-=C2=A0 =C2=A0 # Prepending so to avoid python-misc getting everything<br>
-=C2=A0 =C2=A0 packages =3D newpackages + packages<br>
-=C2=A0 =C2=A0 d.setVar(&#39;PACKAGES&#39;, &#39; &#39;.join(packages))<br>
-=C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_${PN}-modules&#39;, &#39;1&#39;)<b=
r>
-}<br>
-<br>
-# Files needed to create a new manifest<br>
-SRC_URI +=3D &quot;file://create_manifest3.py file://get_module_deps3.py f=
ile://python3-manifest.json&quot;<br>
-<br>
-do_create_manifest() {<br>
-=C2=A0 =C2=A0 # This task should be run with every new release of Python.<=
br>
-=C2=A0 =C2=A0 # We must ensure that PACKAGECONFIG enables everything when =
creating<br>
-=C2=A0 =C2=A0 # a new manifest, this is to base our new manifest on a comp=
lete<br>
-=C2=A0 =C2=A0 # native python build, containing all dependencies, otherwis=
e the task<br>
-=C2=A0 =C2=A0 # wont be able to find the required files.<br>
-=C2=A0 =C2=A0 # e.g. BerkeleyDB is an optional build dependency so it may =
or may not<br>
-=C2=A0 =C2=A0 # be present, we must ensure it is.<br>
-<br>
-=C2=A0 =C2=A0 cd ${WORKDIR}<br>
-=C2=A0 =C2=A0 # This needs to be executed by python-native and NOT by HOST=
&#39;s python<br>
-=C2=A0 =C2=A0 nativepython3 create_manifest3.py ${PYTHON_MAJMIN}<br>
-=C2=A0 =C2=A0 cp python3-manifest.json.new ${THISDIR}/python3/python3-mani=
fest.json<br>
-}<br>
-<br>
-# bitbake python -c create_manifest<br>
-addtask do_create_manifest<br>
-<br>
-# Make sure we have native python ready when we create a new manifest<br>
-do_create_manifest[depends] +=3D &quot;python3:do_prepare_recipe_sysroot&q=
uot;<br>
-do_create_manifest[depends] +=3D &quot;python3:do_patch&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.7.1.bb</a> b/meta/recipes=
-devtools/python/<a href=3D"http://python3_3.7.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3_3.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..9604d95b03<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.1.bb</a><br>
@@ -0,0 +1,298 @@<br>
+# Maintainers hint: with every new release of Python, the task<br>
+# create_manifest - please see for detailed documentation<br>
+# inside do_create_manifest<br>
+require recipes-devtools/python/python3.inc<br>
+<br>
+DEPENDS =3D &quot;libffi bzip2 gdbm openssl sqlite3 zlib xz \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux libtirpc libnsl2 virtu=
al/libintl virtual/crypt\<br>
+&quot;<br>
+DEPENDS +=3D &quot;${@[&quot;qemu-native qemu-helper-native&quot;, &quot;&=
quot;][bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;pgo&#39;, 0, 1, d)]}=
&quot;<br>
+<br>
+PYTHON_BINABI =3D &quot;${PYTHON_MAJMIN}${PYTHON_ABI}&quot;<br>
+<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \<br>
+=C2=A0 =C2=A0 file://cgi_py.patch \<br>
+=C2=A0 =C2=A0 file://host_include_contamination.patch \<br>
+=C2=A0 =C2=A0 file://avoid-ncursesw-include-path.patch \<br>
+=C2=A0 =C2=A0 file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patc=
h \<br>
+=C2=A0 =C2=A0 file://configure.ac-fix-LIBPL.patch \<br>
+=C2=A0 =C2=A0 file://pass-missing-libraries-to-Extension-for-mul.patch \<b=
r>
+=C2=A0 =C2=A0 file://float-endian.patch \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
+<br>
+inherit multilib_header python3native update-alternatives qemu ptest<br>
+<br>
+MULTILIB_SUFFIX =3D &quot;${@d.getVar(&#39;base_libdir&#39;,1).split(&#39;=
/&#39;)[-1]}&quot;<br>
+<br>
+ALTERNATIVE_${PN}-dev =3D &quot;python-config&quot;<br>
+ALTERNATIVE_LINK_NAME[python-config] =3D &quot;${bindir}/python${PYTHON_BI=
NABI}-config&quot;<br>
+ALTERNATIVE_TARGET[python-config] =3D &quot;${bindir}/python${PYTHON_BINAB=
I}-config-${MULTILIB_SUFFIX}&quot;<br>
+<br>
+CACHED_CONFIGUREVARS =3D &quot;ac_cv_have_chflags=3Dno \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_have_lchflag=
s=3Dno \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_have_long_lo=
ng_format=3Dyes \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_buggy_getadd=
rinfo=3Dno \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_file__dev_pt=
mx=3Dyes \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_file__dev_pt=
c=3Dno \<br>
+&quot;<br>
+<br>
+TARGET_CC_ARCH +=3D &quot;-DNDEBUG -fno-inline&quot;<br>
+SDK_CC_ARCH +=3D &quot;-DNDEBUG -fno-inline&quot;<br>
+EXTRA_OEMAKE +=3D &quot;CROSS_COMPILE=3Dyes&quot;<br>
+EXTRA_OECONF +=3D &quot;CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python$=
{PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip&quot;<br>
+PYTHON3_PROFILE_TASK ?=3D &quot;./python -m test.regrtest --pgo test_gramm=
ar test_opcodes test_dict test_builtin test_exceptions test_types test_supp=
ort&quot;<br>
+<br>
+export CROSS_COMPILE =3D &quot;${TARGET_PREFIX}&quot;<br>
+export CCSHARED =3D &quot;-fPIC&quot;<br>
+<br>
+# Fix cross compilation of different modules<br>
+export CROSSPYTHONPATH =3D &quot;${STAGING_LIBDIR_NATIVE}/python${PYTHON_M=
AJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${=
S}/Lib:${S}/Lib/plat-linux&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;pgo readline ${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;bluetooth&#39;, &#39;bluetooth&#39;, &#39;&#39;, d)}&quot=
;<br>
+PACKAGECONFIG[readline] =3D &quot;,,readline&quot;<br>
+# Use profile guided optimisation by running PyBench inside qemu-user<br>
+PACKAGECONFIG[pgo] =3D &quot;--enable-optimizations&quot;<br>
+<br>
+run_make() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PGEN=3D${STAGING_BINDIR_NATIVE}/pyth=
on3-native/pgen \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTPYTHON=3D${STAG=
ING_BINDIR_NATIVE}/python3-native/python3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_LIBDIR=3D${=
STAGING_LIBDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_INCDIR=3D${=
STAGING_INCDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_BASELIBDIR=
=3D${STAGING_BASELIBDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIB=3D${baselib} \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${TARGET_ARC=
H} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;${CFLAG=
S}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$@&quot;<br>
+}<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# remove any bogus LD_LIBRARY_PATH<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s,RUNSHARED=3D.*,RUNSHARED=3D, Makefi=
le<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f Makefile.orig ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Mak=
efile Makefile.orig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,^CONFIGURE_LDFLAGS=3D.*,CONFIG=
URE_LDFLAGS=3D-L. -L${STAGING_LIBDIR},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,libdir=3D=
${libdir},libdir=3D${STAGING_LIBDIR},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,libexecdi=
r=3D${libexecdir},libexecdir=3D${STAGING_DIR_HOST}${libexecdir},g&#39; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,^LIBDIR=
=3D.*,LIBDIR=3D${STAGING_LIBDIR},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,includedi=
r=3D${includedir},includedir=3D${STAGING_INCDIR},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,^INCLUDED=
IR=3D.*,INCLUDE=3D${STAGING_INCDIR},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,^CONFINCL=
UDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Makefile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;pgo&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_binary=3D&quot=
;${@qemu_wrapper_cmdline(d, &#39;${STAGING_DIR_TARGET}&#39;, [&#39;${B}&#39=
;, &#39;${STAGING_DIR_TARGET}/${base_libdir}&#39;])}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &gt; ${B}/pgo-w=
rapper &lt;&lt; EOF<br>
+#!/bin/sh<br>
+set -x<br>
+cd ${B}<br>
+$qemu_binary &quot;\$@&quot;<br>
+EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ${B}/pgo-w=
rapper<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote Updating Mak=
efile to gather profiling data during build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i=C2=A0 -e &#3=
9;s,$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK),${B}/pg=
o-wrapper ./python $(PROFILE_TASK),&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s,PROFILE_TASK=3D.*,PROFILE_TASK=3D${PYTHON3_PROFILE_TASK=
},&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,$(=
LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK),:,&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# save copy of it now, because if we do it in d=
o_install and <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# then call do_install twice we get Makefile.or=
ig =3D=3D Makefile.sysroot<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile Makefile.sysroot<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_make profile-opt<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# make install needs the original Makefile, or =
otherwise the inclues would<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# go to ${D}${STAGING...}/...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile.orig Makefile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/pkgconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/python${PYTHON_MAJMIN}=
/config<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# rerun the build once again with original make=
file this time<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# run install in a separate step to avoid compi=
le/install race<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0run_make DESTDIR=3D${D} LIBDIR=3D${libdir} buil=
d_all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0run_make DESTDIR=3D${D} LIBDIR=3D${libdir} inst=
all<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# avoid conflict with 2to3 from Python 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/2to3<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set -x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 Makefile.sysroot ${D}/${libdir=
}/python${PYTHON_MAJMIN}/config/Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 Makefile.sysroot ${D}/${libdir}=
/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/sitecustomize.py ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${W=
ORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header python${PYTHON_BINABI}/pycon=
fig.h<br>
+}<br>
+<br>
+do_install_append_class-nativesdk () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/python${PYTHON_MAJ=
MIN} PYTHONHOME=3D&#39;${prefix}&#39; TERMINFO_DIRS=3D&#39;${sysconfdir}/te=
rminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/term=
info&#39; PYTHONNOUSERSITE=3D&#39;1&#39;<br>
+}<br>
+<br>
+SSTATE_SCAN_FILES +=3D &quot;Makefile&quot;<br>
+PACKAGE_PREPROCESS_FUNCS +=3D &quot;py_package_preprocess&quot;<br>
+<br>
+py_package_preprocess () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MAKESETTINGS=3D&quot;$(egrep &#39;^(ABIFLAGS|MU=
LTIARCH)=3D&#39; ${B}/Makefile | sed -E -e &#39;s/[[:space:]]//g&#39; -e &#=
39;s/=3D/=3D&quot;/&#39; -e &#39;s/$/&quot;/&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eval ${MAKESETTINGS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${ABIFLAGS}&quot; !=3D &quot;${PY=
THON_ABI}&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;do_install: configure d=
etermined ABIFLAGS &#39;${ABIFLAGS}&#39; !=3D &#39;${PYTHON_ABI}&#39; from =
python3-dir.bbclass&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${BUILD_OS}&quot; =3D &quot;x${T=
ARGET_OS}&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# no cross-compile =
at all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_PYTHON_SYSCONFIGDA=
TA_NAME=3D${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# at the very momen=
t, it&#39;s the only available target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_PYTHON_SYSCONFIGDA=
TA_NAME=3D${PYTHON_ABI}_linux_${MULTIARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# copy back the old Makefile to fix target pack=
age<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B}/Makefile.orig ${PKGD}/${li=
bdir}/python${PYTHON_MAJMIN}/config/Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B}/Makefile.orig ${PKGD}/${li=
bdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove references to buildmachine paths in ta=
rget Makefile and _sysconfigdata<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:--sysroot=3D${STAGING_DIR_TARG=
ET}::g&#39; -e s:&#39;--with-libtool-sysroot=3D${STAGING_DIR_TARGET}&#39;::=
g \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_P=
REFIX_MAP}||g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${HOSTTOO=
LS_DIR}/::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${RECIPE_=
SYSROOT_NATIVE}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${RECIPE_=
SYSROOT}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${BASE_WO=
RKDIR}/${MULTIMACH_TARGET_SYS}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/p=
ython${PYTHON_MAJMIN}/config/Makefile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/p=
ython${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/p=
ython${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${bindir}/p=
ython${PYTHON_BINABI}-config<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Recompile _sysconfigdata after modifying it<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${PKGD}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_=
PYTHON_SYSCONFIGDATA_NAME}.py&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_=
PYTHON_SYSCONFIGDATA_NAME}.py&#39;, optimize=3D1)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${=
PYTHON_PN} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_=
PYTHON_SYSCONFIGDATA_NAME}.py&#39;, optimize=3D2)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-con=
fig ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}<br>
+}<br>
+<br>
+PACKAGES_remove =3D &quot;${PN}&quot;<br>
+<br>
+# manual dependency additions<br>
+RPROVIDES_${PN}-modules =3D &quot;${PN}&quot;<br>
+RRECOMMENDS_${PN}-core_append_class-nativesdk =3D &quot; nativesdk-python3=
-modules&quot;<br>
+RRECOMMENDS_${PN}-crypt =3D &quot;openssl ca-certificates&quot;<br>
+<br>
+FILES_${PN}-2to3 +=3D &quot;${bindir}/2to3-${PYTHON_MAJMIN}&quot;<br>
+FILES_${PN}-pydoc +=3D &quot;${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pyd=
oc3&quot;<br>
+FILES_${PN}-idle +=3D &quot;${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}=
&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-pyvenv&quot;<br>
+FILES_${PN}-pyvenv +=3D &quot;${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/=
pyvenv&quot;<br>
+<br>
+# package libpython3<br>
+PACKAGES =3D+ &quot;libpython3 libpython3-staticdev&quot;<br>
+FILES_libpython3 =3D &quot;${libdir}/libpython*.so.*&quot;<br>
+FILES_libpython3-staticdev +=3D &quot;${libdir}/python${PYTHON_MAJMIN}/con=
fig-${PYTHON_BINABI}*/libpython${PYTHON_BINABI}.a&quot;<br>
+INSANE_SKIP_${PN}-dev +=3D &quot;dev-elf&quot;<br>
+<br>
+# catch all the rest (unsorted)<br>
+PACKAGES +=3D &quot;${PN}-misc&quot;<br>
+RDEPENDS_${PN}-misc +=3D &quot;${PN}-core ${PN}-email ${PN}-codecs&quot;<b=
r>
+RDEPENDS_${PN}-modules +=3D &quot;${PN}-misc&quot;<br>
+FILES_${PN}-misc =3D &quot;${libdir}/python${PYTHON_MAJMIN}&quot;<br>
+<br>
+# catch manpage<br>
+PACKAGES +=3D &quot;${PN}-man&quot;<br>
+FILES_${PN}-man =3D &quot;${datadir}/man&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest =3D &quot;${PN}-modules ${PN}-tests unzip bzip2&quot;=
<br>
+<br>
+RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+<br>
+# We want bytecode precompiled .py files (.pyc&#39;s) by default<br>
+# but the user may set it on their own conf<br>
+INCLUDE_PYCS ?=3D &quot;1&quot;<br>
+<br>
+python(){<br>
+=C2=A0 =C2=A0 import collections, json<br>
+<br>
+=C2=A0 =C2=A0 filename =3D os.path.join(d.getVar(&#39;THISDIR&#39;), &#39;=
python3&#39;, &#39;python3-manifest.json&#39;)<br>
+=C2=A0 =C2=A0 # This python changes the datastore based on the contents of=
 a file, so mark<br>
+=C2=A0 =C2=A0 # that dependency.<br>
+=C2=A0 =C2=A0 bb.parse.mark_dependency(d, filename)<br>
+<br>
+=C2=A0 =C2=A0 with open(filename) as manifest_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest=3Djson.load(manifest_file, obj=
ect_pairs_hook=3Dcollections.OrderedDict)<br>
+<br>
+=C2=A0 =C2=A0 include_pycs =3D d.getVar(&#39;INCLUDE_PYCS&#39;)<br>
+<br>
+=C2=A0 =C2=A0 packages =3D d.getVar(&#39;PACKAGES&#39;).split()<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+<br>
+=C2=A0 =C2=A0 newpackages=3D[]<br>
+=C2=A0 =C2=A0 for key in python_manifest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pypackage=3D pn + &#39;-&#39; + key<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypackage not in packages:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to prepend, otherwise =
python-misc gets everything<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # so we use a new variable<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newpackages.append(pypackage)<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;Build&quot; python&#39;s manifest FILE=
S, RDEPENDS and SUMMARY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + pypackage, &#39;&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key][&#39;files&#=
39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES_&#39; + p=
ypackage, &#39; &#39; + value)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add cached files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if include_pycs =3D=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key=
][&#39;cached&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.ap=
pendVar(&#39;FILES_&#39; + pypackage, &#39; &#39; + value)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key][&#39;rdepend=
s&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make it work with or without $=
PN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;${PN}&#39; in value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value=3Dvalue.spli=
t(&#39;-&#39;)[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; =
+ pypackage, &#39; &#39; + pn + &#39;-&#39; + value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SUMMARY_&#39; + pypackage, pytho=
n_manifest[key][&#39;summary&#39;])<br>
+<br>
+=C2=A0 =C2=A0 # Prepending so to avoid python-misc getting everything<br>
+=C2=A0 =C2=A0 packages =3D newpackages + packages<br>
+=C2=A0 =C2=A0 d.setVar(&#39;PACKAGES&#39;, &#39; &#39;.join(packages))<br>
+=C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_${PN}-modules&#39;, &#39;1&#39;)<b=
r>
+}<br>
+<br>
+# Files needed to create a new manifest<br>
+SRC_URI +=3D &quot;file://create_manifest3.py file://get_module_deps3.py f=
ile://python3-manifest.json&quot;<br>
+<br>
+do_create_manifest() {<br>
+=C2=A0 =C2=A0 # This task should be run with every new release of Python.<=
br>
+=C2=A0 =C2=A0 # We must ensure that PACKAGECONFIG enables everything when =
creating<br>
+=C2=A0 =C2=A0 # a new manifest, this is to base our new manifest on a comp=
lete<br>
+=C2=A0 =C2=A0 # native python build, containing all dependencies, otherwis=
e the task<br>
+=C2=A0 =C2=A0 # wont be able to find the required files.<br>
+=C2=A0 =C2=A0 # e.g. BerkeleyDB is an optional build dependency so it may =
or may not<br>
+=C2=A0 =C2=A0 # be present, we must ensure it is.<br>
+<br>
+=C2=A0 =C2=A0 cd ${WORKDIR}<br>
+=C2=A0 =C2=A0 # This needs to be executed by python-native and NOT by HOST=
&#39;s python<br>
+=C2=A0 =C2=A0 nativepython3 create_manifest3.py ${PYTHON_MAJMIN}<br>
+=C2=A0 =C2=A0 cp python3-manifest.json.new ${THISDIR}/python3/python3-mani=
fest.json<br>
+}<br>
+<br>
+# bitbake python -c create_manifest<br>
+addtask do_create_manifest<br>
+<br>
+# Make sure we have native python ready when we create a new manifest<br>
+do_create_manifest[depends] +=3D &quot;python3:do_prepare_recipe_sysroot&q=
uot;<br>
+do_create_manifest[depends] +=3D &quot;python3:do_patch&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e07d15057a9daac6--
