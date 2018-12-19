Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3589B6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:42:09 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id x6so16073109ioa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ezAgEAFoogaphb9xStT1bJZAg2AhRPwvlef7JDKuVTE=;
	b=xlV9V18eoGiGPA2teRqzgcTwAwJfwjNFt8x1s6Qi1TcPwxKVKIriJT/6T4LZivA/oT
	LiQatfYxSSbqNelxiHFjBwTHk0zcCxkIXWKsQQSBIbv7HGP8lI9aa+0F7HPgfuFpH1g0
	oTiSDZoZvb0zqKTQMaJRgqWWFTnRqd55B3zkcxRVtmNCUYbaJDnvqfLSBR8oK+jpYi43
	LlDQ1bPbs/gYqGuAFhPa1YLocQzl4Kqx/Li1HyhUKP3pe2tk+O3Aw/TZNagtYNGlo7TC
	vXRbJkQe1yn8SM7yMOpbJD6l5/FishKnHWPUf4LdbUsAvtlAukkO31yjm5WmErsetSJB
	YcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ezAgEAFoogaphb9xStT1bJZAg2AhRPwvlef7JDKuVTE=;
	b=NNedtVn72mbGA/9FiooGScC14Mf9SsgPlJrDsbNB7P6qswMCD8/vSDjG/Fybj1PXcg
	zVA3KG4qCnFJN5k//VzbiyaocWd2z97rcNum9xijRJ7Ayhb7a84F+9zzJIkKcZBYBvW8
	BDA3lzZqT6q45bn9Zv+BEhGVjnh1hPFX8RbcxUW6Qks3E2vkriUj8w6FRgXcOLT7bAUI
	9Iq8XwKUa24+7fC3h9kQoEwixEtZ1RLLN7OQAwKi2ii2hBs/LJ16OMTNvPSmOuL6xJCh
	8neFmYnbsr+hfdxdO6J8AXgmh10vZGWQtHcnp3hA+RhFZGkBhW9tU48XpDzGJqiCp9wM
	aK/g==
X-Gm-Message-State: AA+aEWbKES5Kx7dCmGvRbgU0R2xaDgK73ezCjijCM5Ni8nr9o+2cxt6W
	o13QqmIRcKLxwp7L4nPrIBC4zFCF6SPlxUQfSZgDpQ==
X-Google-Smtp-Source: AFSGD/WHEYu+W0As/9OZnvDsZ5zwHWXiO1IzBQo3wa6zxpWU9buXJh8Ore/EKXqYwlujwR05+8P+ftpZoRBe27HOb7w=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr17951415ioe.20.1545237730235;
	Wed, 19 Dec 2018 08:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20181219072929.5870-1-anuj.mittal@intel.com>
	<20181219072929.5870-8-anuj.mittal@intel.com>
In-Reply-To: <20181219072929.5870-8-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 16:41:59 +0000
Message-ID: <CAJTo0LZXdHT616qad=2hW8L6GKrf0JCo5mwRZfKPU=y6KRw61A@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] glib-2.0: upgrade 2.58.0 -> 2.58.2
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
X-List-Received-Date: Wed, 19 Dec 2018 16:42:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry but anything past 2.58.1 is going to be a pain:

| /bin/bash: /usr/bin/glib-mkenums: No such file or directory
| /bin/bash: /usr/bin/glib-mkenums: No such file or directory
| ../../libsoup-2.64.2/Makefile.glib:241: recipe for target
'soup-enum-types.h.stamp' failed

The glib pkgconfig files now contain absolute paths, but they're
target paths so when we used them from a sysroot it fails.  Upstream
thinks that we should be setting
GLIB_MKENUMS=3D/path/to/sysroot/usr/bin/glib-mkenums but that really
doesn't scale.

For now I think we just revert the change to put absolute paths into
the sysroot.  When everything has moved to Meson in theory this is
just a matter of passing native=3DTrue to the pkgconfig function, but
that's also untested.

Ross
On Wed, 19 Dec 2018 at 07:30, Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> * For changes, see:
> https://gitlab.gnome.org/GNOME/glib/blob/glib-2-58/NEWS
>
> * Upstreamed patch removed: date-lt.patch
>
> * Tweaked another to remove a hunk trying to find a binary from
> glib-2.0-native which isn't needed anymore as the code is in python
> now.
>
> * Add locale-base-pl-pl to RDEPENDS for ptest as the fix has been
> resolved and merged.
>
> * Remove libdir INSANE_SKIP for ptest package. The only libs present
> here are in libexecdir which is allowed by the check.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...ble-more-tests-while-cross-compiling.patch | 42 ++++---------------
>  .../glib-2.0/glib-2.0/date-lt.patch           | 20 ---------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
>  ...{glib-2.0_2.58.0.bb =3D> glib-2.0_2.58.2.bb} |  7 ++--
>  meta/recipes-core/glib-2.0/glib.inc           |  5 +--
>  5 files changed, 12 insertions(+), 64 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.58.0.bb =3D> glib-2.0_2.58=
.2.bb} (80%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-=
cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tes=
ts-while-cross-compiling.patch
> index 50781e7892..5060880926 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-c=
ompiling.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-c=
ompiling.patch
> @@ -1,4 +1,4 @@
> -From 4b1a6d247c78125096a6ea5ab3cab8a1f000dc23 Mon Sep 17 00:00:00 2001
> +From 70e462e070f8eb20b7660c1cf88271c0449e43cc Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Mon, 9 Nov 2015 11:07:27 +0200
>  Subject: [PATCH] Enable more tests while cross-compiling
> @@ -9,17 +9,15 @@ case we can depend on glib-2.0-native.
>
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -
>  ---
> - gio/tests/Makefile.am     | 10 ++++++----
> - tests/gobject/Makefile.am |  8 +++++---
> - 2 files changed, 11 insertions(+), 7 deletions(-)
> + gio/tests/Makefile.am | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
>
>  diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
> -index 1f0bed7..8295deb 100644
> +index c4e7a92..633e85c 100644
>  --- a/gio/tests/Makefile.am
>  +++ b/gio/tests/Makefile.am
> -@@ -550,10 +550,9 @@ test_programs +=3D \
> +@@ -583,10 +583,9 @@ test_programs +=3D \
>   endif
>
>   # ---------------------------------------------------------------------=
--------
> @@ -32,7 +30,7 @@ index 1f0bed7..8295deb 100644
>   test_programs +=3D resources
>   resources_SOURCES =3D resources.c
>   nodist_resources_SOURCES =3D test_resources.c test_resources2.c test_re=
sources2.h
> -@@ -578,7 +577,11 @@ if !ENABLE_INSTALLED_TESTS
> +@@ -611,7 +610,11 @@ if !ENABLE_INSTALLED_TESTS
>   libresourceplugin_la_LDFLAGS +=3D -rpath /
>   endif
>
> @@ -44,7 +42,7 @@ index 1f0bed7..8295deb 100644
>
>   test-generated.txt: test1.txt
>         $(AM_V_GEN) echo "Generated" > $@ && \
> -@@ -599,7 +602,6 @@ test.gresource: test.gresource.xml Makefile $(shell =
$(glib_compile_resources) --
> +@@ -632,7 +635,6 @@ test.gresource: test.gresource.xml Makefile $(shell =
$(glib_compile_resources) --
>
>   EXTRA_DIST +=3D test.gresource.xml test1.txt test2.gresource.xml test2.=
txt test3.gresource.xml test3.txt test4.gresource.xml
>   CLEANFILES +=3D test-generated.txt test_resources.c test_resources2.[ch=
] plugin_resources.c test.gresource
> @@ -52,29 +50,3 @@ index 1f0bed7..8295deb 100644
>
>   BUILT_SOURCES +=3D giotypefuncs.inc
>
> -diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
> -index 0e60987..927d13a 100644
> ---- a/tests/gobject/Makefile.am
> -+++ b/tests/gobject/Makefile.am
> -@@ -51,10 +51,13 @@ if ENABLE_TIMELOOP
> - installed_test_programs +=3D timeloop-closure
> - endif
> -
> --# The marshal test requires running a binary, which means we cannot
> --# build it when cross-compiling
> -+# The marshal test requires running a binary, which means we require
> -+# glib-native when cross-compiling
> - if !CROSS_COMPILING
> - glib_genmarshal=3D$(top_builddir)/gobject/glib-genmarshal
> -+else
> -+glib_genmarshal=3D$(shell which glib-genmarshal)
> -+endif
> -
> - testmarshal.h: stamp-testmarshal.h
> -       @true
> -@@ -71,4 +74,3 @@ testmarshal.c: testmarshal.h testmarshal.list $(glib_g=
enmarshal)
> - BUILT_SOURCES +=3D testmarshal.h testmarshal.c
> - CLEANFILES +=3D stamp-testmarshal.h testmarshal.h testmarshal.c
> - EXTRA_DIST +=3D testcommon.h testmarshal.list
> --endif # !CROSS_COMPILING
> -\ No newline at end of file
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch b/meta/rec=
ipes-core/glib-2.0/glib-2.0/date-lt.patch
> deleted file mode 100644
> index dd0aff7281..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Update Lithuanian month names in the test suite as glibc changed the tra=
nslations.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/merge_re=
quests/373]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/glib/tests/date.c b/glib/tests/date.c
> -index b801ca704..6646c227c 100644
> ---- a/glib/tests/date.c
> -+++ b/glib/tests/date.c
> -@@ -365,8 +365,8 @@ test_month_names (void)
> -       TEST_DATE ( 1,  4, 2018,      "%Y m. %OB",      "2018 m. balandis=
");
> -       TEST_DATE ( 1,  5, 2018,      "%Y m. %OB",        "2018 m. gegu=
=C5=BE=C4=97");
> -       TEST_DATE ( 1,  6, 2018,      "%Y m. %OB",      "2018 m. bir=C5=
=BEelis");
> --      TEST_DATE (17,  7, 2018, "%Y m. %b %e d.",     "2018 m. Lie 17 d.=
");
> --      TEST_DATE ( 1,  8, 2018,      "%Y m. %Ob",           "2018 m. Rgp=
");
> -+      TEST_DATE (17,  7, 2018, "%Y m. %b %e d.",   "2018 m. Liep. 17 d.=
");
> -+      TEST_DATE ( 1,  8, 2018,      "%Y m. %Ob",         "2018 m. rugp.=
");
> -     }
> -   else
> -     g_test_skip ("locale lt_LT not available, skipping Lithuanian month=
 names test");
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b=
/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index f9794d3dd2..9ec011a095 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -1,4 +1,4 @@
> -From 8326961841f4d16c7239e747de11e3817c35cfd2 Mon Sep 17 00:00:00 2001
> +From 43967e85b7a87f9c2e780504ef30f4c9bf56f8f5 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Fri, 11 Mar 2016 15:35:55 +0000
>  Subject: [PATCH] glib-2.0: relocate the GIO module directory for native =
builds
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.58.2.bb
> similarity index 80%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.58.2.bb
> index 1271a7c269..371c09826f 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.2.bb
> @@ -8,15 +8,14 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>             file://configure-libtool.patch \
>             file://run-ptest \
>             file://uclibc_musl_translation.patch \
> -           file://0001-Remove-the-warning-about-deprecated-paths-in-sche=
mas.patch \
>             file://Enable-more-tests-while-cross-compiling.patch \
> +           file://0001-Remove-the-warning-about-deprecated-paths-in-sche=
mas.patch \
>             file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch=
 \
>             file://0001-Do-not-ignore-return-value-of-write.patch \
>             file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
> -           file://date-lt.patch \
>             "
>
>  SRC_URI_append_class-native =3D " file://relocate-modules.patch"
>
> -SRC_URI[md5sum] =3D "9b5d21c802f55bf37171c4fbfe7d32d1"
> -SRC_URI[sha256sum] =3D "c0f4ce0730b4f95c47b711613b5406a887c2ee13ea6d2593=
0d72a4fa7fdb77f6"
> +SRC_URI[md5sum] =3D "8483db194fd8a4653394a1413df97a4c"
> +SRC_URI[sha256sum] =3D "c7b24ed6536f1a10fc9bce7994e55c427b727602e7834282=
1f1f07fb48753d4b"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index a868b6df23..c9093cee86 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -142,8 +142,6 @@ RDEPENDS_${PN}-ptest +=3D "\
>              shared-mime-info \
>             "
>
> -# When https://gitlab.gnome.org/GNOME/glib/issues/1343 is
> -# fixed add locale-base-pl-pl
>  RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
>              glibc-gconv-utf-16 \
>              glibc-charmap-utf-8 \
> @@ -167,6 +165,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
>              locale-base-fr-fr \
>              locale-base-es-es \
>              locale-base-en-gb \
> +            locale-base-pl-pl \
>             "
> -
> -INSANE_SKIP_${PN}-ptest +=3D "libdir"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

