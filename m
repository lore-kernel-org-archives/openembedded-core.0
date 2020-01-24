Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id C29647F68F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 09:09:20 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id x18so785211vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 01:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kwCZ6Tmte+d4VbU5s7CFN/hQw+s26hjDzQKsBuqdg3U=;
	b=Dp0qLKgQZTDmqf90RbADhku84YFLKS4FHMwKNlCdpk8sEAc+BTfJXccJGnGu4+XMTG
	LuOBbBhtDkENrG9PhominYG/1mbdsXsCbcxN/FgZrvvKp0auhj16THTSxm2g16w1DBgV
	/miRbXCq09Nrs9zgkUHGhfNv6ZGEKmVtzRmlKxEfSgmkOwp79SKKs+XChHDtjE4EJu9y
	gOM4zN4dV9M6738mzaNMRQ5rhvi4Ib7WZ08V+v8shfui7lfLlN16f5PdhPIgsGmsKTc2
	jvEGfDH2pdy/fl57uOYixyww84ULV2qcpAVahpX52sKq1ccEryCf+D5qxG654oY8qc19
	bILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kwCZ6Tmte+d4VbU5s7CFN/hQw+s26hjDzQKsBuqdg3U=;
	b=PB+jIBV8TCOGvpGW+98qtqgPQdcVQym8SD2hDxfigbMRhq3PC4IKU+cmAoPPX/mX/x
	dpgjcq0tMJemsTUmoJ1c9GAoZXu+XidAvUV9tTP0E72P5RVCEqUc1MP3+wswU+CGUv6S
	3hvV/Slr06BQPdO9ywhNw/TlSrVL9sg2wLDeCNx1vCl5+JdvBeS3cooOY5e41OAS4iLr
	riFq7CsINCQPArrs/4aHftPUoYcPoJoW40853ECiEEntsdKllsKn38eEaxag2N7ddd76
	A8Y8EkpRFTk9yP4egGhr5wNLUtQBsBTTkoFgMhhuZ9nsJI7F/VLQfEulaLgzE+RZdRhI
	V4Iw==
X-Gm-Message-State: APjAAAX2gJDgtFURJGzqkjwo6xTj9TqYvGMYDzHI/N9Cj2Sr2fMCIkJI
	6UgWh7vjsZqXEoOg1pjMk8nSi1arCZtC76PT0XE=
X-Google-Smtp-Source: APXvYqysr72TbpUV1ycYlAIv1V8s9igDjvjw3hQonDRPaaZTEFmfvhCYNTpDqyC0TQVPtQFAtLrbUp2eeWaq7ON7iWM=
X-Received: by 2002:a05:6102:2437:: with SMTP id
	l23mr1555374vsi.23.1579856961526; 
	Fri, 24 Jan 2020 01:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
	<CAMKF1sq3OkG44tMWDnTM8CrEEou9niNVop4ASFc80qQfBFyRKQ@mail.gmail.com>
	<71745AB1-D75F-4825-BAE3-C3DA5660F2A0@gmail.com>
	<CAMKF1spsdyenwTww-jxVAjmdPkMNW-Zn8av7RcUm3JjNvysZvw@mail.gmail.com>
In-Reply-To: <CAMKF1spsdyenwTww-jxVAjmdPkMNW-Zn8av7RcUm3JjNvysZvw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2020 10:09:09 +0100
Message-ID: <CANNYZj8URJ8G3s-h5k4x6ShTb6OYhLPCzFp288E8=wAejWy06A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] meson: update 0.52.1 -> 0.53.0
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
X-List-Received-Date: Fri, 24 Jan 2020 09:09:21 -0000
Content-Type: multipart/alternative; boundary="000000000000fce1bf059cdf1c35"

--000000000000fce1bf059cdf1c35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, I'll take a closer look and make it honor the setting.

Alex

On Thu, 23 Jan 2020 at 23:36, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 23, 2020 at 1:43 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I once more suggest we deal with all those special cases where linker
> customization is desired later on. New meson isn=E2=80=99t going to work =
without
> this change.
> >
> Perhaps I am missing something, what does new version gets us that we
> could be willing to accept a regression?
>  People are already using ld-is-gold in DISTRO_FEATURES
>
> > Alex
> >
> > > On 23 Jan 2020, at 20.27, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Jan 23, 2020 at 9:34 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > >>
> > >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > >> ---
> > >> meta/classes/meson.bbclass                       |  9 ++++++++-
> > >> meta/recipes-devtools/meson/meson.inc            |  4 ++--
> > >> .../0001-Make-CPU-family-warnings-fatal.patch    | 12 ++++++------
> > >> ...-do-not-manipulate-the-environment-when.patch | 16 ++++++++------=
--
> > >> ...-Support-building-allarch-recipes-again.patch |  6 +++---
> > >> .../meson/meson/0003-native_bindir.patch         | 16 ++++++++------=
--
> > >> .../meson/{meson_0.52.1.bb =3D> meson_0.53.0.bb}   |  0
> > >> ...meson_0.52.1.bb =3D> nativesdk-meson_0.53.0.bb} |  2 +-
> > >> 8 files changed, 36 insertions(+), 29 deletions(-)
> > >> rename meta/recipes-devtools/meson/{meson_0.52.1.bb =3D>
> meson_0.53.0.bb} (100%)
> > >> rename meta/recipes-devtools/meson/{nativesdk-meson_0.52.1.bb =3D>
> nativesdk-meson_0.53.0.bb} (99%)
> > >>
> > >> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > >> index 1ef34a999c8..1837c9468e6 100644
> > >> --- a/meta/classes/meson.bbclass
> > >> +++ b/meta/classes/meson.bbclass
> > >> @@ -85,13 +85,16 @@ addtask write_config before do_configure
> > >> do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS
> CXXFLAGS LDFLAGS"
> > >> do_write_config() {
> > >>     # This needs to be Py to split the args into single-element list=
s
> > >> +
> > >> +    # Meson requires ld to be 'bfd, 'lld' or 'gold' from 0.53 onwar=
ds
> > >> +    #
> https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901=
cde90fa2b3
> > >>     cat >${WORKDIR}/meson.cross <<EOF
> > >> [binaries]
> > >> c =3D ${@meson_array('CC', d)}
> > >> cpp =3D ${@meson_array('CXX', d)}
> > >> ar =3D ${@meson_array('AR', d)}
> > >> nm =3D ${@meson_array('NM', d)}
> > >> -ld =3D ${@meson_array('LD', d)}
> > >> +ld =3D 'bfd'
> > >
> > > there has to be a way to define it based on DISTRO_FEATURES containin=
g
> > > ld-is-gold
> > > or ld-is-lld and perhaps also if someone adds
> > >
> > > LDFLAGS +=3D "-fuse-ld=3D<xxx>"
> > >
> > > should work too. I am not sure if all these cases function if we make
> > > this change.
> > >
> > >> strip =3D ${@meson_array('STRIP', d)}
> > >> readelf =3D ${@meson_array('READELF', d)}
> > >> pkgconfig =3D 'pkg-config'
> > >> @@ -122,6 +125,10 @@ EOF
> > >> CONFIGURE_FILES =3D "meson.build"
> > >>
> > >> meson_do_configure() {
> > >> +    # Meson requires this to be 'bfd, 'lld' or 'gold' from 0.53
> onwards
> > >> +    #
> https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901=
cde90fa2b3
> > >> +    unset LD
> > >> +
> > >>     # Work around "Meson fails if /tmp is mounted with noexec #2972"
> > >>     mkdir -p "${B}/meson-private/tmp"
> > >>     export TMPDIR=3D"${B}/meson-private/tmp"
> > >> diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> > >> index 881a14c7f0a..c0ce7d338bc 100644
> > >> --- a/meta/recipes-devtools/meson/meson.inc
> > >> +++ b/meta/recipes-devtools/meson/meson.inc
> > >> @@ -17,8 +17,8 @@ SRC_URI =3D "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> > >>
> file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
> > >>
> file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
> > >>            "
> > >> -SRC_URI[sha256sum] =3D
> "0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035"
> > >> -SRC_URI[md5sum] =3D "a5f0c99567d772508f649a28ded7f8ad"
> > >> +SRC_URI[sha256sum] =3D
> "035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65c9bb6e1cc9730a9d3f6"
> > >> +SRC_URI[md5sum] =3D "3a0313d040ded973d84cbec368c2e1d3"
> > >>
> > >> SRC_URI_append_class-native =3D " \
> > >>     file://0001-Make-CPU-family-warnings-fatal.patch \
> > >> diff --git
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.p=
atch
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.p=
atch
> > >> index d4264cee526..74d5b4ca66e 100644
> > >> ---
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.p=
atch
> > >> +++
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.p=
atch
> > >> @@ -1,4 +1,4 @@
> > >> -From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:00:00
> 2001
> > >> +From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:00:00
> 2001
> > >> From: Ross Burton <ross.burton@intel.com>
> > >> Date: Tue, 3 Jul 2018 13:59:09 +0100
> > >> Subject: [PATCH] Make CPU family warnings fatal
> > >> @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.co=
m
> >
> > >>  2 files changed, 2 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > >> -index 29d7422..5fb00a4 100644
> > >> +index 0f277a7..24578ea 100644
> > >> --- a/mesonbuild/envconfig.py
> > >> +++ b/mesonbuild/envconfig.py
> > >> -@@ -190,7 +190,7 @@ class MachineInfo:
> > >> +@@ -192,7 +192,7 @@ class MachineInfo:
> > >>
> > >>          cpu_family =3D literal['cpu_family']
> > >>          if cpu_family not in known_cpu_families:
> > >> @@ -25,15 +25,15 @@ index 29d7422..5fb00a4 100644
> > >>          endian =3D literal['endian']
> > >>          if endian not in ('little', 'big'):
> > >> diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > >> -index a9bc2b8..b91c8da 100644
> > >> +index dc8b14f..3aab71e 100644
> > >> --- a/mesonbuild/environment.py
> > >> +++ b/mesonbuild/environment.py
> > >> -@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: CompilersDict)
> -> str:
> > >> +@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: CompilersDict)
> -> str:
> > >>          trial =3D 'parisc'
> > >>
> > >>      if trial not in known_cpu_families:
> > >> -        mlog.warning('Unknown CPU family {!r}, please report this a=
t
> '
> > >> --                     '
> https://github.com/mesonbuild/meson/issues/new with the'
> > >> +-                     '
> https://github.com/mesonbuild/meson/issues/new with the '
> > >> -                     'output of `uname -a` and `cat
> /proc/cpuinfo`'.format(trial))
> > >> +        raise EnvironmentException('Unknown CPU family %s, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' %
> trial)
> > >>
> > >> diff --git
> a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-=
the-environment-when.patch
> b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-=
the-environment-when.patch
> > >> index bf715d1e9f4..eb0e90dbdda 100644
> > >> ---
> a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-=
the-environment-when.patch
> > >> +++
> b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-=
the-environment-when.patch
> > >> @@ -1,4 +1,4 @@
> > >> -From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00
> 2001
> > >> +From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00
> 2001
> > >> From: Alexander Kanavin <alex.kanavin@gmail.com>
> > >> Date: Mon, 19 Nov 2018 14:24:26 +0100
> > >> Subject: [PATCH] python module: do not manipulate the environment
> when calling
> > >> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> > >>  1 file changed, 12 deletions(-)
> > >>
> > >> diff --git a/mesonbuild/modules/python.py
> b/mesonbuild/modules/python.py
> > >> -index 9cfbd6f..3ff687a 100644
> > >> +index 07be318..b770603 100644
> > >> --- a/mesonbuild/modules/python.py
> > >> +++ b/mesonbuild/modules/python.py
> > >> -@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):
> > >> +@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
> > >>                  old_pkg_libdir =3D os.environ.get('PKG_CONFIG_LIBDI=
R')
> > >>                  old_pkg_path =3D os.environ.get('PKG_CONFIG_PATH')
> > >>
> > >> @@ -25,10 +25,10 @@ index 9cfbd6f..3ff687a 100644
> > >> -                    os.environ['PKG_CONFIG_LIBDIR'] =3D pkg_libdir
> > >> -
> > >>                  try:
> > >> -                     self.pkgdep =3D
> PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
> > >> -                     mlog.debug('Found "python-{}" via pkgconfig
> lookup in LIBPC ({})'.format(pkg_version, pkg_libdir))
> > >> -@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):
> > >> -                     mlog.debug('"python-{}" could not be found in
> LIBPC ({})'.format(pkg_version, pkg_libdir))
> > >> +                     self.pkgdep =3D PkgConfigDependency(pkg_name,
> environment, kwargs)
> > >> +                     mlog.debug('Found "{}" via pkgconfig lookup in
> LIBPC ({})'.format(pkg_name, pkg_libdir))
> > >> +@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
> > >> +                     mlog.debug('"{}" could not be found in LIBPC
> ({})'.format(pkg_name, pkg_libdir))
> > >>                      mlog.debug(e)
> > >>
> > >> -                if old_pkg_path is not None:
> > >> @@ -39,5 +39,5 @@ index 9cfbd6f..3ff687a 100644
> > >> -                else:
> > >> -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
> > >>              else:
> > >> -                 mlog.debug('"python-{}" could not be found in LIBP=
C
> ({}), this is likely due to a relocated python
> installation'.format(pkg_version, pkg_libdir))
> > >> +                 mlog.debug('"{}" could not be found in LIBPC ({}),
> this is likely due to a relocated python installation'.format(pkg_name,
> pkg_libdir))
> > >>
> > >> diff --git
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes=
-again.patch
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes=
-again.patch
> > >> index c8c7b298de3..1529ebe9fea 100644
> > >> ---
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes=
-again.patch
> > >> +++
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes=
-again.patch
> > >> @@ -1,4 +1,4 @@
> > >> -From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:00:00
> 2001
> > >> +From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:00:00
> 2001
> > >> From: Peter Kjellerstedt <pkj@axis.com>
> > >> Date: Thu, 26 Jul 2018 16:32:49 +0200
> > >> Subject: [PATCH] Support building allarch recipes again
> > >> @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > >> -index 5fb00a4..f5702ba 100644
> > >> +index 24578ea..216e71f 100644
> > >> --- a/mesonbuild/envconfig.py
> > >> +++ b/mesonbuild/envconfig.py
> > >> @@ -36,6 +36,7 @@ _T =3D typing.TypeVar('_T')
> > >> @@ -22,5 +22,5 @@ index 5fb00a4..f5702ba 100644
> > >>  known_cpu_families =3D (
> > >> +    'allarch',
> > >>      'aarch64',
> > >> +     'alpha',
> > >>      'arc',
> > >> -     'arm',
> > >> diff --git
> a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > >> index 14a9a136664..76c1aa9ac1c 100644
> > >> --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > >> +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > >> @@ -1,4 +1,4 @@
> > >> -From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:00:00
> 2001
> > >> +From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:00:00
> 2001
> > >> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > >> Date: Wed, 15 Nov 2017 15:05:01 +0100
> > >> Subject: [PATCH] native_bindir
> > >> @@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com>
> > >>  2 files changed, 14 insertions(+), 11 deletions(-)
> > >>
> > >> diff --git a/mesonbuild/dependencies/base.py
> b/mesonbuild/dependencies/base.py
> > >> -index 35f0175..b39cba6 100644
> > >> +index f17b9f2..b5c9c92 100644
> > >> --- a/mesonbuild/dependencies/base.py
> > >> +++ b/mesonbuild/dependencies/base.py
> > >> @@ -184,7 +184,7 @@ class Dependency:
> > >> @@ -43,7 +43,7 @@ index 35f0175..b39cba6 100644
> > >>          raise DependencyException('Method "get_pkgconfig_variable()=
"
> is '
> > >>                                    'invalid for an internal
> dependency')
> > >>
> > >> -@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency)=
:
> > >> +@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDependency)=
:
> > >>          return s.format(self.__class__.__name__, self.name,
> self.is_found,
> > >>                          self.version_reqs)
> > >>
> > >> @@ -65,7 +65,7 @@ index 35f0175..b39cba6 100644
> > >>          # Always copy the environment since we're going to modify i=
t
> > >>          # with pkg-config variables
> > >>          if env is None:
> > >> -@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):
> > >> +@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDependency):
> > >>          targs =3D tuple(args)
> > >>          cache =3D PkgConfigDependency.pkgbin_cache
> > >>          if (self.pkgbin, targs, fenv) not in cache:
> > >> @@ -73,8 +73,8 @@ index 35f0175..b39cba6 100644
> > >> +            cache[(self.pkgbin, targs, fenv)] =3D
> self._call_pkgbin_real(args, env, use_native)
> > >>          return cache[(self.pkgbin, targs, fenv)]
> > >>
> > >> -     def _convert_mingw_paths(self, args):
> > >> -@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDependency):
> > >> +     def _convert_mingw_paths(self, args: List[str]) -> List[str]:
> > >> +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
> > >>                                        (self.name, out_raw))
> > >>          self.link_args, self.raw_link_args =3D self._search_libs(ou=
t,
> out_raw)
> > >>
> > >> @@ -83,7 +83,7 @@ index 35f0175..b39cba6 100644
> > >>          options =3D ['--variable=3D' + variable_name, self.name]
> > >>
> > >>          if 'define_variable' in kwargs:
> > >> -@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDependency):
> > >> +@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDependency):
> > >>
> > >>              options =3D ['--define-variable=3D' + '=3D'.join(defini=
tion)]
> + options
> > >>
> > >> @@ -93,7 +93,7 @@ index 35f0175..b39cba6 100644
> > >>          if ret !=3D 0:
> > >>              if self.required:
> > >> diff --git a/mesonbuild/dependencies/ui.py
> b/mesonbuild/dependencies/ui.py
> > >> -index 6d784e6..73a9e13 100644
> > >> +index bdcc4a7..e2de847 100644
> > >> --- a/mesonbuild/dependencies/ui.py
> > >> +++ b/mesonbuild/dependencies/ui.py
> > >> @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
> > >> diff --git a/meta/recipes-devtools/meson/meson_0.52.1.bb
> b/meta/recipes-devtools/meson/meson_0.53.0.bb
> > >> similarity index 100%
> > >> rename from meta/recipes-devtools/meson/meson_0.52.1.bb
> > >> rename to meta/recipes-devtools/meson/meson_0.53.0.bb
> > >> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> > >> similarity index 99%
> > >> rename from meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
> > >> rename to meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> > >> index 1756f342ce3..3e13c70438a 100644
> > >> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
> > >> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> > >> @@ -31,7 +31,7 @@ c =3D @CC
> > >> cpp =3D @CXX
> > >> ar =3D @AR
> > >> nm =3D @NM
> > >> -ld =3D @LD
> > >> +ld =3D 'bfd'
> > >> strip =3D @STRIP
> > >> pkgconfig =3D 'pkg-config'
> > >>
> > >> --
> > >> 2.17.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fce1bf059cdf1c35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I&#39;ll take a closer look and make it honor =
the setting.</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 23 Jan 2020 at =
23:36, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Jan 23, 2020 at 1:43 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I once more suggest we deal with all those special cases where linker =
customization is desired later on. New meson isn=E2=80=99t going to work wi=
thout this change.<br>
&gt;<br>
Perhaps I am missing something, what does new version gets us that we<br>
could be willing to accept a regression?<br>
=C2=A0People are already using ld-is-gold in DISTRO_FEATURES<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt; &gt; On 23 Jan 2020, at 20.27, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jan 23, 2020 at 9:34 AM Alexander Kanavin<br>
&gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++++-<br>
&gt; &gt;&gt; meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt;&gt; .../0001-Make-CPU-family-warnings-fatal.patch=C2=A0 =C2=A0 | =
12 ++++++------<br>
&gt; &gt;&gt; ...-do-not-manipulate-the-environment-when.patch | 16 +++++++=
+--------<br>
&gt; &gt;&gt; ...-Support-building-allarch-recipes-again.patch |=C2=A0 6 ++=
+---<br>
&gt; &gt;&gt; .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 16 ++++++++--------<br>
&gt; &gt;&gt; .../meson/{<a href=3D"http://meson_0.52.1.bb" rel=3D"noreferr=
er" target=3D"_blank">meson_0.52.1.bb</a> =3D&gt; <a href=3D"http://meson_0=
.53.0.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.53.0.bb</a>}=C2=A0 =
=C2=A0|=C2=A0 0<br>
&gt; &gt;&gt; ...<a href=3D"http://meson_0.52.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">meson_0.52.1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson=
_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.0.bb<=
/a>} |=C2=A0 2 +-<br>
&gt; &gt;&gt; 8 files changed, 36 insertions(+), 29 deletions(-)<br>
&gt; &gt;&gt; rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0=
.52.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.1.bb</a> =3D&gt; =
<a href=3D"http://meson_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">mes=
on_0.53.0.bb</a>} (100%)<br>
&gt; &gt;&gt; rename meta/recipes-devtools/meson/{<a href=3D"http://natives=
dk-meson_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.=
52.1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.53.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nativesdk-meson_0.53.0.bb</a>} (99%)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.=
bbclass<br>
&gt; &gt;&gt; index 1ef34a999c8..1837c9468e6 100644<br>
&gt; &gt;&gt; --- a/meta/classes/meson.bbclass<br>
&gt; &gt;&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; &gt;&gt; @@ -85,13 +85,16 @@ addtask write_config before do_configure<=
br>
&gt; &gt;&gt; do_write_config[vardeps] +=3D &quot;CC CXX LD AR NM STRIP REA=
DELF CFLAGS CXXFLAGS LDFLAGS&quot;<br>
&gt; &gt;&gt; do_write_config() {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0# This needs to be Py to split the args in=
to single-element lists<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # Meson requires ld to be &#39;bfd, &#39;lld&#=
39; or &#39;gold&#39; from 0.53 onwards<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # <a href=3D"https://github.com/mesonbuild/mes=
on/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353=
e59916c18901cde90fa2b3</a><br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0cat &gt;${WORKDIR}/meson.cross &lt;&lt;EOF=
<br>
&gt; &gt;&gt; [binaries]<br>
&gt; &gt;&gt; c =3D ${@meson_array(&#39;CC&#39;, d)}<br>
&gt; &gt;&gt; cpp =3D ${@meson_array(&#39;CXX&#39;, d)}<br>
&gt; &gt;&gt; ar =3D ${@meson_array(&#39;AR&#39;, d)}<br>
&gt; &gt;&gt; nm =3D ${@meson_array(&#39;NM&#39;, d)}<br>
&gt; &gt;&gt; -ld =3D ${@meson_array(&#39;LD&#39;, d)}<br>
&gt; &gt;&gt; +ld =3D &#39;bfd&#39;<br>
&gt; &gt;<br>
&gt; &gt; there has to be a way to define it based on DISTRO_FEATURES conta=
ining<br>
&gt; &gt; ld-is-gold<br>
&gt; &gt; or ld-is-lld and perhaps also if someone adds<br>
&gt; &gt;<br>
&gt; &gt; LDFLAGS +=3D &quot;-fuse-ld=3D&lt;xxx&gt;&quot;<br>
&gt; &gt;<br>
&gt; &gt; should work too. I am not sure if all these cases function if we =
make<br>
&gt; &gt; this change.<br>
&gt; &gt;<br>
&gt; &gt;&gt; strip =3D ${@meson_array(&#39;STRIP&#39;, d)}<br>
&gt; &gt;&gt; readelf =3D ${@meson_array(&#39;READELF&#39;, d)}<br>
&gt; &gt;&gt; pkgconfig =3D &#39;pkg-config&#39;<br>
&gt; &gt;&gt; @@ -122,6 +125,10 @@ EOF<br>
&gt; &gt;&gt; CONFIGURE_FILES =3D &quot;meson.build&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; meson_do_configure() {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # Meson requires this to be &#39;bfd, &#39;lld=
&#39; or &#39;gold&#39; from 0.53 onwards<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # <a href=3D"https://github.com/mesonbuild/mes=
on/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353=
e59916c18901cde90fa2b3</a><br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 unset LD<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0# Work around &quot;Meson fails if /tmp is=
 mounted with noexec #2972&quot;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${B}/meson-private/tmp&quot=
;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0export TMPDIR=3D&quot;${B}/meson-private/t=
mp&quot;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/rec=
ipes-devtools/meson/meson.inc<br>
&gt; &gt;&gt; index 881a14c7f0a..c0ce7d338bc 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; &gt;&gt; @@ -17,8 +17,8 @@ SRC_URI =3D &quot;<a href=3D"https://github=
.com/mesonbuild/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noref=
errer" target=3D"_blank">https://github.com/mesonbuild/meson/releases/downl=
oad/${PV}/meson-${P</a><br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mesonbui=
ld-environment.py-check-environment-for-vari.patch \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-modules-=
python.py-do-not-substitute-python-s-install.patch \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;&gt; -SRC_URI[sha256sum] =3D &quot;0c277472e49950a5537e3de3e60c57b=
80dbf425788470a1a8ed27446128fc035&quot;<br>
&gt; &gt;&gt; -SRC_URI[md5sum] =3D &quot;a5f0c99567d772508f649a28ded7f8ad&q=
uot;<br>
&gt; &gt;&gt; +SRC_URI[sha256sum] =3D &quot;035e75993ab6fa6c9ebf902b835c64c=
f397a763eb8e65c9bb6e1cc9730a9d3f6&quot;<br>
&gt; &gt;&gt; +SRC_URI[md5sum] =3D &quot;3a0313d040ded973d84cbec368c2e1d3&q=
uot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; SRC_URI_append_class-native =3D &quot; \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0file://0001-Make-CPU-family-warnings-fatal=
.patch \<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-=
family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-C=
PU-family-warnings-fatal.patch<br>
&gt; &gt;&gt; index d4264cee526..74d5b4ca66e 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch<br>
&gt; &gt;&gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;&gt; -From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; +From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt;&gt; Date: Tue, 3 Jul 2018 13:59:09 +0100<br>
&gt; &gt;&gt; Subject: [PATCH] Make CPU family warnings fatal<br>
&gt; &gt;&gt; @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton &lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;<br>
&gt; &gt;&gt;=C2=A0 2 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.p=
y<br>
&gt; &gt;&gt; -index 29d7422..5fb00a4 100644<br>
&gt; &gt;&gt; +index 0f277a7..24578ea 100644<br>
&gt; &gt;&gt; --- a/mesonbuild/envconfig.py<br>
&gt; &gt;&gt; +++ b/mesonbuild/envconfig.py<br>
&gt; &gt;&gt; -@@ -190,7 +190,7 @@ class MachineInfo:<br>
&gt; &gt;&gt; +@@ -192,7 +192,7 @@ class MachineInfo:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_family =3D literal[&#39=
;cpu_family&#39;]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cpu_family not in known_=
cpu_families:<br>
&gt; &gt;&gt; @@ -25,15 +25,15 @@ index 29d7422..5fb00a4 100644<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endian =3D literal[&#39;end=
ian&#39;]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if endian not in (&#39;litt=
le&#39;, &#39;big&#39;):<br>
&gt; &gt;&gt; diff --git a/mesonbuild/environment.py b/mesonbuild/environme=
nt.py<br>
&gt; &gt;&gt; -index a9bc2b8..b91c8da 100644<br>
&gt; &gt;&gt; +index dc8b14f..3aab71e 100644<br>
&gt; &gt;&gt; --- a/mesonbuild/environment.py<br>
&gt; &gt;&gt; +++ b/mesonbuild/environment.py<br>
&gt; &gt;&gt; -@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: Compile=
rsDict) -&gt; str:<br>
&gt; &gt;&gt; +@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: Compile=
rsDict) -&gt; str:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trial =3D &#39;parisc&#39;<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if trial not in known_cpu_families:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown CPU fa=
mily {!r}, please report this at &#39;<br>
&gt; &gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;<a href=3D"https://github.com/mesonbuild/meson/issues=
/new" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/me=
son/issues/new</a> with the&#39;<br>
&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;<a href=3D"https://github.com/mesonbuild/meson/issues=
/new" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/me=
son/issues/new</a> with the &#39;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;output of `uname -a` and `cat /proc/cpuinfo`&#39;.for=
mat(trial))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentException(&#39;=
Unknown CPU family %s, see <a href=3D"https://wiki.yoctoproject.org/wiki/Me=
son/UnknownCPU" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproj=
ect.org/wiki/Meson/UnknownCPU</a> for directions.&#39; % trial)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-python-mo=
dule-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/m=
eson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch<=
br>
&gt; &gt;&gt; index bf715d1e9f4..eb0e90dbdda 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/meson/meson/0001-python-module-do=
-not-manipulate-the-environment-when.patch<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do=
-not-manipulate-the-environment-when.patch<br>
&gt; &gt;&gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;&gt; -From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; +From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt;&gt; Date: Mon, 19 Nov 2018 14:24:26 +0100<br>
&gt; &gt;&gt; Subject: [PATCH] python module: do not manipulate the environ=
ment when calling<br>
&gt; &gt;&gt; @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt;<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 12 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/mesonbuild/modules/python.py b/mesonbuild/module=
s/python.py<br>
&gt; &gt;&gt; -index 9cfbd6f..3ff687a 100644<br>
&gt; &gt;&gt; +index 07be318..b770603 100644<br>
&gt; &gt;&gt; --- a/mesonbuild/modules/python.py<br>
&gt; &gt;&gt; +++ b/mesonbuild/modules/python.py<br>
&gt; &gt;&gt; -@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency=
):<br>
&gt; &gt;&gt; +@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency=
):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 old_pkg_libdir =3D os.environ.get(&#39;PKG_CONFIG_LIBDIR&#39;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 old_pkg_path =3D os.environ.get(&#39;PKG_CONFIG_PATH&#39;)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -25,10 +25,10 @@ index 9cfbd6f..3ff687a 100644<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.environ[&#39;PKG_CONFIG_LIBDIR&#39;] =3D pkg_libdir<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 try:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.pkgdep =3D PkgConfigDependency(&#39;python-{}&#39;.fo=
rmat(pkg_version), environment, kwargs)<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mlog.debug(&#39;Found &quot;python-{}&quot; via pkgconfig =
lookup in LIBPC ({})&#39;.format(pkg_version, pkg_libdir))<br>
&gt; &gt;&gt; -@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency=
):<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mlog.debug(&#39;&quot;python-{}&quot; could not be found i=
n LIBPC ({})&#39;.format(pkg_version, pkg_libdir))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.pkgdep =3D PkgConfigDependency(pkg_name, environment,=
 kwargs)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mlog.debug(&#39;Found &quot;{}&quot; via pkgconfig lookup =
in LIBPC ({})&#39;.format(pkg_name, pkg_libdir))<br>
&gt; &gt;&gt; +@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency=
):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mlog.debug(&#39;&quot;{}&quot; could not be found in LIBPC=
 ({})&#39;.format(pkg_name, pkg_libdir))<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 mlog.debug(e)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if o=
ld_pkg_path is not None:<br>
&gt; &gt;&gt; @@ -39,5 +39,5 @@ index 9cfbd6f..3ff687a 100644<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.environ.pop(&#39;PKG_CONFIG_LIBDIR&#39;, None)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0mlog.debug(&#39;&quot;python-{}&quot; could not be found in LIBPC ({}), =
this is likely due to a relocated python installation&#39;.format(pkg_versi=
on, pkg_libdir))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0mlog.debug(&#39;&quot;{}&quot; could not be found in LIBPC ({}), this is=
 likely due to a relocated python installation&#39;.format(pkg_name, pkg_li=
bdir))<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/meson/0002-Support-b=
uilding-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/000=
2-Support-building-allarch-recipes-again.patch<br>
&gt; &gt;&gt; index c8c7b298de3..1529ebe9fea 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/meson/meson/0002-Support-building=
-allarch-recipes-again.patch<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/meson/meson/0002-Support-building=
-allarch-recipes-again.patch<br>
&gt; &gt;&gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;&gt; -From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; +From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" =
target=3D"_blank">pkj@axis.com</a>&gt;<br>
&gt; &gt;&gt; Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt; &gt;&gt; Subject: [PATCH] Support building allarch recipes again<br>
&gt; &gt;&gt; @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt &lt;<a hr=
ef=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerst=
edt@axis.com</a>&gt;<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.p=
y<br>
&gt; &gt;&gt; -index 5fb00a4..f5702ba 100644<br>
&gt; &gt;&gt; +index 24578ea..216e71f 100644<br>
&gt; &gt;&gt; --- a/mesonbuild/envconfig.py<br>
&gt; &gt;&gt; +++ b/mesonbuild/envconfig.py<br>
&gt; &gt;&gt; @@ -36,6 +36,7 @@ _T =3D typing.TypeVar(&#39;_T&#39;)<br>
&gt; &gt;&gt; @@ -22,5 +22,5 @@ index 5fb00a4..f5702ba 100644<br>
&gt; &gt;&gt;=C2=A0 known_cpu_families =3D (<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 &#39;allarch&#39;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;aarch64&#39;,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0&#39;alpha&#39;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;arc&#39;,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;arm&#39;,<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/meson/0003-native_bi=
ndir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; &gt;&gt; index 14a9a136664..76c1aa9ac1c 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.pa=
tch<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.pa=
tch<br>
&gt; &gt;&gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;&gt; -From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; +From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.r=
ibalda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; &gt;&gt; Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt; &gt;&gt; Subject: [PATCH] native_bindir<br>
&gt; &gt;&gt; @@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado &lt;=
<a href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.riba=
lda@gmail.com</a>&gt;<br>
&gt; &gt;&gt;=C2=A0 2 files changed, 14 insertions(+), 11 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dep=
endencies/base.py<br>
&gt; &gt;&gt; -index 35f0175..b39cba6 100644<br>
&gt; &gt;&gt; +index f17b9f2..b5c9c92 100644<br>
&gt; &gt;&gt; --- a/mesonbuild/dependencies/base.py<br>
&gt; &gt;&gt; +++ b/mesonbuild/dependencies/base.py<br>
&gt; &gt;&gt; @@ -184,7 +184,7 @@ class Dependency:<br>
&gt; &gt;&gt; @@ -43,7 +43,7 @@ index 35f0175..b39cba6 100644<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DependencyException(&=
#39;Method &quot;get_pkgconfig_variable()&quot; is &#39;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;invali=
d for an internal dependency&#39;)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDepe=
ndency):<br>
&gt; &gt;&gt; +@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDepe=
ndency):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s.format(self.__clas=
s__.__name__, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_bl=
ank">self.name</a>, self.is_found,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.version_reqs)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -65,7 +65,7 @@ index 35f0175..b39cba6 100644<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Always copy the environme=
nt since we&#39;re going to modify it<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # with pkg-config variables=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if env is None:<br>
&gt; &gt;&gt; -@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDepend=
ency):<br>
&gt; &gt;&gt; +@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDepend=
ency):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targs =3D tuple(args)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache =3D PkgConfigDependen=
cy.pkgbin_cache<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (self.pkgbin, targs, fen=
v) not in cache:<br>
&gt; &gt;&gt; @@ -73,8 +73,8 @@ index 35f0175..b39cba6 100644<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache[(self.pkgbin=
, targs, fenv)] =3D self._call_pkgbin_real(args, env, use_native)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cache[(self.pkgbin, =
targs, fenv)]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args):<br=
>
&gt; &gt;&gt; -@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDepend=
ency):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args: Lis=
t[str]) -&gt; List[str]:<br>
&gt; &gt;&gt; +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDepend=
ency):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (<a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self=
.name</a>, out_raw))<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.link_args, self.raw_li=
nk_args =3D self._search_libs(out, out_raw)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -83,7 +83,7 @@ index 35f0175..b39cba6 100644<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options =3D [&#39;--variabl=
e=3D&#39; + variable_name, <a href=3D"http://self.name" rel=3D"noreferrer" =
target=3D"_blank">self.name</a>]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;define_variable&#39=
; in kwargs:<br>
&gt; &gt;&gt; -@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDepend=
ency):<br>
&gt; &gt;&gt; +@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDepend=
ency):<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options =3D [=
&#39;--define-variable=3D&#39; + &#39;=3D&#39;.join(definition)] + options<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -93,7 +93,7 @@ index 35f0175..b39cba6 100644<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ret !=3D 0:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.requi=
red:<br>
&gt; &gt;&gt; diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/depen=
dencies/ui.py<br>
&gt; &gt;&gt; -index 6d784e6..73a9e13 100644<br>
&gt; &gt;&gt; +index bdcc4a7..e2de847 100644<br>
&gt; &gt;&gt; --- a/mesonbuild/dependencies/ui.py<br>
&gt; &gt;&gt; +++ b/mesonbuild/dependencies/ui.py<br>
&gt; &gt;&gt; @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency=
):<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://me=
son_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.1.bb</a> b/m=
eta/recipes-devtools/meson/<a href=3D"http://meson_0.53.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">meson_0.53.0.bb</a><br>
&gt; &gt;&gt; similarity index 100%<br>
&gt; &gt;&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://mes=
on_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.1.bb</a><br>
&gt; &gt;&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson=
_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.53.0.bb</a><br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://na=
tivesdk-meson_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-mes=
on_0.52.1.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-=
meson_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.=
0.bb</a><br>
&gt; &gt;&gt; similarity index 99%<br>
&gt; &gt;&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://nat=
ivesdk-meson_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meso=
n_0.52.1.bb</a><br>
&gt; &gt;&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativ=
esdk-meson_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_=
0.53.0.bb</a><br>
&gt; &gt;&gt; index 1756f342ce3..3e13c70438a 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk=
-meson_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52=
.1.bb</a><br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk=
-meson_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53=
.0.bb</a><br>
&gt; &gt;&gt; @@ -31,7 +31,7 @@ c =3D @CC<br>
&gt; &gt;&gt; cpp =3D @CXX<br>
&gt; &gt;&gt; ar =3D @AR<br>
&gt; &gt;&gt; nm =3D @NM<br>
&gt; &gt;&gt; -ld =3D @LD<br>
&gt; &gt;&gt; +ld =3D &#39;bfd&#39;<br>
&gt; &gt;&gt; strip =3D @STRIP<br>
&gt; &gt;&gt; pkgconfig =3D &#39;pkg-config&#39;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.17.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000fce1bf059cdf1c35--
