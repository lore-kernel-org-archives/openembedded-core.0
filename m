Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
	[209.85.221.180])
	by mail.openembedded.org (Postfix) with ESMTP id 618F67C617
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:58:22 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id m17so15463564vkl.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YJIfztXjySkepwCDooYuzf5nE9R9dBsvbKC/xsaICfg=;
	b=SiyIeqdoSMIAcOGwbxryfWz3PvjzCD6TY9rBj3X+tXF24O8FCi+EyZwLLdLrYj6tlO
	5GLwlIXZGeOuSjVMvSx+SD5vCDo2fgxSf8J4pFGzjqFzJiXqmIMmmGO0CD3vE84qAkky
	UXGZldre2auwGgEM18EiZXsqdS4jldt5rRfBA0v4V7oWHmYxrDCPR6hywOI0QtmPsQel
	43PEmZkx0eYQcxQUPsvAO/GWcS6bI7d8xVL++tNALSSul2CmCjF7YCJheWqPRMJzyS04
	+Wa3JwXtPh8Pt9H3y2VK8fiKcp+uyEoTshlpA+AsBkwHCYlwrQZz9aUwHKw7dm7+aD9y
	rgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YJIfztXjySkepwCDooYuzf5nE9R9dBsvbKC/xsaICfg=;
	b=qWLhpERtqyB70rLtmm0h/0KUCPtmdSToyFail/6xznNn62ucOLk8il6V0NO2jByF3D
	wyrGg1/idq5s53uKWpLuqABuF8j8I8wVo1e1azhx01YrA7sSVG9tNLCV+x8qQBjiaJnp
	XKDPXSdNK6LZ19lSlbNgzPXtExiYOgUCURym/yWQq82wmH8Okpui0jtf98iXph19plWV
	hIVxE5jn8bHMlPtHOm1XwT0vBTLKTeGw6noQVkrqARGen1tNNXx0KG+MxYRI0hHyfQHB
	+LbJILJP4i2s/ByOo3RKFvuBwpER3Y60oIq6b4Vm/KLToM+xFBp06VkO9r5FrfpKC67P
	M/cQ==
X-Gm-Message-State: APjAAAUasS4hNnoZQd+TsDRY2zi+4qKr6w+WQHVFGRMdDxJV4IK4ALXm
	K8SQdUU9sA5CWxupVrfiiSIXEZ8Pf8TT8nKjmBA=
X-Google-Smtp-Source: APXvYqyDguvccx0kdwG+ROTHQIwMY9XbrQ3sqkC7CHtSyub/eXH+o4zjCQ3nvcG1DkxBdJfYj+H412iAe/a1RQCbDZk=
X-Received: by 2002:a1f:8bc4:: with SMTP id n187mr53094522vkd.32.1564761503095;
	Fri, 02 Aug 2019 08:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
	<CAMKF1srOX4bRL5r+pZT+DKDwKPKwYyjg_2HjD0SW9t8XXezJVg@mail.gmail.com>
In-Reply-To: <CAMKF1srOX4bRL5r+pZT+DKDwKPKwYyjg_2HjD0SW9t8XXezJVg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Aug 2019 17:58:11 +0200
Message-ID: <CANNYZj9L+oJhKfXFgtsLPMi2jxHJ-JuOD0UxRZQ+=SpAvEHaoQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] meson: update 0.50.1 -> 0.51.1
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
X-List-Received-Date: Fri, 02 Aug 2019 15:58:23 -0000
Content-Type: multipart/alternative; boundary="0000000000008ce244058f246d8f"

--0000000000008ce244058f246d8f
Content-Type: text/plain; charset="UTF-8"

Thanks, I have just sent a patch that fixes the error.

Alex

On Thu, 1 Aug 2019 at 16:33, Khem Raj <raj.khem@gmail.com> wrote:

> Alexander
>
> Either this or the next patch in this series seems to be causing
>
> https://errors.yoctoproject.org/Errors/Details/256700/
>
> On Tue, Jul 30, 2019 at 8:55 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Drop backports.
> >
> > Rebase other patches.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/meson/meson.inc         |   6 +-
> >  .../0001-Make-CPU-family-warnings-fatal.patch |  10 +-
> >  ...etect-windows-also-if-the-system-str.patch |  14 +-
> >  ...onment.py-check-environment-for-vari.patch |  20 +-
> >  ...onment.py-do-not-determine-whether-a.patch |  10 +-
> >  ...pport-building-allarch-recipes-again.patch |   6 +-
> >  .../meson/meson/0003-native_bindir.patch      |  32 +--
> >  ...ld-allow-multiple-cross-file-options.patch | 185 ------------------
> >  .../load-configs-generalise-search-path.patch |  53 -----
> >  .../{meson_0.50.1.bb => meson_0.51.1.bb}      |   0
> >  ...on_0.50.1.bb => nativesdk-meson_0.51.1.bb} |   0
> >  11 files changed, 49 insertions(+), 287 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
> >  delete mode 100644
> meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
> >  rename meta/recipes-devtools/meson/{meson_0.50.1.bb => meson_0.51.1.bb}
> (100%)
> >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.50.1.bb =>
> nativesdk-meson_0.51.1.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> > index 6a723683cc0..b9a05967f46 100644
> > --- a/meta/recipes-devtools/meson/meson.inc
> > +++ b/meta/recipes-devtools/meson/meson.inc
> > @@ -11,15 +11,13 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> >
>  file://0001-python-module-do-not-manipulate-the-environment-when.patch \
> >             file://disable-rpath-handling.patch \
> >             file://cross-prop-default.patch \
> > -           file://load-configs-generalise-search-path.patch \
> > -
>  file://0007-mesonbuild-allow-multiple-cross-file-options.patch \
> >
>  file://0001-environment.py-detect-windows-also-if-the-system-str.patch \
> >
>  file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
> >
>  file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
> >
>  file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
> >             "
> > -SRC_URI[sha256sum] =
> "f68f56d60c80a77df8fc08fa1016bc5831605d4717b622c96212573271e14ecc"
> > -SRC_URI[md5sum] = "24a6527796115828d2ebc75880e18d62"
> > +SRC_URI[sha256sum] =
> "f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82"
> > +SRC_URI[md5sum] = "48787e391ec5c052799a3dd491f73909"
> >
> >  SRC_URI_append_class-native = " \
> >      file://0001-Make-CPU-family-warnings-fatal.patch \
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > index adde1e271f1..444fc081686 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > @@ -1,4 +1,4 @@
> > -From 4b4b3d4932d928f05dbd74d730a3c8a5ac371e1d Mon Sep 17 00:00:00 2001
> > +From f70fee13e4dbc757cd8153cd42d92fa9394fb542 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Tue, 3 Jul 2018 13:59:09 +0100
> >  Subject: [PATCH] Make CPU family warnings fatal
> > @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
> >   2 files changed, 2 insertions(+), 4 deletions(-)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index 5309ef4..3f0a399 100644
> > +index 03c6346..86b350b 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> > -@@ -178,7 +178,7 @@ class MachineInfo:
> > +@@ -186,7 +186,7 @@ class MachineInfo:
> >
> >           cpu_family = literal['cpu_family']
> >           if cpu_family not in known_cpu_families:
> > @@ -25,10 +25,10 @@ index 5309ef4..3f0a399 100644
> >           endian = literal['endian']
> >           if endian not in ('little', 'big'):
> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index 3031a82..ecd18d0 100644
> > +index 0cfdf9c..40aa189 100644
> >  --- a/mesonbuild/environment.py
> >  +++ b/mesonbuild/environment.py
> > -@@ -242,9 +242,7 @@ def detect_cpu_family(compilers):
> > +@@ -262,9 +262,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
> >           trial = 'parisc'
> >
> >       if trial not in known_cpu_families:
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
> b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
> > index f6043190af0..37b5356d77a 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
> > @@ -1,4 +1,4 @@
> > -From 63b78b7990c5d60f7bc674a26f655caa0bec3c49 Mon Sep 17 00:00:00 2001
> > +From b52e47c9d61dc4c930cfc7236fbeb70338c3b953 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 25 Mar 2019 17:17:06 +0100
> >  Subject: [PATCH] environment.py: detect windows also if the system
> string
> > @@ -6,20 +6,24 @@ Subject: [PATCH] environment.py: detect windows also
> if the system string
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> >   mesonbuild/envconfig.py | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index f2510c1..5309ef4 100644
> > +index 03c6346..a59cd89 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> > -@@ -194,7 +194,7 @@ class MachineInfo:
> > +@@ -198,7 +198,7 @@ class MachineInfo:
> >           """
> >           Machine is windows?
> >           """
> > --        return self.system == 'windows'
> > +-        return self.system in {'windows', 'mingw'}
> >  +        return self.system == 'windows' or 'mingw' in self.system
> >
> > -     def is_cygwin(self):
> > +     def is_cygwin(self) -> bool:
> >           """
> > +--
> > +2.17.1
> > +
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
> b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
> > index fadb2734f4b..f4456235fe7 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
> > @@ -1,4 +1,4 @@
> > -From 63e79329b5dd00882f0cea56a6d907a831b94171 Mon Sep 17 00:00:00 2001
> > +From a72dc2b1cddcf180ce782860896deae0b12d5000 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 25 Mar 2019 18:52:48 +0100
> >  Subject: [PATCH] mesonbuild/environment.py: check environment for
> various
> > @@ -6,23 +6,21 @@ Subject: [PATCH] mesonbuild/environment.py: check
> environment for various
> >
> >  Upstream-Status: Inappropriate [oe-core specific]
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> >   mesonbuild/environment.py | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index 6e5d689..bbfd87d 100644
> > +index 9a029f4..0cfdf9c 100644
> >  --- a/mesonbuild/environment.py
> >  +++ b/mesonbuild/environment.py
> > -@@ -398,7 +398,7 @@ class Environment:
> > +@@ -448,7 +448,7 @@ class Environment:
> >               config = MesonConfigFile.from_config_parser(
> > -                 coredata.load_configs(self.coredata.cross_files,
> 'cross'))
> > -             self.properties.host = Properties(config.get('properties',
> {}), False)
> > --            self.binaries.host = BinaryTable(config.get('binaries',
> {}), False)
> > -+            self.binaries.host = BinaryTable(config.get('binaries',
> {}), True)
> > +                 coredata.load_configs(self.coredata.cross_files))
> > +             properties.host = Properties(config.get('properties', {}),
> False)
> > +-            binaries.host = BinaryTable(config.get('binaries', {}),
> False)
> > ++            binaries.host = BinaryTable(config.get('binaries', {}),
> True)
> >               if 'host_machine' in config:
> > -                 self.machines.host =
> MachineInfo.from_literal(config['host_machine'])
> > +                 machines.host =
> MachineInfo.from_literal(config['host_machine'])
> >               if 'target_machine' in config:
> > ---
> > -2.17.1
> > -
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
> b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
> > index 83347145417..8cb11879f4d 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
> > @@ -1,4 +1,4 @@
> > -From d9da5e7a16a9397e22a8900fac4b60b40d7f00de Mon Sep 17 00:00:00 2001
> > +From ec9c4a22424a5d55fcf213a55d03f096ec24bcae Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 25 Mar 2019 18:18:33 +0100
> >  Subject: [PATCH] mesonbuild/environment.py: do not determine whether a
> build
> > @@ -14,14 +14,14 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index d4f0630..c584fa4 100644
> > +index 84a7596..9a029f4 100644
> >  --- a/mesonbuild/environment.py
> >  +++ b/mesonbuild/environment.py
> > -@@ -483,7 +483,7 @@ class Environment:
> > +@@ -520,7 +520,7 @@ class Environment:
> >           self.first_invocation = True
> >
> > -     def is_cross_build(self):
> > --        return self.coredata.cross_file is not None
> > +     def is_cross_build(self) -> bool:
> > +-        return not
> self.machines.matches_build_machine(MachineChoice.HOST)
> >  +        return self.need_exe_wrapper()
> >
> >       def dump_coredata(self):
> > diff --git
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > index e47e555324f..8ad86a46e99 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > @@ -1,4 +1,4 @@
> > -From 2164655328ec4e47335fc9033813274365491ad8 Mon Sep 17 00:00:00 2001
> > +From 3009a1c2f1b736b836a057d84dc11f379cba99cf Mon Sep 17 00:00:00 2001
> >  From: Peter Kjellerstedt <pkj@axis.com>
> >  Date: Thu, 26 Jul 2018 16:32:49 +0200
> >  Subject: [PATCH] Support building allarch recipes again
> > @@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index 3f0a399..4509e09 100644
> > +index 86b350b..aa426ca 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> > -@@ -34,6 +34,7 @@ from . import mlog
> > +@@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
> >
> >
> >   known_cpu_families = (
> > diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > index 2b22531dd0c..57de598d2f1 100644
> > --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > @@ -1,4 +1,4 @@
> > -From e762d85c823adfefc27ba6128c7b997aa50166ce Mon Sep 17 00:00:00 2001
> > +From ac38495de38a1ea42e2bc09a2f23c2e945fbc22d Mon Sep 17 00:00:00 2001
> >  From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> >  Date: Wed, 15 Nov 2017 15:05:01 +0100
> >  Subject: [PATCH] native_bindir
> > @@ -22,19 +22,19 @@ Signed-off-by: Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com>
> >   2 files changed, 14 insertions(+), 11 deletions(-)
> >
> >  diff --git a/mesonbuild/dependencies/base.py
> b/mesonbuild/dependencies/base.py
> > -index 6d3678f..90fdb80 100644
> > +index 21da8e2..7d1ef85 100644
> >  --- a/mesonbuild/dependencies/base.py
> >  +++ b/mesonbuild/dependencies/base.py
> > -@@ -146,7 +146,7 @@ class Dependency:
> > -     def need_threads(self):
> > -         return False
> > +@@ -155,7 +155,7 @@ class Dependency:
> > +     def get_exe_args(self, compiler):
> > +         return []
> >
> >  -    def get_pkgconfig_variable(self, variable_name, kwargs):
> >  +    def get_pkgconfig_variable(self, variable_name, kwargs,
> use_native=False):
> >           raise DependencyException('{!r} is not a pkgconfig
> dependency'.format(self.name))
> >
> >       def get_configtool_variable(self, variable_name):
> > -@@ -183,7 +183,7 @@ class InternalDependency(Dependency):
> > +@@ -214,7 +214,7 @@ class InternalDependency(Dependency):
> >           self.sources = sources
> >           self.ext_deps = ext_deps
> >
> > @@ -43,7 +43,7 @@ index 6d3678f..90fdb80 100644
> >           raise DependencyException('Method "get_pkgconfig_variable()"
> is '
> >                                     'invalid for an internal dependency')
> >
> > -@@ -523,15 +523,18 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -639,15 +639,18 @@ class PkgConfigDependency(ExternalDependency):
> >           return s.format(self.__class__.__name__, self.name,
> self.is_found,
> >                           self.version_reqs)
> >
> > @@ -62,10 +62,10 @@ index 6d3678f..90fdb80 100644
> >
> >  -    def _call_pkgbin(self, args, env=None):
> >  +    def _call_pkgbin(self, args, env=None, use_native=False):
> > +         # Always copy the environment since we're going to modify it
> > +         # with pkg-config variables
> >           if env is None:
> > -             fenv = env
> > -             env = os.environ
> > -@@ -540,7 +543,7 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -663,7 +666,7 @@ class PkgConfigDependency(ExternalDependency):
> >           targs = tuple(args)
> >           cache = PkgConfigDependency.pkgbin_cache
> >           if (self.pkgbin, targs, fenv) not in cache:
> > @@ -74,7 +74,7 @@ index 6d3678f..90fdb80 100644
> >           return cache[(self.pkgbin, targs, fenv)]
> >
> >       def _convert_mingw_paths(self, args):
> > -@@ -718,7 +721,7 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -845,7 +848,7 @@ class PkgConfigDependency(ExternalDependency):
> >                                         (self.name, out_raw))
> >           self.link_args, self.raw_link_args = self._search_libs(out,
> out_raw)
> >
> > @@ -83,7 +83,7 @@ index 6d3678f..90fdb80 100644
> >           options = ['--variable=' + variable_name, self.name]
> >
> >           if 'define_variable' in kwargs:
> > -@@ -731,7 +734,7 @@ class PkgConfigDependency(ExternalDependency):
> > +@@ -858,7 +861,7 @@ class PkgConfigDependency(ExternalDependency):
> >
> >               options = ['--define-variable=' + '='.join(definition)] +
> options
> >
> > @@ -93,10 +93,10 @@ index 6d3678f..90fdb80 100644
> >           if ret != 0:
> >               if self.required:
> >  diff --git a/mesonbuild/dependencies/ui.py
> b/mesonbuild/dependencies/ui.py
> > -index 197d22c..c683d21 100644
> > +index 6d784e6..73a9e13 100644
> >  --- a/mesonbuild/dependencies/ui.py
> >  +++ b/mesonbuild/dependencies/ui.py
> > -@@ -285,7 +285,7 @@ class QtBaseDependency(ExternalDependency):
> > +@@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
> >           self.bindir = self.get_pkgconfig_host_bins(core)
> >           if not self.bindir:
> >               # If exec_prefix is not defined, the pkg-config file is
> broken
> > @@ -105,7 +105,7 @@ index 197d22c..c683d21 100644
> >               if prefix:
> >                   self.bindir = os.path.join(prefix, 'bin')
> >
> > -@@ -427,7 +427,7 @@ class Qt4Dependency(QtBaseDependency):
> > +@@ -507,7 +507,7 @@ class Qt4Dependency(QtBaseDependency):
> >           applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
> >           for application in applications:
> >               try:
> > @@ -114,7 +114,7 @@ index 197d22c..c683d21 100644
> >               except MesonException:
> >                   pass
> >
> > -@@ -437,7 +437,7 @@ class Qt5Dependency(QtBaseDependency):
> > +@@ -517,7 +517,7 @@ class Qt5Dependency(QtBaseDependency):
> >           QtBaseDependency.__init__(self, 'qt5', env, kwargs)
> >
> >       def get_pkgconfig_host_bins(self, core):
> > diff --git
> a/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
> b/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
> > deleted file mode 100644
> > index 6c2949c0e8b..00000000000
> > ---
> a/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
> > +++ /dev/null
> > @@ -1,185 +0,0 @@
> > -From 07ae4f949b8402cff178dd12c210d9a726ffe2da Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Mon, 18 Mar 2019 17:27:57 +0000
> > -Subject: [PATCH] mesonbuild: allow multiple --cross-file options
> > -
> > -Just like --native-file, allow multiple --cross-file options.  This is
> mostly
> > -unifying the logic between cross_files and config_files.
> > -
> > -Upstream-Status: Backport [will be in 0.50.1]
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > ----
> > - .../markdown/snippets/multiple-cross-files.md |  3 ++
> > - mesonbuild/backend/backends.py                |  3 +-
> > - mesonbuild/coredata.py                        | 52 +++----------------
> > - mesonbuild/environment.py                     |  5 +-
> > - mesonbuild/msetup.py                          |  4 +-
> > - mesonbuild/munstable_coredata.py              |  5 +-
> > - 6 files changed, 20 insertions(+), 52 deletions(-)
> > - create mode 100644 docs/markdown/snippets/multiple-cross-files.md
> > -
> > -diff --git a/docs/markdown/snippets/multiple-cross-files.md
> b/docs/markdown/snippets/multiple-cross-files.md
> > -new file mode 100644
> > -index 0000000..de229be
> > ---- /dev/null
> > -+++ b/docs/markdown/snippets/multiple-cross-files.md
> > -@@ -0,0 +1,3 @@
> > -+## Multipe cross files can be specified
> > -+
> > -+`--cross-file` can be passed multiple times, with the configuration
> files overlaying the same way as `--native-file`.
> > -diff --git a/mesonbuild/backend/backends.py
> b/mesonbuild/backend/backends.py
> > -index 4d35d22..5b270d3 100644
> > ---- a/mesonbuild/backend/backends.py
> > -+++ b/mesonbuild/backend/backends.py
> > -@@ -788,8 +788,7 @@ class Backend:
> > -         deps = [os.path.join(self.build_to_src, df)
> > -                 for df in self.interpreter.get_build_def_files()]
> > -         if self.environment.is_cross_build():
> > --            deps.append(os.path.join(self.build_to_src,
> > --
>  self.environment.coredata.cross_file))
> > -+            deps.extend(self.environment.coredata.cross_files)
> > -         deps.append('meson-private/coredata.dat')
> > -         if
> os.path.exists(os.path.join(self.environment.get_source_dir(),
> 'meson_options.txt')):
> > -             deps.append(os.path.join(self.build_to_src,
> 'meson_options.txt'))
> > -diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
> > -index 066ad30..d80e9a0 100644
> > ---- a/mesonbuild/coredata.py
> > -+++ b/mesonbuild/coredata.py
> > -@@ -265,7 +265,7 @@ class CoreData:
> > -         self.compiler_options = PerMachine({}, {}, {})
> > -         self.base_options = {}
> > -         self.external_preprocess_args = PerMachine({}, {}, {}) #
> CPPFLAGS only
> > --        self.cross_file = self.__load_cross_file(options.cross_file)
> > -+        self.cross_files = self.__load_config_files(options.cross_file)
> > -         self.compilers = OrderedDict()
> > -         self.cross_compilers = OrderedDict()
> > -         self.deps = OrderedDict()
> > -@@ -276,57 +276,19 @@ class CoreData:
> > -
> > -     @staticmethod
> > -     def __load_config_files(filenames):
> > -+        # Need to try and make the passed filenames absolute because
> when the
> > -+        # files are parsed later we'll have chdir()d.
> > -         if not filenames:
> > -             return []
> > -         filenames =
> [os.path.abspath(os.path.expanduser(os.path.expanduser(f)))
> > -                      for f in filenames]
> > -         return filenames
> > -
> > --    @staticmethod
> > --    def __load_cross_file(filename):
> > --        """Try to load the cross file.
> > --
> > --        If the filename is None return None. If the filename is an
> absolute
> > --        (after resolving variables and ~), return that absolute path.
> Next,
> > --        check if the file is relative to the current source dir. If
> the path
> > --        still isn't resolved do the following:
> > --            Windows:
> > --                - Error
> > --            *:
> > --                - $XDG_DATA_HOME/meson/cross (or
> ~/.local/share/meson/cross if
> > --                  undefined)
> > --                - $XDG_DATA_DIRS/meson/cross (or
> > --                  /usr/local/share/meson/cross:/usr/share/meson/cross
> if undefined)
> > --                - Error
> > --
> > --        Non-Windows follows the Linux path and will honor XDG_* if
> set. This
> > --        simplifies the implementation somewhat.
> > --        """
> > --        if filename is None:
> > --            return None
> > --        filename = os.path.expanduser(os.path.expandvars(filename))
> > --        if os.path.isabs(filename):
> > --            return filename
> > --        path_to_try = os.path.abspath(filename)
> > --        if os.path.isfile(path_to_try):
> > --            return path_to_try
> > --        if sys.platform != 'win32':
> > --            paths = [
> > --                os.environ.get('XDG_DATA_HOME',
> os.path.expanduser('~/.local/share')),
> > --            ] + os.environ.get('XDG_DATA_DIRS',
> '/usr/local/share:/usr/share').split(':')
> > --            for path in paths:
> > --                path_to_try = os.path.join(path, 'meson', 'cross',
> filename)
> > --                if os.path.isfile(path_to_try):
> > --                    return path_to_try
> > --            raise MesonException('Cannot find specified cross file: '
> + filename)
> > --
> > --        raise MesonException('Cannot find specified cross file: ' +
> filename)
> > --
> > -     def libdir_cross_fixup(self):
> > -         # By default set libdir to "lib" when cross compiling since
> > -         # getting the "system default" is always wrong on multiarch
> > -         # platforms as it gets a value like lib/x86_64-linux-gnu.
> > --        if self.cross_file is not None:
> > -+        if self.cross_files:
> > -             self.builtins['libdir'].value = 'lib'
> > -
> > -     def sanitize_prefix(self, prefix):
> > -@@ -642,8 +604,8 @@ def read_cmd_line_file(build_dir, options):
> > -     options.cmd_line_options = d
> > -
> > -     properties = config['properties']
> > --    if options.cross_file is None:
> > --        options.cross_file = properties.get('cross_file', None)
> > -+    if not options.cross_file:
> > -+        options.cross_file =
> ast.literal_eval(properties.get('cross_file', '[]'))
> > -     if not options.native_file:
> > -         # This will be a string in the form: "['first', 'second',
> ...]", use
> > -         # literal_eval to get it into the list of strings.
> > -@@ -654,7 +616,7 @@ def write_cmd_line_file(build_dir, options):
> > -     config = CmdLineFileParser()
> > -
> > -     properties = {}
> > --    if options.cross_file is not None:
> > -+    if options.cross_file:
> > -         properties['cross_file'] = options.cross_file
> > -     if options.native_file:
> > -         properties['native_file'] = options.native_file
> > -diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index c25ef33..4c1c5ac 100644
> > ---- a/mesonbuild/environment.py
> > -+++ b/mesonbuild/environment.py
> > -@@ -394,8 +394,9 @@ class Environment:
> > -             self.binaries.build = BinaryTable(config.get('binaries',
> {}))
> > -             self.paths.build = Directories(**config.get('paths', {}))
> > -
> > --        if self.coredata.cross_file is not None:
> > --            config =
> MesonConfigFile.parse_datafile(self.coredata.cross_file)
> > -+        if self.coredata.cross_files:
> > -+            config = MesonConfigFile.from_config_parser(
> > -+                coredata.load_configs(self.coredata.cross_files,
> 'cross'))
> > -             self.properties.host = Properties(config.get('properties',
> {}), False)
> > -             self.binaries.host = BinaryTable(config.get('binaries',
> {}), False)
> > -             if 'host_machine' in config:
> > -diff --git a/mesonbuild/msetup.py b/mesonbuild/msetup.py
> > -index 023afdb..6e8ca83 100644
> > ---- a/mesonbuild/msetup.py
> > -+++ b/mesonbuild/msetup.py
> > -@@ -29,7 +29,9 @@ from .mesonlib import MesonException
> > -
> > - def add_arguments(parser):
> > -     coredata.register_builtin_arguments(parser)
> > --    parser.add_argument('--cross-file', default=None,
> > -+    parser.add_argument('--cross-file',
> > -+                        default=[],
> > -+                        action='append',
> > -                         help='File describing cross compilation
> environment.')
> > -     parser.add_argument('--native-file',
> > -                         default=[],
> > -diff --git a/mesonbuild/munstable_coredata.py
> b/mesonbuild/munstable_coredata.py
> > -index 78f3f34..913f942 100644
> > ---- a/mesonbuild/munstable_coredata.py
> > -+++ b/mesonbuild/munstable_coredata.py
> > -@@ -81,8 +81,9 @@ def run(options):
> > -             print('Last seen PKGCONFIG enviroment variable value: ' +
> v)
> > -         elif k == 'version':
> > -             print('Meson version: ' + v)
> > --        elif k == 'cross_file':
> > --            print('Cross File: ' + (v or 'None'))
> > -+        elif k == 'cross_files':
> > -+            if v:
> > -+                print('Cross File: ' + ' '.join(v))
> > -         elif k == 'config_files':
> > -             if v:
> > -                 print('Native File: ' + ' '.join(v))
> > diff --git
> a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
> b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
> > deleted file mode 100644
> > index 2056763db5d..00000000000
> > ---
> a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -From d57dd1092e84e08ee15d7063b6c56bd6d864f2e1 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Mon, 18 Mar 2019 16:16:56 +0000
> > -Subject: [PATCH] load_configs: generalise the search path
> > -
> > -Instead of hard-coding the fact that load_configs() searches for files
> under
> > -meson/native, pass in the subdirectory allowing the cross-file code to
> use the
> > -same logic.
> > -
> > -Upstream-Status: Backport
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - mesonbuild/coredata.py    | 6 +++---
> > - mesonbuild/environment.py | 2 +-
> > - 2 files changed, 4 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
> > -index fba90fa369..6e60917d10 100644
> > ---- a/mesonbuild/coredata.py
> > -+++ b/mesonbuild/coredata.py
> > -@@ -211,8 +211,8 @@ def is_auto(self):
> > -         return self.value == 'auto'
> > -
> > -
> > --def load_configs(filenames):
> > --    """Load native files."""
> > -+def load_configs(filenames, subdir):
> > -+    """Load configuration files from a named subdirectory."""
> > -     def gen():
> > -         for f in filenames:
> > -             f = os.path.expanduser(os.path.expandvars(f))
> > -@@ -225,7 +225,7 @@ def gen():
> > -                     os.environ.get('XDG_DATA_HOME',
> os.path.expanduser('~/.local/share')),
> > -                 ] + os.environ.get('XDG_DATA_DIRS',
> '/usr/local/share:/usr/share').split(':')
> > -                 for path in paths:
> > --                    path_to_try = os.path.join(path, 'meson',
> 'native', f)
> > -+                    path_to_try = os.path.join(path, 'meson', subdir,
> f)
> > -                     if os.path.isfile(path_to_try):
> > -                         yield path_to_try
> > -                         break
> > -diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index 58adb06960..92a00dd7bf 100644
> > ---- a/mesonbuild/environment.py
> > -+++ b/mesonbuild/environment.py
> > -@@ -408,7 +408,7 @@ def __init__(self, source_dir, build_dir, options):
> > -
> > -         if self.coredata.config_files is not None:
> > -             config = MesonConfigFile.from_config_parser(
> > --                coredata.load_configs(self.coredata.config_files))
> > -+                coredata.load_configs(self.coredata.config_files,
> 'native'))
> > -             self.binaries.build = BinaryTable(config.get('binaries',
> {}))
> > -             self.paths.build = Directories(**config.get('paths', {}))
> > -
> > diff --git a/meta/recipes-devtools/meson/meson_0.50.1.bb
> b/meta/recipes-devtools/meson/meson_0.51.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/meson_0.50.1.bb
> > rename to meta/recipes-devtools/meson/meson_0.51.1.bb
> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.51.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
> > rename to meta/recipes-devtools/meson/nativesdk-meson_0.51.1.bb
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008ce244058f246d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I have just sent a patch that fixes the error=
.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 1 Aug 2019 at 16:33, Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Alexander<br>
<br>
Either this or the next patch in this series seems to be causing<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/256700/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/256700/</a><br>
<br>
On Tue, Jul 30, 2019 at 8:55 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop backports.<br>
&gt;<br>
&gt; Rebase other patches.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../0001-Make-CPU-family-warnings-fatal.patch |=C2=A0 10 +-<br>
&gt;=C2=A0 ...etect-windows-also-if-the-system-str.patch |=C2=A0 14 +-<br>
&gt;=C2=A0 ...onment.py-check-environment-for-vari.patch |=C2=A0 20 +-<br>
&gt;=C2=A0 ...onment.py-do-not-determine-whether-a.patch |=C2=A0 10 +-<br>
&gt;=C2=A0 ...pport-building-allarch-recipes-again.patch |=C2=A0 =C2=A06 +-=
<br>
&gt;=C2=A0 .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 +--<br>
&gt;=C2=A0 ...ld-allow-multiple-cross-file-options.patch | 185 ------------=
------<br>
&gt;=C2=A0 .../load-configs-generalise-search-path.patch |=C2=A0 53 -----<b=
r>
&gt;=C2=A0 .../{<a href=3D"http://meson_0.50.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">meson_0.50.1.bb</a> =3D&gt; <a href=3D"http://meson_0.51.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">meson_0.51.1.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://on_0.50.1.bb" rel=3D"noreferrer" target=3D"=
_blank">on_0.50.1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.51.1.b=
b" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.51.1.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 11 files changed, 49 insertions(+), 287 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/0007-mesonb=
uild-allow-multiple-cross-file-options.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/load-config=
s-generalise-search-path.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.50=
.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.50.1.bb</a> =3D&gt; <a =
href=3D"http://meson_0.51.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_=
0.51.1.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativesdk-=
meson_0.50.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.50.=
1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.51.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nativesdk-meson_0.51.1.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devt=
ools/meson/meson.inc<br>
&gt; index 6a723683cc0..b9a05967f46 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; @@ -11,15 +11,13 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/me=
sonbuild/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${P=
V}/meson-${P</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python-modu=
le-do-not-manipulate-the-environment-when.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-rpath-ha=
ndling.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-prop-defau=
lt.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://load-configs-generali=
se-search-path.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-mesonbuild-allow=
-multiple-cross-file-options.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-environment=
.py-detect-windows-also-if-the-system-str.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mesonbuild-=
environment.py-do-not-determine-whether-a.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mesonbuild-=
environment.py-check-environment-for-vari.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-modules-pyt=
hon.py-do-not-substitute-python-s-install.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f68f56d60c80a77df8fc08fa1016bc5831605d47=
17b622c96212573271e14ecc&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;24a6527796115828d2ebc75880e18d62&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f27b7a60f339ba66fe4b8f81f0d1072e090a08ea=
bbd6aa287683b2c2b9dd2d82&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;48787e391ec5c052799a3dd491f73909&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Make-CPU-family-warnings-fatal.patch \=
<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-wa=
rnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family=
-warnings-fatal.patch<br>
&gt; index adde1e271f1..444fc081686 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
fatal.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
fatal.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 4b4b3d4932d928f05dbd74d730a3c8a5ac371e1d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f70fee13e4dbc757cd8153cd42d92fa9394fb542 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 3 Jul 2018 13:59:09 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Make CPU family warnings fatal<br>
&gt; @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton &lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<b=
r>
&gt; -index 5309ef4..3f0a399 100644<br>
&gt; +index 03c6346..86b350b 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -178,7 +178,7 @@ class MachineInfo:<br>
&gt; +@@ -186,7 +186,7 @@ class MachineInfo:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_family =3D literal[&#39;cp=
u_family&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cpu_family not in known_cpu=
_families:<br>
&gt; @@ -25,10 +25,10 @@ index 5309ef4..3f0a399 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endian =3D literal[&#39;endian=
&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if endian not in (&#39;little&=
#39;, &#39;big&#39;):<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.=
py<br>
&gt; -index 3031a82..ecd18d0 100644<br>
&gt; +index 0cfdf9c..40aa189 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -242,9 +242,7 @@ def detect_cpu_family(compilers):<br>
&gt; +@@ -262,9 +262,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trial =3D &#39;parisc&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if trial not in known_cpu_families:<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-environment.py-det=
ect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meso=
n/0001-environment.py-detect-windows-also-if-the-system-str.patch<br>
&gt; index f6043190af0..37b5356d77a 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-win=
dows-also-if-the-system-str.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-win=
dows-also-if-the-system-str.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 63b78b7990c5d60f7bc674a26f655caa0bec3c49 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b52e47c9d61dc4c930cfc7236fbeb70338c3b953 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 25 Mar 2019 17:17:06 +0100<br>
&gt;=C2=A0 Subject: [PATCH] environment.py: detect windows also if the syst=
em string<br>
&gt; @@ -6,20 +6,24 @@ Subject: [PATCH] environment.py: detect windows also=
 if the system string<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/envconfig.py | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<b=
r>
&gt; -index f2510c1..5309ef4 100644<br>
&gt; +index 03c6346..a59cd89 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -194,7 +194,7 @@ class MachineInfo:<br>
&gt; +@@ -198,7 +198,7 @@ class MachineInfo:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machine is windows?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.system =3D=3D &#39;windows&#=
39;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.system in {&#39;windows&#39;=
, &#39;mingw&#39;}<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.system =3D=3D &#39;wind=
ows&#39; or &#39;mingw&#39; in self.system<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def is_cygwin(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def is_cygwin(self) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environ=
ment.py-check-environment-for-vari.patch b/meta/recipes-devtools/meson/meso=
n/0001-mesonbuild-environment.py-check-environment-for-vari.patch<br>
&gt; index fadb2734f4b..f4456235fe7 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py=
-check-environment-for-vari.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py=
-check-environment-for-vari.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 63e79329b5dd00882f0cea56a6d907a831b94171 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From a72dc2b1cddcf180ce782860896deae0b12d5000 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 25 Mar 2019 18:52:48 +0100<br>
&gt;=C2=A0 Subject: [PATCH] mesonbuild/environment.py: check environment fo=
r various<br>
&gt; @@ -6,23 +6,21 @@ Subject: [PATCH] mesonbuild/environment.py: check en=
vironment for various<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/environment.py | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.=
py<br>
&gt; -index 6e5d689..bbfd87d 100644<br>
&gt; +index 9a029f4..0cfdf9c 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -398,7 +398,7 @@ class Environment:<br>
&gt; +@@ -448,7 +448,7 @@ class Environment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D Meson=
ConfigFile.from_config_parser(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coredat=
a.load_configs(self.coredata.cross_files, &#39;cross&#39;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.properties.host =
=3D Properties(config.get(&#39;properties&#39;, {}), False)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.binaries.host =3D Bin=
aryTable(config.get(&#39;binaries&#39;, {}), False)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.binaries.host =3D Bin=
aryTable(config.get(&#39;binaries&#39;, {}), True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coredat=
a.load_configs(self.coredata.cross_files))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0properties.host =3D P=
roperties(config.get(&#39;properties&#39;, {}), False)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 binaries.host =3D BinaryTa=
ble(config.get(&#39;binaries&#39;, {}), False)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 binaries.host =3D BinaryTa=
ble(config.get(&#39;binaries&#39;, {}), True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;host_mac=
hine&#39; in config:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ma=
chines.host =3D MachineInfo.from_literal(config[&#39;host_machine&#39;])<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine=
s.host =3D MachineInfo.from_literal(config[&#39;host_machine&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;target_m=
achine&#39; in config:<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environ=
ment.py-do-not-determine-whether-a.patch b/meta/recipes-devtools/meson/meso=
n/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch<br>
&gt; index 83347145417..8cb11879f4d 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py=
-do-not-determine-whether-a.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py=
-do-not-determine-whether-a.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From d9da5e7a16a9397e22a8900fac4b60b40d7f00de Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ec9c4a22424a5d55fcf213a55d03f096ec24bcae Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 25 Mar 2019 18:18:33 +0100<br>
&gt;=C2=A0 Subject: [PATCH] mesonbuild/environment.py: do not determine whe=
ther a build<br>
&gt; @@ -14,14 +14,14 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.=
py<br>
&gt; -index d4f0630..c584fa4 100644<br>
&gt; +index 84a7596..9a029f4 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -483,7 +483,7 @@ class Environment:<br>
&gt; +@@ -520,7 +520,7 @@ class Environment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.first_invocation =3D True=
<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def is_cross_build(self):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.coredata.cross_file is not N=
one<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def is_cross_build(self) -&gt; bool:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return not self.machines.matches_build_m=
achine(MachineChoice.HOST)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.need_exe_wrapper()<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def dump_coredata(self):<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-a=
llarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support=
-building-allarch-recipes-again.patch<br>
&gt; index e47e555324f..8ad86a46e99 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-=
recipes-again.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-=
recipes-again.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2164655328ec4e47335fc9033813274365491ad8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 3009a1c2f1b736b836a057d84dc11f379cba99cf Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" tar=
get=3D"_blank">pkj@axis.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Support building allarch recipes again<br>
&gt; @@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"m=
ailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axi=
s.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<b=
r>
&gt; -index 3f0a399..4509e09 100644<br>
&gt; +index 86b350b..aa426ca 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -34,6 +34,7 @@ from . import mlog<br>
&gt; +@@ -36,6 +36,7 @@ _T =3D typing.TypeVar(&#39;_T&#39;)<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0known_cpu_families =3D (<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patc=
h b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; index 2b22531dd0c..57de598d2f1 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e762d85c823adfefc27ba6128c7b997aa50166ce Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ac38495de38a1ea42e2bc09a2f23c2e945fbc22d Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.riba=
lda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt;=C2=A0 Subject: [PATCH] native_bindir<br>
&gt; @@ -22,19 +22,19 @@ Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=
=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gma=
il.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 14 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/depend=
encies/base.py<br>
&gt; -index 6d3678f..90fdb80 100644<br>
&gt; +index 21da8e2..7d1ef85 100644<br>
&gt;=C2=A0 --- a/mesonbuild/dependencies/base.py<br>
&gt;=C2=A0 +++ b/mesonbuild/dependencies/base.py<br>
&gt; -@@ -146,7 +146,7 @@ class Dependency:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def need_threads(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
&gt; +@@ -155,7 +155,7 @@ class Dependency:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def get_exe_args(self, compiler):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name, k=
wargs):<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name, k=
wargs, use_native=3DFalse):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#39=
;{!r} is not a pkgconfig dependency&#39;.format(<a href=3D"http://self.name=
" rel=3D"noreferrer" target=3D"_blank">self.name</a>))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get_configtool_variable(self, variable_n=
ame):<br>
&gt; -@@ -183,7 +183,7 @@ class InternalDependency(Dependency):<br>
&gt; +@@ -214,7 +214,7 @@ class InternalDependency(Dependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sources =3D sources<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ext_deps =3D ext_deps<br>
&gt;<br>
&gt; @@ -43,7 +43,7 @@ index 6d3678f..90fdb80 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#39=
;Method &quot;get_pkgconfig_variable()&quot; is &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;invalid =
for an internal dependency&#39;)<br>
&gt;<br>
&gt; -@@ -523,15 +523,18 @@ class PkgConfigDependency(ExternalDependency):<=
br>
&gt; +@@ -639,15 +639,18 @@ class PkgConfigDependency(ExternalDependency):<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s.format(self.__class__=
.__name__, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank=
">self.name</a>, self.is_found,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0self.version_reqs)<br>
&gt;<br>
&gt; @@ -62,10 +62,10 @@ index 6d3678f..90fdb80 100644<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone):<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone, use_nati=
ve=3DFalse):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Always copy the environment since=
 we&#39;re going to modify it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# with pkg-config variables<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if env is None:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fenv =3D env<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D os.environ<br=
>
&gt; -@@ -540,7 +543,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; +@@ -663,7 +666,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targs =3D tuple(args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache =3D PkgConfigDependency.=
pkgbin_cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self.pkgbin, targs, fenv) =
not in cache:<br>
&gt; @@ -74,7 +74,7 @@ index 6d3678f..90fdb80 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cache[(self.pkgbin, tar=
gs, fenv)]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args):<br>
&gt; -@@ -718,7 +721,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; +@@ -845,7 +848,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(<a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.=
name</a>, out_raw))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args, self.raw_link_=
args =3D self._search_libs(out, out_raw)<br>
&gt;<br>
&gt; @@ -83,7 +83,7 @@ index 6d3678f..90fdb80 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#39;--variable=
=3D&#39; + variable_name, <a href=3D"http://self.name" rel=3D"noreferrer" t=
arget=3D"_blank">self.name</a>]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;define_variable&#39; i=
n kwargs:<br>
&gt; -@@ -731,7 +734,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; +@@ -858,7 +861,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#3=
9;--define-variable=3D&#39; + &#39;=3D&#39;.join(definition)] + options<br>
&gt;<br>
&gt; @@ -93,10 +93,10 @@ index 6d3678f..90fdb80 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.required=
:<br>
&gt;=C2=A0 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependen=
cies/ui.py<br>
&gt; -index 197d22c..c683d21 100644<br>
&gt; +index 6d784e6..73a9e13 100644<br>
&gt;=C2=A0 --- a/mesonbuild/dependencies/ui.py<br>
&gt;=C2=A0 +++ b/mesonbuild/dependencies/ui.py<br>
&gt; -@@ -285,7 +285,7 @@ class QtBaseDependency(ExternalDependency):<br>
&gt; +@@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bindir =3D self.get_pkgco=
nfig_host_bins(core)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.bindir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If exec_prefix=
 is not defined, the pkg-config file is broken<br>
&gt; @@ -105,7 +105,7 @@ index 197d22c..c683d21 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if prefix:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
lf.bindir =3D os.path.join(prefix, &#39;bin&#39;)<br>
&gt;<br>
&gt; -@@ -427,7 +427,7 @@ class Qt4Dependency(QtBaseDependency):<br>
&gt; +@@ -507,7 +507,7 @@ class Qt4Dependency(QtBaseDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0applications =3D [&#39;moc&#39=
;, &#39;uic&#39;, &#39;rcc&#39;, &#39;lupdate&#39;, &#39;lrelease&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for application in application=
s:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; @@ -114,7 +114,7 @@ index 197d22c..c683d21 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except MesonExce=
ption:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pa=
ss<br>
&gt;<br>
&gt; -@@ -437,7 +437,7 @@ class Qt5Dependency(QtBaseDependency):<br>
&gt; +@@ -517,7 +517,7 @@ class Qt5Dependency(QtBaseDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QtBaseDependency.__init__(self=
, &#39;qt5&#39;, env, kwargs)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get_pkgconfig_host_bins(self, core):<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-m=
ultiple-cross-file-options.patch b/meta/recipes-devtools/meson/meson/0007-m=
esonbuild-allow-multiple-cross-file-options.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 6c2949c0e8b..00000000000<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple=
-cross-file-options.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,185 +0,0 @@<br>
&gt; -From 07ae4f949b8402cff178dd12c210d9a726ffe2da Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Mon, 18 Mar 2019 17:27:57 +0000<br>
&gt; -Subject: [PATCH] mesonbuild: allow multiple --cross-file options<br>
&gt; -<br>
&gt; -Just like --native-file, allow multiple --cross-file options.=C2=A0 T=
his is mostly<br>
&gt; -unifying the logic between cross_files and config_files.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [will be in 0.50.1]<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - .../markdown/snippets/multiple-cross-files.md |=C2=A0 3 ++<br>
&gt; - mesonbuild/backend/backends.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; - mesonbuild/coredata.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 52 +++----------------<br>
&gt; - mesonbuild/environment.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
&gt; - mesonbuild/msetup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; - mesonbuild/munstable_coredata.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; - 6 files changed, 20 insertions(+), 52 deletions(-)<br>
&gt; - create mode 100644 docs/markdown/snippets/multiple-cross-files.md<br=
>
&gt; -<br>
&gt; -diff --git a/docs/markdown/snippets/multiple-cross-files.md b/docs/ma=
rkdown/snippets/multiple-cross-files.md<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000..de229be<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/docs/markdown/snippets/multiple-cross-files.md<br>
&gt; -@@ -0,0 +1,3 @@<br>
&gt; -+## Multipe cross files can be specified<br>
&gt; -+<br>
&gt; -+`--cross-file` can be passed multiple times, with the configuration =
files overlaying the same way as `--native-file`.<br>
&gt; -diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/back=
ends.py<br>
&gt; -index 4d35d22..5b270d3 100644<br>
&gt; ---- a/mesonbuild/backend/backends.py<br>
&gt; -+++ b/mesonbuild/backend/backends.py<br>
&gt; -@@ -788,8 +788,7 @@ class Backend:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D [os.path.join(self.build_t=
o_src, df)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for df =
in self.interpreter.get_build_def_files()]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.environment.is_cross_build(=
):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.append(os.path.join(s=
elf.build_to_src,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.envi=
ronment.coredata.cross_file))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.extend(self.environme=
nt.coredata.cross_files)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps.append(&#39;meson-private/core=
data.dat&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.join(self=
.environment.get_source_dir(), &#39;meson_options.txt&#39;)):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps.append(os.path.j=
oin(self.build_to_src, &#39;meson_options.txt&#39;))<br>
&gt; -diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py<br>
&gt; -index 066ad30..d80e9a0 100644<br>
&gt; ---- a/mesonbuild/coredata.py<br>
&gt; -+++ b/mesonbuild/coredata.py<br>
&gt; -@@ -265,7 +265,7 @@ class CoreData:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.compiler_options =3D PerMachin=
e({}, {}, {})<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.base_options =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.external_preprocess_args =3D P=
erMachine({}, {}, {}) # CPPFLAGS only<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cross_file =3D self.__load_cross_fi=
le(options.cross_file)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cross_files =3D self.__load_config_=
files(options.cross_file)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.compilers =3D OrderedDict()<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cross_compilers =3D OrderedDic=
t()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.deps =3D OrderedDict()<br>
&gt; -@@ -276,57 +276,19 @@ class CoreData:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@staticmethod<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def __load_config_files(filenames):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Need to try and make the passed filena=
mes absolute because when the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # files are parsed later we&#39;ll have =
chdir()d.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not filenames:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filenames =3D [os.path.abspath(os.p=
ath.expanduser(os.path.expanduser(f)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 for f in filenames]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return filenames<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 @staticmethod<br>
&gt; --=C2=A0 =C2=A0 def __load_cross_file(filename):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Try to load the cross =
file.<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 If the filename is None return None. If =
the filename is an absolute<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 (after resolving variables and ~), retur=
n that absolute path. Next,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 check if the file is relative to the cur=
rent source dir. If the path<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 still isn&#39;t resolved do the followin=
g:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Windows:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Error<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - $XDG_DATA_=
HOME/meson/cross (or ~/.local/share/meson/cross if<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undef=
ined)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - $XDG_DATA_=
DIRS/meson/cross (or<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/=
local/share/meson/cross:/usr/share/meson/cross if undefined)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Error<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 Non-Windows follows the Linux path and w=
ill honor XDG_* if set. This<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 simplifies the implementation somewhat.<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if filename is None:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D os.path.expanduser(os.path.=
expandvars(filename))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isabs(filename):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return filename<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 path_to_try =3D os.path.abspath(filename=
)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(path_to_try):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return path_to_try<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sys.platform !=3D &#39;win32&#39;:<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paths =3D [<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ.g=
et(&#39;XDG_DATA_HOME&#39;, os.path.expanduser(&#39;~/.local/share&#39;)),<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] + os.environ.get(&#39;XD=
G_DATA_DIRS&#39;, &#39;/usr/local/share:/usr/share&#39;).split(&#39;:&#39;)=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in paths:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path_to_try =
=3D os.path.join(path, &#39;meson&#39;, &#39;cross&#39;, filename)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.i=
sfile(path_to_try):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return path_to_try<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MesonException(&#39;=
Cannot find specified cross file: &#39; + filename)<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MesonException(&#39;Cannot find sp=
ecified cross file: &#39; + filename)<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def libdir_cross_fixup(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# By default set libdir to &quot;li=
b&quot; when cross compiling since<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# getting the &quot;system default&=
quot; is always wrong on multiarch<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# platforms as it gets a value like=
 lib/x86_64-linux-gnu.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.cross_file is not None:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.cross_files:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.builtins[&#39;li=
bdir&#39;].value =3D &#39;lib&#39;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def sanitize_prefix(self, prefix):<br>
&gt; -@@ -642,8 +604,8 @@ def read_cmd_line_file(build_dir, options):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0options.cmd_line_options =3D d<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0properties =3D config[&#39;properties&#39;]<br>
&gt; --=C2=A0 =C2=A0 if options.cross_file is None:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 options.cross_file =3D properties.get(&#=
39;cross_file&#39;, None)<br>
&gt; -+=C2=A0 =C2=A0 if not options.cross_file:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 options.cross_file =3D ast.literal_eval(=
properties.get(&#39;cross_file&#39;, &#39;[]&#39;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if not options.native_file:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This will be a string in the form=
: &quot;[&#39;first&#39;, &#39;second&#39;, ...]&quot;, use<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# literal_eval to get it into the l=
ist of strings.<br>
&gt; -@@ -654,7 +616,7 @@ def write_cmd_line_file(build_dir, options):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0config =3D CmdLineFileParser()<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0properties =3D {}<br>
&gt; --=C2=A0 =C2=A0 if options.cross_file is not None:<br>
&gt; -+=C2=A0 =C2=A0 if options.cross_file:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0properties[&#39;cross_file&#39;] =
=3D options.cross_file<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if options.native_file:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0properties[&#39;native_file&#39;] =
=3D options.native_file<br>
&gt; -diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py<br=
>
&gt; -index c25ef33..4c1c5ac 100644<br>
&gt; ---- a/mesonbuild/environment.py<br>
&gt; -+++ b/mesonbuild/environment.py<br>
&gt; -@@ -394,8 +394,9 @@ class Environment:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.binaries.build =
=3D BinaryTable(config.get(&#39;binaries&#39;, {}))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.paths.build =3D =
Directories(**config.get(&#39;paths&#39;, {}))<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.coredata.cross_file is not None:=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D MesonConfigFile=
.parse_datafile(self.coredata.cross_file)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.coredata.cross_files:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D MesonConfigFile=
.from_config_parser(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coredata.loa=
d_configs(self.coredata.cross_files, &#39;cross&#39;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.properties.host =
=3D Properties(config.get(&#39;properties&#39;, {}), False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.binaries.host =
=3D BinaryTable(config.get(&#39;binaries&#39;, {}), False)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;host_machine&=
#39; in config:<br>
&gt; -diff --git a/mesonbuild/msetup.py b/mesonbuild/msetup.py<br>
&gt; -index 023afdb..6e8ca83 100644<br>
&gt; ---- a/mesonbuild/msetup.py<br>
&gt; -+++ b/mesonbuild/msetup.py<br>
&gt; -@@ -29,7 +29,9 @@ from .mesonlib import MesonException<br>
&gt; -<br>
&gt; - def add_arguments(parser):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0coredata.register_builtin_arguments(parser)<br>
&gt; --=C2=A0 =C2=A0 parser.add_argument(&#39;--cross-file&#39;, default=3D=
None,<br>
&gt; -+=C2=A0 =C2=A0 parser.add_argument(&#39;--cross-file&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 default=3D[],<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 action=3D&#39;append&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0help=3D&#39;File describing cross compilation environm=
ent.&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--native-file&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0default=3D[],<br>
&gt; -diff --git a/mesonbuild/munstable_coredata.py b/mesonbuild/munstable_=
coredata.py<br>
&gt; -index 78f3f34..913f942 100644<br>
&gt; ---- a/mesonbuild/munstable_coredata.py<br>
&gt; -+++ b/mesonbuild/munstable_coredata.py<br>
&gt; -@@ -81,8 +81,9 @@ def run(options):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;Last seen =
PKGCONFIG enviroment variable value: &#39; + v)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif k =3D=3D &#39;version&#39;:<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;Meson vers=
ion: &#39; + v)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif k =3D=3D &#39;cross_file&#39;:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Cross File: &#3=
9; + (v or &#39;None&#39;))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif k =3D=3D &#39;cross_files&#39;:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if v:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;C=
ross File: &#39; + &#39; &#39;.join(v))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif k =3D=3D &#39;config_files&#39=
;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if v:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&=
#39;Native File: &#39; + &#39; &#39;.join(v))<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/load-configs-generalise=
-search-path.patch b/meta/recipes-devtools/meson/meson/load-configs-general=
ise-search-path.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 2056763db5d..00000000000<br>
&gt; --- a/meta/recipes-devtools/meson/meson/load-configs-generalise-search=
-path.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,53 +0,0 @@<br>
&gt; -From d57dd1092e84e08ee15d7063b6c56bd6d864f2e1 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Mon, 18 Mar 2019 16:16:56 +0000<br>
&gt; -Subject: [PATCH] load_configs: generalise the search path<br>
&gt; -<br>
&gt; -Instead of hard-coding the fact that load_configs() searches for file=
s under<br>
&gt; -meson/native, pass in the subdirectory allowing the cross-file code t=
o use the<br>
&gt; -same logic.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - mesonbuild/coredata.py=C2=A0 =C2=A0 | 6 +++---<br>
&gt; - mesonbuild/environment.py | 2 +-<br>
&gt; - 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py<br>
&gt; -index fba90fa369..6e60917d10 100644<br>
&gt; ---- a/mesonbuild/coredata.py<br>
&gt; -+++ b/mesonbuild/coredata.py<br>
&gt; -@@ -211,8 +211,8 @@ def is_auto(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.value =3D=3D &#39;auto&=
#39;<br>
&gt; -<br>
&gt; -<br>
&gt; --def load_configs(filenames):<br>
&gt; --=C2=A0 =C2=A0 &quot;&quot;&quot;Load native files.&quot;&quot;&quot;=
<br>
&gt; -+def load_configs(filenames, subdir):<br>
&gt; -+=C2=A0 =C2=A0 &quot;&quot;&quot;Load configuration files from a name=
d subdirectory.&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def gen():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in filenames:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D os.path.expandu=
ser(os.path.expandvars(f))<br>
&gt; -@@ -225,7 +225,7 @@ def gen():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0os.environ.get(&#39;XDG_DATA_HOME&#39;, os.path.expanduser(&#39;~/.l=
ocal/share&#39;)),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] + os.=
environ.get(&#39;XDG_DATA_DIRS&#39;, &#39;/usr/local/share:/usr/share&#39;)=
.split(&#39;:&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pat=
h in paths:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 path_to_try =3D os.path.join(path, &#39;meson&#39;, &#39;native&#39;, f=
)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 path_to_try =3D os.path.join(path, &#39;meson&#39;, subdir, f)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if os.path.isfile(path_to_try):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0yield path_to_try<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0break<br>
&gt; -diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py<br=
>
&gt; -index 58adb06960..92a00dd7bf 100644<br>
&gt; ---- a/mesonbuild/environment.py<br>
&gt; -+++ b/mesonbuild/environment.py<br>
&gt; -@@ -408,7 +408,7 @@ def __init__(self, source_dir, build_dir, options=
):<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.coredata.config_files is no=
t None:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D MesonConfi=
gFile.from_config_parser(<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coredata.loa=
d_configs(self.coredata.config_files))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coredata.loa=
d_configs(self.coredata.config_files, &#39;native&#39;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.binaries.build =
=3D BinaryTable(config.get(&#39;binaries&#39;, {}))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.paths.build =3D =
Directories(**config.get(&#39;paths&#39;, {}))<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.50.=
1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.50.1.bb</a> b/meta/recip=
es-devtools/meson/<a href=3D"http://meson_0.51.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">meson_0.51.1.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.50.1=
.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.50.1.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.51.1.b=
b" rel=3D"noreferrer" target=3D"_blank">meson_0.51.1.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-m=
eson_0.50.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.50.1=
.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.5=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.51.1.bb</a><=
br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-me=
son_0.50.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.50.1.=
bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meso=
n_0.51.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.51.1.bb=
</a><br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000008ce244058f246d8f--
