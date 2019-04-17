Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id E2ADA7D224
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 21:04:29 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id k189so15275458qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hCBbPS5M9jGDDuZU6g/hr8KfHNORsrvcEUj1Y3KMzeQ=;
	b=jcrJVR04Lr7gRNM9ATZC9xf3KIUoJuxi8hAOcirKnyA8puYG/aq9s9D/9nFDjWHE1w
	Ku2oDJy9haRbGGd7PT/mDmZgwvKRdq7ohOzKGXl674DR3QUY//SI/pKBsaB5H21ChpND
	2ySNQS2aSuRKewFBrfR8C87FZ38+MPGCyKk7Xluxu9S1GFc3Egiu/lKms+DbPtpxYnYE
	o9E1K3LYAyiSNYlxzFMwkKTAjav2SL7FEdtHpTBdi1AyD8E2qI/Bu3fF8fh8Fr1doL+D
	kP6FBgflyxF3MWRsatNn2LKHzqLN9/LbAb1CWQhcfomQbTZjv5ZCVXwBD5EKSoqYLfyO
	Q2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hCBbPS5M9jGDDuZU6g/hr8KfHNORsrvcEUj1Y3KMzeQ=;
	b=Cc72WIfoZOGfXhXJqO++l07f6ag+ovf5uutsdwUlsKvi+vthUsvgusDTl2yfztK/7C
	jy6O7TSl5sLYcbJaD7sL3IcEiJ3g7dqKgifrfzijbNw9tf9vtLRc/KgDPrp7jGfqgN6d
	IC5wpTeeCuAv0na9SqBmUL8iwZeqI5OAxdboUpGpkvegJDQmPFhuzjVEovJsotyWzlHt
	h6h9fidAAJgp8jWPy4xUm8uSk5nPCEcDhxY/DDRXPlBilxtOIGbY8MCTRttUI0Oq/S7N
	px+A0Tf9zAKs3/ph7q93XHAolkNd+vNAnp+xO1N0JI3CdfwGUZFrQgvtE+VTwyUdC1oi
	bZoA==
X-Gm-Message-State: APjAAAXNQWe+FpHBiIXWka3MPaUz1abJ8yZbzhUTc/qzlIDmXBExlioq
	RGw13fACgF9xR+oUNfeJwIRmPc4B7SrhqwbxqLQ=
X-Google-Smtp-Source: APXvYqwl9Mm+LwFbCNdORSNHZZVA6G2c/XUuJzrMt35Ghd9IOn5sAQLtSCcCx/Q/Dos7zNpTv+bBYWTdw63aODPYoAE=
X-Received: by 2002:a37:8fc3:: with SMTP id r186mr6226762qkd.102.1555535070106;
	Wed, 17 Apr 2019 14:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Apr 2019 14:04:03 -0700
Message-ID: <CAMKF1spqfh+U7kESc-nk8A4TctjZF8B8k0jd5oHuxpy25O1Bog@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/19] gobject-introspection: update to 1.60.1
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
X-List-Received-Date: Wed, 17 Apr 2019 21:04:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

evince fails see
https://errors.yoctoproject.org/Errors/Details/237724/

and reported elsewhere as well

https://gitlab.gnome.org/GNOME/gobject-introspection/issues/229

On Mon, Apr 15, 2019 at 3:55 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop upstreamed patches:
> 0010-meson-add-option-gir-dir-prefix.patch
> 0002-g-ir-tools-respect-gir_dir_prefix.patch
> 0001-configure.ac-make-GIR_DIR-configurable.patch
>
> Rebase the rest.
>
> Upstream has renamed the gir_dir_prefix option, adjust the recipe.
>
> Add a patch to disable tests in cross builds, as previously meson
> build system didn't actually build them.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...t-cross-compilation-support-to-meson.patch | 37 ++++-----
>  ...pository-directory-for-native-builds.patch | 12 +--
>  ...lete-upstream-attempt-at-cross-compi.patch |  8 +-
>  ...nfigure.ac-make-GIR_DIR-configurable.patch | 68 -----------------
>  ...scanner-add-a-lib-dirs-envvar-option.patch | 16 ++--
>  ...-error-return-codes-from-ldd-wrapper.patch |  7 +-
>  ...d-disable-tests-when-cross-compiling.patch | 26 +++++++
>  ...-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 10 +--
>  ...02-g-ir-tools-respect-gir_dir_prefix.patch | 76 -------------------
>  ...canner-add-use-binary-wrapper-option.patch |  8 +-
>  ...scanner-add-a-use-ldd-wrapper-option.patch | 10 +--
>  ...g-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch | 10 +--
>  ...0010-meson-add-option-gir-dir-prefix.patch | 66 ----------------
>  ...8.3.bb =3D> gobject-introspection_1.60.1.bb} | 10 +--
>  14 files changed, 91 insertions(+), 273 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-intr=
ospection/0001-configure.ac-make-GIR_DIR-configurable.patch
>  create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-intr=
ospection/0001-meson.build-disable-tests-when-cross-compiling.patch
>  delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-intr=
ospection/0002-g-ir-tools-respect-gir_dir_prefix.patch
>  delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-intr=
ospection/0010-meson-add-option-gir-dir-prefix.patch
>  rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1=
.58.3.bb =3D> gobject-introspection_1.60.1.bb} (96%)
>
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/=
gobject-introspection/gobject-introspection/0001-Port-cross-compilation-sup=
port-to-meson.patch
> index 80c9e71ad57..5747d61c192 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Port-cross-compilation-support-to-meson.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Port-cross-compilation-support-to-meson.patch
> @@ -1,4 +1,4 @@
> -From ea25a5a755bc839d5b504aac207f860ae68109bc Mon Sep 17 00:00:00 2001
> +From 2b3bce1526b538dc2c7fa223eaf9808858aa1b06 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 15 Nov 2018 15:10:05 +0100
>  Subject: [PATCH] Port cross-compilation support to meson
> @@ -7,16 +7,16 @@ Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  ---
> - gir/meson.build   | 59 ++++++++++++++++++++++++++++++++++-------------
> - meson.build       |  4 +++-
> - meson_options.txt | 20 ++++++++++++++++
> - 3 files changed, 66 insertions(+), 17 deletions(-)
> + gir/meson.build   | 62 ++++++++++++++++++++++++++++++++++-------------
> + meson.build       |  4 ++-
> + meson_options.txt | 20 +++++++++++++++
> + 3 files changed, 68 insertions(+), 18 deletions(-)
>
>  diff --git a/gir/meson.build b/gir/meson.build
> -index 1cb514a..f873068 100644
> +index 85ae575..327c134 100644
>  --- a/gir/meson.build
>  +++ b/gir/meson.build
> -@@ -36,15 +36,27 @@ gir_files =3D [
> +@@ -36,16 +36,29 @@ gir_files =3D [
>   typelibdir =3D join_paths(get_option('libdir'), 'girepository-1.0')
>   install_data(gir_files, install_dir: girdir)
>
> @@ -25,6 +25,7 @@ index 1cb514a..f873068 100644
>  -  girscanner,
>  -  '--output=3D@OUTPUT@',
>  -  '--no-libtool',
> +-  '--quiet',
>  -  '--reparse-validate',
>  -  '--add-include-path', join_paths(meson.current_build_dir()),
>  -  '--add-include-path', join_paths(meson.current_source_dir()),
> @@ -34,6 +35,7 @@ index 1cb514a..f873068 100644
>  +      'g-ir-scanner',
>  +      '--output=3D@OUTPUT@',
>  +      '--no-libtool',
> ++      '--quiet',
>  +      '--reparse-validate',
>  +      '--add-include-path', join_paths(meson.current_build_dir()),
>  +      '--add-include-path', join_paths(meson.current_source_dir()),
> @@ -44,6 +46,7 @@ index 1cb514a..f873068 100644
>  +      girscanner,
>  +      '--output=3D@OUTPUT@',
>  +      '--no-libtool',
> ++      '--quiet',
>  +      '--reparse-validate',
>  +      '--add-include-path', join_paths(meson.current_build_dir()),
>  +      '--add-include-path', join_paths(meson.current_source_dir()),
> @@ -53,7 +56,7 @@ index 1cb514a..f873068 100644
>
>   dep_type =3D glib_dep.type_name()
>   if dep_type =3D=3D 'internal'
> -@@ -57,6 +69,12 @@ if dep_type =3D=3D 'internal'
> +@@ -58,6 +71,12 @@ if dep_type =3D=3D 'internal'
>                         '--extra-library=3Dglib-2.0', '--extra-library=3D=
gobject-2.0']
>   endif
>
> @@ -66,7 +69,7 @@ index 1cb514a..f873068 100644
>   # Take a glob and print to newlines
>   globber =3D '''
>   from glob import glob
> -@@ -83,8 +101,8 @@ glib_command =3D scanner_command + [
> +@@ -84,8 +103,8 @@ glib_command =3D scanner_command + [
>
>   if dep_type =3D=3D 'pkgconfig'
>     glib_command +=3D ['--external-library', '--pkg=3Dglib-2.0']
> @@ -77,7 +80,7 @@ index 1cb514a..f873068 100644
>     glib_libincdir =3D join_paths(glib_libdir, 'glib-2.0', 'include')
>     glib_files +=3D join_paths(glib_incdir, 'gobject', 'glib-types.h')
>     glib_files +=3D join_paths(glib_libincdir, 'glibconfig.h')
> -@@ -338,7 +356,7 @@ endforeach
> +@@ -339,7 +358,7 @@ endforeach
>   if giounix_dep.found()
>     if dep_type =3D=3D 'pkgconfig'
>       gio_command +=3D ['--pkg=3Dgio-unix-2.0']
> @@ -86,10 +89,10 @@ index 1cb514a..f873068 100644
>       # Get the installed gio-unix header list
>       ret =3D run_command(python, '-c', globber.format(join_paths(giounix=
_includedir, 'gio', '*.h')))
>       if ret.returncode() !=3D 0
> -@@ -416,15 +434,24 @@ gir_files +=3D custom_target('gir-girepository',
> -   ]
> +@@ -422,15 +441,24 @@ gir_files +=3D custom_target('gir-girepository',
>   )
>
> + typelibs =3D []
>  +if get_option('enable-gi-cross-wrapper') !=3D ''
>  +    gircompiler_command =3D [get_option('enable-gi-cross-wrapper'), gir=
compiler.full_path(), '-o', '@OUTPUT@', '@INPUT@',
>  +              '--includedir', meson.current_build_dir(),
> @@ -103,7 +106,7 @@ index 1cb514a..f873068 100644
>  +endif
>  +
>   foreach gir : gir_files
> -   custom_target('generate-typelib-@0@'.format(gir).underscorify(),
> +   typelibs +=3D custom_target('generate-typelib-@0@'.format(gir).unders=
corify(),
>       input: gir,
>       output: '@BASENAME@.typelib',
>       depends: [gobject_gir, ],
> @@ -116,10 +119,10 @@ index 1cb514a..f873068 100644
>       install_dir: typelibdir,
>     )
>  diff --git a/meson.build b/meson.build
> -index 17acd82..e0bb495 100644
> +index 95bbd2b..f7baefd 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -81,7 +81,9 @@ libffi_dep =3D dependency('libffi',
> +@@ -163,7 +163,9 @@ endif
>   subdir('girepository')
>   subdir('tools')
>   subdir('giscanner')
> @@ -131,11 +134,11 @@ index 17acd82..e0bb495 100644
>   subdir('docs')
>   subdir('tests')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index ee6958d..b168142 100644
> +index 445a68a..a325511 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -25,3 +25,23 @@ option('python', type: 'string', value: 'python3',
> - option('gir-dir-prefix', type: 'string',
> + option('gir_dir_prefix', type: 'string',
>     description: 'Intermediate prefix for gir installation under ${prefix=
}'
>   )
>  +
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/re=
cipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-r=
epository-directory-for-native-builds.patch
> index a91d22afa7c..a4f45a142dd 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Relocate-the-repository-directory-for-native-builds.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Relocate-the-repository-directory-for-native-builds.patch
> @@ -1,4 +1,4 @@
> -From 7ea8c83d84a05f686128e652a5447fb5f6fb68be Mon Sep 17 00:00:00 2001
> +From 8f01066e935a7323ff6e53f27ed1b5fb74fa11eb Mon Sep 17 00:00:00 2001
>  From: Sascha Silbe <x-yo17@se-silbe.de>
>  Date: Fri, 8 Jun 2018 13:55:10 +0200
>  Subject: [PATCH] Relocate the repository directory for native builds
> @@ -21,7 +21,7 @@ Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
>   2 files changed, 14 insertions(+), 3 deletions(-)
>
>  diff --git a/girepository/girepository.c b/girepository/girepository.c
> -index c1fa3d3..efa557e 100644
> +index ca5dc2b..7a4d17f 100644
>  --- a/girepository/girepository.c
>  +++ b/girepository/girepository.c
>  @@ -21,6 +21,8 @@
> @@ -42,7 +42,7 @@ index c1fa3d3..efa557e 100644
>   /**
>    * SECTION:girepository
>    * @short_description: GObject Introspection repository manager
> -@@ -188,9 +192,16 @@ init_globals (void)
> +@@ -212,9 +216,16 @@ init_globals (void)
>             g_free (custom_dirs);
>           }
>
> @@ -62,12 +62,12 @@ index c1fa3d3..efa557e 100644
>         typelib_search_path =3D g_slist_prepend (typelib_search_path, typ=
elib_dir);
>
>  diff --git a/girepository/meson.build b/girepository/meson.build
> -index 6a8c5b5..8892f2a 100644
> +index 0261e1a..4cb646f 100644
>  --- a/girepository/meson.build
>  +++ b/girepository/meson.build
> -@@ -27,7 +27,7 @@ girepo_internals_lib =3D static_library('girepository-=
internals',
> +@@ -36,7 +36,7 @@ girepo_internals_lib =3D static_library('girepository-=
internals',
>     ],
> -   c_args: gi_hidden_visibility_cflags,
> +   c_args: gi_hidden_visibility_cflags + custom_c_args,
>     include_directories : configinc,
>  -  dependencies: [girepo_gthash_dep, libffi_dep],
>  +  dependencies: [girepo_gthash_dep, libffi_dep, cc.find_library('dl')],
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/meta/r=
ecipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-inc=
omplete-upstream-attempt-at-cross-compi.patch
> index 86cd4ead2a0..d1fdc068c08 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
> @@ -1,4 +1,4 @@
> -From ca0fb17e268c176ac89df081b1efa4a42989f014 Mon Sep 17 00:00:00 2001
> +From 8a57aa0ac6c2f00b9b7a7fc177431f7643399e70 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 23 Mar 2016 17:07:28 +0200
>  Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile
> @@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   2 files changed, 10 deletions(-)
>
>  diff --git a/common.mk b/common.mk
> -index b778f7a..e26c637 100644
> +index 64fb02f..77e819d 100644
>  --- a/common.mk
>  +++ b/common.mk
>  @@ -24,12 +24,8 @@ INTROSPECTION_SCANNER_ARGS =3D \
> @@ -30,10 +30,10 @@ index b778f7a..e26c637 100644
>
>   INTROSPECTION_COMPILER_ARGS =3D \
>  diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
> -index cd9d94d..b41772c 100644
> +index 1730fee..26bab84 100644
>  --- a/giscanner/gdumpparser.py
>  +++ b/giscanner/gdumpparser.py
> -@@ -161,12 +161,6 @@ blob containing data gleaned from GObject's primiti=
ve introspection."""
> +@@ -156,12 +156,6 @@ blob containing data gleaned from GObject's primiti=
ve introspection."""
>           out_path =3D os.path.join(self._binary.tmpdir, 'dump.xml')
>
>           args =3D []
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-configure.ac-make-GIR_DIR-configurable.patch b/meta/recipes-gnome/g=
object-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-c=
onfigurable.patch
> deleted file mode 100644
> index e0402f8f493..00000000000
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-configure.ac-make-GIR_DIR-configurable.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -configure.ac: make GIR_DIR configurable
> -
> -Some .gir files such as GLib-2.0.gir are arch related which contain such
> -as lengths of pointers that they are different for 64 and 32 bit target.
> -It causes install file conflicts for multilib when intall
> -gobject-introspection and lib32-gobject-introspection both.
> -
> -Add configure option 'with-gir-dir-prefix' for autotools to make .gir
> -could be installed to a configured path such as ${libdir}. And update
> -girdir in .pc files as well.
> -
> -Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-intros=
pection/commit/3301c7e]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - configure.ac                              | 7 +++++--
> - gobject-introspection-1.0.pc.in           | 2 +-
> - gobject-introspection-no-export-1.0.pc.in | 2 +-
> - 3 files changed, 7 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b4294c57..60506947 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -114,9 +114,12 @@ GIR_SUFFIX=3D"gir-1.0"
> - AC_SUBST(GIR_SUFFIX)
> - AC_DEFINE_UNQUOTED(GIR_SUFFIX, "$GIR_SUFFIX", [Name of the gir director=
y])
> -
> --GIR_DIR=3D"$EXPANDED_DATADIR/$GIR_SUFFIX"
> -+AC_ARG_WITH([gir-dir-prefix],
> -+              [AS_HELP_STRING([--with-gir-dir-prefix], [Directory prefi=
x for gir installation])],
> -+              [GIR_DIR_PREFIX=3D"$withval"], [GIR_DIR_PREFIX=3D"$EXPAND=
ED_DATADIR"])
> -+GIR_DIR=3D"$GIR_DIR_PREFIX/$GIR_SUFFIX"
> - AC_SUBST(GIR_DIR)
> --AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Director prefix for gir instal=
lation])
> -+AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Directory prefix for gir insta=
llation])
> -
> - PKG_CHECK_MODULES(GLIB, [glib-2.0 >=3D 2.58.0])
> -
> -diff --git a/gobject-introspection-1.0.pc.in b/gobject-introspection-1.0=
.pc.in
> -index a08b5d27..3409856c 100644
> ---- a/gobject-introspection-1.0.pc.in
> -+++ b/gobject-introspection-1.0.pc.in
> -@@ -10,7 +10,7 @@ g_ir_scanner=3D${bindir}/g-ir-scanner
> - g_ir_compiler=3D${bindir}/g-ir-compiler@EXEEXT@
> - g_ir_generate=3D${bindir}/g-ir-generate@EXEEXT@
> - gidatadir=3D${datadir}/gobject-introspection-1.0
> --girdir=3D${datadir}/gir-1.0
> -+girdir=3D@GIR_DIR@
> - typelibdir=3D${libdir}/girepository-1.0
> -
> - Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
> -diff --git a/gobject-introspection-no-export-1.0.pc.in b/gobject-introsp=
ection-no-export-1.0.pc.in
> -index d214d22d..745aaade 100644
> ---- a/gobject-introspection-no-export-1.0.pc.in
> -+++ b/gobject-introspection-no-export-1.0.pc.in
> -@@ -9,7 +9,7 @@ includedir=3D@includedir@
> - g_ir_scanner=3D${bindir}/g-ir-scanner
> - g_ir_compiler=3D${bindir}/g-ir-compiler@EXEEXT@
> - g_ir_generate=3D${bindir}/g-ir-generate@EXEEXT@
> --girdir=3D${datadir}/gir-1.0
> -+girdir=3D@GIR_DIR@
> - typelibdir=3D${libdir}/girepository-1.0
> -
> - Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
> ---
> -2.17.0
> -
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/g=
object-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-en=
vvar-option.patch
> index e9338e92e29..ddd955354de 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-giscanner-add-a-lib-dirs-envvar-option.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-giscanner-add-a-lib-dirs-envvar-option.patch
> @@ -1,4 +1,4 @@
> -From 3fea5e83803f4cfef21b2e06e37a6ba56f2bb914 Mon Sep 17 00:00:00 2001
> +From 6653c28f0b76aad86e26c512b03efcec6d9d9e95 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 3 Jan 2018 17:02:01 +0200
>  Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
> @@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   3 files changed, 7 insertions(+), 3 deletions(-)
>
>  diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
> -index c003828..8a8ba2b 100644
> +index 32c9296..3fb262b 100644
>  --- a/giscanner/ccompiler.py
>  +++ b/giscanner/ccompiler.py
> -@@ -109,7 +109,7 @@ class CCompiler(object):
> +@@ -174,7 +174,7 @@ class CCompiler(object):
>
>               self._cflags_no_deprecation_warnings =3D "-Wno-deprecated-d=
eclarations"
>
> @@ -31,7 +31,7 @@ index c003828..8a8ba2b 100644
>           # An "internal" link is where the library to be introspected
>           # is being built in the current directory.
>
> -@@ -119,7 +119,7 @@ class CCompiler(object):
> +@@ -184,7 +184,7 @@ class CCompiler(object):
>           if os.name =3D=3D 'nt':
>               runtime_path_envvar =3D ['LIB', 'PATH']
>           else:
> @@ -41,10 +41,10 @@ index c003828..8a8ba2b 100644
>               # (This flag is not supported nor needed for Visual C++)
>               args.append('-L.')
>  diff --git a/giscanner/dumper.py b/giscanner/dumper.py
> -index 2c668f5..2e515a0 100644
> +index 2b851a5..10a7c39 100644
>  --- a/giscanner/dumper.py
>  +++ b/giscanner/dumper.py
> -@@ -249,7 +249,8 @@ class DumpCompiler(object):
> +@@ -244,7 +244,8 @@ class DumpCompiler(object):
>                                                      libtool,
>                                                      self._options.librar=
ies,
>                                                      self._options.extra_=
libraries,
> @@ -55,10 +55,10 @@ index 2c668f5..2e515a0 100644
>
>           else:
>  diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
> -index 5cb793e..87227e2 100644
> +index 9013562..9c9fe12 100644
>  --- a/giscanner/scannermain.py
>  +++ b/giscanner/scannermain.py
> -@@ -132,6 +132,9 @@ def _get_option_parser():
> +@@ -126,6 +126,9 @@ def _get_option_parser():
>       parser.add_option("", "--use-ldd-wrapper",
>                         action=3D"store", dest=3D"ldd_wrapper", default=
=3DNone,
>                         help=3D"wrapper to use instead of ldd (useful whe=
n cross-compiling)")
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/meta/r=
ecipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ign=
ore-error-return-codes-from-ldd-wrapper.patch
> index 9167f042e5b..b484b5e9e6e 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> @@ -1,4 +1,4 @@
> -From f128cbeead687bfc6532cc1f2cc3e2dc5a2b5b30 Mon Sep 17 00:00:00 2001
> +From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 5 Sep 2018 16:46:52 +0200
>  Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
> @@ -8,15 +8,16 @@ It is not an error per se, but it breaks subprocess.che=
ck_output().
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   giscanner/shlibs.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> -index 01d21a3..3bd3250 100644
> +index d67df95..80352a6 100644
>  --- a/giscanner/shlibs.py
>  +++ b/giscanner/shlibs.py
> -@@ -108,7 +108,7 @@ def _resolve_non_libtool(options, binary, libraries)=
:
> +@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, libraries)=
:
>               args.extend(['otool', '-L', binary.args[0]])
>           else:
>               args.extend(['ldd', binary.args[0]])
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-meson.build-disable-tests-when-cross-compiling.patch b/meta/recipes=
-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable=
-tests-when-cross-compiling.patch
> new file mode 100644
> index 00000000000..c4951b22bb3
> --- /dev/null
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-meson.build-disable-tests-when-cross-compiling.patch
> @@ -0,0 +1,26 @@
> +From 2c384187cc22113c0c9b1cd233948118f7c085ef Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 25 Mar 2019 13:28:48 +0100
> +Subject: [PATCH] meson.build: disable tests when cross-compiling
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-intro=
spection/merge_requests/64]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + meson.build | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 2544ff3..4c16fe5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -168,7 +168,9 @@ if get_option('enable-introspection-data') =3D=3D tr=
ue
> + endif
> + subdir('examples')
> + subdir('docs')
> +-subdir('tests')
> ++if not meson.is_cross_build()
> ++    subdir('tests')
> ++endif
> +
> + install_data('Makefile.introspection', install_dir: join_paths(get_opti=
on('datadir'), 'gobject-introspection-1.0'))
> + install_data('m4/introspection.m4', install_dir: join_paths(get_option(=
'datadir'), 'aclocal'))
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch b/meta/r=
ecipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-=
add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
> index 03ef2b00590..e4fffcf6133 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002=
-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002=
-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
> @@ -1,4 +1,4 @@
> -From a28cc8413b68bec5b4cf2ee5f37b40a8965490a5 Mon Sep 17 00:00:00 2001
> +From 2335d22e4c64db3d5dfc16ac65468b9dd66db8ac Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 19 Oct 2015 18:29:21 +0300
>  Subject: [PATCH] configure.ac: add host-gi, gi-cross-wrapper, gi-ldd-wra=
pper
> @@ -34,7 +34,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   4 files changed, 87 insertions(+), 1 deletion(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 44ed115..2a1fa56 100644
> +index 952bf71..797a3bd 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
>  @@ -21,7 +21,9 @@ include Makefile-cmph.am
> @@ -48,7 +48,7 @@ index 44ed115..2a1fa56 100644
>
>   ## Process this file with automake to produce Makefile.in
>  diff --git a/common.mk b/common.mk
> -index e26c637..9f3a65f 100644
> +index 77e819d..379ab53 100644
>  --- a/common.mk
>  +++ b/common.mk
>  @@ -6,6 +6,15 @@
> @@ -132,10 +132,10 @@ index e26c637..9f3a65f 100644
>   INTROSPECTION_DOCTOOL_ARGS =3D \
>       --add-include-path=3D$(srcdir) \
>  diff --git a/configure.ac b/configure.ac
> -index d48e6c3..ed5f8a2 100644
> +index 885da70..cd8108b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -367,6 +367,48 @@ dnl
> +@@ -383,6 +383,48 @@ dnl
>   AM_CONDITIONAL(MSVC_BASE_NO_TOOLSET_SET, [test x$MSVC_BASE_TOOLSET =3D =
x])
>   AM_CONDITIONAL(MSVC_NO_TOOLSET_SET, [test x$MSVC_TOOLSET =3D x])
>
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0002-g-ir-tools-respect-gir_dir_prefix.patch b/meta/recipes-gnome/gobjec=
t-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefi=
x.patch
> deleted file mode 100644
> index 5e4176725c3..00000000000
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002=
-g-ir-tools-respect-gir_dir_prefix.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -g-ir-tools: respect gir_dir_prefix
> -
> -Configure option gir_dir_prefix is used to configure install dir for
> -.gir files, so add its value to include file search paths.
> -
> -Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-intros=
pection/commit/3fe995a]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - Makefile-tools.am           |  2 +-
> - giscanner/transformer.py    |  1 +
> - tests/warn/warningtester.py |  1 +
> - tools/g-ir-tool-template.in | 10 ++++++++++
> - 6 files changed, 15 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile-tools.am b/Makefile-tools.am
> -index c70d9850..fcaf1e01 100644
> ---- a/Makefile-tools.am
> -+++ b/Makefile-tools.am
> -@@ -9,7 +9,7 @@ EXTRA_DIST +=3D                          \
> -       tools/g-ir-tool-template.in \
> -       tools/meson.build
> -
> --TOOL_SUBSTITUTIONS =3D -e s,@libdir\@,$(libdir), -e s,@datarootdir\@,$(=
datarootdir), -e s,@PYTHON_CMD\@,\/usr\/bin\/env\ $(PYTHON),
> -+TOOL_SUBSTITUTIONS =3D -e s,@libdir\@,$(libdir), -e s,@datarootdir\@,$(=
datarootdir), -e s,@PYTHON_CMD\@,\/usr\/bin\/env\ $(PYTHON), -e s,@GIR_DIR\=
@,$(GIR_DIR),g
> -
> - g-ir-scanner: tools/g-ir-tool-template.in _giscanner.la Makefile
> -       $(AM_V_GEN) sed $(TOOL_SUBSTITUTIONS) -e s,@TOOL_MODULE\@,scanner=
main, -e s,@TOOL_FUNCTION\@,scanner_main, $< > $@.tmp && mv $@.tmp $@
> -diff --git a/giscanner/transformer.py b/giscanner/transformer.py
> -index 335e229f..2c412339 100644
> ---- a/giscanner/transformer.py
> -+++ b/giscanner/transformer.py
> -@@ -184,6 +184,7 @@ None."""
> -     def _get_gi_data_dirs(self):
> -         data_dirs =3D utils.get_system_data_dirs()
> -         data_dirs.append(DATADIR)
> -+        data_dirs.append(GIRDIR)
> -         if os.name !=3D 'nt':
> -             # For backwards compatibility, was always unconditionally a=
dded to the list.
> -             data_dirs.append('/usr/share')
> -diff --git a/tests/warn/warningtester.py b/tests/warn/warningtester.py
> -index f17c8889..be5aec13 100644
> ---- a/tests/warn/warningtester.py
> -+++ b/tests/warn/warningtester.py
> -@@ -18,6 +18,7 @@ sys.path.insert(0, path)
> -
> - # Not correct, but enough to get the tests going uninstalled
> - builtins.__dict__['DATADIR'] =3D path
> -+builtins.__dict__['GIRDIR'] =3D ''
> -
> - from giscanner.annotationparser import GtkDocCommentBlockParser
> - from giscanner.ast import Include, Namespace
> -diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
> -index ed33d16b..b9cf0911 100755
> ---- a/tools/g-ir-tool-template.in
> -+++ b/tools/g-ir-tool-template.in
> -@@ -60,6 +60,16 @@ if not os.path.isdir(os.path.join(datadir, 'gir-1.0')=
):
> -
> - builtins.__dict__['DATADIR'] =3D datadir
> -
> -+# Respect gir_dir_prefix for meson and autotools
> -+girdir =3D ''
> -+# for meson
> -+if '@gir_dir_prefix@' and not '@gir_dir_prefix@'.startswith('@'):
> -+    girdir =3D os.path.abspath(os.path.join(filedir, '..', '@gir_dir_pr=
efix@'))
> -+# for autotools
> -+elif '@GIR_DIR@' and not '@GIR_DIR@'.startswith('@'):
> -+    girdir =3D os.path.dirname(os.path.abspath('@GIR_DIR@'))
> -+builtins.__dict__['GIRDIR'] =3D girdir
> -+
> - # Again, relative paths first so that the installation prefix is reloca=
table
> - pylibdir =3D os.path.abspath(os.path.join(filedir, '..', 'lib', 'gobjec=
t-introspection'))
> -
> ---
> -2.17.0
> -
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0003-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/=
gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-w=
rapper-option.patch
> index 45fe27ad61f..b954dcebd84 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003=
-giscanner-add-use-binary-wrapper-option.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003=
-giscanner-add-use-binary-wrapper-option.patch
> @@ -1,4 +1,4 @@
> -From 46dbe963aa6435591c87e788cdb54bc0daeac42e Mon Sep 17 00:00:00 2001
> +From 5f985fd8a24764ccb38af6335d4584d7e33fc3a1 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 19 Oct 2015 18:26:40 +0300
>  Subject: [PATCH] giscanner: add --use-binary-wrapper option
> @@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   1 file changed, 14 insertions(+)
>
>  diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
> -index ccb14e9..061def0 100644
> +index c004fb1..0b6a2d2 100644
>  --- a/giscanner/scannermain.py
>  +++ b/giscanner/scannermain.py
> -@@ -126,6 +126,9 @@ def _get_option_parser():
> +@@ -120,6 +120,9 @@ def _get_option_parser():
>       parser.add_option("", "--program",
>                         action=3D"store", dest=3D"program", default=3DNon=
e,
>                         help=3D"program to execute")
> @@ -29,7 +29,7 @@ index ccb14e9..061def0 100644
>       parser.add_option("", "--program-arg",
>                         action=3D"append", dest=3D"program_args", default=
=3D[],
>                         help=3D"extra arguments to program")
> -@@ -418,6 +421,17 @@ def create_binary(transformer, options, args):
> +@@ -417,6 +420,17 @@ def create_binary(transformer, options, args):
>                                                 gdump_parser.get_error_qu=
ark_functions())
>
>       shlibs =3D resolve_shlibs(options, binary, options.libraries)
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0004-giscanner-add-a-use-ldd-wrapper-option.patch b/meta/recipes-gnome/g=
object-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wra=
pper-option.patch
> index 2e36b64bab7..79264ed0865 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004=
-giscanner-add-a-use-ldd-wrapper-option.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004=
-giscanner-add-a-use-ldd-wrapper-option.patch
> @@ -1,4 +1,4 @@
> -From eba2b999e81d81b5f43bb1f0ab33881786bebdec Mon Sep 17 00:00:00 2001
> +From cba7807888a4a1f1d630d16c51c89859209334b3 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 30 Oct 2015 16:28:46 +0200
>  Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
> @@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
>  diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
> -index 061def0..5cb793e 100644
> +index 0b6a2d2..9013562 100644
>  --- a/giscanner/scannermain.py
>  +++ b/giscanner/scannermain.py
> -@@ -129,6 +129,9 @@ def _get_option_parser():
> +@@ -123,6 +123,9 @@ def _get_option_parser():
>       parser.add_option("", "--use-binary-wrapper",
>                         action=3D"store", dest=3D"wrapper", default=3DNon=
e,
>                         help=3D"wrapper to use for running programs (usef=
ul when cross-compiling)")
> @@ -29,10 +29,10 @@ index 061def0..5cb793e 100644
>                         action=3D"append", dest=3D"program_args", default=
=3D[],
>                         help=3D"extra arguments to program")
>  diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> -index 7b7b2d0..01d21a3 100644
> +index 2c61f2f..d67df95 100644
>  --- a/giscanner/shlibs.py
>  +++ b/giscanner/shlibs.py
> -@@ -102,7 +102,9 @@ def _resolve_non_libtool(options, binary, libraries)=
:
> +@@ -96,7 +96,9 @@ def _resolve_non_libtool(options, binary, libraries):
>               args.extend(libtool)
>               args.append('--mode=3Dexecute')
>           platform_system =3D platform.system()
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/r=
ecipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-co=
nfig-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
> index 2a31117b138..74622680d6d 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005=
-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005=
-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
> @@ -1,4 +1,4 @@
> -From a97d060933932e478c03f1de9513b69bc459eefc Mon Sep 17 00:00:00 2001
> +From 74dab0fb6104ab6b715a24b783f8e8dfa5f83617 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 8 Oct 2015 18:30:35 +0300
>  Subject: [PATCH] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
> @@ -16,7 +16,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   2 files changed, 13 insertions(+), 13 deletions(-)
>
>  diff --git a/Makefile-gir.am b/Makefile-gir.am
> -index 2cd7358..eaf0afd 100644
> +index b59b0a6..24a50c2 100644
>  --- a/Makefile-gir.am
>  +++ b/Makefile-gir.am
>  @@ -58,8 +58,8 @@ else
> @@ -41,7 +41,7 @@ index 2cd7358..eaf0afd 100644
>
>   GOBJECT_LIBRARY=3Dgobject-2.0
>
> -@@ -123,8 +123,8 @@ GObject_2_0_gir_FILES =3D \
> +@@ -124,8 +124,8 @@ GObject_2_0_gir_FILES =3D \
>   BUILT_GIRSOURCES +=3D GObject-2.0.gir
>
>   # gmodule
> @@ -52,7 +52,7 @@ index 2cd7358..eaf0afd 100644
>
>   GMODULE_LIBRARY=3Dgmodule-2.0
>
> -@@ -149,13 +149,13 @@ GModule_2_0_gir_FILES =3D $(GLIB_INCLUDEDIR)/gmodu=
le.h \
> +@@ -150,13 +150,13 @@ GModule_2_0_gir_FILES =3D $(GLIB_INCLUDEDIR)/gmodu=
le.h \
>   BUILT_GIRSOURCES +=3D GModule-2.0.gir
>
>   # gio
> @@ -66,7 +66,7 @@ index 2cd7358..eaf0afd 100644
>   if HAVE_GIO_UNIX
>  -GIO_UNIX_INCLUDEDIR =3D $(shell "${PKG_CONFIG}" --variable=3Dincludedir=
 gio-unix-2.0)/gio-unix-2.0
>  +GIO_UNIX_INCLUDEDIR =3D $(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}=
" --variable=3Dincludedir gio-unix-2.0)/gio-unix-2.0
> - GIO_UNIX_HDRS =3D $(GIO_UNIX_INCLUDEDIR)/gio/*.h
> + GIO_UNIX_HDRS =3D $(wildcard $(GIO_UNIX_INCLUDEDIR)/gio/*.h)
>   GIO_UNIX_PACKAGES =3D gio-unix-2.0
>   else
>  diff --git a/m4/introspection.m4 b/m4/introspection.m4
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0010-meson-add-option-gir-dir-prefix.patch b/meta/recipes-gnome/gobject-=
introspection/gobject-introspection/0010-meson-add-option-gir-dir-prefix.pa=
tch
> deleted file mode 100644
> index 8eec5f867ee..00000000000
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0010=
-meson-add-option-gir-dir-prefix.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From bbc34f00fd30a13eafc607a956de60d822260355 Mon Sep 17 00:00:00 2001
> -From: Kai Kang <kai.kang@windriver.com>
> -Date: Fri, 14 Sep 2018 01:26:38 -0700
> -Subject: [PATCH] meson: add option 'gir-dir-prefix'
> -
> -Add option 'gir-dir-prefix' for meson to make the installation path of
> -.gir files could be configured which has been done for autoconf.
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gobject-intros=
pection/commit/3938b86f5289c2b28a5ec42965b8da4b509445c4]
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - gir/meson.build   | 1 -
> - meson.build       | 8 +++++++-
> - meson_options.txt | 4 ++++
> - 3 files changed, 11 insertions(+), 2 deletions(-)
> -
> -diff --git a/gir/meson.build b/gir/meson.build
> -index 607bbc4..1cb514a 100644
> ---- a/gir/meson.build
> -+++ b/gir/meson.build
> -@@ -34,7 +34,6 @@ gir_files =3D [
> - ]
> -
> - typelibdir =3D join_paths(get_option('libdir'), 'girepository-1.0')
> --girdir =3D join_paths(get_option('datadir'), 'gir-1.0')
> - install_data(gir_files, install_dir: girdir)
> -
> - scanner_command =3D [
> -diff --git a/meson.build b/meson.build
> -index a1432f7..17acd82 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -18,7 +18,12 @@ python =3D pymod.find_installation(get_option('python=
'))
> - cc =3D meson.get_compiler('c')
> - config =3D configuration_data()
> - config.set_quoted('GIR_SUFFIX', 'gir-1.0')
> --config.set_quoted('GIR_DIR', join_paths(get_option('prefix'), get_optio=
n('datadir'), 'gir-1.0'))
> -+gir_dir_prefix =3D get_option('gir-dir-prefix')
> -+if gir_dir_prefix =3D=3D ''
> -+    gir_dir_prefix =3D get_option('datadir')
> -+endif
> -+girdir =3D join_paths(get_option('prefix'), gir_dir_prefix, 'gir-1.0')
> -+config.set_quoted('GIR_DIR', girdir)
> - config.set_quoted('GOBJECT_INTROSPECTION_LIBDIR', join_paths(get_option=
('prefix'), get_option('libdir')))
> -
> - foreach type : ['char', 'short', 'int', 'long']
> -@@ -93,6 +98,7 @@ pkgconfig_conf.set('libdir', join_paths('${prefix}', g=
et_option('libdir')))
> - pkgconfig_conf.set('datarootdir', join_paths('${prefix}', get_option('d=
atadir')))
> - pkgconfig_conf.set('datadir', '${datarootdir}')
> - pkgconfig_conf.set('includedir', join_paths('${prefix}', get_option('in=
cludedir')))
> -+pkgconfig_conf.set('GIR_DIR', join_paths('${prefix}', gir_dir_prefix, '=
gir-1.0'))
> - if host_system =3D=3D 'windows' or host_system =3D=3D 'cygwin'
> -   pkgconfig_conf.set('EXEEXT', '.exe')
> - else
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 49726be..ee6958d 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -21,3 +21,7 @@ option('cairo-libname', type: 'string',
> - option('python', type: 'string', value: 'python3',
> -   description: 'Path or name of the Python interpreter to build for'
> - )
> -+
> -+option('gir-dir-prefix', type: 'string',
> -+  description: 'Intermediate prefix for gir installation under ${prefix=
}'
> -+)
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.58.3.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.60.1.bb
> similarity index 96%
> rename from meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n_1.58.3.bb
> rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_=
1.60.1.bb
> index 4ff9b7bf4bc..f87597f190c 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58=
.3.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60=
.1.bb
> @@ -17,14 +17,12 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_=
version("${PV}", 2)}/${BPN}-$
>             file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_D=
IR-.patch \
>             file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
>             file://0001-giscanner-ignore-error-return-codes-from-ldd-wrap=
per.patch \
> -           file://0001-configure.ac-make-GIR_DIR-configurable.patch \
> -           file://0002-g-ir-tools-respect-gir_dir_prefix.patch \
> -           file://0010-meson-add-option-gir-dir-prefix.patch \
>             file://0001-Port-cross-compilation-support-to-meson.patch \
> +           file://0001-meson.build-disable-tests-when-cross-compiling.pa=
tch \
>             "
>
> -SRC_URI[md5sum] =3D "182432c1f33886be8f4da073218b597d"
> -SRC_URI[sha256sum] =3D "025b632bbd944dcf11fc50d19a0ca086b83baf92b3e34936=
d008180d28cdc3c8"
> +SRC_URI[md5sum] =3D "46fc8a98f6563e64947ac3d574632525"
> +SRC_URI[sha256sum] =3D "d844d1499ecd36f3ec8a3573616186d36626ec0c9a798193=
9e99aa02e9c824b3"
>
>  SRC_URI_append_class-native =3D " file://0001-Relocate-the-repository-di=
rectory-for-native-builds.patch"
>
> @@ -56,7 +54,7 @@ EXTRA_OEMESON_class-target =3D " \
>      -Denable-gi-ldd-wrapper=3D${B}/g-ir-scanner-lddwrapper \
>      -Dpkgconfig-sysroot-path=3D${PKG_CONFIG_SYSROOT_DIR} \
>      ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Denable-introspect=
ion-data=3Dtrue', '-Denable-introspection-data=3Dfalse', d)} \
> -    ${@'-Dgir-dir-prefix=3D${libdir}' if d.getVar('MULTILIBS') else ''} =
\
> +    ${@'-Dgir_dir_prefix=3D${libdir}' if d.getVar('MULTILIBS') else ''} =
\
>  "
>
>  # Need to ensure ld.so.conf exists so prelink-native works
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

