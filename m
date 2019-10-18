Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id C188360720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 18:50:05 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id n2so2021077ual.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eBF+njmQVvDjSDmN6C+actKLk3Ipuq4yMjoQxHoAOPo=;
	b=RdazaBoZu6oWcjqiXfnv1eNMLeklzHLimAu7A2Mqu8xPO9exV2T+5uAhNil6Vh85aQ
	KEfcRtxWAHWNNpLHPGGqWB2dKWViSwnnb89NSsDpOyKFKMfrhKvrEd6BvoYfs4Arkuoz
	5kOUcnp0EXe6gOBW6Fzv8uuvJCJ5h5oiBUbn4tKpCA4OC0Vz3catA6mo0WqONFqdbooC
	avjnsKSfWq6tUy3njFHiAAm1K6RH5Kqu+14dxzp6IgB37gp6AR4CRJiUIoY4ywOS2i+o
	A8iUIyaW4GskeZlJXYDqAbms26YVZah6MVr8FdM6GoX2hvB4Yrks1K7fgwSX2dxs0r4+
	upRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eBF+njmQVvDjSDmN6C+actKLk3Ipuq4yMjoQxHoAOPo=;
	b=Kn7jn3gyyjSYGSX+/eeMfM6UBFk4jMOtKv8KItmyoQLVuwfdcCt3TyfXfWMaWvc5qL
	QaSZKKxywUMnCz9ehGsRtPdaxNd9LnIDhNtUA/0c3XQ2QakPyRZo9TMhr5GWJlqsFsho
	UaAQXGGdJz0AcqxdUyCMKnqCGCLwe+7K0G8g9EvDcWyNb/T9JaWkz7yKLddJoQgolLCH
	Xq/FROIkzIGqajeN9mzbBU1z4MdDSz5R9+c7PEzntbgfskeI4C7E2r3qlVe/J9mqySCg
	LLNJw8paND6Xg/AXG0U77YNoPEttckIJNNPr44APfubfwJbcsV/5i6QCs4yL3twzr1et
	eH6A==
X-Gm-Message-State: APjAAAX5NReYmG+z1pYOCwAVCxn7JkrVZzotKEuAoyj/lcl6vGMdLFXR
	Nu8xoseq7uTBzU6athuhkIG/pxKXLiNrJktgZLY=
X-Google-Smtp-Source: APXvYqxCoqLaNYBddrrYTbKnIGIdyZYqSAtBMqI/kQ3v91p/Qqs83GbwdD4j13bDprpKX+dPoWoS0hVcdJDoVDQ0HGA=
X-Received: by 2002:ab0:348c:: with SMTP id c12mr1845162uar.100.1571424606246; 
	Fri, 18 Oct 2019 11:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
In-Reply-To: <CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Oct 2019 20:49:54 +0200
Message-ID: <CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Fri, 18 Oct 2019 18:50:06 -0000
Content-Type: multipart/alternative; boundary="000000000000725d4a059533cddb"

--000000000000725d4a059533cddb
Content-Type: text/plain; charset="UTF-8"

I certainly don't mean to ignore those reports, it's just that due to my
ongoing health problems, and having to dedicate most of my energy to the
day job (https://mbition.io/en/home/), I am not currently able to work on
the upstream issues in a timely manner the way I used to when maintaining
core was actually my day job (at Intel).

The question of how much effort people who update things in core should
allocate to fixing 'other' layers has been a conflict point for a long
time. I'd prefer to see more aggressive blacklisting/removal of recipes
that no one has an interest in fixing and updating.

Alex

On Thu, 17 Oct 2019 at 15:15, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Oct 12, 2019 at 5:20 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, 2019-10-11 at 13:47 +0200, Alexander Kanavin wrote:
> > > Drop backported patches.
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  meta/recipes-devtools/meson/meson.inc         |  7 +--
> > >  ...efined-by-the-existance-of-a-cross-f.patch | 28 -----------
> > >  .../0001-Make-CPU-family-warnings-fatal.patch |  8 +--
> > >  ...etect-windows-also-if-the-system-str.patch | 29 -----------
> > >  ...sues-that-arise-when-cross-compiling.patch |  8 +--
> > >  ...pport-building-allarch-recipes-again.patch |  4 +-
> > >  .../meson/meson/0003-native_bindir.patch      | 20 ++++----
> > >  .../meson/meson/vala-cross-compile.patch      | 50 ---------------
> >
> > meson 0.52.x seems to be exposing the dconf build issue.
> >
> > https://errors.yoctoproject.org/Errors/Details/273492/
> >
> > also reported here
> > https://gitlab.gnome.org/GNOME/dconf/issues/59
> >
>
>
> Regardless of this report, this is now merged and I don't see any
> resolution either of a followup
> from the submitter or any other developer. This is quite disheartening
> since it takes a lot of effort to find
> these issues and reports. we should try to be considerate of the
> layers who are trying to keep up with
> OE-Core, like this we won't be able to improve the quality of these
> layers. I understand that there are no breakages seen in OE-cor but we
> should encourage more
> of other layers to test master and especially if there are reports
> than it would be good to heed to them.
>
>
> > > ----
> > >  .../{meson_0.51.2.bb => meson_0.52.0.bb}      |  1 -
> > >  ...on_0.51.2.bb => nativesdk-meson_0.52.0.bb} |  0
> > >  10 files changed, 22 insertions(+), 133 deletions(-)
> > >  delete mode 100644 meta/recipes-devtools/meson/meson/0001-Cross-
> > > build-is-defined-by-the-existance-of-a-cross-f.patch
> > >  delete mode 100644 meta/recipes-devtools/meson/meson/0001-
> > > environment.py-detect-windows-also-if-the-system-str.patch
> > >  delete mode 100644 meta/recipes-devtools/meson/meson/vala-cross-
> > > compile.patch
> > >  rename meta/recipes-devtools/meson/{meson_0.51.2.bb =>
> > > meson_0.52.0.bb} (97%)
> > >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.51.2.bb =>
> > > nativesdk-meson_0.52.0.bb} (100%)
> > >
> > > diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-
> > > devtools/meson/meson.inc
> > > index 8219d87c741..ae0091c051c 100644
> > > --- a/meta/recipes-devtools/meson/meson.inc
> > > +++ b/meta/recipes-devtools/meson/meson.inc
> > > @@ -14,14 +14,11 @@ SRC_URI = "
> > > https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> > >             file://0001-python-module-do-not-manipulate-the-
> > > environment-when.patch \
> > >             file://disable-rpath-handling.patch \
> > >             file://cross-prop-default.patch \
> > > -           file://0001-environment.py-detect-windows-also-if-the-
> > > system-str.patch \
> > > -           file://0001-Cross-build-is-defined-by-the-existance-of-a-
> > > cross-f.patch \
> > >             file://0001-mesonbuild-environment.py-check-environment-
> > > for-vari.patch \
> > >             file://0001-modules-python.py-do-not-substitute-python-s-
> > > install.patch \
> > > -           file://vala-cross-compile.patch \
> > >             "
> > > -SRC_URI[sha256sum] =
> > > "23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76"
> > > -SRC_URI[md5sum] = "d46c4a8e3cfd27f90e2c6fe4a69e574b"
> > > +SRC_URI[sha256sum] =
> > > "d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32"
> > > +SRC_URI[md5sum] = "7ea7772414dda8ae11072244bf7ba991"
> > >
> > >  SRC_URI_append_class-native = " \
> > >      file://0001-Make-CPU-family-warnings-fatal.patch \
> > > diff --git a/meta/recipes-devtools/meson/meson/0001-Cross-build-is-
> > > defined-by-the-existance-of-a-cross-f.patch b/meta/recipes-
> > > devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-
> > > a-cross-f.patch
> > > deleted file mode 100644
> > > index a5dbb81b088..00000000000
> > > --- a/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-
> > > by-the-existance-of-a-cross-f.patch
> > > +++ /dev/null
> > > @@ -1,28 +0,0 @@
> > > -Upstream-Status: Backport
> > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > -
> > > -From 0b4d1e8afd5428a495f8624ee061f63977b4c268 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Jussi Pakkanen <jpakkane@gmail.com>
> > > -Date: Sun, 6 Oct 2019 15:17:32 +0300
> > > -Subject: [PATCH] Cross build is defined by the existance of a cross
> > > file.
> > > -
> > > ----
> > > - mesonbuild/environment.py | 2 +-
> > > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > > -index e5d041b4..03c65688 100644
> > > ---- a/mesonbuild/environment.py
> > > -+++ b/mesonbuild/environment.py
> > > -@@ -611,7 +611,7 @@ class Environment:
> > > -         self.first_invocation = True
> > > -
> > > -     def is_cross_build(self) -> bool:
> > > --        return not
> > > self.machines.matches_build_machine(MachineChoice.HOST)
> > > -+        return self.coredata.is_cross_build()
> > > -
> > > -     def dump_coredata(self):
> > > -         return coredata.save(self.coredata, self.get_build_dir())
> > > ---
> > > -2.20.1
> > > -
> > > diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> > > warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-
> > > CPU-family-warnings-fatal.patch
> > > index 444fc081686..fc55dcacf6d 100644
> > > --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> > > warnings-fatal.patch
> > > +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> > > warnings-fatal.patch
> > > @@ -1,4 +1,4 @@
> > > -From f70fee13e4dbc757cd8153cd42d92fa9394fb542 Mon Sep 17 00:00:00
> > > 2001
> > > +From c07d29b715209cd5d75b142a00a540d45b00c36d Mon Sep 17 00:00:00
> > > 2001
> > >  From: Ross Burton <ross.burton@intel.com>
> > >  Date: Tue, 3 Jul 2018 13:59:09 +0100
> > >  Subject: [PATCH] Make CPU family warnings fatal
> > > @@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
> > >   2 files changed, 2 insertions(+), 4 deletions(-)
> > >
> > >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > > -index 03c6346..86b350b 100644
> > > +index a59cd89..17de654 100644
> > >  --- a/mesonbuild/envconfig.py
> > >  +++ b/mesonbuild/envconfig.py
> > >  @@ -186,7 +186,7 @@ class MachineInfo:
> > > @@ -25,10 +25,10 @@ index 03c6346..86b350b 100644
> > >           endian = literal['endian']
> > >           if endian not in ('little', 'big'):
> > >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > > -index 0cfdf9c..40aa189 100644
> > > +index 3704921..f1988f2 100644
> > >  --- a/mesonbuild/environment.py
> > >  +++ b/mesonbuild/environment.py
> > > -@@ -262,9 +262,7 @@ def detect_cpu_family(compilers: CompilersDict)
> > > -> str:
> > > +@@ -251,9 +251,7 @@ def detect_cpu_family(compilers: CompilersDict)
> > > -> str:
> > >           trial = 'parisc'
> > >
> > >       if trial not in known_cpu_families:
> > > diff --git a/meta/recipes-devtools/meson/meson/0001-environment.py-
> > > detect-windows-also-if-the-system-str.patch b/meta/recipes-
> > > devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-
> > > system-str.patch
> > > deleted file mode 100644
> > > index 2faeda2e711..00000000000
> > > --- a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-
> > > windows-also-if-the-system-str.patch
> > > +++ /dev/null
> > > @@ -1,29 +0,0 @@
> > > -From b52e47c9d61dc4c930cfc7236fbeb70338c3b953 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > -Date: Mon, 25 Mar 2019 17:17:06 +0100
> > > -Subject: [PATCH] environment.py: detect windows also if the system
> > > string
> > > - contains 'mingw'
> > > -
> > > -Upstream-Status: Backport [fe645a0a9e2da230d2c500af1f5b2db5da1e364d]
> > > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > -
> > > ----
> > > - mesonbuild/envconfig.py | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > > -index 03c6346..a59cd89 100644
> > > ---- a/mesonbuild/envconfig.py
> > > -+++ b/mesonbuild/envconfig.py
> > > -@@ -198,7 +198,7 @@ class MachineInfo:
> > > -         """
> > > -         Machine is windows?
> > > -         """
> > > --        return self.system in {'windows', 'mingw'}
> > > -+        return self.system == 'windows' or 'mingw' in self.system
> > > -
> > > -     def is_cygwin(self) -> bool:
> > > -         """
> > > ---
> > > -2.17.1
> > > -
> > > diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-
> > > issues-that-arise-when-cross-compiling.patch b/meta/recipes-
> > > devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-
> > > compiling.patch
> > > index 7c3238bf91a..471f1500daa 100644
> > > --- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-
> > > arise-when-cross-compiling.patch
> > > +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-
> > > arise-when-cross-compiling.patch
> > > @@ -1,4 +1,4 @@
> > > -From 1afbf5ccff56e582229c8f673f50aedf2b24117e Mon Sep 17 00:00:00
> > > 2001
> > > +From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00
> > > 2001
> > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > >  Date: Fri, 4 Aug 2017 16:16:41 +0300
> > >  Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
> > > @@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <
> > > alex.kanavin@gmail.com>
> > >   1 file changed, 4 insertions(+)
> > >
> > >  diff --git a/mesonbuild/modules/gnome.py
> > > b/mesonbuild/modules/gnome.py
> > > -index bf49770..7c5a363 100644
> > > +index bcf77b9..6a4b472 100644
> > >  --- a/mesonbuild/modules/gnome.py
> > >  +++ b/mesonbuild/modules/gnome.py
> > > -@@ -972,6 +972,10 @@ This will become a hard error in the
> > > future.''')
> > > -                 '--mode=' + mode]
> > > +@@ -974,6 +974,10 @@ This will become a hard error in the
> > > future.''')
> > > +             args.append('--{}={}'.format(program_name, path))
> > >           if namespace:
> > >               args.append('--namespace=' + namespace)
> > >  +        gtkdoc_exe_wrapper =
> > > state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> > > diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-
> > > allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-
> > > Support-building-allarch-recipes-again.patch
> > > index 8ad86a46e99..b8837d77b64 100644
> > > --- a/meta/recipes-devtools/meson/meson/0002-Support-building-
> > > allarch-recipes-again.patch
> > > +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-
> > > allarch-recipes-again.patch
> > > @@ -1,4 +1,4 @@
> > > -From 3009a1c2f1b736b836a057d84dc11f379cba99cf Mon Sep 17 00:00:00
> > > 2001
> > > +From 263fc0e26e1fd92e25fa3ef93f4a549dcebc5887 Mon Sep 17 00:00:00
> > > 2001
> > >  From: Peter Kjellerstedt <pkj@axis.com>
> > >  Date: Thu, 26 Jul 2018 16:32:49 +0200
> > >  Subject: [PATCH] Support building allarch recipes again
> > > @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <
> > > peter.kjellerstedt@axis.com>
> > >   1 file changed, 1 insertion(+)
> > >
> > >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > > -index 86b350b..aa426ca 100644
> > > +index 17de654..2d2deef 100644
> > >  --- a/mesonbuild/envconfig.py
> > >  +++ b/mesonbuild/envconfig.py
> > >  @@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
> > > diff --git a/meta/recipes-devtools/meson/meson/0003-
> > > native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-
> > > native_bindir.patch
> > > index 57de598d2f1..76cc4931d63 100644
> > > --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > > +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > > @@ -1,4 +1,4 @@
> > > -From ac38495de38a1ea42e2bc09a2f23c2e945fbc22d Mon Sep 17 00:00:00
> > > 2001
> > > +From 4a1d676522d6b56cbe9a45c3b040afaa27d37f78 Mon Sep 17 00:00:00
> > > 2001
> > >  From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > >  Date: Wed, 15 Nov 2017 15:05:01 +0100
> > >  Subject: [PATCH] native_bindir
> > > @@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado <
> > > ricardo.ribalda@gmail.com>
> > >   2 files changed, 14 insertions(+), 11 deletions(-)
> > >
> > >  diff --git a/mesonbuild/dependencies/base.py
> > > b/mesonbuild/dependencies/base.py
> > > -index 21da8e2..7d1ef85 100644
> > > +index 3c55a56..eb52fd1 100644
> > >  --- a/mesonbuild/dependencies/base.py
> > >  +++ b/mesonbuild/dependencies/base.py
> > > -@@ -155,7 +155,7 @@ class Dependency:
> > > +@@ -185,7 +185,7 @@ class Dependency:
> > >       def get_exe_args(self, compiler):
> > >           return []
> > >
> > > @@ -34,7 +34,7 @@ index 21da8e2..7d1ef85 100644
> > >           raise DependencyException('{!r} is not a pkgconfig
> > > dependency'.format(self.name))
> > >
> > >       def get_configtool_variable(self, variable_name):
> > > -@@ -214,7 +214,7 @@ class InternalDependency(Dependency):
> > > +@@ -248,7 +248,7 @@ class InternalDependency(Dependency):
> > >           self.sources = sources
> > >           self.ext_deps = ext_deps
> > >
> > > @@ -43,7 +43,7 @@ index 21da8e2..7d1ef85 100644
> > >           raise DependencyException('Method
> > > "get_pkgconfig_variable()" is '
> > >                                     'invalid for an internal
> > > dependency')
> > >
> > > -@@ -639,15 +639,18 @@ class PkgConfigDependency(ExternalDependency):
> > > +@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency):
> > >           return s.format(self.__class__.__name__, self.name,
> > > self.is_found,
> > >                           self.version_reqs)
> > >
> > > @@ -65,7 +65,7 @@ index 21da8e2..7d1ef85 100644
> > >           # Always copy the environment since we're going to modify
> > > it
> > >           # with pkg-config variables
> > >           if env is None:
> > > -@@ -663,7 +666,7 @@ class PkgConfigDependency(ExternalDependency):
> > > +@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):
> > >           targs = tuple(args)
> > >           cache = PkgConfigDependency.pkgbin_cache
> > >           if (self.pkgbin, targs, fenv) not in cache:
> > > @@ -74,16 +74,16 @@ index 21da8e2..7d1ef85 100644
> > >           return cache[(self.pkgbin, targs, fenv)]
> > >
> > >       def _convert_mingw_paths(self, args):
> > > -@@ -845,7 +848,7 @@ class PkgConfigDependency(ExternalDependency):
> > > -                                       (self.name, out_raw))
> > > -         self.link_args, self.raw_link_args = self._search_libs(out,
> > > out_raw)
> > > +@@ -926,7 +929,7 @@ class PkgConfigDependency(ExternalDependency):
> > > +             mlog.warning('Could not determine complete list of
> > > dependencies for %s' % self.name)
> > > +         self.link_args, self.raw_link_args = self._search_libs(out,
> > > out_raw, out_all)
> > >
> > >  -    def get_pkgconfig_variable(self, variable_name, kwargs):
> > >  +    def get_pkgconfig_variable(self, variable_name, kwargs,
> > > use_native=False):
> > >           options = ['--variable=' + variable_name, self.name]
> > >
> > >           if 'define_variable' in kwargs:
> > > -@@ -858,7 +861,7 @@ class PkgConfigDependency(ExternalDependency):
> > > +@@ -939,7 +942,7 @@ class PkgConfigDependency(ExternalDependency):
> > >
> > >               options = ['--define-variable=' + '='.join(definition)]
> > > + options
> > >
> > > diff --git a/meta/recipes-devtools/meson/meson/vala-cross-
> > > compile.patch b/meta/recipes-devtools/meson/meson/vala-cross-
> > > compile.patch
> > > deleted file mode 100644
> > > index 816f810c054..00000000000
> > > --- a/meta/recipes-devtools/meson/meson/vala-cross-compile.patch
> > > +++ /dev/null
> > > @@ -1,50 +0,0 @@
> > > -From 77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d Mon Sep 17 00:00:00
> > > 2001
> > > -From: James Westman <flyingpimonster@flyingpimonster.net>
> > > -Date: Mon, 24 Jun 2019 12:04:12 -0500
> > > -Subject: [PATCH] Fix two errors when cross-compiling with Vala
> > > -
> > > -- AttributeError: 'ValaCompiler' object has no attribute
> > > 'get_program_dirs'
> > > -
> > > -  Fixed by adding a `get_program_dirs()` function to the base
> > > Compiler
> > > -  class, to match `get_library_dirs()`
> > > -
> > > -- KeyError: 'vala_COMPILER'
> > > -
> > > -  Fixed by creating the Vala compile rules for all machines, not
> > > just
> > > -  the build machine.
> > > -
> > > -Upstream-Status: Backport [
> > >
> https://github.com/mesonbuild/meson/commit/77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d
> > > ]
> > > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ----
> > > - mesonbuild/backend/ninjabackend.py | 3 +--
> > > - mesonbuild/compilers/compilers.py  | 3 +++
> > > - 2 files changed, 4 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/mesonbuild/backend/ninjabackend.py
> > > b/mesonbuild/backend/ninjabackend.py
> > > -index a454e6ab5f..b830e377e4 100644
> > > ---- a/mesonbuild/backend/ninjabackend.py
> > > -+++ b/mesonbuild/backend/ninjabackend.py
> > > -@@ -1653,8 +1653,7 @@ def generate_compile_rule_for(self, langname,
> > > compiler):
> > > -                 self.generate_cs_compile_rule(compiler)
> > > -             return
> > > -         if langname == 'vala':
> > > --            if
> > > self.environment.machines.matches_build_machine(compiler.for_machine)
> > > :
> > > --                self.generate_vala_compile_rules(compiler)
> > > -+            self.generate_vala_compile_rules(compiler)
> > > -             return
> > > -         if langname == 'rust':
> > > -             self.generate_rust_compile_rules(compiler)
> > > -diff --git a/mesonbuild/compilers/compilers.py
> > > b/mesonbuild/compilers/compilers.py
> > > -index 5855de71c8..86c1e33407 100644
> > > ---- a/mesonbuild/compilers/compilers.py
> > > -+++ b/mesonbuild/compilers/compilers.py
> > > -@@ -1117,6 +1117,9 @@ def find_library(self, *args, **kwargs):
> > > -     def get_library_dirs(self, *args, **kwargs):
> > > -         return ()
> > > -
> > > -+    def get_program_dirs(self, *args, **kwargs):
> > > -+        return ()
> > > -+
> > > -     def has_multi_arguments(self, args, env) -> Tuple[bool, bool]:
> > > -         raise EnvironmentException(
> > > -             'Language {} does not support
> > > has_multi_arguments.'.format(
> > > diff --git a/meta/recipes-devtools/meson/meson_0.51.2.bb
> > > b/meta/recipes-devtools/meson/meson_0.52.0.bb
> > > similarity index 97%
> > > rename from meta/recipes-devtools/meson/meson_0.51.2.bb
> > > rename to meta/recipes-devtools/meson/meson_0.52.0.bb
> > > index de9b905c12b..897fa148d94 100644
> > > --- a/meta/recipes-devtools/meson/meson_0.51.2.bb
> > > +++ b/meta/recipes-devtools/meson/meson_0.52.0.bb
> > > @@ -1,4 +1,3 @@
> > >  include meson.inc
> > >
> > >  BBCLASSEXTEND = "native"
> > > -
> > > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.51.2.bb
> > > b/meta/recipes-devtools/meson/nativesdk-meson_0.52.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/meson/nativesdk-meson_0.51.2.bb
> > > rename to meta/recipes-devtools/meson/nativesdk-meson_0.52.0.bb
> > > --
> > > 2.17.1
> > >
> >
>

--000000000000725d4a059533cddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I certainly don&#39;t mean to ignore those reports, i=
t&#39;s just that due to my ongoing health problems, and having to dedicate=
 most of my energy to the day job (<a href=3D"https://mbition.io/en/home/">=
https://mbition.io/en/home/</a>), I am not currently able to work on the up=
stream issues in a timely manner the way I used to when maintaining core wa=
s actually my day job (at Intel).</div><div><br></div><div>The question of =
how much effort people who update things in core should allocate to fixing =
&#39;other&#39; layers has been a conflict point for a long time. I&#39;d p=
refer to see more aggressive blacklisting/removal of recipes that no one ha=
s an interest in fixing and updating.<br></div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, 17 Oct 2019 at 15:15, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Sat, Oct 12, 2019 at 5:20 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 2019-10-11 at 13:47 +0200, Alexander Kanavin wrote:<br>
&gt; &gt; Drop backported patches.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 +--<br>
&gt; &gt;=C2=A0 ...efined-by-the-existance-of-a-cross-f.patch | 28 --------=
---<br>
&gt; &gt;=C2=A0 .../0001-Make-CPU-family-warnings-fatal.patch |=C2=A0 8 +--=
<br>
&gt; &gt;=C2=A0 ...etect-windows-also-if-the-system-str.patch | 29 --------=
---<br>
&gt; &gt;=C2=A0 ...sues-that-arise-when-cross-compiling.patch |=C2=A0 8 +--=
<br>
&gt; &gt;=C2=A0 ...pport-building-allarch-recipes-again.patch |=C2=A0 4 +-<=
br>
&gt; &gt;=C2=A0 .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=
=A0 | 20 ++++----<br>
&gt; &gt;=C2=A0 .../meson/meson/vala-cross-compile.patch=C2=A0 =C2=A0 =C2=
=A0 | 50 ---------------<br>
&gt;<br>
&gt; meson 0.52.x seems to be exposing the dconf build issue.<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/273492/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/273492/</a><br>
&gt;<br>
&gt; also reported here<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/dconf/issues/59" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/dconf/issues/59</a=
><br>
&gt;<br>
<br>
<br>
Regardless of this report, this is now merged and I don&#39;t see any<br>
resolution either of a followup<br>
from the submitter or any other developer. This is quite disheartening<br>
since it takes a lot of effort to find<br>
these issues and reports. we should try to be considerate of the<br>
layers who are trying to keep up with<br>
OE-Core, like this we won&#39;t be able to improve the quality of these<br>
layers. I understand that there are no breakages seen in OE-cor but we<br>
should encourage more<br>
of other layers to test master and especially if there are reports<br>
than it would be good to heed to them.<br>
<br>
<br>
&gt; &gt; ----<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://meson_0.51.2.bb" rel=3D"noreferrer" =
target=3D"_blank">meson_0.51.2.bb</a> =3D&gt; <a href=3D"http://meson_0.52.=
0.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://on_0.51.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">on_0.51.2.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.5=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52.0.bb</a>}=
 |=C2=A0 0<br>
&gt; &gt;=C2=A0 10 files changed, 22 insertions(+), 133 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/0001-C=
ross-<br>
&gt; &gt; build-is-defined-by-the-existance-of-a-cross-f.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/0001-<=
br>
&gt; &gt; environment.py-detect-windows-also-if-the-system-str.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/vala-c=
ross-<br>
&gt; &gt; compile.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson=
_0.51.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.51.2.bb</a> =3D&gt=
;<br>
&gt; &gt; <a href=3D"http://meson_0.52.0.bb" rel=3D"noreferrer" target=3D"_=
blank">meson_0.52.0.bb</a>} (97%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativ=
esdk-meson_0.51.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_=
0.51.2.bb</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://nativesdk-meson_0.52.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nativesdk-meson_0.52.0.bb</a>} (100%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes=
-<br>
&gt; &gt; devtools/meson/meson.inc<br>
&gt; &gt; index 8219d87c741..ae0091c051c 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; &gt; @@ -14,14 +14,11 @@ SRC_URI =3D &quot;<br>
&gt; &gt; <a href=3D"https://github.com/mesonbuild/meson/releases/download/=
$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/mesonbuild/meson/releases/download/${PV}/meson-${P</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python=
-module-do-not-manipulate-the-<br>
&gt; &gt; environment-when.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-rpa=
th-handling.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-prop-=
default.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-environment=
.py-detect-windows-also-if-the-<br>
&gt; &gt; system-str.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Cross-build=
-is-defined-by-the-existance-of-a-<br>
&gt; &gt; cross-f.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mesonb=
uild-environment.py-check-environment-<br>
&gt; &gt; for-vari.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-module=
s-python.py-do-not-substitute-python-s-<br>
&gt; &gt; install.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vala-cross-compi=
le.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e8=
92d76&quot;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;d46c4a8e3cfd27f90e2c6fe4a69e574b&quot;=
<br>
&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef49=
38d32&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;7ea7772414dda8ae11072244bf7ba991&quot;=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Make-CPU-family-warnings-fatal.pa=
tch \<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Cross-build-i=
s-<br>
&gt; &gt; defined-by-the-existance-of-a-cross-f.patch b/meta/recipes-<br>
&gt; &gt; devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance=
-of-<br>
&gt; &gt; a-cross-f.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index a5dbb81b088..00000000000<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defin=
ed-<br>
&gt; &gt; by-the-existance-of-a-cross-f.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,28 +0,0 @@<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -From 0b4d1e8afd5428a495f8624ee061f63977b4c268 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Jussi Pakkanen &lt;<a href=3D"mailto:jpakkane@gmail.com" t=
arget=3D"_blank">jpakkane@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Sun, 6 Oct 2019 15:17:32 +0300<br>
&gt; &gt; -Subject: [PATCH] Cross build is defined by the existance of a cr=
oss<br>
&gt; &gt; file.<br>
&gt; &gt; -<br>
&gt; &gt; ----<br>
&gt; &gt; - mesonbuild/environment.py | 2 +-<br>
&gt; &gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/mesonbuild/environment.py b/mesonbuild/environment.=
py<br>
&gt; &gt; -index e5d041b4..03c65688 100644<br>
&gt; &gt; ---- a/mesonbuild/environment.py<br>
&gt; &gt; -+++ b/mesonbuild/environment.py<br>
&gt; &gt; -@@ -611,7 +611,7 @@ class Environment:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.first_invocation =3D True=
<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def is_cross_build(self) -&gt; bool:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return not<br>
&gt; &gt; self.machines.matches_build_machine(MachineChoice.HOST)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.coredata.is_cross_build=
()<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def dump_coredata(self):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return coredata.save(self.core=
data, self.get_build_dir())<br>
&gt; &gt; ---<br>
&gt; &gt; -2.20.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-fami=
ly-<br>
&gt; &gt; warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Mak=
e-<br>
&gt; &gt; CPU-family-warnings-fatal.patch<br>
&gt; &gt; index 444fc081686..fc55dcacf6d 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-<br>
&gt; &gt; warnings-fatal.patch<br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-<br>
&gt; &gt; warnings-fatal.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From f70fee13e4dbc757cd8153cd42d92fa9394fb542 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From c07d29b715209cd5d75b142a00a540d45b00c36d Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.c=
om" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Tue, 3 Jul 2018 13:59:09 +0100<br>
&gt; &gt;=C2=A0 Subject: [PATCH] Make CPU family warnings fatal<br>
&gt; &gt; @@ -12,7 +12,7 @@ Signed-off-by: Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br=
>
&gt; &gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig=
.py<br>
&gt; &gt; -index 03c6346..86b350b 100644<br>
&gt; &gt; +index a59cd89..17de654 100644<br>
&gt; &gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt; &gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; &gt;=C2=A0 @@ -186,7 +186,7 @@ class MachineInfo:<br>
&gt; &gt; @@ -25,10 +25,10 @@ index 03c6346..86b350b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endian =3D literal[&#39;e=
ndian&#39;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if endian not in (&#39;li=
ttle&#39;, &#39;big&#39;):<br>
&gt; &gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environ=
ment.py<br>
&gt; &gt; -index 0cfdf9c..40aa189 100644<br>
&gt; &gt; +index 3704921..f1988f2 100644<br>
&gt; &gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt; &gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; &gt; -@@ -262,9 +262,7 @@ def detect_cpu_family(compilers: CompilersDi=
ct)<br>
&gt; &gt; -&gt; str:<br>
&gt; &gt; +@@ -251,9 +251,7 @@ def detect_cpu_family(compilers: CompilersDi=
ct)<br>
&gt; &gt; -&gt; str:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trial =3D &#39;parisc&#39=
;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if trial not in known_cpu_families:<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/0001-environment.p=
y-<br>
&gt; &gt; detect-windows-also-if-the-system-str.patch b/meta/recipes-<br>
&gt; &gt; devtools/meson/meson/0001-environment.py-detect-windows-also-if-t=
he-<br>
&gt; &gt; system-str.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 2faeda2e711..00000000000<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/0001-environment.py-detec=
t-<br>
&gt; &gt; windows-also-if-the-system-str.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,29 +0,0 @@<br>
&gt; &gt; -From b52e47c9d61dc4c930cfc7236fbeb70338c3b953 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 25 Mar 2019 17:17:06 +0100<br>
&gt; &gt; -Subject: [PATCH] environment.py: detect windows also if the syst=
em<br>
&gt; &gt; string<br>
&gt; &gt; - contains &#39;mingw&#39;<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [fe645a0a9e2da230d2c500af1f5b2db5da1e3=
64d]<br>
&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; ----<br>
&gt; &gt; - mesonbuild/envconfig.py | 2 +-<br>
&gt; &gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<b=
r>
&gt; &gt; -index 03c6346..a59cd89 100644<br>
&gt; &gt; ---- a/mesonbuild/envconfig.py<br>
&gt; &gt; -+++ b/mesonbuild/envconfig.py<br>
&gt; &gt; -@@ -198,7 +198,7 @@ class MachineInfo:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Machine is windows?<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.system in {&#39;windows=
&#39;, &#39;mingw&#39;}<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.system =3D=3D &#39;wind=
ows&#39; or &#39;mingw&#39; in self.system<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def is_cygwin(self) -&gt; bool:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.17.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-<b=
r>
&gt; &gt; issues-that-arise-when-cross-compiling.patch b/meta/recipes-<br>
&gt; &gt; devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross=
-<br>
&gt; &gt; compiling.patch<br>
&gt; &gt; index 7c3238bf91a..471f1500daa 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-th=
at-<br>
&gt; &gt; arise-when-cross-compiling.patch<br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-th=
at-<br>
&gt; &gt; arise-when-cross-compiling.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From 1afbf5ccff56e582229c8f673f50aedf2b24117e Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
&gt; &gt;=C2=A0 Subject: [PATCH] gtkdoc: fix issues that arise when cross-c=
ompiling<br>
&gt; &gt; @@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin &lt;<br>
&gt; &gt; <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/mesonbuild/modules/gnome.py<br>
&gt; &gt; b/mesonbuild/modules/gnome.py<br>
&gt; &gt; -index bf49770..7c5a363 100644<br>
&gt; &gt; +index bcf77b9..6a4b472 100644<br>
&gt; &gt;=C2=A0 --- a/mesonbuild/modules/gnome.py<br>
&gt; &gt;=C2=A0 +++ b/mesonbuild/modules/gnome.py<br>
&gt; &gt; -@@ -972,6 +972,10 @@ This will become a hard error in the<br>
&gt; &gt; future.&#39;&#39;&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;--mode=3D&#39; + mode]<br>
&gt; &gt; +@@ -974,6 +974,10 @@ This will become a hard error in the<br>
&gt; &gt; future.&#39;&#39;&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(&#39=
;--{}=3D{}&#39;.format(program_name, path))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if namespace:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append=
(&#39;--namespace=3D&#39; + namespace)<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D<br>
&gt; &gt; state.environment.properties.host.get(&#39;gtkdoc_exe_wrapper&#39=
;, None)<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/0002-Support-build=
ing-<br>
&gt; &gt; allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0=
002-<br>
&gt; &gt; Support-building-allarch-recipes-again.patch<br>
&gt; &gt; index 8ad86a46e99..b8837d77b64 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/0002-Support-building-<br=
>
&gt; &gt; allarch-recipes-again.patch<br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-<br=
>
&gt; &gt; allarch-recipes-again.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From 3009a1c2f1b736b836a057d84dc11f379cba99cf Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From 263fc0e26e1fd92e25fa3ef93f4a549dcebc5887 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt;=C2=A0 From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com=
" target=3D"_blank">pkj@axis.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt; &gt;=C2=A0 Subject: [PATCH] Support building allarch recipes again<br>
&gt; &gt; @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt &lt;<br>
&gt; &gt; <a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">=
peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig=
.py<br>
&gt; &gt; -index 86b350b..aa426ca 100644<br>
&gt; &gt; +index 17de654..2d2deef 100644<br>
&gt; &gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt; &gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; &gt;=C2=A0 @@ -36,6 +36,7 @@ _T =3D typing.TypeVar(&#39;_T&#39;)<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/0003-<br>
&gt; &gt; native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-<br>
&gt; &gt; native_bindir.patch<br>
&gt; &gt; index 57de598d2f1..76cc4931d63 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<=
br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<=
br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From ac38495de38a1ea42e2bc09a2f23c2e945fbc22d Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From 4a1d676522d6b56cbe9a45c3b040afaa27d37f78 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt;=C2=A0 From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo=
.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt; &gt;=C2=A0 Subject: [PATCH] native_bindir<br>
&gt; &gt; @@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado &lt;<b=
r>
&gt; &gt; <a href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ri=
cardo.ribalda@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 14 insertions(+), 11 deletions(-)<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/mesonbuild/dependencies/base.py<br>
&gt; &gt; b/mesonbuild/dependencies/base.py<br>
&gt; &gt; -index 21da8e2..7d1ef85 100644<br>
&gt; &gt; +index 3c55a56..eb52fd1 100644<br>
&gt; &gt;=C2=A0 --- a/mesonbuild/dependencies/base.py<br>
&gt; &gt;=C2=A0 +++ b/mesonbuild/dependencies/base.py<br>
&gt; &gt; -@@ -155,7 +155,7 @@ class Dependency:<br>
&gt; &gt; +@@ -185,7 +185,7 @@ class Dependency:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get_exe_args(self, compiler):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
&gt; &gt;<br>
&gt; &gt; @@ -34,7 +34,7 @@ index 21da8e2..7d1ef85 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException=
(&#39;{!r} is not a pkgconfig<br>
&gt; &gt; dependency&#39;.format(<a href=3D"http://self.name" rel=3D"norefe=
rrer" target=3D"_blank">self.name</a>))<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get_configtool_variable(self, varia=
ble_name):<br>
&gt; &gt; -@@ -214,7 +214,7 @@ class InternalDependency(Dependency):<br>
&gt; &gt; +@@ -248,7 +248,7 @@ class InternalDependency(Dependency):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sources =3D sources<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ext_deps =3D ext_dep=
s<br>
&gt; &gt;<br>
&gt; &gt; @@ -43,7 +43,7 @@ index 21da8e2..7d1ef85 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException=
(&#39;Method<br>
&gt; &gt; &quot;get_pkgconfig_variable()&quot; is &#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;inva=
lid for an internal<br>
&gt; &gt; dependency&#39;)<br>
&gt; &gt;<br>
&gt; &gt; -@@ -639,15 +639,18 @@ class PkgConfigDependency(ExternalDependen=
cy):<br>
&gt; &gt; +@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependen=
cy):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s.format(self.__cl=
ass__.__name__, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_=
blank">self.name</a>,<br>
&gt; &gt; self.is_found,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.version_reqs)<br>
&gt; &gt;<br>
&gt; &gt; @@ -65,7 +65,7 @@ index 21da8e2..7d1ef85 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Always copy the environ=
ment since we&#39;re going to modify<br>
&gt; &gt; it<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# with pkg-config variabl=
es<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if env is None:<br>
&gt; &gt; -@@ -663,7 +666,7 @@ class PkgConfigDependency(ExternalDependency=
):<br>
&gt; &gt; +@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency=
):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targs =3D tuple(args)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache =3D PkgConfigDepend=
ency.pkgbin_cache<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self.pkgbin, targs, f=
env) not in cache:<br>
&gt; &gt; @@ -74,16 +74,16 @@ index 21da8e2..7d1ef85 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cache[(self.pkgbin=
, targs, fenv)]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args):<b=
r>
&gt; &gt; -@@ -845,7 +848,7 @@ class PkgConfigDependency(ExternalDependency=
):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(<a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.=
name</a>, out_raw))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args, self.raw_link_=
args =3D self._search_libs(out,<br>
&gt; &gt; out_raw)<br>
&gt; &gt; +@@ -926,7 +929,7 @@ class PkgConfigDependency(ExternalDependency=
):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.warning(&#3=
9;Could not determine complete list of<br>
&gt; &gt; dependencies for %s&#39; % <a href=3D"http://self.name" rel=3D"no=
referrer" target=3D"_blank">self.name</a>)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args, self.raw_link_=
args =3D self._search_libs(out,<br>
&gt; &gt; out_raw, out_all)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_na=
me, kwargs):<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_na=
me, kwargs,<br>
&gt; &gt; use_native=3DFalse):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#39;--varia=
ble=3D&#39; + variable_name, <a href=3D"http://self.name" rel=3D"noreferrer=
" target=3D"_blank">self.name</a>]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;define_variable&#=
39; in kwargs:<br>
&gt; &gt; -@@ -858,7 +861,7 @@ class PkgConfigDependency(ExternalDependency=
):<br>
&gt; &gt; +@@ -939,7 +942,7 @@ class PkgConfigDependency(ExternalDependency=
):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D=
 [&#39;--define-variable=3D&#39; + &#39;=3D&#39;.join(definition)]<br>
&gt; &gt; + options<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson/vala-cross-<br>
&gt; &gt; compile.patch b/meta/recipes-devtools/meson/meson/vala-cross-<br>
&gt; &gt; compile.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 816f810c054..00000000000<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson/vala-cross-compile.patch<=
br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,50 +0,0 @@<br>
&gt; &gt; -From 77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; -From: James Westman &lt;<a href=3D"mailto:flyingpimonster@flying=
pimonster.net" target=3D"_blank">flyingpimonster@flyingpimonster.net</a>&gt=
;<br>
&gt; &gt; -Date: Mon, 24 Jun 2019 12:04:12 -0500<br>
&gt; &gt; -Subject: [PATCH] Fix two errors when cross-compiling with Vala<b=
r>
&gt; &gt; -<br>
&gt; &gt; -- AttributeError: &#39;ValaCompiler&#39; object has no attribute=
<br>
&gt; &gt; &#39;get_program_dirs&#39;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 Fixed by adding a `get_program_dirs()` function to the ba=
se<br>
&gt; &gt; Compiler<br>
&gt; &gt; -=C2=A0 class, to match `get_library_dirs()`<br>
&gt; &gt; -<br>
&gt; &gt; -- KeyError: &#39;vala_COMPILER&#39;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 Fixed by creating the Vala compile rules for all machines=
, not<br>
&gt; &gt; just<br>
&gt; &gt; -=C2=A0 the build machine.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [<br>
&gt; &gt; <a href=3D"https://github.com/mesonbuild/meson/commit/77c3e6a4aae=
d07e626f4bf4deb7eb66e0f03a33d" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/mesonbuild/meson/commit/77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33=
d</a><br>
&gt; &gt; ]<br>
&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - mesonbuild/backend/ninjabackend.py | 3 +--<br>
&gt; &gt; - mesonbuild/compilers/compilers.py=C2=A0 | 3 +++<br>
&gt; &gt; - 2 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/mesonbuild/backend/ninjabackend.py<br>
&gt; &gt; b/mesonbuild/backend/ninjabackend.py<br>
&gt; &gt; -index a454e6ab5f..b830e377e4 100644<br>
&gt; &gt; ---- a/mesonbuild/backend/ninjabackend.py<br>
&gt; &gt; -+++ b/mesonbuild/backend/ninjabackend.py<br>
&gt; &gt; -@@ -1653,8 +1653,7 @@ def generate_compile_rule_for(self, langna=
me,<br>
&gt; &gt; compiler):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
lf.generate_cs_compile_rule(compiler)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if langname =3D=3D &#39;vala&#=
39;:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if<br>
&gt; &gt; self.environment.machines.matches_build_machine(compiler.for_mach=
ine)<br>
&gt; &gt; :<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ge=
nerate_vala_compile_rules(compiler)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.generate_vala_co=
mpile_rules(compiler)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if langname =3D=3D &#39;rust&#=
39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.generate_ru=
st_compile_rules(compiler)<br>
&gt; &gt; -diff --git a/mesonbuild/compilers/compilers.py<br>
&gt; &gt; b/mesonbuild/compilers/compilers.py<br>
&gt; &gt; -index 5855de71c8..86c1e33407 100644<br>
&gt; &gt; ---- a/mesonbuild/compilers/compilers.py<br>
&gt; &gt; -+++ b/mesonbuild/compilers/compilers.py<br>
&gt; &gt; -@@ -1117,6 +1117,9 @@ def find_library(self, *args, **kwargs):<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def get_library_dirs(self, *args, **kwargs):=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ()<br>
&gt; &gt; -<br>
&gt; &gt; -+=C2=A0 =C2=A0 def get_program_dirs(self, *args, **kwargs):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ()<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0def has_multi_arguments(self, args, env) -&g=
t; Tuple[bool, bool]:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise EnvironmentException(<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Language {}=
 does not support<br>
&gt; &gt; has_multi_arguments.&#39;.format(<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_=
0.51.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.51.2.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/meson/<a href=3D"http://meson_0.52.0.bb" =
rel=3D"noreferrer" target=3D"_blank">meson_0.52.0.bb</a><br>
&gt; &gt; similarity index 97%<br>
&gt; &gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0=
.51.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.51.2.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.5=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.0.bb</a><br>
&gt; &gt; index de9b905c12b..897fa148d94 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.51.2.=
bb" rel=3D"noreferrer" target=3D"_blank">meson_0.51.2.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/<a href=3D"http://meson_0.52.0.=
bb" rel=3D"noreferrer" target=3D"_blank">meson_0.52.0.bb</a><br>
&gt; &gt; @@ -1,4 +1,3 @@<br>
&gt; &gt;=C2=A0 include meson.inc<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://native=
sdk-meson_0.51.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0=
.51.2.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0=
.52.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52.0.bb</a=
><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/meson/<a href=3D"http://natives=
dk-meson_0.51.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.=
51.2.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk=
-meson_0.52.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.52=
.0.bb</a><br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div>

--000000000000725d4a059533cddb--
