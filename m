Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 56C717F02F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 21:00:13 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j31so19226318qta.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 14:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bzSD5wnWxZuHRVU5SW0rvMWI2Kw6C+lFjA5lymWbk6c=;
	b=ExNmoq8kSv+CoVMePArhN7cqnfDIaMsjzslD39/v8bBklky3E219nkuGl//2wUi2R3
	0u/jkLavD2O2DWyC5ePHV9KnBQ+8ofjF7xjzOCPrK58feaB+vStuP3PE/20Il2S3PirD
	y0cylC3UBn2EOPdj9Q0ZGdaoCHb9mVRPRp9qSfwsfX3Dmm0VV8DWXqxDYaMdz2zTUg1Z
	sCc2Mfa1Nc00ZL2rXQ5vKtvjSEQ3qrklZ8rqvVfdiougnMcsZSZXKszM51w0jh6BtNVh
	HAI3ocphyCxKeEif2KOAGtGUlcu7LgsU6oYeoHo5BD4RiIX35g+owfCt18URsHAJBDQm
	bMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bzSD5wnWxZuHRVU5SW0rvMWI2Kw6C+lFjA5lymWbk6c=;
	b=SPF6E0xwku/kRQGIuCHeI6NipsZRYkXyuFsrttqB0gsnuCUAqEriFcuutuLzJi6zS6
	ZvEPvwx5yL5waB/kqstk480u7+//vWq43oXdfAVsITX1sQb1bgeqzvNI6XhcqhP4reaa
	o3OFBwh3RXuPdVrLDwkxHPQzexQr5byC8xtyrMr4Sooy1h4M+Qns/AvQNZ8BF1/Mx6VL
	jbRYlQ6/kuqxrSFDL9PH32TsUEKVZk2ySUgXbcpYqit/trsCSXzhOCxG8rAxFTMMKJJf
	2ufyZtS1McNM94/GbBluu1EYx4eWfidlLy4XGHGt/cE0hvIBS7P3KEVV/xBGwfrSt76W
	kShQ==
X-Gm-Message-State: APjAAAVWOWoKVXw4o5XOYLHQR7ZToGxRQFHO0vLICg3qGFchqkPwAh/2
	hVfD54Hg5HEnSoJcZOTHLgAtoeReYCnGEJdPLHQ=
X-Google-Smtp-Source: APXvYqwOJsvErCerenZYmhp0RxAJJNwDzHRhUstrN+B5LaTxrrtTSfnkouo8pUfLtHvZ9lY9F5daJlPNQCvj651hTTA=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr10191350qtr.378.1570914013429;
	Sat, 12 Oct 2019 14:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-5-alex.kanavin@gmail.com>
In-Reply-To: <20191011114754.91740-5-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Oct 2019 13:59:46 -0700
Message-ID: <CAMKF1spJaf-71+baeSXbSXncrVkskJ-fyz7hSbwjh0ai12VXgg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/19] glib-2.0: upgrade to 2.62.1
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
X-List-Received-Date: Sat, 12 Oct 2019 21:00:13 -0000
Content-Type: text/plain; charset="UTF-8"

Regresses, on riscv

https://errors.yoctoproject.org/Errors/Details/273482/

On Fri, Oct 11, 2019 at 4:49 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop backported 0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch
> and 0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch where
> upstream has removed the problematic bit.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...t-write-bindir-into-pkg-config-files.patch | 31 +++++++---
>  ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch | 34 ++++++++++
>  ...-correctly-when-building-with-mingw3.patch | 22 +++----
>  ...-time-check-for-strlcpy-before-attem.patch | 62 -------------------
>  ...ot-hardcode-linux-as-the-host-system.patch | 27 --------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 +--
>  .../glib-2.0/uclibc_musl_translation.patch    | 22 -------
>  ...{glib-2.0_2.60.7.bb => glib-2.0_2.62.1.bb} |  8 +--
>  meta/recipes-core/glib-2.0/glib.inc           |  2 +
>  9 files changed, 75 insertions(+), 141 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.7.bb => glib-2.0_2.62.1.bb} (69%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
> index ede29c90bab..edac4c9f75d 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
> @@ -1,4 +1,4 @@
> -From 474e59abec88de0c455836c1f53152bf2aa26c34 Mon Sep 17 00:00:00 2001
> +From 60b36289ac314ad972cf81c1acd19f6f2e58ff25 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 15 Feb 2019 11:17:27 +0100
>  Subject: [PATCH] Do not write $bindir into pkg-config files
> @@ -9,33 +9,44 @@ rather than use target paths).
>
>  Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - gio/meson.build  | 6 +++---
> - glib/meson.build | 6 +++---
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> + gio/meson.build  | 16 ++++++++--------
> + glib/meson.build |  6 +++---
> + 2 files changed, 11 insertions(+), 11 deletions(-)
>
>  diff --git a/gio/meson.build b/gio/meson.build
> -index 85d8b14..657720a 100644
> +index 71e88c4..8ce3987 100644
>  --- a/gio/meson.build
>  +++ b/gio/meson.build
> -@@ -813,9 +813,9 @@ pkg.generate(libraries : libgio,
> +@@ -831,14 +831,14 @@ pkg.generate(libgio,
>                  'schemasdir=' + join_paths('${datadir}', schemas_subdir),
>                  'bindir=' + join_paths('${prefix}', get_option('bindir')),
>                  'giomoduledir=' + giomodulesdir,
> +-               'gio=' + join_paths('${bindir}', 'gio'),
> +-               'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
>  -               'glib_compile_schemas=' + join_paths('${bindir}', 'glib-compile-schemas'),
>  -               'glib_compile_resources=' + join_paths('${bindir}', 'glib-compile-resources'),
> --               'gdbus_codegen=' + join_paths('${bindir}', 'gdbus-codegen')],
> +-               'gdbus=' + join_paths('${bindir}', 'gdbus'),
> +-               'gdbus_codegen=' + join_paths('${bindir}', 'gdbus-codegen'),
> +-               'gresource=' + join_paths('${bindir}', 'gresource'),
> +-               'gsettings=' + join_paths('${bindir}', 'gsettings')],
> ++               'gio=gio',
> ++               'gio_querymodules=gio-querymodules',
>  +               'glib_compile_schemas=glib-compile-schemas',
>  +               'glib_compile_resources=glib-compile-resources',
> -+               'gdbus_codegen=gdbus-codegen'],
> ++               'gdbus=gdbus',
> ++               'gdbus_codegen=gdbus-codegen',
> ++               'gresource=gresource',
> ++               'gsettings=gsettings'],
>     version : glib_version,
>     install_dir : glib_pkgconfigreldir,
>     filebase : 'gio-2.0',
>  diff --git a/glib/meson.build b/glib/meson.build
> -index c05c694..434e8b1 100644
> +index 91a48f1..978fb73 100644
>  --- a/glib/meson.build
>  +++ b/glib/meson.build
> -@@ -261,9 +261,9 @@ pkg.generate(libraries : [libglib, libintl],
> +@@ -375,9 +375,9 @@ pkg.generate(libglib,
>     subdirs : ['glib-2.0'],
>     extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
>     variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
> new file mode 100644
> index 00000000000..d8cf269bb8e
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
> @@ -0,0 +1,34 @@
> +From 15f807481de53942525b48952c5b6bbb9fb66542 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 15 Mar 2014 22:42:29 -0700
> +Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
> +
> +translation files are always installed under PREFIX/share/locale in uclibc
> +based systems therefore lets set DATADIRNAME to "share".
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +%% original patch: uclibc_musl_translation.patch
> +---
> + m4macros/glib-gettext.m4 | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/m4macros/glib-gettext.m4 b/m4macros/glib-gettext.m4
> +index df6fbf0..47db864 100644
> +--- a/m4macros/glib-gettext.m4
> ++++ b/m4macros/glib-gettext.m4
> +@@ -293,6 +293,10 @@ msgstr ""
> +           CATOBJEXT=.mo
> +             DATADIRNAME=share
> +           ;;
> ++          *-*-musl* | *-*-linux-uclibc*)
> ++          CATOBJEXT=.gmo
> ++            DATADIRNAME=share
> ++          ;;
> +           *)
> +           CATOBJEXT=.mo
> +             DATADIRNAME=lib
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> index d22a646c5de..b02169e09ba 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> @@ -1,4 +1,4 @@
> -From f5a4b4c0579734923c9caf70944322efff57318b Mon Sep 17 00:00:00 2001
> +From cfff734af6bff6a30a649f784ecf698658c01884 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 13 Feb 2019 15:32:05 +0100
>  Subject: [PATCH] Set host_machine correctly when building with mingw32
> @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   4 files changed, 9 insertions(+), 6 deletions(-)
>
>  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> -index 028b196..217ccb1 100644
> +index 95aafc1..9025eb2 100644
>  --- a/gio/tests/meson.build
>  +++ b/gio/tests/meson.build
> -@@ -12,7 +12,7 @@ test_c_args = [
> -   '-DGLIB_COMPILE_SCHEMAS="@0@"'.format(glib_compile_schemas.full_path()),
> +@@ -13,7 +13,7 @@ test_c_args = [
> +   '-UG_DISABLE_ASSERT',
>   ]
>
>  -if host_machine.system() == 'windows'
> @@ -26,7 +26,7 @@ index 028b196..217ccb1 100644
>     common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
>   endif
>
> -@@ -119,7 +119,7 @@ if dbus1_dep.found()
> +@@ -120,7 +120,7 @@ if dbus1_dep.found()
>   endif
>
>   #  Test programs buildable on UNIX only
> @@ -35,7 +35,7 @@ index 028b196..217ccb1 100644
>     gio_tests += {
>       'file' : {},
>       'gdbus-peer' : {
> -@@ -327,7 +327,7 @@ if host_machine.system() != 'windows'
> +@@ -332,7 +332,7 @@ if host_machine.system() != 'windows'
>   endif # unix
>
>   #  Test programs buildable on Windows only
> @@ -44,7 +44,7 @@ index 028b196..217ccb1 100644
>     gio_tests += {'win32-streams' : {}}
>   endif
>
> -@@ -392,7 +392,7 @@ if cc.get_id() != 'msvc'
> +@@ -397,7 +397,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
>     }
>   endif
>
> @@ -54,7 +54,7 @@ index 028b196..217ccb1 100644
>       'gdbus-example-unix-fd-client' : {
>         'install' : false,
>  diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> -index d54fc41..a4761fe 100644
> +index c47133f..cad975f 100644
>  --- a/glib/tests/meson.build
>  +++ b/glib/tests/meson.build
>  @@ -132,7 +132,7 @@ if glib_conf.has('HAVE_EVENTFD')
> @@ -67,10 +67,10 @@ index d54fc41..a4761fe 100644
>       glib_tests += {
>         'gpoll' : {
>  diff --git a/meson.build b/meson.build
> -index a745024..e87eae5 100644
> +index 717d1bc..2a3beb8 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -31,6 +31,9 @@ else
> +@@ -32,6 +32,9 @@ else
>   endif
>
>   host_system = host_machine.system()
> @@ -81,7 +81,7 @@ index a745024..e87eae5 100644
>   glib_version = meson.project_version()
>   glib_api_version = '2.0'
>  diff --git a/tests/meson.build b/tests/meson.build
> -index 11075dd..cd6067b 100644
> +index ce30442..5710f2c 100644
>  --- a/tests/meson.build
>  +++ b/tests/meson.build
>  @@ -66,7 +66,7 @@ test_extra_programs = {
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch
> deleted file mode 100644
> index d1ed028759a..00000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Upstream-Status: Backport [fc88e56bfc2b09a8fb2b350e76f6425ab0a056d7]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 141acf6a2f3b21d63c9cfe620b8e20a506e78493 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Wed, 13 Mar 2019 16:22:09 +0000
> -Subject: [PATCH] meson: do a build-time check for strlcpy before attempting
> - runtime check
> -
> -In cross-compilation environments the runtime check isn't possible so it is up
> -to the builder to seed the cross file, but we can definitely state that strlcpy
> -doesn't exist with a build test.
> ----
> - meson.build | 30 ++++++++++++++++--------------
> - 1 file changed, 16 insertions(+), 14 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 15039e448..414f2d9b1 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1860,22 +1860,24 @@ endif
> -
> - # Test if we have strlcpy/strlcat with a compatible implementation:
> - # https://bugzilla.gnome.org/show_bug.cgi?id=53933
> --if cc_can_run
> --  rres = cc.run('''#include <stdlib.h>
> --                   #include <string.h>
> --                   int main() {
> --                     char p[10];
> --                     (void) strlcpy (p, "hi", 10);
> --                     if (strlcat (p, "bye", 0) != 3)
> --                       return 1;
> --                     return 0;
> --                   }''',
> --                name : 'OpenBSD strlcpy/strlcat')
> --  if rres.compiled() and rres.returncode() == 0
> -+if cc.has_function('strlcpy')
> -+  if cc_can_run
> -+    rres = cc.run('''#include <stdlib.h>
> -+                    #include <string.h>
> -+                    int main() {
> -+                      char p[10];
> -+                      (void) strlcpy (p, "hi", 10);
> -+                      if (strlcat (p, "bye", 0) != 3)
> -+                        return 1;
> -+                      return 0;
> -+                    }''',
> -+                  name : 'OpenBSD strlcpy/strlcat')
> -+    if rres.compiled() and rres.returncode() == 0
> -+      glib_conf.set('HAVE_STRLCPY', 1)
> -+    endif
> -+  elif meson.get_cross_property('have_strlcpy', false)
> -     glib_conf.set('HAVE_STRLCPY', 1)
> -   endif
> --elif meson.get_cross_property('have_strlcpy', false)
> --  glib_conf.set('HAVE_STRLCPY', 1)
> - endif
> -
> - python = import('python').find_installation('python3')
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> deleted file mode 100644
> index 5a1a5898908..00000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 635fe26af51f20194c8b208e7d01303be1086d68 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 19 Feb 2019 10:31:11 +0100
> -Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
> -
> -OE build system can set this to other values that include 'linux',
> -e.g. 'linux-gnueabi'
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 4348f20..af5ed63 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1574,7 +1574,7 @@ atomicdefine = '''
> - # We know that we can always use real ("lock free") atomic operations with MSVC
> - if cc.get_id() == 'msvc' or cc.links(atomictest, name : 'atomic ops')
> -   have_atomic_lock_free = true
> --  if (host_system == 'android' or host_system == 'linux') and not cc.compiles(atomicdefine, name : 'atomic ops define')
> -+  if (host_system == 'android' or host_system.contains('linux')) and not cc.compiles(atomicdefine, name : 'atomic ops define')
> -     # When building for armv5 on Linux, gcc provides
> -     # __sync_bool_compare_and_swap but doesn't define
> -     # __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index 380bee086c0..7e9925845bb 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -1,4 +1,4 @@
> -From 9c5d6e6ce5254a5f050bba2118a4a1807292c02a Mon Sep 17 00:00:00 2001
> +From 6325bf4e8a2f569c55c8e1a36b9439d3566f98f6 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Fri, 11 Mar 2016 15:35:55 +0000
>  Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
> @@ -19,10 +19,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
>  diff --git a/gio/giomodule.c b/gio/giomodule.c
> -index b92162d..fce9933 100644
> +index 1007abd..5380982 100644
>  --- a/gio/giomodule.c
>  +++ b/gio/giomodule.c
> -@@ -40,6 +40,8 @@
> +@@ -44,6 +44,8 @@
>   #include "gnetworkmonitor.h"
>   #ifdef G_OS_WIN32
>   #include "gregistrysettingsbackend.h"
> @@ -31,7 +31,7 @@ index b92162d..fce9933 100644
>   #endif
>   #include <glib/gstdio.h>
>
> -@@ -1156,7 +1158,15 @@ get_gio_module_dir (void)
> +@@ -1158,7 +1160,15 @@ get_gio_module_dir (void)
>   #endif
>         g_free (install_dir);
>   #else
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
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
> similarity index 69%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
> index 740473719d8..6d841ec9d9b 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
> @@ -6,7 +6,7 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>
>  SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://run-ptest \
> -           file://uclibc_musl_translation.patch \
> +           file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
>             file://Enable-more-tests-while-cross-compiling.patch \
>             file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
>             file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
> @@ -14,12 +14,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
>             file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
> -           file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
> -           file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
>  SRC_URI_append_class-target = " file://glib-meson.cross"
>
> -SRC_URI[md5sum] = "f036f78a7fca330d9f7d939fcf794bde"
> -SRC_URI[sha256sum] = "8b12c0af569afd3b71200556ad751bad4cf4bf7bc4b5f880638459a42ca86310"
> +SRC_URI[md5sum] = "64c14b4fe46c478992560c2f48a5b649"
> +SRC_URI[sha256sum] = "3dd9024e1d0872a6da7ac509937ccf997161b11d7d35be337c7e829cbae0f9df"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 3ae22f5e807..8b95f212047 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -158,6 +158,8 @@ RDEPENDS_${PN}-ptest += "\
>              ${PN}-locale-pl \
>              ${PN}-locale-ru \
>              ${PN}-locale-th \
> +            python3-core \
> +            python3-modules \
>             "
>
>  RDEPENDS_${PN}-ptest_append_libc-glibc = "\
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

