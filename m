Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.9607.1629636681733278991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kTyltMmC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id d26so1443116wrc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WhsZ0m4nJ5JY/QCtJQLWBu59ifsUj3qzB7SGkuAKQHQ=;
        b=kTyltMmCThi/9sOpHgZkyNjnOQBlWRTCD920OGypPIdp4ytxCW4FmVewRjA5Q0zV6l
         eeFc9S+Z18VVH2+Z2u3OMuDK9yI7tXFd+4u9Us/uJJ19V9wkzl8//T20THl2jBj+8pHi
         MHSmtkU1YMMKYEZ91wEHiSfXQWBjAj1HawsyV4m930Vtj6epzSTtNsTckXUXJwkudxvh
         jv5ciceyDsuN6LWbVKAq0ol4Lx66lMD/Og93cthaGIujhKeJtaMTPVTSRCelSNwBM8i9
         hn8zWoLBCL8MAfYJgeVLWVbdc6Ng+P+YFfIX2hm7XIYCzsIhm6hrXP6KIUIrhh2n9/23
         3RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WhsZ0m4nJ5JY/QCtJQLWBu59ifsUj3qzB7SGkuAKQHQ=;
        b=UfqOKXnRJqIGKU1m70DJ3lW2bV30Ye66rl+pd5nMJ5fMFG9qE6PqFbmM9A4m+b4pwB
         OmXSZe0QAHRGvYyoBj0T+X3M+EbzG6CkDyv65zvrHIKJdPRjiORAJbD2ORPNlFuQHbw8
         eShm+XeZhHcMJ8VZ0ia8PvSBX/nkVS4JkprpKyYGoNVjJUxap/fIj7I70IM4kDSPTJgG
         8y5SgAio1sL/CQhmRzHhQV7Y7FGLzqIKmeS4sKSkiLBNAfSFb0dQ4u4v8QxnvNH8TzlB
         eBqFm3LiWffp+RwKJ9D8PJ4JsMGEtAKyrr8PfAdiTu81XJfeIn3z0rx1jXYEfMEL9/kf
         thqg==
X-Gm-Message-State: AOAM5314idF5K7jPuoqcZaqxT5xnqj2aYZWjpm8CQmCAt88M5CmKWAVy
	WmhhqR1vUYG6MaAQeTnpjPRNCJra85czIA==
X-Google-Smtp-Source: ABdhPJzCW/YvhecZCPyW1lf6jomKKl9w/bRVTXtz7u1A5EnAyj/iOjMdXVzpYkHkXczDHFBSUkUtfQ==
X-Received: by 2002:adf:e389:: with SMTP id e9mr8728474wrm.304.1629636680305;
        Sun, 22 Aug 2021 05:51:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/55] pulseaudio: update 14.2 -> 15.0
Date: Sun, 22 Aug 2021 14:50:22 +0200
Message-Id: <20210822125103.310416-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backports.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 ...-option-for-enabling-disabling-Valgr.patch | 67 -----------------
 ...check-if-NEON-code-can-be-compiled-o.patch | 71 -------------------
 ...{pulseaudio_14.2.bb => pulseaudio_15.0.bb} |  5 +-
 4 files changed, 2 insertions(+), 143 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_14.2.bb => pulseaudio_15.0.bb} (62%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2fb107797a..4a1456d407 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -108,7 +108,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5'
                    "
 
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
-PACKAGECONFIG[bluez5] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
+PACKAGECONFIG[bluez5] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc"
 PACKAGECONFIG[gsettings] = "-Dgsettings=enabled,-Dgsettings=disabled,glib-2.0-native glib-2.0"
 PACKAGECONFIG[ofono] = "-Dbluez5-ofono-headset=true,-Dbluez5-ofono-headset=false,ofono"
 PACKAGECONFIG[gtk] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
deleted file mode 100644
index d60a9a211f..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 6d202833a5ae241eeb648631cf95090c452198f9 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 14 Feb 2020 07:29:33 +0200
-Subject: [PATCH] build-sys: Add an option for enabling/disabling Valgrind
-
-In OpenEmbedded the PulseAudio recipe currently disables Valgrind
-support by passing "ac_cv_header_valgrind_memcheck_h=no" to the
-configure script (this was added to make it deterministic whether
-Valgrdind support gets enabled or not). I'm converting the PulseAudio
-recipe to use Meson, and I needed an option to disable Valgrind.
-
-Upstream-Status: Backport
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- meson.build       | 6 +++++-
- meson_options.txt | 3 +++
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 658eeee57..258962724 100644
---- a/meson.build
-+++ b/meson.build
-@@ -220,7 +220,6 @@ check_headers = [
-   'sys/un.h',
-   'sys/wait.h',
-   'syslog.h',
--  'valgrind/memcheck.h',
-   'xlocale.h',
- ]
- 
-@@ -231,6 +230,10 @@ foreach h : check_headers
-   endif
- endforeach
- 
-+if cc.has_header('valgrind/memcheck.h', required: get_option('valgrind'))
-+  cdata.set('HAVE_VALGRIND_MEMCHECK_H', 1)
-+endif
-+
- # FIXME: move this to the above set
- if cc.has_header('pthread.h')
-   cdata.set('HAVE_PTHREAD', 1)
-@@ -841,6 +844,7 @@ summary = [
-   'Enable SoXR (resampler):       @0@'.format(soxr_dep.found()),
-   'Enable WebRTC echo canceller:  @0@'.format(webrtc_dep.found()),
-   'Enable Gcov coverage:          @0@'.format(get_option('gcov')),
-+  'Enable Valgrind:               @0@'.format(cdata.has('HAVE_VALGRIND_MEMCHECK_H')),
-   'Enable man pages:              @0@'.format(get_option('man')),
-   'Enable unit tests:             @0@'.format(get_option('tests')),
-   '',
-diff --git a/meson_options.txt b/meson_options.txt
-index 824f24e08..115cc84af 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -138,6 +138,9 @@ option('systemd',
- option('udev',
-        type : 'feature', value : 'auto',
-        description : 'Optional udev support')
-+option('valgrind',
-+       type : 'feature', value : 'auto',
-+       description : 'Optional Valgrind support')
- option('x11',
-        type : 'feature', value : 'auto',
-        description : 'Optional X11 support')
--- 
-2.20.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch
deleted file mode 100644
index 5d9370fb16..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 09f846fbdeb19193e778ce51baa77bd03c38372e Mon Sep 17 00:00:00 2001
-From: garrison <garrison@qemu15.qemu-network>
-Date: Fri, 4 Jun 2021 22:13:02 +0000
-Subject: [PATCH] build-sys: meson: check if NEON code can be compiled on arm
-
-When Meson SIMD module returns HAVE_NEON=1 on arm host, do extra compile check
-to verify compiler can actually handle NEON code.
-
-Related Meson issue #6361 https://github.com/mesonbuild/meson/issues/6361
-
-Part-of: <https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/574>
-
-Upstream-Status: Backport[https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/6d2a49a6a1eacc2096d0d9473a074421c181ab56]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/pulsecore/meson.build | 41 +++++++++++++++++++++++++++++----------
- 1 file changed, 31 insertions(+), 10 deletions(-)
-
-diff --git a/src/pulsecore/meson.build b/src/pulsecore/meson.build
-index 99a702e..d0b7990 100644
---- a/src/pulsecore/meson.build
-+++ b/src/pulsecore/meson.build
-@@ -172,16 +172,37 @@ endif
- 
- # FIXME: SIMD support (ORC)
- simd = import('unstable-simd')
--libpulsecore_simd = simd.check('libpulsecore_simd',
--  mmx : ['remap_mmx.c', 'svolume_mmx.c'],
--  sse : ['remap_sse.c', 'sconv_sse.c', 'svolume_sse.c'],
--  neon : ['remap_neon.c', 'sconv_neon.c', 'mix_neon.c'],
--  c_args : [pa_c_args],
--  include_directories : [configinc, topinc],
--  implicit_include_directories : false,
--  compiler : cc)
--libpulsecore_simd_lib = libpulsecore_simd[0]
--cdata.merge_from(libpulsecore_simd[1])
-+simd_variants = [
-+  { 'mmx' : ['remap_mmx.c', 'svolume_mmx.c'] },
-+  { 'sse' : ['remap_sse.c', 'sconv_sse.c', 'svolume_sse.c'] },
-+  { 'neon' : ['remap_neon.c', 'sconv_neon.c', 'mix_neon.c'] },
-+]
-+
-+libpulsecore_simd_lib = []
-+
-+foreach simd_kwargs : simd_variants
-+
-+  if host_machine.cpu_family() == 'arm' and 'neon' in simd_kwargs
-+    if not cc.compiles('''
-+        #include <arm_neon.h>
-+        int main() {
-+            return sizeof(uint8x8_t) + sizeof(int32x4_t) + sizeof(float32x4_t);
-+        }
-+        ''', name : 'neon code')
-+      continue
-+    endif
-+  endif
-+
-+  libpulsecore_simd = simd.check('libpulsecore_simd',
-+    kwargs : simd_kwargs,
-+    c_args : [pa_c_args],
-+    include_directories : [configinc, topinc],
-+    implicit_include_directories : false,
-+    compiler : cc)
-+
-+  libpulsecore_simd_lib += libpulsecore_simd[0]
-+  cdata.merge_from(libpulsecore_simd[1])
-+endforeach
- 
- # FIXME: Implement Windows support
- #'mutex-win32.c',
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_15.0.bb
similarity index 62%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_15.0.bb
index a7ea8caccb..239d31810b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_15.0.bb
@@ -3,12 +3,9 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
-           file://0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch \
            file://0001-meson-Check-for-__get_cpuid.patch \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
-           file://0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch \
            "
-SRC_URI[md5sum] = "1efc916251910f1e9d4df7810e3e69f8"
-SRC_URI[sha256sum] = "75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f3488a2562a9ff66f1"
+SRC_URI[sha256sum] = "a40b887a3ba98cc26976eb11bdb6613988f145b19024d1b6555c6a03c9cba1a0"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.31.1

