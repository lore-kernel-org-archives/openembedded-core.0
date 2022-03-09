Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF3CC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:53:08 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.216.1646844781253461193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xf0DQSyQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id h30so2988263vsq.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLLreI1FLM007nSrcUGaYgZylpV/8KK4b4+YWt2zZbg=;
        b=Xf0DQSyQCGj7jW3aFT1JDuUHZrx0tw104bqGQUXXxLyCJPNcTI1Uma5G/q1Qh3uWwq
         jcvr0kvpM4Pnv7y3lMYQVNUhTpSLL7FJU3DiV68R3GIvJDBUtkG7JfWnZo4/0v8WbneL
         3TdtOeaXYxj5NSSq8H9XveUZm5LcqLIyUNPdRwLMvzAeZgCPZDb0C8O1wobQVtAqB9It
         tSoouGNWtm2SB19RPOsh2OYFYveu20NjGcVXKgWBOWW+ZAa2Ulr+0p2i6AJXBMyxllFS
         /Qj2wI/uWGcDRk5hmuIs6JJhxP1cJuTDf5DmQr1KPLHzQuoZUgPay4spWOIglhrULFax
         8YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLLreI1FLM007nSrcUGaYgZylpV/8KK4b4+YWt2zZbg=;
        b=Reip3yWVLQSXVGtQ0S7Q4sSMb0CmCZgW7S0ms/OIofX0/mHz4x2ex3qZ9sJfJU3rQd
         eAnLPWN3G6QSPSUIKcVYcgKzqqUdlj1Pq73T1ZOV5AGxDHCBctd9yYoTkz4sSLuO3diH
         OwnIvqpN7QG3Rje5cIxO4i4IVe1iFAc2N3VMgW15e5jHwAb0dTeS7aJDv+Z0XVageqpN
         XzP4RlYz3EBqIXBIhX2rlaPwFyvM6hEe/+dOSBq2NW+kh7Cnq+FoMfHcwWXjCBuoDs6F
         swHucteFg6sIQFGGHjQyl8TaWI1CFIK+mzxNAQTKGpPcnkeJajUnu5q0DQdVaELPxHRf
         7GKg==
X-Gm-Message-State: AOAM531XAYBYQDIZXHLF0GFzq5JPHA6y8AHu5+OytXIxzUQb0KcpHR95
	T4Zzr+lWwnt/kSoBqQ1sTgHkMsSsCu1CYHDjnBdO8txT
X-Google-Smtp-Source: 
 ABdhPJwKTuubtManxRKvo0aPdJHxKg1HP93k4bu5pIbzR0FbOU0T8tAF1ArYQ7hP3E9wJX63WSoO/tR5h7XTMBPHOfw=
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr175658vsk.38.1646844780207; Wed, 09 Mar
 2022 08:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20220309161659.10526-1-ceggers@arri.de>
In-Reply-To: <20220309161659.10526-1-ceggers@arri.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Mar 2022 17:52:49 +0100
Message-ID: 
 <CANNYZj8Bp8VoLctKQ7nYoSa80GTHoy8+ZYuHeHkH1m-=hKHJSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: upgrade 2.70.4 -> 2.71.3
To: Christian Eggers <ceggers@arri.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:53:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162976

2.71.x is a development release, and should not be used. glib follows
odd-even version scheme.

Alex

On Wed, 9 Mar 2022 at 17:18, Christian Eggers <ceggers@arri.de> wrote:
>
> - 0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch:
>   dropped (integrated upstream)
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  ...-correctly-when-building-with-mingw3.patch | 32 +++++++------
>  ...degen.py-bump-timeout-to-100-seconds.patch | 26 ----------
>  ...ble-more-tests-while-cross-compiling.patch | 48 ++++++++++---------
>  ...{glib-2.0_2.70.4.bb => glib-2.0_2.71.3.bb} |  3 +-
>  4 files changed, 44 insertions(+), 65 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.4.bb => glib-2.0_2.71.3.bb} (93%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> index 8a6d46df799b..59de3fa969a4 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> @@ -1,11 +1,10 @@
> -From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 2001
> +From 4f327be49fd6ac5a77da6e48459b37f37a601977 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 13 Feb 2019 15:32:05 +0100
>  Subject: [PATCH] Set host_machine correctly when building with mingw32
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
>  ---
>   gio/tests/meson.build  | 8 ++++----
>   glib/tests/meson.build | 2 +-
> @@ -14,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   4 files changed, 9 insertions(+), 6 deletions(-)
>
>  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> -index 3a19c82..b762835 100644
> +index abe676767c60..34b347815308 100644
>  --- a/gio/tests/meson.build
>  +++ b/gio/tests/meson.build
> -@@ -27,7 +27,7 @@ test_c_args = [
> +@@ -27,7 +27,7 @@ if build_machine.system() == 'linux'
>     endif # libutil.length() > 0
>   endif # build_machine.system() == 'linux'
>
> @@ -26,7 +25,7 @@ index 3a19c82..b762835 100644
>     common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
>   endif
>
> -@@ -148,7 +148,7 @@ else
> +@@ -176,7 +176,7 @@ else
>   endif
>
>   #  Test programs buildable on UNIX only
> @@ -35,7 +34,7 @@ index 3a19c82..b762835 100644
>     gio_tests += {
>       'file' : {},
>       'gdbus-peer' : {
> -@@ -402,7 +402,7 @@ if host_machine.system() != 'windows'
> +@@ -434,7 +434,7 @@ if host_machine.system() != 'windows'
>   endif # unix
>
>   #  Test programs buildable on Windows only
> @@ -44,7 +43,7 @@ index 3a19c82..b762835 100644
>     gio_tests += {'win32-streams' : {}}
>   endif
>
> -@@ -472,7 +472,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
> +@@ -504,7 +504,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
>     }
>   endif
>
> @@ -54,10 +53,10 @@ index 3a19c82..b762835 100644
>       'gdbus-example-unix-fd-client' : {
>         'install' : false,
>  diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> -index 6eb23e8..36eb919 100644
> +index a0c64afe6ae9..48407f99569c 100644
>  --- a/glib/tests/meson.build
>  +++ b/glib/tests/meson.build
> -@@ -142,7 +142,7 @@ if glib_conf.has('HAVE_EVENTFD')
> +@@ -151,7 +151,7 @@ if glib_conf.has('HAVE_EVENTFD')
>     }
>   endif
>
> @@ -67,10 +66,10 @@ index 6eb23e8..36eb919 100644
>       glib_tests += {
>         'gpoll' : {
>  diff --git a/meson.build b/meson.build
> -index 47f3a5c..7ea7ad1 100644
> +index e0b14319fb58..f6756a3c7dfb 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -32,6 +32,9 @@ else
> +@@ -54,6 +54,9 @@ else
>   endif
>
>   host_system = host_machine.system()
> @@ -81,15 +80,18 @@ index 47f3a5c..7ea7ad1 100644
>   if host_system == 'darwin'
>     ios_test_code = '''#include <TargetConditionals.h>
>  diff --git a/tests/meson.build b/tests/meson.build
> -index 6741f8f..12fdc90 100644
> +index 5ff99a4a8258..8a4dad0ccae7 100644
>  --- a/tests/meson.build
>  +++ b/tests/meson.build
> -@@ -73,7 +73,7 @@ test_extra_programs = {
> -   'unicode-collate' : {},
> +@@ -53,7 +53,7 @@ test_extra_programs = {
> +   'assert-msg-test' : {},
>   }
>
>  -if host_machine.system() != 'windows'
>  +if host_system != 'windows'
>     tests += {
>       'timeloop' : {},
> -     'iochannel-test' : {},
> +   }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
> deleted file mode 100644
> index 7690bb37a6be..000000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From b833254bcc9fcf4cdc2572027b1154d799535ca4 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Sun, 20 Dec 2020 22:01:43 +0100
> -Subject: [PATCH] gio/tests/codegen.py: bump timeout to 100 seconds
> -
> -This may be necessary on overloaded CI systems.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2348]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - gio/tests/codegen.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gio/tests/codegen.py b/gio/tests/codegen.py
> -index 51de0ed..ca98c9d 100644
> ---- a/gio/tests/codegen.py
> -+++ b/gio/tests/codegen.py
> -@@ -55,7 +55,7 @@ class TestCodegen(unittest.TestCase):
> -     cwd = ""
> -
> -     def setUp(self):
> --        self.timeout_seconds = 10  # seconds per test
> -+        self.timeout_seconds = 100  # seconds per test
> -         self.tmpdir = tempfile.TemporaryDirectory()
> -         self.cwd = os.getcwd()
> -         os.chdir(self.tmpdir.name)
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
> index 9bbb33ffc16c..6147bdae462e 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
> @@ -1,4 +1,4 @@
> -From 73b1c416674d285b021e218da1a3ddb884e606da Mon Sep 17 00:00:00 2001
> +From d2d7af496b4f4a13779179dbcbb98de56b09783f Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Mon, 9 Nov 2015 11:07:27 +0200
>  Subject: [PATCH] Enable more tests while cross-compiling
> @@ -9,16 +9,15 @@ case we can depend on glib-2.0-native.
>
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -
>  ---
>   gio/tests/meson.build | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
>  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> -index 5dbfb8e..3fd7998 100644
> +index e8d10a0f11f2..abe676767c60 100644
>  --- a/gio/tests/meson.build
>  +++ b/gio/tests/meson.build
> -@@ -221,7 +221,7 @@ if host_machine.system() != 'windows'
> +@@ -250,7 +250,7 @@ if host_machine.system() != 'windows'
>
>     #  Test programs that need to bring up a session bus (requires dbus-daemon)
>     have_dbus_daemon = find_program('dbus-daemon', required : false).found()
> @@ -27,76 +26,78 @@ index 5dbfb8e..3fd7998 100644
>       annotate_args = [
>         '--annotate', 'org.project.Bar', 'Key1', 'Value1',
>         '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
> -@@ -570,12 +570,12 @@ if installed_tests_enabled
> +@@ -601,14 +601,14 @@ if installed_tests_enabled
>     endforeach
>   endif
>
>  -if not meson.is_cross_build() or meson.has_exe_wrapper()
>  +if meson.is_cross_build()
>
> +   compiler_type = '--compiler=@0@'.format(cc.get_id())
> +
>     plugin_resources_c = custom_target('plugin-resources.c',
>       input : 'test4.gresource.xml',
>       output : 'plugin-resources.c',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--generate-source',
> -@@ -599,7 +599,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -634,7 +634,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>     test_gresource = custom_target('test.gresource',
>       input : 'test.gresource.xml',
>       output : 'test.gresource',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--sourcedir=' + meson.current_build_dir(),
> -@@ -610,7 +610,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -647,7 +647,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>     test_resources2_c = custom_target('test_resources2.c',
>       input : 'test3.gresource.xml',
>       output : 'test_resources2.c',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--generate',
> -@@ -621,7 +621,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -660,7 +660,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>     test_resources2_h = custom_target('test_resources2.h',
>       input : 'test3.gresource.xml',
>       output : 'test_resources2.h',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--generate',
> -@@ -633,7 +633,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -674,7 +674,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>       input : 'test2.gresource.xml',
>       depends : big_test_resource,
>       output : 'test_resources.c',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--sourcedir=' + meson.current_build_dir(),
> -@@ -644,7 +644,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -687,7 +687,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>     digit_test_resources_c = custom_target('digit_test_resources.c',
>       input : '111_digit_test.gresource.xml',
>       output : 'digit_test_resources.c',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--sourcedir=' + meson.current_build_dir(),
> -@@ -655,7 +655,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -700,7 +700,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>     digit_test_resources_h = custom_target('digit_test_resources.h',
>       input : '111_digit_test.gresource.xml',
>       output : 'digit_test_resources.h',
>  -    command : [glib_compile_resources,
>  +    command : ['glib-compile-resources',
> +                compiler_type,
>                  '--target=@OUTPUT@',
>                  '--sourcedir=' + meson.current_source_dir(),
> -                '--generate',
> -@@ -688,11 +688,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -742,11 +742,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>
>     ld = find_program('ld', required : false)
>
> @@ -107,15 +108,18 @@ index 5dbfb8e..3fd7998 100644
>         output : 'test5.gresource',
>  -      command : [glib_compile_resources,
>  +      command : ['glib-compile-resources',
> +                  compiler_type,
>                    '--target=@OUTPUT@',
>                    '--sourcedir=' + meson.current_source_dir(),
> -                  '--sourcedir=' + meson.current_build_dir(),
> -@@ -704,7 +704,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
> +@@ -760,7 +760,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
>       test_resources_binary_c = custom_target('test_resources_binary.c',
>         input : 'test5.gresource.xml',
>         output : 'test_resources_binary.c',
>  -      command : [glib_compile_resources,
>  +      command : ['glib-compile-resources',
> +                  compiler_type,
>                    '--target=@OUTPUT@',
>                    '--sourcedir=' + meson.current_source_dir(),
> -                  '--sourcedir=' + meson.current_build_dir(),
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.71.3.bb
> similarity index 93%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.71.3.bb
> index 704d428f0449..cb9395b4e882 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.71.3.bb
> @@ -16,11 +16,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
>             file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
> -           file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch"
>
> -SRC_URI[sha256sum] = "ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33"
> +SRC_URI[sha256sum] = "288549404c26db3d52cf7a37f2f42b495b31ccffce2b4cb2439a64099c740343"
>
>  # Find any meson cross files in FILESPATH that are relevant for the current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162971): https://lists.openembedded.org/g/openembedded-core/message/162971
> Mute This Topic: https://lists.openembedded.org/mt/89665588/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

