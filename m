Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.39932.1629211931340017749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GEno81uJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.47, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f47.google.com with SMTP id q10so29090260wro.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5hAyjsiVZDrsGT09E8XXPXg9aaCpSzTG0nd6CzDAX3w=;
        b=GEno81uJDZNIehWQsmgx6J3GmXghHR75+3CrOIQwEZpDJC/KlteuSUTeJCT+EjFH3C
         eblPJ2nUnmisbgpPLMTLdZlqf1VVBUyLV4smKeXzaKzU5hEzfW+z1w9rDGPuUvvXFcVm
         50xiaYVhj2Y6ZpskjKuEAAPft32ERbsxVj4x+rpG8h/nalV+e6Cr/LIm2F+61L8YmHtM
         N6snD+oZCuFfLBnYEepee+aRntBXN/PgTJ8OkB4Edtl69mAkTL0mq3z8FkjVR3jcE5fz
         iTCTX8na8m/Rin2qGnz1WYGUswoRqPR5elw8sDelLDytnbZeJ8ACgKZzmqWpKOZQVcy+
         MdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5hAyjsiVZDrsGT09E8XXPXg9aaCpSzTG0nd6CzDAX3w=;
        b=PJbJ2Rh1HD5XYywNYlqooeNr2jMdYA20gwvKX4VwNuEWc4HkVVjnHdjqfD3A9ZnyJL
         gw9BUZZrAwznFKg0KbQKQjdnDwD0wfEgWOgv544AA2RFLHT8vcfYxDVuECjDTYv75Xsu
         VGCHTDcySssYcjB7s0z+Yc6StmIeETgFNxnxXiDP7HnGo+AzBoFku2ko9NQLClTpbsQe
         BsF07Wfq8/5nl2sNB/ci787exyEETZhkPJRihcb9CItCoDcbDWa0Lem6viXEAyyaE3yq
         FSD0Mk+KPw1Il27DYJHT2FGPw4n1oGowNtZnpiYbOONCIbL+ui8Xmf7fX+ozk9yM5a+O
         5T7w==
X-Gm-Message-State: AOAM5306it/yAh0E+l8ij5BEadyD6pH6Kn9YmaRiHtVfTI8LmC6dJ+4m
	bTgS6L2z7v9o+xzf0jyW9PNrOnwXhyD02tM0xBXDjQ==
X-Google-Smtp-Source: ABdhPJxyCa6biujp8QRzS/wOtnQV2Hgt+su8QZAwmWRWOpkE7wr2iC3IlXgY58QMlhgth6nJje7kdnc+DKsjZtx563E=
X-Received: by 2002:adf:f288:: with SMTP id k8mr4646622wro.350.1629211929446;
 Tue, 17 Aug 2021 07:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <1628579261-7380-1-git-send-email-purushottam.choudhary@kpit.com>
In-Reply-To: <1628579261-7380-1-git-send-email-purushottam.choudhary@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 17 Aug 2021 04:51:56 -1000
Message-ID: <CAOSpxdbihGhrEUqEd8+vgj5hvv-5wexzr2fN0zwpTMBuyp-5pg@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] python3: Remove unused python3 recipe
To: Purushottam choudhary <purushottam.choudhary@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2021 at 9:08 PM Purushottam choudhary
<purushottam.choudhary@kpit.com> wrote:
>
> Currently in dunfell branch python3 version is 3.8.11.
> so, python3_3.8.10.bb is not needed.
> Hence, removed.

I don't feel good about removing a recipe from a stable release.
There may be people who are using 3.8.10 for whatever reason and
removing the recipe would break their builds.

Steve

> ---
>  meta/recipes-devtools/python/python3_3.8.10.bb | 363 -------------------=
------
>  1 file changed, 363 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3_3.8.10.bb
>
> diff --git a/meta/recipes-devtools/python/python3_3.8.10.bb b/meta/recipe=
s-devtools/python/python3_3.8.10.bb
> deleted file mode 100644
> index 7295c63..0000000
> --- a/meta/recipes-devtools/python/python3_3.8.10.bb
> +++ /dev/null
> @@ -1,363 +0,0 @@
> -SUMMARY =3D "The Python Programming Language"
> -HOMEPAGE =3D "http://www.python.org"
> -DESCRIPTION =3D "Python is a programming language that lets you work mor=
e quickly and integrate your systems more effectively."
> -LICENSE =3D "PSF-2.0 & BSD-0-Clause"
> -SECTION =3D "devel/python"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc22d2438294c784731bf9dd224a46=
7b7"
> -
> -SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz =
\
> -           file://run-ptest \
> -           file://create_manifest3.py \
> -           file://get_module_deps3.py \
> -           file://python3-manifest.json \
> -           file://check_build_completeness.py \
> -           file://cgi_py.patch \
> -           file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avo=
id-.patch \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid=
_warning_about_tkinter.patch', d)} \
> -           file://0001-Do-not-use-the-shell-version-of-python-config-tha=
t-w.patch \
> -           file://python-config.patch \
> -           file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-prof=
ile.patch \
> -           file://0001-Do-not-hardcode-lib-as-location-for-site-packages=
-an.patch \
> -           file://0001-python3-use-cc_basename-to-replace-CC-for-checkin=
g-c.patch \
> -           file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-h=
ard.patch \
> -           file://0001-Makefile-fix-Issue36464-parallel-build-race-probl=
em.patch \
> -           file://0001-bpo-36852-proper-detection-of-mips-architecture-f=
or-.patch \
> -           file://crosspythonpath.patch \
> -           file://reformat_sysconfig.py \
> -           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
> -           file://0001-test_locale.py-correct-the-test-output-format.pat=
ch \
> -           file://0017-setup.py-do-not-report-missing-dependencies-for-d=
isa.patch \
> -           file://0001-setup.py-pass-missing-libraries-to-Extension-for-=
mul.patch \
> -           file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
> -           file://0001-configure.ac-fix-LIBPL.patch \
> -           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
> -           file://0020-configure.ac-setup.py-do-not-add-a-curses-include=
-pa.patch \
> -           file://0001-test_ctypes.test_find-skip-without-tools-sdk.patc=
h \
> -           "
> -
> -SRC_URI_append_class-native =3D " \
> -           file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-=
sys.patch \
> -           file://12-distutils-prefix-is-inside-staging-area.patch \
> -           file://0001-Don-t-search-system-for-headers-libraries.patch \
> -           "
> -
> -SRC_URI[md5sum] =3D "d9eee4b20155553830a2025e4dcaa7b3"
> -SRC_URI[sha256sum] =3D "6af24a66093dd840bcccf371d4044a3027e655cf24591ce2=
6e48022bc79219d9"
> -
> -# exclude pre-releases for both python 2.x and 3.x
> -UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -
> -CVE_PRODUCT =3D "python"
> -
> -# Upstream consider this expected behaviour
> -CVE_CHECK_WHITELIST +=3D "CVE-2007-4559"
> -# This is not exploitable when glibc has CVE-2016-10739 fixed.
> -CVE_CHECK_WHITELIST +=3D "CVE-2019-18348"
> -
> -# This is windows only issue.
> -CVE_CHECK_WHITELIST +=3D "CVE-2020-15523"
> -
> -PYTHON_MAJMIN =3D "3.8"
> -
> -S =3D "${WORKDIR}/Python-${PV}"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -inherit autotools pkgconfig qemu ptest multilib_header update-alternativ=
es
> -
> -MULTILIB_SUFFIX =3D "${@d.getVar('base_libdir',1).split('/')[-1]}"
> -
> -ALTERNATIVE_${PN}-dev =3D "python3-config"
> -ALTERNATIVE_LINK_NAME[python3-config] =3D "${bindir}/python${PYTHON_MAJM=
IN}-config"
> -ALTERNATIVE_TARGET[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN}=
-config-${MULTILIB_SUFFIX}"
> -
> -
> -DEPENDS =3D "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib =
virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archi=
ve"
> -DEPENDS_append_class-target =3D " python3-native"
> -DEPENDS_append_class-nativesdk =3D " python3-native"
> -
> -EXTRA_OECONF =3D " --without-ensurepip --enable-shared"
> -EXTRA_OECONF_append_class-native =3D " --bindir=3D${bindir}/${PN}"
> -
> -export CROSSPYTHONPATH=3D"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN=
}/lib-dynload/"
> -
> -EXTRANATIVEPATH +=3D "python3-native"
> -
> -CACHED_CONFIGUREVARS =3D " \
> -                ac_cv_file__dev_ptmx=3Dyes \
> -                ac_cv_file__dev_ptc=3Dno \
> -                ac_cv_working_tzset=3Dyes \
> -"
> -python() {
> -    # PGO currently causes builds to not be reproducible, so disable it =
for
> -    # now. See YOCTO #13407
> -    if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, Fals=
e, d) and d.getVar('BUILD_REPRODUCIBLE_BINARIES') !=3D '1':
> -        d.setVar('PACKAGECONFIG_PGO', 'pgo')
> -    else:
> -        d.setVar('PACKAGECONFIG_PGO', '')
> -}
> -
> -PACKAGECONFIG_class-target ??=3D "readline ${PACKAGECONFIG_PGO} gdbm"
> -PACKAGECONFIG_class-native ??=3D "readline gdbm"
> -PACKAGECONFIG_class-nativesdk ??=3D "readline gdbm"
> -PACKAGECONFIG[readline] =3D ",,readline"
> -# Use profile guided optimisation by running PyBench inside qemu-user
> -PACKAGECONFIG[pgo] =3D "--enable-optimizations,,qemu-native"
> -PACKAGECONFIG[tk] =3D ",,tk"
> -PACKAGECONFIG[gdbm] =3D ",,gdbm"
> -
> -do_configure_prepend () {
> -    mkdir -p ${B}/Modules
> -    cat > ${B}/Modules/Setup.local << EOF
> -*disabled*
> -${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
> -${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
> -EOF
> -}
> -
> -CPPFLAGS_append =3D " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/u=
uid"
> -
> -EXTRA_OEMAKE =3D '\
> -  STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -  STAGING_INCDIR=3D${STAGING_INCDIR} \
> -  LIB=3D${baselib} \
> -'
> -
> -do_compile_prepend_class-target() {
> -       if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', =
d)}; then
> -                qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR=
_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> -                cat >pgo-wrapper <<EOF
> -#!/bin/sh
> -cd ${B}
> -$qemu_binary "\$@"
> -EOF
> -                chmod +x pgo-wrapper
> -        fi
> -}
> -
> -do_install_prepend() {
> -        ${WORKDIR}/check_build_completeness.py ${T}/log.do_compile
> -}
> -
> -do_install_append_class-target() {
> -        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> -}
> -
> -do_install_append_class-native() {
> -        # Make sure we use /usr/bin/env python
> -        for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir=
}/${PN}`; do
> -                sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> -        done
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
> -do_install_append() {
> -        mkdir -p ${D}${libdir}/python-sysconfigdata
> -        sysconfigfile=3D`find ${D} -name _sysconfig*.py`
> -        cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigd=
ata.py
> -
> -        sed -i  \
> -                -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
> -                -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}=
'\,,g" \
> -                -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING=
_INCDIR}'\,,g" \
> -                -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INC=
DIR},g}" \
> -                -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
> -                ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
> -}
> -
> -do_install_append_class-nativesdk () {
> -    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS=3D=
'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/t=
erminfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'
> -}
> -
> -SSTATE_SCAN_FILES +=3D "Makefile _sysconfigdata.py"
> -PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
> -
> -py_package_preprocess () {
> -        # Remove references to buildmachine paths in target Makefile and=
 _sysconfigdata
> -        sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-=
libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
> -                -e 's|${DEBUG_PREFIX_MAP}||g' \
> -                -e 's:${HOSTTOOLS_DIR}/::g' \
> -                -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> -                -e 's:${RECIPE_SYSROOT}::g' \
> -                -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> -                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON=
_MAJMIN}${PYTHON_ABI}*/Makefile \
> -                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*=
.py \
> -                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
> -
> -        # Reformat _sysconfigdata after modifying it so that it remains
> -        # reproducible
> -        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata=
*.py; do
> -            python3 ${WORKDIR}/reformat_sysconfig.py $c
> -        done
> -
> -        # Recompile _sysconfigdata after modifying it
> -        cd ${PKGD}
> -        sysconfigfile=3D`find . -name _sysconfigdata_*.py`
> -        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -             -c "from py_compile import compile; compile('$sysconfigfile=
')"
> -        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -             -c "from py_compile import compile; compile('$sysconfigfile=
', optimize=3D1)"
> -        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -             -c "from py_compile import compile; compile('$sysconfigfile=
', optimize=3D2)"
> -        cd -
> -
> -        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bin=
dir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
> -
> -        #Remove the unneeded copy of target sysconfig data
> -        rm -rf ${PKGD}/${libdir}/python-sysconfigdata
> -}
> -
> -# We want bytecode precompiled .py files (.pyc's) by default
> -# but the user may set it on their own conf
> -INCLUDE_PYCS ?=3D "1"
> -
> -python(){
> -    import collections, json
> -
> -    filename =3D os.path.join(d.getVar('THISDIR'), 'python3', 'python3-m=
anifest.json')
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
> -    # First set RPROVIDES for -native case
> -    # Hardcoded since it cant be python3-native-foo, should be python3-f=
oo-native
> -    pn =3D 'python3'
> -    rprovides =3D d.getVar('RPROVIDES').split()
> -
> -    # ${PN}-misc-native is not in the manifest
> -    rprovides.append(pn + '-misc-native')
> -
> -    for key in python_manifest:
> -        pypackage =3D pn + '-' + key + '-native'
> -        if pypackage not in rprovides:
> -              rprovides.append(pypackage)
> -
> -    d.setVar('RPROVIDES_class-native', ' '.join(rprovides))
> -
> -    # Then work on the target
> -    include_pycs =3D d.getVar('INCLUDE_PYCS')
> -
> -    packages =3D d.getVar('PACKAGES').split()
> -    pn =3D d.getVar('PN')
> -
> -    newpackages=3D[]
> -    for key in python_manifest:
> -        pypackage =3D pn + '-' + key
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
> -        # Add cached files
> -        if include_pycs =3D=3D '1':
> -            for value in python_manifest[key]['cached']:
> -                    d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -        for value in python_manifest[key]['rdepends']:
> -            # Make it work with or without $PN
> -            if '${PN}' in value:
> -                value=3Dvalue.split('-', 1)[1]
> -            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> -
> -        for value in python_manifest[key].get('rrecommends', ()):
> -            if '${PN}' in value:
> -                value=3Dvalue.split('-', 1)[1]
> -            d.appendVar('RRECOMMENDS_' + pypackage, ' ' + pn + '-' + val=
ue)
> -
> -        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary']=
)
> -
> -    # Prepending so to avoid python-misc getting everything
> -    packages =3D newpackages + packages
> -    d.setVar('PACKAGES', ' '.join(packages))
> -    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> -    d.setVar('ALLOW_EMPTY_${PN}-pkgutil', '1')
> -}
> -
> -# Files needed to create a new manifest
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
> -    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
> -    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.jso=
n
> -}
> -
> -# bitbake python -c create_manifest
> -# Make sure we have native python ready when we create a new manifest
> -addtask do_create_manifest after do_patch do_prepare_recipe_sysroot
> -
> -# manual dependency additions
> -RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " nativesdk-python3-mo=
dules"
> -RRECOMMENDS_${PN}-crypt_append_class-target =3D " openssl ca-certificate=
s"
> -RRECOMMENDS_${PN}-crypt_append_class-nativesdk =3D " openssl ca-certific=
ates"
> -
> -# For historical reasons PN is empty and provided by python3-modules
> -FILES_${PN} =3D ""
> -RPROVIDES_${PN}-modules =3D "${PN}"
> -
> -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3=
"
> -FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> -
> -# provide python-pyvenv from python3-venv
> -RPROVIDES_${PN}-venv +=3D "python3-pyvenv"
> -
> -# package libpython3
> -PACKAGES =3D+ "libpython3 libpython3-staticdev"
> -FILES_libpython3 =3D "${libdir}/libpython*.so.*"
> -FILES_libpython3-staticdev +=3D "${libdir}/python${PYTHON_MAJMIN}/config=
-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
> -INSANE_SKIP_${PN}-dev +=3D "dev-elf"
> -INSANE_SKIP_${PN}-ptest +=3D "dev-deps"
> -
> -# catch all the rest (unsorted)
> -PACKAGES +=3D "${PN}-misc"
> -RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs pyth=
on3-pydoc python3-pickle python3-audio"
> -RDEPENDS_${PN}-modules_append_class-target =3D " python3-misc"
> -RDEPENDS_${PN}-modules_append_class-nativesdk =3D " python3-misc"
> -FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python$=
{PYTHON_MAJMIN}/lib-dynload"
> -
> -# catch manpage
> -PACKAGES +=3D "${PN}-man"
> -FILES_${PN}-man =3D "${datadir}/man"
> -
> -# See https://bugs.python.org/issue18748 and https://bugs.python.org/iss=
ue37395
> -RDEPENDS_libpython3_append_libc-glibc =3D " libgcc"
> -RDEPENDS_${PN}-ctypes_append_libc-glibc =3D " ${MLPREFIX}ldconfig"
> -RDEPENDS_${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip=
2 libgcc tzdata-europe coreutils sed"
> -RDEPENDS_${PN}-ptest_append_libc-glibc =3D " locale-base-tr-tr.iso-8859-=
9"
> -RDEPENDS_${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk',=
 'tk tk-lib', '', d)}"
> -RDEPENDS_${PN}-dev =3D ""
> -
> -RDEPENDS_${PN}-tests_append_class-target =3D " bash"
> -RDEPENDS_${PN}-tests_append_class-nativesdk =3D " bash"
> -
> -# Python's tests contain large numbers of files we don't need in the rec=
ipe sysroots
> -SYSROOT_PREPROCESS_FUNCS +=3D " py3_sysroot_cleanup"
> -py3_sysroot_cleanup () {
> -       rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
> -}
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
>=20
>
