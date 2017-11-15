Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAB878480
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 16:09:40 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id f187so2353716itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 08:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TAMGjKiQC9BUrUtDEg2jZnuGggKIgc3gfDIAT5QsEXE=;
	b=Vj2XcK5Dt/3/MiwW+YXv/eIwfFZeQ55M+ViKKmcv3R3ySb+dxrEmzsE557ZxavwEkK
	kEIVvzIN2Bh9z+cIpIB+a2OdDmc37cz37A8u2/QqXRzlfc7u7Syrnca2zJfMjq2MCdVs
	7Ri25hIISeyb/z8jvvh+DRwN2eFkd3hSMFx/XXRr8QCOzCthA42ogGT8UbQ39XxYd0tW
	9MIA2i8nZymdp5ubJecKdbO8KcuGRp1dI9w29tt9EnKWYdJvekYoEH1e+nVnVR96nqTg
	UIAMTIADRadCk2bemmaF01HR2/AUU/G3znBJy2aXM6PxRsZ9xe6rnofXXK9dJpC5G+0i
	xBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TAMGjKiQC9BUrUtDEg2jZnuGggKIgc3gfDIAT5QsEXE=;
	b=nTZMHddo8eN7eu++P5/YTnfbfXj7DscuCFpts2wHhMnweGxIcHicTGO1XUN60znuC8
	klMey/oaPtEit2tx9expe941FqQWJOsXsBzmiEyA879gNn2cEVFYo71LNCUDSHzLPXt5
	ARB2dpEMuYPXOJ6JNrllbwKfXYjc79/fw8sS20RjCM+L1WhNfm8VdP+k9SopXDD41LNC
	/BR/RgcybBqn+nqzyM9/KKMolC+4VRYONkyrRzjH4iFOhTifeiiNBW9r0NGUpi+yN6D5
	kSpssVRBJ9RXBchEsaW3jaewpRSu1+h2k7Pr3piNZu/+dotUZJ2py+5qcCmoC7I1RFqN
	Ch4A==
X-Gm-Message-State: AJaThX7341wCU1oSsPRtK+VPZGl2E3KGWtVx01ExEA1tTeuwMG0k2AYP
	k4Vv1YhIWIYlIQXlj4ClRsVKjE36djJOvmG1nY4bWtUH
X-Google-Smtp-Source: AGs4zMYxSZ5vVRFlxtz6kxxUy8EMH4zK7ACiX0N0TIvuGDj6DhOw/3tKwtgxmdBYfJEauiG4EIYU9NtRWlzl6IPdlH4=
X-Received: by 10.36.172.31 with SMTP id s31mr20621045ite.124.1510762181852;
	Wed, 15 Nov 2017 08:09:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Wed, 15 Nov 2017 08:09:21 -0800 (PST)
In-Reply-To: <e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
References: <cover.1510744037.git.alexander.kanavin@linux.intel.com>
	<e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Nov 2017 16:09:21 +0000
Message-ID: <CAJTo0LaBKtaNUM_MpqQOHDJ2rZtpSFCA1HDFDtc5L1reBT4grQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Wed, 15 Nov 2017 16:09:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c1fc0f830988c055e07bb75"

--94eb2c1fc0f830988c055e07bb75
Content-Type: text/plain; charset="UTF-8"

This series was just ran on the autobuilder and there's a few failures:

http://errors.yoctoproject.org/Errors/Latest//?filter=21d01e923239ab32116bf526cc2c5afee9052476&type=commit

Anyone interested in getting Meson merged into oe-core is welcome to work
with Alex to resolve these.

Ross

On 15 November 2017 at 11:08, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> The original recipe has been provided and improved by:
>
> Ross Burton <ross.burton@intel.com>
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Adam C. Foltzer <acfoltzer@galois.com>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Linus Svensson <linussn@axis.com>
>
> I have added a couple patches to fix up gtk-doc and
> gobject-introspection in cross-compilation environments.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/meson.bbclass                         | 103
> +++++++++++++++++++
>  ...ix-issues-that-arise-when-cross-compiling.patch | 113
> +++++++++++++++++++++
>  ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
>  meta/recipes-devtools/meson/meson_0.43.0.bb        |  19 ++++
>  4 files changed, 276 insertions(+)
>  create mode 100644 meta/classes/meson.bbclass
>  create mode 100644 meta/recipes-devtools/meson/
> meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
>  create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-
> introspection-determine-g-ir-scanner-and-g-i.patch
>  create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> new file mode 100644
> index 00000000000..f6cf24c33a7
> --- /dev/null
> +++ b/meta/classes/meson.bbclass
> @@ -0,0 +1,103 @@
> +inherit python3native
> +
> +DEPENDS_append = " meson-native ninja-native"
> +
> +# As Meson enforces out-of-tree builds we can just use cleandirs
> +B = "${WORKDIR}/build"
> +do_configure[cleandirs] = "${B}"
> +
> +# Where the meson.build build configuration is
> +MESON_SOURCEPATH = "${S}"
> +
> +# These variables in the environment override meson's *native* tools
> settings.
> +# We have to unset them, so that meson doesn't pick up the cross tools and
> +# use them for native builds.
> +unset CC
> +unset CXX
> +unset AR
> +
> +def noprefix(var, d):
> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/',
> '', 1)
> +
> +MESONOPTS = " --prefix ${prefix} \
> +              --bindir ${@noprefix('bindir', d)} \
> +              --sbindir ${@noprefix('sbindir', d)} \
> +              --datadir ${@noprefix('datadir', d)} \
> +              --libdir ${@noprefix('libdir', d)} \
> +              --libexecdir ${@noprefix('libexecdir', d)} \
> +              --includedir ${@noprefix('includedir', d)} \
> +              --mandir ${@noprefix('mandir', d)} \
> +              --infodir ${@noprefix('infodir', d)} \
> +              --sysconfdir ${sysconfdir} \
> +              --localstatedir ${localstatedir} \
> +              --sharedstatedir ${sharedstatedir}"
> +
> +MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
> +
> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be',
> 'big', 'little', d)}"
> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES',
> 'bigendian', 'big', 'little', d)}"
> +
> +EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
> +
> +MESON_CROSS_FILE = ""
> +MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
> +
> +def meson_array(var, d):
> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
> +
> +addtask write_config before do_configure
> +do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
> +do_write_config() {
> +    # This needs to be Py to split the args into single-element lists
> +    cat >${WORKDIR}/meson.cross <<EOF
> +[binaries]
> +c = '${HOST_PREFIX}gcc'
> +cpp = '${HOST_PREFIX}g++'
> +ar = '${HOST_PREFIX}ar'
> +ld = '${HOST_PREFIX}ld'
> +strip = '${HOST_PREFIX}strip'
> +readelf = '${HOST_PREFIX}readelf'
> +pkgconfig = 'pkg-config'
> +
> +[properties]
> +needs_exe_wrapper = true
> +c_args = [${@meson_array('MESON_C_ARGS', d)}]
> +c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
> +cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
> +cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
> +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> +
> +[host_machine]
> +system = '${HOST_OS}'
> +cpu_family = '${HOST_ARCH}'
> +cpu = '${HOST_ARCH}'
> +endian = '${MESON_HOST_ENDIAN}'
> +
> +[target_machine]
> +system = '${TARGET_OS}'
> +cpu_family = '${TARGET_ARCH}'
> +cpu = '${TARGET_ARCH}'
> +endian = '${MESON_TARGET_ENDIAN}'
> +EOF
> +}
> +
> +CONFIGURE_FILES = "meson.build"
> +
> +meson_do_configure() {
> +    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}"
> ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
> +        cat ${B}/meson-logs/meson-log.txt
> +        bbfatal_log meson failed
> +    fi
> +}
> +
> +do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
> +meson_do_compile() {
> +    ninja ${PARALLEL_MAKE}
> +}
> +
> +meson_do_install() {
> +    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
> +}
> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-
> that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/
> meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> new file mode 100644
> index 00000000000..ca3d7095066
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-
> that-arise-when-cross-compiling.patch
> @@ -0,0 +1,113 @@
> +From 15e054dce6ff11d2cb219c8c09a31b26f0e58b62 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 4 Aug 2017 16:16:41 +0300
> +Subject: [PATCH 1/3] gtkdoc: fix issues that arise when cross-compiling
> +
> +Specifically:
> +1) Make it possible to specify a wrapper for executing binaries
> +(usually, some kind of target hardware emulator, such as qemu)
> +2) Explicitly provide CC and LD via command line, as otherwise gtk-doc
> will
> +try to guess them, incorrectly.
> +3) If things break down, print the full command with arguments,
> +not just the binary name.
> +4) Correctly determine the compiler/linker executables and cross-options
> when cross-compiling
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + mesonbuild/modules/gnome.py        | 18 +++++++++++++++---
> + mesonbuild/scripts/gtkdochelper.py |  9 +++++++--
> + 2 files changed, 22 insertions(+), 5 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index 6ec7040..4cfaefd 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -713,6 +713,10 @@ class GnomeModule(ExtensionModule):
> +                 '--mode=' + mode]
> +         if namespace:
> +             args.append('--namespace=' + namespace)
> ++        gtkdoc_exe_wrapper = state.environment.cross_info.
> config["properties"].get('gtkdoc_exe_wrapper', None)
> ++        if gtkdoc_exe_wrapper is not None:
> ++            args.append('--gtkdoc-exe-wrapper=' + gtkdoc_exe_wrapper)
> ++
> +         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
> +         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
> +         args += self._unpack_args('--scanobjsargs=', 'scanobjs_args',
> kwargs)
> +@@ -741,14 +745,22 @@ class GnomeModule(ExtensionModule):
> +                 raise MesonException(
> +                     'Gir include dirs should be include_directories().')
> +         cflags.update(get_include_args(inc_dirs))
> ++
> ++        cross_c_args = " ".join(state.environment.
> cross_info.config["properties"].get('c_args', ""))
> ++        cross_link_args = " ".join(state.environment.
> cross_info.config["properties"].get('c_link_args', ""))
> ++
> +         if cflags:
> +-            args += ['--cflags=%s' % ' '.join(cflags)]
> ++            args += ['--cflags=%s %s' % (cross_c_args,' '.join(cflags))]
> +         if ldflags:
> +-            args += ['--ldflags=%s' % ' '.join(ldflags)]
> ++            args += ['--ldflags=%s %s' % (cross_link_args, '
> '.join(ldflags))]
> +         compiler = state.environment.coredata.compilers.get('c')
> +-        if compiler:
> ++        cross_compiler = state.environment.coredata.
> cross_compilers.get('c')
> ++        if compiler and not state.environment.is_cross_build():
> +             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
> +             args += ['--ld=%s' % ' '.join(compiler.get_linker_
> exelist())]
> ++        elif cross_compiler and state.environment.is_cross_build():
> ++            args += ['--cc=%s' % ' '.join(cross_compiler.get_exelist())]
> ++            args += ['--ld=%s' % ' '.join(cross_compiler.get_
> linker_exelist())]
> +
> +         return args
> +
> +diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/
> gtkdochelper.py
> +index a2cbf5a..19331bd 100644
> +--- a/mesonbuild/scripts/gtkdochelper.py
> ++++ b/mesonbuild/scripts/gtkdochelper.py
> +@@ -44,13 +44,14 @@ parser.add_argument('--ignore-headers',
> dest='ignore_headers', default='')
> + parser.add_argument('--namespace', dest='namespace', default='')
> + parser.add_argument('--mode', dest='mode', default='')
> + parser.add_argument('--installdir', dest='install_dir')
> ++parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
> +
> + def gtkdoc_run_check(cmd, cwd):
> +     # Put stderr into stdout since we want to print it out anyway.
> +     # This preserves the order of messages.
> +     p, out = Popen_safe(cmd, cwd=cwd, stderr=subprocess.STDOUT)[0:2]
> +     if p.returncode != 0:
> +-        err_msg = ["{!r} failed with status {:d}".format(cmd[0],
> p.returncode)]
> ++        err_msg = ["{!r} failed with status {:d}".format(cmd,
> p.returncode)]
> +         if out:
> +             err_msg.append(out)
> +         raise MesonException('\n'.join(err_msg))
> +@@ -58,7 +59,7 @@ def gtkdoc_run_check(cmd, cwd):
> + def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
> +                  main_file, module,
> +                  html_args, scan_args, fixxref_args, mkdb_args,
> +-                 gobject_typesfile, scanobjs_args, ld, cc, ldflags,
> cflags,
> ++                 gobject_typesfile, scanobjs_args, gtkdoc_exe_wrapper,
> ld, cc, ldflags, cflags,
> +                  html_assets, content_files, ignore_headers, namespace,
> +                  expand_content_files, mode):
> +     print("Building documentation for %s" % module)
> +@@ -111,6 +112,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir,
> src_subdirs,
> +     if gobject_typesfile:
> +         scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + ['--types='
> + gobject_typesfile,
> +
>  '--module=' + module,
> ++                                                              '--run=' +
> gtkdoc_exe_wrapper,
> ++                                                              '--cc=' +
> cc,
> ++                                                              '--ld=' +
> ld,
> +
>  '--cflags=' + cflags,
> +
>  '--ldflags=' + ldflags]
> +
> +@@ -206,6 +210,7 @@ def run(args):
> +         mkdbargs,
> +         options.gobject_typesfile,
> +         scanobjsargs,
> ++        options.gtkdoc_exe_wrapper,
> +         options.ld,
> +         options.cc,
> +         options.ldflags,
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-
> introspection-determine-g-ir-scanner-and-g-i.patch
> b/meta/recipes-devtools/meson/meson/0002-gobject-
> introspection-determine-g-ir-scanner-and-g-i.patch
> new file mode 100644
> index 00000000000..f00b9b2a2d1
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0002-gobject-
> introspection-determine-g-ir-scanner-and-g-i.patch
> @@ -0,0 +1,41 @@
> +From 84cb251a33190ec82faeaad321518af4b309c55e Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 4 Aug 2017 16:18:47 +0300
> +Subject: [PATCH 2/2] gobject-introspection: determine g-ir-scanner and
> + g-ir-compiler paths from pkgconfig
> +
> +Do not hardcode the name of those binaries; gobject-introspection
> +provides them via pkgconfig, and they can be set to something else
> +(for example when cross-compiling).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + mesonbuild/modules/gnome.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index ba7e4cd..00472af 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -380,8 +380,6 @@ class GnomeModule(ExtensionModule):
> +             raise MesonException('Gir takes one argument')
> +         if kwargs.get('install_dir'):
> +             raise MesonException('install_dir is not supported with
> generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
> +-        giscanner = find_program('g-ir-scanner', 'Gir')
> +-        gicompiler = find_program('g-ir-compiler', 'Gir')
> +         girtarget = args[0]
> +         while hasattr(girtarget, 'held_object'):
> +             girtarget = girtarget.held_object
> +@@ -392,6 +390,8 @@ class GnomeModule(ExtensionModule):
> +                 self.gir_dep = PkgConfigDependency('gobject-
> introspection-1.0',
> +                                                    state.environment,
> +                                                    {'native': True})
> ++            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner')
> ++            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler')
> +             pkgargs = self.gir_dep.get_compile_args()
> +         except Exception:
> +             raise MesonException('gobject-introspection dependency was
> not found, gir cannot be generated.')
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-devtools/meson/meson_0.43.0.bb
> b/meta/recipes-devtools/meson/meson_0.43.0.bb
> new file mode 100644
> index 00000000000..bbb48d9197c
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson_0.43.0.bb
> @@ -0,0 +1,19 @@
> +HOMEPAGE = "http://mesonbuild.com"
> +SUMMARY = "A high performance build system"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI = "https://github.com/mesonbuild/meson/releases/
> download/${PV}/${BP}.tar.gz \
> +           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> \
> +           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
> \
> +           "
> +SRC_URI[md5sum] = "b0d389cc5937928c2f5114656dc5a99a"
> +SRC_URI[sha256sum] = "c513eca90e0d70bf14cd1eaafea2fa
> 91cf40a73326a7ff61f08a005048057340"
> +UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "ninja python3-core python3-modules"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1fc0f830988c055e07bb75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This series was just ran on the autobuilder and there&#39;=
s a few failures:<div><br></div><div><a href=3D"http://errors.yoctoproject.=
org/Errors/Latest//?filter=3D21d01e923239ab32116bf526cc2c5afee9052476&amp;t=
ype=3Dcommit">http://errors.yoctoproject.org/Errors/Latest//?filter=3D21d01=
e923239ab32116bf526cc2c5afee9052476&amp;type=3Dcommit</a><br></div><div><br=
></div><div>Anyone interested in getting Meson merged into oe-core is welco=
me to work with Alex to resolve these.</div><div><br></div><div>Ross</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 15 Novemb=
er 2017 at 11:08, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto=
:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The or=
iginal recipe has been provided and improved by:<br>
<br>
Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.=
com</a>&gt;<br>
Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.ribalda@gmail.com">ri=
cardo.ribalda@gmail.com</a>&gt;<br>
Adam C. Foltzer &lt;<a href=3D"mailto:acfoltzer@galois.com">acfoltzer@galoi=
s.com</a>&gt;<br>
Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter=
.kjellerstedt@axis.com</a>&gt;<br>
Linus Svensson &lt;<a href=3D"mailto:linussn@axis.com">linussn@axis.com</a>=
&gt;<br>
<br>
I have added a couple patches to fix up gtk-doc and<br>
gobject-introspection in cross-compilation environments.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 103 +++++++++++++++++++<b=
r>
=C2=A0...ix-issues-that-arise-when-<wbr>cross-compiling.patch | 113 +++++++=
++++++++++++++<br>
=C2=A0...rospection-determine-g-ir-<wbr>scanner-and-g-i.patch |=C2=A0 41 ++=
++++++<br>
=C2=A0meta/recipes-devtools/meson/<a href=3D"http://meson_0.43.0.bb" rel=3D=
"noreferrer" target=3D"_blank">me<wbr>son_0.43.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 19 ++++<br>
=C2=A04 files changed, 276 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/meson.bbclass<br>
=C2=A0create mode 100644 meta/recipes-devtools/meson/<wbr>meson/0001-gtkdoc=
-fix-issues-<wbr>that-arise-when-cross-<wbr>compiling.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/meson/<wbr>meson/0002-gobjec=
t-<wbr>introspection-determine-g-ir-<wbr>scanner-and-g-i.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/meson/<a href=3D"http://meso=
n_0.43.0.bb" rel=3D"noreferrer" target=3D"_blank">me<wbr>son_0.43.0.bb</a><=
br>
<br>
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<br>
new file mode 100644<br>
index 00000000000..f6cf24c33a7<br>
--- /dev/null<br>
+++ b/meta/classes/meson.bbclass<br>
@@ -0,0 +1,103 @@<br>
+inherit python3native<br>
+<br>
+DEPENDS_append =3D &quot; meson-native ninja-native&quot;<br>
+<br>
+# As Meson enforces out-of-tree builds we can just use cleandirs<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
+do_configure[cleandirs] =3D &quot;${B}&quot;<br>
+<br>
+# Where the meson.build build configuration is<br>
+MESON_SOURCEPATH =3D &quot;${S}&quot;<br>
+<br>
+# These variables in the environment override meson&#39;s *native* tools s=
ettings.<br>
+# We have to unset them, so that meson doesn&#39;t pick up the cross tools=
 and<br>
+# use them for native builds.<br>
+unset CC<br>
+unset CXX<br>
+unset AR<br>
+<br>
+def noprefix(var, d):<br>
+=C2=A0 =C2=A0 return d.getVar(var, True).replace(d.getVar(&#39;<wbr>prefix=
&#39;, True) + &#39;/&#39;, &#39;&#39;, 1)<br>
+<br>
+MESONOPTS =3D &quot; --prefix ${prefix} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --bindir ${@noprefix(&#39=
;bindir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sbindir ${@noprefix(&#3=
9;sbindir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --datadir ${@noprefix(&#3=
9;datadir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libdir ${@noprefix(&#39=
;libdir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libexecdir ${@noprefix(=
&#39;libexecdir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir ${@noprefix(=
&#39;includedir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --mandir ${@noprefix(&#39=
;mandir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --infodir ${@noprefix(&#3=
9;infodir&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir ${sysconfdir=
} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstatedir ${localst=
atedir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sharedstatedir ${shared=
statedir}&quot;<br>
+<br>
+MESON_C_ARGS =3D &quot;${TARGET_CC_ARCH}${TOOLCHAIN_<wbr>OPTIONS}&quot;<br=
>
+MESON_LINK_ARGS =3D &quot;${MESON_C_ARGS} ${LDFLAGS}&quot;<br>
+<br>
+MESON_HOST_ENDIAN =3D &quot;${@bb.utils.contains(&#39;<wbr>SITEINFO_ENDIAN=
NESS&#39;, &#39;be&#39;, &#39;big&#39;, &#39;little&#39;, d)}&quot;<br>
+MESON_TARGET_ENDIAN =3D &quot;${@bb.utils.contains(&#39;TUNE_<wbr>FEATURES=
&#39;, &#39;bigendian&#39;, &#39;big&#39;, &#39;little&#39;, d)}&quot;<br>
+<br>
+EXTRA_OEMESON +=3D &quot;${PACKAGECONFIG_CONFARGS}&quot;<br>
+<br>
+MESON_CROSS_FILE =3D &quot;&quot;<br>
+MESON_CROSS_FILE_class-target =3D &quot;--cross-file ${WORKDIR}/meson.cros=
s&quot;<br>
+<br>
+def meson_array(var, d):<br>
+=C2=A0 =C2=A0 return &quot;&#39;, &#39;&quot;.join(d.getVar(var, True).spl=
it()).join((&quot;&#39;&quot;, &quot;&#39;&quot;))<br>
+<br>
+addtask write_config before do_configure<br>
+do_write_config[vardeps] +=3D &quot;MESON_C_ARGS TOOLCHAIN_OPTIONS&quot;<b=
r>
+do_write_config() {<br>
+=C2=A0 =C2=A0 # This needs to be Py to split the args into single-element =
lists<br>
+=C2=A0 =C2=A0 cat &gt;${WORKDIR}/meson.cross &lt;&lt;EOF<br>
+[binaries]<br>
+c =3D &#39;${HOST_PREFIX}gcc&#39;<br>
+cpp =3D &#39;${HOST_PREFIX}g++&#39;<br>
+ar =3D &#39;${HOST_PREFIX}ar&#39;<br>
+ld =3D &#39;${HOST_PREFIX}ld&#39;<br>
+strip =3D &#39;${HOST_PREFIX}strip&#39;<br>
+readelf =3D &#39;${HOST_PREFIX}readelf&#39;<br>
+pkgconfig =3D &#39;pkg-config&#39;<br>
+<br>
+[properties]<br>
+needs_exe_wrapper =3D true<br>
+c_args =3D [${@meson_array(&#39;MESON_C_ARGS&#39;<wbr>, d)}]<br>
+c_link_args =3D [${@meson_array(&#39;MESON_LINK_<wbr>ARGS&#39;, d)}]<br>
+cpp_args =3D [${@meson_array(&#39;MESON_C_ARGS&#39;<wbr>, d)}]<br>
+cpp_link_args =3D [${@meson_array(&#39;MESON_LINK_<wbr>ARGS&#39;, d)}]<br>
+gtkdoc_exe_wrapper =3D &#39;${B}/gtkdoc-qemuwrapper&#39;<br>
+<br>
+[host_machine]<br>
+system =3D &#39;${HOST_OS}&#39;<br>
+cpu_family =3D &#39;${HOST_ARCH}&#39;<br>
+cpu =3D &#39;${HOST_ARCH}&#39;<br>
+endian =3D &#39;${MESON_HOST_ENDIAN}&#39;<br>
+<br>
+[target_machine]<br>
+system =3D &#39;${TARGET_OS}&#39;<br>
+cpu_family =3D &#39;${TARGET_ARCH}&#39;<br>
+cpu =3D &#39;${TARGET_ARCH}&#39;<br>
+endian =3D &#39;${MESON_TARGET_ENDIAN}&#39;<br>
+EOF<br>
+}<br>
+<br>
+CONFIGURE_FILES =3D &quot;meson.build&quot;<br>
+<br>
+meson_do_configure() {<br>
+=C2=A0 =C2=A0 if ! meson ${MESONOPTS} &quot;${MESON_SOURCEPATH}&quot; &quo=
t;${B}&quot; ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat ${B}/meson-logs/meson-log.txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log meson failed<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+do_compile[progress] =3D &quot;outof:^\[(\d+)/(\d+)\]\s+&quot;<br>
+meson_do_compile() {<br>
+=C2=A0 =C2=A0 ninja ${PARALLEL_MAKE}<br>
+}<br>
+<br>
+meson_do_install() {<br>
+=C2=A0 =C2=A0 DESTDIR=3D&#39;${D}&#39; ninja ${PARALLEL_MAKEINST} install<=
br>
+}<br>
+<br>
+EXPORT_FUNCTIONS do_configure do_compile do_install<br>
diff --git a/meta/recipes-devtools/meson/<wbr>meson/0001-gtkdoc-fix-issues-=
<wbr>that-arise-when-cross-<wbr>compiling.patch b/meta/recipes-devtools/mes=
on/<wbr>meson/0001-gtkdoc-fix-issues-<wbr>that-arise-when-cross-<wbr>compil=
ing.patch<br>
new file mode 100644<br>
index 00000000000..ca3d7095066<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/meson/<wbr>meson/0001-gtkdoc-fix-issues-<wbr>th=
at-arise-when-cross-<wbr>compiling.patch<br>
@@ -0,0 +1,113 @@<br>
+From 15e054dce6ff11d2cb219c8c09a31b<wbr>26f0e58b62 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
+Subject: [PATCH 1/3] gtkdoc: fix issues that arise when cross-compiling<br=
>
+<br>
+Specifically:<br>
+1) Make it possible to specify a wrapper for executing binaries<br>
+(usually, some kind of target hardware emulator, such as qemu)<br>
+2) Explicitly provide CC and LD via command line, as otherwise gtk-doc wil=
l<br>
+try to guess them, incorrectly.<br>
+3) If things break down, print the full command with arguments,<br>
+not just the binary name.<br>
+4) Correctly determine the compiler/linker executables and cross-options w=
hen cross-compiling<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
+---<br>
+ mesonbuild/modules/gnome.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++++=
++---<br>
+ mesonbuild/scripts/<wbr>gtkdochelper.py |=C2=A0 9 +++++++--<br>
+ 2 files changed, 22 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py<br>
+index 6ec7040..4cfaefd 100644<br>
+--- a/mesonbuild/modules/gnome.py<br>
++++ b/mesonbuild/modules/gnome.py<br>
+@@ -713,6 +713,10 @@ class GnomeModule(ExtensionModule):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--mode=
=3D&#39; + mode]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if namespace:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(&#39;--namespa=
ce=3D&#39; + namespace)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D state.environment.cros=
s_info.<wbr>config[&quot;properties&quot;].get(&#39;<wbr>gtkdoc_exe_wrapper=
&#39;, None)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if gtkdoc_exe_wrapper is not None:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--gtkdoc-exe-<=
wbr>wrapper=3D&#39; + gtkdoc_exe_wrapper)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D self._unpack_args(&#39;--htmla=
rgs=3D<wbr>&#39;, &#39;html_args&#39;, kwargs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D self._unpack_args(&#39;--scana=
rgs=3D<wbr>&#39;, &#39;scan_args&#39;, kwargs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D self._unpack_args(&#39;--<wbr>=
scanobjsargs=3D&#39;, &#39;scanobjs_args&#39;, kwargs)<br>
+@@ -741,14 +745,22 @@ class GnomeModule(ExtensionModule):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise MesonE=
xception(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;Gir include dirs should be include_directories().&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cflags.update(get_include_<wbr>args(inc_=
dirs))<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cross_c_args =3D &quot; &quot;.join(state.env=
ironment.<wbr>cross_info.config[&quot;properties&quot;<wbr>].get(&#39;c_arg=
s&#39;, &quot;&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cross_link_args =3D &quot; &quot;.join(state.=
environment.<wbr>cross_info.config[&quot;properties&quot;<wbr>].get(&#39;c_=
link_args&#39;, &quot;&quot;))<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cflags:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D [&#39;--cflags=3D%s&#=
39; % &#39; &#39;.join(cflags)]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D [&#39;--cflags=3D%s %=
s&#39; % (cross_c_args,&#39; &#39;.join(cflags))]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ldflags:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D [&#39;--ldflags=3D%s&=
#39; % &#39; &#39;.join(ldflags)]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D [&#39;--ldflags=3D%s =
%s&#39; % (cross_link_args, &#39; &#39;.join(ldflags))]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler =3D state.environment.coredata.=
<wbr>compilers.get(&#39;c&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if compiler:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cross_compiler =3D state.environment.coredata=
.<wbr>cross_compilers.get(&#39;c&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if compiler and not state.environment.is_cros=
s_<wbr>build():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D [&#39;--cc=3D%s&=
#39; % &#39; &#39;.join(compiler.get_exelist())<wbr>]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D [&#39;--ld=3D%s&=
#39; % &#39; &#39;.join(compiler.get_linker_<wbr>exelist())]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cross_compiler and state.environment.is_=
cross_<wbr>build():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D [&#39;--cc=3D%s&#39; =
% &#39; &#39;.join(cross_compiler.get_<wbr>exelist())]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D [&#39;--ld=3D%s&#39; =
% &#39; &#39;.join(cross_compiler.get_<wbr>linker_exelist())]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return args<br>
+<br>
+diff --git a/mesonbuild/scripts/<wbr>gtkdochelper.py b/mesonbuild/scripts/=
<wbr>gtkdochelper.py<br>
+index a2cbf5a..19331bd 100644<br>
+--- a/mesonbuild/scripts/<wbr>gtkdochelper.py<br>
++++ b/mesonbuild/scripts/<wbr>gtkdochelper.py<br>
+@@ -44,13 +44,14 @@ parser.add_argument(&#39;--ignore-<wbr>headers&#39;, d=
est=3D&#39;ignore_headers&#39;, default=3D&#39;&#39;)<br>
+ parser.add_argument(&#39;--<wbr>namespace&#39;, dest=3D&#39;namespace&#39=
;, default=3D&#39;&#39;)<br>
+ parser.add_argument(&#39;--mode&#39;, dest=3D&#39;mode&#39;, default=3D&#=
39;&#39;)<br>
+ parser.add_argument(&#39;--<wbr>installdir&#39;, dest=3D&#39;install_dir&=
#39;)<br>
++parser.add_argument(&#39;--<wbr>gtkdoc-exe-wrapper&#39;, dest=3D&#39;gtkd=
oc_exe_wrapper&#39;)<br>
+<br>
+ def gtkdoc_run_check(cmd, cwd):<br>
+=C2=A0 =C2=A0 =C2=A0# Put stderr into stdout since we want to print it out=
 anyway.<br>
+=C2=A0 =C2=A0 =C2=A0# This preserves the order of messages.<br>
+=C2=A0 =C2=A0 =C2=A0p, out =3D Popen_safe(cmd, cwd=3Dcwd, stderr=3Dsubproc=
ess.STDOUT)[0:2]<br>
+=C2=A0 =C2=A0 =C2=A0if p.returncode !=3D 0:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg =3D [&quot;{!r} failed with status {:=
d}&quot;.format(cmd[0], p.returncode)]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg =3D [&quot;{!r} failed with status {:=
d}&quot;.format(cmd, p.returncode)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if out:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err_msg.append(out)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise MesonException(&#39;\n&#39;.join(e=
rr_<wbr>msg))<br>
+@@ -58,7 +59,7 @@ def gtkdoc_run_check(cmd, cwd):<br>
+ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 main_file, =
module,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 html_args, =
scan_args, fixxref_args, mkdb_args,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gobject_typ=
esfile, scanobjs_args, ld, cc, ldflags, cflags,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gobject_typ=
esfile, scanobjs_args, gtkdoc_exe_wrapper, ld, cc, ldflags, cflags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 html_assets=
, content_files, ignore_headers, namespace,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expand_cont=
ent_files, mode):<br>
+=C2=A0 =C2=A0 =C2=A0print(&quot;Building documentation for %s&quot; % modu=
le)<br>
+@@ -111,6 +112,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, =
src_subdirs,<br>
+=C2=A0 =C2=A0 =C2=A0if gobject_typesfile:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanobjs_cmd =3D [&#39;gtkdoc-scangobj&#=
39;] + scanobjs_args + [&#39;--types=3D&#39; + gobject_typesfile,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;--module=3D&#39; + module,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
--run=3D&#39; + gtkdoc_exe_wrapper,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
--cc=3D&#39; + cc,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
--ld=3D&#39; + ld,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;--cflags=3D&#39; + cflags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;--ldflags=3D&#39; + ldflags]<br>
+<br>
+@@ -206,6 +210,7 @@ def run(args):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdbargs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options.gobject_typesfile,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanobjsargs,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 options.gtkdoc_exe_wrapper,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options.ld,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options.cc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options.ldflags,<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/meson/<wbr>meson/0002-gobject-<wbr>intro=
spection-determine-g-ir-<wbr>scanner-and-g-i.patch b/meta/recipes-devtools/=
meson/<wbr>meson/0002-gobject-<wbr>introspection-determine-g-ir-<wbr>scanne=
r-and-g-i.patch<br>
new file mode 100644<br>
index 00000000000..f00b9b2a2d1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/meson/<wbr>meson/0002-gobject-<wbr>introspectio=
n-determine-g-ir-<wbr>scanner-and-g-i.patch<br>
@@ -0,0 +1,41 @@<br>
+From 84cb251a33190ec82faeaad321518a<wbr>f4b309c55e Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Fri, 4 Aug 2017 16:18:47 +0300<br>
+Subject: [PATCH 2/2] gobject-introspection: determine g-ir-scanner and<br>
+ g-ir-compiler paths from pkgconfig<br>
+<br>
+Do not hardcode the name of those binaries; gobject-introspection<br>
+provides them via pkgconfig, and they can be set to something else<br>
+(for example when cross-compiling).<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ mesonbuild/modules/gnome.py | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py<br>
+index ba7e4cd..00472af 100644<br>
+--- a/mesonbuild/modules/gnome.py<br>
++++ b/mesonbuild/modules/gnome.py<br>
+@@ -380,8 +380,6 @@ class GnomeModule(ExtensionModule):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise MesonException(&#39;=
Gir takes one argument&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if kwargs.get(&#39;install_dir&#39;):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise MesonException(&#39;=
install_dir is not supported with generate_gir(), see &quot;install_dir_gir=
&quot; and &quot;install_dir_typelib&quot;&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 giscanner =3D find_program(&#39;g-ir-scanner&=
#39;, &#39;Gir&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gicompiler =3D find_program(&#39;g-ir-compile=
r&#39;, &#39;Gir&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girtarget =3D args[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while hasattr(girtarget, &#39;held_objec=
t&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girtarget =3D girtarget.he=
ld_object<br>
+@@ -392,6 +390,8 @@ class GnomeModule(ExtensionModule):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gir_dep=
 =3D PkgConfigDependency(&#39;gobject-<wbr>introspection-1.0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state.environment,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&#39;native&#39;: True})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 giscanner =3D os.environ[&#39;P=
KG_CONFIG_<wbr>SYSROOT_DIR&#39;] + self.gir_dep.get_pkgconfig_<wbr>variable=
(&#39;g_ir_scanner&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicompiler =3D os.environ[&#39;=
PKG_CONFIG_<wbr>SYSROOT_DIR&#39;] + self.gir_dep.get_pkgconfig_<wbr>variabl=
e(&#39;g_ir_compiler&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgargs =3D self.gir_dep.g=
et_compile_args(<wbr>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise MesonException(&#39;=
gobject-<wbr>introspection dependency was not found, gir cannot be generate=
d.&#39;)<br>
+--<br>
+2.13.2<br>
+<br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.43.0.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>meson_0.43.0.bb</a> b/meta/recip=
es-devtools/meson/<a href=3D"http://meson_0.43.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank"><wbr>meson_0.43.0.bb</a><br>
new file mode 100644<br>
index 00000000000..bbb48d9197c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/meson/<a href=3D"http://meson_0.43.0.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>meson_0.43.0.bb</a><br>
@@ -0,0 +1,19 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"http://mesonbuild.com" rel=3D"noreferrer" ta=
rget=3D"_blank">http://mesonbuild.com</a>&quot;<br>
+SUMMARY =3D &quot;A high performance build system&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>3b83ef96387f14655fc85=
4ddc3c6bd<wbr>57&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/mesonbuild/meson/releases/=
download/${PV}/${BP}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/<wbr>mesonbuild/meson/releases/<wbr>download/${PV}/${BP}.tar.gz</=
a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gtkdoc-fix-issues-<wb=
r>that-arise-when-cross-<wbr>compiling.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-gobject-<wbr>introspe=
ction-determine-g-ir-<wbr>scanner-and-g-i.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>b0d389cc5937928c2f5114656dc5a9<wbr>9a&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c513eca90e0d70bf14cd1eaafea2fa<wbr>91cf4=
0a73326a7ff61f08a00504805<wbr>7340&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/mesonbuild/meso=
n/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>me=
sonbuild/meson/releases</a>&quot;<br>
+<br>
+inherit setuptools3<br>
+<br>
+RDEPENDS_${PN} =3D &quot;ninja python3-core python3-modules&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c1fc0f830988c055e07bb75--
