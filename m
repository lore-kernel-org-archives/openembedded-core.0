Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDB7E7FEFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 18:44:51 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id z3so1987501qvn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 10:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u90WdC2ZuNU+UBerl3EZGrgAdBWxkIba0bCUSkA7/xo=;
	b=dfjaZ7eGuerdkpW2Sncu9DIH67wCR7ZjHlM9LTuAbi4OluSkCbpKd6Uxf35xKCZvyZ
	/5nYQ6NXPW9nOJUK8hnJmHaHMpGY9CHpqmO/OZUhb+a2w27E4oGM9+WRt62Sk6yMfDXv
	+/kaorGRwj8UpZuW8CthJswxk9uBQOh2YlozANokH1sKeaMmTgAGZXfHdQXC7cQsp03p
	Ypffx49ifUvlktw0Kcf4fRnjoA10CqMuCvJ7gesKFenfgsHKn6WwyjGSuLiAS0cPPUsM
	I2clLaw0vCFTIyZ4PqX2HYQUFau+4IpdcSX1+CUE5SYleVX8MV461T9CQOqIPAJqNE9O
	APDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u90WdC2ZuNU+UBerl3EZGrgAdBWxkIba0bCUSkA7/xo=;
	b=CvIIw1FvER8M0+nR265wlGM9Ihm8sThvThR9gAUzb9VhirCFl8RxgbEKDC2wBYHqon
	8TySexo5y/owly3uGyRgCuM8sFIEPXKWzhm2Pv37ZBUZ/5tF8WdlwQ1/wdS1VQ/XaOp/
	61C5Lxm8sNsRDcuY2sX9IXN5RXpL1BrVD5Lni8WHuq4fiCIwbkVDAurNjjyldhrAUwe0
	p4AyOrKVjeaiDrkNlHDoHwcPceEi7xku6wqLuwV+zC/Jw0uhSBAQ/6UacnULl55DQnGh
	BKZ7BYND+NXBOzqI1+xaCLIowXV4eKhz3TCslCQySgwwgivt5S6G9BtXyHoh56gUaHAQ
	ZRrg==
X-Gm-Message-State: APjAAAXa1IistN3eZpSsh8TWO6FAJkGOUrLlqRwlX57tqUzeEOamDIOX
	9Q+xS2YVDLPxqQrICttS4Sujk7ObksS1N7yiUZA=
X-Google-Smtp-Source: APXvYqy/sqpVi21MLp+YrilYlhwTAZJxuyV5rh6bZcnCaD5/Jz2E2ymSzMrFyna+mK15RJvIlq4afvsn1v7B5nVTv8Q=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr6303421qvm.206.1579632292399; 
	Tue, 21 Jan 2020 10:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-24-alex.kanavin@gmail.com>
In-Reply-To: <20200120172510.22648-24-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 10:44:29 -0800
Message-ID: <CAMKF1sqfp9YAQ+uBntgqjQ4QEZs=dR8r38F2zN5HrN62V4c7sg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/24] meson: update 0.52.1 -> 0.53.0
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
X-List-Received-Date: Tue, 21 Jan 2020 18:44:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 9:28 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/meson.bbclass                       |  9 ++++++++-
>  meta/recipes-devtools/meson/meson.inc            |  4 ++--
>  .../0001-Make-CPU-family-warnings-fatal.patch    | 12 ++++++------
>  ...-do-not-manipulate-the-environment-when.patch | 16 ++++++++--------
>  ...-Support-building-allarch-recipes-again.patch |  6 +++---
>  .../meson/meson/0003-native_bindir.patch         | 16 ++++++++--------
>  .../meson/{meson_0.52.1.bb => meson_0.53.0.bb}   |  0
>  ...meson_0.52.1.bb => nativesdk-meson_0.53.0.bb} |  0
>  8 files changed, 35 insertions(+), 28 deletions(-)
>  rename meta/recipes-devtools/meson/{meson_0.52.1.bb => meson_0.53.0.bb} (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.52.1.bb => nativesdk-meson_0.53.0.bb} (100%)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 1ef34a999c8..1837c9468e6 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -85,13 +85,16 @@ addtask write_config before do_configure
>  do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
>  do_write_config() {
>      # This needs to be Py to split the args into single-element lists
> +
> +    # Meson requires ld to be 'bfd, 'lld' or 'gold' from 0.53 onwards
> +    # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3
>      cat >${WORKDIR}/meson.cross <<EOF
>  [binaries]
>  c = ${@meson_array('CC', d)}
>  cpp = ${@meson_array('CXX', d)}
>  ar = ${@meson_array('AR', d)}
>  nm = ${@meson_array('NM', d)}
> -ld = ${@meson_array('LD', d)}
> +ld = 'bfd'

hardcoding to bfg would ignore gold or lld if users want to use those
linkers. Since its a fallback
and this expects linker to be invoked by compiler driver, since its
simply converting into -fuse-ld=<ld>
option to compiler, whereas in OE the var LD is set to represent bare
linker. Perhaps leaving it unset is
better, we already have LD set in env.

>  strip = ${@meson_array('STRIP', d)}
>  readelf = ${@meson_array('READELF', d)}
>  pkgconfig = 'pkg-config'
> @@ -122,6 +125,10 @@ EOF
>  CONFIGURE_FILES = "meson.build"
>
>  meson_do_configure() {
> +    # Meson requires this to be 'bfd, 'lld' or 'gold' from 0.53 onwards
> +    # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3
> +    unset LD
> +
>      # Work around "Meson fails if /tmp is mounted with noexec #2972"
>      mkdir -p "${B}/meson-private/tmp"
>      export TMPDIR="${B}/meson-private/tmp"
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> index 881a14c7f0a..c0ce7d338bc 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -17,8 +17,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
>             file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
>             "
> -SRC_URI[sha256sum] = "0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035"
> -SRC_URI[md5sum] = "a5f0c99567d772508f649a28ded7f8ad"
> +SRC_URI[sha256sum] = "035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65c9bb6e1cc9730a9d3f6"
> +SRC_URI[md5sum] = "3a0313d040ded973d84cbec368c2e1d3"
>
>  SRC_URI_append_class-native = " \
>      file://0001-Make-CPU-family-warnings-fatal.patch \
> diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> index d4264cee526..74d5b4ca66e 100644
> --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> @@ -1,4 +1,4 @@
> -From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:00:00 2001
> +From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 3 Jul 2018 13:59:09 +0100
>  Subject: [PATCH] Make CPU family warnings fatal
> @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index 29d7422..5fb00a4 100644
> +index 0f277a7..24578ea 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
> -@@ -190,7 +190,7 @@ class MachineInfo:
> +@@ -192,7 +192,7 @@ class MachineInfo:
>
>           cpu_family = literal['cpu_family']
>           if cpu_family not in known_cpu_families:
> @@ -25,15 +25,15 @@ index 29d7422..5fb00a4 100644
>           endian = literal['endian']
>           if endian not in ('little', 'big'):
>  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> -index a9bc2b8..b91c8da 100644
> +index dc8b14f..3aab71e 100644
>  --- a/mesonbuild/environment.py
>  +++ b/mesonbuild/environment.py
> -@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
> +@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
>           trial = 'parisc'
>
>       if trial not in known_cpu_families:
>  -        mlog.warning('Unknown CPU family {!r}, please report this at '
> --                     'https://github.com/mesonbuild/meson/issues/new with the'
> +-                     'https://github.com/mesonbuild/meson/issues/new with the '
>  -                     'output of `uname -a` and `cat /proc/cpuinfo`'.format(trial))
>  +        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
>
> diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> index bf715d1e9f4..eb0e90dbdda 100644
> --- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> @@ -1,4 +1,4 @@
> -From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 2001
> +From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 19 Nov 2018 14:24:26 +0100
>  Subject: [PATCH] python module: do not manipulate the environment when calling
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 12 deletions(-)
>
>  diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> -index 9cfbd6f..3ff687a 100644
> +index 07be318..b770603 100644
>  --- a/mesonbuild/modules/python.py
>  +++ b/mesonbuild/modules/python.py
> -@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):
> +@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
>                   old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
>                   old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
>
> @@ -25,10 +25,10 @@ index 9cfbd6f..3ff687a 100644
>  -                    os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
>  -
>                   try:
> -                     self.pkgdep = PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
> -                     mlog.debug('Found "python-{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_version, pkg_libdir))
> -@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):
> -                     mlog.debug('"python-{}" could not be found in LIBPC ({})'.format(pkg_version, pkg_libdir))
> +                     self.pkgdep = PkgConfigDependency(pkg_name, environment, kwargs)
> +                     mlog.debug('Found "{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_name, pkg_libdir))
> +@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
> +                     mlog.debug('"{}" could not be found in LIBPC ({})'.format(pkg_name, pkg_libdir))
>                       mlog.debug(e)
>
>  -                if old_pkg_path is not None:
> @@ -39,5 +39,5 @@ index 9cfbd6f..3ff687a 100644
>  -                else:
>  -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
>               else:
> -                 mlog.debug('"python-{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_version, pkg_libdir))
> +                 mlog.debug('"{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_name, pkg_libdir))
>
> diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> index c8c7b298de3..1529ebe9fea 100644
> --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> @@ -1,4 +1,4 @@
> -From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:00:00 2001
> +From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Thu, 26 Jul 2018 16:32:49 +0200
>  Subject: [PATCH] Support building allarch recipes again
> @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index 5fb00a4..f5702ba 100644
> +index 24578ea..216e71f 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
>  @@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
> @@ -22,5 +22,5 @@ index 5fb00a4..f5702ba 100644
>   known_cpu_families = (
>  +    'allarch',
>       'aarch64',
> +     'alpha',
>       'arc',
> -     'arm',
> diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> index 14a9a136664..76c1aa9ac1c 100644
> --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> @@ -1,4 +1,4 @@
> -From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:00:00 2001
> +From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:00:00 2001
>  From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>  Date: Wed, 15 Nov 2017 15:05:01 +0100
>  Subject: [PATCH] native_bindir
> @@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>   2 files changed, 14 insertions(+), 11 deletions(-)
>
>  diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
> -index 35f0175..b39cba6 100644
> +index f17b9f2..b5c9c92 100644
>  --- a/mesonbuild/dependencies/base.py
>  +++ b/mesonbuild/dependencies/base.py
>  @@ -184,7 +184,7 @@ class Dependency:
> @@ -43,7 +43,7 @@ index 35f0175..b39cba6 100644
>           raise DependencyException('Method "get_pkgconfig_variable()" is '
>                                     'invalid for an internal dependency')
>
> -@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDependency):
>           return s.format(self.__class__.__name__, self.name, self.is_found,
>                           self.version_reqs)
>
> @@ -65,7 +65,7 @@ index 35f0175..b39cba6 100644
>           # Always copy the environment since we're going to modify it
>           # with pkg-config variables
>           if env is None:
> -@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDependency):
>           targs = tuple(args)
>           cache = PkgConfigDependency.pkgbin_cache
>           if (self.pkgbin, targs, fenv) not in cache:
> @@ -73,8 +73,8 @@ index 35f0175..b39cba6 100644
>  +            cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env, use_native)
>           return cache[(self.pkgbin, targs, fenv)]
>
> -     def _convert_mingw_paths(self, args):
> -@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDependency):
> +     def _convert_mingw_paths(self, args: List[str]) -> List[str]:
> +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
>                                         (self.name, out_raw))
>           self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
>
> @@ -83,7 +83,7 @@ index 35f0175..b39cba6 100644
>           options = ['--variable=' + variable_name, self.name]
>
>           if 'define_variable' in kwargs:
> -@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDependency):
>
>               options = ['--define-variable=' + '='.join(definition)] + options
>
> @@ -93,7 +93,7 @@ index 35f0175..b39cba6 100644
>           if ret != 0:
>               if self.required:
>  diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
> -index 6d784e6..73a9e13 100644
> +index bdcc4a7..e2de847 100644
>  --- a/mesonbuild/dependencies/ui.py
>  +++ b/mesonbuild/dependencies/ui.py
>  @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
> diff --git a/meta/recipes-devtools/meson/meson_0.52.1.bb b/meta/recipes-devtools/meson/meson_0.53.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.52.1.bb
> rename to meta/recipes-devtools/meson/meson_0.53.0.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

