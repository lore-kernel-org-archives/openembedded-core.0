Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.10289.1620893529823481788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 01:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f8G0cfiE;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id l4so6423401vsa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OAMPCPVF5PUInRN+aV0HG5I43AT3PqOtew75uSUWWTU=;
        b=f8G0cfiEOYiourxcZiv7zPruiz1PBWJuO8g7yiRmQwzuOGei/I8Ac60ZwAIoDcVk2E
         0PztYCDXm4muAt6UP+2eC3VPBdKtUH6DLovTLsw9nVCdk7nYzBFMOoTAS5HV/lWSRBSZ
         8vY9Jgld1X83pmCX6PYp/ABpyFSy0PNg8EzAiuQaa0W6ph9ITq2explCDSHWJa00LfVd
         YC6MCJHIBc9mnq+byT3bJuCPK8UhMgm+AsG4avWiBFpY7ZRau4dXZG2cHJX0AtXJWiYd
         Jhf9rQJ5MHcx1uPFZkyDv0OW7U7bJBCDEZGm+P+Js3IxAP3fUHCujICBog02JXO2Cl/0
         +sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAMPCPVF5PUInRN+aV0HG5I43AT3PqOtew75uSUWWTU=;
        b=S+FUPr4O9V8QKZ4vjBlfAekjpEt0m4YfgBo+spHtd6kaLlLMGqwCDwQhNjSdXqEQOo
         cET+c68sVXJm9JlV7GVkbnK0tg7VBt1WU2lf2lv1JTkYuOPC6w0t8/jHXfMtFUjm3yfu
         VGQb8cRHRpoKsTL0JKzTjEjBARkWid1fwAAjUKK7Clg/6j3IVZjqRF3fQNRa2OOFaKN9
         iB3u2iMdhI011+aCbQrR+GTzyHYaxwzfDY/hTsanYlEy+P0QOy97Dgv/6PaAhi29ZVz0
         z9jtVeZQQ7mMWm8EKiNV5EA+LdPpDMS7jFQ+oP7VDtfxvzhz4Ot0Y4kIpILa3w6G8drN
         3I5g==
X-Gm-Message-State: AOAM532VNB2xb6Ub+XhuMXcfsJgxiEPQs2A8QHbVBbfmdQgkh7Obn91e
	5YE5zIfopGbmVuprWGzyNNoUNYTI9NaGXO37YV0=
X-Google-Smtp-Source: ABdhPJy7CQrIuBjBtxKkLqFJOAf/2HRAWByv64h5zE+DZNQtHofniOeqEjmXtVlfRH5qlq5RzBPTCFusdnoXERKLaiM=
X-Received: by 2002:a67:c401:: with SMTP id c1mr35461577vsk.51.1620893528752;
 Thu, 13 May 2021 01:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
 <20210510130110.939820-7-alex.kanavin@gmail.com> <DM6PR11MB4105F796CF8133DCFF0D73F9B9529@DM6PR11MB4105.namprd11.prod.outlook.com>
 <CANNYZj8Qx=4qD94D5hPgu_rK2dQUwSwZH-dBF+BXhDx-C=uasA@mail.gmail.com> <DM6PR11MB4105AE7B9791A29A738E507CB9519@DM6PR11MB4105.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4105AE7B9791A29A738E507CB9519@DM6PR11MB4105.namprd11.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 13 May 2021 10:11:56 +0200
Message-ID: <CANNYZj_k6_MYGUokT1o5i-S_Vr47rGUJLkKRfhRJLFLomNDV5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000005bc05c231af5e"

--0000000000000005bc05c231af5e
Content-Type: text/plain; charset="UTF-8"

I'm addressing that as well, thanks for notifying.

Alex

On Thu, 13 May 2021 at 07:44, Lee, Chee Yang <chee.yang.lee@intel.com>
wrote:

>
> I think these error is related to this patch or the gdk-pixbuf patch in
> this series .
> meson
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2089/steps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1635/steps/11/logs/stdio
> gdk-pixbuf
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/271/steps/12/logs/stdio
>
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Thursday, 13 May, 2021 1:04 AM
> *To:* Lee, Chee Yang <chee.yang.lee@intel.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
>
>
>
> Thank you, I will look into it.
>
>
>
> Alex
>
>
>
> On Wed, 12 May 2021 at 13:26, Lee, Chee Yang <chee.yang.lee@intel.com>
> wrote:
>
> Looks like this patch failed buildepoxy.EpoxyTest.test_epoxy test
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/3417/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3416/steps/12/logs/stdio
>
>
>
> >-----Original Message-----
> >From: openembedded-core@lists.openembedded.org <openembedded-
> >core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> >Sent: Monday, 10 May, 2021 9:01 PM
> >To: openembedded-core@lists.openembedded.org
> >Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> >Subject: [OE-core] [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
> >
> >Rebase patches; dropped chunks (and cross-prop-default.patch) have been
> >removed upstream.
> >
> >Move native-only patches to all-patches, as they're a pain to rebase
> >separately.
> >
> >Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >---
> > meta/recipes-devtools/meson/meson.inc         | 10 +---
> > .../0001-Make-CPU-family-warnings-fatal.patch | 18 +++---
> ...sues-that-arise-
> >when-cross-compiling.patch |  8 +--  ...-not-manipulate-the-environment-
> >when.patch | 14 ++---  ...pport-building-allarch-recipes-again.patch | 10
> ++--
> > .../meson/meson/0003-native_bindir.patch      | 58 +++++--------------
> > .../meson/meson/cross-prop-default.patch      | 23 --------
> > .../{meson_0.57.2.bb => meson_0.58.0.bb}      |  0
> > ...on_0.57.2.bb => nativesdk-meson_0.58.0.bb} |  0
> > 9 files changed, 43 insertions(+), 98 deletions(-)  delete mode 100644
> >meta/recipes-devtools/meson/meson/cross-prop-default.patch
> > rename meta/recipes-devtools/meson/{meson_0.57.2.bb =>
> >meson_0.58.0.bb} (100%)  rename meta/recipes-devtools/meson/{nativesdk-
> >meson_0.57.2.bb => nativesdk-meson_0.58.0.bb} (100%)
> >
> >diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-
> >devtools/meson/meson.inc
> >index 10e7d8a1ce..12a48fc992 100644
> >--- a/meta/recipes-devtools/meson/meson.inc
> >+++ b/meta/recipes-devtools/meson/meson.inc
> >@@ -12,16 +12,12 @@ SRC_URI =
> >"https://github.com/mesonbuild/meson/releases/download/${PV}/meson-
> >${P
> >            file://0003-native_bindir.patch \
> >            file://0001-python-module-do-not-manipulate-the-environment-
> >when.patch \
> >            file://disable-rpath-handling.patch \
> >-           file://cross-prop-default.patch \
> >            file://0001-modules-python.py-do-not-substitute-python-s-
> >install.patch \
> >            file://gi-target-dep.patch \
> >+           file://0001-Make-CPU-family-warnings-fatal.patch \
> >+           file://0002-Support-building-allarch-recipes-again.patch \
> >            "
> >-SRC_URI[sha256sum] =
> >"3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
> >-
> >-SRC_URI_append_class-native = " \
> >-    file://0001-Make-CPU-family-warnings-fatal.patch \
> >-    file://0002-Support-building-allarch-recipes-again.patch \
> >-"
> >+SRC_URI[sha256sum] =
> >"f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd"
> >
> > UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> > UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> >diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> >warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-
> >CPU-family-warnings-fatal.patch
> >index 300797f9ee..bcccfabd17 100644
> >--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> >warnings-fatal.patch
> >+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> >warnings-fa
> >+++ tal.patch
> >@@ -1,34 +1,33 @@
> >-From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00
> >2001
> >+From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00
> >2001
> > From: Ross Burton <ross.burton@intel.com>
> > Date: Tue, 3 Jul 2018 13:59:09 +0100
> >-Subject: [PATCH] Make CPU family warnings fatal
> >+Subject: [PATCH 1/2] Make CPU family warnings fatal
> >
> > Upstream-Status: Inappropriate [OE specific]
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> >-
> > ---
> >  mesonbuild/envconfig.py   | 2 +-
> >  mesonbuild/environment.py | 4 +---
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py -index
> >ba35d16..2d3c34c 100644
> >+index c6a4df3..4d58c91 100644
> > --- a/mesonbuild/envconfig.py
> > +++ b/mesonbuild/envconfig.py
> >-@@ -262,7 +262,7 @@ class MachineInfo:
> >+@@ -266,7 +266,7 @@ class MachineInfo:
> >
> >          cpu_family = literal['cpu_family']
> >          if cpu_family not in known_cpu_families:
> >--            mlog.warning('Unknown CPU family {}, please report this at
> >https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
> >+-            mlog.warning(f'Unknown CPU family {cpu_family}, please
> report this
> >at https://github.com/mesonbuild/meson/issues/new')
> > +            raise EnvironmentException('Unknown CPU family {}, see
> >https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for
> >directions.'.format(cpu_family))
> >
> >          endian = literal['endian']
> >          if endian not in ('little', 'big'):
> > diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py -
> >index 756dd81..4d2c2b6 100644
> >+index fc9b703..eea8345 100644
> > --- a/mesonbuild/environment.py
> > +++ b/mesonbuild/environment.py
> >-@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> >str:
> >+@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> >str:
> >              trial = 'ppc64'
> >
> >      if trial not in known_cpu_families:
> >@@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644
> >
> >      return trial
> >
> >+--
> >+2.24.0
> >+
> >diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-
> >that-arise-when-cross-compiling.patch b/meta/recipes-
> >devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-
> >compiling.patch
> >index 471f1500da..ce90e515da 100644
> >--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-
> >arise-when-cross-compiling.patch
> >+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-aris
> >+++ e-when-cross-compiling.patch
> >@@ -1,4 +1,4 @@
> >-From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001
> >+From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00
> >2001
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Date: Fri, 4 Aug 2017 16:16:41 +0300
> > Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling @@ -
> >20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/mesonbuild/modules/gnome.py
> >b/mesonbuild/modules/gnome.py -index bcf77b9..6a4b472 100644
> >+index dc2979e..c9ff9bd 100644
> > --- a/mesonbuild/modules/gnome.py
> > +++ b/mesonbuild/modules/gnome.py
> >-@@ -974,6 +974,10 @@ This will become a hard error in the future.''')
> >-             args.append('--{}={}'.format(program_name, path))
> >+@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
> >+             args.append(f'--{program_name}={path}')
> >          if namespace:
> >              args.append('--namespace=' + namespace)
> > +        gtkdoc_exe_wrapper =
> >state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> >diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-
> >not-manipulate-the-environment-when.patch b/meta/recipes-
> >devtools/meson/meson/0001-python-module-do-not-manipulate-the-
> >environment-when.patch
> >index eb0e90dbdd..fdadc6869b 100644
> >--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-
> >manipulate-the-environment-when.patch
> >+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-
> >manipu
> >+++ late-the-environment-when.patch
> >@@ -1,4 +1,4 @@
> >-From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001
> >+From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00
> >2001
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Date: Mon, 19 Nov 2018 14:24:26 +0100
> > Subject: [PATCH] python module: do not manipulate the environment when
> >calling @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin
> ><alex.kanavin@gmail.com>
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/mesonbuild/modules/python.py
> >b/mesonbuild/modules/python.py -index 07be318..b770603 100644
> >+index 422155b..aaf5844 100644
> > --- a/mesonbuild/modules/python.py
> > +++ b/mesonbuild/modules/python.py
> >-@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
> >+@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
> >                  old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
> >                  old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
> >
> >@@ -26,9 +26,9 @@ index 07be318..b770603 100644
> > -
> >                  try:
> >                      self.pkgdep = PkgConfigDependency(pkg_name,
> environment,
> >kwargs)
> >-                     mlog.debug('Found "{}" via pkgconfig lookup in LIBPC
> >({})'.format(pkg_name, pkg_libdir))
> >-@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
> >-                     mlog.debug('"{}" could not be found in LIBPC
> >({})'.format(pkg_name, pkg_libdir))
> >+                     mlog.debug(f'Found "{pkg_name}" via pkgconfig
> >+lookup in LIBPC ({pkg_libdir})') @@ -83,13 +78,6 @@ class
> >PythonDependency(ExternalDependency):
> >+                     mlog.debug(f'"{pkg_name}" could not be found in
> >+LIBPC ({pkg_libdir})')
> >                      mlog.debug(e)
> >
> > -                if old_pkg_path is not None:
> >@@ -39,5 +39,5 @@ index 07be318..b770603 100644
> > -                else:
> > -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
> >              else:
> >-                 mlog.debug('"{}" could not be found in LIBPC ({}), this
> is likely due to
> >a relocated python installation'.format(pkg_name, pkg_libdir))
> >+                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC
> >+ ({pkg_libdir}), this is likely due to a relocated python
> >+ installation')
> >
> >diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-
> >allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-
> >Support-building-allarch-recipes-again.patch
> >index f6175a194c..dcc1ce9c27 100644
> >--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-
> >recipes-again.patch
> >+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-
> >re
> >+++ cipes-again.patch
> >@@ -1,19 +1,18 @@
> >-From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00
> >2001
> >+From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00
> >2001
> > From: Peter Kjellerstedt <pkj@axis.com>
> > Date: Thu, 26 Jul 2018 16:32:49 +0200
> >-Subject: [PATCH] Support building allarch recipes again
> >+Subject: [PATCH 2/2] Support building allarch recipes again
> >
> > This registers "allarch" as a known CPU family.
> >
> > Upstream-Status: Inappropriate [OE specific]
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >-
> > ---
> >  mesonbuild/envconfig.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py -index
> >2d3c34c..b9e7908 100644
> >+index 4d58c91..ff01ad1 100644
> > --- a/mesonbuild/envconfig.py
> > +++ b/mesonbuild/envconfig.py
> > @@ -36,6 +36,7 @@ from pathlib import Path @@ -24,3 +23,6 @@ index
> >2d3c34c..b9e7908 100644
> >      'aarch64',
> >      'alpha',
> >      'arc',
> >+--
> >+2.24.0
> >+
> >diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >index ed85116c4f..89257b9e05 100644
> >--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >@@ -1,4 +1,4 @@
> >-From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00
> >2001
> >+From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00
> >2001
> > From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > Date: Wed, 15 Nov 2017 15:05:01 +0100
> > Subject: [PATCH] native_bindir
> >@@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado
> ><ricardo.ribalda@gmail.com>
> >
> > ---
> >  mesonbuild/dependencies/base.py | 19 +++++++++++--------
> >- mesonbuild/dependencies/ui.py   |  6 +++---
> >- 2 files changed, 14 insertions(+), 11 deletions(-)
> >+ 1 file changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/mesonbuild/dependencies/base.py
> >b/mesonbuild/dependencies/base.py -index cd77b4b..7e3f338 100644
> >+index 14380d4..d0c443f 100644
> > --- a/mesonbuild/dependencies/base.py
> > +++ b/mesonbuild/dependencies/base.py
> >-@@ -192,7 +192,7 @@ class Dependency:
> >+@@ -179,7 +179,7 @@ class Dependency:
> >      def get_exe_args(self, compiler):
> >          return []
> >
> > -    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str,
> >T.Any]) -> str:
> > +    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str,
> >T.Any], use_native=False) -> str:
> >-         raise DependencyException('{!r} is not a pkgconfig
> >dependency'.format(self.name))
> >+         raise DependencyException(f'{self.name!r} is not a pkgconfig
> >+ dependency')
> >
> >      def get_configtool_variable(self, variable_name):
> >-@@ -280,7 +280,7 @@ class InternalDependency(Dependency):
> >+@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
> >              return True
> >          return any(d.is_built() for d in self.ext_deps)
> >
> >@@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644
> >          raise DependencyException('Method "get_pkgconfig_variable()" is
> '
> >                                    'invalid for an internal dependency')
> >
> >-@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):
> >+@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
> >          return s.format(self.__class__.__name__, self.name,
> self.is_found,
> >                          self.version_reqs)
> >
> >@@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644
> >          p, out, err = Popen_safe(cmd, env=env)
> >          rc, out, err = p.returncode, out.strip(), err.strip()
> >          call = ' '.join(cmd)
> >-@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):
> >-             env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
> >-             mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
> >+@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
> >+             if key.startswith('PKG_'):
> >+                 mlog.debug(f'env[{key}]: {value}')
> >
> > -    def _call_pkgbin(self, args, env=None):
> > +    def _call_pkgbin(self, args, env=None, use_native=False):
> >          # Always copy the environment since we're going to modify it
> >          # with pkg-config variables
> >          if env is None:
> >-@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):
> >+@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
> >          targs = tuple(args)
> >          cache = PkgConfigDependency.pkgbin_cache
> >          if (self.pkgbin, targs, fenv) not in cache:
> >@@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644
> >          return cache[(self.pkgbin, targs, fenv)]
> >
> >      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
> >-@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):
> >+@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
> >                                        (self.name, out_raw))
> >          self.link_args, self.raw_link_args = self._search_libs(out,
> out_raw)
> >
> >@@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644
> >          options = ['--variable=' + variable_name, self.name]
> >
> >          if 'define_variable' in kwargs:
> >-@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):
> >+@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
> >
> >              options = ['--define-variable=' + '='.join(definition)] +
> options
> >
> >@@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644
> >          variable = ''
> >          if ret != 0:
> >              if self.required:
> >-diff --git a/mesonbuild/dependencies/ui.py
> >b/mesonbuild/dependencies/ui.py -index d897d76..a598d2e 100644
> >---- a/mesonbuild/dependencies/ui.py
> >-+++ b/mesonbuild/dependencies/ui.py
> >-@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
> >-         self.bindir = self.get_pkgconfig_host_bins(core)
> >-         if not self.bindir:
> >-             # If exec_prefix is not defined, the pkg-config file is
> broken
> >--            prefix = core.get_pkgconfig_variable('exec_prefix', {})
> >-+            prefix = core.get_pkgconfig_variable('exec_prefix', {},
> >-+ use_native=True)
> >-             if prefix:
> >-                 self.bindir = os.path.join(prefix, 'bin')
> >-
> >-@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):
> >-         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
> >-         for application in applications:
> >-             try:
> >--                return
> os.path.dirname(core.get_pkgconfig_variable('%s_location' %
> >application, {}))
> >-+                return
> >-+ os.path.dirname(core.get_pkgconfig_variable('%s_location' %
> >-+ application, {}, use_native=True))
> >-             except MesonException:
> >-                 pass
> >-
> >-@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):
> >-         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
> >-
> >-     def get_pkgconfig_host_bins(self, core):
> >--        return core.get_pkgconfig_variable('host_bins', {})
> >-+        return core.get_pkgconfig_variable('host_bins', {},
> >-+ use_native=True)
> >-
> >-     def get_private_includes(self, mod_inc_dir, module):
> >-         return _qt_get_private_includes(mod_inc_dir, module,
> self.version)
> >diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> >b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> >deleted file mode 100644
> >index 772395e879..0000000000
> >--- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> >+++ /dev/null
> >@@ -1,23 +0,0 @@
> >-meson.build files that use cc.run() in native builds can silently
> fallback to
> >-meson.get_cross_property() in cross builds without an exe-wrapper, but
> >there's -no way to know that this is happening.
> >-
> >-As the defaults may be pessimistic (for example, disabling the support
> for a -
> >feature that should be enabled) emit a warning when the default is used,
> so
> >that -the recipe can explicitly set the cross property as relevant.
> >-
> >-Upstream-Status: Submitted
> >[https://github.com/mesonbuild/meson/pull/5071]
> >-Signed-off-by: Ross Burton <ross.burton@intel.com>
> >-
> >-diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py -index
> >3c3cfae0..10e741ae 100644
> >---- a/mesonbuild/interpreter.py
> >-+++ b/mesonbuild/interpreter.py
> >-@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):
> >-             return props[propname]
> >-         except Exception:
> >-             if len(args) == 2:
> >-+                mlog.warning('Cross property %s is using default value
> >-+ %s' % (propname, args[1]))
> >-                 return args[1]
> >-             raise InterpreterException('Unknown cross property: %s.' %
> propname)
> >-
> >diff --git a/meta/recipes-devtools/meson/meson_0.57.2.bb b/meta/recipes-
> >devtools/meson/meson_0.58.0.bb
> >similarity index 100%
> >rename from meta/recipes-devtools/meson/meson_0.57.2.bb
> >rename to meta/recipes-devtools/meson/meson_0.58.0.bb
> >diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
> >b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
> >similarity index 100%
> >rename from meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
> >rename to meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
> >--
> >2.31.1
>
>

--0000000000000005bc05c231af5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m addressing that as well, thanks for notifying=
.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 13 May 2021 at 07:44, Lee,=
 Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com">chee.yang.lee@int=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-MY">
<div class=3D"gmail-m_-2988837498627373314WordSection1">
<p class=3D"MsoNormal"><br>
I think these error is related to this patch or the gdk-pixbuf patch in thi=
s series .<br>
meson <br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/2089/steps/14/logs/stdio" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/80/builds/2089/steps/14/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/108/buil=
ds/1635/steps/11/logs/stdio" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/typhoon/#/builders/108/builds/1635/steps/11/logs/stdio</a><br>
gdk-pixbuf<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/119/buil=
ds/271/steps/12/logs/stdio" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/119/builds/271/steps/12/logs/stdio</a><br>
<br>
<br>
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;
<br>
<b>Sent:</b> Thursday, 13 May, 2021 1:04 AM<br>
<b>To:</b> Lee, Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.com" ta=
rget=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 7/8] meson: update 0.57.2 -&gt; 0.58.0=
<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Thank you, I will look into it.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, 12 May 2021 at 13:26, Lee, Chee Yang &lt;<a =
href=3D"mailto:chee.yang.lee@intel.com" target=3D"_blank">chee.yang.lee@int=
el.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Looks like this patch f=
ailed buildepoxy.EpoxyTest.test_epoxy test<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/62/build=
s/3417/steps/12/logs/stdio" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/62/builds/3417/steps/12/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/3416/steps/12/logs/stdio" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/48/builds/3416/steps/12/logs/stdio</a><br>
<br>
<br>
<br>
&gt;-----Original Message-----<br>
&gt;From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;openembedded-<br>
&gt;<a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@l=
ists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin<br>
&gt;Sent: Monday, 10 May, 2021 9:01 PM<br>
&gt;To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt;Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;Subject: [OE-core] [PATCH 7/8] meson: update 0.57.2 -&gt; 0.58.0<br>
&gt;<br>
&gt;Rebase patches; dropped chunks (and cross-prop-default.patch) have been=
<br>
&gt;removed upstream.<br>
&gt;<br>
&gt;Move native-only patches to all-patches, as they&#39;re a pain to rebas=
e<br>
&gt;separately.<br>
&gt;<br>
&gt;Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gma=
il.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;---<br>
&gt; meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 10 +---<br>
&gt; .../0001-Make-CPU-family-warnings-fatal.patch | 18 +++---=C2=A0 ...sue=
s-that-arise-<br>
&gt;when-cross-compiling.patch |=C2=A0 8 +--=C2=A0 ...-not-manipulate-the-e=
nvironment-<br>
&gt;when.patch | 14 ++---=C2=A0 ...pport-building-allarch-recipes-again.pat=
ch | 10 ++--<br>
&gt; .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=A0 | 58 ++++=
+--------------<br>
&gt; .../meson/meson/cross-prop-default.patch=C2=A0 =C2=A0 =C2=A0 | 23 ----=
----<br>
&gt; .../{<a href=3D"http://meson_0.57.2.bb" target=3D"_blank">meson_0.57.2=
.bb</a> =3D&gt; <a href=3D"http://meson_0.58.0.bb" target=3D"_blank">
meson_0.58.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt; ...<a href=3D"http://on_0.57.2.bb" target=3D"_blank">on_0.57.2.bb</a> =
=3D&gt; <a href=3D"http://nativesdk-meson_0.58.0.bb" target=3D"_blank">
nativesdk-meson_0.58.0.bb</a>} |=C2=A0 0<br>
&gt; 9 files changed, 43 insertions(+), 98 deletions(-)=C2=A0 delete mode 1=
00644<br>
&gt;meta/recipes-devtools/meson/meson/cross-prop-default.patch<br>
&gt; rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.57.2.bb"=
 target=3D"_blank">meson_0.57.2.bb</a> =3D&gt;<br>
&gt;<a href=3D"http://meson_0.58.0.bb" target=3D"_blank">meson_0.58.0.bb</a=
>} (100%)=C2=A0 rename meta/recipes-devtools/meson/{nativesdk-<br>
&gt;<a href=3D"http://meson_0.57.2.bb" target=3D"_blank">meson_0.57.2.bb</a=
> =3D&gt; <a href=3D"http://nativesdk-meson_0.58.0.bb" target=3D"_blank">
nativesdk-meson_0.58.0.bb</a>} (100%)<br>
&gt;<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-<br>
&gt;devtools/meson/meson.inc<br>
&gt;index 10e7d8a1ce..12a48fc992 100644<br>
&gt;--- a/meta/recipes-devtools/meson/meson.inc<br>
&gt;+++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt;@@ -12,16 +12,12 @@ SRC_URI =3D<br>
&gt;&quot;<a href=3D"https://github.com/mesonbuild/meson/releases/download/=
$%7BPV%7D/meson-" target=3D"_blank">https://github.com/mesonbuild/meson/rel=
eases/download/${PV}/meson-</a><br>
&gt;${P<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-native_bindir.pat=
ch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-python-module-do-=
not-manipulate-the-environment-<br>
&gt;when.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable-rpath-handling=
.patch \<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-prop-default.pat=
ch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-modules-python.py=
-do-not-substitute-python-s-<br>
&gt;install.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gi-target-dep.patch \<=
br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-CPU-family-w=
arnings-fatal.patch \<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Support-building-=
allarch-recipes-again.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;-SRC_URI[sha256sum] =3D<br>
&gt;&quot;3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5&=
quot;<br>
&gt;-<br>
&gt;-SRC_URI_append_class-native =3D &quot; \<br>
&gt;-=C2=A0 =C2=A0 <a>file://0001-Make-CPU-family-warnings-fatal.patch</a> =
\<br>
&gt;-=C2=A0 =C2=A0 <a>file://0002-Support-building-allarch-recipes-again.pa=
tch</a> \<br>
&gt;-&quot;<br>
&gt;+SRC_URI[sha256sum] =3D<br>
&gt;&quot;f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd&=
quot;<br>
&gt;<br>
&gt; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/mesonbuild/=
meson/releases" target=3D"_blank">https://github.com/mesonbuild/meson/relea=
ses</a>&quot;<br>
&gt; UPSTREAM_CHECK_REGEX =3D &quot;meson-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-<br=
>
&gt;warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-<br>
&gt;CPU-family-warnings-fatal.patch<br>
&gt;index 300797f9ee..bcccfabd17 100644<br>
&gt;--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-<br>
&gt;warnings-fatal.patch<br>
&gt;+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-<br>
&gt;warnings-fa<br>
&gt;+++ tal.patch<br>
&gt;@@ -1,34 +1,33 @@<br>
&gt;-From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt;+From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt; From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; Date: Tue, 3 Jul 2018 13:59:09 +0100<br>
&gt;-Subject: [PATCH] Make CPU family warnings fatal<br>
&gt;+Subject: [PATCH 1/2] Make CPU family warnings fatal<br>
&gt;<br>
&gt; Upstream-Status: Inappropriate [OE specific]<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;-<br>
&gt; ---<br>
&gt;=C2=A0 mesonbuild/envconfig.py=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 mesonbuild/environment.py | 4 +---<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py -index<=
br>
&gt;ba35d16..2d3c34c 100644<br>
&gt;+index c6a4df3..4d58c91 100644<br>
&gt; --- a/mesonbuild/envconfig.py<br>
&gt; +++ b/mesonbuild/envconfig.py<br>
&gt;-@@ -262,7 +262,7 @@ class MachineInfo:<br>
&gt;+@@ -266,7 +266,7 @@ class MachineInfo:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_family =3D literal[&#39;cpu_fami=
ly&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cpu_family not in known_cpu_famil=
ies:<br>
&gt;--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown C=
PU family {}, please report this at<br>
&gt;<a href=3D"https://github.com/mesonbuild/meson/issues/new&#39;.format(c=
pu_family)" target=3D"_blank">https://github.com/mesonbuild/meson/issues/ne=
w&#39;.format(cpu_family)</a>)<br>
&gt;+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(f&#39;Unknown =
CPU family {cpu_family}, please report this<br>
&gt;at <a href=3D"https://github.com/mesonbuild/meson/issues/new" target=3D=
"_blank">https://github.com/mesonbuild/meson/issues/new</a>&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentException(=
&#39;Unknown CPU family {}, see<br>
&gt;<a href=3D"https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU" target=
=3D"_blank">https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU</a> for<br>
&gt;directions.&#39;.format(cpu_family))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endian =3D literal[&#39;endian&#39;]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if endian not in (&#39;little&#39;, =
&#39;big&#39;):<br>
&gt; diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py -<b=
r>
&gt;index 756dd81..4d2c2b6 100644<br>
&gt;+index fc9b703..eea8345 100644<br>
&gt; --- a/mesonbuild/environment.py<br>
&gt; +++ b/mesonbuild/environment.py<br>
&gt;-@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) -&=
gt;<br>
&gt;str:<br>
&gt;+@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) -&=
gt;<br>
&gt;str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trial =3D &#39;ppc64&#=
39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if trial not in known_cpu_families:<br>
&gt;@@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return trial<br>
&gt;<br>
&gt;+--<br>
&gt;+2.24.0<br>
&gt;+<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-<=
br>
&gt;that-arise-when-cross-compiling.patch b/meta/recipes-<br>
&gt;devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-<br>
&gt;compiling.patch<br>
&gt;index 471f1500da..ce90e515da 100644<br>
&gt;--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-<br=
>
&gt;arise-when-cross-compiling.patch<br>
&gt;+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-ari=
s<br>
&gt;+++ e-when-cross-compiling.patch<br>
&gt;@@ -1,4 +1,4 @@<br>
&gt;-From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001=
<br>
&gt;+From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
&gt; Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling @@=
 -<br>
&gt;20,11 +20,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/mesonbuild/modules/gnome.py<br>
&gt;b/mesonbuild/modules/gnome.py -index bcf77b9..6a4b472 100644<br>
&gt;+index dc2979e..c9ff9bd 100644<br>
&gt; --- a/mesonbuild/modules/gnome.py<br>
&gt; +++ b/mesonbuild/modules/gnome.py<br>
&gt;-@@ -974,6 +974,10 @@ This will become a hard error in the future.&#39;=
&#39;&#39;)<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(&#39;--{}=
=3D{}&#39;.format(program_name, path))<br>
&gt;+@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(f&#39;--{p=
rogram_name}=3D{path}&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if namespace:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--nam=
espace=3D&#39; + namespace)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D<br>
&gt;state.environment.properties.host.get(&#39;gtkdoc_exe_wrapper&#39;, Non=
e)<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-<b=
r>
&gt;not-manipulate-the-environment-when.patch b/meta/recipes-<br>
&gt;devtools/meson/meson/0001-python-module-do-not-manipulate-the-<br>
&gt;environment-when.patch<br>
&gt;index eb0e90dbdd..fdadc6869b 100644<br>
&gt;--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-<br>
&gt;manipulate-the-environment-when.patch<br>
&gt;+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-<br>
&gt;manipu<br>
&gt;+++ late-the-environment-when.patch<br>
&gt;@@ -1,4 +1,4 @@<br>
&gt;-From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001=
<br>
&gt;+From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Date: Mon, 19 Nov 2018 14:24:26 +0100<br>
&gt; Subject: [PATCH] python module: do not manipulate the environment when=
<br>
&gt;calling @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin<br>
&gt;&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt;<br>
&gt;=C2=A0 1 file changed, 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/mesonbuild/modules/python.py<br>
&gt;b/mesonbuild/modules/python.py -index 07be318..b770603 100644<br>
&gt;+index 422155b..aaf5844 100644<br>
&gt; --- a/mesonbuild/modules/python.py<br>
&gt; +++ b/mesonbuild/modules/python.py<br>
&gt;-@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):<br>
&gt;+@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old_pkg_=
libdir =3D os.environ.get(&#39;PKG_CONFIG_LIBDIR&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old_pkg_=
path =3D os.environ.get(&#39;PKG_CONFIG_PATH&#39;)<br>
&gt;<br>
&gt;@@ -26,9 +26,9 @@ index 07be318..b770603 100644<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.pkgdep =3D PkgConfigDependency(pkg_name, environment,<br>
&gt;kwargs)<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mlog.debug(&#39;Found &quot;{}&quot; via pkgconfig lookup in LIBPC<br=
>
&gt;({})&#39;.format(pkg_name, pkg_libdir))<br>
&gt;-@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mlog.debug(&#39;&quot;{}&quot; could not be found in LIBPC<br>
&gt;({})&#39;.format(pkg_name, pkg_libdir))<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mlog.debug(f&#39;Found &quot;{pkg_name}&quot; via pkgconfig<br>
&gt;+lookup in LIBPC ({pkg_libdir})&#39;) @@ -83,13 +78,6 @@ class<br>
&gt;PythonDependency(ExternalDependency):<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mlog.debug(f&#39;&quot;{pkg_name}&quot; could not be found in<br>
&gt;+LIBPC ({pkg_libdir})&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mlog.debug(e)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if old_pkg_pa=
th is not None:<br>
&gt;@@ -39,5 +39,5 @@ index 07be318..b770603 100644<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 os.environ.pop(&#39;PKG_CONFIG_LIBDIR&#39;, None)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.deb=
ug(&#39;&quot;{}&quot; could not be found in LIBPC ({}), this is likely due=
 to<br>
&gt;a relocated python installation&#39;.format(pkg_name, pkg_libdir))<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.deb=
ug(f&#39;&quot;{pkg_name}&quot; could not be found in LIBPC<br>
&gt;+ ({pkg_libdir}), this is likely due to a relocated python<br>
&gt;+ installation&#39;)<br>
&gt;<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-<b=
r>
&gt;allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-<b=
r>
&gt;Support-building-allarch-recipes-again.patch<br>
&gt;index f6175a194c..dcc1ce9c27 100644<br>
&gt;--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-<=
br>
&gt;recipes-again.patch<br>
&gt;+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-<=
br>
&gt;re<br>
&gt;+++ cipes-again.patch<br>
&gt;@@ -1,19 +1,18 @@<br>
&gt;-From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt;+From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt; From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" target=3D=
"_blank">pkj@axis.com</a>&gt;<br>
&gt; Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt;-Subject: [PATCH] Support building allarch recipes again<br>
&gt;+Subject: [PATCH 2/2] Support building allarch recipes again<br>
&gt;<br>
&gt; This registers &quot;allarch&quot; as a known CPU family.<br>
&gt;<br>
&gt; Upstream-Status: Inappropriate [OE specific]<br>
&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt;-<br>
&gt; ---<br>
&gt;=C2=A0 mesonbuild/envconfig.py | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py -index<=
br>
&gt;2d3c34c..b9e7908 100644<br>
&gt;+index 4d58c91..ff01ad1 100644<br>
&gt; --- a/mesonbuild/envconfig.py<br>
&gt; +++ b/mesonbuild/envconfig.py<br>
&gt; @@ -36,6 +36,7 @@ from pathlib import Path @@ -24,3 +23,6 @@ index<br>
&gt;2d3c34c..b9e7908 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;aarch64&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;alpha&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;arc&#39;,<br>
&gt;+--<br>
&gt;+2.24.0<br>
&gt;+<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch=
<br>
&gt;b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt;index ed85116c4f..89257b9e05 100644<br>
&gt;--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt;+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt;@@ -1,4 +1,4 @@<br>
&gt;-From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt;+From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00<br>
&gt;2001<br>
&gt; From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.ribalda@gm=
ail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt; Subject: [PATCH] native_bindir<br>
&gt;@@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado<br>
&gt;&lt;<a href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">rica=
rdo.ribalda@gmail.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 mesonbuild/dependencies/base.py | 19 +++++++++++--------<br>
&gt;- mesonbuild/dependencies/ui.py=C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt;- 2 files changed, 14 insertions(+), 11 deletions(-)<br>
&gt;+ 1 file changed, 11 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/mesonbuild/dependencies/base.py<br>
&gt;b/mesonbuild/dependencies/base.py -index cd77b4b..7e3f338 100644<br>
&gt;+index 14380d4..d0c443f 100644<br>
&gt; --- a/mesonbuild/dependencies/base.py<br>
&gt; +++ b/mesonbuild/dependencies/base.py<br>
&gt;-@@ -192,7 +192,7 @@ class Dependency:<br>
&gt;+@@ -179,7 +179,7 @@ class Dependency:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def get_exe_args(self, compiler):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, kw=
args: T.Dict[str,<br>
&gt;T.Any]) -&gt; str:<br>
&gt; +=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, kw=
args: T.Dict[str,<br>
&gt;T.Any], use_native=3DFalse) -&gt; str:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#39;{!r} =
is not a pkgconfig<br>
&gt;dependency&#39;.format(<a href=3D"http://self.name" target=3D"_blank">s=
elf.name</a>))<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(f&#39;{<a =
href=3D"http://self.name" target=3D"_blank">self.name</a>!r} is not a pkgco=
nfig<br>
&gt;+ dependency&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def get_configtool_variable(self, variable_name):<=
br>
&gt;-@@ -280,7 +280,7 @@ class InternalDependency(Dependency):<br>
&gt;+@@ -267,7 +267,7 @@ class InternalDependency(Dependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return any(d.is_built() for d in sel=
f.ext_deps)<br>
&gt;<br>
&gt;@@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DependencyException(&#39;Metho=
d &quot;get_pkgconfig_variable()&quot; is &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;invalid for an=
 internal dependency&#39;)<br>
&gt;<br>
&gt;-@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;+@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s.format(self.__class__.__nam=
e__, <a href=3D"http://self.name" target=3D"_blank">
self.name</a>, self.is_found,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.version_reqs)<br>
&gt;<br>
&gt;@@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p, out, err =3D Popen_safe(cmd, env=
=3Denv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc, out, err =3D p.returncode, out.s=
trip(), err.strip()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call =3D &#39; &#39;.join(cmd)<br>
&gt;-@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env[&#39;PKG_CONFIG_LI=
BDIR&#39;] =3D new_pkg_config_libdir<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.debug(&#39;PKG_CO=
NFIG_LIBDIR: &#39; + new_pkg_config_libdir)<br>
&gt;+@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if key.startswith(&#39=
;PKG_&#39;):<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.deb=
ug(f&#39;env[{key}]: {value}&#39;)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone):<br>
&gt; +=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone, use_native=3DF=
alse):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Always copy the environment since =
we&#39;re going to modify it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # with pkg-config variables<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if env is None:<br>
&gt;-@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;+@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targs =3D tuple(args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache =3D PkgConfigDependency.pkgbin=
_cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (self.pkgbin, targs, fenv) not in=
 cache:<br>
&gt;@@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cache[(self.pkgbin, targs, fe=
nv)]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _convert_mingw_paths(self, args: T.List[str]) =
-&gt; T.List[str]:<br>
&gt;-@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;+@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<a h=
ref=3D"http://self.name" target=3D"_blank">self.name</a>, out_raw))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.link_args, self.raw_link_args =
=3D self._search_libs(out, out_raw)<br>
&gt;<br>
&gt;@@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options =3D [&#39;--variable=3D&#39;=
 + variable_name, <a href=3D"http://self.name" target=3D"_blank">
self.name</a>]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;define_variable&#39; in kwar=
gs:<br>
&gt;-@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;+@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options =3D [&#39;--de=
fine-variable=3D&#39; + &#39;=3D&#39;.join(definition)] + options<br>
&gt;<br>
&gt;@@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variable =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ret !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.required:<br>
&gt;-diff --git a/mesonbuild/dependencies/ui.py<br>
&gt;b/mesonbuild/dependencies/ui.py -index d897d76..a598d2e 100644<br>
&gt;---- a/mesonbuild/dependencies/ui.py<br>
&gt;-+++ b/mesonbuild/dependencies/ui.py<br>
&gt;-@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bindir =3D self.get_pkgconfig_h=
ost_bins(core)<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.bindir:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If exec_prefix is no=
t defined, the pkg-config file is broken<br>
&gt;--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D core.get_pkgconf=
ig_variable(&#39;exec_prefix&#39;, {})<br>
&gt;-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D core.get_pkgconf=
ig_variable(&#39;exec_prefix&#39;, {},<br>
&gt;-+ use_native=3DTrue)<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if prefix:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bin=
dir =3D os.path.join(prefix, &#39;bin&#39;)<br>
&gt;-<br>
&gt;-@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0applications =3D [&#39;moc&#39;, &#3=
9;uic&#39;, &#39;rcc&#39;, &#39;lupdate&#39;, &#39;lrelease&#39;]<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for application in applications:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return os.pat=
h.dirname(core.get_pkgconfig_variable(&#39;%s_location&#39; %<br>
&gt;application, {}))<br>
&gt;-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;-+ os.path.dirname(core.get_pkgconfig_variable(&#39;%s_location&#39; %<=
br>
&gt;-+ application, {}, use_native=3DTrue))<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except MesonException:=
<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
&gt;-<br>
&gt;-@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QtBaseDependency.__init__(self, &#39=
;qt5&#39;, env, kwargs)<br>
&gt;-<br>
&gt;-=C2=A0 =C2=A0 =C2=A0def get_pkgconfig_host_bins(self, core):<br>
&gt;--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return core.get_pkgconfig_variable(&#39;h=
ost_bins&#39;, {})<br>
&gt;-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return core.get_pkgconfig_variable(&#39;h=
ost_bins&#39;, {},<br>
&gt;-+ use_native=3DTrue)<br>
&gt;-<br>
&gt;-=C2=A0 =C2=A0 =C2=A0def get_private_includes(self, mod_inc_dir, module=
):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return _qt_get_private_includes(mod_=
inc_dir, module, self.version)<br>
&gt;diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch=
<br>
&gt;b/meta/recipes-devtools/meson/meson/cross-prop-default.patch<br>
&gt;deleted file mode 100644<br>
&gt;index 772395e879..0000000000<br>
&gt;--- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch<br>
&gt;+++ /dev/null<br>
&gt;@@ -1,23 +0,0 @@<br>
&gt;-meson.build files that use cc.run() in native builds can silently fall=
back to<br>
&gt;-meson.get_cross_property() in cross builds without an exe-wrapper, but=
<br>
&gt;there&#39;s -no way to know that this is happening.<br>
&gt;-<br>
&gt;-As the defaults may be pessimistic (for example, disabling the support=
 for a -<br>
&gt;feature that should be enabled) emit a warning when the default is used=
, so<br>
&gt;that -the recipe can explicitly set the cross property as relevant.<br>
&gt;-<br>
&gt;-Upstream-Status: Submitted<br>
&gt;[<a href=3D"https://github.com/mesonbuild/meson/pull/5071" target=3D"_b=
lank">https://github.com/mesonbuild/meson/pull/5071</a>]<br>
&gt;-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;-<br>
&gt;-diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py -in=
dex<br>
&gt;3c3cfae0..10e741ae 100644<br>
&gt;---- a/mesonbuild/interpreter.py<br>
&gt;-+++ b/mesonbuild/interpreter.py<br>
&gt;-@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return props[propname]=
<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(args) =3D=3D 2:=
<br>
&gt;-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(=
&#39;Cross property %s is using default value<br>
&gt;-+ %s&#39; % (propname, args[1]))<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return a=
rgs[1]<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise InterpreterExcep=
tion(&#39;Unknown cross property: %s.&#39; % propname)<br>
&gt;-<br>
&gt;diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.57.2=
.bb" target=3D"_blank">meson_0.57.2.bb</a> b/meta/recipes-<br>
&gt;devtools/meson/<a href=3D"http://meson_0.58.0.bb" target=3D"_blank">mes=
on_0.58.0.bb</a><br>
&gt;similarity index 100%<br>
&gt;rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.57.2.=
bb" target=3D"_blank">meson_0.57.2.bb</a><br>
&gt;rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.58.0.bb=
" target=3D"_blank">meson_0.58.0.bb</a><br>
&gt;diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-me=
son_0.57.2.bb" target=3D"_blank">nativesdk-meson_0.57.2.bb</a><br>
&gt;b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.58.0.=
bb" target=3D"_blank">nativesdk-meson_0.58.0.bb</a><br>
&gt;similarity index 100%<br>
&gt;rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-mes=
on_0.57.2.bb" target=3D"_blank">nativesdk-meson_0.57.2.bb</a><br>
&gt;rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson=
_0.58.0.bb" target=3D"_blank">nativesdk-meson_0.58.0.bb</a><br>
&gt;--<br>
&gt;2.31.1<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000000005bc05c231af5e--
