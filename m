Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.1273.1596529640070132529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 01:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5og6TjN;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id b26so16076151vsa.13
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=21nOcDmSfVVGswoGw+H1ieoRQu3mqg9wjaxjebhmTPU=;
        b=D5og6TjNQVtSiKRWY46EIR+IpjIFdNXkfAXdYYYstbpTAeLGNWvEJLQxCz30EAiw3+
         CR0sp6uyAX9VUEYqkN1/x+Z121LPOPdu5SgCR7vAqvttkvVj5PgvLo4uKjT1ojS1cmBS
         dT0bahuG0JG9Dr4EDJq5OKEWeO+2gaaaXBoXLlb8XbfQN0bR2jsVkrYpmbYOCL4c1vAP
         ezenCfop1U9hUF6CzscwOKGMg2MrmnsPEGLciqheeySZS3LTvAfgrTgz954oSHe5augd
         WSfqE90xTUpWxnZtjnzLHw6icRCyuAAfVYUe3N/nFAxfodIDqxoMkUZV+MgljbbrAHn9
         FcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=21nOcDmSfVVGswoGw+H1ieoRQu3mqg9wjaxjebhmTPU=;
        b=S2zrOqzo+q6ZVEXA1fHGX1C/f9m+YjgVj8SoaDfdayVEHgGOVBIGscnpB6DDEzp0J2
         7P6DvGjdNgXqYhgcDFCUO3vWfWlprZAC8ZSEvN5NAHQCSuOfpkXt23rztvAEfG4C1LJR
         rvluOFiw7Uaiui+lXZPG/uWtFfWSreyc84qCXqzqy7ndAkcRjzaO8Go6RYGl781pFwu0
         OShLFAtgcv9cZn+Av28FREtWwrXw5PpuYHmygfFO/ZA2A1WjkThbbrWGQ52VR0YMp4oc
         xB3J1IRTOGakYbxW6iZdZ71ueVxYkKDB8sGZqvLkT9jcb2IBxifqsb/nWn2se8RKM7BV
         +vQg==
X-Gm-Message-State: AOAM5312owXyuQ8R7SWnB7LFa/uQO6EMVGChTMK5SaL7+xq3Fcc6KID8
	f9ot9EAV/CaADvMduGPuMw3A57H4bcptIHr3pQw=
X-Google-Smtp-Source: ABdhPJz9HMH36Zp+z5cvmtU3ymZIdVWp9Oh3mPrYGkkpiGS1kTPiHkd3mRQxBuTOSd8GyaJR8pTcOJF2OxHF2EhFE8I=
X-Received: by 2002:a67:6305:: with SMTP id x5mr2228271vsb.35.1596529638928;
 Tue, 04 Aug 2020 01:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
 <20200801212335.14922-5-alex.kanavin@gmail.com> <CAMKF1sq9LxFDSYmk8gR9bxb1pi+wCsmnYXS9HYE0_rQp5NfsMQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq9LxFDSYmk8gR9bxb1pi+wCsmnYXS9HYE0_rQp5NfsMQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 4 Aug 2020 10:27:07 +0200
Message-ID: <CANNYZj-LP6=-whNLDGUBbCN7mwL-c4Jugy03C+fwV1N3kpgFkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] meson: update 0.54.3 -> 0.55.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000000766e05ac09069b"

--00000000000000766e05ac09069b
Content-Type: text/plain; charset="UTF-8"

It is related; I have just sent a patch (to oe-core) to correct this.

Alex

On Mon, 3 Aug 2020 at 09:25, Khem Raj <raj.khem@gmail.com> wrote:

> I wonder if this failure is related to this can you check
>
> http://errors.yoctoproject.org/Errors/Details/427901/
>
> On Sat, Aug 1, 2020 at 2:23 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Rebase patches.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/meson/meson.inc         |  2 +-
> >  .../0001-Make-CPU-family-warnings-fatal.patch | 19 ++++----
> >  ...g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch | 48 +++++++++----------
> >  ...y-do-not-substitute-python-s-install.patch | 11 +++--
> >  ...pport-building-allarch-recipes-again.patch |  4 +-
> >  .../meson/meson/disable-rpath-handling.patch  | 10 ++--
> >  .../{meson_0.54.3.bb => meson_0.55.0.bb}      |  0
> >  ...on_0.54.3.bb => nativesdk-meson_0.55.0.bb} |  0
> >  8 files changed, 47 insertions(+), 47 deletions(-)
> >  rename meta/recipes-devtools/meson/{meson_0.54.3.bb => meson_0.55.0.bb}
> (100%)
> >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.54.3.bb =>
> nativesdk-meson_0.55.0.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> > index ffa17b3061..607093a152 100644
> > --- a/meta/recipes-devtools/meson/meson.inc
> > +++ b/meta/recipes-devtools/meson/meson.inc
> > @@ -16,7 +16,7 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> >
>  file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
> >
>  file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
> >             "
> > -SRC_URI[sha256sum] =
> "f2bdf4cf0694e696b48261cdd14380fb1d0fe33d24744d8b2df0c12f33ebb662"
> > +SRC_URI[sha256sum] =
> "0a1ae2bfe2ae14ac47593537f93290fb79e9b775c55b4c53c282bc3ca3745b35"
> >
> >  SRC_URI_append_class-native = " \
> >      file://0001-Make-CPU-family-warnings-fatal.patch \
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > index 1be94a9b19..ceb2fde342 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> > @@ -1,7 +1,7 @@
> > -From 62c415eedb62905de76e2e0bbd156a947705cab2 Mon Sep 17 00:00:00 2001
> > +From 5624b5835af747b601780ad14646f9c1fb854931 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Tue, 3 Jul 2018 13:59:09 +0100
> > -Subject: [PATCH] Make CPU family warnings fatal
> > +Subject: [PATCH 1/2] Make CPU family warnings fatal
> >
> >  Upstream-Status: Inappropriate [OE specific]
> >  Signed-off-by: Ross Burton <ross.burton@intel.com>
> > @@ -12,23 +12,23 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
> >   2 files changed, 2 insertions(+), 4 deletions(-)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index 17058df..18bbf86 100644
> > +index 219b62e..d1be65b 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> > -@@ -225,7 +225,7 @@ class MachineInfo:
> > +@@ -199,7 +199,7 @@ class MachineInfo:
> >
> >           cpu_family = literal['cpu_family']
> >           if cpu_family not in known_cpu_families:
> > --            mlog.warning('Unknown CPU family %s, please report this at
> https://github.com/mesonbuild/meson/issues/new' % cpu_family)
> > -+            raise EnvironmentException('Unknown CPU family %s, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' %
> cpu_family)
> > +-            mlog.warning('Unknown CPU family {}, please report this at
> https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
> > ++            raise EnvironmentException('Unknown CPU family {}, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for
> directions.'.format(cpu_family))
> >
> >           endian = literal['endian']
> >           if endian not in ('little', 'big'):
> >  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> > -index a2f78a4..59fcb07 100644
> > +index bf09a88..8eabe78 100644
> >  --- a/mesonbuild/environment.py
> >  +++ b/mesonbuild/environment.py
> > -@@ -364,9 +364,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
> > +@@ -375,9 +375,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
> >           trial = 'parisc'
> >
> >       if trial not in known_cpu_families:
> > @@ -39,3 +39,6 @@ index a2f78a4..59fcb07 100644
> >
> >       return trial
> >
> > +--
> > +2.24.0
> > +
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> > index 35c18f0785..a1f8422d44 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> > @@ -1,4 +1,4 @@
> > -From 7be634fa9705d0367f48a91305f9acb642ff0a11 Mon Sep 17 00:00:00 2001
> > +From 64aa6718c290e150dafd8da83f31cb08af00af0e Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Wed, 27 May 2020 16:43:05 +0000
> >  Subject: [PATCH] gnome.py: prefix g-i paths with PKG_CONFIG_SYSROOT_DIR
> > @@ -9,33 +9,29 @@ determine when a custom variable is a path)
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> > - mesonbuild/modules/gnome.py | 8 ++++----
> > - 1 file changed, 4 insertions(+), 4 deletions(-)
> > + mesonbuild/modules/gnome.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> > -index 89d5d5d..d75f2e5 100644
> > +index 52016f4..2b72ee4 100644
> >  --- a/mesonbuild/modules/gnome.py
> >  +++ b/mesonbuild/modules/gnome.py
> > -@@ -739,17 +739,17 @@ class GnomeModule(ExtensionModule):
> > -         if giscanner.found():
> > -             giscanner_path = giscanner.get_command()[0]
> > -             if not any(x in giscanner_path for x in
> gi_util_dirs_check):
> > --                giscanner =
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> > -+                giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> > -         else:
> > --            giscanner =
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> > -+            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> > -
> > -         gicompiler =
> self.interpreter.find_program_impl('g-ir-compiler')
> > -         if gicompiler.found():
> > -             gicompiler_path = gicompiler.get_command()[0]
> > -             if not any(x in gicompiler_path for x in
> gi_util_dirs_check):
> > --                gicompiler =
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> > -+                gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> > -         else:
> > --            gicompiler =
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> > -+            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> > -
> > -         ns = kwargs.pop('namespace')
> > -         nsversion = kwargs.pop('nsversion')
> > +@@ -410,14 +410,14 @@ class GnomeModule(ExtensionModule):
> > +             if giscanner is not None:
> > +                 self.giscanner =
> ExternalProgram.from_entry('g-ir-scanner', giscanner)
> > +             elif self.gir_dep.type_name == 'pkgconfig':
> > +-                self.giscanner = ExternalProgram('g_ir_scanner',
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {}))
> > ++                self.giscanner = ExternalProgram('g_ir_scanner',
> os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {}))
> > +             else:
> > +                 self.giscanner =
> self.interpreter.find_program_impl('g-ir-scanner')
> > +             gicompiler =
> state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-compiler')
> > +             if gicompiler is not None:
> > +                 self.gicompiler =
> ExternalProgram.from_entry('g-ir-compiler', gicompiler)
> > +             elif self.gir_dep.type_name == 'pkgconfig':
> > +-                self.gicompiler = ExternalProgram('g_ir_compiler',
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {}))
> > ++                self.gicompiler = ExternalProgram('g_ir_compiler',
> os.environ['PKG_CONFIG_SYSROOT_DIR'] +
> self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {}))
> > +             else:
> > +                 self.gicompiler =
> self.interpreter.find_program_impl('g-ir-compiler')
> > +         return self.gir_dep, self.giscanner, self.gicompiler
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> > index a25c392270..c0ad01e9d3 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> > @@ -1,4 +1,4 @@
> > -From 1d178fb2928d325e339b15972890ceced863d3ec Mon Sep 17 00:00:00 2001
> > +From 214e559d394491b1376e4cc370f75151117a3f83 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Thu, 18 Apr 2019 17:36:11 +0200
> >  Subject: [PATCH] modules/python.py: do not substitute python's install
> prefix
> > @@ -10,15 +10,16 @@ b) shouldn't be necessary as Python's prefix ought
> to be correct in the first pl
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> >   mesonbuild/modules/python.py | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> >
> >  diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> > -index 6e2c63b..f5a37ac 100644
> > +index 2f0c644..d2aa565 100644
> >  --- a/mesonbuild/modules/python.py
> >  +++ b/mesonbuild/modules/python.py
> > -@@ -254,7 +254,7 @@ import sysconfig
> > +@@ -251,7 +251,7 @@ INTROSPECT_COMMAND = '''import sysconfig
> >   import json
> >   import sys
> >
> > @@ -27,8 +28,8 @@ index 6e2c63b..f5a37ac 100644
> >
> >   def links_against_libpython():
> >       from distutils.core import Distribution, Extension
> > -@@ -279,12 +279,11 @@ class PythonInstallation(ExternalProgramHolder):
> > -         ExternalProgramHolder.__init__(self, python)
> > +@@ -276,12 +276,11 @@ class PythonInstallation(ExternalProgramHolder):
> > +         ExternalProgramHolder.__init__(self, python,
> interpreter.subproject)
> >           self.interpreter = interpreter
> >           self.subproject = self.interpreter.subproject
> >  -        prefix =
> self.interpreter.environment.coredata.get_builtin_option('prefix')
> > diff --git
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > index b5b463e68e..7a3b01262e 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> > @@ -1,4 +1,4 @@
> > -From d976d5a8abd6d42edf794d2a4c211fc6697fb14c Mon Sep 17 00:00:00 2001
> > +From 4b283d545152092fec12b9d80219161d11002c72 Mon Sep 17 00:00:00 2001
> >  From: Peter Kjellerstedt <pkj@axis.com>
> >  Date: Thu, 26 Jul 2018 16:32:49 +0200
> >  Subject: [PATCH] Support building allarch recipes again
> > @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> > -index 18bbf86..e76315e 100644
> > +index dc20616..f54adcd 100644
> >  --- a/mesonbuild/envconfig.py
> >  +++ b/mesonbuild/envconfig.py
> >  @@ -36,6 +36,7 @@ _T = T.TypeVar('_T')
> > diff --git
> a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> > index 38e50d72f4..4653a72a20 100644
> > --- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> > +++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> > @@ -1,4 +1,4 @@
> > -From 3af10fa8cd4e97181288d72227dea712290fd5e6 Mon Sep 17 00:00:00 2001
> > +From 9e3fcf192c1ca068d310c648c311f9d850214421 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Fri, 23 Nov 2018 15:28:28 +0000
> >  Subject: [PATCH] meson: Disable rpath stripping at install time
> > @@ -16,17 +16,17 @@ Upstream-Status: Submitted [
> https://github.com/mesonbuild/meson/issues/2567]
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> >  diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
> > -index ace0569..85bd8df 100644
> > +index 0be01fe..5406cab 100644
> >  --- a/mesonbuild/minstall.py
> >  +++ b/mesonbuild/minstall.py
> > -@@ -508,8 +508,11 @@ class Installer:
> > +@@ -512,8 +512,11 @@ class Installer:
> >               if file_copied:
> >                   self.did_install_something = True
> >                   try:
> > --                    depfixer.fix_rpath(outname, install_rpath,
> final_path,
> > +-                    depfixer.fix_rpath(outname,
> t.rpath_dirs_to_remove, install_rpath, final_path,
> >  -                                       install_name_mappings,
> verbose=False)
> >  +                    if install_rpath:
> > -+                        depfixer.fix_rpath(outname, install_rpath,
> final_path,
> > ++                        depfixer.fix_rpath(outname,
> t.rpath_dirs_to_remove, install_rpath, final_path,
> >  +                                           install_name_mappings,
> verbose=False)
> >  +                    else:
> >  +                        print("RPATH changes at install time disabled")
> > diff --git a/meta/recipes-devtools/meson/meson_0.54.3.bb
> b/meta/recipes-devtools/meson/meson_0.55.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/meson_0.54.3.bb
> > rename to meta/recipes-devtools/meson/meson_0.55.0.bb
> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.54.3.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.55.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/nativesdk-meson_0.54.3.bb
> > rename to meta/recipes-devtools/meson/nativesdk-meson_0.55.0.bb
> > --
> > 2.27.0
> >
> > 
>

--00000000000000766e05ac09069b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It is related; I have just sent a patch (to oe-core) =
to correct this.</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 3 Aug 2020 =
at 09:25, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">I wonder if this failure is related to this can you check<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/427901/" rel=3D"n=
oreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/=
427901/</a><br>
<br>
On Sat, Aug 1, 2020 at 2:23 PM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Rebase patches.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../0001-Make-CPU-family-warnings-fatal.patch | 19 ++++----<br>
&gt;=C2=A0 ...g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch | 48 +++++++++---=
-------<br>
&gt;=C2=A0 ...y-do-not-substitute-python-s-install.patch | 11 +++--<br>
&gt;=C2=A0 ...pport-building-allarch-recipes-again.patch |=C2=A0 4 +-<br>
&gt;=C2=A0 .../meson/meson/disable-rpath-handling.patch=C2=A0 | 10 ++--<br=
>
&gt;=C2=A0 .../{<a href=3D"http://meson_0.54.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">meson_0.54.3.bb</a> =3D&gt; <a href=3D"http://meson_0.55.0.bb=
" rel=3D"noreferrer" target=3D"_blank">meson_0.55.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://on_0.54.3.bb" rel=3D"noreferrer" target=3D=
"_blank">on_0.54.3.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.55.0.=
bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.55.0.bb</a>} |=
=C2=A0 0<br>
&gt;=C2=A0 8 files changed, 47 insertions(+), 47 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.5=
4.3.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.54.3.bb</a> =3D&gt; <a=
 href=3D"http://meson_0.55.0.bb" rel=3D"noreferrer" target=3D"_blank">meson=
_0.55.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativesdk=
-meson_0.54.3.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.54=
.3.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.55.0.bb" rel=3D"noref=
errer" target=3D"_blank">nativesdk-meson_0.55.0.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-dev=
tools/meson/meson.inc<br>
&gt; index ffa17b3061..607093a152 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; @@ -16,7 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/mes=
onbuild/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV=
}/meson-${P</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-modules-py=
thon.py-do-not-substitute-python-s-install.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gnome.py-p=
refix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f2bdf4cf0694e696b48261cdd14380fb1d0fe33=
d24744d8b2df0c12f33ebb662&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0a1ae2bfe2ae14ac47593537f93290fb79e9b77=
5c55b4c53c282bc3ca3745b35&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Make-CPU-family-warnings-fatal.patch =
\<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-w=
arnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-famil=
y-warnings-fatal.patch<br>
&gt; index 1be94a9b19..ceb2fde342 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings=
-fatal.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings=
-fatal.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt; -From 62c415eedb62905de76e2e0bbd156a947705cab2 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 5624b5835af747b601780ad14646f9c1fb854931 Mon Sep 17 00:00:00 20=
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
&gt; @@ -12,23 +12,23 @@ Signed-off-by: Ross Burton &lt;<a href=3D"mailto:=
ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<=
br>
&gt; -index 17058df..18bbf86 100644<br>
&gt; +index 219b62e..d1be65b 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt; -@@ -225,7 +225,7 @@ class MachineInfo:<br>
&gt; +@@ -199,7 +199,7 @@ class MachineInfo:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_family =3D literal[&#39;c=
pu_family&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cpu_family not in known_cp=
u_families:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown=
 CPU family %s, please report this at <a href=3D"https://github.com/mesonbu=
ild/meson/issues/new" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/mesonbuild/meson/issues/new</a>&#39; % cpu_family)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentExceptio=
n(&#39;Unknown CPU family %s, see <a href=3D"https://wiki.yoctoproject.org/=
wiki/Meson/UnknownCPU" rel=3D"noreferrer" target=3D"_blank">https://wiki.yo=
ctoproject.org/wiki/Meson/UnknownCPU</a> for directions.&#39; % cpu_family)=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mlog.warning(&#39;Unknown=
 CPU family {}, please report this at <a href=3D"https://github.com/mesonbu=
ild/meson/issues/new&#39;.format(cpu_family)" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/mesonbuild/meson/issues/new&#39;.format(cpu_fami=
ly)</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise EnvironmentExceptio=
n(&#39;Unknown CPU family {}, see <a href=3D"https://wiki.yoctoproject.org/=
wiki/Meson/UnknownCPU" rel=3D"noreferrer" target=3D"_blank">https://wiki.yo=
ctoproject.org/wiki/Meson/UnknownCPU</a> for directions.&#39;.format(cpu_fa=
mily))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endian =3D literal[&#39;endia=
n&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if endian not in (&#39;little=
&#39;, &#39;big&#39;):<br>
&gt;=C2=A0 diff --git a/mesonbuild/environment.py b/mesonbuild/environment=
.py<br>
&gt; -index a2f78a4..59fcb07 100644<br>
&gt; +index bf09a88..8eabe78 100644<br>
&gt;=C2=A0 --- a/mesonbuild/environment.py<br>
&gt;=C2=A0 +++ b/mesonbuild/environment.py<br>
&gt; -@@ -364,9 +364,7 @@ def detect_cpu_family(compilers: CompilersDict) =
-&gt; str:<br>
&gt; +@@ -375,9 +375,7 @@ def detect_cpu_family(compilers: CompilersDict) =
-&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trial =3D &#39;parisc&#39;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if trial not in known_cpu_families:<br>
&gt; @@ -39,3 +39,6 @@ index a2f78a4..59fcb07 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return trial<br>
&gt;<br>
&gt; +--<br>
&gt; +2.24.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g=
-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch b/meta/recipes-devtools/meson/mes=
on/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch<br>
&gt; index 35c18f0785..a1f8422d44 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-path=
s-with-PKG_CONFIG_SYSROOT_DI.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-path=
s-with-PKG_CONFIG_SYSROOT_DI.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 7be634fa9705d0367f48a91305f9acb642ff0a11 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 64aa6718c290e150dafd8da83f31cb08af00af0e Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 27 May 2020 16:43:05 +0000<br>
&gt;=C2=A0 Subject: [PATCH] gnome.py: prefix g-i paths with PKG_CONFIG_SYS=
ROOT_DIR<br>
&gt; @@ -9,33 +9,29 @@ determine when a custom variable is a path)<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - mesonbuild/modules/gnome.py | 8 ++++----<br>
&gt; - 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; + mesonbuild/modules/gnome.py | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/g=
nome.py<br>
&gt; -index 89d5d5d..d75f2e5 100644<br>
&gt; +index 52016f4..2b72ee4 100644<br>
&gt;=C2=A0 --- a/mesonbuild/modules/gnome.py<br>
&gt;=C2=A0 +++ b/mesonbuild/modules/gnome.py<br>
&gt; -@@ -739,17 +739,17 @@ class GnomeModule(ExtensionModule):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if giscanner.found():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0giscanner_path =3D g=
iscanner.get_command()[0]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not any(x in gisc=
anner_path for x in gi_util_dirs_check):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 giscanner =
=3D self.gir_dep.get_pkgconfig_variable(&#39;g_ir_scanner&#39;, {})<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 giscanner =
=3D os.environ[&#39;PKG_CONFIG_SYSROOT_DIR&#39;] + self.gir_dep.get_pkgcon=
fig_variable(&#39;g_ir_scanner&#39;, {})<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 giscanner =3D self.gir_de=
p.get_pkgconfig_variable(&#39;g_ir_scanner&#39;, {})<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 giscanner =3D os.environ[=
&#39;PKG_CONFIG_SYSROOT_DIR&#39;] + self.gir_dep.get_pkgconfig_variable(&#3=
9;g_ir_scanner&#39;, {})<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gicompiler =3D self.interpreter.fi=
nd_program_impl(&#39;g-ir-compiler&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if gicompiler.found():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gicompiler_path =3D =
gicompiler.get_command()[0]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not any(x in gico=
mpiler_path for x in gi_util_dirs_check):<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicompiler =
=
=3D self.gir_dep.get_pkgconfig_variable(&#39;g_ir_compiler&#39;, {})<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicompiler =
=
=3D os.environ[&#39;PKG_CONFIG_SYSROOT_DIR&#39;] + self.gir_dep.get_pkgcon=
fig_variable(&#39;g_ir_compiler&#39;, {})<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicompiler =3D self.gir_d=
ep.get_pkgconfig_variable(&#39;g_ir_compiler&#39;, {})<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicompiler =3D os.environ=
[&#39;PKG_CONFIG_SYSROOT_DIR&#39;] + self.gir_dep.get_pkgconfig_variable(&#=
39;g_ir_compiler&#39;, {})<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns =3D kwargs.pop(&#39;namespace&#=
39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nsversion =3D kwargs.pop(&#39;nsve=
rsion&#39;)<br>
&gt; +@@ -410,14 +410,14 @@ class GnomeModule(ExtensionModule):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if giscanner is not =
None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.g=
iscanner =3D ExternalProgram.from_entry(&#39;g-ir-scanner&#39;, giscanner)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif self.gir_dep.ty=
pe_name =3D=3D &#39;pkgconfig&#39;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.giscan=
ner =3D ExternalProgram(&#39;g_ir_scanner&#39;, self.gir_dep.get_pkgconfig_=
variable(&#39;g_ir_scanner&#39;, {}))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.giscan=
ner =3D ExternalProgram(&#39;g_ir_scanner&#39;, os.environ[&#39;PKG_CONFIG_=
SYSROOT_DIR&#39;] + self.gir_dep.get_pkgconfig_variable(&#39;g_ir_scanner&#=
39;, {}))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.g=
iscanner =3D self.interpreter.find_program_impl(&#39;g-ir-scanner&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gicompiler =3D state=
.environment.lookup_binary_entry(MachineChoice.HOST, &#39;g-ir-compiler&#39=
;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if gicompiler is not=
 None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.g=
icompiler =3D ExternalProgram.from_entry(&#39;g-ir-compiler&#39;, gicompile=
r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif self.gir_dep.ty=
pe_name =3D=3D &#39;pkgconfig&#39;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gicomp=
iler =3D ExternalProgram(&#39;g_ir_compiler&#39;, self.gir_dep.get_pkgconfi=
g_variable(&#39;g_ir_compiler&#39;, {}))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.gicomp=
iler =3D ExternalProgram(&#39;g_ir_compiler&#39;, os.environ[&#39;PKG_CONFI=
G_SYSROOT_DIR&#39;] + self.gir_dep.get_pkgconfig_variable(&#39;g_ir_compile=
r&#39;, {}))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.g=
icompiler =3D self.interpreter.find_program_impl(&#39;g-ir-compiler&#39;)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.gir_dep, self.giscanne=
r, self.gicompiler<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-modules-python.py=
-do-not-substitute-python-s-install.patch b/meta/recipes-devtools/meson/mes=
on/0001-modules-python.py-do-not-substitute-python-s-install.patch<br>
&gt; index a25c392270..c0ad01e9d3 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not=
-substitute-python-s-install.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not=
-substitute-python-s-install.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1d178fb2928d325e339b15972890ceced863d3ec Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 214e559d394491b1376e4cc370f75151117a3f83 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 18 Apr 2019 17:36:11 +0200<br>
&gt;=C2=A0 Subject: [PATCH] modules/python.py: do not substitute python&#3=
9;s install prefix<br>
&gt; @@ -10,15 +10,16 @@ b) shouldn&#39;t be necessary as Python&#39;s pre=
fix ought to be correct in the first pl<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0mesonbuild/modules/python.py | 7 +++----<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/=
python.py<br>
&gt; -index 6e2c63b..f5a37ac 100644<br>
&gt; +index 2f0c644..d2aa565 100644<br>
&gt;=C2=A0 --- a/mesonbuild/modules/python.py<br>
&gt;=C2=A0 +++ b/mesonbuild/modules/python.py<br>
&gt; -@@ -254,7 +254,7 @@ import sysconfig<br>
&gt; +@@ -251,7 +251,7 @@ INTROSPECT_COMMAND =3D &#39;&#39;&#39;import sys=
config<br>
&gt;=C2=A0 =C2=A0import json<br>
&gt;=C2=A0 =C2=A0import sys<br>
&gt;<br>
&gt; @@ -27,8 +28,8 @@ index 6e2c63b..f5a37ac 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0def links_against_libpython():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from distutils.core import Distribution, Ex=
tension<br>
&gt; -@@ -279,12 +279,11 @@ class PythonInstallation(ExternalProgramHolder=
):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ExternalProgramHolder.__init__(sel=
f, python)<br>
&gt; +@@ -276,12 +276,11 @@ class PythonInstallation(ExternalProgramHolder=
):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ExternalProgramHolder.__init__(sel=
f, python, interpreter.subproject)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.interpreter =3D interpre=
ter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.subproject =3D self.inte=
rpreter.subproject<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D self.interpreter.enviro=
nment.coredata.get_builtin_option(&#39;prefix&#39;)<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-=
allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Suppor=
t-building-allarch-recipes-again.patch<br>
&gt; index b5b463e68e..7a3b01262e 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch=
-recipes-again.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch=
-recipes-again.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From d976d5a8abd6d42edf794d2a4c211fc6697fb14c Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 4b283d545152092fec12b9d80219161d11002c72 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" ta=
rget=3D"_blank">pkj@axis.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 26 Jul 2018 16:32:49 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Support building allarch recipes again<br>
&gt; @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"ma=
ilto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py<=
br>
&gt; -index 18bbf86..e76315e 100644<br>
&gt; +index dc20616..f54adcd 100644<br>
&gt;=C2=A0 --- a/mesonbuild/envconfig.py<br>
&gt;=C2=A0 +++ b/mesonbuild/envconfig.py<br>
&gt;=C2=A0 @@ -36,6 +36,7 @@ _T =3D T.TypeVar(&#39;_T&#39;)<br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling=
.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch<br>
&gt; index 38e50d72f4..4653a72a20 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch<=
br>
&gt; +++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch<=
br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3af10fa8cd4e97181288d72227dea712290fd5e6 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 9e3fcf192c1ca068d310c648c311f9d850214421 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt=
;<br>
&gt;=C2=A0 Date: Fri, 23 Nov 2018 15:28:28 +0000<br>
&gt;=C2=A0 Subject: [PATCH] meson: Disable rpath stripping at install time=
<br>
&gt; @@ -16,17 +16,17 @@ Upstream-Status: Submitted [<a href=3D"https://gi=
thub.com/mesonbuild/meson/issues/2567" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/mesonbuild/meson/issues/2567</a>]<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py<br=
>
&gt; -index ace0569..85bd8df 100644<br>
&gt; +index 0be01fe..5406cab 100644<br>
&gt;=C2=A0 --- a/mesonbuild/minstall.py<br>
&gt;=C2=A0 +++ b/mesonbuild/minstall.py<br>
&gt; -@@ -508,8 +508,11 @@ class Installer:<br>
&gt; +@@ -512,8 +512,11 @@ class Installer:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if file_copied:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
elf.did_install_something =3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
ry:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 depfixer.fix_rpath(outname, install_rpath, final_path,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, fin=
al_path,<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0install_name_mappings, verbose=3DFalse)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if install_rpath:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 depfixer.fix_rpath(outname, install_rpath, final_path,<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, inst=
all_rpath, final_path,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0install_name_mappings, verbose=3DFalse)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 print(&quot;RPATH changes at install time disabled&qu=
ot;)<br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.54=
.3.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.54.3.bb</a> b/meta/reci=
pes-devtools/meson/<a href=3D"http://meson_0.55.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">meson_0.55.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.54.=
3.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.54.3.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.55.0.=
bb" rel=3D"noreferrer" target=3D"_blank">meson_0.55.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-=
meson_0.54.3.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.54.=
3.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.=
55.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.55.0.bb</a>=
<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-m=
eson_0.54.3.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.54.3=
.bb</a><br>
&gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-mes=
on_0.55.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.55.0.b=
b</a><br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--00000000000000766e05ac09069b--
