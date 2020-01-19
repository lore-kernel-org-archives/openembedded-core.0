Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3896011C;
	Sun, 19 Jan 2020 22:23:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z3so27667803wru.3;
	Sun, 19 Jan 2020 14:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m1cTFY8ZmCFqXxTkuqJU5p/SUZn/2Lfht+7acmGWKyE=;
	b=tje1/2UGbZo32aQD5aSNIa1Q0slW5QLZYZlxELVn1GeN3m8JiDedjft8nnYexhR5TY
	yebJ9lSkyZcJJjKSbfF8rUrHqe5AiDEg+JQeWyc5eJjlAa5mzy5dYJ9AltUStflfYtNY
	yTvpZ6SLBjvhnYQNrX3s85ilVAs6tM0Z9BrbKQj8SUoxWPcL/CLbPxCmwxLU7aik4IhV
	AkLBnBtb3hr+B4zCwfpIUY9rpspLTmnEaekOfbg2q6f9XtsvoFMVhKRWAO31tjaAqYaY
	N75MWAlhtcq4heOqUHaKo7R3FPgXTY4Q1g0ZjhhW5Wk5uZUXyWnzSRj/YZ8KSsLMElMb
	3ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m1cTFY8ZmCFqXxTkuqJU5p/SUZn/2Lfht+7acmGWKyE=;
	b=QHk5hbFwYT2YbV2V+zRSgdMkqUQ+PIIOMxMZErJShNaoH/IqJFb9HkOV69MLHt7p2J
	VNWS+T7lLIdiW7P3HhinGScVWepqmnL7NsFeH6GthIp0/6f7yQUdr0pmBumOuQtdY6Rg
	2cVELYUw3p1uFZ8pGSpWUfwPe81oRrNOqVU5/w+CrCgkMEJjK6aKR0siidESevRKriIV
	uVMuwA+AQ8qM6FH0fKrW1UCvQ9bVuZJMd6vB1mpglgqEMNppdHuFSuQWPlorlCWOZKm9
	cLBsT3hvcaV7uQUnoGtAEce6gkdxcBJQ8693aLETLySO9CqgibiZSgDOKeuHgqGA2sr6
	f2Pg==
X-Gm-Message-State: APjAAAUI/K4vAihKKrS/bR4qZ5YiUl7tBSRXKkAQpN8GQDGSr4bePwqh
	zbB9V/JUnW1XjU6IGbfCUl9X3uhLnAuLmHecK/o=
X-Google-Smtp-Source: APXvYqxhOjXHDWTQkp4tC5N9d3hUo2GcX4YMrjYtaiSh4r0Euy5tNH5zNAUeffLMZZPFC2+VaUxl35sYcBVSYziufFY=
X-Received: by 2002:adf:fe90:: with SMTP id l16mr14959949wrr.265.1579472636634;
	Sun, 19 Jan 2020 14:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20200117141632.3809-1-ross.burton@intel.com>
In-Reply-To: <20200117141632.3809-1-ross.burton@intel.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Sun, 19 Jan 2020 23:23:45 +0100
Message-ID: <CAHtQpK57OxO8z=iBERfc52w72H19XYyygzpL4gt7QxtLHAmfbw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC PATCH] python: remove Python 2 and all supporting classes
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
X-List-Received-Date: Sun, 19 Jan 2020 22:23:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ross,

On Fri, Jan 17, 2020 at 3:17 PM Ross Burton <ross.burton@intel.com> wrote:
>
> Python 2 ceased being maintained on the 1st January 2020.  We've already
> removed all users of it from oe-core so the final step is to move the
> recipe and supporting classes to meta-python2.
>
> The following are removed in this commit:
> - python and python-native 2.7.17
> - python-setuptools
> - The classes pythonnative, pythondir, distutils, setuptools
>

I've just realized that this breaks entire
[meta-openembedded/meta-python]. I'm now in a process of removing
Python2 recipes, and just wanted to check that I'm doing the right
thing and this is actually intended. Or am I missing something in my
build config that is required to be set that Python2 gets disabled and
I would actually not need to eliminate those recipes (some are
actually dubbed by python3- versions but some are not)?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/distutils-base.bbclass           |    4 -
>  meta/classes/distutils.bbclass                |   87 --
>  meta/classes/python-dir.bbclass               |    5 -
>  meta/classes/pythonnative.bbclass             |   27 -
>  meta/classes/setuptools.bbclass               |    3 -
>  ...-fix-one-do_populate_sysroot-warning.patch |   40 -
>  .../10-distutils-fix-swig-parameter.patch     |   18 -
>  ...-distutils-never-modify-shebang-line.patch |   20 -
>  .../python/python-native/multilib.patch       |  235 ----
>  .../python/python-native/nohostlibs.patch     |   54 -
>  .../revert_use_of_sysconfigdata.patch         |   86 --
>  .../python/python-native/unixccompiler.patch  |   20 -
>  .../python/python-native_2.7.17.bb            |   90 --
>  .../python/python-setuptools_42.0.2.bb        |    9 -
>  ...e-prefix-to-be-inside-staging-direct.patch |   51 -
>  ...-Resolve-intermediate-staging-issues.patch |   59 -
>  ...asename-to-replace-CC-for-checking-c.patch |  114 --
>  .../01-use-proper-tools-for-cross-build.patch |   49 -
>  .../python/03-fix-tkinter-detection.patch     |   46 -
>  .../python/05-enable-ctypes-cross-build.patch |   27 -
>  ...void_usr_lib_termcap_path_in_linking.patch |   35 -
>  ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |   28 -
>  .../python/python/add-md5module-support.patch |   18 -
>  .../python/avoid_warning_about_tkinter.patch  |   29 -
>  ...id_warning_for_sunos_specific_module.patch |   23 -
>  .../python/python/cgi_py.patch                |   23 -
>  .../check-if-target-is-64b-not-host.patch     |   57 -
>  .../python/python/create_manifest2.py         |  298 -----
>  .../fix_for_using_different_libdir.patch      |   77 --
>  .../python/python/float-endian.patch          |  216 ----
>  .../python/python/get_module_deps2.py         |  112 --
>  .../python/host_include_contamination.patch   |   28 -
>  .../python/python/multilib.patch              |  298 -----
>  .../parallel-makeinst-create-bindir.patch     |   19 -
>  ...ssing-libraries-to-Extension-for-mul.patch |   82 --
>  .../python-2.7.3-remove-bsdb-rpath.patch      |   28 -
>  .../python/python/python2-manifest.json       | 1138 -----------------
>  meta/recipes-devtools/python/python/run-ptest |    3 -
>  ...h_db_h_in_inc_dirs_and_avoid_warning.patch |   35 -
>  .../setup_py_skip_cross_import_check.patch    |   27 -
>  .../python/python/setuptweaks.patch           |   57 -
>  .../python/python/sitecustomize.py            |   37 -
>  ..._SOURCE_DATE_EPOCH_in_py_compile_2.7.patch |   34 -
>  .../use_sysroot_ncurses_instead_of_host.patch |   21 -
>  meta/recipes-devtools/python/python_2.7.17.bb |  260 ----
>  45 files changed, 4027 deletions(-)
>  delete mode 100644 meta/classes/distutils-base.bbclass
>  delete mode 100644 meta/classes/distutils.bbclass
>  delete mode 100644 meta/classes/python-dir.bbclass
>  delete mode 100644 meta/classes/pythonnative.bbclass
>  delete mode 100644 meta/classes/setuptools.bbclass
>  delete mode 100644 meta/recipes-devtools/python/python-native/0001-pytho=
n-native-fix-one-do_populate_sysroot-warning.patch
>  delete mode 100644 meta/recipes-devtools/python/python-native/10-distuti=
ls-fix-swig-parameter.patch
>  delete mode 100644 meta/recipes-devtools/python/python-native/11-distuti=
ls-never-modify-shebang-line.patch
>  delete mode 100644 meta/recipes-devtools/python/python-native/multilib.p=
atch
>  delete mode 100644 meta/recipes-devtools/python/python-native/nohostlibs=
.patch
>  delete mode 100644 meta/recipes-devtools/python/python-native/revert_use=
_of_sysconfigdata.patch
>  delete mode 100644 meta/recipes-devtools/python/python-native/unixccompi=
ler.patch
>  delete mode 100644 meta/recipes-devtools/python/python-native_2.7.17.bb
>  delete mode 100644 meta/recipes-devtools/python/python-setuptools_42.0.2=
.bb
>  delete mode 100644 meta/recipes-devtools/python/python/0001-distutils-se=
t-the-prefix-to-be-inside-staging-direct.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0001-python-Resol=
ve-intermediate-staging-issues.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0001-python2-use-=
cc_basename-to-replace-CC-for-checking-c.patch
>  delete mode 100644 meta/recipes-devtools/python/python/01-use-proper-too=
ls-for-cross-build.patch
>  delete mode 100644 meta/recipes-devtools/python/python/03-fix-tkinter-de=
tection.patch
>  delete mode 100644 meta/recipes-devtools/python/python/05-enable-ctypes-=
cross-build.patch
>  delete mode 100644 meta/recipes-devtools/python/python/06-avoid_usr_lib_=
termcap_path_in_linking.patch
>  delete mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPA=
TH-for-PYTHON_FOR_BUILD.patch
>  delete mode 100644 meta/recipes-devtools/python/python/add-md5module-sup=
port.patch
>  delete mode 100644 meta/recipes-devtools/python/python/avoid_warning_abo=
ut_tkinter.patch
>  delete mode 100644 meta/recipes-devtools/python/python/avoid_warning_for=
_sunos_specific_module.patch
>  delete mode 100644 meta/recipes-devtools/python/python/cgi_py.patch
>  delete mode 100644 meta/recipes-devtools/python/python/check-if-target-i=
s-64b-not-host.patch
>  delete mode 100644 meta/recipes-devtools/python/python/create_manifest2.=
py
>  delete mode 100644 meta/recipes-devtools/python/python/fix_for_using_dif=
ferent_libdir.patch
>  delete mode 100644 meta/recipes-devtools/python/python/float-endian.patc=
h
>  delete mode 100644 meta/recipes-devtools/python/python/get_module_deps2.=
py
>  delete mode 100644 meta/recipes-devtools/python/python/host_include_cont=
amination.patch
>  delete mode 100644 meta/recipes-devtools/python/python/multilib.patch
>  delete mode 100644 meta/recipes-devtools/python/python/parallel-makeinst=
-create-bindir.patch
>  delete mode 100644 meta/recipes-devtools/python/python/pass-missing-libr=
aries-to-Extension-for-mul.patch
>  delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-remo=
ve-bsdb-rpath.patch
>  delete mode 100644 meta/recipes-devtools/python/python/python2-manifest.=
json
>  delete mode 100644 meta/recipes-devtools/python/python/run-ptest
>  delete mode 100644 meta/recipes-devtools/python/python/search_db_h_in_in=
c_dirs_and_avoid_warning.patch
>  delete mode 100644 meta/recipes-devtools/python/python/setup_py_skip_cro=
ss_import_check.patch
>  delete mode 100644 meta/recipes-devtools/python/python/setuptweaks.patch
>  delete mode 100644 meta/recipes-devtools/python/python/sitecustomize.py
>  delete mode 100644 meta/recipes-devtools/python/python/support_SOURCE_DA=
TE_EPOCH_in_py_compile_2.7.patch
>  delete mode 100644 meta/recipes-devtools/python/python/use_sysroot_ncurs=
es_instead_of_host.patch
>  delete mode 100644 meta/recipes-devtools/python/python_2.7.17.bb
>
> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils=
-base.bbclass
> deleted file mode 100644
> index 9f398d7051a..00000000000
> --- a/meta/classes/distutils-base.bbclass
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PA=
CKAGES') =3D=3D '')]}"
> -RDEPENDS_${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
> -
> -inherit distutils-common-base pythonnative
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbcl=
ass
> deleted file mode 100644
> index 3759b582633..00000000000
> --- a/meta/classes/distutils.bbclass
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -inherit distutils-base
> -
> -DISTUTILS_BUILD_ARGS ?=3D ""
> -DISTUTILS_STAGE_HEADERS_ARGS ?=3D "--install-dir=3D${STAGING_INCDIR}/${P=
YTHON_DIR}"
> -DISTUTILS_STAGE_ALL_ARGS ?=3D "--prefix=3D${STAGING_DIR_HOST}${prefix} \
> -    --install-data=3D${STAGING_DATADIR}"
> -DISTUTILS_INSTALL_ARGS ?=3D "--root=3D${D} \
> -    --prefix=3D${prefix} \
> -    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=3D${datadir}"
> -
> -DISTUTILS_PYTHON =3D "python"
> -DISTUTILS_PYTHON_class-native =3D "nativepython"
> -
> -distutils_do_configure() {
> -        if [ "${CLEANBROKEN}" !=3D "1" ] ; then
> -                NO_FETCH_BUILD=3D1 \
> -                ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN=
} setup.py clean ${DISTUTILS_BUILD_ARGS}
> -        fi
> -}
> -
> -distutils_do_compile() {
> -         NO_FETCH_BUILD=3D1 \
> -         STAGING_INCDIR=3D${STAGING_INCDIR} \
> -         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup=
.py build ${DISTUTILS_BUILD_ARGS} || \
> -         bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARG=
S}' execution failed."
> -}
> -
> -distutils_stage_headers() {
> -        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> -        bbfatal_log "'${PYTHON_PN} setup.py install_headers ${DISTUTILS_=
STAGE_HEADERS_ARGS}' execution for stage_headers failed."
> -}
> -
> -distutils_stage_all() {
> -        STAGING_INCDIR=3D${STAGING_INCDIR} \
> -        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> -        PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> -        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_AL=
L_ARGS}' execution for stage_all failed."
> -}
> -
> -distutils_do_install() {
> -        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -        STAGING_INCDIR=3D${STAGING_INCDIR} \
> -        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -        PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DIR} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install ${DISTUTILS_INSTALL_ARGS} || \
> -        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_=
ARGS}' execution failed."
> -
> -        # support filenames with *spaces*
> -        # only modify file if it contains path  and recompile it
> -        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
> -                               -exec sed -i -e s:${D}::g {} \; \
> -                               -exec ${STAGING_BINDIR_NATIVE}/python-nat=
ive/python -mcompileall {} \;
> -
> -        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> -            if [ -f "$i" ]; then
> -                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYT=
HON}:g $i
> -                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> -            fi
> -        done
> -
> -        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> -        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py*
> -
> -        #
> -        # FIXME: Bandaid against wrong datadir computation
> -        #
> -        if [ -e ${D}${datadir}/share ]; then
> -            mv -f ${D}${datadir}/share/* ${D}${datadir}/
> -            rmdir ${D}${datadir}/share
> -        fi
> -
> -       # Fix backport modules
> -       if [ -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/_=
_init__.py ] &&
> -           [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py ]; =
then
> -          rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
> -          rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
> -       fi
> -}
> -
> -EXPORT_FUNCTIONS do_configure do_compile do_install
> -
> -export LDSHARED=3D"${CCLD} -shared"
> diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bb=
class
> deleted file mode 100644
> index a11dc350be3..00000000000
> --- a/meta/classes/python-dir.bbclass
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -PYTHON_BASEVERSION =3D "2.7"
> -PYTHON_ABI =3D ""
> -PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
> -PYTHON_PN =3D "python"
> -PYTHON_SITEPACKAGES_DIR =3D "${libdir}/${PYTHON_DIR}/site-packages"
> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnativ=
e.bbclass
> deleted file mode 100644
> index 0e9019d1e24..00000000000
> --- a/meta/classes/pythonnative.bbclass
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -
> -inherit python-dir
> -
> -PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python"
> -# PYTHON_EXECUTABLE is used by cmake
> -PYTHON_EXECUTABLE=3D"${PYTHON}"
> -EXTRANATIVEPATH +=3D "python-native"
> -DEPENDS_append =3D " python-native "
> -
> -# python-config and other scripts are using distutils modules
> -# which we patch to access these variables
> -export STAGING_INCDIR
> -export STAGING_LIBDIR
> -
> -# Packages can use
> -# find_package(PythonInterp REQUIRED)
> -# find_package(PythonLibs REQUIRED)
> -# which ends up using libs/includes from build host
> -# Therefore pre-empt that effort
> -export PYTHON_LIBRARY=3D"${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}=
.so"
> -export PYTHON_INCLUDE_DIR=3D"${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI=
}"
> -
> -# suppress host user's site-packages dirs.
> -export PYTHONNOUSERSITE =3D "1"
> -
> -# autoconf macros will use their internal default preference otherwise
> -export PYTHON
> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bb=
class
> deleted file mode 100644
> index a923ea3c4a1..00000000000
> --- a/meta/classes/setuptools.bbclass
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -inherit distutils
> -
> -DEPENDS +=3D "python-setuptools-native"
> diff --git a/meta/recipes-devtools/python/python-native/0001-python-nativ=
e-fix-one-do_populate_sysroot-warning.patch b/meta/recipes-devtools/python/=
python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
> deleted file mode 100644
> index 707ee596fa4..00000000000
> --- a/meta/recipes-devtools/python/python-native/0001-python-native-fix-o=
ne-do_populate_sysroot-warning.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 6cbb7529cf7ff0da3ca649fb3486facd9620d625 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 25 Oct 2018 07:32:14 +0000
> -Subject: [PATCH] python-native: fix one do_populate_sysroot warning
> -
> -Fix below warning:
> -WARNING: Skipping RPATH /usr/lib64 as is a standard search path for
> -work/x86_64-linux/python-native/2.7.15-r1.1/recipe-sysroot-native/
> -usr/lib/python2.7/lib-dynload/_bsddb.so
> -
> -setup.py will check db.h under include_dirs, for native build,
> -/usr/lib64 will be insert to postion 0 of include_dirs, so
> -it's priority is higher then our sysroot, cause db.h sysroot
> -is ignored, and rpath set to /usr/lib64. and this cause warning
> -when do_populate_sysroot. use append to fix it.
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> ----
> - setup.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index a2c8127..22f9e23 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -47,7 +47,7 @@ def add_dir_to_list(dirlist, dir):
> -         else:
> -             dir_exists =3D os.path.isdir(dir)
> -         if dir_exists:
> --            dirlist.insert(0, dir)
> -+            dirlist.append(dir)
> -
> - MACOS_SDK_ROOT =3D None
> -
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/python/python-native/10-distutils-fix-=
swig-parameter.patch b/meta/recipes-devtools/python/python-native/10-distut=
ils-fix-swig-parameter.patch
> deleted file mode 100644
> index a39247ce70a..00000000000
> --- a/meta/recipes-devtools/python/python-native/10-distutils-fix-swig-pa=
rameter.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Upstream-Status: Pending
> -
> -# Some versions of SWIG do not use the extension parameter.
> -# Make it optional.
> -# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> -Index: Python-2.6.1/Lib/distutils/command/build_ext.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.6.1.orig/Lib/distutils/command/build_ext.py
> -+++ Python-2.6.1/Lib/distutils/command/build_ext.py
> -@@ -566,7 +566,7 @@ class build_ext (Command):
> -             target_lang=3Dlanguage)
> -
> -
> --    def swig_sources (self, sources, extension):
> -+    def swig_sources (self, sources, extension=3DNone):
> -
> -         """Walk the list of source files in 'sources', looking for SWIG
> -         interface (.i) files.  Run SWIG on all that are found, and
> diff --git a/meta/recipes-devtools/python/python-native/11-distutils-neve=
r-modify-shebang-line.patch b/meta/recipes-devtools/python/python-native/11=
-distutils-never-modify-shebang-line.patch
> deleted file mode 100644
> index c92469b9b6a..00000000000
> --- a/meta/recipes-devtools/python/python-native/11-distutils-never-modif=
y-shebang-line.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Upstream-Status: Pending
> -
> -# Don't modify the she-bang line for a cross-build.
> -# Otherwise it points to our hostpython (which we do not want)
> -#
> -# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> -
> -Index: Python-2.6.1/Lib/distutils/command/build_scripts.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.6.1.orig/Lib/distutils/command/build_scripts.py
> -+++ Python-2.6.1/Lib/distutils/command/build_scripts.py
> -@@ -87,7 +87,7 @@ class build_scripts (Command):
> -                     continue
> -
> -                 match =3D first_line_re.match(first_line)
> --                if match:
> -+                if False: #match:
> -                     adjust =3D 1
> -                     post_interp =3D match.group(1) or ''
> -
> diff --git a/meta/recipes-devtools/python/python-native/multilib.patch b/=
meta/recipes-devtools/python/python-native/multilib.patch
> deleted file mode 100644
> index af0f173c6d1..00000000000
> --- a/meta/recipes-devtools/python/python-native/multilib.patch
> +++ /dev/null
> @@ -1,235 +0,0 @@
> -Rebased for Python 2.7.9
> -
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -
> -2011/09/29
> -The python recipe building was failing because python-native
> -could not handle sys.lib var. sys.lib var is defined in the
> -multilib patch hence added this multilib.patch for python-native
> -recipe.
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -Index: Python-2.7.14/Include/pythonrun.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Include/pythonrun.h
> -+++ Python-2.7.14/Include/pythonrun.h
> -@@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
> - /* In their own files */
> - PyAPI_FUNC(const char *) Py_GetVersion(void);
> - PyAPI_FUNC(const char *) Py_GetPlatform(void);
> -+PyAPI_FUNC(const char *) Py_GetLib(void);
> - PyAPI_FUNC(const char *) Py_GetCopyright(void);
> - PyAPI_FUNC(const char *) Py_GetCompiler(void);
> - PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
> -Index: Python-2.7.14/Lib/distutils/command/install.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/distutils/command/install.py
> -+++ Python-2.7.14/Lib/distutils/command/install.py
> -@@ -22,6 +22,8 @@ from site import USER_BASE
> - from site import USER_SITE
> -
> -
> -+libname =3D sys.lib
> -+
> - if sys.version < "2.2":
> -     WINDOWS_SCHEME =3D {
> -         'purelib': '$base',
> -@@ -42,7 +44,7 @@ else:
> - INSTALL_SCHEMES =3D {
> -     'unix_prefix': {
> -         'purelib': '$base/lib/python$py_version_short/site-packages',
> --        'platlib': '$platbase/lib/python$py_version_short/site-packages=
',
> -+        'platlib': '$platbase/'+libname+'/python$py_version_short/site-=
packages',
> -         'headers': '$base/include/python$py_version_short/$dist_name',
> -         'scripts': '$base/bin',
> -         'data'   : '$base',
> -Index: Python-2.7.14/Lib/pydoc.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/pydoc.py
> -+++ Python-2.7.14/Lib/pydoc.py
> -@@ -375,7 +375,7 @@ class Doc:
> -     docmodule =3D docclass =3D docroutine =3D docother =3D docproperty =
=3D docdata =3D fail
> -
> -     def getdocloc(self, object,
> --                  basedir=3Dos.path.join(sys.exec_prefix, "lib",
> -+                  basedir=3Dos.path.join(sys.exec_prefix, "sys.lib",
> -                                        "python"+sys.version[0:3])):
> -         """Return the location of module docs or None"""
> -
> -Index: Python-2.7.14/Lib/site.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/site.py
> -+++ Python-2.7.14/Lib/site.py
> -@@ -288,13 +288,19 @@ def getsitepackages():
> -         if sys.platform in ('os2emx', 'riscos'):
> -             sitepackages.append(os.path.join(prefix, "Lib", "site-packa=
ges"))
> -         elif os.sep =3D=3D '/':
> --            sitepackages.append(os.path.join(prefix, "lib",
> -+            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> -                                         "site-packages"))
> --            sitepackages.append(os.path.join(prefix, "lib", "site-pytho=
n"))
> -+            if sys.lib !=3D "lib":
> -+                sitepackages.append(os.path.join(prefix, "lib",
> -+                                        "python" + sys.version[:3],
> -+                                        "site-packages"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib, "site-pyt=
hon"))
> -+            if sys.lib !=3D "lib":
> -+                sitepackages.append(os.path.join(prefix, "lib", "site-p=
ython"))
> -         else:
> -             sitepackages.append(prefix)
> --            sitepackages.append(os.path.join(prefix, "lib", "site-packa=
ges"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib, "site-pac=
kages"))
> -     return sitepackages
> -
> - def addsitepackages(known_paths):
> -Index: Python-2.7.14/Lib/test/test_dl.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/test/test_dl.py
> -+++ Python-2.7.14/Lib/test/test_dl.py
> -@@ -4,10 +4,11 @@
> - import unittest
> - from test.test_support import verbose, import_module
> - dl =3D import_module('dl', deprecated=3DTrue)
> -+import sys
> -
> - sharedlibs =3D [
> --    ('/usr/lib/libc.so', 'getpid'),
> --    ('/lib/libc.so.6', 'getpid'),
> -+    ('/usr/'+sys.lib+'/libc.so', 'getpid'),
> -+    ('/'+sys.lib+'/libc.so.6', 'getpid'),
> -     ('/usr/bin/cygwin1.dll', 'getpid'),
> -     ('/usr/lib/libc.dylib', 'getpid'),
> -     ]
> -Index: Python-2.7.14/Lib/trace.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/trace.py
> -+++ Python-2.7.14/Lib/trace.py
> -@@ -754,10 +754,10 @@ def main(argv=3DNone):
> -                 # should I also call expanduser? (after all, could use =
$HOME)
> -
> -                 s =3D s.replace("$prefix",
> --                              os.path.join(sys.prefix, "lib",
> -+                              os.path.join(sys.prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s =3D s.replace("$exec_prefix",
> --                              os.path.join(sys.exec_prefix, "lib",
> -+                              os.path.join(sys.exec_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s =3D os.path.normpath(s)
> -                 ignore_dirs.append(s)
> -Index: Python-2.7.14/Makefile.pre.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Makefile.pre.in
> -+++ Python-2.7.14/Makefile.pre.in
> -@@ -91,6 +91,7 @@ PY_CFLAGS=3D   $(CFLAGS) $(CPPFLAGS) $(CFLAG
> -
> - # Machine-dependent subdirectories
> - MACHDEP=3D      @MACHDEP@
> -+LIB=3D          @LIB@
> -
> - # Multiarch directory (may be empty)
> - MULTIARCH=3D    @MULTIARCH@
> -@@ -110,7 +111,7 @@ LIBDIR=3D            @libdir@
> - MANDIR=3D               @mandir@
> - INCLUDEDIR=3D   @includedir@
> - CONFINCLUDEDIR=3D       $(exec_prefix)/include
> --SCRIPTDIR=3D    $(prefix)/lib
> -+SCRIPTDIR=3D    $(prefix)/@LIB@
> -
> - # Detailed destination directories
> - BINLIBDEST=3D   $(LIBDIR)/python$(VERSION)
> -@@ -644,6 +645,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
> -               -DEXEC_PREFIX=3D'"$(exec_prefix)"' \
> -               -DVERSION=3D'"$(VERSION)"' \
> -               -DVPATH=3D'"$(VPATH)"' \
> -+              -DLIB=3D'"$(LIB)"' \
> -               -o $@ $(srcdir)/Modules/getpath.c
> -
> - Modules/python.o: $(srcdir)/Modules/python.c
> -@@ -692,7 +694,7 @@ regen-ast:
> - Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/gram=
init.h $(srcdir)/Include/Python-ast.h
> -
> - Python/getplatform.o: $(srcdir)/Python/getplatform.c
> --              $(CC) -c $(PY_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' -o $@ $=
(srcdir)/Python/getplatform.c
> -+              $(CC) -c $(PY_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' -DLIB=
=3D'"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
> -
> - Python/importdl.o: $(srcdir)/Python/importdl.c
> -               $(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Pyth=
on/importdl.c
> -Index: Python-2.7.14/Modules/getpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Modules/getpath.c
> -+++ Python-2.7.14/Modules/getpath.c
> -@@ -100,6 +100,13 @@
> - #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant define=
d"
> - #endif
> -
> -+#define LIB_PYTHON LIB "/python" VERSION
> -+
> -+#ifndef PYTHONPATH
> -+#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
> -+        EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
> -+#endif
> -+
> - #ifndef LANDMARK
> - #define LANDMARK "os.py"
> - #endif
> -@@ -108,7 +115,7 @@ static char prefix[MAXPATHLEN+1];
> - static char exec_prefix[MAXPATHLEN+1];
> - static char progpath[MAXPATHLEN+1];
> - static char *module_search_path =3D NULL;
> --static char lib_python[] =3D "lib/python" VERSION;
> -+static char lib_python[] =3D LIB_PYTHON;
> -
> - static void
> - reduce(char *dir)
> -Index: Python-2.7.14/Python/getplatform.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Python/getplatform.c
> -+++ Python-2.7.14/Python/getplatform.c
> -@@ -10,3 +10,13 @@ Py_GetPlatform(void)
> - {
> -       return PLATFORM;
> - }
> -+
> -+#ifndef LIB
> -+#define LIB "lib"
> -+#endif
> -+
> -+const char *
> -+Py_GetLib(void)
> -+{
> -+      return LIB;
> -+}
> -Index: Python-2.7.14/Python/sysmodule.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Python/sysmodule.c
> -+++ Python-2.7.14/Python/sysmodule.c
> -@@ -1437,6 +1437,8 @@ _PySys_Init(void)
> -                         PyString_FromString(Py_GetCopyright()));
> -     SET_SYS_FROM_STRING("platform",
> -                         PyString_FromString(Py_GetPlatform()));
> -+    SET_SYS_FROM_STRING("lib",
> -+                PyString_FromString(Py_GetLib()));
> -     SET_SYS_FROM_STRING("executable",
> -                         PyString_FromString(Py_GetProgramFullPath()));
> -     SET_SYS_FROM_STRING("prefix",
> -Index: Python-2.7.14/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/configure.ac
> -+++ Python-2.7.14/configure.ac
> -@@ -758,6 +758,11 @@ SunOS*)
> -     ;;
> - esac
> -
> -+AC_SUBST(LIB)
> -+AC_MSG_CHECKING(LIB)
> -+LIB=3D`basename ${libdir}`
> -+AC_MSG_RESULT($LIB)
> -+
> -
> - AC_SUBST(LIBRARY)
> - AC_MSG_CHECKING(LIBRARY)
> diff --git a/meta/recipes-devtools/python/python-native/nohostlibs.patch =
b/meta/recipes-devtools/python/python-native/nohostlibs.patch
> deleted file mode 100644
> index 078060b49e5..00000000000
> --- a/meta/recipes-devtools/python/python-native/nohostlibs.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -2014/12/15
> -Rebased for python-2.7.9
> -Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -
> -Index: Python-2.7.9/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.9.orig/setup.py
> -+++ Python-2.7.9/setup.py
> -@@ -439,9 +439,9 @@ class PyBuildExt(build_ext):
> -
> -     def detect_modules(self):
> -         # Ensure that /usr/local is always used
> --        if not cross_compiling:
> --            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib=
')
> --            add_dir_to_list(self.compiler.include_dirs, '/usr/local/inc=
lude')
> -+        # if not cross_compiling:
> -+            # add_dir_to_list(self.compiler.library_dirs, '/usr/local/l=
ib')
> -+            # add_dir_to_list(self.compiler.include_dirs, '/usr/local/i=
nclude')
> -         if cross_compiling:
> -             self.add_gcc_paths()
> -         self.add_multiarch_paths()
> -@@ -480,15 +480,15 @@ class PyBuildExt(build_ext):
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.prefix) !=3D '/usr' \
> --                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -+        #if os.path.normpath(sys.prefix) !=3D '/usr' \
> -+                #and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a f=
ramework
> -             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
> -             # building a framework with different architectures than
> -             # the one that is currently installed (issue #7473)
> --            add_dir_to_list(self.compiler.library_dirs,
> -+        add_dir_to_list(self.compiler.library_dirs,
> -                             sysconfig.get_config_var("LIBDIR"))
> --            add_dir_to_list(self.compiler.include_dirs,
> -+        add_dir_to_list(self.compiler.include_dirs,
> -                             sysconfig.get_config_var("INCLUDEDIR"))
> -
> -         try:
> -@@ -761,8 +761,7 @@ class PyBuildExt(build_ext):
> -                 pass # Issue 7384: Already linked against curses or tin=
fo.
> -             elif curses_library:
> -                 readline_libs.append(curses_library)
> --            elif self.compiler.find_library_file(lib_dirs +
> --                                                     ['/usr/lib/termcap=
'],
> -+            elif self.compiler.find_library_file(lib_dirs,
> -                                                      'termcap'):
> -                 readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> diff --git a/meta/recipes-devtools/python/python-native/revert_use_of_sys=
configdata.patch b/meta/recipes-devtools/python/python-native/revert_use_of=
_sysconfigdata.patch
> deleted file mode 100644
> index 202aaf1069b..00000000000
> --- a/meta/recipes-devtools/python/python-native/revert_use_of_sysconfigd=
ata.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -On older versions of Python, sysconfig read the data from both the Makef=
ile and
> -the Python.h file generated at build time, created dictionaries with the=
ir variables
> -and used those when using get_config_var(), now it uses _sysconfigdata.b=
uild_time_vars[]
> -which contains information from the HOST, erroneous in our case, this pa=
tch reverts this
> -behavior and uses Python.h and Makefile to get information.
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -
> -Index: Python-2.7.9/Lib/distutils/sysconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.9.orig/Lib/distutils/sysconfig.py
> -+++ Python-2.7.9/Lib/distutils/sysconfig.py
> -@@ -401,12 +401,66 @@ _config_vars =3D None
> -
> - def _init_posix():
> -     """Initialize the module as appropriate for POSIX systems."""
> --    # _sysconfigdata is generated at build time, see the sysconfig modu=
le
> --    from _sysconfigdata import build_time_vars
> --    global _config_vars
> --    _config_vars =3D {}
> --    _config_vars.update(build_time_vars)
> -+    g =3D {}
> -+    # load the installed Makefile:
> -+    try:
> -+        filename =3D get_makefile_filename()
> -+        parse_makefile(filename, g)
> -+    except IOError, msg:
> -+        my_msg =3D "invalid Python installation: unable to open %s" % f=
ilename
> -+        if hasattr(msg, "strerror"):
> -+            my_msg =3D my_msg + " (%s)" % msg.strerror
> -+
> -+        raise DistutilsPlatformError(my_msg)
> -+
> -+    # load the installed pyconfig.h:
> -+    try:
> -+        filename =3D get_config_h_filename()
> -+        parse_config_h(file(filename), g)
> -+    except IOError, msg:
> -+        my_msg =3D "invalid Python installation: unable to open %s" % f=
ilename
> -+        if hasattr(msg, "strerror"):
> -+            my_msg =3D my_msg + " (%s)" % msg.strerror
> -+
> -+        raise DistutilsPlatformError(my_msg)
> -+
> -+    # On AIX, there are wrong paths to the linker scripts in the Makefi=
le
> -+    # -- these paths are relative to the Python source, but when instal=
led
> -+    # the scripts are in another directory.
> -+    if python_build:
> -+        g['LDSHARED'] =3D g['BLDSHARED']
> -
> -+    elif get_python_version() < '2.1':
> -+        # The following two branches are for 1.5.2 compatibility.
> -+        if sys.platform =3D=3D 'aix4':          # what about AIX 3.x ?
> -+            # Linker script is in the config directory, not in Modules =
as the
> -+            # Makefile says.
> -+            python_lib =3D get_python_lib(standard_lib=3D1)
> -+            ld_so_aix =3D os.path.join(python_lib, 'config', 'ld_so_aix=
')
> -+            python_exp =3D os.path.join(python_lib, 'config', 'python.e=
xp')
> -+
> -+            g['LDSHARED'] =3D "%s %s -bI:%s" % (ld_so_aix, g['CC'], pyt=
hon_exp)
> -+
> -+        elif sys.platform =3D=3D 'beos':
> -+            # Linker script is in the config directory.  In the Makefil=
e it is
> -+            # relative to the srcdir, which after installation no longe=
r makes
> -+            # sense.
> -+            python_lib =3D get_python_lib(standard_lib=3D1)
> -+            linkerscript_path =3D string.split(g['LDSHARED'])[0]
> -+            linkerscript_name =3D os.path.basename(linkerscript_path)
> -+            linkerscript =3D os.path.join(python_lib, 'config',
> -+                                        linkerscript_name)
> -+
> -+            # XXX this isn't the right place to do this: adding the Pyt=
hon
> -+            # library to the link, if needed, should be in the "build_e=
xt"
> -+            # command.  (It's also needed for non-MS compilers on Windo=
ws, and
> -+            # it's taken care of for them by the 'build_ext.get_librari=
es()'
> -+            # method.)
> -+            g['LDSHARED'] =3D ("%s -L%s/lib -lpython%s" %
> -+                             (linkerscript, PREFIX, get_python_version(=
)))
> -+
> -+    global _config_vars
> -+    _config_vars =3D g
> -
> - def _init_nt():
> -     """Initialize the module as appropriate for NT"""
> diff --git a/meta/recipes-devtools/python/python-native/unixccompiler.pat=
ch b/meta/recipes-devtools/python/python-native/unixccompiler.patch
> deleted file mode 100644
> index 45028291298..00000000000
> --- a/meta/recipes-devtools/python/python-native/unixccompiler.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Upstream-Status: Pending
> -
> -The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=
=3D/${TMPDIR}/sysroots/qemux86-64", contains option information.
> -This will lead to wrong compiler name "qemux86-64" rather than "x86_64-p=
oky-linux-gcc" when python finding the compiler name.
> -
> -Signed-off-by: Mei Lei <lei.mei@intel.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Index: Python-2.7.2/Lib/distutils/unixccompiler.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.2.orig/Lib/distutils/unixccompiler.py   2011-11-24 13:51:=
10.539998722 -0800
> -+++ Python-2.7.2/Lib/distutils/unixccompiler.py        2011-11-24 15:54:=
36.872137766 -0800
> -@@ -282,7 +282,7 @@
> -         # this time, there's no way to determine this information from
> -         # the configuration data stored in the Python installation, so
> -         # we use this hack.
> --        compiler =3D os.path.basename(sysconfig.get_config_var("CC"))
> -+        compiler =3D sysconfig.get_config_var("CC")
> -         if sys.platform[:6] =3D=3D "darwin":
> -             # MacOSX's linker doesn't understand the -R flag at all
> -             return "-L" + dir
> diff --git a/meta/recipes-devtools/python/python-native_2.7.17.bb b/meta/=
recipes-devtools/python/python-native_2.7.17.bb
> deleted file mode 100644
> index 72aa34c2343..00000000000
> --- a/meta/recipes-devtools/python/python-native_2.7.17.bb
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -require python.inc
> -EXTRANATIVEPATH +=3D "bzip2-native"
> -DEPENDS =3D "openssl-native bzip2-replacement-native zlib-native readlin=
e-native sqlite3-native expat-native gdbm-native db-native"
> -
> -SRC_URI +=3D "\
> -            file://05-enable-ctypes-cross-build.patch \
> -            file://10-distutils-fix-swig-parameter.patch \
> -            file://11-distutils-never-modify-shebang-line.patch \
> -            file://0001-distutils-set-the-prefix-to-be-inside-staging-di=
rect.patch \
> -            file://unixccompiler.patch \
> -            file://nohostlibs.patch \
> -            file://multilib.patch \
> -            file://add-md5module-support.patch \
> -            file://0001-python-Resolve-intermediate-staging-issues.patch=
 \
> -            file://parallel-makeinst-create-bindir.patch \
> -            file://revert_use_of_sysconfigdata.patch \
> -            file://0001-python-native-fix-one-do_populate_sysroot-warnin=
g.patch \
> -           "
> -
> -S =3D "${WORKDIR}/Python-${PV}"
> -
> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${PN}:"
> -
> -inherit native
> -
> -EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} --with-system-expat=
=3D${STAGING_DIR_HOST}"
> -
> -EXTRA_OEMAKE =3D '\
> -  LIBC=3D"" \
> -  STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE} \
> -  STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} \
> -'
> -
> -do_configure_append() {
> -       autoreconf --verbose --install --force --exclude=3Dautopoint ../P=
ython-${PV}/Modules/_ctypes/libffi
> -}
> -
> -# Cross-compiling Python needs a native pgen, build it here for use late=
r.
> -do_compile_append() {
> -       oe_runmake Parser/pgen
> -}
> -
> -do_install() {
> -       oe_runmake 'DESTDIR=3D${D}' install
> -       install -d ${D}${bindir}/${PN}
> -       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> -
> -       # Make sure we use /usr/bin/env python
> -       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}=
/${PN}`; do
> -               sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
> -       done
> -
> -       # Add a symlink to the native Python so that scripts can just inv=
oke
> -       # "nativepython" and get the right one without needing absolute p=
aths
> -       # (these often end up too long for the #! parser in the kernel as=
 the
> -       # buffer is 128 bytes long).
> -       ln -s python-native/python ${D}${bindir}/nativepython
> -
> -       # We don't want modules in ~/.local being used in preference to t=
hose
> -       # installed in the native sysroot, so disable user site support.
> -       sed -i -e 's,^\(ENABLE_USER_SITE =3D \).*,\1False,' ${D}${libdir}=
/python${PYTHON_MAJMIN}/site.py
> -}
> -
> -python(){
> -
> -    # Read JSON manifest
> -    import json
> -    pythondir =3D d.getVar('THISDIR')
> -    with open(pythondir+'/python/python2-manifest.json') as manifest_fil=
e:
> -        manifest_str =3D  manifest_file.read()
> -        json_start =3D manifest_str.find('# EOC') + 6
> -        manifest_file.seek(json_start)
> -        manifest_str =3D manifest_file.read()
> -        python_manifest =3D json.loads(manifest_str)
> -
> -    rprovides =3D d.getVar('RPROVIDES').split()
> -
> -    # Hardcoded since it cant be python-native-foo, should be python-foo=
-native
> -    pn =3D 'python'
> -
> -    # ${PN}-misc-native is not in the manifest
> -    rprovides.append(pn + '-misc-native')
> -
> -    for key in python_manifest:
> -        pypackage =3D pn + '-' + key + '-native'
> -        if pypackage not in rprovides:
> -              rprovides.append(pypackage)
> -
> -    d.setVar('RPROVIDES', ' '.join(rprovides))
> -}
> diff --git a/meta/recipes-devtools/python/python-setuptools_42.0.2.bb b/m=
eta/recipes-devtools/python/python-setuptools_42.0.2.bb
> deleted file mode 100644
> index cf9440495bd..00000000000
> --- a/meta/recipes-devtools/python/python-setuptools_42.0.2.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require python-setuptools.inc
> -
> -PROVIDES =3D "python-distribute"
> -
> -inherit setuptools
> -
> -RREPLACES_${PN} =3D "python-distribute"
> -RPROVIDES_${PN} =3D "python-distribute"
> -RCONFLICTS_${PN} =3D "python-distribute"
> diff --git a/meta/recipes-devtools/python/python/0001-distutils-set-the-p=
refix-to-be-inside-staging-direct.patch b/meta/recipes-devtools/python/pyth=
on/0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch
> deleted file mode 100644
> index 502f8498047..00000000000
> --- a/meta/recipes-devtools/python/python/0001-distutils-set-the-prefix-t=
o-be-inside-staging-direct.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 4cdf2e9df13c6327fcc94d53e4953005543aef3d Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 6 Apr 2016 17:43:02 +0300
> -Subject: [PATCH 01/10] distutils: set the prefix to be inside staging
> - directory
> -
> -The proper prefix is inside our staging area.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> -Signed-off-by: Phil Blundell <philb@gnu.org>
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - Lib/distutils/sysconfig.py | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index de7da1d..f3aacf7 100644
> ---- a/Lib/distutils/sysconfig.py
> -+++ b/Lib/distutils/sysconfig.py
> -@@ -75,7 +75,7 @@ def get_python_inc(plat_specific=3D0, prefix=3DNone):
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -     if prefix is None:
> --        prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> -+        prefix =3D os.environ['STAGING_INCDIR'].rstrip('include')
> -
> -     if os.name =3D=3D "posix":
> -         if python_build:
> -@@ -115,12 +115,16 @@ def get_python_lib(plat_specific=3D0, standard_lib=
=3D0, prefix=3DNone):
> -     If 'prefix' is supplied, use it instead of sys.prefix or
> -     sys.exec_prefix -- i.e., ignore 'plat_specific'.
> -     """
> -+    lib_basename =3D os.environ['STAGING_LIBDIR'].split('/')[-1]
> -     if prefix is None:
> --        prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix =3D os.environ['STAGING_LIBDIR'].rstrip(lib_basename=
)
> -+        else:
> -+            prefix =3D PREFIX
> -
> -     if os.name =3D=3D "posix":
> -         libpython =3D os.path.join(prefix,
> --                                 "lib", "python" + get_python_version()=
)
> -+                                 lib_basename, "python" + get_python_ve=
rsion())
> -         if standard_lib:
> -             return libpython
> -         else:
> ---
> -2.8.0.rc3
> -
> diff --git a/meta/recipes-devtools/python/python/0001-python-Resolve-inte=
rmediate-staging-issues.patch b/meta/recipes-devtools/python/python/0001-py=
thon-Resolve-intermediate-staging-issues.patch
> deleted file mode 100644
> index 2ff2ccc43dc..00000000000
> --- a/meta/recipes-devtools/python/python/0001-python-Resolve-intermediat=
e-staging-issues.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 77bcb3238b2853d511714544e0f84a37be6c79bf Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Wed, 14 Nov 2012 14:31:24 +0000
> -Subject: [PATCH] python: Resolve intermediate staging issues
> -
> -When cross compiling python, we used to need to install the Makefile, py=
config.h
> -and the python library to their final location before being able to comp=
ile the
> -rest of python. This change allows us to point python at its own source =
when
> -building, avoiding a variety of sysroot staging issues and simplifying t=
he main
> -python recipe.
> -
> -Upstream-Status: Inappropriate
> -RP 2012/11/13
> -
> ----
> - Lib/distutils/sysconfig.py | 3 +++
> - Lib/sysconfig.py           | 5 ++++-
> - 2 files changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index 2f4b8ca..15bceb5 100644
> ---- a/Lib/distutils/sysconfig.py
> -+++ b/Lib/distutils/sysconfig.py
> -@@ -31,6 +31,9 @@ else:
> -     # sys.executable can be empty if argv[0] has been changed and Pytho=
n is
> -     # unable to retrieve the real program name
> -     project_base =3D os.getcwd()
> -+_PYTHONBUILDDIR =3D os.environ.get("PYTHONBUILDDIR", None)
> -+if _PYTHONBUILDDIR:
> -+    project_base =3D _PYTHONBUILDDIR
> - if os.name =3D=3D "nt" and "pcbuild" in project_base[-8:].lower():
> -     project_base =3D os.path.abspath(os.path.join(project_base, os.path=
.pardir))
> - # PC/VS7.1
> -diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index 9c8350d..bddbe2e 100644
> ---- a/Lib/sysconfig.py
> -+++ b/Lib/sysconfig.py
> -@@ -93,6 +93,7 @@ _PREFIX =3D os.path.normpath(sys.prefix)
> - _EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix)
> - _CONFIG_VARS =3D None
> - _USER_BASE =3D None
> -+_PYTHONBUILDDIR =3D os.environ.get("PYTHONBUILDDIR", None)
> -
> - def _safe_realpath(path):
> -     try:
> -@@ -100,7 +101,9 @@ def _safe_realpath(path):
> -     except OSError:
> -         return path
> -
> --if sys.executable:
> -+if _PYTHONBUILDDIR:
> -+    _PROJECT_BASE =3D _PYTHONBUILDDIR
> -+elif sys.executable:
> -     _PROJECT_BASE =3D os.path.dirname(_safe_realpath(sys.executable))
> - else:
> -     # sys.executable can be empty if argv[0] has been changed and Pytho=
n is
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/python/python/0001-python2-use-cc_base=
name-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/pyth=
on/0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch
> deleted file mode 100644
> index 6e4f820913e..00000000000
> --- a/meta/recipes-devtools/python/python/0001-python2-use-cc_basename-to=
-replace-CC-for-checking-c.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 3f49be81e31c164654aeb10b65ebade982ca2ed8 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 22 Oct 2018 15:24:48 +0800
> -Subject: [PATCH] python2: use cc_basename to replace CC for checking com=
piler
> -
> -When working path contains "clang"/"gcc"/"icc", it might be part of $CC
> -because of the "--sysroot" parameter. That could cause judgement error
> -about clang/gcc/icc compilers. e.g.
> -When "icc" is containded in working path, below errors are reported when
> -compiling python:
> -x86_64-wrs-linux-gcc: error: strict: No such file or directory
> -x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model=
'
> -
> -Here use cc_basename to replace CC for checking compiler to avoid such
> -kind of issue.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> -
> -Patch orignally from Li Zhou, I just rework it to new version
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - configure.ac | 18 +++++++++---------
> - 1 file changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index db1c940..dfcd89a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -684,7 +684,7 @@ AC_MSG_RESULT($with_cxx_main)
> - preset_cxx=3D"$CXX"
> - if test -z "$CXX"
> - then
> --        case "$CC" in
> -+        case "$cc_basename" in
> -         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
> -         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
> -         esac
> -@@ -757,14 +757,14 @@ rmdir CaseSensitiveTestDir
> -
> - case $MACHDEP in
> - bsdos*)
> --    case $CC in
> -+    case $cc_basename in
> -     gcc) CC=3D"$CC -D_HAVE_BSDI";;
> -     esac;;
> - esac
> -
> - case $ac_sys_system in
> - hp*|HP*)
> --    case $CC in
> -+    case $cc_basename in
> -     cc|*/cc) CC=3D"$CC -Ae";;
> -     esac;;
> - SunOS*)
> -@@ -1084,7 +1084,7 @@ then
> -         fi
> -
> -         # Clang also needs -fwrapv
> --        case $CC in
> -+        case $cc_basename in
> -             *clang*) WRAP=3D"-fwrapv"
> -             ;;
> -         esac
> -@@ -1304,7 +1304,7 @@ yes)
> - esac
> -
> - # ICC needs -fp-model strict or floats behave badly
> --case "$CC" in
> -+case "$cc_basename" in
> - *icc*)
> -     BASECFLAGS=3D"$BASECFLAGS -fp-model strict"
> -     ;;
> -@@ -1443,7 +1443,7 @@ else
> - fi],
> - [AC_MSG_RESULT(no)])
> - if test "$Py_LTO" =3D 'true' ; then
> --  case $CC in
> -+  case $cc_basename in
> -     *clang*)
> -       # Any changes made here should be reflected in the GCC+Darwin cas=
e below
> -       LTOFLAGS=3D"-flto"
> -@@ -1508,7 +1508,7 @@ then
> -   fi
> - fi
> - LLVM_PROF_ERR=3Dno
> --case $CC in
> -+case $cc_basename in
> -   *clang*)
> -     # Any changes made here should be reflected in the GCC+Darwin case =
below
> -     PGO_PROF_GEN_FLAG=3D"-fprofile-instr-generate"
> -@@ -2322,7 +2322,7 @@ then
> -               then CCSHARED=3D"-fPIC"
> -               else CCSHARED=3D"-Kpic -belf"
> -               fi;;
> --      IRIX*/6*)  case $CC in
> -+      IRIX*/6*)  case $cc_basename in
> -                  *gcc*) CCSHARED=3D"-shared";;
> -                  *) CCSHARED=3D"";;
> -                  esac;;
> -@@ -2366,7 +2366,7 @@ then
> -               then
> -                       LINKFORSHARED=3D"-Wl,--export-dynamic"
> -               fi;;
> --      SunOS/5*) case $CC in
> -+      SunOS/5*) case $cc_basename in
> -                 *gcc*)
> -                   if $CC -Xlinker --help 2>&1 | grep export-dynamic >/d=
ev/null
> -                   then
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-=
cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools=
-for-cross-build.patch
> deleted file mode 100644
> index b02c09458f1..00000000000
> --- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-b=
uild.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -We need to ensure our host tools get run during build, not the freshly
> -built cross-tools (this will not work), so we introduce HOSTPYTHON and H=
OSTPGEN.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> -Rebased for python-2.7.9
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -
> -Rebased for python-2.7.14
> -Signed-off-by: Derek Straka <derek@asterius.io>
> -
> -Index: Python-2.7.13/Makefile.pre.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.13.orig/Makefile.pre.in
> -+++ Python-2.7.13/Makefile.pre.in
> -@@ -512,7 +513,7 @@ $(BUILDPYTHON):    Modules/python.o $(LIBRA
> -                       $(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDL=
AST)
> -
> - platform: $(BUILDPYTHON) pybuilddir.txt
> --      $(RUNSHARED) $(PYTHON_FOR_BUILD) -c 'import sys ; from sysconfig =
import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
> -+      $(RUNSHARED) $(PYTHON_FOR_BUILD) -c 'import sys ; from distutils.=
util import get_platform ; print get_platform()+"-"+sys.version[0:3]' >plat=
form
> -
> - # Create build directory and generate the sysconfig build-time data the=
re.
> - # pybuilddir.txt contains the name of the build dir and is used for
> -Index: Python-2.7.13/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.13.orig/setup.py
> -+++ Python-2.7.13/setup.py
> -@@ -350,6 +350,7 @@ class PyBuildExt(build_ext):
> -             self.failed.append(ext.name)
> -             self.announce('*** WARNING: renaming "%s" since importing i=
t'
> -                           ' failed: %s' % (ext.name, why), level=3D3)
> -+            return
> -             assert not self.inplace
> -             basename, tail =3D os.path.splitext(ext_filename)
> -             newname =3D basename + "_failed" + tail
> -@@ -574,6 +575,9 @@ class PyBuildExt(build_ext):
> -
> -         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
> -
> -+        lib_dirs =3D [ os.getenv("STAGING_LIBDIR"),  os.getenv("STAGING=
_BASELIBDIR") ]
> -+        inc_dirs =3D [ os.getenv("STAGING_INCDIR") ]
> -+
> -         #
> -         # The following modules are all pretty straightforward, and com=
pile
> -         # on pretty much any POSIXish platform.
> diff --git a/meta/recipes-devtools/python/python/03-fix-tkinter-detection=
.patch b/meta/recipes-devtools/python/python/03-fix-tkinter-detection.patch
> deleted file mode 100644
> index 650ceb5951e..00000000000
> --- a/meta/recipes-devtools/python/python/03-fix-tkinter-detection.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -We need to supply STAGING_INCDIR here, otherwise the Tk headers
> -will not be found.
> -
> -Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille.de>
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> -Rebased for python-2.7.9
> -
> -diff --git a/setup.py b/setup.py
> -index 8fe1fb8..67eda74 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -1892,7 +1892,7 @@ class PyBuildExt(build_ext):
> -                 dotversion =3D dotversion[:-1] + '.' + dotversion[-1]
> -             tcl_include_sub =3D []
> -             tk_include_sub =3D []
> --            for dir in inc_dirs:
> -+            for dir in [os.getenv("STAGING_INCDIR")]:
> -                 tcl_include_sub +=3D [dir + os.sep + "tcl" + dotversion=
]
> -                 tk_include_sub +=3D [dir + os.sep + "tk" + dotversion]
> -             tk_include_sub +=3D tcl_include_sub
> -@@ -1911,22 +1911,6 @@ class PyBuildExt(build_ext):
> -             if dir not in include_dirs:
> -                 include_dirs.append(dir)
> -
> --        # Check for various platform-specific directories
> --        if host_platform =3D=3D 'sunos5':
> --            include_dirs.append('/usr/openwin/include')
> --            added_lib_dirs.append('/usr/openwin/lib')
> --        elif os.path.exists('/usr/X11R6/include'):
> --            include_dirs.append('/usr/X11R6/include')
> --            added_lib_dirs.append('/usr/X11R6/lib64')
> --            added_lib_dirs.append('/usr/X11R6/lib')
> --        elif os.path.exists('/usr/X11R5/include'):
> --            include_dirs.append('/usr/X11R5/include')
> --            added_lib_dirs.append('/usr/X11R5/lib')
> --        else:
> --            # Assume default location for X11
> --            include_dirs.append('/usr/X11/include')
> --            added_lib_dirs.append('/usr/X11/lib')
> --
> -         # If Cygwin, then verify that X is installed before proceeding
> -         if host_platform =3D=3D 'cygwin':
> -             x11_inc =3D find_file('X11/Xlib.h', [], include_dirs)
> diff --git a/meta/recipes-devtools/python/python/05-enable-ctypes-cross-b=
uild.patch b/meta/recipes-devtools/python/python/05-enable-ctypes-cross-bui=
ld.patch
> deleted file mode 100644
> index 5cc87424623..00000000000
> --- a/meta/recipes-devtools/python/python/05-enable-ctypes-cross-build.pa=
tch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Rebased for python 2.7.9
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -# CTypes need to know the actual host we are building on.
> -# Signed-Off: Michael Dietrich <mdt@emdete.de>
> -
> -Index: Python-2.7.9/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.9.orig/setup.py
> -+++ Python-2.7.9/setup.py
> -@@ -2028,12 +2028,12 @@ class PyBuildExt(build_ext):
> -
> -                 # Pass empty CFLAGS because we'll just append the resul=
ting
> -                 # CFLAGS to Python's; -g or -O2 is to be avoided.
> --                cmd =3D "cd %s && env CFLAGS=3D'' '%s/configure' %s" \
> --                      % (ffi_builddir, ffi_srcdir, " ".join(config_args=
))
> -+                cmd =3D "(cd %s && autoconf -W cross) && (cd %s && env =
CFLAGS=3D'' '%s/configure' %s)" \
> -+                    % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(c=
onfig_args))
> -
> -                 res =3D os.system(cmd)
> -                 if res or not os.path.exists(ffi_configfile):
> --                    print "Failed to configure _ctypes module"
> -+                    print "Failed to configure _ctypes module (res=3D%d=
) or missing conffile=3D%s" % ( res, ffi_configfile )
> -                     return False
> -
> -             fficonfig =3D {}
> diff --git a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap=
_path_in_linking.patch b/meta/recipes-devtools/python/python/06-avoid_usr_l=
ib_termcap_path_in_linking.patch
> deleted file mode 100644
> index 435b3190137..00000000000
> --- a/meta/recipes-devtools/python/python/06-avoid_usr_lib_termcap_path_i=
n_linking.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Upstream-Status: Pending
> -
> -The poison directories patch has detected library path issue while
> -compiling the python in cross environment, as seen bellow.
> -
> -warning: library search path "/usr/lib/termcap" is unsafe for cross-comp=
ilation
> -
> -This Patch fixes this issue in the python build environment.
> -11 Oct 2010
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -2011/09/29
> -Rebased for python 2.7.2
> -Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> -diff --git a/setup.py b/setup.py
> -index 67eda74..59c537e 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -761,12 +761,10 @@ class PyBuildExt(build_ext):
> -                 pass # Issue 7384: Already linked against curses or tin=
fo.
> -             elif curses_library:
> -                 readline_libs.append(curses_library)
> --            elif self.compiler.find_library_file(lib_dirs +
> --                                                     ['/usr/lib/termcap=
'],
> -+            elif self.compiler.find_library_file(lib_dirs,
> -                                                      'termcap'):
> -                 readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> --                                   library_dirs=3D['/usr/lib/termcap'],
> -                                    extra_link_args=3Dreadline_extra_lin=
k_args,
> -                                    libraries=3Dreadline_libs) )
> -         else:
> diff --git a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-=
PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python/add-CROSSPYTHO=
NPATH-for-PYTHON_FOR_BUILD.patch
> deleted file mode 100644
> index 329734064bd..00000000000
> --- a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_=
FOR_BUILD.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -configure.ac: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD
> -
> -When building x86->x86 the system will try to execute .so and related it=
ems
> -from the default PYTHONPATH.  This will fail if the target CPU contains
> -instructions that the host CPU does not have, add CROSSPYTHONPATH
> -into PYTHONPATH so we can prepend the list to find correct libs.
> -
> -Upstream-Status: Inappropriate [OE-Core integration specific]
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: Python-2.7.14/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/configure.ac
> -+++ Python-2.7.14/configure.ac
> -@@ -36,7 +36,7 @@ if test "$cross_compiling" =3D yes; then
> -           AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
> -       fi
> -         AC_MSG_RESULT($interp)
> --      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHO=
N_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell test -f pyb=
uilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(s=
rcdir)/Lib/$(PLATDIR) '$interp
> -+      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHO=
N_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(CROSSPYTHONPATH):=
$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`=
:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
> -     fi
> - elif test "$cross_compiling" =3D maybe; then
> -     AC_MSG_ERROR([Cross compiling required --host=3DHOST-TUPLE and --bu=
ild=3DARCH])
> diff --git a/meta/recipes-devtools/python/python/add-md5module-support.pa=
tch b/meta/recipes-devtools/python/python/add-md5module-support.patch
> deleted file mode 100644
> index 33fea775548..00000000000
> --- a/meta/recipes-devtools/python/python/add-md5module-support.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: Python-2.7.2/Modules/Setup.dist
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.2.orig/Modules/Setup.dist       2011-06-11 08:46:26.00000=
0000 -0700
> -+++ Python-2.7.2/Modules/Setup.dist    2011-12-27 15:51:41.244623219 -08=
00
> -@@ -248,7 +248,7 @@
> - # Message-Digest Algorithm, described in RFC 1321.  The necessary files
> - # md5.c and md5.h are included here.
> -
> --#_md5 md5module.c md5.c
> -+_md5 md5module.c md5.c
> -
> -
> - # The _sha module implements the SHA checksum algorithms.
> diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkin=
ter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter=
.patch
> deleted file mode 100644
> index 287095f615c..00000000000
> --- a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.pat=
ch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -_tkinter module needs tk module along with tcl. tk is not yet integrated
> -in yocto so we skip the check for this module.
> -Avoid a warning by not adding this module to missing variable.
> -
> -Upstream-Status: Inappropriate [distribution]
> -
> -Also simply disable the tk module since its not in DEPENDS.
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Index: Python-2.7.13/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.13.orig/setup.py
> -+++ Python-2.7.13/setup.py
> -@@ -1783,10 +1783,12 @@ class PyBuildExt(build_ext):
> -         self.extensions.extend(exts)
> -
> -         # Call the method for detecting whether _tkinter can be compile=
d
> --        self.detect_tkinter(inc_dirs, lib_dirs)
> -+        # self.detect_tkinter(inc_dirs, lib_dirs)
> -
> --        if '_tkinter' not in [e.name for e in self.extensions]:
> --            missing.append('_tkinter')
> -+        # tkinter module will not be avalaible as yocto
> -+        # doesn't have tk integrated (yet)
> -+        #if '_tkinter' not in [e.name for e in self.extensions]:
> -+        #    missing.append('_tkinter')
> -
> - ##         # Uncomment these lines if you want to play with xxmodule.c
> - ##         ext =3D Extension('xx', ['xxmodule.c'])
> diff --git a/meta/recipes-devtools/python/python/avoid_warning_for_sunos_=
specific_module.patch b/meta/recipes-devtools/python/python/avoid_warning_f=
or_sunos_specific_module.patch
> deleted file mode 100644
> index 8ba58230144..00000000000
> --- a/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specifi=
c_module.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -sunaudiodev module is sunos specific so we avoid a warning by not
> -adding this module to missing variable.
> -
> -Upstream-Status: Inappropriate [distribution]
> -
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Index: Python-2.7.13/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.13.orig/setup.py
> -+++ Python-2.7.13/setup.py
> -@@ -1671,8 +1671,9 @@ class PyBuildExt(build_ext):
> -         if host_platform =3D=3D 'sunos5':
> -             # SunOS specific modules
> -             exts.append( Extension('sunaudiodev', ['sunaudiodev.c']) )
> --        else:
> --            missing.append('sunaudiodev')
> -+        # If platform is not sunos warning is useless
> -+        #else:
> -+        #    missing.append('sunaudiodev')
> -
> -         if host_platform =3D=3D 'darwin':
> -             # _scproxy
> diff --git a/meta/recipes-devtools/python/python/cgi_py.patch b/meta/reci=
pes-devtools/python/python/cgi_py.patch
> deleted file mode 100644
> index de504f9dcff..00000000000
> --- a/meta/recipes-devtools/python/python/cgi_py.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Lib/cgi.py: Update the script as mentioned in the comment
> -
> -Upstream-Status: Inappropriate [distribution]
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -
> ---- Python-2.6.6/Lib/cgi.py.orig       2010-08-01 22:14:27.000000000 -05=
00
> -+++ Python-2.6.6/Lib/cgi.py    2011-09-21 15:28:40.478208631 -0500
> -@@ -1,13 +1,4 @@
> --#! /usr/local/bin/python
> --
> --# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
> --# intentionally NOT "/usr/bin/env python".  On many systems
> --# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
> --# scripts, and /usr/local/bin is the default directory where Python is
> --# installed, so /usr/bin/env would be unable to find python.  Granted,
> --# binary installations by Linux vendors often install Python in
> --# /usr/bin.  So let those vendors patch cgi.py to match their choice
> --# of installation.
> -+#! /usr/bin/env python
> -
> - """Support module for CGI (Common Gateway Interface) scripts.
> -
> diff --git a/meta/recipes-devtools/python/python/check-if-target-is-64b-n=
ot-host.patch b/meta/recipes-devtools/python/python/check-if-target-is-64b-=
not-host.patch
> deleted file mode 100644
> index e6d6c65bbe4..00000000000
> --- a/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host=
.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Author: Andrei Gherzan <andrei@gherzan.ro>
> -Date:   Sun Mar 25 02:02:27 2012 +0200
> -
> -This patch was added for 64bit host machines. In the compile process pyt=
hon
> -is checking if platform is a 64bit platform using sys.maxint which is th=
e host's
> -value. The patch fixes this issue so that python would check if TARGET m=
achine
> -is 64bit not the HOST machine. In this way will have "dl" and "imageop" =
modules
> -built if HOST machine is 64bit but the target machine is 32bit.
> -
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Upstream-Status: Pending
> -
> -Index: Python-2.7.11/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.11.orig/setup.py
> -+++ Python-2.7.11/setup.py
> -@@ -35,6 +35,21 @@ COMPILED_WITH_PYDEBUG =3D ('--with-pydebug
> - # This global variable is used to hold the list of modules to be disabl=
ed.
> - disabled_module_list =3D []
> -
> -+def target_is_64bit_platform ():
> -+    """
> -+    In case of cross-compile, some modules are not build as setup check=
s if HOST
> -+    is 64bit and not TARGET.
> -+    As python was built for TARGET we can check this in pyconfig.h in t=
his way:
> -+      Sizeof LONG on a 32 bit platform is 4 bytes
> -+      Sizeof LONG on a 64 bit platform is 8 bytes
> -+    """
> -+    pyconf =3D open("pyconfig.h").read()
> -+    aux =3D re.search(r"#s*define\s+SIZEOF_LONG\s+8\s*", pyconf)
> -+    if aux is not None:
> -+      return True
> -+    else:
> -+      return False
> -+
> - def add_dir_to_list(dirlist, dir):
> -     """Add the directory 'dir' to the list 'dirlist' (at the front) if
> -     1) 'dir' is not already in 'dirlist'
> -@@ -716,7 +731,7 @@ class PyBuildExt(build_ext):
> -         exts.append( Extension('audioop', ['audioop.c']) )
> -
> -         # Disabled on 64-bit platforms
> --        if sys.maxsize !=3D 9223372036854775807L:
> -+        if not target_is_64bit_platform():
> -             # Operations on images
> -             exts.append( Extension('imageop', ['imageop.c']) )
> -         else:
> -@@ -1545,7 +1560,7 @@ class PyBuildExt(build_ext):
> -                 missing.append('_codecs_%s' % loc)
> -
> -         # Dynamic loading module
> --        if sys.maxint =3D=3D 0x7fffffff:
> -+        if not target_is_64bit_platform():
> -             # This requires sizeof(int) =3D=3D sizeof(long) =3D=3D size=
of(char*)
> -             dl_inc =3D find_file('dlfcn.h', [], inc_dirs)
> -             if (dl_inc is not None) and (host_platform not in ['atheos'=
]):
> diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/me=
ta/recipes-devtools/python/python/create_manifest2.py
> deleted file mode 100644
> index 34659515cbb..00000000000
> --- a/meta/recipes-devtools/python/python/create_manifest2.py
> +++ /dev/null
> @@ -1,298 +0,0 @@
> -# This script is used as a bitbake task to create a new python manifest
> -# $ bitbake python -c create_manifest
> -#
> -# Our goal is to keep python-core as small as posible and add other pyth=
on
> -# packages only when the user needs them, hence why we split upstream py=
thon
> -# into several packages.
> -#
> -# In a very simplistic way what this does is:
> -# Launch python and see specifically what is required for it to run at a=
 minimum
> -#
> -# Go through the python-manifest file and launch a separate task for eve=
ry single
> -# one of the files on each package, this task will check what was requir=
ed for that
> -# specific module to run, these modules will be called dependencies.
> -# The output of such task will be a list of the modules or dependencies =
that were
> -# found for that file.
> -#
> -# Such output will be parsed by this script, we will look for each depen=
dency on the
> -# manifest and if we find that another package already includes it, then=
 we will add
> -# that package as an RDEPENDS to the package we are currently checking; =
in case we dont
> -# find the current dependency on any other package we will add it to the=
 current package
> -# as part of FILES.
> -#
> -#
> -# This way we will create a new manifest from the data structure that wa=
s built during
> -# this process, on this new manifest each package will contain specifica=
lly only
> -# what it needs to run.
> -#
> -# There are some caveats which we try to deal with, such as repeated fil=
es on different
> -# packages, packages that include folders, wildcards, and special packag=
es.
> -# Its also important to note that this method only works for python file=
s, and shared
> -# libraries. Static libraries, header files and binaries need to be deal=
t with manually.
> -#
> -# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmai=
l dot com>
> -
> -
> -import sys
> -import subprocess
> -import json
> -import os
> -import collections
> -
> -# Hack to get native python search path (for folders), not fond of it bu=
t it works for now
> -pivot=3D'recipe-sysroot-native'
> -for p in sys.path:
> -  if pivot in p:
> -    nativelibfolder=3Dp[:p.find(pivot)+len(pivot)]
> -
> -# Empty dict to hold the whole manifest
> -new_manifest =3D collections.OrderedDict()
> -
> -# Check for repeated files, folders and wildcards
> -allfiles=3D[]
> -repeated=3D[]
> -wildcards=3D[]
> -
> -hasfolders=3D[]
> -allfolders=3D[]
> -
> -def isFolder(value):
> -  if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')=
) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64'))=
 or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
> -    return True
> -  else:
> -    return False
> -
> -def prepend_comments(comments, json_manifest):
> -    with open(json_manifest, 'r+') as manifest:
> -        json_contents =3D manifest.read()
> -        manifest.seek(0, 0)
> -        manifest.write(comments + json_contents)
> -
> -# Read existing JSON manifest
> -with open('python2-manifest.json') as manifest:
> -    # The JSON format doesn't allow comments so we hack the call to keep=
 the comments using a marker
> -    manifest_str =3D  manifest.read()
> -    json_start =3D manifest_str.find('# EOC') + 6 # EOC + \n
> -    manifest.seek(0)
> -    comments =3D manifest.read(json_start)
> -    manifest_str =3D manifest.read()
> -    old_manifest =3D json.loads(manifest_str, object_pairs_hook=3Dcollec=
tions.OrderedDict)
> -
> -# First pass to get core-package functionality, because we base everythi=
ng on the fact that core is actually working
> -# Not exactly the same so it should not be a function
> -print ("Getting dependencies for core package:")
> -
> -# Special call to check for core package
> -output =3D subprocess.check_output([sys.executable, 'get_module_deps2.py=
', 'python-core-package'])
> -for item in output.split():
> -    # We append it so it doesnt hurt what we currently have:
> -    if item not in old_manifest['core']['files']:
> -        # We use the same data structure since its the one which will be=
 used to check
> -        # dependencies for other packages
> -        old_manifest['core']['files'].append(item)
> -
> -for value in old_manifest['core']['files']:
> -  # Ignore folders, since we don't import those, difficult to handle mul=
tilib
> -  if isFolder(value):
> -    # Pass it directly
> -    if value not in old_manifest['core']['files']:
> -      old_manifest['core']['files'].append(value)
> -  # Ignore binaries, since we don't import those, assume it was added co=
rrectly (manually)
> -  if '${bindir}' in value:
> -    # Pass it directly
> -    if value not in old_manifest['core']['files']:
> -      old_manifest['core']['files'].append(value)
> -    continue
> -  # Ignore empty values
> -  if value =3D=3D '':
> -    continue
> -  if '${includedir}' in value:
> -    if value not in old_manifest['core']['files']:
> -      old_manifest['core']['files'].append(value)
> -    continue
> -  # Get module name , shouldnt be affected by libdir/bindir
> -  value =3D os.path.splitext(os.path.basename(os.path.normpath(value)))[=
0]
> -
> -
> -  # Launch separate task for each module for deterministic behavior
> -  # Each module will only import what is necessary for it to work in spe=
cific
> -  print ('Getting dependencies for module: %s' % value)
> -  output =3D subprocess.check_output([sys.executable, 'get_module_deps2.=
py', '%s' % value])
> -  for item in output.split():
> -    # We append it so it doesnt hurt what we currently have:
> -    if item not in old_manifest['core']['files']:
> -      old_manifest['core']['files'].append(item)
> -
> -# We check which packages include folders
> -for key in old_manifest:
> -    for value in old_manifest[key]['files']:
> -        # Ignore folders, since we don't import those, difficult to hand=
le multilib
> -        if isFolder(value):
> -            print ('%s is a folder' % value)
> -            if key not in hasfolders:
> -                hasfolders.append(key)
> -            if value not in allfolders:
> -                allfolders.append(value)
> -
> -for key in old_manifest:
> -    # Use an empty dict as data structure to hold data for each package =
and fill it up
> -    new_manifest[key] =3D collections.OrderedDict()
> -    new_manifest[key]['summary'] =3D old_manifest[key]['summary']
> -    new_manifest[key]['rdepends']=3D[]
> -    new_manifest[key]['files'] =3D []
> -
> -    # All packages should depend on core
> -    if key !=3D 'core':
> -        new_manifest[key]['rdepends'].append('core')
> -
> -    # Handle special cases, we assume that when they were manually added
> -    # to the manifest we knew what we were doing.
> -    print ('Handling package %s' % key)
> -    special_packages=3D['misc', 'modules', 'tests', 'dev']
> -    if key in special_packages or 'staticdev' in key:
> -        print('Passing %s package directly' % key)
> -        new_manifest[key]=3Dold_manifest[key]
> -        continue
> -
> -    for value in old_manifest[key]['files']:
> -        # We already handled core on the first pass
> -        if key =3D=3D 'core':
> -            new_manifest[key]['files'].append(value)
> -            continue
> -        # Ignore folders, since we don't import those, difficult to hand=
le multilib
> -        if isFolder(value):
> -            # Pass folders directly
> -            new_manifest[key]['files'].append(value)
> -        # Ignore binaries, since we don't import those
> -        if '${bindir}' in value:
> -            # Pass it directly to the new manifest data structure
> -            if value not in new_manifest[key]['files']:
> -                new_manifest[key]['files'].append(value)
> -            continue
> -        # Ignore empty values
> -        if value =3D=3D '':
> -            continue
> -        if '${includedir}' in value:
> -            if value not in new_manifest[key]['files']:
> -                new_manifest[key]['files'].append(value)
> -            continue
> -        # Get module name , shouldnt be affected by libdir/bindir
> -        value =3D os.path.splitext(os.path.basename(os.path.normpath(val=
ue)))[0]
> -
> -        # Launch separate task for each module for deterministic behavio=
r
> -        # Each module will only import what is necessary for it to work =
in specific
> -        print ('Getting dependencies for module: %s' % value)
> -        output =3D subprocess.check_output([sys.executable, 'get_module_=
deps2.py', '%s' % value])
> -
> -        # We can print dependencies for debugging purposes
> -        #print (output)
> -        # Output will have all dependencies
> -        for item in output.split():
> -
> -            # Warning: This first part is ugly
> -            # One of the dependencies that was found, could be inside of=
 one of the folders included by another package
> -            # We need to check if this happens so we can add the package=
 containing the folder as an RDEPENDS
> -            # e.g. Folder encodings contained in codecs
> -            # This would be solved if no packages included any folders
> -
> -            # This can be done in two ways:
> -            # 1 - We assume that if we take out the filename from the pa=
th we would get
> -            #   the folder string, then we would check if folder string =
is in the list of folders
> -            #   This would not work if a package contains a folder which=
 contains another folder
> -            #   e.g. path/folder1/folder2/filename  folder_string=3D pat=
h/folder1/folder2
> -            #   folder_string would not match any value contained in the=
 list of folders
> -            #
> -            # 2 - We do it the other way around, checking if the folder =
is contained in the path
> -            #   e.g. path/folder1/folder2/filename  folder_string=3D pat=
h/folder1/folder2
> -            #   is folder_string inside path/folder1/folder2/filename?,
> -            #   Yes, it works, but we waste a couple of milliseconds.
> -
> -            inFolders=3DFalse
> -            for folder in allfolders:
> -                # The module could have a directory named after it, e.g.=
 xml, if we take out the filename from the path
> -                # we'll end up with ${libdir}, and we want ${libdir}/xml
> -                if isFolder(item):
> -                    check_path =3D item
> -                else:
> -                    check_path =3D os.path.dirname(item)
> -                if folder in check_path :
> -                    inFolders =3D True # Did we find a folder?
> -                    folderFound =3D False # Second flag to break inner f=
or
> -                    # Loop only through packages which contain folders
> -                    for keyfolder in hasfolders:
> -                        if (folderFound =3D=3D False):
> -                            #print("Checking folder %s on package %s" % =
(item,keyfolder))
> -                            for file_folder in old_manifest[keyfolder]['=
files']:
> -                                if file_folder=3D=3Dfolder:
> -                                    print ('%s found in %s' % (folder, k=
eyfolder))
> -                                    folderFound =3D True
> -                                    if keyfolder not in new_manifest[key=
]['rdepends'] and keyfolder !=3D key:
> -                                        new_manifest[key]['rdepends'].ap=
pend(keyfolder)
> -                        else:
> -                            break
> -
> -            # A folder was found so we're done with this item, we can go=
 on
> -            if inFolders:
> -                continue
> -
> -            # We might already have it on the dictionary since it could =
depend on a (previously checked) module
> -            if item not in new_manifest[key]['files']:
> -                # Handle core as a special package, we already did it so=
 we pass it to NEW data structure directly
> -                if key=3D=3D'core':
> -                  print('Adding %s to %s FILES' % (item, key))
> -                  if item.endswith('*'):
> -                      wildcards.append(item)
> -                  new_manifest[key]['files'].append(item)
> -
> -                  # Check for repeated files
> -                  if item not in allfiles:
> -                      allfiles.append(item)
> -                  else:
> -                      repeated.append(item)
> -
> -                else:
> -
> -                    # Check if this dependency is already contained on a=
nother package, so we add it
> -                    # as an RDEPENDS, or if its not, it means it should =
be contained on the current
> -                    # package, so we should add it to FILES
> -                    for newkey in old_manifest:
> -                        # Debug
> -                        #print("Checking %s " % item + " in %s" % newkey=
)
> -                        if item in old_manifest[newkey]['files']:
> -                                # Since were nesting, we need to check i=
ts not the same key
> -                                if(newkey!=3Dkey):
> -                                    if newkey not in new_manifest[key]['=
rdepends']:
> -                                       # Add it to the new manifest data=
 struct
> -                                       # Debug
> -                                       print('Adding %s to %s RDEPENDS, =
because it contains %s' % (newkey, key, item))
> -                                       new_manifest[key]['rdepends'].app=
end(newkey)
> -                                    break
> -                    else:
> -                        # Debug
> -                        print('Adding %s to %s FILES' % (item, key))
> -                        # Since it wasnt found on another package, its n=
ot an RDEP, so add it to FILES for this package
> -                        new_manifest[key]['files'].append(item)
> -                        if item.endswith('*'):
> -                            wildcards.append(item)
> -                        if item not in allfiles:
> -                            allfiles.append(item)
> -                        else:
> -                            repeated.append(item)
> -
> -print ('The following files are repeated (contained in more than one pac=
kage), please check which package should get it:')
> -print (repeated)
> -print('The following files contain wildcards, please check they are nece=
ssary')
> -print(wildcards)
> -print('The following files contain folders, please check they are necess=
ary')
> -print(hasfolders)
> -
> -# Sort it just so it looks nice
> -for key in new_manifest:
> -    new_manifest[key]['files'].sort()
> -    new_manifest[key]['rdepends'].sort()
> -
> -# Create the manifest from the data structure that was built
> -with open('python2-manifest.json.new','w') as outfile:
> -    json.dump(new_manifest,outfile, indent=3D4)
> -
> -prepend_comments(comments,'python2-manifest.json.new')
> diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_=
libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_=
libdir.patch
> deleted file mode 100644
> index d41b6cfc744..00000000000
> --- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.=
patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -Upstream-Status: Inappropriate [Embedded specific]
> -
> -This patch fixes issuing with different libdir like lib64.
> -This patch makes the native python binary modules findable
> -in the install process of the host python.
> -
> -Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: 2012/03/14
> -
> -Updated for python 2.7.3
> -Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: 2012/05/01
> -
> -Rebased for python-2.7.9
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -
> -
> -Index: Python-2.7.9/Lib/sysconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.9.orig/Lib/sysconfig.py
> -+++ Python-2.7.9/Lib/sysconfig.py
> -@@ -9,7 +9,7 @@ _INSTALL_SCHEMES =3D {
> -     'posix_prefix': {
> -         'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
> -         'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}'=
,
> --        'purelib': '{base}/lib/python{py_version_short}/site-packages',
> -+        'purelib': '{base}/'+sys.lib+'/python{py_version_short}/site-pa=
ckages',
> -         'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/sit=
e-packages',
> -         'include': '{base}/include/python{py_version_short}',
> -         'platinclude': '{platbase}/include/python{py_version_short}',
> -@@ -67,7 +67,7 @@ _INSTALL_SCHEMES =3D {
> -     'posix_user': {
> -         'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
> -         'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}'=
,
> --        'purelib': '{userbase}/lib/python{py_version_short}/site-packag=
es',
> -+        'purelib': '{userbase}/'+sys.lib+'/python{py_version_short}/sit=
e-packages',
> -         'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/sit=
e-packages',
> -         'include': '{userbase}/include/python{py_version_short}',
> -         'scripts': '{userbase}/bin',
> -Index: Python-2.7.9/Makefile.pre.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.9.orig/Makefile.pre.in
> -+++ Python-2.7.9/Makefile.pre.in
> -@@ -1037,27 +1037,27 @@ libinstall:    build_all $(srcdir)/Lib/$(PL
> -               $(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
> -                       $(DESTDIR)$(LIBDEST)/distutils/tests ; \
> -       fi
> --      PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> -+      PYTHONPATH=3D$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED)=
 \
> -               $(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compilea=
ll.py \
> -               -d $(LIBDEST) -f \
> -               -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data=
' \
> -               $(DESTDIR)$(LIBDEST)
> --      PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> -+      PYTHONPATH=3D$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED)=
 \
> -               $(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compi=
leall.py \
> -               -d $(LIBDEST) -f \
> -               -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data=
' \
> -               $(DESTDIR)$(LIBDEST)
> --      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> -+      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED=
) \
> -               $(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileal=
l.py \
> -               -d $(LIBDEST)/site-packages -f \
> -               -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> --      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> -+      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED=
) \
> -               $(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compil=
eall.py \
> -               -d $(LIBDEST)/site-packages -f \
> -               -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> --      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> -+      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED=
) \
> -               $(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(L=
IBDEST)/lib2to3/Grammar.txt
> --      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> -+      -PYTHONPATH=3D$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED=
) \
> -               $(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(L=
IBDEST)/lib2to3/PatternGrammar.txt
> -
> - # Create the PLATDIR source directory, if one wasn't distributed..
> diff --git a/meta/recipes-devtools/python/python/float-endian.patch b/met=
a/recipes-devtools/python/python/float-endian.patch
> deleted file mode 100644
> index 8a5c90aec40..00000000000
> --- a/meta/recipes-devtools/python/python/float-endian.patch
> +++ /dev/null
> @@ -1,216 +0,0 @@
> -Python uses AC_RUN_IFELSE to determine the byte order for floats and dou=
bles,
> -and falls back onto "I don't know" if it can't run code.  This results i=
n
> -crippled floating point numbers in Python, and the regression tests fail=
.
> -
> -Instead of running code, take a macro from autoconf-archive which compil=
es C
> -with a special double in which has an ASCII representation, and then gre=
ps the
> -binary to identify the format.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 253f47b28120c42cfe53a4e2f5ed0ab0ed469deb Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross@burtonini.com>
> -Date: Wed, 19 Sep 2018 07:25:48 +0100
> -Subject: [PATCH] closes bpo-34585: Don't do runtime test to get float by=
te
> - order. (GH-9085)
> -
> -Currently configure.ac uses AC_RUN_IFELSE to determine the byte order of=
 doubles, but this silently fails under cross compilation and Python doesn'=
t do floats properly.
> -
> -Instead, steal a macro from autoconf-archive which compiles code using m=
agic doubles (which encode to ASCII) and grep for the representation in the=
 binary.
> -
> -RFC because this doesn't yet handle the weird ancient ARMv4 OABI 'mixed-=
endian' encoding properly. This encoding is ancient and I don't believe the=
 union of "Python 3.8 users" and "OABI users" has anything in. Should the s=
upport for this just be dropped too? Alternatively, someone will need to fi=
nd an OABI toolchain to verify the encoding of the magic double.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - .../Build/2018-09-18-16-28-31.bpo-34585.CGMu0h.rst |  3 +
> - configure.ac                                       | 76 ++++-----------=
-----
> - m4/ax_c_float_words_bigendian.m4                   | 83 +++++++++++++++=
+++++++
> - 3 files changed, 99 insertions(+), 63 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Build/2018-09-18-16-28-31.bpo-34585=
.CGMu0h.rst
> - create mode 100644 m4/ax_c_float_words_bigendian.m4
> -
> -diff --git a/configure.ac b/configure.ac
> -index 913d5469d0..7672735396 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3835,74 +3835,24 @@ fi],
> - # * Check for various properties of floating point *
> - # **************************************************
> -
> --AC_MSG_CHECKING(whether C doubles are little-endian IEEE 754 binary64)
> --AC_CACHE_VAL(ac_cv_little_endian_double, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include <string.h>
> --int main() {
> --    double x =3D 9006104071832581.0;
> --    if (memcmp(&x, "\x05\x04\x03\x02\x01\xff\x3f\x43", 8) =3D=3D 0)
> --        return 0;
> --    else
> --        return 1;
> --}
> --]])],
> --[ac_cv_little_endian_double=3Dyes],
> --[ac_cv_little_endian_double=3Dno],
> --[ac_cv_little_endian_double=3Dno])])
> --AC_MSG_RESULT($ac_cv_little_endian_double)
> --if test "$ac_cv_little_endian_double" =3D yes
> --then
> --  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
> --  [Define if C doubles are 64-bit IEEE 754 binary format, stored
> --   with the least significant byte first])
> --fi
> --
> --AC_MSG_CHECKING(whether C doubles are big-endian IEEE 754 binary64)
> --AC_CACHE_VAL(ac_cv_big_endian_double, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include <string.h>
> --int main() {
> --    double x =3D 9006104071832581.0;
> --    if (memcmp(&x, "\x43\x3f\xff\x01\x02\x03\x04\x05", 8) =3D=3D 0)
> --        return 0;
> --    else
> --        return 1;
> --}
> --]])],
> --[ac_cv_big_endian_double=3Dyes],
> --[ac_cv_big_endian_double=3Dno],
> --[ac_cv_big_endian_double=3Dno])])
> --AC_MSG_RESULT($ac_cv_big_endian_double)
> --if test "$ac_cv_big_endian_double" =3D yes
> -+AX_C_FLOAT_WORDS_BIGENDIAN
> -+if test "$ax_cv_c_float_words_bigendian" =3D "yes"
> - then
> -   AC_DEFINE(DOUBLE_IS_BIG_ENDIAN_IEEE754, 1,
> -   [Define if C doubles are 64-bit IEEE 754 binary format, stored
> -    with the most significant byte first])
> --fi
> --
> --# Some ARM platforms use a mixed-endian representation for doubles.
> --# While Python doesn't currently have full support for these platforms
> --# (see e.g., issue 1762561), we can at least make sure that float <-> s=
tring
> --# conversions work.
> --AC_MSG_CHECKING(whether C doubles are ARM mixed-endian IEEE 754 binary6=
4)
> --AC_CACHE_VAL(ac_cv_mixed_endian_double, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#include <string.h>
> --int main() {
> --    double x =3D 9006104071832581.0;
> --    if (memcmp(&x, "\x01\xff\x3f\x43\x05\x04\x03\x02", 8) =3D=3D 0)
> --        return 0;
> --    else
> --        return 1;
> --}
> --]])],
> --[ac_cv_mixed_endian_double=3Dyes],
> --[ac_cv_mixed_endian_double=3Dno],
> --[ac_cv_mixed_endian_double=3Dno])])
> --AC_MSG_RESULT($ac_cv_mixed_endian_double)
> --if test "$ac_cv_mixed_endian_double" =3D yes
> -+elif test "$ax_cv_c_float_words_bigendian" =3D "no"
> - then
> -+  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
> -+  [Define if C doubles are 64-bit IEEE 754 binary format, stored
> -+   with the least significant byte first])
> -+else
> -+  # Some ARM platforms use a mixed-endian representation for doubles.
> -+  # While Python doesn't currently have full support for these platform=
s
> -+  # (see e.g., issue 1762561), we can at least make sure that float <->=
 string
> -+  # conversions work.
> -+  # FLOAT_WORDS_BIGENDIAN doesnt actually detect this case, but if it's=
 not big
> -+  # or little, then it must be this?
> -   AC_DEFINE(DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754, 1,
> -   [Define if C doubles are 64-bit IEEE 754 binary format, stored
> -    in ARM mixed-endian order (byte order 45670123)])
> -diff --git a/m4/ax_c_float_words_bigendian.m4 b/m4/ax_c_float_words_bige=
ndian.m4
> -new file mode 100644
> -index 0000000000..216b90d803
> ---- /dev/null
> -+++ b/m4/ax_c_float_words_bigendian.m4
> -@@ -0,0 +1,83 @@
> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> -+#  https://www.gnu.org/software/autoconf-archive/ax_c_float_words_bigen=
dian.html
> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> -+#
> -+# SYNOPSIS
> -+#
> -+#   AX_C_FLOAT_WORDS_BIGENDIAN([ACTION-IF-TRUE], [ACTION-IF-FALSE], [AC=
TION-IF-UNKNOWN])
> -+#
> -+# DESCRIPTION
> -+#
> -+#   Checks the ordering of words within a multi-word float. This check =
is
> -+#   necessary because on some systems (e.g. certain ARM systems), the f=
loat
> -+#   word ordering can be different from the byte ordering. In a multi-w=
ord
> -+#   float context, "big-endian" implies that the word containing the si=
gn
> -+#   bit is found in the memory location with the lowest address. This
> -+#   implementation was inspired by the AC_C_BIGENDIAN macro in autoconf=
.
> -+#
> -+#   The endianness is detected by first compiling C code that contains =
a
> -+#   special double float value, then grepping the resulting object file=
 for
> -+#   certain strings of ASCII values. The double is specially crafted to=
 have
> -+#   a binary representation that corresponds with a simple string. In t=
his
> -+#   implementation, the string "noonsees" was selected because the
> -+#   individual word values ("noon" and "sees") are palindromes, thus ma=
king
> -+#   this test byte-order agnostic. If grep finds the string "noonsees" =
in
> -+#   the object file, the target platform stores float words in big-endi=
an
> -+#   order. If grep finds "seesnoon", float words are in little-endian o=
rder.
> -+#   If neither value is found, the user is instructed to specify the
> -+#   ordering.
> -+#
> -+# LICENSE
> -+#
> -+#   Copyright (c) 2008 Daniel Amelang <dan@amelang.net>
> -+#
> -+#   Copying and distribution of this file, with or without modification=
, are
> -+#   permitted in any medium without royalty provided the copyright noti=
ce
> -+#   and this notice are preserved. This file is offered as-is, without =
any
> -+#   warranty.
> -+
> -+#serial 11
> -+
> -+AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
> -+  [AC_CACHE_CHECK(whether float word ordering is bigendian,
> -+                  ax_cv_c_float_words_bigendian, [
> -+
> -+ax_cv_c_float_words_bigendian=3Dunknown
> -+AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> -+
> -+double d =3D 9090423496703681033747047890550501147621169273561563201479=
712084405348886581669527372346909785805625751702019124748742951693213050356=
065000232756451757077848023672452514052012137173920149654013264010997777942=
0565776568942592.0;
> -+
> -+]])], [
> -+
> -+if grep noonsees conftest.$ac_objext >/dev/null ; then
> -+  ax_cv_c_float_words_bigendian=3Dyes
> -+fi
> -+if grep seesnoon conftest.$ac_objext >/dev/null ; then
> -+  if test "$ax_cv_c_float_words_bigendian" =3D unknown; then
> -+    ax_cv_c_float_words_bigendian=3Dno
> -+  else
> -+    ax_cv_c_float_words_bigendian=3Dunknown
> -+  fi
> -+fi
> -+
> -+])])
> -+
> -+case $ax_cv_c_float_words_bigendian in
> -+  yes)
> -+    m4_default([$1],
> -+      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
> -+                 [Define to 1 if your system stores words within floats
> -+                  with the most significant word first])]) ;;
> -+  no)
> -+    $2 ;;
> -+  *)
> -+    m4_default([$3],
> -+      [AC_MSG_ERROR([
> -+
> -+Unknown float word ordering. You need to manually preset
> -+ax_cv_c_float_words_bigendian=3Dno (or yes) according to your system.
> -+
> -+    ])]) ;;
> -+esac
> -+
> -+])# AX_C_FLOAT_WORDS_BIGENDIAN
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/python/python/get_module_deps2.py b/me=
ta/recipes-devtools/python/python/get_module_deps2.py
> deleted file mode 100644
> index 73e7c6f6dc2..00000000000
> --- a/meta/recipes-devtools/python/python/get_module_deps2.py
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -# This script is launched on separate task for each python module
> -# It checks for dependencies for that specific module and prints
> -# them out, the output of this execution will have all dependencies
> -# for a specific module, which will be parsed an dealt on create_manifes=
t.py
> -#
> -# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.c=
om>
> -
> -
> -# We can get a log per module, for all the dependencies that were found,=
 but its messy.
> -debug=3DFalse
> -
> -import sys
> -
> -# We can get a list of the modules which are currently required to run p=
ython
> -# so we run python-core and get its modules, we then import what we need
> -# and check what modules are currently running, if we substract them fro=
m the
> -# modules we had initially, we get the dependencies for the module we im=
ported.
> -
> -# We use importlib to achieve this, so we also need to know what modules=
 importlib needs
> -import importlib
> -
> -core_deps=3Dset(sys.modules)
> -
> -def fix_path(dep_path):
> -    import os
> -    # We DONT want the path on our HOST system
> -    pivot=3D'recipe-sysroot-native'
> -    dep_path=3Ddep_path[dep_path.find(pivot)+len(pivot):]
> -
> -    if '/usr/bin' in dep_path:
> -        dep_path =3D dep_path.replace('/usr/bin''${bindir}')
> -
> -    # Handle multilib, is there a better way?
> -    if '/usr/lib32' in dep_path:
> -        dep_path =3D dep_path.replace('/usr/lib32','${libdir}')
> -    if '/usr/lib64' in dep_path:
> -        dep_path =3D dep_path.replace('/usr/lib64','${libdir}')
> -    if '/usr/lib' in dep_path:
> -        dep_path =3D dep_path.replace('/usr/lib','${libdir}')
> -    if '/usr/include' in dep_path:
> -        dep_path =3D dep_path.replace('/usr/include','${includedir}')
> -    if '__init__.' in dep_path:
> -        dep_path =3D  os.path.split(dep_path)[0]
> -
> -    # If a *.pyc file was imported, we replace it with *.py (since we de=
al with PYCs on create_manifest)
> -    if '.pyc' in dep_path:
> -        dep_path =3D dep_path.replace('.pyc','.py')
> -
> -    return dep_path
> -
> -# Module to import was passed as an argument
> -current_module =3D  str(sys.argv[1]).rstrip()
> -if(debug=3D=3DTrue):
> -       log =3D open('log_%s' % current_module,'w')
> -        log.write('Module %s generated the following dependencies:\n' % =
current_module)
> -try:
> -    importlib.import_module('%s' % current_module)
> -except ImportError as e:
> -    if (debug=3D=3DTrue):
> -        log.write('Module was not found')
> -    pass
> -
> -
> -# Get current module dependencies, dif will contain a list of specific d=
eps for this module
> -module_deps=3Dset(sys.modules)
> -
> -# We handle the core package (1st pass on create_manifest.py) as a speci=
al case
> -if current_module =3D=3D 'python-core-package':
> -    dif =3D core_deps
> -else:
> -    dif =3D module_deps-core_deps
> -
> -
> -# Check where each dependency came from
> -for item in dif:
> -    dep_path=3D''
> -    try:
> -        if (debug=3D=3DTrue):
> -            log.write('Calling: sys.modules[' + '%s' % item + '].__file_=
_\n')
> -        dep_path =3D sys.modules['%s' % item].__file__
> -    except AttributeError as e:
> -        # Deals with thread (builtin module) not having __file__ attribu=
te
> -       if debug=3D=3DTrue:
> -            log.write(item + ' ')
> -            log.write(str(e))
> -           log.write('\n')
> -            pass
> -    except NameError as e:
> -        # Deals with NameError: name 'dep_path' is not defined
> -        # because module is not found (wasn't compiled?), e.g. bddsm
> -        if (debug=3D=3DTrue):
> -            log.write(item+' ')
> -            log.write(str(e))
> -        pass
> -
> -    # Site-customize is a special case since we (OpenEmbedded) put it th=
ere manually
> -    if 'sitecustomize' in dep_path:
> -        dep_path =3D '${libdir}/python2.7/sitecustomize.py'
> -        # Prints out result, which is what will be used by create_manife=
st
> -        print (dep_path)
> -        continue
> -
> -    dep_path =3D fix_path(dep_path)
> -
> -    if (debug=3D=3DTrue):
> -        log.write(dep_path+'\n')
> -
> -    # Prints out result, which is what will be used by create_manifest
> -    print (dep_path)
> -
> -if debug=3D=3DTrue:
> -    log.close()
> diff --git a/meta/recipes-devtools/python/python/host_include_contaminati=
on.patch b/meta/recipes-devtools/python/python/host_include_contamination.p=
atch
> deleted file mode 100644
> index e0aafb218bf..00000000000
> --- a/meta/recipes-devtools/python/python/host_include_contamination.patc=
h
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -when building python for qemux86-64 on ubuntu 11.10/64bit
> -it gropes into host includes and then mixes them with cross
> -includes and as a result some modules fail to compile and link
> -one of the modules is python-elementtree which is then not
> -found during image creation
> -
> -Proble is that setup.py tries to add native includes that newer
> -ubuntu has introduced for multiarch support. But that should
> -only happen for native builds and not cross building python
> -so we add a check here.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -
> -diff --git a/setup.py b/setup.py
> -index ba2d242..bf859be 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -393,6 +393,8 @@ class PyBuildExt(build_ext):
> -
> -         if not find_executable('dpkg-architecture'):
> -             return
> -+        if os.environ.get('CROSS_COMPILE') is not None:
> -+            return
> -         opt =3D ''
> -         if cross_compiling:
> -             opt =3D '-t' + sysconfig.get_config_var('HOST_GNU_TYPE')
> diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/re=
cipes-devtools/python/python/multilib.patch
> deleted file mode 100644
> index d24bc15f013..00000000000
> --- a/meta/recipes-devtools/python/python/multilib.patch
> +++ /dev/null
> @@ -1,298 +0,0 @@
> -Rebased for python-2.7.9
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -Upstream-Status: Pending
> -Index: Python-2.7.14/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/configure.ac
> -+++ Python-2.7.14/configure.ac
> -@@ -758,6 +758,10 @@ SunOS*)
> -     ;;
> - esac
> -
> -+AC_SUBST(LIB)
> -+AC_MSG_CHECKING(LIB)
> -+LIB=3D"SEDMELIBLEAF"
> -+AC_MSG_RESULT($LIB)
> -
> - AC_SUBST(LIBRARY)
> - AC_MSG_CHECKING(LIBRARY)
> -Index: Python-2.7.14/Include/pythonrun.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Include/pythonrun.h
> -+++ Python-2.7.14/Include/pythonrun.h
> -@@ -108,6 +108,7 @@ PyAPI_FUNC(char *) Py_GetPath(void);
> - /* In their own files */
> - PyAPI_FUNC(const char *) Py_GetVersion(void);
> - PyAPI_FUNC(const char *) Py_GetPlatform(void);
> -+PyAPI_FUNC(const char *) Py_GetLib(void);
> - PyAPI_FUNC(const char *) Py_GetCopyright(void);
> - PyAPI_FUNC(const char *) Py_GetCompiler(void);
> - PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
> -Index: Python-2.7.14/Lib/distutils/command/install.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/distutils/command/install.py
> -+++ Python-2.7.14/Lib/distutils/command/install.py
> -@@ -22,6 +22,8 @@ from site import USER_BASE
> - from site import USER_SITE
> -
> -
> -+libname =3D sys.lib
> -+
> - if sys.version < "2.2":
> -     WINDOWS_SCHEME =3D {
> -         'purelib': '$base',
> -@@ -41,8 +43,8 @@ else:
> -
> - INSTALL_SCHEMES =3D {
> -     'unix_prefix': {
> --        'purelib': '$base/lib/python$py_version_short/site-packages',
> --        'platlib': '$platbase/lib/python$py_version_short/site-packages=
',
> -+        'purelib': '$platbase/'+libname+'/python$py_version_short/site-=
packages',
> -+        'platlib': '$platbase/'+libname+'/python$py_version_short/site-=
packages',
> -         'headers': '$base/include/python$py_version_short/$dist_name',
> -         'scripts': '$base/bin',
> -         'data'   : '$base',
> -Index: Python-2.7.14/Lib/distutils/sysconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/distutils/sysconfig.py
> -+++ Python-2.7.14/Lib/distutils/sysconfig.py
> -@@ -119,8 +119,11 @@ def get_python_lib(plat_specific=3D0, stan
> -         prefix =3D plat_specific and EXEC_PREFIX or PREFIX
> -
> -     if os.name =3D=3D "posix":
> --        libpython =3D os.path.join(prefix,
> --                                 "lib", "python" + get_python_version()=
)
> -+        if plat_specific or standard_lib:
> -+            lib =3D sys.lib
> -+        else:
> -+            lib =3D "lib"
> -+        libpython =3D os.path.join(prefix, lib, "python" + get_python_v=
ersion())
> -         if standard_lib:
> -             return libpython
> -         else:
> -Index: Python-2.7.14/Lib/pydoc.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/pydoc.py
> -+++ Python-2.7.14/Lib/pydoc.py
> -@@ -375,7 +375,7 @@ class Doc:
> -     docmodule =3D docclass =3D docroutine =3D docother =3D docproperty =
=3D docdata =3D fail
> -
> -     def getdocloc(self, object,
> --                  basedir=3Dos.path.join(sys.exec_prefix, "lib",
> -+                  basedir=3Dos.path.join(sys.exec_prefix, "sys.lib",
> -                                        "python"+sys.version[0:3])):
> -         """Return the location of module docs or None"""
> -
> -Index: Python-2.7.14/Lib/site.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/site.py
> -+++ Python-2.7.14/Lib/site.py
> -@@ -288,13 +288,18 @@ def getsitepackages():
> -         if sys.platform in ('os2emx', 'riscos'):
> -             sitepackages.append(os.path.join(prefix, "Lib", "site-packa=
ges"))
> -         elif os.sep =3D=3D '/':
> --            sitepackages.append(os.path.join(prefix, "lib",
> -+            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> -                                         "site-packages"))
> --            sitepackages.append(os.path.join(prefix, "lib", "site-pytho=
n"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib, "site-pyt=
hon"))
> -+            if sys.lib !=3D "lib":
> -+                sitepackages.append(os.path.join(prefix, "lib",
> -+                                            "python" + sys.version[:3],
> -+                                            "site-packages"))
> -+                sitepackages.append(os.path.join(prefix, "lib", "site-p=
ython"))
> -         else:
> -             sitepackages.append(prefix)
> --            sitepackages.append(os.path.join(prefix, "lib", "site-packa=
ges"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib, "site-pac=
kages"))
> -     return sitepackages
> -
> - def addsitepackages(known_paths):
> -Index: Python-2.7.14/Lib/sysconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/sysconfig.py
> -+++ Python-2.7.14/Lib/sysconfig.py
> -@@ -7,10 +7,10 @@ from os.path import pardir, realpath
> -
> - _INSTALL_SCHEMES =3D {
> -     'posix_prefix': {
> --        'stdlib': '{base}/lib/python{py_version_short}',
> --        'platstdlib': '{platbase}/lib/python{py_version_short}',
> -+        'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
> -+        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}'=
,
> -         'purelib': '{base}/lib/python{py_version_short}/site-packages',
> --        'platlib': '{platbase}/lib/python{py_version_short}/site-packag=
es',
> -+        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/sit=
e-packages',
> -         'include': '{base}/include/python{py_version_short}',
> -         'platinclude': '{platbase}/include/python{py_version_short}',
> -         'scripts': '{base}/bin',
> -@@ -65,10 +65,10 @@ _INSTALL_SCHEMES =3D {
> -         'data'   : '{userbase}',
> -         },
> -     'posix_user': {
> --        'stdlib': '{userbase}/lib/python{py_version_short}',
> --        'platstdlib': '{userbase}/lib/python{py_version_short}',
> -+        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
> -+        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}'=
,
> -         'purelib': '{userbase}/lib/python{py_version_short}/site-packag=
es',
> --        'platlib': '{userbase}/lib/python{py_version_short}/site-packag=
es',
> -+        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/sit=
e-packages',
> -         'include': '{userbase}/include/python{py_version_short}',
> -         'scripts': '{userbase}/bin',
> -         'data'   : '{userbase}',
> -Index: Python-2.7.14/Lib/test/test_dl.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/test/test_dl.py
> -+++ Python-2.7.14/Lib/test/test_dl.py
> -@@ -4,10 +4,11 @@
> - import unittest
> - from test.test_support import verbose, import_module
> - dl =3D import_module('dl', deprecated=3DTrue)
> -+import sys
> -
> - sharedlibs =3D [
> --    ('/usr/lib/libc.so', 'getpid'),
> --    ('/lib/libc.so.6', 'getpid'),
> -+    ('/usr/'+sys.lib+'/libc.so', 'getpid'),
> -+    ('/'+sys.lib+'/libc.so.6', 'getpid'),
> -     ('/usr/bin/cygwin1.dll', 'getpid'),
> -     ('/usr/lib/libc.dylib', 'getpid'),
> -     ]
> -Index: Python-2.7.14/Lib/test/test_site.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/test/test_site.py
> -+++ Python-2.7.14/Lib/test/test_site.py
> -@@ -252,12 +252,16 @@ class HelperFunctionsTests(unittest.Test
> -             self.assertEqual(dirs[0], wanted)
> -         elif os.sep =3D=3D '/':
> -             # OS X, Linux, FreeBSD, etc
> --            self.assertEqual(len(dirs), 2)
> -             wanted =3D os.path.join('xoxo', 'lib', 'python' + sys.versi=
on[:3],
> -                                   'site-packages')
> --            self.assertEqual(dirs[0], wanted)
> -+            self.assertTrue(wanted in dirs)
> -             wanted =3D os.path.join('xoxo', 'lib', 'site-python')
> --            self.assertEqual(dirs[1], wanted)
> -+            self.assertTrue(wanted in dirs)
> -+            wanted =3D os.path.join('xoxo', sys.lib, 'python' + sys.ver=
sion[:3],
> -+                                  'site-packages')
> -+            self.assertTrue(wanted in dirs)
> -+            wanted =3D os.path.join('xoxo', sys.lib, 'site-python')
> -+            self.assertTrue(wanted in dirs)
> -         else:
> -             # other platforms
> -             self.assertEqual(len(dirs), 2)
> -Index: Python-2.7.14/Lib/trace.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Lib/trace.py
> -+++ Python-2.7.14/Lib/trace.py
> -@@ -754,10 +754,10 @@ def main(argv=3DNone):
> -                 # should I also call expanduser? (after all, could use =
$HOME)
> -
> -                 s =3D s.replace("$prefix",
> --                              os.path.join(sys.prefix, "lib",
> -+                              os.path.join(sys.prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s =3D s.replace("$exec_prefix",
> --                              os.path.join(sys.exec_prefix, "lib",
> -+                              os.path.join(sys.exec_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s =3D os.path.normpath(s)
> -                 ignore_dirs.append(s)
> -Index: Python-2.7.14/Makefile.pre.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Makefile.pre.in
> -+++ Python-2.7.14/Makefile.pre.in
> -@@ -91,6 +91,7 @@ PY_CFLAGS=3D   $(CFLAGS) $(CPPFLAGS) $(CFLAG
> -
> - # Machine-dependent subdirectories
> - MACHDEP=3D      @MACHDEP@
> -+LIB=3D          @LIB@
> -
> - # Multiarch directory (may be empty)
> - MULTIARCH=3D    @MULTIARCH@
> -@@ -110,7 +111,7 @@ LIBDIR=3D            @libdir@
> - MANDIR=3D               @mandir@
> - INCLUDEDIR=3D   @includedir@
> - CONFINCLUDEDIR=3D       $(exec_prefix)/include
> --SCRIPTDIR=3D    $(prefix)/lib
> -+SCRIPTDIR=3D    $(prefix)/@LIB@
> -
> - # Detailed destination directories
> - BINLIBDEST=3D   $(LIBDIR)/python$(VERSION)
> -@@ -645,6 +646,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
> -               -DEXEC_PREFIX=3D'"$(exec_prefix)"' \
> -               -DVERSION=3D'"$(VERSION)"' \
> -               -DVPATH=3D'"$(VPATH)"' \
> -+              -DLIB=3D'"$(LIB)"' \
> -               -o $@ $(srcdir)/Modules/getpath.c
> -
> - Modules/python.o: $(srcdir)/Modules/python.c
> -@@ -693,7 +695,7 @@ regen-ast:
> - Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/gram=
init.h $(srcdir)/Include/Python-ast.h
> -
> - Python/getplatform.o: $(srcdir)/Python/getplatform.c
> --              $(CC) -c $(PY_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' -o $@ $=
(srcdir)/Python/getplatform.c
> -+              $(CC) -c $(PY_CFLAGS) -DPLATFORM=3D'"$(MACHDEP)"' -DLIB=
=3D'"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
> -
> - Python/importdl.o: $(srcdir)/Python/importdl.c
> -               $(CC) -c $(PY_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Pyth=
on/importdl.c
> -Index: Python-2.7.14/Modules/getpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Modules/getpath.c
> -+++ Python-2.7.14/Modules/getpath.c
> -@@ -100,6 +100,13 @@
> - #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant define=
d"
> - #endif
> -
> -+#define LIB_PYTHON LIB "/python" VERSION
> -+
> -+#ifndef PYTHONPATH
> -+#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
> -+              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
> -+#endif
> -+
> - #ifndef LANDMARK
> - #define LANDMARK "os.py"
> - #endif
> -@@ -108,7 +115,7 @@ static char prefix[MAXPATHLEN+1];
> - static char exec_prefix[MAXPATHLEN+1];
> - static char progpath[MAXPATHLEN+1];
> - static char *module_search_path =3D NULL;
> --static char lib_python[] =3D "lib/python" VERSION;
> -+static char lib_python[] =3D LIB_PYTHON;
> -
> - static void
> - reduce(char *dir)
> -Index: Python-2.7.14/Python/getplatform.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Python/getplatform.c
> -+++ Python-2.7.14/Python/getplatform.c
> -@@ -10,3 +10,13 @@ Py_GetPlatform(void)
> - {
> -       return PLATFORM;
> - }
> -+
> -+#ifndef LIB
> -+#define LIB "lib"
> -+#endif
> -+
> -+const char *
> -+Py_GetLib(void)
> -+{
> -+      return LIB;
> -+}
> -Index: Python-2.7.14/Python/sysmodule.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.14.orig/Python/sysmodule.c
> -+++ Python-2.7.14/Python/sysmodule.c
> -@@ -1437,6 +1437,8 @@ _PySys_Init(void)
> -                         PyString_FromString(Py_GetCopyright()));
> -     SET_SYS_FROM_STRING("platform",
> -                         PyString_FromString(Py_GetPlatform()));
> -+    SET_SYS_FROM_STRING("lib",
> -+                        PyString_FromString(Py_GetLib()));
> -     SET_SYS_FROM_STRING("executable",
> -                         PyString_FromString(Py_GetProgramFullPath()));
> -     SET_SYS_FROM_STRING("prefix",
> diff --git a/meta/recipes-devtools/python/python/parallel-makeinst-create=
-bindir.patch b/meta/recipes-devtools/python/python/parallel-makeinst-creat=
e-bindir.patch
> deleted file mode 100644
> index abab41e9577..00000000000
> --- a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir=
.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -When using make -j with the 'install' target, it's possible for altbinin=
stall
> -(which normally creates BINDIR) and libainstall (which doesn't, though i=
t
> -installs python-config there) to race, resulting in a failure due to
> -attempting to install python-config into a nonexistent BINDIR. Ensure it=
 also
> -exists in the libainstall target.
> -
> -Upstream-Status: Pending
> -
> ---- Python-2.7.3.orig/Makefile.pre.in
> -+++ Python-2.7.3/Makefile.pre.in
> -@@ -1187,7 +1187,7 @@
> - LIBPC=3D                $(LIBDIR)/pkgconfig
> -
> - libainstall:  @DEF_MAKE_RULE@ python-config
> --      @for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); \
> -+      @for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC) $(BINDIR); \
> -       do \
> -               if test ! -d $(DESTDIR)$$i; then \
> -                       echo "Creating directory $$i"; \
> diff --git a/meta/recipes-devtools/python/python/pass-missing-libraries-t=
o-Extension-for-mul.patch b/meta/recipes-devtools/python/python/pass-missin=
g-libraries-to-Extension-for-mul.patch
> deleted file mode 100644
> index 44fcaacf307..00000000000
> --- a/meta/recipes-devtools/python/python/pass-missing-libraries-to-Exten=
sion-for-mul.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From 71447f04979b267f8866573b67a4340b2719d799 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 4 Aug 2017 14:10:43 +0800
> -Subject: [PATCH] setup.py: pass missing libraries to Extension for multi=
processing module
> -
> -In the following commit:
> -...
> -commit e711cafab13efc9c1fe6c5cd75826401445eb585
> -Author: Benjamin Peterson <benjamin@python.org>
> -Date:   Wed Jun 11 16:44:04 2008 +0000
> -
> -    Merged revisions 64104,64117 via svnmerge from
> -    svn+ssh://pythondev@svn.python.org/python/trunk
> -...
> -(see diff in setup.py)
> -It assigned libraries for multiprocessing module according
> -the host_platform, but not pass it to Extension.
> -
> -In glibc, the following commit caused two definition of
> -sem_getvalue are different.
> -https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D042e1521c794a94=
5edc43b5bfa7e69ad70420524
> -(see diff in nptl/sem_getvalue.c for detail)
> -`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
> -and `__old_sem_getvalue' is to compat the old version
> -sem_getvalue@GLIBC_2.0.
> -
> -To build python for embedded Linux systems:
> -http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs=
.html
> -If not explicitly link to library pthread (-lpthread), it will
> -load glibc's sem_getvalue randomly at runtime.
> -
> -Such as build python on linux x86_64 host and run the python
> -on linux x86_32 target. If not link library pthread, it caused
> -multiprocessing bounded semaphore could not work correctly.
> -...
> ->>> import multiprocessing
> ->>> pool_sema =3D multiprocessing.BoundedSemaphore(value=3D1)
> ->>> pool_sema.acquire()
> -True
> ->>> pool_sema.release()
> -Traceback (most recent call last):
> -  File "<stdin>", line 1, in <module>
> -ValueError: semaphore or lock released too many times
> -...
> -
> -And the semaphore issue also caused multiprocessing.Queue().put() hung.
> -
> -Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - setup.py | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 54054c2..9646bfc 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -1586,8 +1586,10 @@ class PyBuildExt(build_ext):
> -         elif host_platform.startswith('netbsd'):
> -             macros =3D dict()
> -             libraries =3D []
> --
> --        else:                                   # Linux and other unice=
s
> -+        elif host_platform.startswith(('linux')):
> -+            macros =3D dict()
> -+            libraries =3D ['pthread']
> -+        else:                                   # Other unices
> -             macros =3D dict()
> -             libraries =3D ['rt']
> -
> -@@ -1610,6 +1612,7 @@ class PyBuildExt(build_ext):
> -         if sysconfig.get_config_var('WITH_THREAD'):
> -             exts.append ( Extension('_multiprocessing', multiprocessing=
_srcs,
> -                                     define_macros=3Dmacros.items(),
> -+                                    libraries=3Dlibraries,
> -                                     include_dirs=3D["Modules/_multiproc=
essing"]))
> -         else:
> -             missing.append('_multiprocessing')
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb=
-rpath.patch b/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb=
-rpath.patch
> deleted file mode 100644
> index 216be0a448a..00000000000
> --- a/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.=
patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Remove the RPATH to avoid QA issue warning.
> -
> -RP: Added secondary unnecessary rpath to the list 2012/8/7
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> -
> -
> -Index: Python-2.7.3/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.3.orig/setup.py 2012-08-07 10:41:58.560132529 +0000
> -+++ Python-2.7.3/setup.py      2012-08-07 11:09:47.852094515 +0000
> -@@ -1042,7 +1042,6 @@
> -             exts.append(Extension('_bsddb', ['_bsddb.c'],
> -                                   depends =3D ['bsddb.h'],
> -                                   library_dirs=3Ddblib_dir,
> --                                  runtime_library_dirs=3Ddblib_dir,
> -                                   include_dirs=3Ddb_incs,
> -                                   libraries=3Ddblibs))
> -         else:
> -@@ -1252,7 +1251,6 @@
> -                         print "building dbm using bdb"
> -                         dbmext =3D Extension('dbm', ['dbmmodule.c'],
> -                                            library_dirs=3Ddblib_dir,
> --                                           runtime_library_dirs=3Ddblib=
_dir,
> -                                            include_dirs=3Ddb_incs,
> -                                            define_macros=3D[
> -                                                ('HAVE_BERKDB_H', None),
> diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/=
meta/recipes-devtools/python/python/python2-manifest.json
> deleted file mode 100644
> index eb52e862ab3..00000000000
> --- a/meta/recipes-devtools/python/python/python2-manifest.json
> +++ /dev/null
> @@ -1,1138 +0,0 @@
> -# DO NOT (entirely) modify this file manually, please read.
> -#
> -# IMPORTANT NOTE:
> -# Please keep in mind that the create_manifest task relies on the fact t=
he the
> -# target and native Python packages are the same, and it also needs to b=
e executed
> -# with a fully working native package (with all the PACKAGECONFIGs enabl=
ed and all
> -# and all the modules should be working, check log.do_compile), otherwis=
e the script
> -# will fail to find dependencies correctly, this note is valid either if=
 you are
> -# upgrading to a new Python version or adding a new package.
> -#
> -#
> -# If you are adding a new package please follow the next steps:
> -#     How to add a new package:
> -#     - If a user wants to add a new package all that has to be done is:
> -#     Modify the python2-manifest.json file, and add the required file(s=
) to the FILES list,
> -#     fill up the SUMMARY section as well, the script should handle all =
the rest.
> -#
> -#     Real example:
> -#     We want to add a web browser package, including the file webbrowse=
r.py
> -#     which at the moment is on python-misc.
> -#     "webbrowser": {
> -#         "files": ["${libdir}/python2.7/lib-dynload/webbrowser.py"],
> -#         "rdepends": [],
> -#         "summary": "Python Web Browser support"}
> -#
> -#     * Note that the rdepends field was left empty
> -#
> -#     We run $ bitbake python -c create_manifest and the resulting manif=
est
> -#     should be completed after a few seconds, showing something like:
> -#     "webbrowser": {
> -#         "files": ["${libdir}/python2.7/webbrowser.py"],
> -#         "rdepends": ["core","fcntl","io","pickle","shell","subprocess"=
],
> -#         "summary": "Python Web Browser support"}
> -#
> -#
> -# If you are upgrading Python to a new version please follow the next st=
eps:
> -#     After each Python upgrade, the create_manifest task should be exec=
uted, because we
> -#     don't control what changes on upstream Python, so, some module dep=
endency
> -#     might have changed without us realizing it, a certain module can e=
ither have
> -#     more or less dependencies, or could be depending on a new file tha=
t was just
> -#     created on the new release and for obvious reasons we wouldn't hav=
e it on our
> -#     old manifest, all of these issues would cause runtime errors on ou=
r system.
> -#
> -#     - Upgrade both the native and target Python packages to a new vers=
ion
> -#     - Run the create_manifest task for the target Python package as it=
s shown below:
> -#
> -#     $ bitbake python -c create_manifest
> -#
> -#     This will automatically replace your manifest file located under t=
he Python directory
> -#     with an new one, which contains the new dependencies (if any).
> -#
> -#     Several things could have gone wrong here, I will try to explain a=
 few:
> -#
> -#     a) A new file was introduced on this release, e.g. sha3*.so:
> -#        The task will check what its needed to import every module, mor=
e than one module would
> -#        would probably depend on sha3*.so, although only one module sho=
uld contain it.
> -#
> -#        After running the task, the new manifest will have the sha3*.so=
 file on more than one
> -#        module, you need to manually decide which one of them should ge=
t it and delete it from
> -#        the others, for example sha3*.so should likely be on ${PN}-cryp=
t.
> -#        Once you have deleted from the others you need to run the creat=
e_manifest task again,
> -#        this will populate the other module's rdepends fields, with ${P=
N}-crypt and you should be
> -#        good to go.
> -#
> -#     b) The native package wasn't built correctly and its missing a cer=
tain module:
> -#        As mentioned before, you need to make sure the native package w=
as built with all the modules
> -#        because it is used as base to build the manifest file, you need=
 to manually check log.do_compile
> -#        since it won't error out the compile function if its only missi=
ng a couple of modules.
> -#
> -#        e.g. missing the _uuid module, log.do_compile would show the fo=
llowing:
> -#        Python build finished successfully!
> -#        The necessary bits to build these optional modules were not fou=
nd:
> -#        _uuid
> -#
> -#        What will happen here is that the new manifest would not be awa=
re that the _uuid module exists, so
> -#        not only we won't know of any dependencies to it, but also, the=
 _uuid* files will be packaged on
> -#        the misc package (which is where any file that doesn't belong a=
nywhere else ends up).
> -#
> -#        This will eventually cause runtime errors on our system if we d=
on't include the misc package on
> -#        on our image, because the _uuid files will be missing.
> -#        If we build the _uuid module correctly and run the create_manif=
est task the _uuid files will be
> -#        detected correctly along with its dependencies, and we will get=
 a working manifest.
> -#
> -#        This is the reason why it is important to make sure we have a f=
ully working native build,
> -#        so we can avoid these errors.
> -#
> -#
> -#
> -# DO NOT MODIFY THE NEXT LINE!, IT IS USED AS A MARKER FOR THE ACTUAL JS=
ON MANIFEST
> -# EOC
> -{
> -    "tests": {
> -        "summary": "Python test suite",
> -        "rdepends": [
> -            "core",
> -            "modules"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/*/test",
> -            "${libdir}/python2.7/*/tests",
> -            "${libdir}/python2.7/idlelib/idle_test/",
> -            "${libdir}/python2.7/test"
> -        ],
> -        "cached": []
> -    },
> -    "2to3": {
> -        "summary": "Python automated Python 2 to 3 code translator",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${bindir}/2to3*",
> -            "${libdir}/python2.7/lib2to3"
> -        ]
> -    },
> -    "argparse": {
> -        "summary": "Python command line argument parser",
> -        "rdepends": [
> -            "codecs",
> -            "core",
> -            "lang",
> -            "textutils"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/argparse.py"
> -        ]
> -    },
> -    "audio": {
> -        "summary": "Python Audio Handling",
> -        "rdepends": [
> -            "core",
> -            "crypt",
> -            "fcntl",
> -            "io",
> -            "math"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/audiodev.py",
> -            "${libdir}/python2.7/chunk.py",
> -            "${libdir}/python2.7/lib-dynload/audioop.so",
> -            "${libdir}/python2.7/lib-dynload/ossaudiodev.so",
> -            "${libdir}/python2.7/sndhdr.py",
> -            "${libdir}/python2.7/sunau.py",
> -            "${libdir}/python2.7/sunaudio.py",
> -            "${libdir}/python2.7/toaiff.py",
> -            "${libdir}/python2.7/wave.py"
> -        ]
> -    },
> -    "bsddb": {
> -        "summary": "Python bindings for the Berkeley Database",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/bsddb",
> -            "${libdir}/python2.7/lib-dynload/_bsddb.so"
> -        ]
> -    },
> -    "codecs": {
> -        "summary": "Python codec",
> -        "rdepends": [
> -            "core",
> -            "io",
> -            "lang"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/gettext.py",
> -            "${libdir}/python2.7/lib-dynload/_codecs_cn.so",
> -            "${libdir}/python2.7/lib-dynload/_codecs_hk.so",
> -            "${libdir}/python2.7/lib-dynload/_codecs_iso2022.so",
> -            "${libdir}/python2.7/lib-dynload/_codecs_jp.so",
> -            "${libdir}/python2.7/lib-dynload/_codecs_kr.so",
> -            "${libdir}/python2.7/lib-dynload/_codecs_tw.so",
> -            "${libdir}/python2.7/lib-dynload/_multibytecodec.so",
> -            "${libdir}/python2.7/lib-dynload/unicodedata.so",
> -            "${libdir}/python2.7/locale.py",
> -            "${libdir}/python2.7/stringprep.py",
> -            "${libdir}/python2.7/xdrlib.py"
> -        ]
> -    },
> -    "compile": {
> -        "summary": "Python bytecode compilation support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/compileall.py",
> -            "${libdir}/python2.7/py_compile.py"
> -        ]
> -    },
> -    "compiler": {
> -        "summary": "Python compiler support",
> -        "rdepends": [
> -            "core",
> -            "io",
> -            "lang"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/compiler"
> -        ]
> -    },
> -    "compression": {
> -        "summary": "Python high-level compression support",
> -        "rdepends": [
> -            "core",
> -            "io",
> -            "shell",
> -            "unixadmin",
> -            "zlib"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/gzip.py",
> -            "${libdir}/python2.7/lib-dynload/bz2.so",
> -            "${libdir}/python2.7/tarfile.py",
> -            "${libdir}/python2.7/zipfile.py"
> -        ]
> -    },
> -    "contextlib": {
> -        "summary": "Python utilities for with-statementcontexts.",
> -        "rdepends": [
> -            "core",
> -            "lang"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/contextlib.py"
> -        ]
> -    },
> -    "core": {
> -        "summary": "Python interpreter and core modules",
> -        "rdepends": [],
> -        "files": [
> -            "${bindir}/python*",
> -            "${includedir}/python2.7/pyconfig*.h",
> -            "${libdir}/python2.7/ConfigParser.py",
> -            "${libdir}/python2.7/UserDict.py",
> -            "${libdir}/python2.7/UserList.py",
> -            "${libdir}/python2.7/UserString.py",
> -            "${libdir}/python2.7/__future__.py",
> -            "${libdir}/python2.7/_abcoll.py",
> -            "${libdir}/python2.7/_sysconfigdata.py",
> -            "${libdir}/python2.7/_weakrefset.py",
> -            "${libdir}/python2.7/abc.py",
> -            "${libdir}/python2.7/ast.py",
> -            "${libdir}/python2.7/atexit.py",
> -            "${libdir}/python2.7/codecs.py",
> -            "${libdir}/python2.7/collections.py",
> -            "${libdir}/python2.7/copy.py",
> -            "${libdir}/python2.7/copy_reg.py",
> -            "${libdir}/python2.7/encodings",
> -            "${libdir}/python2.7/encodings/aliases.py",
> -            "${libdir}/python2.7/encodings/utf_8.py",
> -            "${libdir}/python2.7/genericpath.py",
> -            "${libdir}/python2.7/getopt.py",
> -            "${libdir}/python2.7/heapq.py",
> -            "${libdir}/python2.7/importlib",
> -            "${libdir}/python2.7/keyword.py",
> -            "${libdir}/python2.7/lib-dynload/_collections.so",
> -            "${libdir}/python2.7/lib-dynload/_heapq.so",
> -            "${libdir}/python2.7/lib-dynload/_locale.so",
> -            "${libdir}/python2.7/lib-dynload/_struct.so",
> -            "${libdir}/python2.7/lib-dynload/binascii.so",
> -            "${libdir}/python2.7/lib-dynload/itertools.so",
> -            "${libdir}/python2.7/lib-dynload/operator.so",
> -            "${libdir}/python2.7/lib-dynload/readline.so",
> -            "${libdir}/python2.7/lib-dynload/strop.so",
> -            "${libdir}/python2.7/lib-dynload/time.so",
> -            "${libdir}/python2.7/lib-dynload/xreadlines.so",
> -            "${libdir}/python2.7/linecache.py",
> -            "${libdir}/python2.7/new.py",
> -            "${libdir}/python2.7/os.py",
> -            "${libdir}/python2.7/platform.py",
> -            "${libdir}/python2.7/posixpath.py",
> -            "${libdir}/python2.7/re.py",
> -            "${libdir}/python2.7/rlcompleter.py",
> -            "${libdir}/python2.7/site.py",
> -            "${libdir}/python2.7/sitecustomize.py",
> -            "${libdir}/python2.7/sre_compile.py",
> -            "${libdir}/python2.7/sre_constants.py",
> -            "${libdir}/python2.7/sre_parse.py",
> -            "${libdir}/python2.7/stat.py",
> -            "${libdir}/python2.7/string.py",
> -            "${libdir}/python2.7/struct.py",
> -            "${libdir}/python2.7/sysconfig.py",
> -            "${libdir}/python2.7/traceback.py",
> -            "${libdir}/python2.7/types.py",
> -            "${libdir}/python2.7/warnings.py",
> -            "${libdir}/python2.7/weakref.py"
> -        ]
> -    },
> -    "crypt": {
> -        "summary": "Python basic cryptographic and hashing support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/hashlib.py",
> -            "${libdir}/python2.7/lib-dynload/_hashlib.so",
> -            "${libdir}/python2.7/lib-dynload/crypt.so",
> -            "${libdir}/python2.7/md5.py",
> -            "${libdir}/python2.7/sha.py"
> -        ]
> -    },
> -    "ctypes": {
> -        "summary": "Python C types support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/ctypes",
> -            "${libdir}/python2.7/lib-dynload/_ctypes.so",
> -            "${libdir}/python2.7/lib-dynload/_ctypes_test.so"
> -        ]
> -    },
> -    "curses": {
> -        "summary": "Python curses support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/curses",
> -            "${libdir}/python2.7/lib-dynload/_curses.so",
> -            "${libdir}/python2.7/lib-dynload/_curses_panel.so"
> -        ]
> -    },
> -    "datetime": {
> -        "summary": "Python calendar and time support",
> -        "rdepends": [
> -            "codecs",
> -            "core",
> -            "lang"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/_strptime.py",
> -            "${libdir}/python2.7/calendar.py",
> -            "${libdir}/python2.7/lib-dynload/datetime.so"
> -        ]
> -    },
> -    "db": {
> -        "summary": "Python file-based database support",
> -        "rdepends": [
> -            "bsddb",
> -            "core",
> -            "gdbm"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/anydbm.py",
> -            "${libdir}/python2.7/dbhash.py",
> -            "${libdir}/python2.7/dumbdbm.py",
> -            "${libdir}/python2.7/lib-dynload/dbm.so",
> -            "${libdir}/python2.7/whichdb.py"
> -        ]
> -    },
> -    "debugger": {
> -        "summary": "Python debugger",
> -        "rdepends": [
> -            "core",
> -            "io",
> -            "lang",
> -            "pprint",
> -            "shell"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/bdb.py",
> -            "${libdir}/python2.7/pdb.py"
> -        ]
> -    },
> -    "dev": {
> -        "files": [
> -            "${base_libdir}/*.a",
> -            "${base_libdir}/*.o",
> -            "${datadir}/aclocal",
> -            "${datadir}/pkgconfig",
> -            "${includedir}",
> -            "${libdir}/*.a",
> -            "${libdir}/*.la",
> -            "${libdir}/*.o",
> -            "${libdir}/lib*${SOLIBSDEV}",
> -            "${libdir}/pkgconfig",
> -            "${libdir}/python2.7/config/Makefile"
> -        ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python development package"
> -    },
> -    "difflib": {
> -        "summary": "Python helpers for computing deltas between objects"=
,
> -        "rdepends": [
> -            "core",
> -            "lang"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/difflib.py"
> -        ]
> -    },
> -    "distutils-staticdev": {
> -        "files": [
> -            "${libdir}/python2.7/config/lib*.a"
> -        ],
> -        "rdepends": [
> -            "distutils"
> -        ],
> -        "summary": "Python distribution utilities (static libraries)"
> -    },
> -    "distutils": {
> -        "summary": "Python Distribution Utilities",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/config",
> -            "${libdir}/python2.7/distutils"
> -        ]
> -    },
> -    "doctest": {
> -        "summary": "Python framework for running examples in docstrings"=
,
> -        "rdepends": [
> -            "core",
> -            "crypt",
> -            "debugger",
> -            "difflib",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "pprint",
> -            "shell",
> -            "unittest"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/doctest.py"
> -        ]
> -    },
> -    "email": {
> -        "summary": "Python email support",
> -        "rdepends": [
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "netclient",
> -            "pickle",
> -            "subprocess",
> -            "textutils",
> -            "threading"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/email",
> -            "${libdir}/python2.7/imaplib.py"
> -        ]
> -    },
> -    "fcntl": {
> -        "summary": "Python's fcntl interface",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/fcntl.so"
> -        ]
> -    },
> -    "gdbm": {
> -        "summary": "Python GNU database support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/gdbm.so"
> -        ]
> -    },
> -    "hotshot": {
> -        "summary": "Python hotshot performance profiler",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/hotshot",
> -            "${libdir}/python2.7/lib-dynload/_hotshot.so"
> -        ]
> -    },
> -    "html": {
> -        "summary": "Python HTML processing support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/HTMLParser.py",
> -            "${libdir}/python2.7/formatter.py",
> -            "${libdir}/python2.7/htmlentitydefs.py",
> -            "${libdir}/python2.7/htmllib.py",
> -            "${libdir}/python2.7/markupbase.py",
> -            "${libdir}/python2.7/sgmllib.py"
> -        ]
> -    },
> -    "idle": {
> -        "summary": "Python Integrated Development Environment",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${bindir}/idle",
> -            "${libdir}/python2.7/idlelib"
> -        ]
> -    },
> -    "image": {
> -        "summary": "Python graphical image handling",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/colorsys.py",
> -            "${libdir}/python2.7/imghdr.py"
> -        ]
> -    },
> -    "io": {
> -        "summary": "Python low-level I/O",
> -        "rdepends": [
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "fcntl",
> -            "lang",
> -            "math",
> -            "netclient",
> -            "textutils"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/StringIO.py",
> -            "${libdir}/python2.7/_pyio.py",
> -            "${libdir}/python2.7/io.py",
> -            "${libdir}/python2.7/lib-dynload/_io.so",
> -            "${libdir}/python2.7/lib-dynload/_socket.so",
> -            "${libdir}/python2.7/lib-dynload/_ssl.so",
> -            "${libdir}/python2.7/lib-dynload/cStringIO.so",
> -            "${libdir}/python2.7/lib-dynload/select.so",
> -            "${libdir}/python2.7/lib-dynload/termios.so",
> -            "${libdir}/python2.7/pipes.py",
> -            "${libdir}/python2.7/socket.py",
> -            "${libdir}/python2.7/ssl.py",
> -            "${libdir}/python2.7/tempfile.py"
> -        ]
> -    },
> -    "json": {
> -        "summary": "Python JSON support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/json",
> -            "${libdir}/python2.7/lib-dynload/_json.so"
> -        ]
> -    },
> -    "lang": {
> -        "summary": "Python low-level language support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/bisect.py",
> -            "${libdir}/python2.7/code.py",
> -            "${libdir}/python2.7/codeop.py",
> -            "${libdir}/python2.7/dis.py",
> -            "${libdir}/python2.7/functools.py",
> -            "${libdir}/python2.7/inspect.py",
> -            "${libdir}/python2.7/lib-dynload/_bisect.so",
> -            "${libdir}/python2.7/lib-dynload/_functools.so",
> -            "${libdir}/python2.7/lib-dynload/array.so",
> -            "${libdir}/python2.7/lib-dynload/parser.so",
> -            "${libdir}/python2.7/opcode.py",
> -            "${libdir}/python2.7/repr.py",
> -            "${libdir}/python2.7/symbol.py",
> -            "${libdir}/python2.7/token.py",
> -            "${libdir}/python2.7/tokenize.py"
> -        ]
> -    },
> -    "logging": {
> -        "summary": "Python logging support",
> -        "rdepends": [
> -            "core",
> -            "io",
> -            "threading"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/logging"
> -        ]
> -    },
> -    "mailbox": {
> -        "summary": "Python mailbox format support",
> -        "rdepends": [
> -            "codecs",
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "datetime",
> -            "email",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "mime",
> -            "netclient",
> -            "textutils"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/mailbox.py"
> -        ]
> -    },
> -    "math": {
> -        "summary": "Python math support",
> -        "rdepends": [
> -            "core",
> -            "crypt"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/_random.so",
> -            "${libdir}/python2.7/lib-dynload/cmath.so",
> -            "${libdir}/python2.7/lib-dynload/math.so",
> -            "${libdir}/python2.7/random.py",
> -            "${libdir}/python2.7/sets.py"
> -        ]
> -    },
> -    "mime": {
> -        "summary": "Python MIME handling APIs",
> -        "rdepends": [
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "netclient",
> -            "textutils"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/MimeWriter.py",
> -            "${libdir}/python2.7/mimetools.py",
> -            "${libdir}/python2.7/mimetypes.py",
> -            "${libdir}/python2.7/quopri.py",
> -            "${libdir}/python2.7/rfc822.py",
> -            "${libdir}/python2.7/uu.py"
> -        ]
> -    },
> -    "mmap": {
> -        "summary": "Python memory-mapped file support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/mmap.so"
> -        ]
> -    },
> -    "modules": {
> -        "files": [],
> -        "rdepends": [
> -            "2to3",
> -            "argparse",
> -            "audio",
> -            "bsddb",
> -            "codecs",
> -            "compile",
> -            "compiler",
> -            "compression",
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "ctypes",
> -            "curses",
> -            "datetime",
> -            "db",
> -            "debugger",
> -            "difflib",
> -            "distutils",
> -            "doctest",
> -            "email",
> -            "fcntl",
> -            "gdbm",
> -            "hotshot",
> -            "html",
> -            "idle",
> -            "image",
> -            "io",
> -            "json",
> -            "lang",
> -            "logging",
> -            "mailbox",
> -            "math",
> -            "mime",
> -            "mmap",
> -            "multiprocessing",
> -            "netclient",
> -            "netserver",
> -            "numbers",
> -            "pickle",
> -            "pkgutil",
> -            "plistlib",
> -            "pprint",
> -            "profile",
> -            "pydoc",
> -            "re",
> -            "resource",
> -            "robotparser",
> -            "runpy",
> -            "shell",
> -            "smtpd",
> -            "sqlite3",
> -            "sqlite3",
> -            "stringold",
> -            "subprocess",
> -            "syslog",
> -            "terminal",
> -            "textutils",
> -            "threading",
> -            "tkinter",
> -            "unittest",
> -            "unixadmin",
> -            "xml",
> -            "xmlrpc",
> -            "zlib"
> -        ],
> -        "summary": "All Python modules"
> -    },
> -    "multiprocessing": {
> -        "summary": "Python multiprocessing support",
> -        "rdepends": [
> -            "core",
> -            "fcntl",
> -            "io",
> -            "pickle",
> -            "subprocess",
> -            "threading"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/_multiprocessing.so",
> -            "${libdir}/python2.7/multiprocessing"
> -        ]
> -    },
> -    "netclient": {
> -        "summary": "Python Internet Protocol clients",
> -        "rdepends": [
> -            "codecs",
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "ctypes",
> -            "datetime",
> -            "email",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "mime",
> -            "pickle",
> -            "subprocess",
> -            "textutils",
> -            "threading"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/Cookie.py",
> -            "${libdir}/python2.7/_LWPCookieJar.py",
> -            "${libdir}/python2.7/_MozillaCookieJar.py",
> -            "${libdir}/python2.7/base64.py",
> -            "${libdir}/python2.7/cookielib.py",
> -            "${libdir}/python2.7/ftplib.py",
> -            "${libdir}/python2.7/hmac.py",
> -            "${libdir}/python2.7/httplib.py",
> -            "${libdir}/python2.7/nntplib.py",
> -            "${libdir}/python2.7/poplib.py",
> -            "${libdir}/python2.7/smtplib.py",
> -            "${libdir}/python2.7/telnetlib.py",
> -            "${libdir}/python2.7/urllib.py",
> -            "${libdir}/python2.7/urllib2.py",
> -            "${libdir}/python2.7/urlparse.py",
> -            "${libdir}/python2.7/uuid.py"
> -        ]
> -    },
> -    "netserver": {
> -        "summary": "Python Internet Protocol servers",
> -        "rdepends": [
> -            "compression",
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "mime",
> -            "netclient",
> -            "shell",
> -            "textutils",
> -            "threading",
> -            "unixadmin",
> -            "zlib"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/BaseHTTPServer.py",
> -            "${libdir}/python2.7/CGIHTTPServer.py",
> -            "${libdir}/python2.7/SimpleHTTPServer.py",
> -            "${libdir}/python2.7/SocketServer.py",
> -            "${libdir}/python2.7/cgi.py"
> -        ]
> -    },
> -    "numbers": {
> -        "summary": "Python number APIs",
> -        "rdepends": [
> -            "codecs",
> -            "core",
> -            "lang",
> -            "math",
> -            "threading"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/decimal.py",
> -            "${libdir}/python2.7/fractions.py",
> -            "${libdir}/python2.7/numbers.py"
> -        ]
> -    },
> -    "pickle": {
> -        "summary": "Python serialisation/persistence support",
> -        "rdepends": [
> -            "core",
> -            "io"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/cPickle.so",
> -            "${libdir}/python2.7/pickle.py",
> -            "${libdir}/python2.7/pickletools.py",
> -            "${libdir}/python2.7/shelve.py"
> -        ]
> -    },
> -    "pkgutil": {
> -        "summary": "Python package extension utility support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/pkgutil.py"
> -        ]
> -    },
> -    "plistlib": {
> -        "summary": "Generate and parse Mac OS X .plist files",
> -        "rdepends": [
> -            "core",
> -            "datetime",
> -            "io"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/plistlib.py"
> -        ]
> -    },
> -    "pprint": {
> -        "summary": "Python pretty-print support",
> -        "rdepends": [
> -            "core",
> -            "io"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/pprint.py"
> -        ]
> -    },
> -    "profile": {
> -        "summary": "Python basic performance profiling support",
> -        "rdepends": [
> -            "codecs",
> -            "core",
> -            "lang",
> -            "resource",
> -            "textutils"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/cProfile.py",
> -            "${libdir}/python2.7/lib-dynload/_lsprof.so",
> -            "${libdir}/python2.7/profile.py",
> -            "${libdir}/python2.7/pstats.py"
> -        ]
> -    },
> -    "pydoc": {
> -        "summary": "Python interactive help support",
> -        "rdepends": [
> -            "codecs",
> -            "core",
> -            "lang",
> -            "pkgutil"
> -        ],
> -        "files": [
> -            "${bindir}/pydoc",
> -            "${libdir}/python2.7/pydoc.py",
> -            "${libdir}/python2.7/pydoc_data"
> -        ]
> -    },
> -    "re": {
> -        "summary": "Python Regular Expression APIs",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/sre.py"
> -        ]
> -    },
> -    "resource": {
> -        "summary": "Python resource control interface",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/resource.so"
> -        ]
> -    },
> -    "robotparser": {
> -        "summary": "Python robots.txt parser",
> -        "rdepends": [
> -            "contextlib",
> -            "core",
> -            "io",
> -            "lang",
> -            "netclient",
> -            "textutils"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/robotparser.py"
> -        ]
> -    },
> -    "runpy": {
> -        "summary": "Python helper for locating/executing scripts in modu=
le namespace",
> -        "rdepends": [
> -            "core",
> -            "pkgutil"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/runpy.py"
> -        ]
> -    },
> -    "shell": {
> -        "summary": "Python shell-like functionality",
> -        "rdepends": [
> -            "compression",
> -            "core",
> -            "io",
> -            "unixadmin",
> -            "zlib"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/cmd.py",
> -            "${libdir}/python2.7/commands.py",
> -            "${libdir}/python2.7/dircache.py",
> -            "${libdir}/python2.7/fnmatch.py",
> -            "${libdir}/python2.7/glob.py",
> -            "${libdir}/python2.7/popen2.py",
> -            "${libdir}/python2.7/shlex.py",
> -            "${libdir}/python2.7/shutil.py"
> -        ]
> -    },
> -    "smtpd": {
> -        "summary": "Python Simple Mail Transport Daemon",
> -        "rdepends": [
> -            "core",
> -            "fcntl",
> -            "io",
> -            "lang"
> -        ],
> -        "files": [
> -            "${bindir}/smtpd.py",
> -            "${libdir}/python2.7/asynchat.py",
> -            "${libdir}/python2.7/asyncore.py",
> -            "${libdir}/python2.7/smtpd.py"
> -        ]
> -    },
> -    "sqlite3": {
> -        "summary": "Python Sqlite3 database support",
> -        "rdepends": [
> -            "core",
> -            "datetime"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/_sqlite3.so",
> -            "${libdir}/python2.7/sqlite3"
> -        ]
> -    },
> -    "stringold": {
> -        "summary": "Python string APIs [deprecated]",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/stringold.py"
> -        ]
> -    },
> -    "subprocess": {
> -        "summary": "Python subprocess support",
> -        "rdepends": [
> -            "core",
> -            "fcntl",
> -            "io",
> -            "pickle",
> -            "threading"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/subprocess.py"
> -        ]
> -    },
> -    "syslog": {
> -        "summary": "Python syslog interface",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/syslog.so"
> -        ]
> -    },
> -    "terminal": {
> -        "summary": "Python terminal controlling support",
> -        "rdepends": [
> -            "core",
> -            "io"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/pty.py",
> -            "${libdir}/python2.7/tty.py"
> -        ]
> -    },
> -    "textutils": {
> -        "summary": "Python option parsin",
> -        "rdepends": [
> -            "codecs",
> -            "core",
> -            "io",
> -            "lang"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/csv.py",
> -            "${libdir}/python2.7/lib-dynload/_csv.so",
> -            "${libdir}/python2.7/optparse.py",
> -            "${libdir}/python2.7/textwrap.py"
> -        ]
> -    },
> -    "threading": {
> -        "summary": "Python threading & synchronization support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/Queue.py",
> -            "${libdir}/python2.7/_threading_local.py",
> -            "${libdir}/python2.7/dummy_thread.py",
> -            "${libdir}/python2.7/dummy_threading.py",
> -            "${libdir}/python2.7/mutex.py",
> -            "${libdir}/python2.7/threading.py"
> -        ]
> -    },
> -    "tkinter": {
> -        "summary": "Python Tcl/Tk bindings",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.so",
> -            "${libdir}/python2.7/lib-tk"
> -        ]
> -    },
> -    "unittest": {
> -        "summary": "Python unit testing framework",
> -        "rdepends": [
> -            "core",
> -            "difflib",
> -            "io",
> -            "lang",
> -            "pprint",
> -            "shell"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/unittest"
> -        ]
> -    },
> -    "unixadmin": {
> -        "summary": "Python Unix administration support",
> -        "rdepends": [
> -            "core",
> -            "io"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/getpass.py",
> -            "${libdir}/python2.7/lib-dynload/grp.so",
> -            "${libdir}/python2.7/lib-dynload/nis.so"
> -        ]
> -    },
> -    "xml": {
> -        "summary": "Python basic XML support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/_elementtree.so",
> -            "${libdir}/python2.7/lib-dynload/pyexpat.so",
> -            "${libdir}/python2.7/xml"
> -        ]
> -    },
> -    "xmlrpc": {
> -        "summary": "Python XML-RPC support",
> -        "rdepends": [
> -            "codecs",
> -            "compression",
> -            "contextlib",
> -            "core",
> -            "crypt",
> -            "datetime",
> -            "fcntl",
> -            "io",
> -            "lang",
> -            "math",
> -            "mime",
> -            "netclient",
> -            "netserver",
> -            "pkgutil",
> -            "pydoc",
> -            "textutils",
> -            "threading",
> -            "xml",
> -            "zlib"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/DocXMLRPCServer.py",
> -            "${libdir}/python2.7/SimpleXMLRPCServer.py",
> -            "${libdir}/python2.7/xmlrpclib.py"
> -        ]
> -    },
> -    "zlib": {
> -        "summary": "Python zlib compression support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python2.7/lib-dynload/zlib.so"
> -        ]
> -    }
> -}
> diff --git a/meta/recipes-devtools/python/python/run-ptest b/meta/recipes=
-devtools/python/python/run-ptest
> deleted file mode 100644
> index c7002a4560c..00000000000
> --- a/meta/recipes-devtools/python/python/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -python -mtest -W | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERR=
OR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok=
//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//=
g'
> diff --git a/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_=
and_avoid_warning.patch b/meta/recipes-devtools/python/python/search_db_h_i=
n_inc_dirs_and_avoid_warning.patch
> deleted file mode 100644
> index dacb552ec79..00000000000
> --- a/meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avo=
id_warning.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -python should search for db.h in inc_dirs and not in a hardcoded path.
> -If db.h is found but HASHVERSION is not 2 we avoid a warning by not
> -adding this module to missing variable.
> -
> -Upstream-Status: Inappropriate [distribution]
> -
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -
> -diff --git a/setup.py b/setup.py
> -index b887808..ae51607 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -1237,6 +1237,8 @@ class PyBuildExt(build_ext):
> -         # the more recent berkeleydb's db.h file first in the include p=
ath
> -         # when attempting to compile and it will fail.
> -         f =3D "/usr/include/db.h"
> -+        if len(inc_dirs) !=3D 0:
> -+            f =3D os.path.join(inc_dirs[0], "db.h")
> -
> -         if host_platform =3D=3D 'darwin':
> -             if is_macosx_sdk_path(f):
> -@@ -1257,8 +1259,10 @@ class PyBuildExt(build_ext):
> -                                           libraries=3Dlibraries))
> -                 else:
> -                     exts.append(Extension('bsddb185', ['bsddbmodule.c']=
))
> --            else:
> --                missing.append('bsddb185')
> -+            # If a newer version is detected don't report an useless
> -+            # warning
> -+            #else:
> -+            #    missing.append('bsddb185')
> -         else:
> -             missing.append('bsddb185')
> -
> diff --git a/meta/recipes-devtools/python/python/setup_py_skip_cross_impo=
rt_check.patch b/meta/recipes-devtools/python/python/setup_py_skip_cross_im=
port_check.patch
> deleted file mode 100644
> index 6ccdb948b97..00000000000
> --- a/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec=
k.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -This patch skips over the 'import check' setup.py does when building
> -extensions.  This generally won't work when cross-compiling.
> -
> -Upstream-Status: Inappropriate [embedded-specific]
> -
> -Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> -
> -Index: Python-2.7.2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.2.orig/setup.py 2011-11-04 16:46:34.553796410 -0500
> -+++ Python-2.7.2/setup.py      2011-11-04 16:59:49.692802313 -0500
> -@@ -287,6 +287,15 @@
> -                           (ext.name, sys.exc_info()[1]))
> -             self.failed.append(ext.name)
> -             return
> -+
> -+        # If we're cross-compiling, we want to skip the import check
> -+        # i.e. we shouldn't be dynamically loading target shared libs
> -+        if os.environ.get('CROSS_COMPILE') is not None:
> -+            self.announce(
> -+                'WARNING: skipping import check for cross-compiled "%s"=
' %
> -+                ext.name)
> -+            return
> -+
> -         # Workaround for Mac OS X: The Carbon-based modules cannot be
> -         # reliably imported into a command-line Python
> -         if 'Carbon' in ext.extra_link_args:
> diff --git a/meta/recipes-devtools/python/python/setuptweaks.patch b/meta=
/recipes-devtools/python/python/setuptweaks.patch
> deleted file mode 100644
> index 3a91b1916c0..00000000000
> --- a/meta/recipes-devtools/python/python/setuptweaks.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -This patch removes various ways native system options can pass into the =
python
> -compilation and somehow break C modules.
> -
> -Upstream-Status: Inappropriate [OE Specific]
> -
> -RP 2012/04/23
> -
> -Index: Python-2.7.2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.2.orig/setup.py 2012-04-23 20:03:47.295582553 +0000
> -+++ Python-2.7.2/setup.py      2012-04-23 20:03:15.000000000 +0000
> -@@ -231,7 +231,13 @@
> -         # compilers
> -         if compiler is not None:
> -             (ccshared,cflags) =3D sysconfig.get_config_vars('CCSHARED',=
'CFLAGS')
> --            args['compiler_so'] =3D compiler + ' ' + ccshared + ' ' + c=
flags
> -+            # Need to filter out -isysroot from the flags. Ideally shou=
ld
> -+            # figure out target flags here.
> -+            flags =3D []
> -+            for f in cflags.split():
> -+                if not f.startswith("-isystem"):
> -+                    flags.append(f)
> -+            args['compiler_so'] =3D compiler + ' ' + ccshared + ' ' + '=
 '.join(flags)
> -         self.compiler.set_executables(**args)
> -
> -         build_ext.build_extensions(self)
> -@@ -393,7 +399,6 @@
> -         # into configure and stored in the Makefile (issue found on OS =
X 10.3).
> -         for env_var, arg_name, dir_list in (
> -                 ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
> --                ('LDFLAGS', '-L', self.compiler.library_dirs),
> -                 ('CPPFLAGS', '-I', self.compiler.include_dirs)):
> -             env_val =3D sysconfig.get_config_var(env_var)
> -             if env_val:
> -@@ -419,16 +424,16 @@
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.prefix) !=3D '/usr' \
> --                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -+#        if os.path.normpath(sys.prefix) !=3D '/usr' \
> -+#                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a f=
ramework
> -             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
> -             # building a framework with different architectures than
> -             # the one that is currently installed (issue #7473)
> --            add_dir_to_list(self.compiler.library_dirs,
> --                            sysconfig.get_config_var("LIBDIR"))
> --            add_dir_to_list(self.compiler.include_dirs,
> --                            sysconfig.get_config_var("INCLUDEDIR"))
> -+#            add_dir_to_list(self.compiler.library_dirs,
> -+#                            sysconfig.get_config_var("LIBDIR"))
> -+#            add_dir_to_list(self.compiler.include_dirs,
> -+#                            sysconfig.get_config_var("INCLUDEDIR"))
> -
> -         try:
> -             have_unicode =3D unicode
> diff --git a/meta/recipes-devtools/python/python/sitecustomize.py b/meta/=
recipes-devtools/python/python/sitecustomize.py
> deleted file mode 100644
> index 4c8b5e2ba3d..00000000000
> --- a/meta/recipes-devtools/python/python/sitecustomize.py
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <ml=
auer@vanille-media.de>
> -# GPLv2 or later
> -# Version: 20081123
> -# Features:
> -# * set proper default encoding
> -# * enable readline completion in the interactive interpreter
> -# * load command line history on startup
> -# * save command line history on exit
> -
> -import os
> -
> -def __exithandler():
> -    try:
> -        readline.write_history_file( "%s/.python-history" % os.getenv( "=
HOME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -def __registerExitHandler():
> -    import atexit
> -    atexit.register( __exithandler )
> -
> -def __enableReadlineSupport():
> -    readline.set_history_length( 1000 )
> -    readline.parse_and_bind( "tab: complete" )
> -    try:
> -        readline.read_history_file( "%s/.python-history" % os.getenv( "H=
OME", "/tmp" ) )
> -    except IOError:
> -        pass
> -
> -import sys
> -try:
> -    import rlcompleter, readline
> -except ImportError:
> -    pass
> -else:
> -    __registerExitHandler()
> -    __enableReadlineSupport()
> diff --git a/meta/recipes-devtools/python/python/support_SOURCE_DATE_EPOC=
H_in_py_compile_2.7.patch b/meta/recipes-devtools/python/python/support_SOU=
RCE_DATE_EPOCH_in_py_compile_2.7.patch
> deleted file mode 100644
> index 12651798ee6..00000000000
> --- a/meta/recipes-devtools/python/python/support_SOURCE_DATE_EPOCH_in_py=
_compile_2.7.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -The compiled .pyc files contain time stamp corresponding to the compile =
time.
> -This prevents binary reproducibility. This patch allows to achieve binar=
y
> -reproducibility by overriding the build time stamp by the value
> -exported via SOURCE_DATE_EPOCH.
> -
> -Patch by Bernhard M. Wiedemann
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> -Fri Feb 24 17:08:25 UTC 2017 - bwiedemann@suse.com
> -
> -- Add reproducible.patch to allow reproducible builds of various
> -  python packages like python-amqp
> -  Upstream: https://github.com/python/cpython/pull/296
> -
> -
> -@@ -0,0 +1,15 @@
> -Index: Python-2.7.13/Lib/py_compile.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.13.orig/Lib/py_compile.py
> -+++ Python-2.7.13/Lib/py_compile.py
> -@@ -108,6 +108,10 @@ def compile(file, cfile=3DNone, dfile=3DNone
> -             timestamp =3D long(os.fstat(f.fileno()).st_mtime)
> -         except AttributeError:
> -             timestamp =3D long(os.stat(file).st_mtime)
> -+        sde =3D os.environ.get('SOURCE_DATE_EPOCH')
> -+        if sde and timestamp > int(sde):
> -+            timestamp =3D int(sde)
> -+            os.utime(file, (timestamp, timestamp))
> -         codestring =3D f.read()
> -     try:
> -         codeobject =3D __builtin__.compile(codestring, dfile or file,'e=
xec')
> diff --git a/meta/recipes-devtools/python/python/use_sysroot_ncurses_inst=
ead_of_host.patch b/meta/recipes-devtools/python/python/use_sysroot_ncurses=
_instead_of_host.patch
> deleted file mode 100644
> index fb4a3bcf959..00000000000
> --- a/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_=
host.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Python tries to use ncursesw from the host,
> -if it is not found causes an error on configure,
> -we should use ncursesw from sysroot instead
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> -
> -Index: Python-2.7.9/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.9.orig/configure.ac
> -+++ Python-2.7.9/configure.ac
> -@@ -4311,7 +4311,7 @@ fi
> -
> - # first curses configure check
> - ac_save_cppflags=3D"$CPPFLAGS"
> --CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
> -+CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> -
> - AC_CHECK_HEADERS(curses.h ncurses.h)
> -
> diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes=
-devtools/python/python_2.7.17.bb
> deleted file mode 100644
> index be7c6d2d2bf..00000000000
> --- a/meta/recipes-devtools/python/python_2.7.17.bb
> +++ /dev/null
> @@ -1,260 +0,0 @@
> -require python.inc
> -
> -DEPENDS =3D "libffi bzip2 gdbm openssl \
> -           readline sqlite3 zlib virtual/crypt"
> -
> -DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase =3D ""
> -SRC_URI +=3D " \
> -           file://01-use-proper-tools-for-cross-build.patch \
> -           file://03-fix-tkinter-detection.patch \
> -           file://06-avoid_usr_lib_termcap_path_in_linking.patch \
> -           ${DISTRO_SRC_URI} \
> -           file://multilib.patch \
> -           file://cgi_py.patch \
> -           file://setup_py_skip_cross_import_check.patch \
> -           file://add-md5module-support.patch \
> -           file://host_include_contamination.patch \
> -           file://fix_for_using_different_libdir.patch \
> -           file://setuptweaks.patch \
> -           file://check-if-target-is-64b-not-host.patch \
> -           file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid=
_warning_about_tkinter.patch', d)} \
> -           file://avoid_warning_for_sunos_specific_module.patch \
> -           file://python-2.7.3-remove-bsdb-rpath.patch \
> -           file://run-ptest \
> -           file://parallel-makeinst-create-bindir.patch \
> -           file://use_sysroot_ncurses_instead_of_host.patch \
> -           file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> -           file://pass-missing-libraries-to-Extension-for-mul.patch \
> -           file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
> -           file://float-endian.patch \
> -           file://0001-python2-use-cc_basename-to-replace-CC-for-checkin=
g-c.patch \
> -"
> -
> -S =3D "${WORKDIR}/Python-${PV}"
> -
> -inherit autotools multilib_header python-dir pythonnative ptest
> -
> -EXTRA_OECONF +=3D "--with-system-ffi"
> -
> -CACHED_CONFIGUREVARS =3D "ac_cv_file__dev_ptmx=3Dyes \
> -                        ac_cv_file__dev_ptc=3Dno \
> -                        ac_cv_working_tzset=3Dyes"
> -
> -PACKAGECONFIG ??=3D "bdb"
> -PACKAGECONFIG[bdb] =3D ",,db"
> -PACKAGECONFIG[tk] =3D ",,tk"
> -
> -# pgen isn't needed in the current build, but use the binary from python=
-native just in case.
> -EXTRA_OEMAKE =3D "PGEN=3D${STAGING_BINDIR_NATIVE}/python-native/pgen \
> -                CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHO=
N_MAJMIN}/lib-dynload/ \
> -                STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -                STAGING_INCDIR=3D${STAGING_INCDIR} \
> -                STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> -                "
> -
> -do_configure_append() {
> -       rm -f ${S}/Makefile.orig
> -        autoreconf -Wcross --verbose --install --force --exclude=3Dautop=
oint ../Python-${PV}/Modules/_ctypes/libffi
> -}
> -
> -do_compile() {
> -        # regenerate platform specific files, because they depend on sys=
tem headers
> -        cd ${S}/Lib/plat-linux2
> -        include=3D${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python-nati=
ve/python \
> -                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
> -                ${STAGING_INCDIR}/dlfcn.h \
> -                ${STAGING_INCDIR}/linux/cdrom.h \
> -                ${STAGING_INCDIR}/netinet/in.h \
> -                ${STAGING_INCDIR}/sys/types.h
> -        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
> -        cd -
> -
> -       # remove any bogus LD_LIBRARY_PATH
> -       sed -i -e s,RUNSHARED=3D.*,RUNSHARED=3D, Makefile
> -
> -       if [ ! -f Makefile.orig ]; then
> -               install -m 0644 Makefile Makefile.orig
> -       fi
> -       sed -i -e 's#^LDFLAGS=3D.*#LDFLAGS=3D${LDFLAGS} -L. -L${STAGING_L=
IBDIR}#g' \
> -               -e 's,libdir=3D${libdir},libdir=3D${STAGING_LIBDIR},g' \
> -               -e 's,libexecdir=3D${libexecdir},libexecdir=3D${STAGING_D=
IR_HOST}${libexecdir},g' \
> -               -e 's,^LIBDIR=3D.*,LIBDIR=3D${STAGING_LIBDIR},g' \
> -               -e 's,includedir=3D${includedir},includedir=3D${STAGING_I=
NCDIR},g' \
> -               -e 's,^INCLUDEDIR=3D.*,INCLUDE=3D${STAGING_INCDIR},g' \
> -               -e 's,^CONFINCLUDEDIR=3D.*,CONFINCLUDE=3D${STAGING_INCDIR=
},g' \
> -               Makefile
> -       # save copy of it now, because if we do it in do_install and
> -       # then call do_install twice we get Makefile.orig =3D=3D Makefile=
.sysroot
> -       install -m 0644 Makefile Makefile.sysroot
> -
> -       export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> -       export PYTHONBUILDDIR=3D"${B}"
> -
> -       oe_runmake OPT=3D"${CFLAGS}"
> -}
> -
> -do_install() {
> -       # make install needs the original Makefile, or otherwise the incl=
ues would
> -       # go to ${D}${STAGING...}/...
> -       install -m 0644 Makefile.orig Makefile
> -
> -       export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> -       export PYTHONBUILDDIR=3D"${B}"
> -
> -       # After swizzling the makefile, we need to run the build again.
> -       # install can race with the build so we have to run this first, t=
hen install
> -       oe_runmake DESTDIR=3D${D} LIBDIR=3D${libdir}
> -
> -       oe_runmake DESTDIR=3D${D} LIBDIR=3D${libdir} install
> -
> -       install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MA=
JMIN}/config/Makefile
> -
> -       if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -               install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir=
}/python${PYTHON_MAJMIN}
> -       fi
> -
> -       oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> -
> -    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
> -        rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
> -    fi
> -
> -    # Python 3.x version of 2to3 is now the default
> -    mv ${D}/${bindir}/2to3 ${D}/${bindir}/2to3-${PYTHON_MAJMIN}
> -}
> -
> -do_install_append_class-nativesdk () {
> -       create_wrapper ${D}${bindir}/python2.7 PYTHONHOME=3D'${prefix}' T=
ERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/u=
sr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'
> -}
> -
> -SSTATE_SCAN_FILES +=3D "Makefile"
> -PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
> -
> -py_package_preprocess () {
> -       # copy back the old Makefile to fix target package
> -       install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTH=
ON_MAJMIN}/config/Makefile
> -
> -       # Remove references to buildmachine paths in target Makefile and =
_sysconfigdata
> -       sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-l=
ibtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
> -               -e 's|${DEBUG_PREFIX_MAP}||g' \
> -               -e 's:${HOSTTOOLS_DIR}/::g' \
> -               -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> -               -e 's:${RECIPE_SYSROOT}::g' \
> -               -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> -               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile =
\
> -               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.p=
y
> -       (cd ${PKGD}; python -m py_compile ./${libdir}/python${PYTHON_MAJM=
IN}/_sysconfigdata.py)
> -}
> -
> -PACKAGES_remove =3D "${PN}"
> -
> -# manual dependency additions
> -RPROVIDES_${PN}-modules =3D "${PN}"
> -RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " nativesdk-python-mod=
ules"
> -RRECOMMENDS_${PN}-crypt =3D "openssl"
> -
> -# package libpython2
> -PACKAGES =3D+ "lib${BPN}2"
> -FILES_lib${BPN}2 =3D "${libdir}/libpython*.so.*"
> -
> -# catch all the rest (unsorted)
> -PACKAGES +=3D "${PN}-misc"
> -FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> -RDEPENDS_${PN}-modules +=3D "${PN}-misc"
> -
> -# ptest
> -RDEPENDS_${PN}-ptest =3D "${PN}-modules ${PN}-tests unzip tzdata-europe =
coreutils sed"
> -RDEPENDS_${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk',=
 'tk tk-lib', '', d)}"
> -# catch manpage
> -PACKAGES +=3D "${PN}-man"
> -FILES_${PN}-man =3D "${datadir}/man"
> -
> -# Nasty but if bdb isn't enabled the package won't be generated
> -RDEPENDS_${PN}-modules_remove =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'bdb', '', '${PN}-bsddb', d)}"
> -
> -RDEPENDS_${PN}-dev =3D ""
> -
> -BBCLASSEXTEND =3D "nativesdk"
> -
> -# We want bytecode precompiled .py files (.pyc's) by default
> -# but the user may set it on their own conf
> -
> -INCLUDE_PYCS ?=3D "1"
> -
> -python(){
> -    import collections, json
> -
> -    filename =3D os.path.join(d.getVar('THISDIR'), 'python', 'python2-ma=
nifest.json')
> -    # This python changes the datastore based on the contents of a file,=
 so mark
> -    # that dependency.
> -    bb.parse.mark_dependency(d, filename)
> -
> -    with open(filename) as manifest_file:
> -        manifest_str =3D  manifest_file.read()
> -        json_start =3D manifest_str.find('# EOC') + 6
> -        manifest_file.seek(json_start)
> -        manifest_str =3D manifest_file.read()
> -        python_manifest =3D json.loads(manifest_str, object_pairs_hook=
=3Dcollections.OrderedDict)
> -
> -    include_pycs =3D d.getVar('INCLUDE_PYCS')
> -
> -    packages =3D d.getVar('PACKAGES').split()
> -    pn =3D d.getVar('PN')
> -
> -    newpackages=3D[]
> -
> -    for key in python_manifest:
> -        pypackage=3D pn + '-' + key
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
> -            if include_pycs =3D=3D '1':
> -                if value.endswith('.py'):
> -                    d.appendVar('FILES_' + pypackage, ' ' + value + '?')
> -
> -        for value in python_manifest[key]['rdepends']:
> -            # Make it work with or without $PN
> -            if '${PN}' in value:
> -                value=3Dvalue.split('-')[1]
> -            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> -        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary']=
)
> -
> -    # Prepending so to avoid python-misc getting everything
> -    packages =3D newpackages + packages
> -    d.setVar('PACKAGES', ' '.join(packages))
> -    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> -}
> -
> -# Files needed to create a new manifest
> -SRC_URI +=3D "file://create_manifest2.py file://get_module_deps2.py file=
://python2-manifest.json"
> -
> -do_create_manifest() {
> -    # This task should be run with every new release of Python.
> -    # We must ensure that PACKAGECONFIG enables everything when creating
> -    # a new manifest, this is to base our new manifest on a complete
> -    # native python build, containing all dependencies, otherwise the ta=
sk
> -    # wont be able to find the required files.
> -    # e.g. BerkeleyDB is an optional build dependency so it may or may n=
ot
> -    # be present, we must ensure it is.
> -
> -    cd ${WORKDIR}
> -    # This needs to be executed by python-native and NOT by HOST's pytho=
n
> -    nativepython create_manifest2.py
> -    cp python2-manifest.json.new ${THISDIR}/python/python2-manifest.json
> -}
> -
> -# bitbake python -c create_manifest
> -addtask do_create_manifest
> -
> -# Make sure we have native python ready when we create a new manifest
> -do_create_manifest[depends] +=3D "python:do_prepare_recipe_sysroot"
> -do_create_manifest[depends] +=3D "python:do_patch"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
Regards,
Andrey.

