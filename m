Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web12.9686.1607704413556654121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 08:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WRNO27Ls;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id r17so9309251ilo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L0zykB2AES8eRah4DbXrE8I7dQnyvflr/kXIlrzCIww=;
        b=WRNO27LsJGvBYp9eoWPSEtqtb/mndu88V3PvUOuedwL+SwpwQ8MbU16prIAmtZw6J9
         aNdLZaZlKi0ZayTMIkPDtIzfRLBlphjZnKdJTOlOa6uomRh8/rSSAr8ZIeaV+m3fJWgD
         x6Z9yBCv030QUQUSRzDf780cbBoZ/Sfe5UywiEsRhiiZTl3hYC8dPyCDLuZBsVWvqdJE
         TJrqzhGnZo5IdljSdkP0e3/S7BEzeAO7Pv1rJVHfjsG3IXuegy1DqGbYnIG5Be+/pRTT
         r3LG9WjKtk94qUXlD9A2vIIXaFmVY6Ppc47gEwbBnu30KvjeLQCi2X5POf51cKePX6lx
         0oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0zykB2AES8eRah4DbXrE8I7dQnyvflr/kXIlrzCIww=;
        b=njTX5jxZsI91q58+3wTX8SoruKAxkM0tmPC2BOawX1N00po1VmD+mKvoTwU3fD7Oie
         VdqXEfpo8s6s9gNU3n7zn7U2PaM7RlhkRex8xqUDH+5HWwoeznHOeRWe0S1+y5QB+5DD
         HQD90IaXtNwnf1ZRjC43t2mdU/IlC2ugDfrsson0C7l3tNpRrAP8Mi6TkmCkv0009AwP
         s0iS2k3+ZizftNzlVwNeV7oRAsuSjoZdub64xNJAh9Q2xX0hRKtOIGb7pEpeM00OEAb7
         0XZCtIUgt+TOCdI7MeoYXTwuZDQYWADgT07D9M6/rNQRmfQ+Cbx868JQRt1rsez9wqq9
         MWOA==
X-Gm-Message-State: AOAM5331/XegaNbdyNd5ddSr6SN/etprFqvxZ3+dsl1EN+qRh7pJPrUg
	wMicmo1rhhphfW8vRDSzvwfFAeaivAD+o2GTBi0=
X-Google-Smtp-Source: ABdhPJzowhtTR/7LyvLTAel9VIcOtHtnjKWcMCEslNTpSXTa0UQIg8xsaUXokneSNdHqu8rsgMAA4olC71UIAOzpor8=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr16078026ilq.131.1607704412889;
 Fri, 11 Dec 2020 08:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20201211073640.479105-1-anuj.mittal@intel.com> <20201211073640.479105-2-anuj.mittal@intel.com>
In-Reply-To: <20201211073640.479105-2-anuj.mittal@intel.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 11 Dec 2020 08:33:05 -0800
Message-ID: <CAKmqyKPXonciEsGvJwtcQBNLEQTghOr=pVu+VYDravYF1rXmkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] mesa: remove patch disabling asm
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 11:37 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> This was originally added for musl only [1]. Upstream has removed this
> option but we reverted that change during an upgrade to fix certain
> musl specific compile time issues [2].
>
> I compile tested without this patch on musl-x86 and musl-x86-64 and
> don't see the warnings anymore. Similar textrel issues were fixed
> upstream so perhaps those helped [3].
>
> [1] https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit?id=68bf128e901e89d5b49a28b15d5083b2bf6b536f
> [2] https://www.openembedded.org/pipermail/openembedded-core/2019-November/289222.html
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/commit/45206d7673adb1484cbdb3eadaf82e0849c9cdcf?merge_request_iid=1974
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...le-asm-unconditionally-now-that-gen_.patch | 147 ------------------
>  meta/recipes-graphics/mesa/mesa.inc           |   4 -
>  2 files changed, 151 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> deleted file mode 100644
> index 833742359f..0000000000
> --- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> +++ /dev/null
> @@ -1,147 +0,0 @@
> -From 43d9e40db7357f27e91002b2bb7688b6775ebb43 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair@alistair23.me>
> -Date: Thu, 14 Nov 2019 09:06:02 -0800
> -Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
> - gen_matypes is gone."
> -
> -This reverts commit 20294dceebc23236e33b22578245f7e6f41b6997.
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Alistair Francis <alistair@alistair23.me>
> -
> ----
> - meson.build       | 94 ++++++++++++++++++++++++++++++-----------------
> - meson_options.txt |  6 +++
> - 2 files changed, 67 insertions(+), 33 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index e7dc599..e2fc934 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -52,6 +52,7 @@ pre_args = [
> - with_vulkan_icd_dir = get_option('vulkan-icd-dir')
> - with_tests = get_option('build-tests')
> - with_aco_tests = get_option('build-aco-tests')
> -+with_asm = get_option('asm')
> - with_glx_read_only_text = get_option('glx-read-only-text')
> - with_glx_direct = get_option('glx-direct')
> - with_osmesa = get_option('osmesa')
> -@@ -1154,41 +1155,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required : with_platform_windows)
> -
> - # TODO: shared/static? Is this even worth doing?
> -
> -+# When cross compiling we generally need to turn off the use of assembly,
> -+# because mesa's assembly relies on building an executable for the host system,
> -+# and running it to get information about struct sizes. There is at least one
> -+# case of cross compiling where we can use asm, and that's x86_64 -> x86 when
> -+# host OS == build OS, since in that case the build machine can run the host's
> -+# binaries.
> -+if with_asm and meson.is_cross_build()
> -+  if build_machine.system() != host_machine.system()
> -+    # TODO: It may be possible to do this with an exe_wrapper (like wine).
> -+    message('Cross compiling from one OS to another, disabling assembly.')
> -+    with_asm = false
> -+  elif not (build_machine.cpu_family().startswith('x86') and host_machine.cpu_family() == 'x86')
> -+    # FIXME: Gentoo always sets -m32 for x86_64 -> x86 builds, resulting in an
> -+    # x86 -> x86 cross compile. We use startswith rather than == to handle this
> -+    # case.
> -+    # TODO: There may be other cases where the 64 bit version of the
> -+    # architecture can run 32 bit binaries (aarch64 and armv7 for example)
> -+    message('''
> -+      Cross compiling to different architectures, and the host cannot run
> -+      the build machine's binaries. Disabling assembly.
> -+    ''')
> -+    with_asm = false
> -+  endif
> -+endif
> -+
> - with_asm_arch = ''
> --if host_machine.cpu_family() == 'x86'
> --  if system_has_kms_drm or host_machine.system() == 'gnu'
> --    with_asm_arch = 'x86'
> --    pre_args += ['-DUSE_X86_ASM', '-DUSE_MMX_ASM', '-DUSE_3DNOW_ASM',
> --                 '-DUSE_SSE_ASM']
> --
> --    if with_glx_read_only_text
> --      pre_args += ['-DGLX_X86_READONLY_TEXT']
> -+if with_asm
> -+  if host_machine.cpu_family() == 'x86'
> -+    if system_has_kms_drm or host_machine.system() == 'gnu'
> -+      with_asm_arch = 'x86'
> -+      pre_args += ['-DUSE_X86_ASM', '-DUSE_MMX_ASM', '-DUSE_3DNOW_ASM',
> -+                   '-DUSE_SSE_ASM']
> -+
> -+      if with_glx_read_only_text
> -+         pre_args += ['-DGLX_X86_READONLY_TEXT']
> -+      endif
> -+    endif
> -+  elif host_machine.cpu_family() == 'x86_64'
> -+    if system_has_kms_drm
> -+      with_asm_arch = 'x86_64'
> -+      pre_args += ['-DUSE_X86_64_ASM']
> -+    endif
> -+  elif host_machine.cpu_family() == 'arm'
> -+    if system_has_kms_drm
> -+      with_asm_arch = 'arm'
> -+      pre_args += ['-DUSE_ARM_ASM']
> -+    endif
> -+  elif host_machine.cpu_family() == 'aarch64'
> -+    if system_has_kms_drm
> -+      with_asm_arch = 'aarch64'
> -+      pre_args += ['-DUSE_AARCH64_ASM']
> -+    endif
> -+  elif host_machine.cpu_family() == 'sparc64'
> -+    if system_has_kms_drm
> -+      with_asm_arch = 'sparc'
> -+      pre_args += ['-DUSE_SPARC_ASM']
> -+    endif
> -+  elif host_machine.cpu_family().startswith('ppc64') and host_machine.endian() == 'little'
> -+    if system_has_kms_drm
> -+      with_asm_arch = 'ppc64le'
> -+      pre_args += ['-DUSE_PPC64LE_ASM']
> -     endif
> --  endif
> --elif host_machine.cpu_family() == 'x86_64'
> --  if system_has_kms_drm
> --    with_asm_arch = 'x86_64'
> --    pre_args += ['-DUSE_X86_64_ASM']
> --  endif
> --elif host_machine.cpu_family() == 'arm'
> --  if system_has_kms_drm
> --    with_asm_arch = 'arm'
> --    pre_args += ['-DUSE_ARM_ASM']
> --  endif
> --elif host_machine.cpu_family() == 'aarch64'
> --  if system_has_kms_drm
> --    with_asm_arch = 'aarch64'
> --    pre_args += ['-DUSE_AARCH64_ASM']
> --  endif
> --elif host_machine.cpu_family() == 'sparc64'
> --  if system_has_kms_drm
> --    with_asm_arch = 'sparc'
> --    pre_args += ['-DUSE_SPARC_ASM']
> --  endif
> --elif host_machine.cpu_family().startswith('ppc64') and host_machine.endian() == 'little'
> --  if system_has_kms_drm
> --    with_asm_arch = 'ppc64le'
> --    pre_args += ['-DUSE_PPC64LE_ASM']
> -   endif
> - endif
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 147cccb..562b059 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -254,6 +254,12 @@ option(
> -   value : false,
> -   description : 'Enable GLVND support.'
> - )
> -+option(
> -+  'asm',
> -+  type : 'boolean',
> -+  value : true,
> -+  description : 'Build assembly code if possible'
> -+)
> - option(
> -    'glx-read-only-text',
> -    type : 'boolean',
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 7956d95fc1..dba23f586f 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,7 +17,6 @@ PE = "2"
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
>             file://0002-meson.build-make-TLS-ELF-optional.patch \
> -           file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
>             file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> @@ -178,9 +177,6 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
>
>  PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
>
> -# mesa tries to run cross-built gen_matypes on build machine to get struct size information
> -EXTRA_OEMESON_append = " -Dasm=false"
> -
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>
> --
> 2.29.2
>
>
> 
>
