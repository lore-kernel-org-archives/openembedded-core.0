Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 38E7E7FD7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:36:40 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c17so180225qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EwsHj6bJsVfo7bLeqV/SAeEnq1Gbq6lAiGWrjMRbizc=;
	b=e/qTHR0sF6U6kJbW7hZgPJT3Oab3WYBp+XC1C2fWwb+T8kYaNf4n0IMNfLt5yhrqTx
	STSkPQ375AaTkjSG9iBZmW07rrv0aZ6tgwUGV93Q8IUdZfQWIrn3XjM+MJOwDeGYluci
	bqXj1r8X6q3m8C2aR6IwegpG9Fy7VRoarxKQNse7GNX25qBAdt1JtcBwzBBVaVEcqub2
	lu0SHLGy6uTfJV2AxtgEUSFpH+/ZWNwE7SkSUqGCnH3EnofuDzfeUBNijy7zwiBE2vPP
	W9jtswtEkE2kcRlJHLvt8gc2my5neh4z5tGU9Y2eZzc2L0ywMv0rjJQzvzV1HPAUh5Ak
	DhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EwsHj6bJsVfo7bLeqV/SAeEnq1Gbq6lAiGWrjMRbizc=;
	b=HHwtpEnT//54dH1CcqlMaX0Zgl9/qpTlUmOnXWBNGLuADfS3WHPVU+mq6dZOS8krtT
	jUoAoXxz/k2CZmiY7bPD0Ka65CleGYRV2TRU5vEdpjH7UKXi+A90g/LbPMIsNdeMMvpg
	Vs74qnQYzbWGNoLNHeLEsWvadw7MNvx4w+6GnkNLhIsrpCei+Uf/NQLelc3Q3zuNJ5p9
	eXQVrkTl3GdMCMKEqLLuUDlYFWQzl64zEJ4UIJtEQHPCKDKKHGbhhplx38bMRLpL9yzR
	u9WrWGwI7nF/3e2cc1/dNBkpykWtTJerIve9Lup4jrrV9uA+aYMjVQg6CrcS97vSeOt/
	tQzg==
X-Gm-Message-State: APjAAAWMVqEHe6u83NEVrxZP9LWPfPJzeJ2NitBHON7x5ui5Fo47Ev5+
	ufWYdUHlFD7Dgup+VV5qAeqg1Rd5cqx0wfiL5/AgFx9k
X-Google-Smtp-Source: APXvYqzB5xgzMsPu7HvFBKrFJhPbeQLOlN8eOwLijuC5+FVBopsJZFiX6eoK0w+zMVY8RMBhRUCz+l/DhSScJwNnIzw=
X-Received: by 2002:a05:620a:6b8:: with SMTP id i24mr558351qkh.9.1579819000815;
	Thu, 23 Jan 2020 14:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
	<CAMKF1sq3OkG44tMWDnTM8CrEEou9niNVop4ASFc80qQfBFyRKQ@mail.gmail.com>
	<71745AB1-D75F-4825-BAE3-C3DA5660F2A0@gmail.com>
In-Reply-To: <71745AB1-D75F-4825-BAE3-C3DA5660F2A0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2020 14:36:14 -0800
Message-ID: <CAMKF1spsdyenwTww-jxVAjmdPkMNW-Zn8av7RcUm3JjNvysZvw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Thu, 23 Jan 2020 22:36:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 1:43 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I once more suggest we deal with all those special cases where linker cus=
tomization is desired later on. New meson isn=E2=80=99t going to work witho=
ut this change.
>
Perhaps I am missing something, what does new version gets us that we
could be willing to accept a regression?
 People are already using ld-is-gold in DISTRO_FEATURES

> Alex
>
> > On 23 Jan 2020, at 20.27, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Jan 23, 2020 at 9:34 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> ---
> >> meta/classes/meson.bbclass                       |  9 ++++++++-
> >> meta/recipes-devtools/meson/meson.inc            |  4 ++--
> >> .../0001-Make-CPU-family-warnings-fatal.patch    | 12 ++++++------
> >> ...-do-not-manipulate-the-environment-when.patch | 16 ++++++++--------
> >> ...-Support-building-allarch-recipes-again.patch |  6 +++---
> >> .../meson/meson/0003-native_bindir.patch         | 16 ++++++++--------
> >> .../meson/{meson_0.52.1.bb =3D> meson_0.53.0.bb}   |  0
> >> ...meson_0.52.1.bb =3D> nativesdk-meson_0.53.0.bb} |  2 +-
> >> 8 files changed, 36 insertions(+), 29 deletions(-)
> >> rename meta/recipes-devtools/meson/{meson_0.52.1.bb =3D> meson_0.53.0.=
bb} (100%)
> >> rename meta/recipes-devtools/meson/{nativesdk-meson_0.52.1.bb =3D> nat=
ivesdk-meson_0.53.0.bb} (99%)
> >>
> >> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> >> index 1ef34a999c8..1837c9468e6 100644
> >> --- a/meta/classes/meson.bbclass
> >> +++ b/meta/classes/meson.bbclass
> >> @@ -85,13 +85,16 @@ addtask write_config before do_configure
> >> do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS CX=
XFLAGS LDFLAGS"
> >> do_write_config() {
> >>     # This needs to be Py to split the args into single-element lists
> >> +
> >> +    # Meson requires ld to be 'bfd, 'lld' or 'gold' from 0.53 onwards
> >> +    # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e5=
9916c18901cde90fa2b3
> >>     cat >${WORKDIR}/meson.cross <<EOF
> >> [binaries]
> >> c =3D ${@meson_array('CC', d)}
> >> cpp =3D ${@meson_array('CXX', d)}
> >> ar =3D ${@meson_array('AR', d)}
> >> nm =3D ${@meson_array('NM', d)}
> >> -ld =3D ${@meson_array('LD', d)}
> >> +ld =3D 'bfd'
> >
> > there has to be a way to define it based on DISTRO_FEATURES containing
> > ld-is-gold
> > or ld-is-lld and perhaps also if someone adds
> >
> > LDFLAGS +=3D "-fuse-ld=3D<xxx>"
> >
> > should work too. I am not sure if all these cases function if we make
> > this change.
> >
> >> strip =3D ${@meson_array('STRIP', d)}
> >> readelf =3D ${@meson_array('READELF', d)}
> >> pkgconfig =3D 'pkg-config'
> >> @@ -122,6 +125,10 @@ EOF
> >> CONFIGURE_FILES =3D "meson.build"
> >>
> >> meson_do_configure() {
> >> +    # Meson requires this to be 'bfd, 'lld' or 'gold' from 0.53 onwar=
ds
> >> +    # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e5=
9916c18901cde90fa2b3
> >> +    unset LD
> >> +
> >>     # Work around "Meson fails if /tmp is mounted with noexec #2972"
> >>     mkdir -p "${B}/meson-private/tmp"
> >>     export TMPDIR=3D"${B}/meson-private/tmp"
> >> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devt=
ools/meson/meson.inc
> >> index 881a14c7f0a..c0ce7d338bc 100644
> >> --- a/meta/recipes-devtools/meson/meson.inc
> >> +++ b/meta/recipes-devtools/meson/meson.inc
> >> @@ -17,8 +17,8 @@ SRC_URI =3D "https://github.com/mesonbuild/meson/rel=
eases/download/${PV}/meson-${P
> >>            file://0001-mesonbuild-environment.py-check-environment-for=
-vari.patch \
> >>            file://0001-modules-python.py-do-not-substitute-python-s-in=
stall.patch \
> >>            "
> >> -SRC_URI[sha256sum] =3D "0c277472e49950a5537e3de3e60c57b80dbf425788470=
a1a8ed27446128fc035"
> >> -SRC_URI[md5sum] =3D "a5f0c99567d772508f649a28ded7f8ad"
> >> +SRC_URI[sha256sum] =3D "035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65=
c9bb6e1cc9730a9d3f6"
> >> +SRC_URI[md5sum] =3D "3a0313d040ded973d84cbec368c2e1d3"
> >>
> >> SRC_URI_append_class-native =3D " \
> >>     file://0001-Make-CPU-family-warnings-fatal.patch \
> >> diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-wa=
rnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family=
-warnings-fatal.patch
> >> index d4264cee526..74d5b4ca66e 100644
> >> --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
fatal.patch
> >> +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
fatal.patch
> >> @@ -1,4 +1,4 @@
> >> -From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:00:00 200=
1
> >> +From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:00:00 200=
1
> >> From: Ross Burton <ross.burton@intel.com>
> >> Date: Tue, 3 Jul 2018 13:59:09 +0100
> >> Subject: [PATCH] Make CPU family warnings fatal
> >> @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>  2 files changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> >> -index 29d7422..5fb00a4 100644
> >> +index 0f277a7..24578ea 100644
> >> --- a/mesonbuild/envconfig.py
> >> +++ b/mesonbuild/envconfig.py
> >> -@@ -190,7 +190,7 @@ class MachineInfo:
> >> +@@ -192,7 +192,7 @@ class MachineInfo:
> >>
> >>          cpu_family =3D literal['cpu_family']
> >>          if cpu_family not in known_cpu_families:
> >> @@ -25,15 +25,15 @@ index 29d7422..5fb00a4 100644
> >>          endian =3D literal['endian']
> >>          if endian not in ('little', 'big'):
> >> diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> >> -index a9bc2b8..b91c8da 100644
> >> +index dc8b14f..3aab71e 100644
> >> --- a/mesonbuild/environment.py
> >> +++ b/mesonbuild/environment.py
> >> -@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
> str:
> >> +@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
> str:
> >>          trial =3D 'parisc'
> >>
> >>      if trial not in known_cpu_families:
> >> -        mlog.warning('Unknown CPU family {!r}, please report this at =
'
> >> --                     'https://github.com/mesonbuild/meson/issues/new=
 with the'
> >> +-                     'https://github.com/mesonbuild/meson/issues/new=
 with the '
> >> -                     'output of `uname -a` and `cat /proc/cpuinfo`'.f=
ormat(trial))
> >> +        raise EnvironmentException('Unknown CPU family %s, see https:=
//wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
> >>
> >> diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-n=
ot-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meso=
n/0001-python-module-do-not-manipulate-the-environment-when.patch
> >> index bf715d1e9f4..eb0e90dbdda 100644
> >> --- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-mani=
pulate-the-environment-when.patch
> >> +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-mani=
pulate-the-environment-when.patch
> >> @@ -1,4 +1,4 @@
> >> -From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 200=
1
> >> +From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 200=
1
> >> From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> Date: Mon, 19 Nov 2018 14:24:26 +0100
> >> Subject: [PATCH] python module: do not manipulate the environment when=
 calling
> >> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gma=
il.com>
> >>  1 file changed, 12 deletions(-)
> >>
> >> diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.=
py
> >> -index 9cfbd6f..3ff687a 100644
> >> +index 07be318..b770603 100644
> >> --- a/mesonbuild/modules/python.py
> >> +++ b/mesonbuild/modules/python.py
> >> -@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):
> >> +@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
> >>                  old_pkg_libdir =3D os.environ.get('PKG_CONFIG_LIBDIR'=
)
> >>                  old_pkg_path =3D os.environ.get('PKG_CONFIG_PATH')
> >>
> >> @@ -25,10 +25,10 @@ index 9cfbd6f..3ff687a 100644
> >> -                    os.environ['PKG_CONFIG_LIBDIR'] =3D pkg_libdir
> >> -
> >>                  try:
> >> -                     self.pkgdep =3D PkgConfigDependency('python-{}'.=
format(pkg_version), environment, kwargs)
> >> -                     mlog.debug('Found "python-{}" via pkgconfig look=
up in LIBPC ({})'.format(pkg_version, pkg_libdir))
> >> -@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):
> >> -                     mlog.debug('"python-{}" could not be found in LI=
BPC ({})'.format(pkg_version, pkg_libdir))
> >> +                     self.pkgdep =3D PkgConfigDependency(pkg_name, en=
vironment, kwargs)
> >> +                     mlog.debug('Found "{}" via pkgconfig lookup in L=
IBPC ({})'.format(pkg_name, pkg_libdir))
> >> +@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
> >> +                     mlog.debug('"{}" could not be found in LIBPC ({}=
)'.format(pkg_name, pkg_libdir))
> >>                      mlog.debug(e)
> >>
> >> -                if old_pkg_path is not None:
> >> @@ -39,5 +39,5 @@ index 9cfbd6f..3ff687a 100644
> >> -                else:
> >> -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
> >>              else:
> >> -                 mlog.debug('"python-{}" could not be found in LIBPC =
({}), this is likely due to a relocated python installation'.format(pkg_ver=
sion, pkg_libdir))
> >> +                 mlog.debug('"{}" could not be found in LIBPC ({}), t=
his is likely due to a relocated python installation'.format(pkg_name, pkg_=
libdir))
> >>
> >> diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-a=
llarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support=
-building-allarch-recipes-again.patch
> >> index c8c7b298de3..1529ebe9fea 100644
> >> --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-=
recipes-again.patch
> >> +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-=
recipes-again.patch
> >> @@ -1,4 +1,4 @@
> >> -From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:00:00 200=
1
> >> +From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:00:00 200=
1
> >> From: Peter Kjellerstedt <pkj@axis.com>
> >> Date: Thu, 26 Jul 2018 16:32:49 +0200
> >> Subject: [PATCH] Support building allarch recipes again
> >> @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellersted=
t@axis.com>
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> >> -index 5fb00a4..f5702ba 100644
> >> +index 24578ea..216e71f 100644
> >> --- a/mesonbuild/envconfig.py
> >> +++ b/mesonbuild/envconfig.py
> >> @@ -36,6 +36,7 @@ _T =3D typing.TypeVar('_T')
> >> @@ -22,5 +22,5 @@ index 5fb00a4..f5702ba 100644
> >>  known_cpu_families =3D (
> >> +    'allarch',
> >>      'aarch64',
> >> +     'alpha',
> >>      'arc',
> >> -     'arm',
> >> diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patc=
h b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >> index 14a9a136664..76c1aa9ac1c 100644
> >> --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >> +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> >> @@ -1,4 +1,4 @@
> >> -From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:00:00 200=
1
> >> +From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:00:00 200=
1
> >> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> >> Date: Wed, 15 Nov 2017 15:05:01 +0100
> >> Subject: [PATCH] native_bindir
> >> @@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.riba=
lda@gmail.com>
> >>  2 files changed, 14 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies=
/base.py
> >> -index 35f0175..b39cba6 100644
> >> +index f17b9f2..b5c9c92 100644
> >> --- a/mesonbuild/dependencies/base.py
> >> +++ b/mesonbuild/dependencies/base.py
> >> @@ -184,7 +184,7 @@ class Dependency:
> >> @@ -43,7 +43,7 @@ index 35f0175..b39cba6 100644
> >>          raise DependencyException('Method "get_pkgconfig_variable()" =
is '
> >>                                    'invalid for an internal dependency=
')
> >>
> >> -@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency):
> >> +@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDependency):
> >>          return s.format(self.__class__.__name__, self.name, self.is_f=
ound,
> >>                          self.version_reqs)
> >>
> >> @@ -65,7 +65,7 @@ index 35f0175..b39cba6 100644
> >>          # Always copy the environment since we're going to modify it
> >>          # with pkg-config variables
> >>          if env is None:
> >> -@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):
> >> +@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDependency):
> >>          targs =3D tuple(args)
> >>          cache =3D PkgConfigDependency.pkgbin_cache
> >>          if (self.pkgbin, targs, fenv) not in cache:
> >> @@ -73,8 +73,8 @@ index 35f0175..b39cba6 100644
> >> +            cache[(self.pkgbin, targs, fenv)] =3D self._call_pkgbin_r=
eal(args, env, use_native)
> >>          return cache[(self.pkgbin, targs, fenv)]
> >>
> >> -     def _convert_mingw_paths(self, args):
> >> -@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDependency):
> >> +     def _convert_mingw_paths(self, args: List[str]) -> List[str]:
> >> +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
> >>                                        (self.name, out_raw))
> >>          self.link_args, self.raw_link_args =3D self._search_libs(out,=
 out_raw)
> >>
> >> @@ -83,7 +83,7 @@ index 35f0175..b39cba6 100644
> >>          options =3D ['--variable=3D' + variable_name, self.name]
> >>
> >>          if 'define_variable' in kwargs:
> >> -@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDependency):
> >> +@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDependency):
> >>
> >>              options =3D ['--define-variable=3D' + '=3D'.join(definiti=
on)] + options
> >>
> >> @@ -93,7 +93,7 @@ index 35f0175..b39cba6 100644
> >>          if ret !=3D 0:
> >>              if self.required:
> >> diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/u=
i.py
> >> -index 6d784e6..73a9e13 100644
> >> +index bdcc4a7..e2de847 100644
> >> --- a/mesonbuild/dependencies/ui.py
> >> +++ b/mesonbuild/dependencies/ui.py
> >> @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
> >> diff --git a/meta/recipes-devtools/meson/meson_0.52.1.bb b/meta/recipe=
s-devtools/meson/meson_0.53.0.bb
> >> similarity index 100%
> >> rename from meta/recipes-devtools/meson/meson_0.52.1.bb
> >> rename to meta/recipes-devtools/meson/meson_0.53.0.bb
> >> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb b/m=
eta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> >> similarity index 99%
> >> rename from meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
> >> rename to meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> >> index 1756f342ce3..3e13c70438a 100644
> >> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
> >> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
> >> @@ -31,7 +31,7 @@ c =3D @CC
> >> cpp =3D @CXX
> >> ar =3D @AR
> >> nm =3D @NM
> >> -ld =3D @LD
> >> +ld =3D 'bfd'
> >> strip =3D @STRIP
> >> pkgconfig =3D 'pkg-config'
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

