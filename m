Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id DFA737C8E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 06:58:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z25so254402qti.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VoD112WR90A1xO2b6mHY+tCeS7HHeCbagyW3fdhEFS8=;
	b=GPq817LlPagbm9Yaeds7ajrKTtOwTN08yHf4sVRRlTJEpRFPEYSHY5h9jUxQacPP2t
	7YD04Qei7B57IyNXLsiP04kINPBiaU8GCoBz/kiekojxpMMt6QgTj000pENcFfCcmMz0
	Toqftjq4x85NZ9LJlmxYPynPJ7sfgUX6XJdF/NOZRMzIrILHd3/mjnS2Nx5qVQ05Y6T8
	pD9290j3kAF6oSGozFAkPcg7JEiiUprVlp3H09xeD8C7TZeWmSYjlWjszWb4Injq1rSR
	9vL3Lcoc+rW1Rqm2hHwNNDuuj4QNysqJNtQO6SVBRirJak4csEfuvAMhjC8Z5XMXgWfg
	F1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VoD112WR90A1xO2b6mHY+tCeS7HHeCbagyW3fdhEFS8=;
	b=reQSzE2csJbf8e/60ffYqmRkZxciIKBWN6uPiIY4/mbF6HczoJMb6BBl8ZuZKE8LfW
	GInGtCWmJZqk3u9NdIgKWnlZYZeCajxiMDdIYFm3EcEQU6lkSCVy3Skee8bWcN/TPuIV
	wBj0xH74MLzwI1tAr+ZrwlQEmRfWeHRF2AF0BWihyLgkkOmXARR2pLlVeSEUP5jalSMd
	Xonr179WaAj5Ifl9osq9KEepkg6gpxCmxOL8/NTYUcMLS3/kEfaaWxFuPQWM0L2QqSol
	ymDQgpMh/e4MAG8/st7sf9QyLqiqzvfeKcaGA6wpefrow+9ejbBWESufPgqNAVPPdVfB
	z3Vg==
X-Gm-Message-State: AHQUAuZGzMSSd0U2YlJfuPkPcpdZ/CrIkQFWhau7AACNNr9uSzQC8rjv
	rllsc35QCcRXJoKstf/TItuzFkbT5Nx2+R5ZUW8=
X-Google-Smtp-Source: AHgI3IaD7LFCPZykoPSRgLEKRX3NZbN7MlhZkA3U4iyifHfmooisAblaoqsNMbcHGJqrmUPwBo3ymkyPxurs9LXG7+s=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr20340039qvj.228.1550559484414;
	Mon, 18 Feb 2019 22:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20190218124108.7846-1-alex.kanavin@gmail.com>
	<20190218124108.7846-7-alex.kanavin@gmail.com>
In-Reply-To: <20190218124108.7846-7-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Feb 2019 22:57:38 -0800
Message-ID: <CAMKF1sp6eR8PRsjCw86vztJu3JJ2sYnQFPpQDwp9xbGOvyJ4AA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] glib-2.0: convert from autotools to meson
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
X-List-Received-Date: Tue, 19 Feb 2019 06:58:04 -0000
Content-Type: text/plain; charset="UTF-8"

seeing an error armv5te/thumb
https://errors.yoctoproject.org/Errors/Details/228765/

On Mon, Feb 18, 2019 at 4:42 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> PRINTF settings no longer seem necessary (tested with mingw).
>
> Add meson-specific bits to Enable-more-tests-while-cross-compiling.patch and
> 0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
>
> Add 0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> to allow 'mingw32' as target machine in addition to 'windows'.
>
> Drop configure-libtool.patch and uclibc_musl_translation.patch
> (both autotools-specific).
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...t-write-bindir-into-pkg-config-files.patch | 50 ++++++++++
>  ...-gio-querymodules-as-libexec_PROGRAM.patch | 17 +++-
>  ...-correctly-when-building-with-mingw3.patch | 81 +++++++++++++++++
>  ...ble-more-tests-while-cross-compiling.patch | 91 ++++++++++++++++++-
>  .../glib-2.0/glib-2.0/configure-libtool.patch | 44 ---------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
>  .../glib-2.0/uclibc_musl_translation.patch    | 22 -----
>  meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb |  4 +-
>  meta/recipes-core/glib-2.0/glib.inc           | 33 ++++---
>  9 files changed, 256 insertions(+), 88 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
> new file mode 100644
> index 00000000000..ede29c90bab
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
> @@ -0,0 +1,50 @@
> +From 474e59abec88de0c455836c1f53152bf2aa26c34 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 15 Feb 2019 11:17:27 +0100
> +Subject: [PATCH] Do not write $bindir into pkg-config files
> +
> +This would otherwise break when using the files to build other target
> +components (we need to rely on PATH containing the paths to utilities,
> +rather than use target paths).
> +
> +Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + gio/meson.build  | 6 +++---
> + glib/meson.build | 6 +++---
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/gio/meson.build b/gio/meson.build
> +index 85d8b14..657720a 100644
> +--- a/gio/meson.build
> ++++ b/gio/meson.build
> +@@ -813,9 +813,9 @@ pkg.generate(libraries : libgio,
> +                'schemasdir=' + join_paths('${datadir}', schemas_subdir),
> +                'bindir=' + join_paths('${prefix}', get_option('bindir')),
> +                'giomoduledir=' + giomodulesdir,
> +-               'glib_compile_schemas=' + join_paths('${bindir}', 'glib-compile-schemas'),
> +-               'glib_compile_resources=' + join_paths('${bindir}', 'glib-compile-resources'),
> +-               'gdbus_codegen=' + join_paths('${bindir}', 'gdbus-codegen')],
> ++               'glib_compile_schemas=glib-compile-schemas',
> ++               'glib_compile_resources=glib-compile-resources',
> ++               'gdbus_codegen=gdbus-codegen'],
> +   version : glib_version,
> +   install_dir : glib_pkgconfigreldir,
> +   filebase : 'gio-2.0',
> +diff --git a/glib/meson.build b/glib/meson.build
> +index c05c694..434e8b1 100644
> +--- a/glib/meson.build
> ++++ b/glib/meson.build
> +@@ -261,9 +261,9 @@ pkg.generate(libraries : [libglib, libintl],
> +   subdirs : ['glib-2.0'],
> +   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
> +   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
> +-               'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
> +-               'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
> +-               'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
> ++               'glib_genmarshal=glib-genmarshal',
> ++               'gobject_query=gobject-query',
> ++               'glib_mkenums=glib-mkenums'],
> +   version : glib_version,
> +   install_dir : glib_pkgconfigreldir,
> +   filebase : 'glib-2.0',
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
> index 97d0aff5d6c..f246254942e 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
> @@ -1,4 +1,4 @@
> -From 856045927b9ab391165c0ebabf401835f8439eab Mon Sep 17 00:00:00 2001
> +From 17fc9230fb932432d8faaaabf8c56fdc4845495e Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Tue, 22 Mar 2016 15:14:58 +0200
>  Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
> @@ -11,7 +11,8 @@ Upstream-Status: Inappropriate [OE specific]
>
>  ---
>   gio/Makefile.am | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> + gio/meson.build | 1 +
> + 2 files changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/gio/Makefile.am b/gio/Makefile.am
>  index e14cad2..bf2bcc7 100644
> @@ -27,3 +28,15 @@ index e14cad2..bf2bcc7 100644
>
>   glib_compile_resources_LDADD = libgio-2.0.la          \
>         $(top_builddir)/gobject/libgobject-2.0.la       \
> +diff --git a/gio/meson.build b/gio/meson.build
> +index b83d8f5..85d8b14 100644
> +--- a/gio/meson.build
> ++++ b/gio/meson.build
> +@@ -925,6 +925,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
> +   c_args : gio_c_args,
> +   # intl.lib is not compatible with SAFESEH
> +   link_args : noseh_link_args,
> ++  install_dir: glib_libexecdir,
> +   dependencies : [libgio_dep, libgobject_dep, libgmodule_dep, libglib_dep])
> +
> + glib_compile_schemas = executable('glib-compile-schemas',
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> new file mode 100644
> index 00000000000..17fe133fea9
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> @@ -0,0 +1,81 @@
> +From 133e2d15917c29268f9ca204424d12ad04a1ed99 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 13 Feb 2019 15:32:05 +0100
> +Subject: [PATCH] Set host_machine correctly when building with mingw32
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + gio/tests/meson.build  | 6 +++---
> + glib/tests/meson.build | 4 ++--
> + meson.build            | 3 +++
> + 3 files changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> +index 181f5c7..88a6c55 100644
> +--- a/gio/tests/meson.build
> ++++ b/gio/tests/meson.build
> +@@ -122,7 +122,7 @@ if dbus1_dep.found()
> + endif
> +
> + #  Test programs buildable on UNIX only
> +-if host_machine.system() != 'windows'
> ++if host_system != 'windows'
> +   gio_tests += [{
> +     'file' : {},
> +     'gdbus-peer' : {
> +@@ -314,7 +314,7 @@ if host_machine.system() != 'windows'
> + endif # unix
> +
> + #  Test programs buildable on Windows only
> +-if host_machine.system() == 'windows'
> ++if host_system == 'windows'
> +   gio_tests += [{'win32-streams' : {}}]
> + endif
> +
> +@@ -379,7 +379,7 @@ if cc.get_id() != 'msvc'
> +   }]
> + endif
> +
> +-if host_machine.system() != 'windows'
> ++if host_system != 'windows'
> +   test_extra_programs += [{
> +     'gdbus-example-unix-fd-client' : {
> +       'install' : false,
> +diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> +index d7b6a7a..6678a08 100644
> +--- a/glib/tests/meson.build
> ++++ b/glib/tests/meson.build
> +@@ -45,7 +45,7 @@ glib_tests = {
> +   'hook' : {},
> +   'hostutils' : {},
> +   'include' : {
> +-    'skip' : host_machine.system() == 'windows',
> ++    'skip' : host_system == 'windows',
> +   },
> +   'keyfile' : {},
> +   'list' : {},
> +@@ -112,7 +112,7 @@ glib_tests = {
> +   'utils' : {},
> +   'unicode' : {},
> +   'unix' : {
> +-    'skip' : host_machine.system() == 'windows',
> ++    'skip' : host_system == 'windows',
> +   },
> +   'uri' : {},
> +   '1bit-mutex' : {},
> +diff --git a/meson.build b/meson.build
> +index f7405a2..4348f20 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -31,6 +31,9 @@ else
> + endif
> +
> + host_system = host_machine.system()
> ++if host_system == 'mingw32'
> ++  host_system = 'windows'
> ++endif
> +
> + glib_version = meson.project_version()
> + glib_api_version = '2.0'
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
> index 50608809264..5ccd3203fb2 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
> @@ -1,4 +1,4 @@
> -From 70e462e070f8eb20b7660c1cf88271c0449e43cc Mon Sep 17 00:00:00 2001
> +From 1481c6d5f08f9dbbe10abc87b372a1f61db36476 Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Mon, 9 Nov 2015 11:07:27 +0200
>  Subject: [PATCH] Enable more tests while cross-compiling
> @@ -10,8 +10,10 @@ case we can depend on glib-2.0-native.
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  ---
> - gio/tests/Makefile.am | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> + gio/tests/Makefile.am     | 10 ++++++----
> + gio/tests/meson.build     | 15 ++++++++-------
> + tests/gobject/Makefile.am |  6 ++++++
> + 3 files changed, 20 insertions(+), 11 deletions(-)
>
>  diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
>  index c4e7a92..633e85c 100644
> @@ -50,3 +52,86 @@ index c4e7a92..633e85c 100644
>
>   BUILT_SOURCES += giotypefuncs.inc
>
> +diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> +index dca33bd..181f5c7 100644
> +--- a/gio/tests/meson.build
> ++++ b/gio/tests/meson.build
> +@@ -173,7 +173,7 @@ if host_machine.system() != 'windows'
> +
> +   #  Test programs that need to bring up a session bus (requires dbus-daemon)
> +   have_dbus_daemon = find_program('dbus-daemon', required : false).found()
> +-  if have_dbus_daemon
> ++  if true
> +     annotate_args = [
> +       '--annotate', 'org.project.Bar', 'Key1', 'Value1',
> +       '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
> +@@ -406,12 +406,13 @@ if installed_tests_enabled
> +   install_subdir('cert-tests', install_dir : installed_tests_execdir)
> + endif
> +
> +-if not meson.is_cross_build() or meson.has_exe_wrapper()
> ++#if not meson.is_cross_build() or meson.has_exe_wrapper()
> ++if meson.is_cross_build()
> +
> +   plugin_resources_c = custom_target('plugin-resources.c',
> +     input : 'test4.gresource.xml',
> +     output : 'plugin-resources.c',
> +-    command : [glib_compile_resources,
> ++    command : ['glib-compile-resources',
> +                '--target=@OUTPUT@',
> +                '--sourcedir=' + meson.current_source_dir(),
> +                '--generate-source',
> +@@ -428,7 +429,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +   test_gresource = custom_target('test.gresource',
> +     input : 'test.gresource.xml',
> +     output : 'test.gresource',
> +-    command : [glib_compile_resources,
> ++    command : ['glib-compile-resources',
> +                '--target=@OUTPUT@',
> +                '--sourcedir=' + meson.current_source_dir(),
> +                '--sourcedir=' + meson.current_build_dir(),
> +@@ -439,7 +440,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +   test_resources2_c = custom_target('test_resources2.c',
> +     input : 'test3.gresource.xml',
> +     output : 'test_resources2.c',
> +-    command : [glib_compile_resources,
> ++    command : ['glib-compile-resources',
> +                '--target=@OUTPUT@',
> +                '--sourcedir=' + meson.current_source_dir(),
> +                '--generate',
> +@@ -450,7 +451,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +   test_resources2_h = custom_target('test_resources2.h',
> +     input : 'test3.gresource.xml',
> +     output : 'test_resources2.h',
> +-    command : [glib_compile_resources,
> ++    command : ['glib-compile-resources',
> +                '--target=@OUTPUT@',
> +                '--sourcedir=' + meson.current_source_dir(),
> +                '--generate',
> +@@ -461,7 +462,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +   test_resources_c = custom_target('test_resources.c',
> +     input : 'test2.gresource.xml',
> +     output : 'test_resources.c',
> +-    command : [glib_compile_resources,
> ++    command : ['glib-compile-resources',
> +                '--target=@OUTPUT@',
> +                '--sourcedir=' + meson.current_source_dir(),
> +                '--generate-source',
> +diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
> +index 1bcefbe..77e646a 100644
> +--- a/tests/gobject/Makefile.am
> ++++ b/tests/gobject/Makefile.am
> +@@ -51,7 +51,13 @@ if ENABLE_TIMELOOP
> + installed_test_programs += timeloop-closure
> + endif
> +
> ++# The marshal test requires running a binary, which means we require
> ++# glib-native when cross-compiling
> ++if !CROSS_COMPILING
> + glib_genmarshal=$(top_builddir)/gobject/glib-genmarshal
> ++else
> ++glib_genmarshal=$(shell which glib-genmarshal)
> ++endif
> +
> + testmarshal.h: stamp-testmarshal.h
> +       @true
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> deleted file mode 100644
> index 59b891347da..00000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 1dd1e6ddca5deada049bac2e1ee1fe4ecc5342c5 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 28 Apr 2012 18:24:50 +0200
> -Subject: [PATCH 01/10] configure: use $host_alias-libtool instead of libtool
> - directly
> -
> -Poky renames libtool to $host_alias-libtool.
> -./$host_alias-libtool isn't created until after configure runs with
> -libtool >= 2.2.2
> -so we can't call # it at this point. We can safely assume a version is
> -available
> -from PATH though
> -
> -Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
> -Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
> -Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 6fa6eb0..b6f78a6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1428,9 +1428,9 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
> -       LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
> - dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
> -       echo "void glib_plugin_test(void) { }" > plugin.c
> --      ${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
> -+      ${SHELL} ./$host_alias-libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
> -               ${CPPFLAGS} -c -o plugin.lo plugin.c >/dev/null 2>&1
> --      ${SHELL} ./libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
> -+      ${SHELL} ./$host_alias-libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
> -               ${LDFLAGS} -module -o plugin.la -export-dynamic \
> -               -shrext ".o" -avoid-version plugin.lo \
> -               -rpath /dont/care >/dev/null 2>&1
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index 9ec011a0950..d62429b9729 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -1,4 +1,4 @@
> -From 43967e85b7a87f9c2e780504ef30f4c9bf56f8f5 Mon Sep 17 00:00:00 2001
> +From ca9ab8975e46217fdb391610a07b8b16986b5a19 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Fri, 11 Mar 2016 15:35:55 +0000
>  Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch b/meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
> deleted file mode 100644
> index 7aa6217d693..00000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Fix DATADIRNAME on uclibc/Linux
> -
> -translation files are always installed under PREFIX/share/locale in uclibc
> -based systems therefore lets set DATADIRNAME to "share".
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -Index: glib-2.46.1/m4macros/glib-gettext.m4
> -===================================================================
> ---- glib-2.46.1.orig/m4macros/glib-gettext.m4
> -+++ glib-2.46.1/m4macros/glib-gettext.m4
> -@@ -243,6 +243,10 @@ msgstr ""
> -           CATOBJEXT=.mo
> -             DATADIRNAME=share
> -           ;;
> -+          *-*-musl* | *-*-linux-uclibc*)
> -+          CATOBJEXT=.gmo
> -+            DATADIRNAME=share
> -+          ;;
> -           *)
> -           CATOBJEXT=.mo
> -             DATADIRNAME=lib
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> index 8aad570fa9d..9bc18dac7ee 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> @@ -5,15 +5,15 @@ PE = "1"
>  SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>
>  SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> -           file://configure-libtool.patch \
>             file://run-ptest \
> -           file://uclibc_musl_translation.patch \
>             file://Enable-more-tests-while-cross-compiling.patch \
>             file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
>             file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
>             file://0001-Do-not-ignore-return-value-of-write.patch \
>             file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
>             file://0001-Revert-Use-absolute-paths-in-pkg-config-files.patch \
> +           file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
> +           file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index a186c1d9eb6..b57fb698684 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -29,7 +29,11 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
>
>  LEAD_SONAME = "libglib-2.0.*"
>
> -inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
> +inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
> +
> +# This avoids the need to depend on target python3, which in case of mingw is not even possible.
> +# meson's python configuration pokes into python3 configuration, so this provides the native config to it.
> +unset _PYTHON_SYSCONFIGDATA_NAME
>
>  REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) else ''}"
>
> @@ -37,21 +41,17 @@ S = "${WORKDIR}/glib-${PV}"
>
>  PACKAGECONFIG ??= "system-pcre libmount"
>  # To use the system pcre it must be configured with --enable-unicode-properties
> -PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
> -PACKAGECONFIG[libmount] = "--enable-libmount,--disable-libmount,util-linux"
> -PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
> -PACKAGECONFIG[libelf] = "--enable-libelf,--disable-libelf,elfutils"
> -
> -CORECONF = "--disable-dtrace --disable-fam --disable-systemtap"
> +PACKAGECONFIG[system-pcre] = "-Dinternal_pcre=false,-Dinternal_pcre=true,libpcre"
> +PACKAGECONFIG[libmount] = "-Dlibmount=true,-Dlibmount=false,util-linux"
> +PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
> +# libelf is auto-detected without a configuration option
> +PACKAGECONFIG[libelf] = ",,elfutils"
>
> -PRINTF = "--enable-included-printf=no"
> -PRINTF_darwin = "--enable-included-printf=yes"
> -PRINTF_mingw32 = "--enable-included-printf=yes"
> -EXTRA_OECONF = "${PRINTF} ${CORECONF}"
> -EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
> +CORECONF = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
>
> -# Tell configure that we'll have dbus-daemon on the target for the tests
> -EXTRA_OECONF_append_class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ac_cv_prog_DBUS_DAEMON=dbus-daemon', '', d)}"
> +EXTRA_OEMESON = "${CORECONF} ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstalled_tests=true', '-Dinstalled_tests=false', d)}"
> +EXTRA_OEMESON_class-native = "${CORECONF} -Dinstalled_tests=false"
> +EXTRA_OEMESON_class-nativesdk = "${CORECONF} -Dinstalled_tests=false"
>
>  do_configure_prepend() {
>         sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
> @@ -129,6 +129,11 @@ do_install_append_class-target () {
>         fi
>  }
>
> +# As we do not build python3 for windows, makes no sense to ship the script that's using it
> +do_install_append_mingw32() {
> +        rm -f ${D}${bindir}/gtester-report
> +}
> +
>  CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
>  CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

