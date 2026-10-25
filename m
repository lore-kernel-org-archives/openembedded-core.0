Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25636.1792945843209366706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 09:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OrKE5xSA;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so2889168c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945843; x=1793550643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBMkmBvcip27SrGYLhbSpWOL3vyHWLoSnyt96XuF8zg=;
        b=OrKE5xSAc2H8g9PBFiuUf2bS4HHUlwVzyeQFzjUEWxafF6OhgTP94gDeYjviWhhffX
         u2VgwABwF/dvKlfejLXmKI1BkCdP8NxQn/re+llZy1yhvwJU06IoLuXymSBZvebjV7x/
         nBJ10EEi0dr01pY/eOw/+EJ55Ig8SSPlqa8UEyn8hb7zUHjlxHr0lYXxvjIJF8igKoQv
         Rr0bwQuHMlYDmsr/bY1ezo7unBFM7XXgSVbUR6SrYmW2ymw4BScPV4qff4bLr0gz5JTJ
         qYKtkXbs5/Qy1i24Lw05Ftjt2TdQCyBum3u7Pk+MEfNbyOyAgnczABKEpnd3+Oae34G0
         +zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945843; x=1793550643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBMkmBvcip27SrGYLhbSpWOL3vyHWLoSnyt96XuF8zg=;
        b=CRtogHaKTgeFgBIfPxlt3dTtuMPRpw3ELyPHWHKxECY8EOHbW6Xx+7vNSofBlt66hz
         kjlrkrWp5/EX3YG7MqhGLjrrhIczmbp81AwFtxSTc1Mvzvo7yKTDLGh2Ncpq/hiMpgXU
         1YWzRpvndxIHzSROZsa3Uxqm9T4/DVHSEHa1uRDYRHIrcBQ01ZjunuTeIzchvJ0xIqIU
         UkBh1zcxf1sXiwvl25LUG5as0hV/bQfQQDKlDo4FKMOqRiXFce2cIRE5JW1tNe3FUnEW
         Nij4oxP4ehhy58OkJwCLh7Du1b+0qQak99SQHnyo/PUL6BvthM2A6hX6VnbXgLr8umIk
         gqbQ==
X-Gm-Message-State: AFq9FYL1xhxwx8nMtJmOD9dD9k8epMgn3r1y/ZSzq9s+rETHrAF1AMtH
	D0y/ypmXV1N7H7XAUyldcuzUOLmoYG+aABIavu6y300mLV8UYQlyDL65wARwv0yregI=
X-Gm-Gg: AYBFou23F9y9zAx0u+6sobCAKh3wUYer0CVT1YQLeolsGCOA6pT2S2kuDRh49zvg4be
	RNu3t7lcIPBX3c0/Dp51w8nNLgh5KSAkM8fNexSA+Nm4yz/VzWuWlWK/u7vW4e63ClOuyaxEr+t
	rIyQpxyQ0PlKIoY3r8iZT6OmWOeNOiXm82LUcU2i0HQscHEDAfiYpWaL5WZh2EYeR4FPJ5wLiwH
	X6OAnWyzZE6D25vQdzA1r7g5vzn8M1OG3hiVn2SPqSMv7HQRqUG5uZjDc96gMud3bwnvoqdbgcL
	MVPn8qhSyTiiFznP+XsJqaB4PGFeBdy9BMpuojaIyy2rmg7Qm9XMBbIMShHpOLFJc2NLnJ3TR+a
	BvEgHpPjnRu6YZ+NdGpOPEbOHkH0UhEfi9vpmOX5Vo+5Fo/ZiHqVb/ymUtSc/4TQRvZEbo1dSJG
	p/UkoqVbBNn19hNdW34ZdoCPHvaI8EZEJq8e0j2vcG/CjZrxLq4izCiY0qbCIUMRFXyOV+x3lbO
	+O1P2uVNa1qsR8sScnAwGBy1SU3pw1l+8qEO6Jb4VzhyuRJBcyc/tT8PI9tAMIVQs2zMimLo0Us
	X/gOsYlslDmvkOv18Qk/JN8DkNv5wnffM+jgfalUbZ+T1WiOpjcwm2q8uwP4362lZHwfp5ZeTLQ
	dd0sCY0JTiZiT5wLT2qAd8RxYQqNiD3gRWQaTi6r3KtVJ8ywIxdsHgEj9qTlLfldusZY0x1PJI1
	HPRYOFKEQcXfh+7X7to+pvXCL2HRO5BnZpnkrN4P1eYT9kK0V6MrAbIy9X+7EporVL++GxQMYlR
	r9DXwD9+3CK7jr4WdyVDC6t00JgumE=
X-Received: by 2002:a05:701a:ca0d:b0:144:eb46:be0 with SMTP id a92af1059eb24-19934a952bbmr7725013c88.13.1792945842359;
        Sun, 25 Oct 2026 09:30:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm18042806c88.7.2026.10.25.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:30:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] mesa: Fix TLSDESC detection on RISC-V
Date: Sun, 25 Oct 2026 09:30:36 -0700
Message-ID: <20261025163036.3190745-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 16:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248610
Content-Type: text/plain; charset="utf-8"

mesa's meson.build enables -mtls-dialect=desc when a probe program built
with it runs. The probe's TLS access is in the executable itself, where
the linker relaxes it (lld always rewrites TLSDESC to local-exec), so it
passes even when the libc has no TLS descriptor support. glibc has none
on RISC-V, so mesa built with clang/lld fails to load:

  libgallium-26.2.4.so: unexpected reloc type 0x0c

This shows up e.g. when gstreamer1.0-plugins-base runs the GstGL
introspection dumper under qemu. Add the patch submitted upstream, which
moves the probe's TLS access into a shared library, so the dynamic
loader has to process the TLSDESC relocation.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...LSDESC-support-with-a-shared-library.patch | 89 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch b/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch
new file mode 100644
index 0000000000..397e9935d4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-check-TLSDESC-support-with-a-shared-library.patch
@@ -0,0 +1,89 @@
+From f5bde7a5bda6bc10eafd132e0a8a8e7ce9a69779 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 25 Oct 2026 09:09:05 -0700
+Subject: [PATCH] meson: check TLSDESC support with a shared library
+
+The -mtls-dialect probe runs a program whose own TLS access is meant to
+exercise the dynamic loader. However, the linker relaxes TLS accesses
+in an executable, even when compiled with -fpic: lld always rewrites
+TLSDESC to local-exec there. The probe then passes on systems whose
+libc has no TLS descriptor support, e.g. glibc on RISC-V, and mesa is
+built with -mtls-dialect=desc. Loading libgallium then fails with:
+
+  libgallium-26.2.4.so: unexpected reloc type 0x0c
+
+Build the TLS access into a shared library instead and run a program
+linked against it, so the dynamic loader has to process the TLSDESC
+relocation.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45593]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ build-support/conftest-tlsdesc.c | 23 +++++++++++++++++++++++
+ meson.build                      | 21 ++++++++++++++++++---
+ 2 files changed, 41 insertions(+), 3 deletions(-)
+ create mode 100644 build-support/conftest-tlsdesc.c
+
+diff --git a/build-support/conftest-tlsdesc.c b/build-support/conftest-tlsdesc.c
+new file mode 100644
+index 00000000000..2351f6fef10
+--- /dev/null
++++ b/build-support/conftest-tlsdesc.c
+@@ -0,0 +1,23 @@
++/*
++ * Used by meson.build to check for TLS descriptor support.  Built once as a
++ * shared library (CONFTEST_TLSDESC_LIB) and once as a program linked against
++ * it, so that the dynamic loader has to process the library's TLSDESC
++ * relocation.  A TLS access in the program itself would be relaxed by the
++ * linker and could not show missing libc support.
++ */
++#ifdef CONFTEST_TLSDESC_LIB
++/* Not static, so that the compiler cannot fold the access away. */
++__thread int conftest_tlsdesc_var = 42;
++
++int conftest_tlsdesc(void)
++{
++   return conftest_tlsdesc_var;
++}
++#else
++int conftest_tlsdesc(void);
++
++int main(void)
++{
++   return conftest_tlsdesc() != 42;
++}
++#endif
+diff --git a/meson.build b/meson.build
+index f725f833a52..75430283eb2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -651,10 +651,25 @@ if not have_mtls_dialect
+     # The way to specify the TLSDESC dialect is architecture-specific.
+     # We probe both because there is not a fallback guaranteed to work for all
+     # future architectures.
++    #
++    # The TLS access has to live in a shared library: in an executable the
++    # linker relaxes it, even with -fpic, so the test would pass without libc
++    # support (e.g. glibc on RISC-V, which rejects R_RISCV_TLSDESC).
++    conftest_tlsdesc = files('build-support/conftest-tlsdesc.c')
++    conftest_tlsdesc_dir = join_paths(meson.project_build_root(), 'meson-private')
++    conftest_tlsdesc_lib = join_paths(conftest_tlsdesc_dir, 'libconftest-tlsdesc.so')
+     foreach tlsdesc_arg : ['-mtls-dialect=gnu2', '-mtls-dialect=desc']
+-      # -fpic to force dynamic tls, otherwise TLS relaxation defeats check
+-      tlsdesc_test = cc.run('int __thread x; int main() { return x; }',
+-                            args: [tlsdesc_arg, '-fpic'],
++      tlsdesc_lib = run_command(cc.cmd_array(), get_option('c_args'),
++                                get_option('c_link_args'), tlsdesc_arg,
++                                '-fpic', '-shared', '-DCONFTEST_TLSDESC_LIB',
++                                '-o', conftest_tlsdesc_lib, conftest_tlsdesc,
++                                check : false)
++      if tlsdesc_lib.returncode() != 0
++        continue
++      endif
++      tlsdesc_test = cc.run(conftest_tlsdesc,
++                            args: [conftest_tlsdesc_lib,
++                                   '-Wl,-rpath,' + conftest_tlsdesc_dir],
+                             name: tlsdesc_arg)
+       if tlsdesc_test.returncode() == 0 and (
+             # check for lld 13 bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/5665
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index da71a0bdb0..64f5de12b4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch \
+           file://0001-meson-check-TLSDESC-support-with-a-shared-library.patch \
            "
 
 SRC_URI[sha256sum] = "bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9"
