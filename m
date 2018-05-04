Return-Path: <nirbheek.chauhan@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 39F5D74CC3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 13:44:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id m9-v6so6600328qtb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tNBFiqDqR2sp7H9fIWnp7rt7/if1OU8EMmdIotQE/RU=;
	b=XMJKepArSIGBPWDNHNsRVOr+gBx1jaM70yXyX0jfwHIYvp8TpUQ49YSJECURZNiMtr
	2P41Qjfej1JbCBznCvoeE/9rnXgZ8HtQtrOtkfqUTNYXMhUbUGGN99NAiaVXOTiV1ISB
	4mxyml4Gq5FWO9pNaecyoi+pNToo+ZKRyoDhmcjric3tJ9+LZ1AOCDpWUWpL2azBkPxc
	e1r1TteZE7jwwjAR+tZ+BY6wZ1QnuescCO39IHrdx0LWmsc5PC8ge+XxLhdHoIMKMrpg
	N841iKvGytuDRGEnExl3WGXyees9pXgdKUlV7TIAzEmkKYzDxXYB76WSSPizl4DO0QSi
	NorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tNBFiqDqR2sp7H9fIWnp7rt7/if1OU8EMmdIotQE/RU=;
	b=o+EnFJLXHAivFXEnVbo1lpsL8yeMK/ESsGIBS3BMmfK7GUStPETaSoF5daYNgLSNUF
	o0z2+JHTg/7HinJH/iS3HSpOwlNXSYW0MmxXLpiJYTdh+tXefXbXGJOjqAb9ax/PJWV8
	hd8VKA4JhxL77EuAqr4MtHbSPH0+jU08tCTKLt+SGiW0JFhSvaU0qME5Bd4YE6JjkS+X
	Xp/WgjevOhiJVPCKD2+jF8YSnu12WYRJtDosqemPn3LQnXv8TzyXRp3G1YY23AWWes5+
	72sdXCFO1xymlkNq4X9SlZcdtf7/fV3Nd/L8NxWISIRmdMpPnJidCI4y3BA49HZHsDx4
	wMIQ==
X-Gm-Message-State: ALQs6tAc0+lFN6TpuwmnBqwAgKD24bCR7admd9ViV9m/3hVpp9+eir0L
	leMQV1zrK/1hSmp1K/JK1pDtP3OKd4c1MMFixPU=
X-Google-Smtp-Source: AB8JxZqIK1B5uPlGv5pjAdLsqc0hM98Z9SbRas2PG1sohbCE8cojnwQ+bMA0eJ1C34YU0FYjuEkUihY4W/jq6Qgdzws=
X-Received: by 2002:ac8:1188:: with SMTP id
	d8-v6mr5699907qtj.352.1525437816021; 
	Fri, 04 May 2018 05:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
In-Reply-To: <20180504123244.43049-12-alexander.kanavin@linux.intel.com>
From: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Fri, 04 May 2018 12:43:25 +0000
Message-ID: <CADqQcK4EzdMOepc+0f1vLdzMQ7pBWgBcJnMue8cG7FM9_gCx5A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0
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
X-List-Received-Date: Fri, 04 May 2018 13:44:26 -0000
Content-Type: text/plain; charset="UTF-8"

Would be nice if OE could test 0.46.0 soon and report any regressions to
Meson. There will be a bugfix 0.46.1 release soon with known regressions
fixed:

https://github.com/mesonbuild/meson/milestone/26?closed=1
On Fri, May 4, 2018 at 6:10 PM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Rebase a couple of patches

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   ...rospection-determine-g-ir-scanner-and-g-i.patch | 17 +++----
>   .../meson/meson/0003-native_bindir.patch           | 57
++++++++++++----------
>   .../meson/{meson_0.45.1.bb => meson_0.46.0.bb}     |  4 +-
>   3 files changed, 41 insertions(+), 37 deletions(-)
>   rename meta/recipes-devtools/meson/{meson_0.45.1.bb => meson_0.46.0.bb}
(83%)

> diff --git
a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
> index ded42d14f7f..f32267d0c41 100644
> ---
a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
> +++
b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
> @@ -1,7 +1,7 @@
> -From 972667e0d789a6969a5d79249404f3539f891810 Mon Sep 17 00:00:00 2001
> +From 0b860cb8a22ae876b6088939dbabca216bc29431 Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date: Fri, 4 Aug 2017 16:18:47 +0300
> -Subject: [PATCH 1/2] gobject-introspection: determine g-ir-scanner and
> +Subject: [PATCH] gobject-introspection: determine g-ir-scanner and
>    g-ir-compiler paths from pkgconfig

>   Do not hardcode the name of those binaries; gobject-introspection
> @@ -16,19 +16,19 @@ Signed-off-by: Alexander Kanavin <
alex.kanavin@gmail.com>
>    1 file changed, 2 insertions(+), 2 deletions(-)

>   diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index 4f7fe30..9610cf6 100644
> +index b29bab9..dc4c401 100644
>   --- a/mesonbuild/modules/gnome.py
>   +++ b/mesonbuild/modules/gnome.py
> -@@ -390,8 +390,6 @@ class GnomeModule(ExtensionModule):
> +@@ -393,8 +393,6 @@ class GnomeModule(ExtensionModule):
>                raise MesonException('Gir takes one argument')
>            if kwargs.get('install_dir'):
>                raise MesonException('install_dir is not supported with
generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
> --        giscanner = find_program('g-ir-scanner', 'Gir')
> --        gicompiler = find_program('g-ir-compiler', 'Gir')
> +-        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
> +-        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
>            girtarget = args[0]
>            while hasattr(girtarget, 'held_object'):
>                girtarget = girtarget.held_object
> -@@ -402,6 +400,8 @@ class GnomeModule(ExtensionModule):
> +@@ -405,6 +403,8 @@ class GnomeModule(ExtensionModule):
>                    self.gir_dep =
PkgConfigDependency('gobject-introspection-1.0',
>                                                       state.environment,
>                                                       {'native': True})
> @@ -37,6 +37,3 @@ index 4f7fe30..9610cf6 100644
>                pkgargs = self.gir_dep.get_compile_args()
>            except Exception:
>                raise MesonException('gobject-introspection dependency was
not found, gir cannot be generated.')
> ---
> -2.15.0
> -
> diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> index af5e6a190bf..f00327714b6 100644
> --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> @@ -1,7 +1,7 @@
> -From ffa72eac56558aa4171dd70ac1e9c27a07338fa2 Mon Sep 17 00:00:00 2001
> +From 0eec9428376450917098c68539a6c9dd60b85d93 Mon Sep 17 00:00:00 2001
>   From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>   Date: Wed, 15 Nov 2017 15:05:01 +0100
> -Subject: [PATCH 4/4] native_bindir
> +Subject: [PATCH] native_bindir

>   Some libraries, like QT, have pre-processors that convert their input
>   files into something that the cross-compiler can process. We find the
> @@ -17,15 +17,15 @@ Upstream-Status: Inappropriate [OE specific]
>   Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

>   ---
> - mesonbuild/dependencies/base.py | 16 ++++++++++------
> + mesonbuild/dependencies/base.py | 19 +++++++++++--------
>    mesonbuild/dependencies/ui.py   |  6 +++---
> - 2 files changed, 13 insertions(+), 9 deletions(-)
> + 2 files changed, 14 insertions(+), 11 deletions(-)

>   diff --git a/mesonbuild/dependencies/base.py
b/mesonbuild/dependencies/base.py
> -index bf79bc5..c9fd08c 100644
> +index 0114a14..f4f19c5 100644
>   --- a/mesonbuild/dependencies/base.py
>   +++ b/mesonbuild/dependencies/base.py
> -@@ -131,7 +131,7 @@ class Dependency:
> +@@ -141,7 +141,7 @@ class Dependency:
>        def need_threads(self):
>            return False

> @@ -34,7 +34,7 @@ index bf79bc5..c9fd08c 100644
>            raise DependencyException('{!r} is not a pkgconfig
dependency'.format(self.name))

>        def get_configtool_variable(self, variable_name):
> -@@ -150,7 +150,7 @@ class InternalDependency(Dependency):
> +@@ -178,7 +178,7 @@ class InternalDependency(Dependency):
>            self.sources = sources
>            self.ext_deps = ext_deps

> @@ -43,24 +43,34 @@ index bf79bc5..c9fd08c 100644
>            raise DependencyException('Method "get_pkgconfig_variable()" is
'
>                                      'invalid for an internal dependency')

> -@@ -425,10 +425,14 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -517,11 +517,14 @@ class PkgConfigDependency(ExternalDependency):
>            return s.format(self.__class__.__name__, self.name,
self.is_found,
>                            self.version_reqs)

> --    def _call_pkgbin(self, args, env=None):
> -+    def _call_pkgbin(self, args, env=None, use_native=False):
> -         if not env:
> -             env = os.environ
> --        p, out = Popen_safe([self.pkgbin] + args, env=env)[0:2]
> +-    def _call_pkgbin_real(self, args, env):
> +-        p, out = Popen_safe(self.pkgbin.get_command() + args,
env=env)[0:2]
> ++    def _call_pkgbin_real(self, args, env, use_native=False):
>   +        if use_native:
> -+            pkgbin = [self.pkgbin + "-native"]
> ++            p, out = Popen_safe(self.pkgbin.get_command() + "-native" +
args, env=env)[0:2]
>   +        else:
> -+            pkgbin = [self.pkgbin]
> -+        p, out = Popen_safe(pkgbin + args, env=env)[0:2]
> ++            p, out = Popen_safe(self.pkgbin.get_command() + args,
env=env)[0:2]
>            return p.returncode, out.strip()

> +-    def _call_pkgbin(self, args, env=None):
> ++    def _call_pkgbin(self, args, env=None, use_native=False):
> +         if env is None:
> +             fenv = env
> +             env = os.environ
> +@@ -530,7 +533,7 @@ class PkgConfigDependency(ExternalDependency):
> +         targs = tuple(args)
> +         cache = PkgConfigDependency.pkgbin_cache
> +         if (self.pkgbin, targs, fenv) not in cache:
> +-            cache[(self.pkgbin, targs, fenv)] =
self._call_pkgbin_real(args, env)
> ++            cache[(self.pkgbin, targs, fenv)] =
self._call_pkgbin_real(args, env, use_native)
> +         return cache[(self.pkgbin, targs, fenv)]
> +
>        def _convert_mingw_paths(self, args):
> -@@ -522,7 +526,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -630,7 +633,7 @@ class PkgConfigDependency(ExternalDependency):
>                # linkers such as MSVC, so prepend them.
>                self.link_args = ['-L' + lp for lp in libpaths] +
self.link_args

> @@ -69,7 +79,7 @@ index bf79bc5..c9fd08c 100644
>            options = ['--variable=' + variable_name, self.name]

>            if 'define_variable' in kwargs:
> -@@ -535,7 +539,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -643,7 +646,7 @@ class PkgConfigDependency(ExternalDependency):

>                options = ['--define-variable=' + '='.join(definition)] +
options

> @@ -79,10 +89,10 @@ index bf79bc5..c9fd08c 100644
>            if ret != 0:
>                if self.required:
>   diff --git a/mesonbuild/dependencies/ui.py
b/mesonbuild/dependencies/ui.py
> -index 1db518c..4ed1d04 100644
> +index 2f31196..916f648 100644
>   --- a/mesonbuild/dependencies/ui.py
>   +++ b/mesonbuild/dependencies/ui.py
> -@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
> +@@ -240,7 +240,7 @@ class QtBaseDependency(ExternalDependency):
>            self.bindir = self.get_pkgconfig_host_bins(core)
>            if not self.bindir:
>                # If exec_prefix is not defined, the pkg-config file is
broken
> @@ -91,7 +101,7 @@ index 1db518c..4ed1d04 100644
>                if prefix:
>                    self.bindir = os.path.join(prefix, 'bin')

> -@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
> +@@ -374,7 +374,7 @@ class Qt4Dependency(QtBaseDependency):
>            applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
>            for application in applications:
>                try:
> @@ -100,7 +110,7 @@ index 1db518c..4ed1d04 100644
>                except MesonException:
>                    pass

> -@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
> +@@ -384,7 +384,7 @@ class Qt5Dependency(QtBaseDependency):
>            QtBaseDependency.__init__(self, 'qt5', env, kwargs)

>        def get_pkgconfig_host_bins(self, core):
> @@ -109,6 +119,3 @@ index 1db518c..4ed1d04 100644


>    # There are three different ways of depending on SDL2:
> ---
> -2.15.1
> -
> diff --git a/meta/recipes-devtools/meson/meson_0.45.1.bb
b/meta/recipes-devtools/meson/meson_0.46.0.bb
> similarity index 83%
> rename from meta/recipes-devtools/meson/meson_0.45.1.bb
> rename to meta/recipes-devtools/meson/meson_0.46.0.bb
> index 9decdd0c24c..7334045e05f 100644
> --- a/meta/recipes-devtools/meson/meson_0.45.1.bb
> +++ b/meta/recipes-devtools/meson/meson_0.46.0.bb
> @@ -10,8 +10,8 @@ SRC_URI = "
https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar

file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
>              file://0003-native_bindir.patch \
>              "
> -SRC_URI[md5sum] = "4d9c7b3a7365b7b472f00af14e034949"
> -SRC_URI[sha256sum] =
"4d0bb0dbb1bb556cb7a4092fdfea3d6e76606bd739a4bc97481c2d7bc6200afb"
> +SRC_URI[md5sum] = "e3301606017e364a0d7e1c3b755e7a28"
> +SRC_URI[sha256sum] =
"b7df91b01a358a8facdbfa33596a47cda38a760435ab55e1985c0bff06a9cbf0"
>   UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"

>   inherit setuptools3
> --
> 2.16.1

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

