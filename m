Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.8911.1621000784594776340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UIgc7QWi;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id j13so15297349vsf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B8rHuQa3T2D34O/BNHNNbtWoBgUs6veKjmlOet/Kc8I=;
        b=UIgc7QWipx3SGFzNm3J28GJyqABxJvsc+rFbVsBXhcPThoFUY7yQKSg5DEdnatzuum
         MFeyF9gPr9MdsqDFSOxdxi7LqJvLyhC7a5w3nnIS0Ju31mNfgZw18onHjjuZrfOSJDa6
         y/RY4DQ2A8w4lA2ID8pPiWn/wgkO1B4nx/tntu3mVBMKBmqCYEWjoXrNFmoKtTr3Y5FY
         P5Nz2AHz1IKRhn5H8lk6AbB5e2YFJ5HEBn7hXVkKb2d+Vl9RHNXMflhLAMD59IIAIs2D
         zk1X8Zywyy6yAdCc7RuJkmfbVA5K8AOgdPxfeoDrto4yjHdFvqNeb0aEkih33fQzxTTR
         1+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B8rHuQa3T2D34O/BNHNNbtWoBgUs6veKjmlOet/Kc8I=;
        b=hkYPVZGVJ7NRuXoCVDO0uW+5Qiz9ws3eqLLGHy+nL3G88K/Ntfzz2hSz8ZUbggmKiA
         fp+mGGmkfLuSkbLlyoP5x6S4qXNi1sLce2CiNm2ivsFm2u+N9isBOX4Yd49tDYVWPCHi
         NlYy012Bk5JWK9Qtk8JGxp5M+Uz5XNzeN7DMYrW/f4mCqK1DjTRGLSid8A/Pdml5+W1T
         mVf2E2SGTSX8MgVKSSrPCysv23DaXy4fUgpkHIDZwB6n5/8V8xM6jP0ctvDTe4QJH59Y
         uWEpoPkBehGDJoSvlDc5nq1hJLAsOemBrRIvGlGRVHczInY+0tg+IXRYo0EUYOnxOfJA
         NmYg==
X-Gm-Message-State: AOAM531MD5teR5urXwaMtzaUNjHI8suMd/8JItrqGsyzhXgcKogTAohE
	/gU2S5FrH9LiX2Q+kVsZeRFNxwy0LLemE2cNyao=
X-Google-Smtp-Source: ABdhPJznX5qY0s/w+RYMkMfPifYL25YDgGYJPrAvq9E8tA5uC/JXj+D2yxQojcfxVoLmO/nEUDXM9m4K6b55wOudhFU=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr41214956vsm.41.1621000783550;
 Fri, 14 May 2021 06:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
 <20210513205622.60879-4-alex.kanavin@gmail.com> <CAMKF1spKq8-K7DW42rc0X0hAvYv=1nz9mwcX1NsS5j+6wyeP3Q@mail.gmail.com>
In-Reply-To: <CAMKF1spKq8-K7DW42rc0X0hAvYv=1nz9mwcX1NsS5j+6wyeP3Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 14 May 2021 15:59:32 +0200
Message-ID: <CANNYZj-wDbwCusowfkfwMwOeweWShHweRxXfxK38YmoHHMmJCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] meson: update 0.57.2 -> 0.58.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e25d5205c24aa773"

--000000000000e25d5205c24aa773
Content-Type: text/plain; charset="UTF-8"

Probably resolved by updating to 40.1?
https://gitlab.gnome.org/GNOME/nautilus/-/tags

Alex

On Fri, 14 May 2021 at 15:46, Khem Raj <raj.khem@gmail.com> wrote:

> breaks nautilus   https://errors.yoctoproject.org/Errors/Details/581184/
>
> On Thu, May 13, 2021 at 1:56 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Rebase patches; dropped chunks (and cross-prop-default.patch)
> > have been removed upstream.
> >
> > Move native-only patches to all-patches, as they're a pain to rebase
> > separately.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/meson/meson.inc         |  11 +-
> >  .../0001-Make-CPU-family-warnings-fatal.patch |  18 +-
> >  ...sues-that-arise-when-cross-compiling.patch |   8 +-
> >  ...-not-manipulate-the-environment-when.patch |  14 +-
> >  ...pport-building-allarch-recipes-again.patch |  10 +-
> >  .../meson/meson/0003-native_bindir.patch      |  58 +--
> >  ...2c19e693a69b0650ce6c8a8903163c959996.patch | 412 ++++++++++++++++++
> >  .../meson/meson/cross-prop-default.patch      |  23 -
> >  .../{meson_0.57.2.bb => meson_0.58.0.bb}      |   0
> >  ...on_0.57.2.bb => nativesdk-meson_0.58.0.bb} |   0
> >  10 files changed, 456 insertions(+), 98 deletions(-)
> >  create mode 100644
> meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
> >  delete mode 100644
> meta/recipes-devtools/meson/meson/cross-prop-default.patch
> >  rename meta/recipes-devtools/meson/{meson_0.57.2.bb => meson_0.58.0.bb}
> (100%)
> >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.57.2.bb =>
> nativesdk-meson_0.58.0.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> > index 10e7d8a1ce..f60381453b 100644
> > --- a/meta/recipes-devtools/meson/meson.inc
> > +++ b/meta/recipes-devtools/meson/meson.inc
> > @@ -12,16 +12,13 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> >             file://0003-native_bindir.patch \
> >
>  file://0001-python-module-do-not-manipulate-the-environment-when.patch \
> >             file://disable-rpath-handling.patch \
> > -           file://cross-prop-default.patch \
> >
>  file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
> >             file://gi-target-dep.patch \
> > +           file://0001-Make-CPU-family-warnings-fatal.patch \
> > +           file://0002-Support-building-allarch-recipes-again.patch \
> > +           file://4e312c19e693a69b0650ce6c8a8903163c959996.patch \
> >             "
> > -SRC_URI[sha256sum] =
> "3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
> > -
> > -SRC_URI_append_class-native = " \
> > -    file://0001-Make-CPU-family-warnings-fatal.patch \
> > -    file://0002-Support-building-allarch-recipes-again.patch \
> > -"
> > +SRC_URI[sha256sum] =
> "f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd"
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> >  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > index 300797f9ee..bcccfabd17 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > @@ -1,34 +1,33 @@
> > -From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00 2001
> > +From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Tue, 3 Jul 2018 13:59:09 +0100
> > -Subject: [PATCH] Make CPU family warnings fatal
> > +Subject: [PATCH 1/2] Make CPU family warnings fatal
> >
> >  Upstream-Status: Inappropriate [OE specific]
> >  Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> >  ---
> >   mesonbuild/envconfig.py   | 2 +-
> >   mesonbuild/environment.py | 4 +---
> >   2 files changed, 2 insertions(+), 4 deletions(-)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index ba35d16..2d3c34c 100644
> > +index c6a4df3..4d58c91 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> > -@@ -262,7 +262,7 @@ class MachineInfo:
> > +@@ -266,7 +266,7 @@ class MachineInfo:
> >
> >           cpu_family = literal['cpu_family']
> >           if cpu_family not in known_cpu_families:
> > --            mlog.warning('Unknown CPU family {}, please report this at
> https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
> > +-            mlog.warning(f'Unknown CPU family {cpu_family}, please
> report this at https://github.com/mesonbuild/meson/issues/new')
> >  +            raise EnvironmentException('Unknown CPU family {}, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for
> directions.'.format(cpu_family))
> >
> >           endian = literal['endian']
> >           if endian not in ('little', 'big'):
> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index 756dd81..4d2c2b6 100644
> > +index fc9b703..eea8345 100644
> >  --- a/mesonbuild/environment.py
> >  +++ b/mesonbuild/environment.py
> > -@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
> > +@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
> >               trial = 'ppc64'
> >
> >       if trial not in known_cpu_families:
> > @@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644
> >
> >       return trial
> >
> > +--
> > +2.24.0
> > +
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> > index 471f1500da..ce90e515da 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> > @@ -1,4 +1,4 @@
> > -From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001
> > +From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Fri, 4 Aug 2017 16:16:41 +0300
> >  Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
> > @@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   1 file changed, 4 insertions(+)
> >
> >  diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> > -index bcf77b9..6a4b472 100644
> > +index dc2979e..c9ff9bd 100644
> >  --- a/mesonbuild/modules/gnome.py
> >  +++ b/mesonbuild/modules/gnome.py
> > -@@ -974,6 +974,10 @@ This will become a hard error in the future.''')
> > -             args.append('--{}={}'.format(program_name, path))
> > +@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
> > +             args.append(f'--{program_name}={path}')
> >           if namespace:
> >               args.append('--namespace=' + namespace)
> >  +        gtkdoc_exe_wrapper =
> state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> > index eb0e90dbdd..fdadc6869b 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> > @@ -1,4 +1,4 @@
> > -From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001
> > +From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 19 Nov 2018 14:24:26 +0100
> >  Subject: [PATCH] python module: do not manipulate the environment when
> calling
> > @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   1 file changed, 12 deletions(-)
> >
> >  diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> > -index 07be318..b770603 100644
> > +index 422155b..aaf5844 100644
> >  --- a/mesonbuild/modules/python.py
> >  +++ b/mesonbuild/modules/python.py
> > -@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
> > +@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
> >                   old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
> >                   old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
> >
> > @@ -26,9 +26,9 @@ index 07be318..b770603 100644
> >  -
> >                   try:
> >                       self.pkgdep = PkgConfigDependency(pkg_name,
> environment, kwargs)
> > -                     mlog.debug('Found "{}" via pkgconfig lookup in
> LIBPC ({})'.format(pkg_name, pkg_libdir))
> > -@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
> > -                     mlog.debug('"{}" could not be found in LIBPC
> ({})'.format(pkg_name, pkg_libdir))
> > +                     mlog.debug(f'Found "{pkg_name}" via pkgconfig
> lookup in LIBPC ({pkg_libdir})')
> > +@@ -83,13 +78,6 @@ class PythonDependency(ExternalDependency):
> > +                     mlog.debug(f'"{pkg_name}" could not be found in
> LIBPC ({pkg_libdir})')
> >                       mlog.debug(e)
> >
> >  -                if old_pkg_path is not None:
> > @@ -39,5 +39,5 @@ index 07be318..b770603 100644
> >  -                else:
> >  -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
> >               else:
> > -                 mlog.debug('"{}" could not be found in LIBPC ({}),
> this is likely due to a relocated python installation'.format(pkg_name,
> pkg_libdir))
> > +                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC
> ({pkg_libdir}), this is likely due to a relocated python installation')
> >
> > diff --git
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > index f6175a194c..dcc1ce9c27 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > @@ -1,19 +1,18 @@
> > -From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00 2001
> > +From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00 2001
> >  From: Peter Kjellerstedt <pkj@axis.com>
> >  Date: Thu, 26 Jul 2018 16:32:49 +0200
> > -Subject: [PATCH] Support building allarch recipes again
> > +Subject: [PATCH 2/2] Support building allarch recipes again
> >
> >  This registers "allarch" as a known CPU family.
> >
> >  Upstream-Status: Inappropriate [OE specific]
> >  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > -
> >  ---
> >   mesonbuild/envconfig.py | 1 +
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index 2d3c34c..b9e7908 100644
> > +index 4d58c91..ff01ad1 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> >  @@ -36,6 +36,7 @@ from pathlib import Path
> > @@ -24,3 +23,6 @@ index 2d3c34c..b9e7908 100644
> >       'aarch64',
> >       'alpha',
> >       'arc',
> > +--
> > +2.24.0
> > +
> > diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > index ed85116c4f..89257b9e05 100644
> > --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > @@ -1,4 +1,4 @@
> > -From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00 2001
> > +From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 2001
> >  From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> >  Date: Wed, 15 Nov 2017 15:05:01 +0100
> >  Subject: [PATCH] native_bindir
> > @@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com>
> >
> >  ---
> >   mesonbuild/dependencies/base.py | 19 +++++++++++--------
> > - mesonbuild/dependencies/ui.py   |  6 +++---
> > - 2 files changed, 14 insertions(+), 11 deletions(-)
> > + 1 file changed, 11 insertions(+), 8 deletions(-)
> >
> >  diff --git a/mesonbuild/dependencies/base.py
> b/mesonbuild/dependencies/base.py
> > -index cd77b4b..7e3f338 100644
> > +index 14380d4..d0c443f 100644
> >  --- a/mesonbuild/dependencies/base.py
> >  +++ b/mesonbuild/dependencies/base.py
> > -@@ -192,7 +192,7 @@ class Dependency:
> > +@@ -179,7 +179,7 @@ class Dependency:
> >       def get_exe_args(self, compiler):
> >           return []
> >
> >  -    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any]) -> str:
> >  +    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any], use_native=False) -> str:
> > -         raise DependencyException('{!r} is not a pkgconfig
> dependency'.format(self.name))
> > +         raise DependencyException(f'{self.name!r} is not a pkgconfig
> dependency')
> >
> >       def get_configtool_variable(self, variable_name):
> > -@@ -280,7 +280,7 @@ class InternalDependency(Dependency):
> > +@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
> >               return True
> >           return any(d.is_built() for d in self.ext_deps)
> >
> > @@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644
> >           raise DependencyException('Method "get_pkgconfig_variable()"
> is '
> >                                     'invalid for an internal dependency')
> >
> > -@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
> >           return s.format(self.__class__.__name__, self.name,
> self.is_found,
> >                           self.version_reqs)
> >
> > @@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644
> >           p, out, err = Popen_safe(cmd, env=env)
> >           rc, out, err = p.returncode, out.strip(), err.strip()
> >           call = ' '.join(cmd)
> > -@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):
> > -             env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
> > -             mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
> > +@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
> > +             if key.startswith('PKG_'):
> > +                 mlog.debug(f'env[{key}]: {value}')
> >
> >  -    def _call_pkgbin(self, args, env=None):
> >  +    def _call_pkgbin(self, args, env=None, use_native=False):
> >           # Always copy the environment since we're going to modify it
> >           # with pkg-config variables
> >           if env is None:
> > -@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
> >           targs = tuple(args)
> >           cache = PkgConfigDependency.pkgbin_cache
> >           if (self.pkgbin, targs, fenv) not in cache:
> > @@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644
> >           return cache[(self.pkgbin, targs, fenv)]
> >
> >       def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
> > -@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
> >                                         (self.name, out_raw))
> >           self.link_args, self.raw_link_args = self._search_libs(out,
> out_raw)
> >
> > @@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644
> >           options = ['--variable=' + variable_name, self.name]
> >
> >           if 'define_variable' in kwargs:
> > -@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
> >
> >               options = ['--define-variable=' + '='.join(definition)] +
> options
> >
> > @@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644
> >           variable = ''
> >           if ret != 0:
> >               if self.required:
> > -diff --git a/mesonbuild/dependencies/ui.py
> b/mesonbuild/dependencies/ui.py
> > -index d897d76..a598d2e 100644
> > ---- a/mesonbuild/dependencies/ui.py
> > -+++ b/mesonbuild/dependencies/ui.py
> > -@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
> > -         self.bindir = self.get_pkgconfig_host_bins(core)
> > -         if not self.bindir:
> > -             # If exec_prefix is not defined, the pkg-config file is
> broken
> > --            prefix = core.get_pkgconfig_variable('exec_prefix', {})
> > -+            prefix = core.get_pkgconfig_variable('exec_prefix', {},
> use_native=True)
> > -             if prefix:
> > -                 self.bindir = os.path.join(prefix, 'bin')
> > -
> > -@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):
> > -         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
> > -         for application in applications:
> > -             try:
> > --                return
> os.path.dirname(core.get_pkgconfig_variable('%s_location' % application,
> {}))
> > -+                return
> os.path.dirname(core.get_pkgconfig_variable('%s_location' % application,
> {}, use_native=True))
> > -             except MesonException:
> > -                 pass
> > -
> > -@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):
> > -         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
> > -
> > -     def get_pkgconfig_host_bins(self, core):
> > --        return core.get_pkgconfig_variable('host_bins', {})
> > -+        return core.get_pkgconfig_variable('host_bins', {},
> use_native=True)
> > -
> > -     def get_private_includes(self, mod_inc_dir, module):
> > -         return _qt_get_private_includes(mod_inc_dir, module,
> self.version)
> > diff --git
> a/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
> b/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
> > new file mode 100644
> > index 0000000000..76daf019b0
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
> > @@ -0,0 +1,412 @@
> > +From 4e312c19e693a69b0650ce6c8a8903163c959996 Mon Sep 17 00:00:00 2001
> > +From: Xavier Claessens <xavier.claessens@collabora.com>
> > +Date: Tue, 11 May 2021 09:18:47 -0400
> > +Subject: [PATCH] gnome: Fix gtkdoc generation
> > +
> > +install_scripts used to replace @BUILD_ROOT@ and @SOURCE_ROOT@ but it
> > +was not documented and got removed in Meson 0.58.0. gnome.gtkdoc() was
> > +relying on that behaviour, but it has always been broken in the case the
> > +source or build directory contains spaces.
> > +
> > +Fix this by changing get_include_args() to substitue paths directly
> > +which will then get escaped correctly.
> > +
> > +Add a unit test that builds GObject documentation which is where this
> > +issue has been spotted.
> > +
> > +Fixes: #8744
> > +Upstream-Status: Backport
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + mesonbuild/modules/__init__.py                | 54 +++++++++----------
> > + mesonbuild/modules/gnome.py                   | 15 +++---
> > + mesonbuild/modules/hotdoc.py                  |  3 +-
> > + mesonbuild/modules/qt.py                      |  4 +-
> > + mesonbuild/modules/windows.py                 |  5 +-
> > + .../10 gtk-doc/doc/foobar1/foobar-docs.sgml   |  2 +-
> > + .../doc/foobar1/foobar-sections.txt           | 16 ++++++
> > + .../10 gtk-doc/doc/foobar1/foobar.types       |  4 ++
> > + .../10 gtk-doc/doc/foobar1/meson.build        |  6 ++-
> > + test cases/frameworks/10 gtk-doc/foo.c        | 30 +++++++++++
> > + .../frameworks/10 gtk-doc/include/foo.h       | 18 +++++++
> > + test cases/frameworks/10 gtk-doc/meson.build  | 12 +++++
> > + test cases/frameworks/10 gtk-doc/test.json    |  4 +-
> > + 13 files changed, 127 insertions(+), 46 deletions(-)
> > + create mode 100644 test cases/frameworks/10
> gtk-doc/doc/foobar1/foobar-sections.txt
> > + create mode 100644 test cases/frameworks/10
> gtk-doc/doc/foobar1/foobar.types
> > + create mode 100644 test cases/frameworks/10 gtk-doc/foo.c
> > +
> > +diff --git a/mesonbuild/modules/__init__.py
> b/mesonbuild/modules/__init__.py
> > +index ddb5e3e6cf3..c0970294c34 100644
> > +--- a/mesonbuild/modules/__init__.py
> > ++++ b/mesonbuild/modules/__init__.py
> > +@@ -56,6 +56,33 @@ def __init__(self, interpreter: 'Interpreter') ->
> None:
> > +         self.target_machine =
> interpreter.builtin['target_machine'].held_object
> > +         self.current_node = interpreter.current_node
> > +
> > ++    def get_include_args(self, include_dirs, prefix='-I'):
> > ++        if not include_dirs:
> > ++            return []
> > ++
> > ++        srcdir = self.environment.get_source_dir()
> > ++        builddir = self.environment.get_build_dir()
> > ++
> > ++        dirs_str = []
> > ++        for dirs in unholder(include_dirs):
> > ++            if isinstance(dirs, str):
> > ++                dirs_str += [f'{prefix}{dirs}']
> > ++                continue
> > ++
> > ++            # Should be build.IncludeDirs object.
> > ++            basedir = dirs.get_curdir()
> > ++            for d in dirs.get_incdirs():
> > ++                expdir = os.path.join(basedir, d)
> > ++                srctreedir = os.path.join(srcdir, expdir)
> > ++                buildtreedir = os.path.join(builddir, expdir)
> > ++                dirs_str += [f'{prefix}{buildtreedir}',
> > ++                             f'{prefix}{srctreedir}']
> > ++            for d in dirs.get_extra_build_dirs():
> > ++                dirs_str += [f'{prefix}{d}']
> > ++
> > ++        return dirs_str
> > ++
> > ++
> > + class ModuleObject:
> > +     """Base class for all objects returned by modules
> > +     """
> > +@@ -71,33 +98,6 @@ def __init__(self, interpreter:
> T.Optional['Interpreter'] = None) -> None:
> > + class ExtensionModule(ModuleObject):
> > +     pass
> > +
> > +-def get_include_args(include_dirs, prefix='-I'):
> > +-    '''
> > +-    Expand include arguments to refer to the source and build dirs
> > +-    by using @SOURCE_ROOT@ and @BUILD_ROOT@ for later substitution
> > +-    '''
> > +-    if not include_dirs:
> > +-        return []
> > +-
> > +-    dirs_str = []
> > +-    for dirs in unholder(include_dirs):
> > +-        if isinstance(dirs, str):
> > +-            dirs_str += [f'{prefix}{dirs}']
> > +-            continue
> > +-
> > +-        # Should be build.IncludeDirs object.
> > +-        basedir = dirs.get_curdir()
> > +-        for d in dirs.get_incdirs():
> > +-            expdir = os.path.join(basedir, d)
> > +-            srctreedir = os.path.join('@SOURCE_ROOT@', expdir)
> > +-            buildtreedir = os.path.join('@BUILD_ROOT@', expdir)
> > +-            dirs_str += [f'{prefix}{buildtreedir}',
> > +-                         f'{prefix}{srctreedir}']
> > +-        for d in dirs.get_extra_build_dirs():
> > +-            dirs_str += [f'{prefix}{d}']
> > +-
> > +-    return dirs_str
> > +-
> > + def is_module_library(fname):
> > +     '''
> > +     Check if the file is a library-like file generated by a
> module-specific
> > +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> > +index d0b053d4f76..c91cda66f8b 100644
> > +--- a/mesonbuild/modules/gnome.py
> > ++++ b/mesonbuild/modules/gnome.py
> > +@@ -26,7 +26,6 @@
> > + from .. import mesonlib
> > + from .. import interpreter
> > + from . import GResourceTarget, GResourceHeaderTarget, GirTarget,
> TypelibTarget, VapiTarget
> > +-from . import get_include_args
> > + from . import ExtensionModule
> > + from . import ModuleReturnValue
> > + from ..mesonlib import (
> > +@@ -394,7 +393,7 @@ def _get_dependencies_flags(self, deps, state,
> depends, include_rpath=False,
> > +                     gi_includes.update([girdir])
> > +             if isinstance(dep, InternalDependency):
> > +                 cflags.update(dep.get_compile_args())
> > +-
> cflags.update(get_include_args(dep.include_directories))
> > ++
> cflags.update(state.get_include_args(dep.include_directories))
> > +                 for lib in unholder(dep.libraries):
> > +                     if isinstance(lib, build.SharedLibrary):
> > +
>  internal_ldflags.update(self._get_link_args(state, lib, depends,
> include_rpath))
> > +@@ -443,7 +442,7 @@ def _get_dependencies_flags(self, deps, state,
> depends, include_rpath=False,
> > +                     else:
> > +                         external_ldflags.update([lib])
> > +             elif isinstance(dep, (build.StaticLibrary,
> build.SharedLibrary)):
> > +-                cflags.update(get_include_args(dep.get_include_dirs()))
> > ++
> cflags.update(state.get_include_args(dep.get_include_dirs()))
> > +                 depends.append(dep)
> > +             else:
> > +                 mlog.log(f'dependency {dep!r} not handled to build gir
> files')
> > +@@ -853,7 +852,7 @@ def generate_gir(self, state, args, kwargs):
> > +         scan_command += self._scan_header(kwargs)
> > +         scan_command += self._scan_extra_args(kwargs)
> > +         scan_command += ['-I' + srcdir, '-I' + builddir]
> > +-        scan_command += get_include_args(girtargets_inc_dirs)
> > ++        scan_command += state.get_include_args(girtargets_inc_dirs)
> > +         scan_command += ['--filelist=' +
> self._make_gir_filelist(state, srcdir, ns, nsversion, girtargets,
> libsources)]
> > +         scan_command += self._scan_link_withs(state, depends, kwargs)
> > +         scan_command += self._scan_include(state, depends,
> gir_inc_dirs, kwargs)
> > +@@ -863,8 +862,8 @@ def generate_gir(self, state, args, kwargs):
> > +         scan_command += ['--cflags-begin']
> > +         scan_command += cflags
> > +         scan_command += ['--cflags-end']
> > +-        scan_command += get_include_args(inc_dirs)
> > +-        scan_command += get_include_args(list(gi_includes) +
> gir_inc_dirs + inc_dirs, prefix='--add-include-path=')
> > ++        scan_command += state.get_include_args(inc_dirs)
> > ++        scan_command += state.get_include_args(list(gi_includes) +
> gir_inc_dirs + inc_dirs, prefix='--add-include-path=')
> > +         scan_command += list(internal_ldflags)
> > +         scan_command += self._scan_gir_targets(state, girtargets)
> > +         scan_command += self._scan_langs(state, [lc[0] for lc in
> langs_compilers])
> > +@@ -886,7 +885,7 @@ def generate_gir(self, state, args, kwargs):
> > +
> > +         typelib_output = f'{ns}-{nsversion}.typelib'
> > +         typelib_cmd = [gicompiler, scan_target, '--output', '@OUTPUT@
> ']
> > +-        typelib_cmd += get_include_args(gir_inc_dirs,
> prefix='--includedir=')
> > ++        typelib_cmd += state.get_include_args(gir_inc_dirs,
> prefix='--includedir=')
> > +
> > +         for incdir in typelib_includes:
> > +             typelib_cmd += ["--includedir=" + incdir]
> > +@@ -1127,7 +1126,7 @@ def _get_build_args(self, kwargs, state, depends):
> > +                     'Gir include dirs should be
> include_directories().')
> > +
> > +         cflags.extend(deps_cflags)
> > +-        cflags.extend(get_include_args(inc_dirs))
> > ++        cflags.extend(state.get_include_args(inc_dirs))
> > +         ldflags = []
> > +         ldflags.extend(internal_ldflags)
> > +         ldflags.extend(external_ldflags)
> > +diff --git a/mesonbuild/modules/hotdoc.py b/mesonbuild/modules/hotdoc.py
> > +index bf8cd229c0d..89a5d938ea7 100644
> > +--- a/mesonbuild/modules/hotdoc.py
> > ++++ b/mesonbuild/modules/hotdoc.py
> > +@@ -22,7 +22,6 @@
> > + from mesonbuild.coredata import MesonException
> > + from . import ModuleReturnValue
> > + from . import ExtensionModule
> > +-from . import get_include_args
> > + from ..dependencies import Dependency, InternalDependency
> > + from ..interpreterbase import FeatureNew, InvalidArguments, noPosargs,
> noKwargs
> > + from ..interpreter import CustomTargetHolder
> > +@@ -191,7 +190,7 @@ def process_dependencies(self, deps):
> > +         for dep in mesonlib.listify(ensure_list(deps)):
> > +             dep = getattr(dep, "held_object", dep)
> > +             if isinstance(dep, InternalDependency):
> > +-                inc_args = get_include_args(dep.include_directories)
> > ++                inc_args =
> self.state.get_include_args(dep.include_directories)
> > +                 cflags.update([self.replace_dirs_in_string(x)
> > +                                for x in inc_args])
> > +                 cflags.update(self.process_dependencies(dep.libraries))
> > +diff --git a/mesonbuild/modules/qt.py b/mesonbuild/modules/qt.py
> > +index b7389bd59af..1bf0099d1df 100644
> > +--- a/mesonbuild/modules/qt.py
> > ++++ b/mesonbuild/modules/qt.py
> > +@@ -23,7 +23,7 @@
> > + from ..mesonlib import MesonException, extract_as_list, File,
> unholder, version_compare
> > + from ..dependencies import Dependency
> > + import xml.etree.ElementTree as ET
> > +-from . import ModuleReturnValue, get_include_args, ExtensionModule
> > ++from . import ModuleReturnValue, ExtensionModule
> > + from ..interpreterbase import noPosargs, permittedKwargs, FeatureNew,
> FeatureNewKwargs
> > + from ..interpreter import extract_required_kwarg
> > + from ..programs import NonExistingExternalProgram
> > +@@ -239,7 +239,7 @@ def preprocess(self, state, args, kwargs):
> > +             ui_gen = build.Generator([self.uic], ui_kwargs)
> > +             ui_output = ui_gen.process_files(f'Qt{self.qt_version}
> ui', ui_files, state)
> > +             sources.append(ui_output)
> > +-        inc = get_include_args(include_dirs=include_directories)
> > ++        inc = state.get_include_args(include_dirs=include_directories)
> > +         compile_args = []
> > +         for dep in unholder(dependencies):
> > +             if isinstance(dep, Dependency):
> > +diff --git a/mesonbuild/modules/windows.py
> b/mesonbuild/modules/windows.py
> > +index d7a86380885..c4fdc196681 100644
> > +--- a/mesonbuild/modules/windows.py
> > ++++ b/mesonbuild/modules/windows.py
> > +@@ -19,7 +19,6 @@
> > + from .. import mlog
> > + from .. import mesonlib, build
> > + from ..mesonlib import MachineChoice, MesonException, extract_as_list,
> unholder
> > +-from . import get_include_args
> > + from . import ModuleReturnValue
> > + from . import ExtensionModule
> > + from ..interpreter import CustomTargetHolder
> > +@@ -83,12 +82,12 @@ def compile_resources(self, state, args, kwargs):
> > +         wrc_depends = extract_as_list(kwargs, 'depends', pop = True)
> > +         for d in wrc_depends:
> > +             if isinstance(d, CustomTargetHolder):
> > +-                extra_args += get_include_args([d.outdir_include()])
> > ++                extra_args +=
> state.get_include_args([d.outdir_include()])
> > +         inc_dirs = extract_as_list(kwargs, 'include_directories', pop
> = True)
> > +         for incd in inc_dirs:
> > +             if not isinstance(incd.held_object, (str,
> build.IncludeDirs)):
> > +                 raise MesonException('Resource include dirs should be
> include_directories().')
> > +-        extra_args += get_include_args(inc_dirs)
> > ++        extra_args += state.get_include_args(inc_dirs)
> > +
> > +         rescomp, rescomp_type = self._find_resource_compiler(state)
> > +         if rescomp_type == ResourceCompilerType.rc:
> > +diff --git a/test cases/frameworks/10
> gtk-doc/doc/foobar1/foobar-docs.sgml b/test cases/frameworks/10
> gtk-doc/doc/foobar1/foobar-docs.sgml
> > +index 95f73efdf45..6ccd087dc18 100644
> > +--- a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml
> > ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml
> > +@@ -35,7 +35,7 @@
> > +     </partintro>
> > +     <xi:include href="xml/foo.xml"/>
> > +     <xi:include href="../../include/bar.xml"/>
> > +-    <xi:include href="xml/foo-version.xml"/>
> > ++    <xi:include href="xml/version.xml"/>
> > +   </reference>
> > +
> > + </book>
> > +diff --git a/test cases/frameworks/10
> gtk-doc/doc/foobar1/foobar-sections.txt b/test cases/frameworks/10
> gtk-doc/doc/foobar1/foobar-sections.txt
> > +new file mode 100644
> > +index 00000000000..d14c8dab010
> > +--- /dev/null
> > ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt
> > +@@ -0,0 +1,16 @@
> > ++<SECTION>
> > ++<FILE>foo</FILE>
> > ++<TITLE>FooObj</TITLE>
> > ++FooObj
> > ++FooObjClass
> > ++foo_do_something
> > ++</SECTION>
> > ++
> > ++<SECTION>
> > ++<FILE>version</FILE>
> > ++<TITLE>version</TITLE>
> > ++FOO_MAJOR_VERSION
> > ++FOO_MINOR_VERSION
> > ++FOO_MICRO_VERSION
> > ++</SECTION>
> > ++
> > +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
> b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
> > +new file mode 100644
> > +index 00000000000..0a9c046f3ed
> > +--- /dev/null
> > ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
> > +@@ -0,0 +1,4 @@
> > ++% This include is useless it's a regression test for
> https://github.com/mesonbuild/meson/issues/8744
> > ++#include <foo.h>
> > ++
> > ++foo_obj_get_type
> > +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> > +index 149c6e956aa..f4b3724dbae 100644
> > +--- a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> > ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> > +@@ -1,5 +1,9 @@
> > + gnome.gtkdoc('foobar',
> > +-  src_dir : inc,
> > ++  src_dir : [inc, '.'],
> > +   main_sgml : 'foobar-docs.sgml',
> > +   content_files : [docbook, version_xml],
> > ++  dependencies: foo_dep,
> > ++  # Manually written types file for regression test:
> > ++  # https://github.com/mesonbuild/meson/issues/8744
> > ++  gobject_typesfile: 'foobar.types',
> > +   install : true)
> > +diff --git a/test cases/frameworks/10 gtk-doc/foo.c b/test
> cases/frameworks/10 gtk-doc/foo.c
> > +new file mode 100644
> > +index 00000000000..36c0639ec08
> > +--- /dev/null
> > ++++ b/test cases/frameworks/10 gtk-doc/foo.c
> > +@@ -0,0 +1,30 @@
> > ++#include <foo.h>
> > ++
> > ++
> > ++struct _FooObj {
> > ++  GObject parent;
> > ++  int dummy;
> > ++};
> > ++
> > ++G_DEFINE_TYPE(FooObj, foo_obj, G_TYPE_OBJECT)
> > ++
> > ++static void foo_obj_init (FooObj *self)
> > ++{
> > ++}
> > ++
> > ++static void foo_obj_class_init (FooObjClass *klass)
> > ++{
> > ++}
> > ++
> > ++/**
> > ++ * foo_do_something:
> > ++ * @self: self
> > ++ *
> > ++ * Useless function.
> > ++ *
> > ++ * Returns: 0.
> > ++ */
> > ++int foo_do_something(FooObj *self)
> > ++{
> > ++  return 0;
> > ++}
> > +diff --git a/test cases/frameworks/10 gtk-doc/include/foo.h b/test
> cases/frameworks/10 gtk-doc/include/foo.h
> > +index 7b8946b6a86..510f3d1ecb5 100644
> > +--- a/test cases/frameworks/10 gtk-doc/include/foo.h
> > ++++ b/test cases/frameworks/10 gtk-doc/include/foo.h
> > +@@ -1,5 +1,7 @@
> > + #pragma once
> > +
> > ++#include <glib-object.h>
> > ++
> > + /**
> > +  * FooIndecision:
> > +  * @FOO_MAYBE:     Something maybe
> > +@@ -13,3 +15,19 @@ typedef enum {
> > +     FOO_POSSIBLY,
> > + } FooIndecision;
> > +
> > ++/**
> > ++ * FooObjClass:
> > ++ *
> > ++ * The class
> > ++ */
> > ++
> > ++/**
> > ++ * FooObj:
> > ++ *
> > ++ * The instance
> > ++ */
> > ++
> > ++#define FOO_TYPE_OBJ foo_obj_get_type()
> > ++G_DECLARE_FINAL_TYPE(FooObj, foo_obj, FOO, OBJ, GObject)
> > ++
> > ++int foo_do_something(FooObj *self);
> > +diff --git a/test cases/frameworks/10 gtk-doc/meson.build b/test
> cases/frameworks/10 gtk-doc/meson.build
> > +index 5c22ad0afa4..292980fafa7 100644
> > +--- a/test cases/frameworks/10 gtk-doc/meson.build
> > ++++ b/test cases/frameworks/10 gtk-doc/meson.build
> > +@@ -24,4 +24,16 @@ if gtkdoc_ver.version_compare('<1.26')
> > +   error('MESON_SKIP_TEST gtk-doc test requires gtkdoc >= 1.26.')
> > + endif
> > +
> > ++gobject = dependency('gobject-2.0')
> > ++
> > ++libfoo = library('foo', 'foo.c',
> > ++  include_directories: inc,
> > ++  dependencies: gobject,
> > ++)
> > ++
> > ++foo_dep = declare_dependency(
> > ++  link_with: libfoo,
> > ++  include_directories: inc,
> > ++)
> > ++
> > + subdir('doc')
> > +diff --git a/test cases/frameworks/10 gtk-doc/test.json b/test
> cases/frameworks/10 gtk-doc/test.json
> > +index c44126cc741..03ad0595817 100644
> > +--- a/test cases/frameworks/10 gtk-doc/test.json
> > ++++ b/test cases/frameworks/10 gtk-doc/test.json
> > +@@ -4,8 +4,8 @@
> > +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/BAR.html"},
> > +     {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/foobar.devhelp2"},
> > +     {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/foobar.html"},
> > +-    {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/foobar-foo.html"},
> > +-    {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/foobar-foo-version.html"},
> > ++    {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/FooObj.html"},
> > ++    {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/foo-version.html"},
> > +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/home.png"},
> > +     {"type": "file", "file":
> "usr/share/gtk-doc/html/foobar/index.html"},
> > +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/left.png"},
> > diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> > deleted file mode 100644
> > index 772395e879..0000000000
> > --- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -meson.build files that use cc.run() in native builds can silently
> fallback to
> > -meson.get_cross_property() in cross builds without an exe-wrapper, but
> there's
> > -no way to know that this is happening.
> > -
> > -As the defaults may be pessimistic (for example, disabling the support
> for a
> > -feature that should be enabled) emit a warning when the default is
> used, so that
> > -the recipe can explicitly set the cross property as relevant.
> > -
> > -Upstream-Status: Submitted [
> https://github.com/mesonbuild/meson/pull/5071]
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py
> > -index 3c3cfae0..10e741ae 100644
> > ---- a/mesonbuild/interpreter.py
> > -+++ b/mesonbuild/interpreter.py
> > -@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):
> > -             return props[propname]
> > -         except Exception:
> > -             if len(args) == 2:
> > -+                mlog.warning('Cross property %s is using default value
> %s' % (propname, args[1]))
> > -                 return args[1]
> > -             raise InterpreterException('Unknown cross property: %s.' %
> propname)
> > -
> > diff --git a/meta/recipes-devtools/meson/meson_0.57.2.bb
> b/meta/recipes-devtools/meson/meson_0.58.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/meson_0.57.2.bb
> > rename to meta/recipes-devtools/meson/meson_0.58.0.bb
> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
> > rename to meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
> > --
> > 2.31.1
> >
> >
> > 
> >
>

--000000000000e25d5205c24aa773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Probably resolved by updating to 40.1?</div><div><a h=
ref=3D"https://gitlab.gnome.org/GNOME/nautilus/-/tags">https://gitlab.gnome=
.org/GNOME/nautilus/-/tags</a></div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, 14 May 2021 at 15:46, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">breaks nautilus=C2=A0 =C2=A0<a href=3D"https://errors.yo=
ctoproject.org/Errors/Details/581184/" rel=3D"noreferrer" target=3D"_blank"=
>https://errors.yoctoproject.org/Errors/Details/581184/</a><br>
<br>
On Thu, May 13, 2021 at 1:56 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Rebase patches; dropped chunks (and cross-prop-default.patch)<br>
&gt; have been removed upstream.<br>
&gt;<br>
&gt; Move native-only patches to all-patches, as they&#39;re a pain to reb=
ase<br>
&gt; separately.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 .../0001-Make-CPU-family-warnings-fatal.patch |=C2=A0 18 +-<br>
&gt;=C2=A0 ...sues-that-arise-when-cross-compiling.patch |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 ...-not-manipulate-the-environment-when.patch |=C2=A0 14 +-<br>
&gt;=C2=A0 ...pport-building-allarch-recipes-again.patch |=C2=A0 10 +-<br>
&gt;=C2=A0 .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 58 +--<br>
&gt;=C2=A0 ...2c19e693a69b0650ce6c8a8903163c959996.patch | 412 +++++++++++=
+++++++<br>
&gt;=C2=A0 .../meson/meson/cross-prop-default.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 23 -<br>
&gt;=C2=A0 .../{<a href=3D"http://meson_0.57.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">meson_0.57.2.bb</a> =3D&gt; <a href=3D"http://meson_0.58.0.bb=
" rel=3D"noreferrer" target=3D"_blank">meson_0.58.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://on_0.57.2.bb" rel=3D"noreferrer" target=3D=
"_blank">on_0.57.2.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.58.0.=
bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.58.0.bb</a>} |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 10 files changed, 456 insertions(+), 98 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/meson/meson/4e312c19e6=
93a69b0650ce6c8a8903163c959996.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/cross-prop=
-default.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.5=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.57.2.bb</a> =3D&gt; <a=
 href=3D"http://meson_0.58.0.bb" rel=3D"noreferrer" target=3D"_blank">meson=
_0.58.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativesdk=
-meson_0.57.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.57=
.2.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.58.0.bb" rel=3D"noref=
errer" target=3D"_blank">nativesdk-meson_0.58.0.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-dev=
tools/meson/meson.inc<br>
&gt; index 10e7d8a1ce..f60381453b 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; @@ -12,16 +12,13 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/m=
esonbuild/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${=
PV}/meson-${P</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-native_bin=
dir.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python-mod=
ule-do-not-manipulate-the-environment-when.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-rpath-h=
andling.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-prop-default.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-modules-py=
thon.py-do-not-substitute-python-s-install.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gi-target-dep.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-CPU-family=
-warnings-fatal.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Support-buildin=
g-allarch-recipes-again.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://4e312c19e693a69b0650=
ce6c8a8903163c959996.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3a83e7b1c5de94fa991ec34d9b198d94f38ed69=
9d3524cb0fdf3b99fd23d4cc5&quot;<br>
&gt; -<br>
&gt; -SRC_URI_append_class-native =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Make-CPU-family-warnings-fatal.patch \<br>
&gt; -=C2=A0 =C2=A0 file://0002-Support-building-allarch-recipes-again.pat=
ch \<br>
&gt; -&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f4820df0bc969c99019fd4af8ca5f136ee94c63=
d8a5ad67e7eb73bdbc9182fdd&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/meso=
nbuild/meson/releases" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/mesonbuild/meson/releases</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;meson-(?P&lt;pver&gt;\d+(\.\d+)+=
)\.tar&quot;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-w=
arnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-famil=
y-warnings-fatal.patch<br>
&gt; index 300797f9ee..bcccfabd17 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings=
-fatal.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings=
-fatal.patch<br>
&gt; @@ -1,34 +1,33 @@<br>
&gt; -From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00 20=
01<br>
&gt; +From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" =
target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 3 Jul 2018 13:59:09 +0100<br>
&gt; -Subject: [PATCH] Make CPU family warnings fatal<br>
&gt; +Subject: [PATCH 1/2] Make CPU family warnings fatal<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@in=
tel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/envconfig.py=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0mesonbuild/environment.py | 4 +---<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<=
br>
&gt; -index ba35d16..2d3c34c 100644<br>
&gt; +index c6a4df3..4d58c91 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -262,7 +262,7 @@ class MachineInfo:<br>
&gt; +@@ -266,7 +266,7 @@ class MachineInfo:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_family =3D literal[&#39;c=
pu_family&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cpu_family not in known_cp=
u_families:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown=
 CPU family {}, please report this at <a href=3D"https://github.com/mesonbu=
ild/meson/issues/new&#39;.format(cpu_family)" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/mesonbuild/meson/issues/new&#39;.format(cpu_fami=
ly)</a>)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(f&#39;Unknow=
n CPU family {cpu_family}, please report this at <a href=3D"https://github.=
com/mesonbuild/meson/issues/new" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/mesonbuild/meson/issues/new</a>&#39;)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentExc=
eption(&#39;Unknown CPU family {}, see <a href=3D"https://wiki.yoctoproject=
.org/wiki/Meson/UnknownCPU" rel=3D"noreferrer" target=3D"_blank">https://wi=
ki.yoctoproject.org/wiki/Meson/UnknownCPU</a> for directions.&#39;.format(c=
pu_family))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endian =3D literal[&#39;endia=
n&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if endian not in (&#39;little=
&#39;, &#39;big&#39;):<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment=
.py<br>
&gt; -index 756dd81..4d2c2b6 100644<br>
&gt; +index fc9b703..eea8345 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) =
-&gt; str:<br>
&gt; +@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) =
-&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trial =3D &#39;=
ppc64&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if trial not in known_cpu_families:<br>
&gt; @@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return trial<br>
&gt;<br>
&gt; +--<br>
&gt; +2.24.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues=
-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/=
0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch<br>
&gt; index 471f1500da..ce90e515da 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-a=
rise-when-cross-compiling.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-a=
rise-when-cross-compiling.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
&gt;=C2=A0 Subject: [PATCH] gtkdoc: fix issues that arise when cross-compi=
ling<br>
&gt; @@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/g=
nome.py<br>
&gt; -index bcf77b9..6a4b472 100644<br>
&gt; +index dc2979e..c9ff9bd 100644<br>
&gt;=C2=A0 --- a/mesonbuild/modules/gnome.py<br>
&gt;=C2=A0 +++ b/mesonbuild/modules/gnome.py<br>
&gt; -@@ -974,6 +974,10 @@ This will become a hard error in the future.&#3=
9;&#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(&#39;--{=
}=3D{}&#39;.format(program_name, path))<br>
&gt; +@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(f&#39;--=
{program_name}=3D{path}&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if namespace:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(&#3=
9;--namespace=3D&#39; + namespace)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D state.envir=
onment.properties.host.get(&#39;gtkdoc_exe_wrapper&#39;, None)<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-=
not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/mes=
on/0001-python-module-do-not-manipulate-the-environment-when.patch<br>
&gt; index eb0e90dbdd..fdadc6869b 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-man=
ipulate-the-environment-when.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-man=
ipulate-the-environment-when.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 19 Nov 2018 14:24:26 +0100<br>
&gt;=C2=A0 Subject: [PATCH] python module: do not manipulate the environme=
nt when calling<br>
&gt; @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 12 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/=
python.py<br>
&gt; -index 07be318..b770603 100644<br>
&gt; +index 422155b..aaf5844 100644<br>
&gt;=C2=A0 --- a/mesonbuild/modules/python.py<br>
&gt;=C2=A0 +++ b/mesonbuild/modules/python.py<br>
&gt; -@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):<br>
&gt; +@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o=
ld_pkg_libdir =3D os.environ.get(&#39;PKG_CONFIG_LIBDIR&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o=
ld_pkg_path =3D os.environ.get(&#39;PKG_CONFIG_PATH&#39;)<br>
&gt;<br>
&gt; @@ -26,9 +26,9 @@ index 07be318..b770603 100644<br>
&gt;=C2=A0 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
ry:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0self.pkgdep =3D PkgConfigDependency(pkg_name, environment, kw=
args)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mlog.debug(&#39;Found &quot;{}&quot; via pkgconfig lookup in LIB=
PC ({})&#39;.format(pkg_name, pkg_libdir))<br>
&gt; -@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mlog.debug(&#39;&quot;{}&quot; could not be found in LIBPC ({})&=
#39;.format(pkg_name, pkg_libdir))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mlog.debug(f&#39;Found &quot;{pkg_name}&quot; via pkgconfig look=
up in LIBPC ({pkg_libdir})&#39;)<br>
&gt; +@@ -83,13 +78,6 @@ class PythonDependency(ExternalDependency):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mlog.debug(f&#39;&quot;{pkg_name}&quot; could not be found in LI=
BPC ({pkg_libdir})&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0mlog.debug(e)<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if old=
_pkg_path is not None:<br>
&gt; @@ -39,5 +39,5 @@ index 07be318..b770603 100644<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 os.environ.pop(&#39;PKG_CONFIG_LIBDIR&#39;, None)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.d=
ebug(&#39;&quot;{}&quot; could not be found in LIBPC ({}), this is likely d=
ue to a relocated python installation&#39;.format(pkg_name, pkg_libdir))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.d=
ebug(f&#39;&quot;{pkg_name}&quot; could not be found in LIBPC ({pkg_libdir}=
), this is likely due to a relocated python installation&#39;)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-=
allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Suppor=
t-building-allarch-recipes-again.patch<br>
&gt; index f6175a194c..dcc1ce9c27 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch=
-recipes-again.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch=
-recipes-again.patch<br>
&gt; @@ -1,19 +1,18 @@<br>
&gt; -From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" ta=
rget=3D"_blank">pkj@axis.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt; -Subject: [PATCH] Support building allarch recipes again<br>
&gt; +Subject: [PATCH 2/2] Support building allarch recipes again<br>
&gt;<br>
&gt;=C2=A0 This registers &quot;allarch&quot; as a known CPU family.<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.k=
jellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;=
<br>
&gt; -<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/envconfig.py | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<=
br>
&gt; -index 2d3c34c..b9e7908 100644<br>
&gt; +index 4d58c91..ff01ad1 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt;=C2=A0 @@ -36,6 +36,7 @@ from pathlib import Path<br>
&gt; @@ -24,3 +23,6 @@ index 2d3c34c..b9e7908 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;aarch64&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;alpha&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arc&#39;,<br>
&gt; +--<br>
&gt; +2.24.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.pat=
ch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; index ed85116c4f..89257b9e05 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.rib=
alda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt;=C2=A0 Subject: [PATCH] native_bindir<br>
&gt; @@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado &lt;<a hre=
f=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gm=
ail.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/dependencies/base.py | 19 +++++++++++--------<=
br>
&gt; - mesonbuild/dependencies/ui.py=C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt; - 2 files changed, 14 insertions(+), 11 deletions(-)<br>
&gt; + 1 file changed, 11 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/depen=
dencies/base.py<br>
&gt; -index cd77b4b..7e3f338 100644<br>
&gt; +index 14380d4..d0c443f 100644<br>
&gt;=C2=A0 --- a/mesonbuild/dependencies/base.py<br>
&gt;=C2=A0 +++ b/mesonbuild/dependencies/base.py<br>
&gt; -@@ -192,7 +192,7 @@ class Dependency:<br>
&gt; +@@ -179,7 +179,7 @@ class Dependency:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get_exe_args(self, compiler):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: =
str, kwargs: T.Dict[str, T.Any]) -&gt; str:<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: =
str, kwargs: T.Dict[str, T.Any], use_native=3DFalse) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#39;{!r=
} is not a pkgconfig dependency&#39;.format(<a href=3D"http://self.name" re=
l=3D"noreferrer" target=3D"_blank">self.name</a>))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(f&#39;{<=
a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.name<=
/a>!r} is not a pkgconfig dependency&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get_configtool_variable(self, variable_=
name):<br>
&gt; -@@ -280,7 +280,7 @@ class InternalDependency(Dependency):<br>
&gt; +@@ -267,7 +267,7 @@ class InternalDependency(Dependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return any(d.is_built() for d=
 in self.ext_deps)<br>
&gt;<br>
&gt; @@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#3=
9;Method &quot;get_pkgconfig_variable()&quot; is &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;invalid=
 for an internal dependency&#39;)<br>
&gt;<br>
&gt; -@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):<=
br>
&gt; +@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s.format(self.__class_=
_.__name__, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blan=
k">self.name</a>, self.is_found,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0self.version_reqs)<br>
&gt;<br>
&gt; @@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p, out, err =3D Popen_safe(cm=
d, env=3Denv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc, out, err =3D p.returncode=
, out.strip(), err.strip()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call =3D &#39; &#39;.join(cmd=
)<br>
&gt; -@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env[&#39;PKG_CONFIG_=
LIBDIR&#39;] =3D new_pkg_config_libdir<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.debug(&#39;PKG_=
CONFIG_LIBDIR: &#39; + new_pkg_config_libdir)<br>
&gt; +@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if key.startswith(&#=
39;PKG_&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.d=
ebug(f&#39;env[{key}]: {value}&#39;)<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone):<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone, use_nat=
ive=3DFalse):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Always copy the environment=
 since we&#39;re going to modify it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# with pkg-config variables<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if env is None:<br>
&gt; -@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt; +@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targs =3D tuple(args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache =3D PkgConfigDependency=
.pkgbin_cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self.pkgbin, targs, fenv)=
 not in cache:<br>
&gt; @@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cache[(self.pkgbin, ta=
rgs, fenv)]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args: T.List=
[str]) -&gt; T.List[str]:<br>
&gt; -@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt; +@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(<a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self=
.name</a>, out_raw))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args, self.raw_link=
_args =3D self._search_libs(out, out_raw)<br>
&gt;<br>
&gt; @@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#39;--variable=
=3D&#39; + variable_name, <a href=3D"http://self.name" rel=3D"noreferrer" =
target=3D"_blank">self.name</a>]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;define_variable&#39; =
in kwargs:<br>
&gt; -@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt; +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#=
39;--define-variable=3D&#39; + &#39;=3D&#39;.join(definition)] + options<br=
>
&gt;<br>
&gt; @@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variable =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.require=
d:<br>
&gt; -diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies=
/ui.py<br>
&gt; -index d897d76..a598d2e 100644<br>
&gt; ---- a/mesonbuild/dependencies/ui.py<br>
&gt; -+++ b/mesonbuild/dependencies/ui.py<br>
&gt; -@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bindir =3D self.get_pkgconfig=
_host_bins(core)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.bindir:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If exec_prefix is =
not defined, the pkg-config file is broken<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D core.get_pkgco=
nfig_variable(&#39;exec_prefix&#39;, {})<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D core.get_pkgco=
nfig_variable(&#39;exec_prefix&#39;, {}, use_native=3DTrue)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if prefix:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.b=
indir =3D os.path.join(prefix, &#39;bin&#39;)<br>
&gt; -<br>
&gt; -@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0applications =3D [&#39;moc&#39;, &=
#39;uic&#39;, &#39;rcc&#39;, &#39;lupdate&#39;, &#39;lrelease&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for application in applications:<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return os.p=
ath.dirname(core.get_pkgconfig_variable(&#39;%s_location&#39; % application=
, {}))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return os.p=
ath.dirname(core.get_pkgconfig_variable(&#39;%s_location&#39; % application=
, {}, use_native=3DTrue))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except MesonExceptio=
n:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<b=
r>
&gt; -<br>
&gt; -@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QtBaseDependency.__init__(self, &#=
39;qt5&#39;, env, kwargs)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def get_pkgconfig_host_bins(self, core):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return core.get_pkgconfig_variable(&#39=
;host_bins&#39;, {})<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return core.get_pkgconfig_variable(&#39=
;host_bins&#39;, {}, use_native=3DTrue)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def get_private_includes(self, mod_inc_dir, modu=
le):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return _qt_get_private_includes(mo=
d_inc_dir, module, self.version)<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce=
6c8a8903163c959996.patch b/meta/recipes-devtools/meson/meson/4e312c19e693a6=
9b0650ce6c8a8903163c959996.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..76daf019b0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a890=
3163c959996.patch<br>
&gt; @@ -0,0 +1,412 @@<br>
&gt; +From 4e312c19e693a69b0650ce6c8a8903163c959996 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Xavier Claessens &lt;<a href=3D"mailto:xavier.claessens@collab=
ora.com" target=3D"_blank">xavier.claessens@collabora.com</a>&gt;<br>
&gt; +Date: Tue, 11 May 2021 09:18:47 -0400<br>
&gt; +Subject: [PATCH] gnome: Fix gtkdoc generation<br>
&gt; +<br>
&gt; +install_scripts used to replace @BUILD_ROOT@ and @SOURCE_ROOT@ but i=
t<br>
&gt; +was not documented and got removed in Meson 0.58.0. gnome.gtkdoc() w=
as<br>
&gt; +relying on that behaviour, but it has always been broken in the case=
 the<br>
&gt; +source or build directory contains spaces.<br>
&gt; +<br>
&gt; +Fix this by changing get_include_args() to substitue paths directly<=
br>
&gt; +which will then get escaped correctly.<br>
&gt; +<br>
&gt; +Add a unit test that builds GObject documentation which is where thi=
s<br>
&gt; +issue has been spotted.<br>
&gt; +<br>
&gt; +Fixes: #8744<br>
&gt; +Upstream-Status: Backport<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + mesonbuild/modules/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 54 +++++++++----------<br>
&gt; + mesonbuild/modules/gnome.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++---<br>
&gt; + mesonbuild/modules/hotdoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; + mesonbuild/modules/qt.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; + mesonbuild/modules/windows.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
&gt; + .../10 gtk-doc/doc/foobar1/foobar-docs.sgml=C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
&gt; + .../doc/foobar1/foobar-sections.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 16 ++++++<br>
&gt; + .../10 gtk-doc/doc/foobar1/foobar.types=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=
=C2=A0 4 ++<br>
&gt; + .../10 gtk-doc/doc/foobar1/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=
=C2=A0 6 ++-<br>
&gt; + test cases/frameworks/10 gtk-doc/foo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 30 +++++++++++<br>
&gt; + .../frameworks/10 gtk-doc/include/foo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 18 +++++++<br>
&gt; + test cases/frameworks/10 gtk-doc/meson.build=C2=A0 | 12 +++++<br>
&gt; + test cases/frameworks/10 gtk-doc/test.json=C2=A0 =C2=A0 |=C2=A0 4 +=
-<br>
&gt; + 13 files changed, 127 insertions(+), 46 deletions(-)<br>
&gt; + create mode 100644 test cases/frameworks/10 gtk-doc/doc/foobar1/foo=
bar-sections.txt<br>
&gt; + create mode 100644 test cases/frameworks/10 gtk-doc/doc/foobar1/foo=
bar.types<br>
&gt; + create mode 100644 test cases/frameworks/10 gtk-doc/foo.c<br>
&gt; +<br>
&gt; +diff --git a/mesonbuild/modules/__init__.py b/mesonbuild/modules/__i=
nit__.py<br>
&gt; +index ddb5e3e6cf3..c0970294c34 100644<br>
&gt; +--- a/mesonbuild/modules/__init__.py<br>
&gt; ++++ b/mesonbuild/modules/__init__.py<br>
&gt; +@@ -56,6 +56,33 @@ def __init__(self, interpreter: &#39;Interpreter&=
#39;) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target_machine =3D interprete=
r.builtin[&#39;target_machine&#39;].held_object<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.current_node =3D interpreter.=
current_node<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 def get_include_args(self, include_dirs, prefix=3D&#3=
9;-I&#39;):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not include_dirs:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D self.environment.get_source_=
dir()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 builddir =3D self.environment.get_build=
_dir()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str =3D []<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dirs in unholder(include_dirs):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(dirs, str):=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str +=
=3D [f&#39;{prefix}{dirs}&#39;]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br=
>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Should be build.Include=
Dirs object.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir =3D dirs.get_curd=
ir()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in dirs.get_incdirs=
():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expdir =3D =
os.path.join(basedir, d)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctreedir =
=
=3D os.path.join(srcdir, expdir)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buildtreedi=
r =3D os.path.join(builddir, expdir)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str +=
=3D [f&#39;{prefix}{buildtreedir}&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f&#39;{prefix}{srctreedir}&#39;]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in dirs.get_extra_b=
uild_dirs():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str +=
=3D [f&#39;{prefix}{d}&#39;]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return dirs_str<br>
&gt; ++<br>
&gt; ++<br>
&gt; + class ModuleObject:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Base class for all objects ret=
urned by modules<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +@@ -71,33 +98,6 @@ def __init__(self, interpreter: T.Optional[&#39;I=
nterpreter&#39;] =3D None) -&gt; None:<br>
&gt; + class ExtensionModule(ModuleObject):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pass<br>
&gt; +<br>
&gt; +-def get_include_args(include_dirs, prefix=3D&#39;-I&#39;):<br>
&gt; +-=C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; +-=C2=A0 =C2=A0 Expand include arguments to refer to the source and b=
uild dirs<br>
&gt; +-=C2=A0 =C2=A0 by using @SOURCE_ROOT@ and @BUILD_ROOT@ for later sub=
stitution<br>
&gt; +-=C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; +-=C2=A0 =C2=A0 if not include_dirs:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 dirs_str =3D []<br>
&gt; +-=C2=A0 =C2=A0 for dirs in unholder(include_dirs):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(dirs, str):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str +=3D [f&#39;{pre=
fix}{dirs}&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Should be build.IncludeDirs object.<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir =3D dirs.get_curdir()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in dirs.get_incdirs():<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expdir =3D os.path.join(b=
asedir, d)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctreedir =3D os.path.jo=
in(&#39;@SOURCE_ROOT@&#39;, expdir)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buildtreedir =3D os.path.=
join(&#39;@BUILD_ROOT@&#39;, expdir)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str +=3D [f&#39;{pre=
fix}{buildtreedir}&#39;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0f&#39;{prefix}{srctreedir}&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in dirs.get_extra_build_dirs():<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirs_str +=3D [f&#39;{pre=
fix}{d}&#39;]<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return dirs_str<br>
&gt; +-<br>
&gt; + def is_module_library(fname):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Check if the file is a library-like file generat=
ed by a module-specific<br>
&gt; +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.=
py<br>
&gt; +index d0b053d4f76..c91cda66f8b 100644<br>
&gt; +--- a/mesonbuild/modules/gnome.py<br>
&gt; ++++ b/mesonbuild/modules/gnome.py<br>
&gt; +@@ -26,7 +26,6 @@<br>
&gt; + from .. import mesonlib<br>
&gt; + from .. import interpreter<br>
&gt; + from . import GResourceTarget, GResourceHeaderTarget, GirTarget, Ty=
pelibTarget, VapiTarget<br>
&gt; +-from . import get_include_args<br>
&gt; + from . import ExtensionModule<br>
&gt; + from . import ModuleReturnValue<br>
&gt; + from ..mesonlib import (<br>
&gt; +@@ -394,7 +393,7 @@ def _get_dependencies_flags(self, deps, state, d=
epends, include_rpath=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gi_includes.update([girdir])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(dep, I=
nternalDependency):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cflags=
.update(dep.get_compile_args())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags.upda=
te(get_include_args(dep.include_directories))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags.upda=
te(state.get_include_args(dep.include_directories))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for li=
b in unholder(dep.libraries):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if isinstance(lib, build.SharedLibrary):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0internal_ldflags.update(self._get_link_args(state,=
 lib, depends, include_rpath))<br>
&gt; +@@ -443,7 +442,7 @@ def _get_dependencies_flags(self, deps, state, d=
epends, include_rpath=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0external_ldflags.update([lib])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif isinstance(dep,=
 (build.StaticLibrary, build.SharedLibrary)):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags.upda=
te(get_include_args(dep.get_include_dirs()))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags.upda=
te(state.get_include_args(dep.get_include_dirs()))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depend=
s.append(dep)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.l=
og(f&#39;dependency {dep!r} not handled to build gir files&#39;)<br>
&gt; +@@ -853,7 +852,7 @@ def generate_gir(self, state, args, kwargs):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D self._scan_heade=
r(kwargs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D self._scan_extra=
_args(kwargs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D [&#39;-I&#39; + =
srcdir, &#39;-I&#39; + builddir]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_command +=3D get_include_args(girt=
argets_inc_dirs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_command +=3D state.get_include_arg=
s(girtargets_inc_dirs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D [&#39;--filelist=
=
=3D&#39; + self._make_gir_filelist(state, srcdir, ns, nsversion, girtarget=
s, libsources)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D self._scan_link_=
withs(state, depends, kwargs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D self._scan_inclu=
de(state, depends, gir_inc_dirs, kwargs)<br>
&gt; +@@ -863,8 +862,8 @@ def generate_gir(self, state, args, kwargs):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D [&#39;--cflags-b=
egin&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D cflags<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D [&#39;--cflags-e=
nd&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_command +=3D get_include_args(inc_=
dirs)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_command +=3D get_include_args(list=
(gi_includes) + gir_inc_dirs + inc_dirs, prefix=3D&#39;--add-include-path=
=3D&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_command +=3D state.get_include_arg=
s(inc_dirs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_command +=3D state.get_include_arg=
s(list(gi_includes) + gir_inc_dirs + inc_dirs, prefix=3D&#39;--add-include-=
path=3D&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D list(internal_ld=
flags)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D self._scan_gir_t=
argets(state, girtargets)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan_command +=3D self._scan_langs=
(state, [lc[0] for lc in langs_compilers])<br>
&gt; +@@ -886,7 +885,7 @@ def generate_gir(self, state, args, kwargs):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typelib_output =3D f&#39;{ns}-{nsv=
ersion}.typelib&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typelib_cmd =3D [gicompiler, scan_=
target, &#39;--output&#39;, &#39;@OUTPUT@&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 typelib_cmd +=3D get_include_args(gir_i=
nc_dirs, prefix=3D&#39;--includedir=3D&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 typelib_cmd +=3D state.get_include_args=
(gir_inc_dirs, prefix=3D&#39;--includedir=3D&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for incdir in typelib_includes:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typelib_cmd +=3D [&q=
uot;--includedir=3D&quot; + incdir]<br>
&gt; +@@ -1127,7 +1126,7 @@ def _get_build_args(self, kwargs, state, depen=
ds):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;Gir include dirs should be include_directories().&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cflags.extend(deps_cflags)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags.extend(get_include_args(inc_dirs=
))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags.extend(state.get_include_args(in=
c_dirs))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldflags =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldflags.extend(internal_ldflags)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldflags.extend(external_ldflags)<b=
r>
&gt; +diff --git a/mesonbuild/modules/hotdoc.py b/mesonbuild/modules/hotdo=
c.py<br>
&gt; +index bf8cd229c0d..89a5d938ea7 100644<br>
&gt; +--- a/mesonbuild/modules/hotdoc.py<br>
&gt; ++++ b/mesonbuild/modules/hotdoc.py<br>
&gt; +@@ -22,7 +22,6 @@<br>
&gt; + from mesonbuild.coredata import MesonException<br>
&gt; + from . import ModuleReturnValue<br>
&gt; + from . import ExtensionModule<br>
&gt; +-from . import get_include_args<br>
&gt; + from ..dependencies import Dependency, InternalDependency<br>
&gt; + from ..interpreterbase import FeatureNew, InvalidArguments, noPosar=
gs, noKwargs<br>
&gt; + from ..interpreter import CustomTargetHolder<br>
&gt; +@@ -191,7 +190,7 @@ def process_dependencies(self, deps):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in mesonlib.listify(ensure=
_list(deps)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep =3D getattr(dep,=
 &quot;held_object&quot;, dep)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(dep, I=
nternalDependency):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inc_args =
=3D get_include_args(dep.include_directories)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inc_args =
=3D self.state.get_include_args(dep.include_directories)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cflags=
.update([self.replace_dirs_in_string(x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in inc_args])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cflags=
.update(self.process_dependencies(dep.libraries))<br>
&gt; +diff --git a/mesonbuild/modules/qt.py b/mesonbuild/modules/qt.py<br>
&gt; +index b7389bd59af..1bf0099d1df 100644<br>
&gt; +--- a/mesonbuild/modules/qt.py<br>
&gt; ++++ b/mesonbuild/modules/qt.py<br>
&gt; +@@ -23,7 +23,7 @@<br>
&gt; + from ..mesonlib import MesonException, extract_as_list, File, unhol=
der, version_compare<br>
&gt; + from ..dependencies import Dependency<br>
&gt; + import xml.etree.ElementTree as ET<br>
&gt; +-from . import ModuleReturnValue, get_include_args, ExtensionModule<=
br>
&gt; ++from . import ModuleReturnValue, ExtensionModule<br>
&gt; + from ..interpreterbase import noPosargs, permittedKwargs, FeatureNe=
w, FeatureNewKwargs<br>
&gt; + from ..interpreter import extract_required_kwarg<br>
&gt; + from ..programs import NonExistingExternalProgram<br>
&gt; +@@ -239,7 +239,7 @@ def preprocess(self, state, args, kwargs):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui_gen =3D build.Gen=
erator([self.uic], ui_kwargs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui_output =3D ui_gen=
.process_files(f&#39;Qt{self.qt_version} ui&#39;, ui_files, state)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources.append(ui_ou=
tput)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 inc =3D get_include_args(include_dirs=
=3Dinclude_directories)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 inc =3D state.get_include_args(include_=
dirs=3Dinclude_directories)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compile_args =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in unholder(dependencies):=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(dep, D=
ependency):<br>
&gt; +diff --git a/mesonbuild/modules/windows.py b/mesonbuild/modules/wind=
ows.py<br>
&gt; +index d7a86380885..c4fdc196681 100644<br>
&gt; +--- a/mesonbuild/modules/windows.py<br>
&gt; ++++ b/mesonbuild/modules/windows.py<br>
&gt; +@@ -19,7 +19,6 @@<br>
&gt; + from .. import mlog<br>
&gt; + from .. import mesonlib, build<br>
&gt; + from ..mesonlib import MachineChoice, MesonException, extract_as_li=
st, unholder<br>
&gt; +-from . import get_include_args<br>
&gt; + from . import ModuleReturnValue<br>
&gt; + from . import ExtensionModule<br>
&gt; + from ..interpreter import CustomTargetHolder<br>
&gt; +@@ -83,12 +82,12 @@ def compile_resources(self, state, args, kwargs)=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrc_depends =3D extract_as_list(kw=
args, &#39;depends&#39;, pop =3D True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for d in wrc_depends:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(d, Cus=
tomTargetHolder):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_args =
+=3D get_include_args([d.outdir_include()])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_args =
+=3D state.get_include_args([d.outdir_include()])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inc_dirs =3D extract_as_list(kwarg=
s, &#39;include_directories&#39;, pop =3D True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for incd in inc_dirs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not isinstance(in=
cd.held_object, (str, build.IncludeDirs)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise =
MesonException(&#39;Resource include dirs should be include_directories().&=
#39;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_args +=3D get_include_args(inc_di=
rs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_args +=3D state.get_include_args(=
inc_dirs)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rescomp, rescomp_type =3D self._fi=
nd_resource_compiler(state)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if rescomp_type =3D=3D ResourceCom=
pilerType.rc:<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-doc=
s.sgml b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml<br>
&gt; +index 95f73efdf45..6ccd087dc18 100644<br>
&gt; +--- a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml<=
br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml<=
br>
&gt; +@@ -35,7 +35,7 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&lt;/partintro&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&lt;xi:include href=3D&quot;xml/foo.xml&quot;/&g=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&lt;xi:include href=3D&quot;../../include/bar.xm=
l&quot;/&gt;<br>
&gt; +-=C2=A0 =C2=A0 &lt;xi:include href=3D&quot;xml/foo-version.xml&quot;=
/&gt;<br>
&gt; ++=C2=A0 =C2=A0 &lt;xi:include href=3D&quot;xml/version.xml&quot;/&gt=
;<br>
&gt; +=C2=A0 =C2=A0&lt;/reference&gt;<br>
&gt; +<br>
&gt; + &lt;/book&gt;<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sec=
tions.txt b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.tx=
t<br>
&gt; +new file mode 100644<br>
&gt; +index 00000000000..d14c8dab010<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.t=
xt<br>
&gt; +@@ -0,0 +1,16 @@<br>
&gt; ++&lt;SECTION&gt;<br>
&gt; ++&lt;FILE&gt;foo&lt;/FILE&gt;<br>
&gt; ++&lt;TITLE&gt;FooObj&lt;/TITLE&gt;<br>
&gt; ++FooObj<br>
&gt; ++FooObjClass<br>
&gt; ++foo_do_something<br>
&gt; ++&lt;/SECTION&gt;<br>
&gt; ++<br>
&gt; ++&lt;SECTION&gt;<br>
&gt; ++&lt;FILE&gt;version&lt;/FILE&gt;<br>
&gt; ++&lt;TITLE&gt;version&lt;/TITLE&gt;<br>
&gt; ++FOO_MAJOR_VERSION<br>
&gt; ++FOO_MINOR_VERSION<br>
&gt; ++FOO_MICRO_VERSION<br>
&gt; ++&lt;/SECTION&gt;<br>
&gt; ++<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.typ=
es b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types<br>
&gt; +new file mode 100644<br>
&gt; +index 00000000000..0a9c046f3ed<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types<br>
&gt; +@@ -0,0 +1,4 @@<br>
&gt; ++% This include is useless it&#39;s a regression test for <a href=3D=
"https://github.com/mesonbuild/meson/issues/8744" rel=3D"noreferrer" target=
=
=3D"_blank">https://github.com/mesonbuild/meson/issues/8744</a><br>
&gt; ++#include &lt;foo.h&gt;<br>
&gt; ++<br>
&gt; ++foo_obj_get_type<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.buil=
d b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build<br>
&gt; +index 149c6e956aa..f4b3724dbae 100644<br>
&gt; +--- a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build<br>
&gt; +@@ -1,5 +1,9 @@<br>
&gt; + gnome.gtkdoc(&#39;foobar&#39;,<br>
&gt; +-=C2=A0 src_dir : inc,<br>
&gt; ++=C2=A0 src_dir : [inc, &#39;.&#39;],<br>
&gt; +=C2=A0 =C2=A0main_sgml : &#39;foobar-docs.sgml&#39;,<br>
&gt; +=C2=A0 =C2=A0content_files : [docbook, version_xml],<br>
&gt; ++=C2=A0 dependencies: foo_dep,<br>
&gt; ++=C2=A0 # Manually written types file for regression test:<br>
&gt; ++=C2=A0 # <a href=3D"https://github.com/mesonbuild/meson/issues/8744=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/meson/=
issues/8744</a><br>
&gt; ++=C2=A0 gobject_typesfile: &#39;foobar.types&#39;,<br>
&gt; +=C2=A0 =C2=A0install : true)<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/foo.c b/test cases/fra=
meworks/10 gtk-doc/foo.c<br>
&gt; +new file mode 100644<br>
&gt; +index 00000000000..36c0639ec08<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/foo.c<br>
&gt; +@@ -0,0 +1,30 @@<br>
&gt; ++#include &lt;foo.h&gt;<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++struct _FooObj {<br>
&gt; ++=C2=A0 GObject parent;<br>
&gt; ++=C2=A0 int dummy;<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++G_DEFINE_TYPE(FooObj, foo_obj, G_TYPE_OBJECT)<br>
&gt; ++<br>
&gt; ++static void foo_obj_init (FooObj *self)<br>
&gt; ++{<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void foo_obj_class_init (FooObjClass *klass)<br>
&gt; ++{<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/**<br>
&gt; ++ * foo_do_something:<br>
&gt; ++ * @self: self<br>
&gt; ++ *<br>
&gt; ++ * Useless function.<br>
&gt; ++ *<br>
&gt; ++ * Returns: 0.<br>
&gt; ++ */<br>
&gt; ++int foo_do_something(FooObj *self)<br>
&gt; ++{<br>
&gt; ++=C2=A0 return 0;<br>
&gt; ++}<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/include/foo.h b/test c=
ases/frameworks/10 gtk-doc/include/foo.h<br>
&gt; +index 7b8946b6a86..510f3d1ecb5 100644<br>
&gt; +--- a/test cases/frameworks/10 gtk-doc/include/foo.h<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/include/foo.h<br>
&gt; +@@ -1,5 +1,7 @@<br>
&gt; + #pragma once<br>
&gt; +<br>
&gt; ++#include &lt;glib-object.h&gt;<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +=C2=A0 * FooIndecision:<br>
&gt; +=C2=A0 * @FOO_MAYBE:=C2=A0 =C2=A0 =C2=A0Something maybe<br>
&gt; +@@ -13,3 +15,19 @@ typedef enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0FOO_POSSIBLY,<br>
&gt; + } FooIndecision;<br>
&gt; +<br>
&gt; ++/**<br>
&gt; ++ * FooObjClass:<br>
&gt; ++ *<br>
&gt; ++ * The class<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++/**<br>
&gt; ++ * FooObj:<br>
&gt; ++ *<br>
&gt; ++ * The instance<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++#define FOO_TYPE_OBJ foo_obj_get_type()<br>
&gt; ++G_DECLARE_FINAL_TYPE(FooObj, foo_obj, FOO, OBJ, GObject)<br>
&gt; ++<br>
&gt; ++int foo_do_something(FooObj *self);<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/meson.build b/test cas=
es/frameworks/10 gtk-doc/meson.build<br>
&gt; +index 5c22ad0afa4..292980fafa7 100644<br>
&gt; +--- a/test cases/frameworks/10 gtk-doc/meson.build<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/meson.build<br>
&gt; +@@ -24,4 +24,16 @@ if gtkdoc_ver.version_compare(&#39;&lt;1.26&#39;)=
<br>
&gt; +=C2=A0 =C2=A0error(&#39;MESON_SKIP_TEST gtk-doc test requires gtkdoc=
 &gt;=3D 1.26.&#39;)<br>
&gt; + endif<br>
&gt; +<br>
&gt; ++gobject =3D dependency(&#39;gobject-2.0&#39;)<br>
&gt; ++<br>
&gt; ++libfoo =3D library(&#39;foo&#39;, &#39;foo.c&#39;,<br>
&gt; ++=C2=A0 include_directories: inc,<br>
&gt; ++=C2=A0 dependencies: gobject,<br>
&gt; ++)<br>
&gt; ++<br>
&gt; ++foo_dep =3D declare_dependency(<br>
&gt; ++=C2=A0 link_with: libfoo,<br>
&gt; ++=C2=A0 include_directories: inc,<br>
&gt; ++)<br>
&gt; ++<br>
&gt; + subdir(&#39;doc&#39;)<br>
&gt; +diff --git a/test cases/frameworks/10 gtk-doc/test.json b/test cases=
/frameworks/10 gtk-doc/test.json<br>
&gt; +index c44126cc741..03ad0595817 100644<br>
&gt; +--- a/test cases/frameworks/10 gtk-doc/test.json<br>
&gt; ++++ b/test cases/frameworks/10 gtk-doc/test.json<br>
&gt; +@@ -4,8 +4,8 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;type&quot;: &quot;file&quot;, &quot;file&=
quot;: &quot;usr/share/gtk-doc/html/foobar/BAR.html&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;type&quot;: &quot;file&quot;, &quot;file&=
quot;: &quot;usr/share/gtk-doc/html/foobar/foobar.devhelp2&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;type&quot;: &quot;file&quot;, &quot;file&=
quot;: &quot;usr/share/gtk-doc/html/foobar/foobar.html&quot;},<br>
&gt; +-=C2=A0 =C2=A0 {&quot;type&quot;: &quot;file&quot;, &quot;file&quot;=
: &quot;usr/share/gtk-doc/html/foobar/foobar-foo.html&quot;},<br>
&gt; +-=C2=A0 =C2=A0 {&quot;type&quot;: &quot;file&quot;, &quot;file&quot;=
: &quot;usr/share/gtk-doc/html/foobar/foobar-foo-version.html&quot;},<br>
&gt; ++=C2=A0 =C2=A0 {&quot;type&quot;: &quot;file&quot;, &quot;file&quot;=
: &quot;usr/share/gtk-doc/html/foobar/FooObj.html&quot;},<br>
&gt; ++=C2=A0 =C2=A0 {&quot;type&quot;: &quot;file&quot;, &quot;file&quot;=
: &quot;usr/share/gtk-doc/html/foobar/foo-version.html&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;type&quot;: &quot;file&quot;, &quot;file&=
quot;: &quot;usr/share/gtk-doc/html/foobar/home.png&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;type&quot;: &quot;file&quot;, &quot;file&=
quot;: &quot;usr/share/gtk-doc/html/foobar/index.html&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&quot;type&quot;: &quot;file&quot;, &quot;file&=
quot;: &quot;usr/share/gtk-doc/html/foobar/left.png&quot;},<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.pat=
ch b/meta/recipes-devtools/meson/meson/cross-prop-default.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 772395e879..0000000000<br>
&gt; --- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,23 +0,0 @@<br>
&gt; -meson.build files that use cc.run() in native builds can silently fa=
llback to<br>
&gt; -meson.get_cross_property() in cross builds without an exe-wrapper, b=
ut there&#39;s<br>
&gt; -no way to know that this is happening.<br>
&gt; -<br>
&gt; -As the defaults may be pessimistic (for example, disabling the suppo=
rt for a<br>
&gt; -feature that should be enabled) emit a warning when the default is u=
sed, so that<br>
&gt; -the recipe can explicitly set the cross property as relevant.<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/mesonbuild=
/meson/pull/5071" rel=3D"noreferrer" target=3D"_blank">https://github.com/m=
esonbuild/meson/pull/5071</a>]<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.c=
om" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py<b=
r>
&gt; -index 3c3cfae0..10e741ae 100644<br>
&gt; ---- a/mesonbuild/interpreter.py<br>
&gt; -+++ b/mesonbuild/interpreter.py<br>
&gt; -@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return props[propnam=
e]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(args) =3D=3D =
2:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warnin=
g(&#39;Cross property %s is using default value %s&#39; % (propname, args[1=
]))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 args[1]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise InterpreterExc=
eption(&#39;Unknown cross property: %s.&#39; % propname)<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.57=
.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.57.2.bb</a> b/meta/reci=
pes-devtools/meson/<a href=3D"http://meson_0.58.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">meson_0.58.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.57.=
2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.57.2.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.58.0.=
bb" rel=3D"noreferrer" target=3D"_blank">meson_0.58.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-=
meson_0.57.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.57.=
2.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.=
58.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.58.0.bb</a>=
<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-m=
eson_0.57.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.57.2=
.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-mes=
on_0.58.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.58.0.b=
b</a><br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000e25d5205c24aa773--
