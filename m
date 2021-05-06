Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web09.1288.1620326994609641954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 11:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CAPVqPPi;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id m17so3426751vsn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5qa5VXrgYEjOGr0kRzz0v02nri9V5JfSTfo4vveKOI=;
        b=CAPVqPPiV6WIJowRHHxN884j6MOl8v/rn5QMxD+M82fVYcKrzj+4TYFLay+FQdzckH
         k6gXatYwaWvuFV8f4tL/TiSfKn+/iZ5UMhAgAjL970CiZ2ctzBGxzdgxCtQuiJu0PO7l
         h8Kl3n5B1n7VflZrEUMBqVbCPf7yGzl5gre//VdwkPhuc5FwGZE86+gkKWUvQ2FmdYEP
         k6uliBAJ6I8rm6PCDyVpPdlGlf6wlwZTYjt6EKfaqZYr44rq4jVX78AiRrwdWzLS3SUR
         UAYT9XF+b1b+fYKQHpATolZME+ArLwwJZTRo1+m9uZ/5KmhiDJaW8VzyuEfwA5+K7QN3
         Qumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5qa5VXrgYEjOGr0kRzz0v02nri9V5JfSTfo4vveKOI=;
        b=uHf2sL2r89X9GW1XivH9P/Epkdtt9knozhR3kXQHHJ7FTIbKcKB0XImob9QZUDoOUX
         8Kp9pE87S8y+L+sKmoXdNHcabcRVUonJY5r4JNqn/EQXT6lD7VjnkBQV0b5UqNIYcerS
         fSPiMEzqgdOBR9mL/5pq2AfpB/7mdiSqW2iCwk7OMCGLZy68/M5f1Sqtu8khZVxpzWxP
         umi2YsEEXW80eU9e5se0HnUq2a2QP81e1Rnx6owAJ9TrWfWMRTnYqf1wdY81t/6byqcH
         UV1+iaM3pIF4lIsgTpqvy9vOs49mA9VysLdeV6IlSJYsLS+cn6x1ddFaqf+dIG02lKpS
         wt2w==
X-Gm-Message-State: AOAM532TV5bIAwyPmXGuYvsgoo53IMvJLAn0BakLddW1WY3lhMz+bvuN
	2csDBuzPMHjnW+TiOQSeTZS1WFtAEaeumj4xrp0=
X-Google-Smtp-Source: ABdhPJyufA5vglZix4ERAKYY/LdeRFSxyd0/FerAQMWnMoC919gAZq7vCbw0fFuINWymlp/Mmt/Ph3hFcNexuatUCE8=
X-Received: by 2002:a67:2fc8:: with SMTP id v191mr5440045vsv.54.1620326993602;
 Thu, 06 May 2021 11:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-4-alex.kanavin@gmail.com> <CAMKF1sqRMjd3Xv_v+tRAfjo0-MUdAgCM+eGxpY=8Of7yLjtGmg@mail.gmail.com>
In-Reply-To: <CAMKF1sqRMjd3Xv_v+tRAfjo0-MUdAgCM+eGxpY=8Of7yLjtGmg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 6 May 2021 20:49:42 +0200
Message-ID: <CANNYZj-fx280scYZs2nBiTor5fxyn62z00vy32Zu76i051JZsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/61] gdk-pixbuf: update 2.40.0 -> 2.42.6
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dfac7605c1adc649"

--000000000000dfac7605c1adc649
Content-Type: text/plain; charset="UTF-8"

No package 'gdk-pixbuf-xlib-2.0' found

gdk-pixbuf has fully removed support for this:
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/38

Alex


On Thu, 6 May 2021 at 16:56, Khem Raj <raj.khem@gmail.com> wrote:

> seeing failures on meta-oe builds
>
> https://errors.yoctoproject.org/Errors/Details/580243/
>
> On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Note: jpg/png loaders are now builtin and no longer
> > provided as separate packages.
> >
> > Drop backport missing-test-data.patch.
> >
> > Drop no longer needed 0004-Do-not-run-tests-when-building.patch
> >
> > Rebase 0004-Do-not-run-tests-when-building.patch
> >
> > Rework 0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> > so that it can be applied to both native and target builds.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...bnailer-and-pixdata-cross-compile-fa.patch | 95 +++++++++++++++++++
> >  ...-around-thumbnailer-cross-compile-fa.patch | 94 ------------------
> >  .../0004-Do-not-run-tests-when-building.patch | 39 --------
> >  ...ailer-and-tests-also-in-cross-builds.patch |  9 +-
> >  .../gdk-pixbuf/CVE-2020-29385.patch           | 55 -----------
> >  .../gdk-pixbuf/missing-test-data.patch        | 30 ------
> >  ...-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.6.bb} | 21 +---
> >  7 files changed, 105 insertions(+), 238 deletions(-)
> >  create mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
> >  delete mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> >  delete mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> >  delete mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> >  delete mode 100644
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> >  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.40.0.bb =>
> gdk-pixbuf_2.42.6.bb} (85%)
> >
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
> > new file mode 100644
> > index 0000000000..2aa9164750
> > --- /dev/null
> > +++
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
> > @@ -0,0 +1,95 @@
> > +From dcaf3106e2cca27f728a8bd26127430500a1136e Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 22 Feb 2019 13:22:06 +0100
> > +Subject: [PATCH] Work-around thumbnailer and pixdata cross-compile
> failure
> > +
> > +Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata
> > +when generating the thumbnail metadata and resources.
> > +
> > +This works but the mime types will come from native
> > +loader.cache (which will only contain in-tree loaders), not from the
> > +target loader.cache.
> > +
> > +The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
> > +
> > +Upstream-Status: Inappropriate [workaround]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> > +---
> > + tests/meson.build       | 11 +++++++++--
> > + thumbnailer/meson.build | 23 ++++++++++++++++++++++-
> > + 2 files changed, 31 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/tests/meson.build b/tests/meson.build
> > +index 7c6cb11..07121f1 100644
> > +--- a/tests/meson.build
> > ++++ b/tests/meson.build
> > +@@ -8,13 +8,20 @@ if enabled_loaders.contains('png') and host_system !=
> 'windows'
> > +   # Resources; we cannot use gnome.compile_resources() here, because
> we need to
> > +   # override the environment in order to use the utilities we just
> built instead
> > +   # of the system ones
> > ++
> > ++  if not meson.is_cross_build()
> > ++  pixdata_binary = gdk_pixbuf_pixdata.full_path()
> > ++  else
> > ++  pixdata_binary = 'gdk-pixbuf-pixdata'
> > ++  endif
> > ++
> > +   resources_c = custom_target('resources.c',
> > +     input: 'resources.gresource.xml',
> > +     output: 'resources.c',
> > +     command: [
> > +       gen_resources,
> > +       '--glib-compile-resources=@0@
> '.format(glib_compile_resources.full_path()),
> > +-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> > ++      '--pixdata=@0@'.format(pixdata_binary),
> > +       '--loaders=@0@'.format(loaders_cache.full_path()),
> > +       '--sourcedir=@0@'.format(meson.current_source_dir()),
> > +       '--source',
> > +@@ -33,7 +40,7 @@ if enabled_loaders.contains('png') and host_system !=
> 'windows'
> > +     command: [
> > +       gen_resources,
> > +       '--glib-compile-resources=@0@
> '.format(glib_compile_resources.full_path()),
> > +-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> > ++      '--pixdata=@0@'.format(pixdata_binary),
> > +       '--loaders=@0@'.format(loaders_cache.full_path()),
> > +       '--sourcedir=@0@'.format(meson.current_source_dir()),
> > +       '--header',
> > +diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
> > +index 8c741e0..5a3b52a 100644
> > +--- a/thumbnailer/meson.build
> > ++++ b/thumbnailer/meson.build
> > +@@ -14,7 +14,27 @@ gdk_pixbuf_print_mime_types =
> executable('gdk-pixbuf-print-mime-types',
> > +                                          install: true,
> > +                                          dependencies: gdk_pixbuf_deps
> + [ gdkpixbuf_dep ])
> > +
> > +-custom_target('thumbnailer',
> > ++if meson.is_cross_build()
> > ++    custom_target('thumbnailer',
> > ++              input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
> > ++              output: 'gdk-pixbuf-thumbnailer.thumbnailer',
> > ++              command: [
> > ++                gen_thumbnailer,
> > ++                '--printer=gdk-pixbuf-print-mime-types',
> > ++                '--pixdata=@0@
> '.format(gdk_pixbuf_pixdata.full_path()),
> > ++                '--loaders=@0@'.format(loaders_cache.full_path()),
> > ++                '--bindir=@0@'.format(gdk_pixbuf_bindir),
> > ++                '@INPUT@',
> > ++                '@OUTPUT@',
> > ++              ],
> > ++              depends: [
> > ++                gdk_pixbuf_print_mime_types,
> > ++                gdk_pixbuf_pixdata,
> > ++              ],
> > ++              install: true,
> > ++              install_dir: join_paths(gdk_pixbuf_datadir,
> 'thumbnailers'))
> > ++else
> > ++    custom_target('thumbnailer',
> > +               input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
> > +               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
> > +               command: [
> > +@@ -33,3 +53,4 @@ custom_target('thumbnailer',
> > +               ],
> > +               install: true,
> > +               install_dir: join_paths(gdk_pixbuf_datadir,
> 'thumbnailers'))
> > ++endif
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> > deleted file mode 100644
> > index a9c7600eb3..0000000000
> > ---
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
> > +++ /dev/null
> > @@ -1,94 +0,0 @@
> > -From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Fri, 22 Feb 2019 13:22:06 +0100
> > -Subject: [PATCH] (target only) Work-around thumbnailer and pixdata
> > - cross-compile failure
> > -
> > -Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata
> > -when generating the thumbnail metadata and resources.
> > -
> > -This works but the mime types will come from native
> > -loader.cache (which will only contain in-tree loaders), not from the
> > -target loader.cache.
> > -
> > -The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
> > -
> > -Upstream-Status: Inappropriate [workaround]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > -
> > ----
> > - build-aux/gen-thumbnailer.py |  2 --
> > - tests/meson.build            | 11 +++++++++--
> > - thumbnailer/meson.build      |  5 +----
> > - 3 files changed, 10 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnailer.py
> > -index 05ac821..c5b99ab 100644
> > ---- a/build-aux/gen-thumbnailer.py
> > -+++ b/build-aux/gen-thumbnailer.py
> > -@@ -20,8 +20,6 @@ argparser.add_argument('output', help='Output file')
> > - args = argparser.parse_args()
> > -
> > - newenv = os.environ.copy()
> > --newenv['GDK_PIXBUF_PIXDATA'] = args.pixdata
> > --newenv['GDK_PIXBUF_MODULE_FILE'] = args.loaders
> > - # 'nt': NT-based Windows, see
> https://docs.python.org/3/library/os.html
> > - if os.name == 'nt':
> > -     gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
> > -diff --git a/tests/meson.build b/tests/meson.build
> > -index 8ed7cc1..e011b77 100644
> > ---- a/tests/meson.build
> > -+++ b/tests/meson.build
> > -@@ -1,12 +1,19 @@
> > - # Resources; we cannot use gnome.compile_resources() here, because we
> need to
> > - # override the environment in order to use the utilities we just built
> instead
> > - # of the system ones
> > -+
> > -+if not meson.is_cross_build()
> > -+pixdata_binary = gdk_pixbuf_pixdata.full_path()
> > -+else
> > -+pixdata_binary = 'gdk-pixbuf-pixdata'
> > -+endif
> > -+
> > - resources_c = custom_target('resources.c',
> > -   input: 'resources.gresource.xml',
> > -   output: 'resources.c',
> > -   command: [
> > -     gen_resources,
> > --    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> > -+    '--pixdata=@0@'.format(pixdata_binary),
> > -     '--loaders=@0@'.format(loaders_cache.full_path()),
> > -     '--sourcedir=@0@'.format(meson.current_source_dir()),
> > -     '--source',
> > -@@ -24,7 +31,7 @@ resources_h = custom_target('resources.h',
> > -   output: 'resources.h',
> > -   command: [
> > -     gen_resources,
> > --    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
> > -+    '--pixdata=@0@'.format(pixdata_binary),
> > -     '--loaders=@0@'.format(loaders_cache.full_path()),
> > -     '--sourcedir=@0@'.format(meson.current_source_dir()),
> > -     '--header',
> > -diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
> > -index aaafec8..71bd61b 100644
> > ---- a/thumbnailer/meson.build
> > -+++ b/thumbnailer/meson.build
> > -@@ -18,9 +18,7 @@ custom_target('thumbnailer',
> > -               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
> > -               command: [
> > -                 gen_thumbnailer,
> > --                '--printer=@0@
> '.format(gdk_pixbuf_print_mime_types.full_path()),
> > --                '--pixdata=@0@
> '.format(gdk_pixbuf_pixdata.full_path()),
> > --                '--loaders=@0@'.format(loaders_cache.full_path()),
> > -+                '--printer=gdk-pixbuf-print-mime-types',
> > -                 '--bindir=@0@'.format(gdk_pixbuf_bindir),
> > -                 '@INPUT@',
> > -                 '@OUTPUT@',
> > -@@ -28,7 +26,6 @@ custom_target('thumbnailer',
> > -               depends: [
> > -                 gdk_pixbuf_print_mime_types,
> > -                 gdk_pixbuf_pixdata,
> > --                loaders_cache,
> > -               ],
> > -               install: true,
> > -               install_dir: join_paths(gdk_pixbuf_datadir,
> 'thumbnailers'))
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> > deleted file mode 100644
> > index 96c546f271..0000000000
> > ---
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Fri, 22 Feb 2019 13:23:55 +0100
> > -Subject: [PATCH] Do not run tests when building
> > -
> > -Upstream-Status: Inappropriate [cross-compile specific]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - tests/meson.build | 17 -----------------
> > - 1 file changed, 17 deletions(-)
> > -
> > -diff --git a/tests/meson.build b/tests/meson.build
> > -index 4fa3fbc..6ef7884 100644
> > ---- a/tests/meson.build
> > -+++ b/tests/meson.build
> > -@@ -138,23 +138,6 @@ foreach t: installed_tests
> > -     install_dir: installed_test_bindir,
> > -   )
> > -
> > --  # Two particularly slow tests
> > --  if test_suites.contains('slow')
> > --    timeout = 300
> > --  else
> > --    timeout = 30
> > --  endif
> > --
> > --  test(test_name, test_bin,
> > --    suite: test_suites,
> > --    args: [ '-k', '--tap' ],
> > --    env: [
> > --      'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
> > --      'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
> > --      'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
> > --    ],
> > --    timeout: timeout,
> > --  )
> > - endforeach
> > -
> > - executable('pixbuf-read',
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> > index 0fe13a387a..cd9f88befc 100644
> > ---
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> > +++
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
> > @@ -1,19 +1,20 @@
> > -From 1a532e090c558a830de9503f56e23414e880bb95 Mon Sep 17 00:00:00 2001
> > +From d02a8e202d2fe5caf3449683e0ccdf84a482a325 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Wed, 5 Jun 2019 14:17:55 +0200
> >  Subject: [PATCH] Build thumbnailer and tests also in cross builds.
> >
> >  Upstream-Status: Inappropriate [relies on oe-core specific hacks]
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> >   meson.build | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> >  diff --git a/meson.build b/meson.build
> > -index d104cea..7acb88a 100644
> > +index 73034d1..d114016 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -397,10 +397,8 @@ endif
> > +@@ -378,10 +378,8 @@ subdir('gdk-pixbuf')
> >   # i18n
> >   subdir('po')
> >
> > @@ -25,4 +26,4 @@ index d104cea..7acb88a 100644
> >  +subdir('thumbnailer')
> >
> >   # Documentation
> > - subdir('docs')
> > + build_docs = get_option('gtk_doc') or get_option('docs')
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> > deleted file mode 100644
> > index 3fef2bc1eb..0000000000
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
> > +++ /dev/null
> > @@ -1,55 +0,0 @@
> > -From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001
> > -From: Robert Ancell <robert.ancell@canonical.com>
> > -Date: Mon, 30 Nov 2020 12:26:12 +1300
> > -Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.
> > -
> > -The code value after a reset wasn't being validated, which means we
> would
> > -accept invalid codes. This could cause an infinite loop in the decoder.
> > -
> > -Fixes CVE-2020-29385
> > -
> > -Fixes https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164
> > -
> > -Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81
> ]
> > -CVE: CVE-2020-29385
> > -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> > -
> > ----
> > - gdk-pixbuf/lzw.c                    |  13 +++++++------
> > - 1 files changed, 7 insertions(+), 6 deletions(-)
> > - create mode 100644 tests/test-images/fail/hang_114.gif
> > -
> > -diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
> > -index 9e052a6f7..105daf2b1 100644
> > ---- a/gdk-pixbuf/lzw.c
> > -+++ b/gdk-pixbuf/lzw.c
> > -@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,
> > -                                 if (self->last_code !=
> self->clear_code && self->code_table_size < MAX_CODES) {
> > -                                         if (self->code <
> self->code_table_size)
> > -                                                 add_code (self,
> self->code);
> > --                                        else if (self->code ==
> self->code_table_size)
> > -+                                        else
> > -                                                 add_code (self,
> self->last_code);
> > --                                        else {
> > --                                                /* Invalid code
> received - just stop here */
> > --                                                self->last_code =
> self->eoi_code;
> > --                                                return output_length;
> > --                                        }
> > -
> > -                                         /* When table is full increase
> code size */
> > -                                         if (self->code_table_size ==
> (1 << self->code_size) && self->code_size < LZW_CODE_MAX)
> > -                                                 self->code_size++;
> > -                                 }
> > -
> > -+                                /* Invalid code received - just stop
> here */
> > -+                                if (self->code >=
> self->code_table_size) {
> > -+                                        self->last_code =
> self->eoi_code;
> > -+                                        return output_length;
> > -+                                }
> > -+
> > -                                 /* Convert codeword into indexes */
> > -                                 n_written += write_indexes (self,
> output + n_written, output_length - n_written);
> > -                         }
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> > deleted file mode 100644
> > index 6c758fd61c..0000000000
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From d8d231c01ef2e59856da8a5c26ace955e5f29370 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Mon, 25 Nov 2019 17:05:46 +0000
> > -Subject: [PATCH] tests: install circular-table.gif
> > -
> > -This test data was added for the pixbuf-gif-circular-table test (added
> October
> > -2018 in 0b9d004) but because the file was never actually installed the
> installed
> > -test suite never passes.
> > ----
> > - tests/meson.build | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/tests/meson.build b/tests/meson.build
> > -index 5116fc2b9..80ed3e8b2 100644
> > ---- a/tests/meson.build
> > -+++ b/tests/meson.build
> > -@@ -97,6 +97,7 @@ test_data = [
> > -   'bug775693.pixdata',
> > -   'bug775229.pixdata',
> > -   'aero.gif',
> > -+  'circular-table.gif'
> > - ]
> > -
> > - installed_test_bindir = join_paths(gdk_pixbuf_libexecdir,
> 'installed-tests', meson.project_name())
> > ---
> > -2.20.1
> > -
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
> > similarity index 85%
> > rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> > rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
> > index 226e1c7b89..2734a11f96 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
> > @@ -22,41 +22,30 @@ SRC_URI =
> "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
> >             file://fatal-loader.patch \
> >
>  file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
> >
>  file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
> > -           file://0004-Do-not-run-tests-when-building.patch \
> >
>  file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
> > -           file://missing-test-data.patch \
> > -           file://CVE-2020-29385.patch \
> > +
>  file://0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch \
> >             "
> >
> > -SRC_URI_append_class-target = " \
> > -
>  file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
> > -           "
> > -SRC_URI_append_class-nativesdk = " \
> > -
>  file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
> > -           "
> > -
> > -SRC_URI[md5sum] = "05eb1ebc258ba905f1c8644ef49de064"
> > -SRC_URI[sha256sum] =
> "1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6"
> > +SRC_URI[sha256sum] =
> "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
> >
> >  inherit meson pkgconfig gettext pixbufcache ptest-gnome
> upstream-version-is-even gobject-introspection gtk-doc lib_package
> >
> > -GIR_MESON_OPTION = 'gir'
> > +GIR_MESON_OPTION = 'introspection'
> > +GIR_MESON_ENABLE_FLAG = "enabled"
> > +GIR_MESON_DISABLE_FLAG = "disabled"
> >
> >  LIBV = "2.10.0"
> >
> >  GDK_PIXBUF_LOADERS ?= "png jpeg"
> >
> >  PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
> > -                 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> >                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)}"
> >  PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
> >
> >  PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
> >  PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
> >  PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
> > -PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
> >  PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
> > -PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
> >
> >  PACKAGES =+ "${PN}-xlib"
> >
> > --
> > 2.31.1
> >
> >
> > 
> >
>

--000000000000dfac7605c1adc649
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre><span style=3D"font-family:arial,sans-serif">No packa=
ge &#39;gdk-pixbuf-xlib-2.0&#39; found<br><br></span></pre><pre><span style=
=
=3D"font-family:arial,sans-serif">gdk-pixbuf has fully removed support for=
 this:<br><a href=3D"https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requ=
ests/38">https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/38</a><=
br><br></span></pre><pre><span style=3D"font-family:arial,sans-serif">Alex<=
/span><br></pre></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Thu, 6 May 2021 at 16:56, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">seeing failures on meta-oe builds<b=
r>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/580243/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/580243/</a><br>
<br>
On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Note: jpg/png loaders are now builtin and no longer<br>
&gt; provided as separate packages.<br>
&gt;<br>
&gt; Drop backport missing-test-data.patch.<br>
&gt;<br>
&gt; Drop no longer needed 0004-Do-not-run-tests-when-building.patch<br>
&gt;<br>
&gt; Rebase 0004-Do-not-run-tests-when-building.patch<br>
&gt;<br>
&gt; Rework 0003-target-only-Work-around-thumbnailer-cross-compile-fa.patc=
h<br>
&gt; so that it can be applied to both native and target builds.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...bnailer-and-pixdata-cross-compile-fa.patch | 95 ++++++++++++=
+++++++<br>
&gt;=C2=A0 ...-around-thumbnailer-cross-compile-fa.patch | 94 ------------=
------<br>
&gt;=C2=A0 .../0004-Do-not-run-tests-when-building.patch | 39 --------<br>
&gt;=C2=A0 ...ailer-and-tests-also-in-cross-builds.patch |=C2=A0 9 +-<br>
&gt;=C2=A0 .../gdk-pixbuf/CVE-2020-29385.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 55 -----------<br>
&gt;=C2=A0 .../gdk-pixbuf/missing-test-data.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 30 ------<br>
&gt;=C2=A0 ...-<a href=3D"http://pixbuf_2.40.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">pixbuf_2.40.0.bb</a> =3D&gt; <a href=3D"http://gdk-pixbuf_2.4=
2.6.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a>} | 21=
 +---<br>
&gt;=C2=A0 7 files changed, 105 insertions(+), 238 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/000=
1-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/000=
3-target-only-Work-around-thumbnailer-cross-compile-fa.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/000=
4-Do-not-run-tests-when-building.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE=
-2020-29385.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/mis=
sing-test-data.patch<br>
&gt;=C2=A0 rename meta/recipes-gnome/gdk-pixbuf/{<a href=3D"http://gdk-pix=
buf_2.40.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a=
> =3D&gt; <a href=3D"http://gdk-pixbuf_2.42.6.bb" rel=3D"noreferrer" target=
=
=3D"_blank">gdk-pixbuf_2.42.6.bb</a>} (85%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-aroun=
d-thumbnailer-and-pixdata-cross-compile-fa.patch b/meta/recipes-gnome/gdk-p=
ixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.=
patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2aa9164750<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumb=
nailer-and-pixdata-cross-compile-fa.patch<br>
&gt; @@ -0,0 +1,95 @@<br>
&gt; +From dcaf3106e2cca27f728a8bd26127430500a1136e Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 22 Feb 2019 13:22:06 +0100<br>
&gt; +Subject: [PATCH] Work-around thumbnailer and pixdata cross-compile f=
ailure<br>
&gt; +<br>
&gt; +Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata<br>
&gt; +when generating the thumbnail metadata and resources.<br>
&gt; +<br>
&gt; +This works but the mime types will come from native<br>
&gt; +loader.cache (which will only contain in-tree loaders), not from the=
<br>
&gt; +target loader.cache.<br>
&gt; +<br>
&gt; +The upstream issue is <a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D779057" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/show_bug.cgi?id=3D779057</a><br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [workaround]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++++--<br>
&gt; + thumbnailer/meson.build | 23 ++++++++++++++++++++++-<br>
&gt; + 2 files changed, 31 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; +index 7c6cb11..07121f1 100644<br>
&gt; +--- a/tests/meson.build<br>
&gt; ++++ b/tests/meson.build<br>
&gt; +@@ -8,13 +8,20 @@ if enabled_loaders.contains(&#39;png&#39;) and hos=
t_system !=3D &#39;windows&#39;<br>
&gt; +=C2=A0 =C2=A0# Resources; we cannot use gnome.compile_resources() he=
re, because we need to<br>
&gt; +=C2=A0 =C2=A0# override the environment in order to use the utilitie=
s we just built instead<br>
&gt; +=C2=A0 =C2=A0# of the system ones<br>
&gt; ++<br>
&gt; ++=C2=A0 if not meson.is_cross_build()<br>
&gt; ++=C2=A0 pixdata_binary =3D gdk_pixbuf_pixdata.full_path()<br>
&gt; ++=C2=A0 else<br>
&gt; ++=C2=A0 pixdata_binary =3D &#39;gdk-pixbuf-pixdata&#39;<br>
&gt; ++=C2=A0 endif<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0resources_c =3D custom_target(&#39;resources.c&#39;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0input: &#39;resources.gresource.xml&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0output: &#39;resources.c&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0command: [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_resources,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--glib-compile-resources=3D@0@&#39;.=
format(glib_compile_resources.full_path()),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pi=
xdata.full_path()),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binar=
y),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_=
cache.full_path()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.=
current_source_dir()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--source&#39;,<br>
&gt; +@@ -33,7 +40,7 @@ if enabled_loaders.contains(&#39;png&#39;) and hos=
t_system !=3D &#39;windows&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0command: [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_resources,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--glib-compile-resources=3D@0@&#39;.=
format(glib_compile_resources.full_path()),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pi=
xdata.full_path()),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binar=
y),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_=
cache.full_path()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.=
current_source_dir()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--header&#39;,<br>
&gt; +diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build<br>
&gt; +index 8c741e0..5a3b52a 100644<br>
&gt; +--- a/thumbnailer/meson.build<br>
&gt; ++++ b/thumbnailer/meson.build<br>
&gt; +@@ -14,7 +14,27 @@ gdk_pixbuf_print_mime_types =3D executable(&#39;g=
dk-pixbuf-print-mime-types&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 install: true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])<br>
&gt; +<br>
&gt; +-custom_target(&#39;thumbnailer&#39;,<br>
&gt; ++if meson.is_cross_build()<br>
&gt; ++=C2=A0 =C2=A0 custom_target(&#39;thumbnailer&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;<a hre=
f=3D"http://gdk-pixbuf-thumbnailer.thumbnailer.in" rel=3D"noreferrer" targe=
t=3D"_blank">gdk-pixbuf-thumbnailer.thumbnailer.in</a>&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;gdk-p=
ixbuf-thumbnailer.thumbnailer&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_thumbna=
iler,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--prin=
ter=3Dgdk-pixbuf-print-mime-types&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--pixd=
ata=3D@0@&#39;.format(gdk_pixbuf_pixdata.full_path()),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--load=
ers=3D@0@&#39;.format(loaders_cache.full_path()),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--bind=
ir=3D@0@&#39;.format(gdk_pixbuf_bindir),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;@INPUT=
@&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;@OUTPU=
T@&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends: [<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_pixbuf_=
print_mime_types,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_pixbuf_=
pixdata,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: join_=
paths(gdk_pixbuf_datadir, &#39;thumbnailers&#39;))<br>
&gt; ++else<br>
&gt; ++=C2=A0 =C2=A0 custom_target(&#39;thumbnailer&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;<=
a href=3D"http://gdk-pixbuf-thumbnailer.thumbnailer.in" rel=3D"noreferrer" =
target=3D"_blank">gdk-pixbuf-thumbnailer.thumbnailer.in</a>&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;=
gdk-pixbuf-thumbnailer.thumbnailer&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [<br=
>
&gt; +@@ -33,3 +53,4 @@ custom_target(&#39;thumbnailer&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: true=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: =
join_paths(gdk_pixbuf_datadir, &#39;thumbnailers&#39;))<br>
&gt; ++endif<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-onl=
y-Work-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-p=
ixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.=
patch<br>
&gt; deleted file mode 100644<br>
&gt; index a9c7600eb3..0000000000<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-=
around-thumbnailer-cross-compile-fa.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,94 +0,0 @@<br>
&gt; -From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 22 Feb 2019 13:22:06 +0100<br>
&gt; -Subject: [PATCH] (target only) Work-around thumbnailer and pixdata<b=
r>
&gt; - cross-compile failure<br>
&gt; -<br>
&gt; -Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata<br>
&gt; -when generating the thumbnail metadata and resources.<br>
&gt; -<br>
&gt; -This works but the mime types will come from native<br>
&gt; -loader.cache (which will only contain in-tree loaders), not from the=
<br>
&gt; -target loader.cache.<br>
&gt; -<br>
&gt; -The upstream issue is <a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D779057" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/show_bug.cgi?id=3D779057</a><br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [workaround]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - build-aux/gen-thumbnailer.py |=C2=A0 2 --<br>
&gt; - tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++=
++++++--<br>
&gt; - thumbnailer/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +----<br>
&gt; - 3 files changed, 10 insertions(+), 8 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnaile=
r.py<br>
&gt; -index 05ac821..c5b99ab 100644<br>
&gt; ---- a/build-aux/gen-thumbnailer.py<br>
&gt; -+++ b/build-aux/gen-thumbnailer.py<br>
&gt; -@@ -20,8 +20,6 @@ argparser.add_argument(&#39;output&#39;, help=3D&#=
39;Output file&#39;)<br>
&gt; - args =3D argparser.parse_args()<br>
&gt; -<br>
&gt; - newenv =3D os.environ.copy()<br>
&gt; --newenv[&#39;GDK_PIXBUF_PIXDATA&#39;] =3D args.pixdata<br>
&gt; --newenv[&#39;GDK_PIXBUF_MODULE_FILE&#39;] =3D args.loaders<br>
&gt; - # &#39;nt&#39;: NT-based Windows, see <a href=3D"https://docs.pytho=
n.org/3/library/os.html" rel=3D"noreferrer" target=3D"_blank">https://docs.=
python.org/3/library/os.html</a><br>
&gt; - if <a href=3D"http://os.name" rel=3D"noreferrer" target=3D"_blank">=
os.name</a> =3D=3D &#39;nt&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gdk_pixbuf_dll_buildpath =3D os.path.dirname(arg=
s.pixdata)<br>
&gt; -diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; -index 8ed7cc1..e011b77 100644<br>
&gt; ---- a/tests/meson.build<br>
&gt; -+++ b/tests/meson.build<br>
&gt; -@@ -1,12 +1,19 @@<br>
&gt; - # Resources; we cannot use gnome.compile_resources() here, because =
we need to<br>
&gt; - # override the environment in order to use the utilities we just bu=
ilt instead<br>
&gt; - # of the system ones<br>
&gt; -+<br>
&gt; -+if not meson.is_cross_build()<br>
&gt; -+pixdata_binary =3D gdk_pixbuf_pixdata.full_path()<br>
&gt; -+else<br>
&gt; -+pixdata_binary =3D &#39;gdk-pixbuf-pixdata&#39;<br>
&gt; -+endif<br>
&gt; -+<br>
&gt; - resources_c =3D custom_target(&#39;resources.c&#39;,<br>
&gt; -=C2=A0 =C2=A0input: &#39;resources.gresource.xml&#39;,<br>
&gt; -=C2=A0 =C2=A0output: &#39;resources.c&#39;,<br>
&gt; -=C2=A0 =C2=A0command: [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gen_resources,<br>
&gt; --=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pixdata.f=
ull_path()),<br>
&gt; -+=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binary),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_cache.f=
ull_path()),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.current=
_source_dir()),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;--source&#39;,<br>
&gt; -@@ -24,7 +31,7 @@ resources_h =3D custom_target(&#39;resources.h&#39=
;,<br>
&gt; -=C2=A0 =C2=A0output: &#39;resources.h&#39;,<br>
&gt; -=C2=A0 =C2=A0command: [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gen_resources,<br>
&gt; --=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(gdk_pixbuf_pixdata.f=
ull_path()),<br>
&gt; -+=C2=A0 =C2=A0 &#39;--pixdata=3D@0@&#39;.format(pixdata_binary),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;--loaders=3D@0@&#39;.format(loaders_cache.f=
ull_path()),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;--sourcedir=3D@0@&#39;.format(meson.current=
_source_dir()),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;--header&#39;,<br>
&gt; -diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build<br>
&gt; -index aaafec8..71bd61b 100644<br>
&gt; ---- a/thumbnailer/meson.build<br>
&gt; -+++ b/thumbnailer/meson.build<br>
&gt; -@@ -18,9 +18,7 @@ custom_target(&#39;thumbnailer&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;=
gdk-pixbuf-thumbnailer.thumbnailer&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_th=
umbnailer,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--prin=
ter=3D@0@&#39;.format(gdk_pixbuf_print_mime_types.full_path()),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--pixd=
ata=3D@0@&#39;.format(gdk_pixbuf_pixdata.full_path()),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--load=
ers=3D@0@&#39;.format(loaders_cache.full_path()),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--prin=
ter=3Dgdk-pixbuf-print-mime-types&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-=
-bindir=3D@0@&#39;.format(gdk_pixbuf_bindir),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@=
INPUT@&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@=
OUTPUT@&#39;,<br>
&gt; -@@ -28,7 +26,6 @@ custom_target(&#39;thumbnailer&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends: [<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk_pi=
xbuf_print_mime_types,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk_pi=
xbuf_pixdata,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loaders_cac=
he,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: true=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: =
join_paths(gdk_pixbuf_datadir, &#39;thumbnailers&#39;))<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run=
-tests-when-building.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-=
Do-not-run-tests-when-building.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 96c546f271..0000000000<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-=
when-building.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 22 Feb 2019 13:23:55 +0100<br>
&gt; -Subject: [PATCH] Do not run tests when building<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [cross-compile specific]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - tests/meson.build | 17 -----------------<br>
&gt; - 1 file changed, 17 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; -index 4fa3fbc..6ef7884 100644<br>
&gt; ---- a/tests/meson.build<br>
&gt; -+++ b/tests/meson.build<br>
&gt; -@@ -138,23 +138,6 @@ foreach t: installed_tests<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install_dir: installed_test_bindir,<br>
&gt; -=C2=A0 =C2=A0)<br>
&gt; -<br>
&gt; --=C2=A0 # Two particularly slow tests<br>
&gt; --=C2=A0 if test_suites.contains(&#39;slow&#39;)<br>
&gt; --=C2=A0 =C2=A0 timeout =3D 300<br>
&gt; --=C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 timeout =3D 30<br>
&gt; --=C2=A0 endif<br>
&gt; --<br>
&gt; --=C2=A0 test(test_name, test_bin,<br>
&gt; --=C2=A0 =C2=A0 suite: test_suites,<br>
&gt; --=C2=A0 =C2=A0 args: [ &#39;-k&#39;, &#39;--tap&#39; ],<br>
&gt; --=C2=A0 =C2=A0 env: [<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &#39;G_TEST_SRCDIR=3D@0@&#39;.format(meson.cur=
rent_source_dir()),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &#39;G_TEST_BUILDDIR=3D@0@&#39;.format(meson.c=
urrent_build_dir()),<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &#39;GDK_PIXBUF_MODULE_FILE=3D@0@&#39;.format(=
loaders_cache.full_path()),<br>
&gt; --=C2=A0 =C2=A0 ],<br>
&gt; --=C2=A0 =C2=A0 timeout: timeout,<br>
&gt; --=C2=A0 )<br>
&gt; - endforeach<br>
&gt; -<br>
&gt; - executable(&#39;pixbuf-read&#39;,<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thum=
bnailer-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbu=
f/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch<br=
>
&gt; index 0fe13a387a..cd9f88befc 100644<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer=
-and-tests-also-in-cross-builds.patch<br>
&gt; +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer=
-and-tests-also-in-cross-builds.patch<br>
&gt; @@ -1,19 +1,20 @@<br>
&gt; -From 1a532e090c558a830de9503f56e23414e880bb95 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From d02a8e202d2fe5caf3449683e0ccdf84a482a325 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 5 Jun 2019 14:17:55 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Build thumbnailer and tests also in cross buil=
ds.<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [relies on oe-core specific hack=
s]<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0meson.build | 6 ++----<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; -index d104cea..7acb88a 100644<br>
&gt; +index 73034d1..d114016 100644<br>
&gt;=C2=A0 --- a/meson.build<br>
&gt;=C2=A0 +++ b/meson.build<br>
&gt; -@@ -397,10 +397,8 @@ endif<br>
&gt; +@@ -378,10 +378,8 @@ subdir(&#39;gdk-pixbuf&#39;)<br>
&gt;=C2=A0 =C2=A0# i18n<br>
&gt;=C2=A0 =C2=A0subdir(&#39;po&#39;)<br>
&gt;<br>
&gt; @@ -25,4 +26,4 @@ index d104cea..7acb88a 100644<br>
&gt;=C2=A0 +subdir(&#39;thumbnailer&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Documentation<br>
&gt; - subdir(&#39;docs&#39;)<br>
&gt; + build_docs =3D get_option(&#39;gtk_doc&#39;) or get_option(&#39;doc=
s&#39;)<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.=
patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3fef2bc1eb..0000000000<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,55 +0,0 @@<br>
&gt; -From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Robert Ancell &lt;<a href=3D"mailto:robert.ancell@canonical.co=
m" target=3D"_blank">robert.ancell@canonical.com</a>&gt;<br>
&gt; -Date: Mon, 30 Nov 2020 12:26:12 +1300<br>
&gt; -Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW co=
de.<br>
&gt; -<br>
&gt; -The code value after a reset wasn&#39;t being validated, which means=
 we would<br>
&gt; -accept invalid codes. This could cause an infinite loop in the decod=
er.<br>
&gt; -<br>
&gt; -Fixes CVE-2020-29385<br>
&gt; -<br>
&gt; -Fixes <a href=3D"https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/=
164" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gd=
k-pixbuf/-/issues/164</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME=
/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit=
/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81</a>]<br>
&gt; -CVE: CVE-2020-29385<br>
&gt; -Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@int=
el.com" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - gdk-pixbuf/lzw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +++++++------<br>
&gt; - 1 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt; - create mode 100644 tests/test-images/fail/hang_114.gif<br>
&gt; -<br>
&gt; -diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c<br>
&gt; -index 9e052a6f7..105daf2b1 100644<br>
&gt; ---- a/gdk-pixbuf/lzw.c<br>
&gt; -+++ b/gdk-pixbuf/lzw.c<br>
&gt; -@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self-&gt;last_code=
 !=3D self-&gt;clear_code &amp;&amp; self-&gt;code_table_size &lt; MAX_CODE=
S) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if (self-&gt;code &lt; self-&gt;code_table_size)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_code (self, self-&gt;code);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
else if (self-&gt;code =3D=3D self-&gt;code_table_size)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_code (self, self-&gt;last_code);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalid code received - just stop here */<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;last_code =3D self-&gt;eoi_code;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return output_length;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0/* When table is full increase code size */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if (self-&gt;code_table_size =3D=3D (1 &lt;&lt; self-&gt;code_size) =
&amp;&amp; self-&gt;code_size &lt; LZW_CODE_MAX)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;code_size++;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalid code received - j=
ust stop here */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (self-&gt;code &gt;=3D se=
lf-&gt;code_table_size) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
self-&gt;last_code =3D self-&gt;eoi_code;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
return output_length;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Convert codeword in=
to indexes */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_written +=3D write_i=
ndexes (self, output + n_written, output_length - n_written);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-da=
ta.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch=
<br>
&gt; deleted file mode 100644<br>
&gt; index 6c758fd61c..0000000000<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patc=
h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.c=
om" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -From d8d231c01ef2e59856da8a5c26ace955e5f29370 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" targe=
t=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Mon, 25 Nov 2019 17:05:46 +0000<br>
&gt; -Subject: [PATCH] tests: install circular-table.gif<br>
&gt; -<br>
&gt; -This test data was added for the pixbuf-gif-circular-table test (add=
ed October<br>
&gt; -2018 in 0b9d004) but because the file was never actually installed t=
he installed<br>
&gt; -test suite never passes.<br>
&gt; ----<br>
&gt; - tests/meson.build | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; -index 5116fc2b9..80ed3e8b2 100644<br>
&gt; ---- a/tests/meson.build<br>
&gt; -+++ b/tests/meson.build<br>
&gt; -@@ -97,6 +97,7 @@ test_data =3D [<br>
&gt; -=C2=A0 =C2=A0&#39;bug775693.pixdata&#39;,<br>
&gt; -=C2=A0 =C2=A0&#39;bug775229.pixdata&#39;,<br>
&gt; -=C2=A0 =C2=A0&#39;aero.gif&#39;,<br>
&gt; -+=C2=A0 &#39;circular-table.gif&#39;<br>
&gt; - ]<br>
&gt; -<br>
&gt; - installed_test_bindir =3D join_paths(gdk_pixbuf_libexecdir, &#39;in=
stalled-tests&#39;, meson.project_name())<br>
&gt; ---<br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixb=
uf_2.40.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a>=
 b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42.6.bb" re=
l=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a><br>
&gt; similarity index 85%<br>
&gt; rename from meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbu=
f_2.40.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><=
br>
&gt; rename to meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_=
2.42.6.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a><br=
>
&gt; index 226e1c7b89..2734a11f96 100644<br>
&gt; --- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>
&gt; +++ b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.42=
.6.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.42.6.bb</a><br>
&gt; @@ -22,41 +22,30 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${MAJ_VE=
R}/${BPN}-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fatal-loader.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Work-aroun=
d-thumbnailer-cross-compile-failure.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-a-coup=
le-of-decisions-around-cross-compilation.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Do-not-run-test=
s-when-building.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Build-thum=
bnailer-and-tests-also-in-cross-builds.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://missing-test-data.pa=
tch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-29385.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Work-around-thu=
mbnailer-and-pixdata-cross-compile-fa.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI_append_class-target =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-target-only-Wor=
k-around-thumbnailer-cross-compile-fa.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI_append_class-nativesdk =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-target-only-Wor=
k-around-thumbnailer-cross-compile-fa.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;05eb1ebc258ba905f1c8644ef49de064&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;1582595099537ca8ff3b99c6804350b4c058bb8=
ad67411bbaae024ee7cead4e6&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c4a6b75b7ed8f58ca48da830b9fa00ed96d668d=
3ab4b1f723dcf902f78bde77f&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstrea=
m-version-is-even gobject-introspection gtk-doc lib_package<br>
&gt;<br>
&gt; -GIR_MESON_OPTION =3D &#39;gir&#39;<br>
&gt; +GIR_MESON_OPTION =3D &#39;introspection&#39;<br>
&gt; +GIR_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
&gt; +GIR_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
&gt;<br>
&gt;=C2=A0 LIBV =3D &quot;2.10.0&quot;<br>
&gt;<br>
&gt;=C2=A0 GDK_PIXBUF_LOADERS ?=3D &quot;png jpeg&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG =3D &quot;${GDK_PIXBUF_LOADERS} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.=
utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$=
{@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;tests&#39;, =
&#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG_class-native =3D &quot;${GDK_PIXBUF_LOADERS}&quot=
;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[png] =3D &quot;-Dpng=3Dtrue,-Dpng=3Dfalse,libpng&=
quot;<br>
&gt;=C2=A0 PACKAGECONFIG[jpeg] =3D &quot;-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg=
&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[tiff] =3D &quot;-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff=
&quot;<br>
&gt; -PACKAGECONFIG[jpeg2000] =3D &quot;-Djasper=3Dtrue,-Djasper=3Dfalse,j=
asper&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[tests] =3D &quot;-Dinstalled_tests=3Dtrue,-Dinsta=
lled_tests=3Dfalse&quot;<br>
&gt; -PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx=
11&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-xlib&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000dfac7605c1adc649--
