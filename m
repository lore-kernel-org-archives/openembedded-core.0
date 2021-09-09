Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.4981.1631178282971584087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nOnXOAOM;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id e20so575334uam.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xb+0BQtWn2/CSNsTbxpvSebGARDUEWeC5jM/5+uFQVs=;
        b=nOnXOAOMRDG5/1Eh2P1rlJ08sAoyUiB1FFFIcji8DfAXYVpaZ11m4mJCuDh+GfOBU9
         6hpCdno6WJ0D69EqOfSKwq5Yder3M/U88OXOSsNnatMdSelKw5zh9P9v4uzbLF7lijlm
         /zup0AQ4GwF3xlCGe9++sedG+p0EaCFkXjyWy72MGvkO4r5709r8J7aT/lXpqVuxgReh
         M4EezNAh/JIDVHaUrXz+R9fzu5jfTu7s28Fqn2PfvcU7Mc0Q4QvaZ5H3Gh8MFIbpL59x
         8dWA6gj7hVsQnSU9qliR7nXxzJ8it928PQMIJryzVZCKuraUmFOAsf8S+7r236zOXXwp
         B8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xb+0BQtWn2/CSNsTbxpvSebGARDUEWeC5jM/5+uFQVs=;
        b=oyCFKDGTp9LjwUgAODfgQ6r7AAPXQDXAQFg4+BufclaJUgr4GgY6DcgPRAwIMSZWWf
         DcQwqe+jbw3YX4mXt7N4w9urrNgkCmuv1YA3bBUzLoLYhs8ft7AapNQ8A/3wwScr3YXO
         oJyK4HnEGUdqLUPUYP1vLIsThGKff8I6HzYKbIlVCaOWQKyteeW4GMiRdWVYDu4Ux9g5
         nuQ8lFhV2Yct9mhfBsefh24I0sZrHPDIYgyn6sBr+qdCs9gSuSZKu6Sru+Ivwr0jOsQf
         rE1y1pPHkeBx6c1JneTzi4xhcGDLPNxkFI8h0Dzi50uJ8KYM4qDS4R/JbMemP+r/gWc+
         ODMQ==
X-Gm-Message-State: AOAM53250HBsj+cGdKAWo3ZfXszo4jjzM5EmZaOGfn9GfJMod9ToO30c
	iV7ywmWA3ikgxNYf/Qw+rufAus9g6WP+Gqz3nb0=
X-Google-Smtp-Source: ABdhPJy0O/JqQfBrGkeYz9DRXmdNO/4NF1WmcZ4M3eRpoJbvir0CDfy2THnWSMHLGQ7Ov4d9wfH6EC33ko1hCywpGP8=
X-Received: by 2002:ab0:7a57:: with SMTP id a23mr843050uat.100.1631178281937;
 Thu, 09 Sep 2021 02:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210908180125.103473-1-alex.kanavin@gmail.com> <cf3cba17d82f4fb6b2c4e25aa38c314f@axis.com>
In-Reply-To: <cf3cba17d82f4fb6b2c4e25aa38c314f@axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 9 Sep 2021 11:04:30 +0200
Message-ID: <CANNYZj-orzU+ERO7pH8wCVmAhNfr7VmzXn-3hk_JUC032t+BqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/26] meson: update 0.58.1 -> 0.59.1
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000f6e0a05cb8c4ab5"

--0000000000000f6e0a05cb8c4ab5
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Sept 2021 at 11:01, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> We are not using QT, so I do not know what the actual effect of that
> patch being dropped is. Thus I do not know whether it is correct to
> drop it or not. However, it seems that the hunks that actually added
> the use_native=True arguments were dropped from the patch with the
> update to 0.58.0. In that release, the QT specific functions were moved
> from mesonbuild/dependencies/ui.py to mesonbuild/dependencies/qt.py
> and the relevant hunks should probably have been moved along with the
> code instead of being removed.
>

Sure, but if the patch does not clearly describe how to reproduce the
problem it is aiming to solve, I'm not going
to start digging or guessing. It's been a pain to rebase for a very long
time, and I've had enough.

Alex



>
> //Peter
>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/meson/meson.inc         |  4 +-
> >  .../0001-Make-CPU-family-warnings-fatal.patch | 20 ++--
> >  .../meson/meson/0003-native_bindir.patch      | 94 -------------------
> >  .../meson/meson/gi-target-dep.patch           | 41 --------
> >  .../{meson_0.58.1.bb => meson_0.59.1.bb}      |  0
> >  ...on_0.58.1.bb => nativesdk-meson_0.59.1.bb} |  0
> >  6 files changed, 10 insertions(+), 149 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/meson/meson/0003-
> > native_bindir.patch
> >  delete mode 100644 meta/recipes-devtools/meson/meson/gi-target-dep.patch
> >  rename meta/recipes-devtools/meson/{meson_0.58.1.bb => meson_0.59.1.bb}
> > (100%)
> >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.58.1.bb =>
> > nativesdk-meson_0.59.1.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-
> > devtools/meson/meson.inc
> > index f1746d2094..c83ea406f0 100644
> > --- a/meta/recipes-devtools/meson/meson.inc
> > +++ b/meta/recipes-devtools/meson/meson.inc
> > @@ -9,15 +9,13 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> >  SRC_URI =
> > "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-
> > ${PV}.tar.gz \
> >             file://0001-gtkdoc-fix-issues-that-arise-when-cross-
> > compiling.patch \
> > -           file://0003-native_bindir.patch \
> >             file://0001-python-module-do-not-manipulate-the-environment-
> > when.patch \
> >             file://disable-rpath-handling.patch \
> >             file://0001-modules-python.py-do-not-substitute-python-s-
> > install.patch \
> > -           file://gi-target-dep.patch \
> >             file://0001-Make-CPU-family-warnings-fatal.patch \
> >             file://0002-Support-building-allarch-recipes-again.patch \
> >             "
> > -SRC_URI[sha256sum] =
> > "3144a3da662fcf79f1e5602fa929f2821cba4eba28c2c923fe0a7d3e3db04d5d"
> > +SRC_URI[sha256sum] =
> > "db586a451650d46bbe10984a87b79d9bcdc1caebf38d8e189f8848f8d502356d"
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> >  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> > diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> > warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-
> > family-warnings-fatal.patch
> > index bcccfabd17..c5be526b10 100644
> > --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-
> > fatal.patch
> > +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-
> > fatal.patch
> > @@ -1,20 +1,21 @@
> > -From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 2001
> > +From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Tue, 3 Jul 2018 13:59:09 +0100
> > -Subject: [PATCH 1/2] Make CPU family warnings fatal
> > +Subject: [PATCH] Make CPU family warnings fatal
> >
> >  Upstream-Status: Inappropriate [OE specific]
> >  Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> >  ---
> >   mesonbuild/envconfig.py   | 2 +-
> >   mesonbuild/environment.py | 4 +---
> >   2 files changed, 2 insertions(+), 4 deletions(-)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index c6a4df3..4d58c91 100644
> > +index 307aac3..66fb7ec 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> > -@@ -266,7 +266,7 @@ class MachineInfo:
> > +@@ -267,7 +267,7 @@ class MachineInfo(HoldableObject):
> >
> >           cpu_family = literal['cpu_family']
> >           if cpu_family not in known_cpu_families:
> > @@ -24,20 +25,17 @@ index c6a4df3..4d58c91 100644
> >           endian = literal['endian']
> >           if endian not in ('little', 'big'):
> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index fc9b703..eea8345 100644
> > +index 71286a5..179917e 100644
> >  --- a/mesonbuild/environment.py
> >  +++ b/mesonbuild/environment.py
> > -@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> > str:
> > +@@ -352,9 +352,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> > str:
> >               trial = 'ppc64'
> >
> >       if trial not in known_cpu_families:
> > --        mlog.warning('Unknown CPU family {!r}, please report this at '
> > +-        mlog.warning(f'Unknown CPU family {trial!r}, please report this
> > at '
> >  -                     'https://github.com/mesonbuild/meson/issues/new
> > with the '
> > --                     'output of `uname -a` and `cat
> > /proc/cpuinfo`'.format(trial))
> > +-                     'output of `uname -a` and `cat /proc/cpuinfo`')
> >  +        raise EnvironmentException('Unknown CPU family %s, see
> > https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' %
> > trial)
> >
> >       return trial
> >
> > ---
> > -2.24.0
> > -
> > diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > deleted file mode 100644
> > index 89257b9e05..0000000000
> > --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> > +++ /dev/null
> > @@ -1,94 +0,0 @@
> > -From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 2001
> > -From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > -Date: Wed, 15 Nov 2017 15:05:01 +0100
> > -Subject: [PATCH] native_bindir
> > -
> > -Some libraries, like QT, have pre-processors that convert their input
> > -files into something that the cross-compiler can process. We find the
> > -path of those pre-processors via pkg-config-native instead of
> > -pkg-config.
> > -
> > -This path forces the use of pkg-config-native for host_bins arguments.
> > -
> > -There are some discussions upstream to merge this patch, but I presonaly
> > believe
> > -that is is OE only.
> > https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > -
> > ----
> > - mesonbuild/dependencies/base.py | 19 +++++++++++--------
> > - 1 file changed, 11 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/mesonbuild/dependencies/base.py
> > b/mesonbuild/dependencies/base.py
> > -index 14380d4..d0c443f 100644
> > ---- a/mesonbuild/dependencies/base.py
> > -+++ b/mesonbuild/dependencies/base.py
> > -@@ -179,7 +179,7 @@ class Dependency:
> > -     def get_exe_args(self, compiler):
> > -         return []
> > -
> > --    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> > T.Dict[str, T.Any]) -> str:
> > -+    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> > T.Dict[str, T.Any], use_native=False) -> str:
> > -         raise DependencyException(f'{self.name!r} is not a pkgconfig
> > dependency')
> > -
> > -     def get_configtool_variable(self, variable_name):
> > -@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
> > -             return True
> > -         return any(d.is_built() for d in self.ext_deps)
> > -
> > --    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> > T.Dict[str, T.Any]) -> str:
> > -+    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> > T.Dict[str, T.Any], use_native=False) -> str:
> > -         raise DependencyException('Method "get_pkgconfig_variable()" is
> > '
> > -                                   'invalid for an internal dependency')
> > -
> > -@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
> > -         return s.format(self.__class__.__name__, self.name,
> > self.is_found,
> > -                         self.version_reqs)
> > -
> > --    def _call_pkgbin_real(self, args, env):
> > --        cmd = self.pkgbin.get_command() + args
> > -+    def _call_pkgbin_real(self, args, env, use_native=False):
> > -+        if use_native:
> > -+            cmd = [self.pkgbin.get_command()[0] + "-native"] + args
> > -+        else:
> > -+            cmd = self.pkgbin.get_command() + args
> > -         p, out, err = Popen_safe(cmd, env=env)
> > -         rc, out, err = p.returncode, out.strip(), err.strip()
> > -         call = ' '.join(cmd)
> > -@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
> > -             if key.startswith('PKG_'):
> > -                 mlog.debug(f'env[{key}]: {value}')
> > -
> > --    def _call_pkgbin(self, args, env=None):
> > -+    def _call_pkgbin(self, args, env=None, use_native=False):
> > -         # Always copy the environment since we're going to modify it
> > -         # with pkg-config variables
> > -         if env is None:
> > -@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
> > -         targs = tuple(args)
> > -         cache = PkgConfigDependency.pkgbin_cache
> > -         if (self.pkgbin, targs, fenv) not in cache:
> > --            cache[(self.pkgbin, targs, fenv)] =
> > self._call_pkgbin_real(args, env)
> > -+            cache[(self.pkgbin, targs, fenv)] =
> > self._call_pkgbin_real(args, env, use_native)
> > -         return cache[(self.pkgbin, targs, fenv)]
> > -
> > -     def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
> > -@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
> > -                                       (self.name, out_raw))
> > -         self.link_args, self.raw_link_args = self._search_libs(out,
> > out_raw)
> > -
> > --    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> > T.Dict[str, T.Any]) -> str:
> > -+    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> > T.Dict[str, T.Any], use_native=False) -> str:
> > -         options = ['--variable=' + variable_name, self.name]
> > -
> > -         if 'define_variable' in kwargs:
> > -@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
> > -
> > -             options = ['--define-variable=' + '='.join(definition)] +
> > options
> > -
> > --        ret, out, err = self._call_pkgbin(options)
> > -+        ret, out, err = self._call_pkgbin(options,
> > use_native=use_native)
> > -         variable = ''
> > -         if ret != 0:
> > -             if self.required:
> > diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> > b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> > deleted file mode 100644
> > index 29e164ccc7..0000000000
> > --- a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -When building gobject-introspection we want the *native* binaries (as
> > they need
> > -to be executed) but *host* gobject-introspection libraries, as otherwise
> > the
> > -native pkg-config can be used and the build will try to link native and
> > host
> > -binaries together.
> > -
> > -Upstream-Status: Backport [589236226856f591c9e8daf0cb7aa1aef8862388]
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> > -index f9660838e..2eefc3fc7 100644
> > ---- a/mesonbuild/modules/gnome.py
> > -+++ b/mesonbuild/modules/gnome.py
> > -@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):
> > -
> > mlog.bold('https://github.com/mesonbuild/meson/issues/1387'),
> > -                      once=True)
> > -
> > --    def _get_native_dep(self, state, depname, required=True):
> > --        kwargs = {'native': True, 'required': required}
> > -+    def _get_dep(self, state, depname, native=False, required=True):
> > -+        kwargs = {'native': native, 'required': required}
> > -         holder = self.interpreter.func_dependency(state.current_node,
> > [depname], kwargs)
> > -         return holder.held_object
> > -
> > -@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):
> > -             return ExternalProgram.from_entry(name, prog)
> > -
> > -         # Check if pkgconfig has a variable
> > --        dep = self._get_native_dep(state, depname, required=False)
> > -+        dep = self._get_dep(state, depname, native=True,
> required=False)
> > -         if dep.found() and dep.type_name == 'pkgconfig':
> > -             value = dep.get_pkgconfig_variable(varname, {})
> > -             if value:
> > -@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):
> > -
> > -     def _get_gir_dep(self, state):
> > -         if not self.gir_dep:
> > --            self.gir_dep = self._get_native_dep(state, 'gobject-
> > introspection-1.0')
> > -+            self.gir_dep = self._get_dep(state, 'gobject-introspection-
> > 1.0')
> > -             self.giscanner = self._get_native_binary(state, 'g-ir-
> > scanner', 'gobject-introspection-1.0', 'g_ir_scanner')
> > -             self.gicompiler = self._get_native_binary(state, 'g-ir-
> > compiler', 'gobject-introspection-1.0', 'g_ir_compiler')
> > -         return self.gir_dep, self.giscanner, self.gicompiler
> > diff --git a/meta/recipes-devtools/meson/meson_0.58.1.bb b/meta/recipes-
> > devtools/meson/meson_0.59.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/meson_0.58.1.bb
> > rename to meta/recipes-devtools/meson/meson_0.59.1.bb
> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
> > b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
> > rename to meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> > --
> > 2.31.1
>
>

--0000000000000f6e0a05cb8c4ab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 9 Sept 2021 at 11:01, Peter Kjellerstedt &lt;<a href=3D"mail=
to:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">We are not using=
 QT, so I do not know what the actual effect of that <br>
patch being dropped is. Thus I do not know whether it is correct to <br>
drop it or not. However, it seems that the hunks that actually added <br>
the use_native=3DTrue arguments were dropped from the patch with the <br>
update to 0.58.0. In that release, the QT specific functions were moved <br=
>
from mesonbuild/dependencies/ui.py to mesonbuild/dependencies/qt.py<br>
and the relevant hunks should probably have been moved along with the <br>
code instead of being removed.<br></blockquote><div><br></div><div>Sure, bu=
t if the patch does not clearly describe how to reproduce the problem it is=
 aiming to solve, I&#39;m not going</div><div>to start digging or guessing.=
 It&#39;s been a pain to rebase for a very long time, and I&#39;ve had enou=
gh.<br></div><div><br></div><div>Alex<br></div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
//Peter<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 .../0001-Make-CPU-family-warnings-fatal.patch | 20 ++--<br>
&gt;=C2=A0 .../meson/meson/0003-native_bindir.patch=C2=A0 =C2=A0 =C2=A0 | 9=
4 -------------------<br>
&gt;=C2=A0 .../meson/meson/gi-target-dep.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 41 --------<br>
&gt;=C2=A0 .../{<a href=3D"http://meson_0.58.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">meson_0.58.1.bb</a> =3D&gt; <a href=3D"http://meson_0.59.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">meson_0.59.1.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://on_0.58.1.bb" rel=3D"noreferrer" target=3D"=
_blank">on_0.58.1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.59.1.b=
b" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb</a>} |=C2=
=A0 0<br>
&gt;=C2=A0 6 files changed, 10 insertions(+), 149 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/0003-<br>
&gt; native_bindir.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/meson/meson/gi-target-d=
ep.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.58=
.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.58.1.bb</a> =3D&gt; <a =
href=3D"http://meson_0.59.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_=
0.59.1.bb</a>}<br>
&gt; (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativesdk-=
meson_0.58.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.58.=
1.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://nativesdk-meson_0.59.1.bb" rel=3D"noreferrer" target=
=3D"_blank">nativesdk-meson_0.59.1.bb</a>} (100%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-<br>
&gt; devtools/meson/meson.inc<br>
&gt; index f1746d2094..c83ea406f0 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; @@ -9,15 +9,13 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6bd57&quot;<br>
&gt; <br>
&gt;=C2=A0 SRC_URI =3D<br>
&gt; &quot;<a href=3D"https://github.com/mesonbuild/meson/releases/download=
/$%7BPV%7D/meson-" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
mesonbuild/meson/releases/download/${PV}/meson-</a><br>
&gt; ${PV}.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gtkdoc-fix-=
issues-that-arise-when-cross-<br>
&gt; compiling.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-native_bindir.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python-modu=
le-do-not-manipulate-the-environment-<br>
&gt; when.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-rpath-ha=
ndling.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-modules-pyt=
hon.py-do-not-substitute-python-s-<br>
&gt; install.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gi-target-dep.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-CPU-fa=
mily-warnings-fatal.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Support-bui=
lding-allarch-recipes-again.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;3144a3da662fcf79f1e5602fa929f2821cba4eba28c2c923fe0a7d3e3db04d5d=
&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;db586a451650d46bbe10984a87b79d9bcdc1caebf38d8e189f8848f8d502356d=
&quot;<br>
&gt; <br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/meson=
build/meson/releases" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/mesonbuild/meson/releases</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;meson-(?P&lt;pver&gt;\d+(\.\d+)+)=
\.tar&quot;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-<b=
r>
&gt; warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU=
-<br>
&gt; family-warnings-fatal.patch<br>
&gt; index bcccfabd17..c5be526b10 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
<br>
&gt; fatal.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-=
<br>
&gt; fatal.patch<br>
&gt; @@ -1,20 +1,21 @@<br>
&gt; -From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 3 Jul 2018 13:59:09 +0100<br>
&gt; -Subject: [PATCH 1/2] Make CPU family warnings fatal<br>
&gt; +Subject: [PATCH] Make CPU family warnings fatal<br>
&gt; <br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/envconfig.py=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0mesonbuild/environment.py | 4 +---<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<b=
r>
&gt; -index c6a4df3..4d58c91 100644<br>
&gt; +index 307aac3..66fb7ec 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -266,7 +266,7 @@ class MachineInfo:<br>
&gt; +@@ -267,7 +267,7 @@ class MachineInfo(HoldableObject):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_family =3D literal[&#39;cp=
u_family&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cpu_family not in known_cpu=
_families:<br>
&gt; @@ -24,20 +25,17 @@ index c6a4df3..4d58c91 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endian =3D literal[&#39;endian=
&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if endian not in (&#39;little&=
#39;, &#39;big&#39;):<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.=
py<br>
&gt; -index fc9b703..eea8345 100644<br>
&gt; +index 71286a5..179917e 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
&gt;<br>
&gt; str:<br>
&gt; +@@ -352,9 +352,7 @@ def detect_cpu_family(compilers: CompilersDict) -=
&gt;<br>
&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trial =3D &#39;p=
pc64&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if trial not in known_cpu_families:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown CPU family {!r=
}, please report this at &#39;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(f&#39;Unknown CPU family {t=
rial!r}, please report this<br>
&gt; at &#39;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;<a href=3D"https://github.com/mesonbuild/meson/issues/new=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/meson/=
issues/new</a><br>
&gt; with the &#39;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;output of `uname -a` and `cat<br>
&gt; /proc/cpuinfo`&#39;.format(trial))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;output of `uname -a` and `cat /proc/cpuinfo`&#39;)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentException(&#39;Unk=
nown CPU family %s, see<br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU" rel=3D=
"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Meson/Unk=
nownCPU</a> for directions.&#39; %<br>
&gt; trial)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return trial<br>
&gt; <br>
&gt; ---<br>
&gt; -2.24.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patc=
h<br>
&gt; b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 89257b9e05..0000000000<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,94 +0,0 @@<br>
&gt; -From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.ribalda@g=
mail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 15 Nov 2017 15:05:01 +0100<br>
&gt; -Subject: [PATCH] native_bindir<br>
&gt; -<br>
&gt; -Some libraries, like QT, have pre-processors that convert their input=
<br>
&gt; -files into something that the cross-compiler can process. We find the=
<br>
&gt; -path of those pre-processors via pkg-config-native instead of<br>
&gt; -pkg-config.<br>
&gt; -<br>
&gt; -This path forces the use of pkg-config-native for host_bins arguments=
.<br>
&gt; -<br>
&gt; -There are some discussions upstream to merge this patch, but I preson=
aly<br>
&gt; believe<br>
&gt; -that is is OE only.<br>
&gt; <a href=3D"https://github.com/mesonbuild/meson/issues/1849#issuecommen=
t-303730323" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonb=
uild/meson/issues/1849#issuecomment-303730323</a><br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; -Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.=
ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - mesonbuild/dependencies/base.py | 19 +++++++++++--------<br>
&gt; - 1 file changed, 11 insertions(+), 8 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/mesonbuild/dependencies/base.py<br>
&gt; b/mesonbuild/dependencies/base.py<br>
&gt; -index 14380d4..d0c443f 100644<br>
&gt; ---- a/mesonbuild/dependencies/base.py<br>
&gt; -+++ b/mesonbuild/dependencies/base.py<br>
&gt; -@@ -179,7 +179,7 @@ class Dependency:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def get_exe_args(self, compiler):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return []<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, k=
wargs:<br>
&gt; T.Dict[str, T.Any]) -&gt; str:<br>
&gt; -+=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, k=
wargs:<br>
&gt; T.Dict[str, T.Any], use_native=3DFalse) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(f&#39;{<a=
 href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.name</=
a>!r} is not a pkgconfig<br>
&gt; dependency&#39;)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def get_configtool_variable(self, variable_name):=
<br>
&gt; -@@ -267,7 +267,7 @@ class InternalDependency(Dependency):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return any(d.is_built() for d in se=
lf.ext_deps)<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, k=
wargs:<br>
&gt; T.Dict[str, T.Any]) -&gt; str:<br>
&gt; -+=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, k=
wargs:<br>
&gt; T.Dict[str, T.Any], use_native=3DFalse) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DependencyException(&#39;Meth=
od &quot;get_pkgconfig_variable()&quot; is<br>
&gt; &#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;invalid for an=
 internal dependency&#39;)<br>
&gt; -<br>
&gt; -@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s.format(self.__class__.__na=
me__, <a href=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">sel=
f.name</a>,<br>
&gt; self.is_found,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0self.version_reqs)<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 def _call_pkgbin_real(self, args, env):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D self.pkgbin.get_command() + args=
<br>
&gt; -+=C2=A0 =C2=A0 def _call_pkgbin_real(self, args, env, use_native=3DFa=
lse):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if use_native:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.pkgbin.get_c=
ommand()[0] + &quot;-native&quot;] + args<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D self.pkgbin.get_co=
mmand() + args<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p, out, err =3D Popen_safe(cmd, env=
=3Denv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc, out, err =3D p.returncode, out.=
strip(), err.strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call =3D &#39; &#39;.join(cmd)<br>
&gt; -@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if key.startswith(&#3=
9;PKG_&#39;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlog.de=
bug(f&#39;env[{key}]: {value}&#39;)<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone):<br>
&gt; -+=C2=A0 =C2=A0 def _call_pkgbin(self, args, env=3DNone, use_native=3D=
False):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Always copy the environment since=
 we&#39;re going to modify it<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# with pkg-config variables<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if env is None:<br>
&gt; -@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targs =3D tuple(args)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache =3D PkgConfigDependency.pkgbi=
n_cache<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self.pkgbin, targs, fenv) not i=
n cache:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache[(self.pkgbin, targs,=
 fenv)] =3D<br>
&gt; self._call_pkgbin_real(args, env)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache[(self.pkgbin, targs,=
 fenv)] =3D<br>
&gt; self._call_pkgbin_real(args, env, use_native)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return cache[(self.pkgbin, targs, f=
env)]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def _convert_mingw_paths(self, args: T.List[str])=
 -&gt; T.List[str]:<br>
&gt; -@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<a h=
ref=3D"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.name</a>=
, out_raw))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.link_args, self.raw_link_args =
=3D self._search_libs(out,<br>
&gt; out_raw)<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, k=
wargs:<br>
&gt; T.Dict[str, T.Any]) -&gt; str:<br>
&gt; -+=C2=A0 =C2=A0 def get_pkgconfig_variable(self, variable_name: str, k=
wargs:<br>
&gt; T.Dict[str, T.Any], use_native=3DFalse) -&gt; str:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#39;--variable=3D&#39=
; + variable_name, <a href=3D"http://self.name" rel=3D"noreferrer" target=
=3D"_blank">self.name</a>]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;define_variable&#39; in kwa=
rgs:<br>
&gt; -@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D [&#39;--d=
efine-variable=3D&#39; + &#39;=3D&#39;.join(definition)] +<br>
&gt; options<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret, out, err =3D self._call_pkgbin(opti=
ons)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret, out, err =3D self._call_pkgbin(opti=
ons,<br>
&gt; use_native=3Duse_native)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variable =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.required:<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch<br>
&gt; b/meta/recipes-devtools/meson/meson/gi-target-dep.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 29e164ccc7..0000000000<br>
&gt; --- a/meta/recipes-devtools/meson/meson/gi-target-dep.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,41 +0,0 @@<br>
&gt; -When building gobject-introspection we want the *native* binaries (as=
<br>
&gt; they need<br>
&gt; -to be executed) but *host* gobject-introspection libraries, as otherw=
ise<br>
&gt; the<br>
&gt; -native pkg-config can be used and the build will try to link native a=
nd<br>
&gt; host<br>
&gt; -binaries together.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [589236226856f591c9e8daf0cb7aa1aef8862388]<=
br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.p=
y<br>
&gt; -index f9660838e..2eefc3fc7 100644<br>
&gt; ---- a/mesonbuild/modules/gnome.py<br>
&gt; -+++ b/mesonbuild/modules/gnome.py<br>
&gt; -@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):<br>
&gt; -<br>
&gt; mlog.bold(&#39;<a href=3D"https://github.com/mesonbuild/meson/issues/1=
387&#39;" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuil=
d/meson/issues/1387&#39;</a>),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 once=3DTrue)<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 def _get_native_dep(self, state, depname, required=3DT=
rue):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs =3D {&#39;native&#39;: True, &#39=
;required&#39;: required}<br>
&gt; -+=C2=A0 =C2=A0 def _get_dep(self, state, depname, native=3DFalse, req=
uired=3DTrue):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs =3D {&#39;native&#39;: native, &#=
39;required&#39;: required}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0holder =3D self.interpreter.func_de=
pendency(state.current_node,<br>
&gt; [depname], kwargs)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return holder.held_object<br>
&gt; -<br>
&gt; -@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ExternalProgra=
m.from_entry(name, prog)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if pkgconfig has a variable=
<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D self._get_native_dep(state, depn=
ame, required=3DFalse)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D self._get_dep(state, depname, na=
tive=3DTrue, required=3DFalse)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dep.found() and dep.type_name =
=3D=3D &#39;pkgconfig&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D dep.get_pkg=
config_variable(varname, {})<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if value:<br>
&gt; -@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0def _get_gir_dep(self, state):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.gir_dep:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gir_dep =3D self._get=
_native_dep(state, &#39;gobject-<br>
&gt; introspection-1.0&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gir_dep =3D self._get=
_dep(state, &#39;gobject-introspection-<br>
&gt; 1.0&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.giscanner =3D se=
lf._get_native_binary(state, &#39;g-ir-<br>
&gt; scanner&#39;, &#39;gobject-introspection-1.0&#39;, &#39;g_ir_scanner&#=
39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gicompiler =3D s=
elf._get_native_binary(state, &#39;g-ir-<br>
&gt; compiler&#39;, &#39;gobject-introspection-1.0&#39;, &#39;g_ir_compiler=
&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.gir_dep, self.giscanner=
, self.gicompiler<br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.58.=
1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.58.1.bb</a> b/meta/recip=
es-<br>
&gt; devtools/meson/<a href=3D"http://meson_0.59.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">meson_0.59.1.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.58.1=
.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.58.1.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.59.1.b=
b" rel=3D"noreferrer" target=3D"_blank">meson_0.59.1.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-m=
eson_0.58.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.58.1=
.bb</a><br>
&gt; b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.59.1=
.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-me=
son_0.58.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.58.1.=
bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meso=
n_0.59.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb=
</a><br>
&gt; --<br>
&gt; 2.31.1<br>
<br>
</blockquote></div></div>

--0000000000000f6e0a05cb8c4ab5--
