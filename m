Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.6317.1596439524414468446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 00:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOF0KSLi;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id t6so11986681qvw.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFBAaddKmdErTLbHgAP5WZuektx8ytL/C0ELvDMzvOk=;
        b=jOF0KSLiBXyMTAFjGVKCVTvgH6RO5UKVFS63hJ7i5IXEuDqbpEPEKtaIPFztHG88/R
         3XQXnMaEF+J05IX5AoydcsXvtm4rM0il6ES1y3Ay3XGznKT0AEKqMwgJz0ZROroIHrsz
         qaNWa/fBQxvGS/cYO+MYnKBGzVwWKuchUUbi99rKLG/Abr3Ag0B65HBGrAbG/T0RqwqZ
         ddO3prpYHd5i3ahQGpAVTfIIiMnV7zbHZ366tePg8wPbCQjBSCL8BNntcrduQhSsCEma
         uWJZkGyGh/TOVuMDoHRoFVYt2i7feu81O/12VmfHaQ19guCJRsp+heTqk0BnR4pgqDin
         W6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFBAaddKmdErTLbHgAP5WZuektx8ytL/C0ELvDMzvOk=;
        b=Yn0kiWK5EqYpJAXBtEFVlH3GWQ+0g5s9hQ4SbIkHFHoWhwGzIkGBSkgB1hLPJ9Tzij
         GWchhce7etPyKHUVPdSL1+ctK8Ap537CUM+Y8dHUyZHQhSp/r0uIjL2BbLIz7ialX05x
         Dj/PSOyz3SYyqbPlkUvPdQi7biyn8ygm4MGzyYAVu1UjKa0jI+GOVRs4M6B705ID4dLd
         pHHTzDSc7ARTaPRrfAku7TFOz2OQTL6MvNAjPAtyFrlQRTwiy1kfC3hwYFVoPKvtvCjz
         yW1DSIfAIlHWDhpY0c291ymsBTeeVBSbHR0Gm4UMZ1Tsgol41FB97SgbtS/31wfl7sVx
         gY3A==
X-Gm-Message-State: AOAM531omoF8mIMNI2xfpbsrZmuiv+0OHCFiJJeROLXYLWYtnBZ9fAtc
	GtsJQ+jvzjUTXb4nK8uxt1zc2eI20MjOykxrkOs=
X-Google-Smtp-Source: ABdhPJz1/2dG4K5fqhLT9VevyCFZdytzKkOaOn/JE8iVHp9P4qRXYirLIjKG6ZmPppvYui/IE+mjvN6YZk8K6fRNt+Q=
X-Received: by 2002:a0c:b591:: with SMTP id g17mr15736015qve.4.1596439523340;
 Mon, 03 Aug 2020 00:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200801212335.14922-1-alex.kanavin@gmail.com> <20200801212335.14922-5-alex.kanavin@gmail.com>
In-Reply-To: <20200801212335.14922-5-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 3 Aug 2020 00:24:57 -0700
Message-ID: <CAMKF1sq9LxFDSYmk8gR9bxb1pi+wCsmnYXS9HYE0_rQp5NfsMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] meson: update 0.54.3 -> 0.55.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I wonder if this failure is related to this can you check

http://errors.yoctoproject.org/Errors/Details/427901/

On Sat, Aug 1, 2020 at 2:23 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Rebase patches.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  2 +-
>  .../0001-Make-CPU-family-warnings-fatal.patch | 19 ++++----
>  ...g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch | 48 +++++++++----------
>  ...y-do-not-substitute-python-s-install.patch | 11 +++--
>  ...pport-building-allarch-recipes-again.patch |  4 +-
>  .../meson/meson/disable-rpath-handling.patch  | 10 ++--
>  .../{meson_0.54.3.bb => meson_0.55.0.bb}      |  0
>  ...on_0.54.3.bb => nativesdk-meson_0.55.0.bb} |  0
>  8 files changed, 47 insertions(+), 47 deletions(-)
>  rename meta/recipes-devtools/meson/{meson_0.54.3.bb => meson_0.55.0.bb} (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.54.3.bb => nativesdk-meson_0.55.0.bb} (100%)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> index ffa17b3061..607093a152 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
>             file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
>             "
> -SRC_URI[sha256sum] = "f2bdf4cf0694e696b48261cdd14380fb1d0fe33d24744d8b2df0c12f33ebb662"
> +SRC_URI[sha256sum] = "0a1ae2bfe2ae14ac47593537f93290fb79e9b775c55b4c53c282bc3ca3745b35"
>
>  SRC_URI_append_class-native = " \
>      file://0001-Make-CPU-family-warnings-fatal.patch \
> diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> index 1be94a9b19..ceb2fde342 100644
> --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> @@ -1,7 +1,7 @@
> -From 62c415eedb62905de76e2e0bbd156a947705cab2 Mon Sep 17 00:00:00 2001
> +From 5624b5835af747b601780ad14646f9c1fb854931 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 3 Jul 2018 13:59:09 +0100
> -Subject: [PATCH] Make CPU family warnings fatal
> +Subject: [PATCH 1/2] Make CPU family warnings fatal
>
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
> @@ -12,23 +12,23 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index 17058df..18bbf86 100644
> +index 219b62e..d1be65b 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
> -@@ -225,7 +225,7 @@ class MachineInfo:
> +@@ -199,7 +199,7 @@ class MachineInfo:
>
>           cpu_family = literal['cpu_family']
>           if cpu_family not in known_cpu_families:
> --            mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % cpu_family)
> -+            raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % cpu_family)
> +-            mlog.warning('Unknown CPU family {}, please report this at https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
> ++            raise EnvironmentException('Unknown CPU family {}, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.'.format(cpu_family))
>
>           endian = literal['endian']
>           if endian not in ('little', 'big'):
>  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> -index a2f78a4..59fcb07 100644
> +index bf09a88..8eabe78 100644
>  --- a/mesonbuild/environment.py
>  +++ b/mesonbuild/environment.py
> -@@ -364,9 +364,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
> +@@ -375,9 +375,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
>           trial = 'parisc'
>
>       if trial not in known_cpu_families:
> @@ -39,3 +39,6 @@ index a2f78a4..59fcb07 100644
>
>       return trial
>
> +--
> +2.24.0
> +
> diff --git a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> index 35c18f0785..a1f8422d44 100644
> --- a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
> @@ -1,4 +1,4 @@
> -From 7be634fa9705d0367f48a91305f9acb642ff0a11 Mon Sep 17 00:00:00 2001
> +From 64aa6718c290e150dafd8da83f31cb08af00af0e Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 27 May 2020 16:43:05 +0000
>  Subject: [PATCH] gnome.py: prefix g-i paths with PKG_CONFIG_SYSROOT_DIR
> @@ -9,33 +9,29 @@ determine when a custom variable is a path)
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - mesonbuild/modules/gnome.py | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> + mesonbuild/modules/gnome.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index 89d5d5d..d75f2e5 100644
> +index 52016f4..2b72ee4 100644
>  --- a/mesonbuild/modules/gnome.py
>  +++ b/mesonbuild/modules/gnome.py
> -@@ -739,17 +739,17 @@ class GnomeModule(ExtensionModule):
> -         if giscanner.found():
> -             giscanner_path = giscanner.get_command()[0]
> -             if not any(x in giscanner_path for x in gi_util_dirs_check):
> --                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> -+                giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> -         else:
> --            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> -+            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> -
> -         gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
> -         if gicompiler.found():
> -             gicompiler_path = gicompiler.get_command()[0]
> -             if not any(x in gicompiler_path for x in gi_util_dirs_check):
> --                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> -+                gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> -         else:
> --            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> -+            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> -
> -         ns = kwargs.pop('namespace')
> -         nsversion = kwargs.pop('nsversion')
> +@@ -410,14 +410,14 @@ class GnomeModule(ExtensionModule):
> +             if giscanner is not None:
> +                 self.giscanner = ExternalProgram.from_entry('g-ir-scanner', giscanner)
> +             elif self.gir_dep.type_name == 'pkgconfig':
> +-                self.giscanner = ExternalProgram('g_ir_scanner', self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {}))
> ++                self.giscanner = ExternalProgram('g_ir_scanner', os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {}))
> +             else:
> +                 self.giscanner = self.interpreter.find_program_impl('g-ir-scanner')
> +             gicompiler = state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-compiler')
> +             if gicompiler is not None:
> +                 self.gicompiler = ExternalProgram.from_entry('g-ir-compiler', gicompiler)
> +             elif self.gir_dep.type_name == 'pkgconfig':
> +-                self.gicompiler = ExternalProgram('g_ir_compiler', self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {}))
> ++                self.gicompiler = ExternalProgram('g_ir_compiler', os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {}))
> +             else:
> +                 self.gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
> +         return self.gir_dep, self.giscanner, self.gicompiler
> diff --git a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> index a25c392270..c0ad01e9d3 100644
> --- a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
> @@ -1,4 +1,4 @@
> -From 1d178fb2928d325e339b15972890ceced863d3ec Mon Sep 17 00:00:00 2001
> +From 214e559d394491b1376e4cc370f75151117a3f83 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 18 Apr 2019 17:36:11 +0200
>  Subject: [PATCH] modules/python.py: do not substitute python's install prefix
> @@ -10,15 +10,16 @@ b) shouldn't be necessary as Python's prefix ought to be correct in the first pl
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   mesonbuild/modules/python.py | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
>  diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> -index 6e2c63b..f5a37ac 100644
> +index 2f0c644..d2aa565 100644
>  --- a/mesonbuild/modules/python.py
>  +++ b/mesonbuild/modules/python.py
> -@@ -254,7 +254,7 @@ import sysconfig
> +@@ -251,7 +251,7 @@ INTROSPECT_COMMAND = '''import sysconfig
>   import json
>   import sys
>
> @@ -27,8 +28,8 @@ index 6e2c63b..f5a37ac 100644
>
>   def links_against_libpython():
>       from distutils.core import Distribution, Extension
> -@@ -279,12 +279,11 @@ class PythonInstallation(ExternalProgramHolder):
> -         ExternalProgramHolder.__init__(self, python)
> +@@ -276,12 +276,11 @@ class PythonInstallation(ExternalProgramHolder):
> +         ExternalProgramHolder.__init__(self, python, interpreter.subproject)
>           self.interpreter = interpreter
>           self.subproject = self.interpreter.subproject
>  -        prefix = self.interpreter.environment.coredata.get_builtin_option('prefix')
> diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> index b5b463e68e..7a3b01262e 100644
> --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> @@ -1,4 +1,4 @@
> -From d976d5a8abd6d42edf794d2a4c211fc6697fb14c Mon Sep 17 00:00:00 2001
> +From 4b283d545152092fec12b9d80219161d11002c72 Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Thu, 26 Jul 2018 16:32:49 +0200
>  Subject: [PATCH] Support building allarch recipes again
> @@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index 18bbf86..e76315e 100644
> +index dc20616..f54adcd 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
>  @@ -36,6 +36,7 @@ _T = T.TypeVar('_T')
> diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> index 38e50d72f4..4653a72a20 100644
> --- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> +++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> @@ -1,4 +1,4 @@
> -From 3af10fa8cd4e97181288d72227dea712290fd5e6 Mon Sep 17 00:00:00 2001
> +From 9e3fcf192c1ca068d310c648c311f9d850214421 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Fri, 23 Nov 2018 15:28:28 +0000
>  Subject: [PATCH] meson: Disable rpath stripping at install time
> @@ -16,17 +16,17 @@ Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
>  diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
> -index ace0569..85bd8df 100644
> +index 0be01fe..5406cab 100644
>  --- a/mesonbuild/minstall.py
>  +++ b/mesonbuild/minstall.py
> -@@ -508,8 +508,11 @@ class Installer:
> +@@ -512,8 +512,11 @@ class Installer:
>               if file_copied:
>                   self.did_install_something = True
>                   try:
> --                    depfixer.fix_rpath(outname, install_rpath, final_path,
> +-                    depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
>  -                                       install_name_mappings, verbose=False)
>  +                    if install_rpath:
> -+                        depfixer.fix_rpath(outname, install_rpath, final_path,
> ++                        depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
>  +                                           install_name_mappings, verbose=False)
>  +                    else:
>  +                        print("RPATH changes at install time disabled")
> diff --git a/meta/recipes-devtools/meson/meson_0.54.3.bb b/meta/recipes-devtools/meson/meson_0.55.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.54.3.bb
> rename to meta/recipes-devtools/meson/meson_0.55.0.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.54.3.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.55.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.54.3.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.55.0.bb
> --
> 2.27.0
>
> 
