Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8E0A7FDAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:52:11 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id m14so1707310qvl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tv6NxPcaYTBoB3hdz8UexTLsFD3vhhla4XIx00i9FVg=;
	b=Z2GQYWd1ErxMDjOqf7NpFB3EYs0kNCxvAXI6LREQFM+ydFKCECdFLNIYduH8BhAeQp
	PUytsH17BzqKiKvhogjEEfSPBmUzglW6XwMPlIqUuOKBcDXhUl3cpn2Fn8FZoOIg22tr
	9qH7wtzYxwi3u/nXymgRI2OvdRcc5N6D09TYsNJ2SBtga2d43eHdBnJGNbxYGTYV94/D
	/iMkdtOkKwcm6BQlE4bYm3fnMlU1pmL80TNATh/uLi6eN1lHs5fBxnTnK0zOlRxyM5Tv
	8TVe2fvwYgDTMeu9WYLeyPzyToYIVksThJa68TcCVsqiJppGLNmAFKdWJZra3U4vggqJ
	0NCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tv6NxPcaYTBoB3hdz8UexTLsFD3vhhla4XIx00i9FVg=;
	b=W4KQ79ILTuABj8yDmXll9Z7k+ZCI9L9Az1POft4GM48Dg/rQtX6whUs8z+GUPtML4h
	CYsZ1nElp2utagg5i5h6c2mcewtzw0OL4jcRfpxumHLI0iCmxPXwZkEmS064DK4SNemf
	LGBfN0FUNI4sskajQALj9adJg54B7XKVFZAMf+QamNkNr6eGFsKz6Ukt+78Gvt+/1eXB
	rzxAfrAwTrACsaPd8WKHVRCjtaFSlX3Fv+FHZPfJdFv+xkgEoJbEpe4rF5zO8v+8bAxn
	zb0IiUQOTzIIqKr8lHEeoF+VWIf6b1BtYAGvwfr28sFGZnnfsnONryDro42/UgDGdsML
	JhhA==
X-Gm-Message-State: APjAAAUKhFShpaUf/7o4e/MYq/TRKkjbBNc9TU1Lv4XrEHRUQILWlGmR
	qQraYWwmzhjQ1V6q1uPYqADic3UAwR4SR+NPqxspa259
X-Google-Smtp-Source: APXvYqwefYVNALqQwNglR6QR9lQ8zNutTI97DqUisAO5KiT8WSM+EzHFhwA973iphDlG1C0cWaFadLzUAcPVxCePkfs=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr16683944qvm.206.1579794732162;
	Thu, 23 Jan 2020 07:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-24-alex.kanavin@gmail.com>
	<CAMKF1sqfp9YAQ+uBntgqjQ4QEZs=dR8r38F2zN5HrN62V4c7sg@mail.gmail.com>
	<CANNYZj-OPOfhhBbYS9DfMVMgcbZnDnYja6CZkCcLPx-xk1UpZQ@mail.gmail.com>
In-Reply-To: <CANNYZj-OPOfhhBbYS9DfMVMgcbZnDnYja6CZkCcLPx-xk1UpZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2020 07:52:00 -0800
Message-ID: <CAMKF1sotWe27ZNet2grVCEOjng+ULKub_Ot6C7QGNXDFxnMUqQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jan 2020 15:52:12 -0000
Content-Type: multipart/alternative; boundary="000000000000d438bf059cd09f33"

--000000000000d438bf059cd09f33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 7:48 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> New meson more or less forces one of 'bfd', 'lfd' or 'gold' for that
> option (both as 'ld' in cross file and in LD from environment), as it is
> passed directly to -fuse-ld, and that option takes only the three
> variants.You can't place the actual binary name there.
>

That=E2=80=99s fine I guess we don=E2=80=99t need to set it here then
Perhaps. If meson expect compiler driver to be always called as LD that
would be a problem for packages which currently might be using bare linker
but perhaps those packages don=E2=80=99t use meson so it would be fine


> There is a use case for letting meson recipes choose what they want for a
> linker, but that's an enhancement for some other time.
>
> Alex
>
> On Tue, 21 Jan 2020 at 19:44, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Jan 20, 2020 at 9:28 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  meta/classes/meson.bbclass                       |  9 ++++++++-
>> >  meta/recipes-devtools/meson/meson.inc            |  4 ++--
>> >  .../0001-Make-CPU-family-warnings-fatal.patch    | 12 ++++++------
>> >  ...-do-not-manipulate-the-environment-when.patch | 16 ++++++++-------=
-
>> >  ...-Support-building-allarch-recipes-again.patch |  6 +++---
>> >  .../meson/meson/0003-native_bindir.patch         | 16 ++++++++-------=
-
>> >  .../meson/{meson_0.52.1.bb =3D> meson_0.53.0.bb}   |  0
>> >  ...meson_0.52.1.bb =3D> nativesdk-meson_0.53.0.bb} |  0
>> >  8 files changed, 35 insertions(+), 28 deletions(-)
>> >  rename meta/recipes-devtools/meson/{meson_0.52.1.bb =3D> meson_0.53.0=
.bb}
>> (100%)
>> >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.52.1.bb =3D>
>> nativesdk-meson_0.53.0.bb} (100%)
>> >
>> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>> > index 1ef34a999c8..1837c9468e6 100644
>> > --- a/meta/classes/meson.bbclass
>> > +++ b/meta/classes/meson.bbclass
>> > @@ -85,13 +85,16 @@ addtask write_config before do_configure
>> >  do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS
>> CXXFLAGS LDFLAGS"
>> >  do_write_config() {
>> >      # This needs to be Py to split the args into single-element lists
>> > +
>> > +    # Meson requires ld to be 'bfd, 'lld' or 'gold' from 0.53 onwards
>> > +    #
>> https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c1890=
1cde90fa2b3
>> >      cat >${WORKDIR}/meson.cross <<EOF
>> >  [binaries]
>> >  c =3D ${@meson_array('CC', d)}
>> >  cpp =3D ${@meson_array('CXX', d)}
>> >  ar =3D ${@meson_array('AR', d)}
>> >  nm =3D ${@meson_array('NM', d)}
>> > -ld =3D ${@meson_array('LD', d)}
>> > +ld =3D 'bfd'
>>
>> hardcoding to bfg would ignore gold or lld if users want to use those
>> linkers. Since its a fallback
>> and this expects linker to be invoked by compiler driver, since its
>> simply converting into -fuse-ld=3D<ld>
>> option to compiler, whereas in OE the var LD is set to represent bare
>> linker. Perhaps leaving it unset is
>> better, we already have LD set in env.
>>
>> >  strip =3D ${@meson_array('STRIP', d)}
>> >  readelf =3D ${@meson_array('READELF', d)}
>> >  pkgconfig =3D 'pkg-config'
>> > @@ -122,6 +125,10 @@ EOF
>> >  CONFIGURE_FILES =3D "meson.build"
>> >
>> >  meson_do_configure() {
>> > +    # Meson requires this to be 'bfd, 'lld' or 'gold' from 0.53 onwar=
ds
>> > +    #
>> https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c1890=
1cde90fa2b3
>> > +    unset LD
>> > +
>> >      # Work around "Meson fails if /tmp is mounted with noexec #2972"
>> >      mkdir -p "${B}/meson-private/tmp"
>> >      export TMPDIR=3D"${B}/meson-private/tmp"
>> > diff --git a/meta/recipes-devtools/meson/meson.inc
>> b/meta/recipes-devtools/meson/meson.inc
>> > index 881a14c7f0a..c0ce7d338bc 100644
>> > --- a/meta/recipes-devtools/meson/meson.inc
>> > +++ b/meta/recipes-devtools/meson/meson.inc
>> > @@ -17,8 +17,8 @@ SRC_URI =3D "
>> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>> >
>>  file://0001-mesonbuild-environment.py-check-environment-for-vari.patch =
\
>> >
>>  file://0001-modules-python.py-do-not-substitute-python-s-install.patch =
\
>> >             "
>> > -SRC_URI[sha256sum] =3D
>> "0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035"
>> > -SRC_URI[md5sum] =3D "a5f0c99567d772508f649a28ded7f8ad"
>> > +SRC_URI[sha256sum] =3D
>> "035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65c9bb6e1cc9730a9d3f6"
>> > +SRC_URI[md5sum] =3D "3a0313d040ded973d84cbec368c2e1d3"
>> >
>> >  SRC_URI_append_class-native =3D " \
>> >      file://0001-Make-CPU-family-warnings-fatal.patch \
>> > diff --git
>> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.=
patch
>> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.=
patch
>> > index d4264cee526..74d5b4ca66e 100644
>> > ---
>> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.=
patch
>> > +++
>> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.=
patch
>> > @@ -1,4 +1,4 @@
>> > -From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:00:00 200=
1
>> > +From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:00:00 200=
1
>> >  From: Ross Burton <ross.burton@intel.com>
>> >  Date: Tue, 3 Jul 2018 13:59:09 +0100
>> >  Subject: [PATCH] Make CPU family warnings fatal
>> > @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>> >   2 files changed, 2 insertions(+), 4 deletions(-)
>> >
>> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
>> > -index 29d7422..5fb00a4 100644
>> > +index 0f277a7..24578ea 100644
>> >  --- a/mesonbuild/envconfig.py
>> >  +++ b/mesonbuild/envconfig.py
>> > -@@ -190,7 +190,7 @@ class MachineInfo:
>> > +@@ -192,7 +192,7 @@ class MachineInfo:
>> >
>> >           cpu_family =3D literal['cpu_family']
>> >           if cpu_family not in known_cpu_families:
>> > @@ -25,15 +25,15 @@ index 29d7422..5fb00a4 100644
>> >           endian =3D literal['endian']
>> >           if endian not in ('little', 'big'):
>> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
>> > -index a9bc2b8..b91c8da 100644
>> > +index dc8b14f..3aab71e 100644
>> >  --- a/mesonbuild/environment.py
>> >  +++ b/mesonbuild/environment.py
>> > -@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
>
>> str:
>> > +@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
>
>> str:
>> >           trial =3D 'parisc'
>> >
>> >       if trial not in known_cpu_families:
>> >  -        mlog.warning('Unknown CPU family {!r}, please report this at=
 '
>> > --                     'https://github.com/mesonbuild/meson/issues/new
>> with the'
>> > +-                     'https://github.com/mesonbuild/meson/issues/new
>> with the '
>> >  -                     'output of `uname -a` and `cat
>> /proc/cpuinfo`'.format(trial))
>> >  +        raise EnvironmentException('Unknown CPU family %s, see
>> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' %
>> trial)
>> >
>> > diff --git
>> a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate=
-the-environment-when.patch
>> b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate=
-the-environment-when.patch
>> > index bf715d1e9f4..eb0e90dbdda 100644
>> > ---
>> a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate=
-the-environment-when.patch
>> > +++
>> b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate=
-the-environment-when.patch
>> > @@ -1,4 +1,4 @@
>> > -From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 200=
1
>> > +From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 200=
1
>> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
>> >  Date: Mon, 19 Nov 2018 14:24:26 +0100
>> >  Subject: [PATCH] python module: do not manipulate the environment whe=
n
>> calling
>> > @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <
>> alex.kanavin@gmail.com>
>> >   1 file changed, 12 deletions(-)
>> >
>> >  diff --git a/mesonbuild/modules/python.py
>> b/mesonbuild/modules/python.py
>> > -index 9cfbd6f..3ff687a 100644
>> > +index 07be318..b770603 100644
>> >  --- a/mesonbuild/modules/python.py
>> >  +++ b/mesonbuild/modules/python.py
>> > -@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):
>> > +@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
>> >                   old_pkg_libdir =3D os.environ.get('PKG_CONFIG_LIBDIR=
')
>> >                   old_pkg_path =3D os.environ.get('PKG_CONFIG_PATH')
>> >
>> > @@ -25,10 +25,10 @@ index 9cfbd6f..3ff687a 100644
>> >  -                    os.environ['PKG_CONFIG_LIBDIR'] =3D pkg_libdir
>> >  -
>> >                   try:
>> > -                     self.pkgdep =3D
>> PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs=
)
>> > -                     mlog.debug('Found "python-{}" via pkgconfig
>> lookup in LIBPC ({})'.format(pkg_version, pkg_libdir))
>> > -@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):
>> > -                     mlog.debug('"python-{}" could not be found in
>> LIBPC ({})'.format(pkg_version, pkg_libdir))
>> > +                     self.pkgdep =3D PkgConfigDependency(pkg_name,
>> environment, kwargs)
>> > +                     mlog.debug('Found "{}" via pkgconfig lookup in
>> LIBPC ({})'.format(pkg_name, pkg_libdir))
>> > +@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
>> > +                     mlog.debug('"{}" could not be found in LIBPC
>> ({})'.format(pkg_name, pkg_libdir))
>> >                       mlog.debug(e)
>> >
>> >  -                if old_pkg_path is not None:
>> > @@ -39,5 +39,5 @@ index 9cfbd6f..3ff687a 100644
>> >  -                else:
>> >  -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
>> >               else:
>> > -                 mlog.debug('"python-{}" could not be found in LIBPC
>> ({}), this is likely due to a relocated python
>> installation'.format(pkg_version, pkg_libdir))
>> > +                 mlog.debug('"{}" could not be found in LIBPC ({}),
>> this is likely due to a relocated python installation'.format(pkg_name,
>> pkg_libdir))
>> >
>> > diff --git
>> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipe=
s-again.patch
>> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipe=
s-again.patch
>> > index c8c7b298de3..1529ebe9fea 100644
>> > ---
>> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipe=
s-again.patch
>> > +++
>> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipe=
s-again.patch
>> > @@ -1,4 +1,4 @@
>> > -From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:00:00 200=
1
>> > +From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:00:00 200=
1
>> >  From: Peter Kjellerstedt <pkj@axis.com>
>> >  Date: Thu, 26 Jul 2018 16:32:49 +0200
>> >  Subject: [PATCH] Support building allarch recipes again
>> > @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <
>> peter.kjellerstedt@axis.com>
>> >   1 file changed, 1 insertion(+)
>> >
>> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
>> > -index 5fb00a4..f5702ba 100644
>> > +index 24578ea..216e71f 100644
>> >  --- a/mesonbuild/envconfig.py
>> >  +++ b/mesonbuild/envconfig.py
>> >  @@ -36,6 +36,7 @@ _T =3D typing.TypeVar('_T')
>> > @@ -22,5 +22,5 @@ index 5fb00a4..f5702ba 100644
>> >   known_cpu_families =3D (
>> >  +    'allarch',
>> >       'aarch64',
>> > +     'alpha',
>> >       'arc',
>> > -     'arm',
>> > diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patc=
h
>> b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>> > index 14a9a136664..76c1aa9ac1c 100644
>> > --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>> > +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>> > @@ -1,4 +1,4 @@
>> > -From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:00:00 200=
1
>> > +From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:00:00 200=
1
>> >  From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> >  Date: Wed, 15 Nov 2017 15:05:01 +0100
>> >  Subject: [PATCH] native_bindir
>> > @@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado <
>> ricardo.ribalda@gmail.com>
>> >   2 files changed, 14 insertions(+), 11 deletions(-)
>> >
>> >  diff --git a/mesonbuild/dependencies/base.py
>> b/mesonbuild/dependencies/base.py
>> > -index 35f0175..b39cba6 100644
>> > +index f17b9f2..b5c9c92 100644
>> >  --- a/mesonbuild/dependencies/base.py
>> >  +++ b/mesonbuild/dependencies/base.py
>> >  @@ -184,7 +184,7 @@ class Dependency:
>> > @@ -43,7 +43,7 @@ index 35f0175..b39cba6 100644
>> >           raise DependencyException('Method "get_pkgconfig_variable()"
>> is '
>> >                                     'invalid for an internal
>> dependency')
>> >
>> > -@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency):
>> > +@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDependency):
>> >           return s.format(self.__class__.__name__, self.name,
>> self.is_found,
>> >                           self.version_reqs)
>> >
>> > @@ -65,7 +65,7 @@ index 35f0175..b39cba6 100644
>> >           # Always copy the environment since we're going to modify it
>> >           # with pkg-config variables
>> >           if env is None:
>> > -@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):
>> > +@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDependency):
>> >           targs =3D tuple(args)
>> >           cache =3D PkgConfigDependency.pkgbin_cache
>> >           if (self.pkgbin, targs, fenv) not in cache:
>> > @@ -73,8 +73,8 @@ index 35f0175..b39cba6 100644
>> >  +            cache[(self.pkgbin, targs, fenv)] =3D
>> self._call_pkgbin_real(args, env, use_native)
>> >           return cache[(self.pkgbin, targs, fenv)]
>> >
>> > -     def _convert_mingw_paths(self, args):
>> > -@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDependency):
>> > +     def _convert_mingw_paths(self, args: List[str]) -> List[str]:
>> > +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
>> >                                         (self.name, out_raw))
>> >           self.link_args, self.raw_link_args =3D self._search_libs(out=
,
>> out_raw)
>> >
>> > @@ -83,7 +83,7 @@ index 35f0175..b39cba6 100644
>> >           options =3D ['--variable=3D' + variable_name, self.name]
>> >
>> >           if 'define_variable' in kwargs:
>> > -@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDependency):
>> > +@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDependency):
>> >
>> >               options =3D ['--define-variable=3D' + '=3D'.join(definit=
ion)] +
>> options
>> >
>> > @@ -93,7 +93,7 @@ index 35f0175..b39cba6 100644
>> >           if ret !=3D 0:
>> >               if self.required:
>> >  diff --git a/mesonbuild/dependencies/ui.py
>> b/mesonbuild/dependencies/ui.py
>> > -index 6d784e6..73a9e13 100644
>> > +index bdcc4a7..e2de847 100644
>> >  --- a/mesonbuild/dependencies/ui.py
>> >  +++ b/mesonbuild/dependencies/ui.py
>> >  @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
>> > diff --git a/meta/recipes-devtools/meson/meson_0.52.1.bb
>> b/meta/recipes-devtools/meson/meson_0.53.0.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/meson/meson_0.52.1.bb
>> > rename to meta/recipes-devtools/meson/meson_0.53.0.bb
>> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
>> b/meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
>> > rename to meta/recipes-devtools/meson/nativesdk-meson_0.53.0.bb
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000d438bf059cd09f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 23, 2020 at 7:48 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>New meson mor=
e or less forces one of &#39;bfd&#39;, &#39;lfd&#39; or &#39;gold&#39; for =
that option (both as &#39;ld&#39; in cross file and in LD from environment)=
, as it is passed directly to -fuse-ld, and that option takes only the thre=
e variants.You can&#39;t place the actual binary name there.</div><div></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=
=80=99s fine I guess we don=E2=80=99t need to set it here then</div><div di=
r=3D"auto">Perhaps. If meson expect compiler driver to be always called as =
LD that would be a problem for packages which currently might be using bare=
 linker but perhaps those packages don=E2=80=99t use meson so it would be f=
ine=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div><br></div><div>There is a use case for letting meson r=
ecipes choose what they want for a linker, but that&#39;s an enhancement fo=
r some other time.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 Jan 20=
20 at 19:44, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, Jan 20, 2020 at 9:28 AM Alexander Kanavin<=
br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++++-<br>
&gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 .../0001-Make-CPU-family-warnings-fatal.patch=C2=A0 =C2=A0 | 12 =
++++++------<br>
&gt;=C2=A0 ...-do-not-manipulate-the-environment-when.patch | 16 ++++++++--=
------<br>
&gt;=C2=A0 ...-Support-building-allarch-recipes-again.patch |=C2=A0 6 +++--=
-<br>
&gt;=C2=A0 .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 16 ++++++++--------<br>
&gt;=C2=A0 .../meson/{<a href=3D"http://meson_0.52.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">meson_0.52.1.bb</a> =3D&gt; <a href=3D"http://meson_0.53=
.0.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.53.0.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://meson_0.52.1.bb" rel=3D"noreferrer" target=
=3D"_blank">meson_0.52.1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0=
.53.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.0.bb</a=
>} |=C2=A0 0<br>
&gt;=C2=A0 8 files changed, 35 insertions(+), 28 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.52=
.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.1.bb</a> =3D&gt; <a =
href=3D"http://meson_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">meson_=
0.53.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativesdk-=
meson_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52.=
1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.53.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">nativesdk-meson_0.53.0.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<b=
r>
&gt; index 1ef34a999c8..1837c9468e6 100644<br>
&gt; --- a/meta/classes/meson.bbclass<br>
&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; @@ -85,13 +85,16 @@ addtask write_config before do_configure<br>
&gt;=C2=A0 do_write_config[vardeps] +=3D &quot;CC CXX LD AR NM STRIP READEL=
F CFLAGS CXXFLAGS LDFLAGS&quot;<br>
&gt;=C2=A0 do_write_config() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # This needs to be Py to split the args into singl=
e-element lists<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Meson requires ld to be &#39;bfd, &#39;lld&#39; or &#=
39;gold&#39; from 0.53 onwards<br>
&gt; +=C2=A0 =C2=A0 # <a href=3D"https://github.com/mesonbuild/meson/commit=
/ef9aeb188ea2bc7353e59916c18901cde90fa2b3" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18=
901cde90fa2b3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 cat &gt;${WORKDIR}/meson.cross &lt;&lt;EOF<br>
&gt;=C2=A0 [binaries]<br>
&gt;=C2=A0 c =3D ${@meson_array(&#39;CC&#39;, d)}<br>
&gt;=C2=A0 cpp =3D ${@meson_array(&#39;CXX&#39;, d)}<br>
&gt;=C2=A0 ar =3D ${@meson_array(&#39;AR&#39;, d)}<br>
&gt;=C2=A0 nm =3D ${@meson_array(&#39;NM&#39;, d)}<br>
&gt; -ld =3D ${@meson_array(&#39;LD&#39;, d)}<br>
&gt; +ld =3D &#39;bfd&#39;<br>
<br>
hardcoding to bfg would ignore gold or lld if users want to use those<br>
linkers. Since its a fallback<br>
and this expects linker to be invoked by compiler driver, since its<br>
simply converting into -fuse-ld=3D&lt;ld&gt;<br>
option to compiler, whereas in OE the var LD is set to represent bare<br>
linker. Perhaps leaving it unset is<br>
better, we already have LD set in env.<br>
<br>
&gt;=C2=A0 strip =3D ${@meson_array(&#39;STRIP&#39;, d)}<br>
&gt;=C2=A0 readelf =3D ${@meson_array(&#39;READELF&#39;, d)}<br>
&gt;=C2=A0 pkgconfig =3D &#39;pkg-config&#39;<br>
&gt; @@ -122,6 +125,10 @@ EOF<br>
&gt;=C2=A0 CONFIGURE_FILES =3D &quot;meson.build&quot;<br>
&gt;<br>
&gt;=C2=A0 meson_do_configure() {<br>
&gt; +=C2=A0 =C2=A0 # Meson requires this to be &#39;bfd, &#39;lld&#39; or =
&#39;gold&#39; from 0.53 onwards<br>
&gt; +=C2=A0 =C2=A0 # <a href=3D"https://github.com/mesonbuild/meson/commit=
/ef9aeb188ea2bc7353e59916c18901cde90fa2b3" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18=
901cde90fa2b3</a><br>
&gt; +=C2=A0 =C2=A0 unset LD<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Work around &quot;Meson fails if /tmp is mounted=
 with noexec #2972&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;${B}/meson-private/tmp&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export TMPDIR=3D&quot;${B}/meson-private/tmp&quot;=
<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devt=
ools/meson/meson.inc<br>
&gt; index 881a14c7f0a..c0ce7d338bc 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; @@ -17,8 +17,8 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/meso=
nbuild/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV}=
/meson-${P</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mesonbuild-=
environment.py-check-environment-for-vari.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-modules-pyt=
hon.py-do-not-substitute-python-s-install.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;0c277472e49950a5537e3de3e60c57b80dbf4257=
88470a1a8ed27446128fc035&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;a5f0c99567d772508f649a28ded7f8ad&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;035e75993ab6fa6c9ebf902b835c64cf397a763e=
b8e65c9bb6e1cc9730a9d3f6&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;3a0313d040ded973d84cbec368c2e1d3&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Make-CPU-family-warnings-fatal.patch \=
<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-wa=
rnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family=
-warnings-fatal.patch<br>
&gt; index d4264cee526..74d5b4ca66e 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
fatal.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
fatal.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 8ce7a1ddbc9b7775568a98fcd50e39a01513c902 Mon Sep 17 00:00:00 200=
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
&gt; -index 29d7422..5fb00a4 100644<br>
&gt; +index 0f277a7..24578ea 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -190,7 +190,7 @@ class MachineInfo:<br>
&gt; +@@ -192,7 +192,7 @@ class MachineInfo:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_family =3D literal[&#39;cp=
u_family&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cpu_family not in known_cpu=
_families:<br>
&gt; @@ -25,15 +25,15 @@ index 29d7422..5fb00a4 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endian =3D literal[&#39;endian=
&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if endian not in (&#39;little&=
#39;, &#39;big&#39;):<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.=
py<br>
&gt; -index a9bc2b8..b91c8da 100644<br>
&gt; +index dc8b14f..3aab71e 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
&gt; str:<br>
&gt; +@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trial =3D &#39;parisc&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if trial not in known_cpu_families:<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown CPU famil=
y {!r}, please report this at &#39;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;<a href=3D"https://github.com/mesonbuild/meson/issues/new" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/meson/iss=
ues/new</a> with the&#39;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;<a href=3D"https://github.com/mesonbuild/meson/issues/new" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/meson/iss=
ues/new</a> with the &#39;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;output of `uname -a` and `cat /proc/cpuinfo`&#39;.format(=
trial))<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentException(&#39;Unk=
nown CPU family %s, see <a href=3D"https://wiki.yoctoproject.org/wiki/Meson=
/UnknownCPU" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject=
.org/wiki/Meson/UnknownCPU</a> for directions.&#39; % trial)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-n=
ot-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meso=
n/0001-python-module-do-not-manipulate-the-environment-when.patch<br>
&gt; index bf715d1e9f4..eb0e90dbdda 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-mani=
pulate-the-environment-when.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-mani=
pulate-the-environment-when.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 19 Nov 2018 14:24:26 +0100<br>
&gt;=C2=A0 Subject: [PATCH] python module: do not manipulate the environmen=
t when calling<br>
&gt; @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A01 file changed, 12 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/p=
ython.py<br>
&gt; -index 9cfbd6f..3ff687a 100644<br>
&gt; +index 07be318..b770603 100644<br>
&gt;=C2=A0 --- a/mesonbuild/modules/python.py<br>
&gt;=C2=A0 +++ b/mesonbuild/modules/python.py<br>
&gt; -@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):<br>
&gt; +@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ol=
d_pkg_libdir =3D os.environ.get(&#39;PKG_CONFIG_LIBDIR&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ol=
d_pkg_path =3D os.environ.get(&#39;PKG_CONFIG_PATH&#39;)<br>
&gt;<br>
&gt; @@ -25,10 +25,10 @@ index 9cfbd6f..3ff687a 100644<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.environ[&#39;PKG_CONFIG_LIBDIR&#39;] =3D pkg_libdir<br>
&gt;=C2=A0 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr=
y:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0self.pkgdep =3D PkgConfigDependency(&#39;python-{}&#39;.format(pkg_v=
ersion), environment, kwargs)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mlog.debug(&#39;Found &quot;python-{}&quot; via pkgconfig lookup in =
LIBPC ({})&#39;.format(pkg_version, pkg_libdir))<br>
&gt; -@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mlog.debug(&#39;&quot;python-{}&quot; could not be found in LIBPC ({=
})&#39;.format(pkg_version, pkg_libdir))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0self.pkgdep =3D PkgConfigDependency(pkg_name, environment, kwargs)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mlog.debug(&#39;Found &quot;{}&quot; via pkgconfig lookup in LIBPC (=
{})&#39;.format(pkg_name, pkg_libdir))<br>
&gt; +@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mlog.debug(&#39;&quot;{}&quot; could not be found in LIBPC ({})&#39;=
.format(pkg_name, pkg_libdir))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mlog.debug(e)<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if old_=
pkg_path is not None:<br>
&gt; @@ -39,5 +39,5 @@ index 9cfbd6f..3ff687a 100644<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<b=
r>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.environ.pop(&#39;PKG_CONFIG_LIBDIR&#39;, None)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.de=
bug(&#39;&quot;python-{}&quot; could not be found in LIBPC ({}), this is li=
kely due to a relocated python installation&#39;.format(pkg_version, pkg_li=
bdir))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.de=
bug(&#39;&quot;{}&quot; could not be found in LIBPC ({}), this is likely du=
e to a relocated python installation&#39;.format(pkg_name, pkg_libdir))<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-a=
llarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support=
-building-allarch-recipes-again.patch<br>
&gt; index c8c7b298de3..1529ebe9fea 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-=
recipes-again.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-=
recipes-again.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From cc6e47da801ce3c274485775c62784416fd22977 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" tar=
get=3D"_blank">pkj@axis.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Support building allarch recipes again<br>
&gt; @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mai=
lto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.=
com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<b=
r>
&gt; -index 5fb00a4..f5702ba 100644<br>
&gt; +index 24578ea..216e71f 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt;=C2=A0 @@ -36,6 +36,7 @@ _T =3D typing.TypeVar(&#39;_T&#39;)<br>
&gt; @@ -22,5 +22,5 @@ index 5fb00a4..f5702ba 100644<br>
&gt;=C2=A0 =C2=A0known_cpu_families =3D (<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 &#39;allarch&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;aarch64&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&#39;alpha&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arc&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;arm&#39;,<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patc=
h b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; index 14a9a136664..76c1aa9ac1c 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From af2554b9b08af973181b4e4181bd1cb936fdbb8f Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.riba=
lda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt;=C2=A0 Subject: [PATCH] native_bindir<br>
&gt; @@ -22,7 +22,7 @@ Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=
=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gma=
il.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 14 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/depend=
encies/base.py<br>
&gt; -index 35f0175..b39cba6 100644<br>
&gt; +index f17b9f2..b5c9c92 100644<br>
&gt;=C2=A0 --- a/mesonbuild/dependencies/base.py<br>
&gt;=C2=A0 +++ b/mesonbuild/dependencies/base.py<br>
&gt;=C2=A0 @@ -184,7 +184,7 @@ class Dependency:<br>
&gt; @@ -43,7 +43,7 @@ index 35f0175..b39cba6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#39=
;Method &quot;get_pkgconfig_variable()&quot; is &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;invalid =
for an internal dependency&#39;)<br>
&gt;<br>
&gt; -@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency):<=
br>
&gt; +@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDependency):<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s.format(self.__class__=
.__name__, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank=
">self.name</a>, self.is_found,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0self.version_reqs)<br>
&gt;<br>
&gt; @@ -65,7 +65,7 @@ index 35f0175..b39cba6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Always copy the environment =
since we&#39;re going to modify it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# with pkg-config variables<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if env is None:<br>
&gt; -@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; +@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targs =3D tuple(args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache =3D PkgConfigDependency.=
pkgbin_cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self.pkgbin, targs, fenv) =
not in cache:<br>
&gt; @@ -73,8 +73,8 @@ index 35f0175..b39cba6 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache[(self.pkgbin, t=
args, fenv)] =3D self._call_pkgbin_real(args, env, use_native)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cache[(self.pkgbin, tar=
gs, fenv)]<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args):<br>
&gt; -@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args: List[str]) -=
&gt; List[str]:<br>
&gt; +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(<a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.=
name</a>, out_raw))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args, self.raw_link_=
args =3D self._search_libs(out, out_raw)<br>
&gt;<br>
&gt; @@ -83,7 +83,7 @@ index 35f0175..b39cba6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#39;--variable=
=3D&#39; + variable_name, <a href=3D"http://self.name" rel=3D"noreferrer" t=
arget=3D"_blank">self.name</a>]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;define_variable&#39; i=
n kwargs:<br>
&gt; -@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; +@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#3=
9;--define-variable=3D&#39; + &#39;=3D&#39;.join(definition)] + options<br>
&gt;<br>
&gt; @@ -93,7 +93,7 @@ index 35f0175..b39cba6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.required=
:<br>
&gt;=C2=A0 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependen=
cies/ui.py<br>
&gt; -index 6d784e6..73a9e13 100644<br>
&gt; +index bdcc4a7..e2de847 100644<br>
&gt;=C2=A0 --- a/mesonbuild/dependencies/ui.py<br>
&gt;=C2=A0 +++ b/mesonbuild/dependencies/ui.py<br>
&gt;=C2=A0 @@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):<=
br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.52.=
1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.1.bb</a> b/meta/recip=
es-devtools/meson/<a href=3D"http://meson_0.53.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">meson_0.53.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.52.1=
.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.1.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.53.0.b=
b" rel=3D"noreferrer" target=3D"_blank">meson_0.53.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-m=
eson_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52.1=
.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.5=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.0.bb</a><=
br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-me=
son_0.52.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52.1.=
bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meso=
n_0.53.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.53.0.bb=
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
</blockquote></div></div>

--000000000000d438bf059cd09f33--
