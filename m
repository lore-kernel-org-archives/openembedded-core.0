Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.5272.1619434283871572009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 03:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X9TX5jPr;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id k19so14924749vsg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=skl7tIVet9TaOp6pbyT/NJyRZqaEO7aH6D/ESRLbsu0=;
        b=X9TX5jProVfTBXbvhIm6OF0vOwT+KLlodGEE7bhdXCp4SHobpCkCsLGLDU7WL7bHzS
         Y+5S8f3SRlPUiPCek0Sjqt01jq0yW9PZl5E1frOzqzzJFAttAfSVV0L3onaiHt5RKlHn
         kTyIdbc53xv1V5IfavIMRW+W83QMQnk8aaCQfaEClNgc7/wSWLG5RUWx6OIAMn0+oAja
         O8gHevw4aRWWin6PLkbjSUCsVqHpkp+SAyJ+36z1jOQMqoYxCJMJiBHV5v2le7eMS1m8
         Aablo+8+1614TtoLZXwmwA67qUkPaLWoLz4bODsNNpH/Tpquyi697Eb5nMC5uVUucCdA
         Qu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=skl7tIVet9TaOp6pbyT/NJyRZqaEO7aH6D/ESRLbsu0=;
        b=j5odWckhNaE6wD8ricG5gViqShjtf7Xhqx2LNxnuo7ev3bzGZv5O1ZpP4mZa6cHSUx
         Wu55PrSl0SQrGz9fVJEigw9guWlJawzWik/tBJ1qEsKZX7evnRi2qw0ceT5WGefbtW81
         tVP9/0DLBhSw8gF6A8NCvbD5P2fsARWbykFZlmhyyOI8S1oXBTOTPoSWpaDIPbNKo0gj
         OD1rURSlJme3g6cUqr+7JFYR2GEFiMrpjzvzy36DS8NWM/5eBd6UvidM8IEwkpbLP0Ea
         k+V2YmutyLnQNVRnwtBEvNtt4KFMEB9jDul7hBltp9ooHJ4/NFsCfyX9LKxxRwt1J7ZD
         Yt7Q==
X-Gm-Message-State: AOAM5302qc4Gio6ircMYNRO2xezTZU1nnCj6hzQkKiOgnkE+OIbI9LV7
	YEkkU/buzcphVNsW+i+hoIEWmQQZRQFGdqrfRd0=
X-Google-Smtp-Source: ABdhPJwce+KDV29jyrR6HgRU+Bm0S4AnmgN9XYx0/TqcT+Zhw23Y4T8Q9jYvZyG4tM/JNLl35jmsbh17uqXez5lWPHQ=
X-Received: by 2002:a67:483:: with SMTP id 125mr11123512vse.51.1619434282767;
 Mon, 26 Apr 2021 03:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210426005517.17904-1-changqing.li@windriver.com>
In-Reply-To: <20210426005517.17904-1-changqing.li@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 26 Apr 2021 12:51:11 +0200
Message-ID: <CANNYZj8kQmRWW3Bx22ADFiTbsY1R1f=bsKbjonwE5U-3HbfFZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdk-pixbuf: upgrade from 2.40.0 -> 2.42.6
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000029582d05c0ddeddb"

--00000000000029582d05c0ddeddb
Content-Type: text/plain; charset="UTF-8"

Thanks Changqing, I have an alternative update patch that also simplifies
the custom patch structure. If my approach doesn't work out, I'll take
yours, until then I'd like it to be on hold.

Alex

On Mon, 26 Apr 2021 at 02:55, Changqing Li <changqing.li@windriver.com>
wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...-around-thumbnailer-cross-compile-fa.patch | 61 ++++++++++---------
>  .../0004-Do-not-run-tests-when-building.patch | 21 +++----
>  ...ailer-and-tests-also-in-cross-builds.patch |  4 +-
>  .../gdk-pixbuf/CVE-2020-29385.patch           | 55 -----------------
>  .../gdk-pixbuf/missing-test-data.patch        | 30 ---------
>  ...-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.6.bb} | 14 ++---
>  6 files changed, 49 insertions(+), 136 deletions(-)
>  delete mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
>  delete mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.40.0.bb =>
> gdk-pixbuf_2.42.6.bb} (91%)
>
> diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> index a9c7600eb3..342c47cca3 100644
> ---
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> +++
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> @@ -1,4 +1,4 @@
> -From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 2001
> +From 483e6818e9aebc5637f41856e327995ef967c451 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 22 Feb 2019 13:22:06 +0100
>  Subject: [PATCH] (target only) Work-around thumbnailer and pixdata
> @@ -15,7 +15,6 @@ The upstream issue is
> https://bugzilla.gnome.org/show_bug.cgi?id=779057
>
>  Upstream-Status: Inappropriate [workaround]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
>  ---
>   build-aux/gen-thumbnailer.py |  2 --
>   tests/meson.build            | 11 +++++++++--
> @@ -36,13 +35,13 @@ index 05ac821..c5b99ab 100644
>   if os.name == 'nt':
>       gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
>  diff --git a/tests/meson.build b/tests/meson.build
> -index 8ed7cc1..e011b77 100644
> +index 3f3ee54..4100520 100644
>  --- a/tests/meson.build
>  +++ b/tests/meson.build
> -@@ -1,12 +1,19 @@
> - # Resources; we cannot use gnome.compile_resources() here, because we
> need to
> - # override the environment in order to use the utilities we just built
> instead
> - # of the system ones
> +@@ -8,13 +8,20 @@ if enabled_loaders.contains('png') and host_system !=
> 'windows'
> +   # Resources; we cannot use gnome.compile_resources() here, because we
> need to
> +   # override the environment in order to use the utilities we just built
> instead
> +   # of the system ones
>  +
>  +if not meson.is_cross_build()
>  +pixdata_binary = gdk_pixbuf_pixdata.full_path()
> @@ -50,30 +49,31 @@ index 8ed7cc1..e011b77 100644
>  +pixdata_binary = 'gdk-pixbuf-pixdata'
>  +endif
>  +
> - resources_c = custom_target('resources.c',
> -   input: 'resources.gresource.xml',
> -   output: 'resources.c',
> -   command: [
> -     gen_resources,
> --    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> -+    '--pixdata=@0@'.format(pixdata_binary),
> -     '--loaders=@0@'.format(loaders_cache.full_path()),
> -     '--sourcedir=@0@'.format(meson.current_source_dir()),
> -     '--source',
> -@@ -24,7 +31,7 @@ resources_h = custom_target('resources.h',
> -   output: 'resources.h',
> -   command: [
> -     gen_resources,
> --    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> -+    '--pixdata=@0@'.format(pixdata_binary),
> -     '--loaders=@0@'.format(loaders_cache.full_path()),
> -     '--sourcedir=@0@'.format(meson.current_source_dir()),
> -     '--header',
> +   resources_c = custom_target('resources.c',
> +     input: 'resources.gresource.xml',
> +     output: 'resources.c',
> +     command: [
> +       gen_resources,
> +       '--glib-compile-resources=@0@
> '.format(glib_compile_resources.full_path()),
> +-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> ++      '--pixdata=@0@'.format(pixdata_binary),
> +       '--loaders=@0@'.format(loaders_cache.full_path()),
> +       '--sourcedir=@0@'.format(meson.current_source_dir()),
> +       '--source',
> +@@ -33,7 +40,7 @@ if enabled_loaders.contains('png') and host_system !=
> 'windows'
> +     command: [
> +       gen_resources,
> +       '--glib-compile-resources=@0@
> '.format(glib_compile_resources.full_path()),
> +-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> ++      '--pixdata=@0@'.format(pixdata_binary),
> +       '--loaders=@0@'.format(loaders_cache.full_path()),
> +       '--sourcedir=@0@'.format(meson.current_source_dir()),
> +       '--header',
>  diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
> -index aaafec8..71bd61b 100644
> +index 8c741e0..4d98841 100644
>  --- a/thumbnailer/meson.build
>  +++ b/thumbnailer/meson.build
> -@@ -18,9 +18,7 @@ custom_target('thumbnailer',
> +@@ -19,9 +19,7 @@ custom_target('thumbnailer',
>                 output: 'gdk-pixbuf-thumbnailer.thumbnailer',
>                 command: [
>                   gen_thumbnailer,
> @@ -84,7 +84,7 @@ index aaafec8..71bd61b 100644
>                   '--bindir=@0@'.format(gdk_pixbuf_bindir),
>                   '@INPUT@',
>                   '@OUTPUT@',
> -@@ -28,7 +26,6 @@ custom_target('thumbnailer',
> +@@ -29,7 +27,6 @@ custom_target('thumbnailer',
>                 depends: [
>                   gdk_pixbuf_print_mime_types,
>                   gdk_pixbuf_pixdata,
> @@ -92,3 +92,6 @@ index aaafec8..71bd61b 100644
>                 ],
>                 install: true,
>                 install_dir: join_paths(gdk_pixbuf_datadir,
> 'thumbnailers'))
> +--
> +2.17.1
> +
> diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> index 96c546f271..9b41b77124 100644
> ---
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> +++
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> @@ -1,4 +1,4 @@
> -From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001
> +From c26a775a8e8efe5f9cf3e666cd51707fe69da203 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 22 Feb 2019 13:23:55 +0100
>  Subject: [PATCH] Do not run tests when building
> @@ -6,14 +6,14 @@ Subject: [PATCH] Do not run tests when building
>  Upstream-Status: Inappropriate [cross-compile specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>  ---
> - tests/meson.build | 17 -----------------
> - 1 file changed, 17 deletions(-)
> + tests/meson.build | 13 -------------
> + 1 file changed, 13 deletions(-)
>
>  diff --git a/tests/meson.build b/tests/meson.build
> -index 4fa3fbc..6ef7884 100644
> +index 7c6cb11..3f3ee54 100644
>  --- a/tests/meson.build
>  +++ b/tests/meson.build
> -@@ -138,23 +138,6 @@ foreach t: installed_tests
> +@@ -201,19 +201,6 @@ foreach test_name, test_data: installed_tests
>       install_dir: installed_test_bindir,
>     )
>
> @@ -26,14 +26,13 @@ index 4fa3fbc..6ef7884 100644
>  -
>  -  test(test_name, test_bin,
>  -    suite: test_suites,
> --    args: [ '-k', '--tap' ],
> --    env: [
> --      'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
> --      'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
> --      'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
> --    ],
> +-    args: test_args,
> +-    env: test_env,
>  -    timeout: timeout,
>  -  )
>   endforeach
>
>   executable('pixbuf-read',
> +--
> +2.17.1
> +
> diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> index 0fe13a387a..db4b039bd9 100644
> ---
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> +++
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> @@ -13,7 +13,7 @@ diff --git a/meson.build b/meson.build
>  index d104cea..7acb88a 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -397,10 +397,8 @@ endif
> +@@ -403,10 +403,8 @@ subdir('gdk-pixbuf')
>   # i18n
>   subdir('po')
>
> @@ -25,4 +25,4 @@ index d104cea..7acb88a 100644
>  +subdir('thumbnailer')
>
>   # Documentation
> - subdir('docs')
> + build_docs = get_option('gtk_doc') or get_option('docs')
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> deleted file mode 100644
> index 3fef2bc1eb..0000000000
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001
> -From: Robert Ancell <robert.ancell@canonical.com>
> -Date: Mon, 30 Nov 2020 12:26:12 +1300
> -Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.
> -
> -The code value after a reset wasn't being validated, which means we would
> -accept invalid codes. This could cause an infinite loop in the decoder.
> -
> -Fixes CVE-2020-29385
> -
> -Fixes https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164
> -
> -Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81
> ]
> -CVE: CVE-2020-29385
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> -
> ----
> - gdk-pixbuf/lzw.c                    |  13 +++++++------
> - 1 files changed, 7 insertions(+), 6 deletions(-)
> - create mode 100644 tests/test-images/fail/hang_114.gif
> -
> -diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
> -index 9e052a6f7..105daf2b1 100644
> ---- a/gdk-pixbuf/lzw.c
> -+++ b/gdk-pixbuf/lzw.c
> -@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,
> -                                 if (self->last_code != self->clear_code
> && self->code_table_size < MAX_CODES) {
> -                                         if (self->code <
> self->code_table_size)
> -                                                 add_code (self,
> self->code);
> --                                        else if (self->code ==
> self->code_table_size)
> -+                                        else
> -                                                 add_code (self,
> self->last_code);
> --                                        else {
> --                                                /* Invalid code received
> - just stop here */
> --                                                self->last_code =
> self->eoi_code;
> --                                                return output_length;
> --                                        }
> -
> -                                         /* When table is full increase
> code size */
> -                                         if (self->code_table_size == (1
> << self->code_size) && self->code_size < LZW_CODE_MAX)
> -                                                 self->code_size++;
> -                                 }
> -
> -+                                /* Invalid code received - just stop
> here */
> -+                                if (self->code >= self->code_table_size)
> {
> -+                                        self->last_code = self->eoi_code;
> -+                                        return output_length;
> -+                                }
> -+
> -                                 /* Convert codeword into indexes */
> -                                 n_written += write_indexes (self, output
> + n_written, output_length - n_written);
> -                         }
> ---
> -2.25.1
> -
> diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> deleted file mode 100644
> index 6c758fd61c..0000000000
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From d8d231c01ef2e59856da8a5c26ace955e5f29370 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Mon, 25 Nov 2019 17:05:46 +0000
> -Subject: [PATCH] tests: install circular-table.gif
> -
> -This test data was added for the pixbuf-gif-circular-table test (added
> October
> -2018 in 0b9d004) but because the file was never actually installed the
> installed
> -test suite never passes.
> ----
> - tests/meson.build | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tests/meson.build b/tests/meson.build
> -index 5116fc2b9..80ed3e8b2 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -97,6 +97,7 @@ test_data = [
> -   'bug775693.pixdata',
> -   'bug775229.pixdata',
> -   'aero.gif',
> -+  'circular-table.gif'
> - ]
> -
> - installed_test_bindir = join_paths(gdk_pixbuf_libexecdir,
> 'installed-tests', meson.project_name())
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
> similarity index 91%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
> index 226e1c7b89..17213bb7f0 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
> @@ -24,8 +24,6 @@ SRC_URI =
> "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>
> file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
>             file://0004-Do-not-run-tests-when-building.patch \
>
> file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
> -           file://missing-test-data.patch \
> -           file://CVE-2020-29385.patch \
>             "
>
>  SRC_URI_append_class-target = " \
> @@ -35,28 +33,26 @@ SRC_URI_append_class-nativesdk = " \
>
> file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
>             "
>
> -SRC_URI[md5sum] = "05eb1ebc258ba905f1c8644ef49de064"
> -SRC_URI[sha256sum] =
> "1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6"
> +SRC_URI[md5sum] = "7cd2fdaa3c55e2302316fe36968f7425"
> +SRC_URI[sha256sum] =
> "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
>
>  inherit meson pkgconfig gettext pixbufcache ptest-gnome
> upstream-version-is-even gobject-introspection gtk-doc lib_package
>
> -GIR_MESON_OPTION = 'gir'
> -
>  LIBV = "2.10.0"
>
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +
>  GDK_PIXBUF_LOADERS ?= "png jpeg"
>
>  PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
> -                 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
>                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '',
> d)}"
>  PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
>
>  PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
>  PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
>  PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
> -PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
>  PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
> -PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
>
>  PACKAGES =+ "${PN}-xlib"
>
> --
> 2.17.1
>
>
> 
>
>

--00000000000029582d05c0ddeddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Changqing, I have an alternative update patch =
that also simplifies the custom patch structure. If my approach doesn&#39;t=
 work out, I&#39;ll take yours, until then I&#39;d like it to be on hold.</=
div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 Apr 2021 at 02:55, Changqi=
ng Li &lt;<a href=3D"mailto:changqing.li@windriver.com">changqing.li@windri=
ver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-around-thumbnailer-cross-compile-fa.patch | 61 ++++++++++-------=
--<br>
=C2=A0.../0004-Do-not-run-tests-when-building.patch | 21 +++----<br>
=C2=A0...ailer-and-tests-also-in-cross-builds.patch |=C2=A0 4 +-<br>
=C2=A0.../gdk-pixbuf/CVE-2020-29385.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 55 -----------------<br>
=C2=A0.../gdk-pixbuf/missing-test-data.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
30 ---------<br>
=C2=A0...-<a href=3D"http://pixbuf_2.40.0.bb" rel=3D"noreferrer" target=3D=
"_blank">pixbuf_2.40.0.bb</a> =3D&gt; <a href=3D"http://gdk-pixbuf_2.42.6.b=
b" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a>} | 14 ++--=
-<br>
=C2=A06 files changed, 49 insertions(+), 136 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020=
-29385.patch<br>
=C2=A0delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-=
test-data.patch<br>
=C2=A0rename meta/recipes-gnome/gdk-pixbuf/{<a href=3D"http://gdk-pixbuf_2=
.40.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a> =3D=
&gt; <a href=3D"http://gdk-pixbuf_2.42.6.bb" rel=3D"noreferrer" target=3D"_=
blank">gdk-pixbuf_2.42.6.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Wor=
k-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf=
/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch=
<br>
index a9c7600eb3..342c47cca3 100644<br>
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-aroun=
d-thumbnailer-cross-compile-fa.patch<br>
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-aroun=
d-thumbnailer-cross-compile-fa.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 2001<br=
>
+From 483e6818e9aebc5637f41856e327995ef967c451 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 22 Feb 2019 13:22:06 +0100<br>
=C2=A0Subject: [PATCH] (target only) Work-around thumbnailer and pixdata<b=
r>
@@ -15,7 +15,6 @@ The upstream issue is <a href=3D"https://bugzilla.gnome.=
org/show_bug.cgi?id=3D779057" rel=3D"noreferrer" target=3D"_blank">https://=
bugzilla.gnome.org/show_bug.cgi?id=3D779057</a><br>
<br>
=C2=A0Upstream-Status: Inappropriate [workaround]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 build-aux/gen-thumbnailer.py |=C2=A0 2 --<br>
=C2=A0 tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++=
++++++--<br>
@@ -36,13 +35,13 @@ index 05ac821..c5b99ab 100644<br>
=C2=A0 if <a href=3D"http://os.name" rel=3D"noreferrer" target=3D"_blank">=
os.name</a> =3D=3D &#39;nt&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 gdk_pixbuf_dll_buildpath =3D os.path.dirname(args.pix=
data)<br>
=C2=A0diff --git a/tests/meson.build b/tests/meson.build<br>
-index 8ed7cc1..e011b77 100644<br>
+index 3f3ee54..4100520 100644<br>
=C2=A0--- a/tests/meson.build<br>
=C2=A0+++ b/tests/meson.build<br>
-@@ -1,12 +1,19 @@<br>
- # Resources; we cannot use gnome.compile_resources() here, because we ne=
ed to<br>
- # override the environment in order to use the utilities we just built i=
nstead<br>
- # of the system ones<br>
+@@ -8,13 +8,20 @@ if enabled_loaders.contains(&#39;png&#39;) and host_sys=
tem !=3D &#39;windows&#39;<br>
+=C2=A0 =C2=A0# Resources; we cannot use gnome.compile_resources() here, b=
ecause we need to<br>
+=C2=A0 =C2=A0# override the environment in order to use the utilities we =
just built instead<br>
+=C2=A0 =C2=A0# of the system ones<br>
=C2=A0+<br>
=C2=A0+if not meson.is_cross_build()<br>
=C2=A0+pixdata_binary =3D gdk_pixbuf_pixdata.full_path()<br>
@@ -50,30 +49,31 @@ index 8ed7cc1..e011b77 100644<br>
=C2=A0+pixdata_binary =3D &#39;gdk-pixbuf-pixdata&#39;<br>
=C2=A0+endif<br>
=C2=A0+<br>
- resources_c =3D custom_target(&#39;resources.c&#39;,<br>
-=C2=A0 =C2=A0input: &#39;resources.gresource.xml&#39;,<br>
-=C2=A0 =C2=A0output: &#39;resources.c&#39;,<br>
-=C2=A0 =C2=A0command: [<br>
-=C2=A0 =C2=A0 =C2=A0gen_resources,<br>
--=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pixdata.full_p=
ath()),<br>
-+=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binary),<br>
-=C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_cache.full_p=
ath()),<br>
-=C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.current_sour=
ce_dir()),<br>
-=C2=A0 =C2=A0 =C2=A0&#39;--source&#39;,<br>
-@@ -24,7 +31,7 @@ resources_h =3D custom_target(&#39;resources.h&#39;,<br=
>
-=C2=A0 =C2=A0output: &#39;resources.h&#39;,<br>
-=C2=A0 =C2=A0command: [<br>
-=C2=A0 =C2=A0 =C2=A0gen_resources,<br>
--=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pixdata.full_p=
ath()),<br>
-+=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binary),<br>
-=C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_cache.full_p=
ath()),<br>
-=C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.current_sour=
ce_dir()),<br>
-=C2=A0 =C2=A0 =C2=A0&#39;--header&#39;,<br>
+=C2=A0 =C2=A0resources_c =3D custom_target(&#39;resources.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0input: &#39;resources.gresource.xml&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0output: &#39;resources.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0command: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_resources,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--glib-compile-resources=3D@0@&#39;.forma=
t(glib_compile_resources.full_path()),<br>
+-=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pixdata=
.full_path()),<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binary),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_cache=
.full_path()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.curre=
nt_source_dir()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--source&#39;,<br>
+@@ -33,7 +40,7 @@ if enabled_loaders.contains(&#39;png&#39;) and host_sys=
tem !=3D &#39;windows&#39;<br>
+=C2=A0 =C2=A0 =C2=A0command: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_resources,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--glib-compile-resources=3D@0@&#39;.forma=
t(glib_compile_resources.full_path()),<br>
+-=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pixdata=
.full_path()),<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binary),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_cache=
.full_path()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.curre=
nt_source_dir()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--header&#39;,<br>
=C2=A0diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build<br>
-index aaafec8..71bd61b 100644<br>
+index 8c741e0..4d98841 100644<br>
=C2=A0--- a/thumbnailer/meson.build<br>
=C2=A0+++ b/thumbnailer/meson.build<br>
-@@ -18,9 +18,7 @@ custom_target(&#39;thumbnailer&#39;,<br>
+@@ -19,9 +19,7 @@ custom_target(&#39;thumbnailer&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;gdk-p=
ixbuf-thumbnailer.thumbnailer&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_thumbna=
iler,<br>
@@ -84,7 +84,7 @@ index aaafec8..71bd61b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--bind=
ir=3D@0@&#39;.format(gdk_pixbuf_bindir),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;@INPUT=
@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;@OUTPU=
T@&#39;,<br>
-@@ -28,7 +26,6 @@ custom_target(&#39;thumbnailer&#39;,<br>
+@@ -29,7 +27,6 @@ custom_target(&#39;thumbnailer&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_pixbuf_=
print_mime_types,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_pixbuf_=
pixdata,<br>
@@ -92,3 +92,6 @@ index aaafec8..71bd61b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: join_=
paths(gdk_pixbuf_datadir, &#39;thumbnailers&#39;))<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-test=
s-when-building.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-no=
t-run-tests-when-building.patch<br>
index 96c546f271..9b41b77124 100644<br>
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-=
building.patch<br>
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-=
building.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001<br=
>
+From c26a775a8e8efe5f9cf3e666cd51707fe69da203 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 22 Feb 2019 13:23:55 +0100<br>
=C2=A0Subject: [PATCH] Do not run tests when building<br>
@@ -6,14 +6,14 @@ Subject: [PATCH] Do not run tests when building<br>
=C2=A0Upstream-Status: Inappropriate [cross-compile specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0---<br>
- tests/meson.build | 17 -----------------<br>
- 1 file changed, 17 deletions(-)<br>
+ tests/meson.build | 13 -------------<br>
+ 1 file changed, 13 deletions(-)<br>
<br>
=C2=A0diff --git a/tests/meson.build b/tests/meson.build<br>
-index 4fa3fbc..6ef7884 100644<br>
+index 7c6cb11..3f3ee54 100644<br>
=C2=A0--- a/tests/meson.build<br>
=C2=A0+++ b/tests/meson.build<br>
-@@ -138,23 +138,6 @@ foreach t: installed_tests<br>
+@@ -201,19 +201,6 @@ foreach test_name, test_data: installed_tests<br>
=C2=A0 =C2=A0 =C2=A0 install_dir: installed_test_bindir,<br>
=C2=A0 =C2=A0 )<br>
<br>
@@ -26,14 +26,13 @@ index 4fa3fbc..6ef7884 100644<br>
=C2=A0-<br>
=C2=A0-=C2=A0 test(test_name, test_bin,<br>
=C2=A0-=C2=A0 =C2=A0 suite: test_suites,<br>
--=C2=A0 =C2=A0 args: [ &#39;-k&#39;, &#39;--tap&#39; ],<br>
--=C2=A0 =C2=A0 env: [<br>
--=C2=A0 =C2=A0 =C2=A0 &#39;G_TEST_SRCDIR=3D@0@&#39;.format(meson.current_=
source_dir()),<br>
--=C2=A0 =C2=A0 =C2=A0 &#39;G_TEST_BUILDDIR=3D@0@&#39;.format(meson.curren=
t_build_dir()),<br>
--=C2=A0 =C2=A0 =C2=A0 &#39;GDK_PIXBUF_MODULE_FILE=3D@0@&#39;.format(loade=
rs_cache.full_path()),<br>
--=C2=A0 =C2=A0 ],<br>
+-=C2=A0 =C2=A0 args: test_args,<br>
+-=C2=A0 =C2=A0 env: test_env,<br>
=C2=A0-=C2=A0 =C2=A0 timeout: timeout,<br>
=C2=A0-=C2=A0 )<br>
=C2=A0 endforeach<br>
<br>
=C2=A0 executable(&#39;pixbuf-read&#39;,<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnail=
er-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk=
-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch<br>
index 0fe13a387a..db4b039bd9 100644<br>
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-=
tests-also-in-cross-builds.patch<br>
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-=
tests-also-in-cross-builds.patch<br>
@@ -13,7 +13,7 @@ diff --git a/meson.build b/meson.build<br>
=C2=A0index d104cea..7acb88a 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -397,10 +397,8 @@ endif<br>
+@@ -403,10 +403,8 @@ subdir(&#39;gdk-pixbuf&#39;)<br>
=C2=A0 # i18n<br>
=C2=A0 subdir(&#39;po&#39;)<br>
<br>
@@ -25,4 +25,4 @@ index d104cea..7acb88a 100644<br>
=C2=A0+subdir(&#39;thumbnailer&#39;)<br>
<br>
=C2=A0 # Documentation<br>
- subdir(&#39;docs&#39;)<br>
+ build_docs =3D get_option(&#39;gtk_doc&#39;) or get_option(&#39;docs&#39=
;)<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch=
 b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch<br>
deleted file mode 100644<br>
index 3fef2bc1eb..0000000000<br>
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch<br>
+++ /dev/null<br>
@@ -1,55 +0,0 @@<br>
-From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001<br=
>
-From: Robert Ancell &lt;<a href=3D"mailto:robert.ancell@canonical.com" ta=
rget=3D"_blank">robert.ancell@canonical.com</a>&gt;<br>
-Date: Mon, 30 Nov 2020 12:26:12 +1300<br>
-Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.<b=
r>
-<br>
-The code value after a reset wasn&#39;t being validated, which means we w=
ould<br>
-accept invalid codes. This could cause an infinite loop in the decoder.<b=
r>
-<br>
-Fixes CVE-2020-29385<br>
-<br>
-Fixes <a href=3D"https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gdk-pix=
buf/-/issues/164</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/gdk-=
pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3=
acbd48a575d418ba6bf1b32d7bda2fae1c81</a>]<br>
-CVE: CVE-2020-29385<br>
-Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
-<br>
----<br>
- gdk-pixbuf/lzw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 |=C2=A0 13 +++++++------<br>
- 1 files changed, 7 insertions(+), 6 deletions(-)<br>
- create mode 100644 tests/test-images/fail/hang_114.gif<br>
-<br>
-diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c<br>
-index 9e052a6f7..105daf2b1 100644<br>
---- a/gdk-pixbuf/lzw.c<br>
-+++ b/gdk-pixbuf/lzw.c<br>
-@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self-&gt;last_code !=3D s=
elf-&gt;clear_code &amp;&amp; self-&gt;code_table_size &lt; MAX_CODES) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (self-&gt;code &lt; self-&gt;code_table_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0add_code (self, self-&gt;code);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
 if (self-&gt;code =3D=3D self-&gt;code_table_size)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0add_code (self, self-&gt;last_code);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalid code received - just stop here */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;last_code =3D self-&gt;eoi_code;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return output_length;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* When table is full increase code size */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (self-&gt;code_table_size =3D=3D (1 &lt;&lt; self-&gt;code_size) &amp;&am=
p; self-&gt;code_size &lt; LZW_CODE_MAX)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;code_size++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalid code received - just =
stop here */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (self-&gt;code &gt;=3D self-&=
gt;code_table_size) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
-&gt;last_code =3D self-&gt;eoi_code;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn output_length;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Convert codeword into inde=
xes */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_written +=3D write_indexes =
(self, output + n_written, output_length - n_written);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.pa=
tch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch<br>
deleted file mode 100644<br>
index 6c758fd61c..0000000000<br>
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From d8d231c01ef2e59856da8a5c26ace955e5f29370 Mon Sep 17 00:00:00 2001<br=
>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;<br>
-Date: Mon, 25 Nov 2019 17:05:46 +0000<br>
-Subject: [PATCH] tests: install circular-table.gif<br>
-<br>
-This test data was added for the pixbuf-gif-circular-table test (added Oc=
tober<br>
-2018 in 0b9d004) but because the file was never actually installed the in=
stalled<br>
-test suite never passes.<br>
----<br>
- tests/meson.build | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/tests/meson.build b/tests/meson.build<br>
-index 5116fc2b9..80ed3e8b2 100644<br>
---- a/tests/meson.build<br>
-+++ b/tests/meson.build<br>
-@@ -97,6 +97,7 @@ test_data =3D [<br>
-=C2=A0 =C2=A0&#39;bug775693.pixdata&#39;,<br>
-=C2=A0 =C2=A0&#39;bug775229.pixdata&#39;,<br>
-=C2=A0 =C2=A0&#39;aero.gif&#39;,<br>
-+=C2=A0 &#39;circular-table.gif&#39;<br>
- ]<br>
- <br>
- installed_test_bindir =3D join_paths(gdk_pixbuf_libexecdir, &#39;install=
ed-tests&#39;, meson.project_name())<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.=
40.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a> b/me=
ta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.6.bb" rel=3D"=
noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.4=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>
rename to meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.=
6.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a><br>
index 226e1c7b89..17213bb7f0 100644<br>
--- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>
+++ b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.6.bb=
" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a><br>
@@ -24,8 +24,6 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BP=
N}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-a-couple-of-deci=
sions-around-cross-compilation.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Do-not-run-tests-whe=
n-building.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Build-thumbnailer-an=
d-tests-also-in-cross-builds.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://missing-test-data.patch \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-29385.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-target =3D &quot; \<br>
@@ -35,28 +33,26 @@ SRC_URI_append_class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-target-only-Work-aro=
und-thumbnailer-cross-compile-fa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;05eb1ebc258ba905f1c8644ef49de064&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1582595099537ca8ff3b99c6804350b4c058bb8ad674=
11bbaae024ee7cead4e6&quot;<br>
+SRC_URI[md5sum] =3D &quot;7cd2fdaa3c55e2302316fe36968f7425&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b=
1f723dcf902f78bde77f&quot;<br>
<br>
=C2=A0inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-ver=
sion-is-even gobject-introspection gtk-doc lib_package<br>
<br>
-GIR_MESON_OPTION =3D &#39;gir&#39;<br>
-<br>
=C2=A0LIBV =3D &quot;2.10.0&quot;<br>
<br>
+GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
+GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
+<br>
=C2=A0GDK_PIXBUF_LOADERS ?=3D &quot;png jpeg&quot;<br>
<br>
=C2=A0PACKAGECONFIG =3D &quot;${GDK_PIXBUF_LOADERS} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils=
.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils=
.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;=
, d)}&quot;<br>
=C2=A0PACKAGECONFIG_class-native =3D &quot;${GDK_PIXBUF_LOADERS}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[png] =3D &quot;-Dpng=3Dtrue,-Dpng=3Dfalse,libpng&quot;=
<br>
=C2=A0PACKAGECONFIG[jpeg] =3D &quot;-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg&quot=
;<br>
=C2=A0PACKAGECONFIG[tiff] =3D &quot;-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff&quot=
;<br>
-PACKAGECONFIG[jpeg2000] =3D &quot;-Djasper=3Dtrue,-Djasper=3Dfalse,jasper=
&quot;<br>
=C2=A0PACKAGECONFIG[tests] =3D &quot;-Dinstalled_tests=3Dtrue,-Dinstalled_=
tests=3Dfalse&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx11&qu=
ot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-xlib&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000029582d05c0ddeddb--
