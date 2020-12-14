Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.35615.1607956683731131638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nciBL/+b;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id k65so2267445pgk.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=946/2yvMlPzM1sSOde8+YXos18lkiwC4XRtancTRXWc=;
        b=nciBL/+bBjeRcsVHepZ4hWruWqmi5aE5K7tahSsn+bf2BS7XWgdijWq9JbwZXXNqfm
         EZ4KAIZFXgFKSMN/gCTfpI15//0x0HJiGVpzZCTIlvKX5AHnyjLZMwBeb55Grga/spLD
         fknKjBXyPsMMAxIj9BZ4NwfSJ/JZXg6eesIPJrKVhMsY8aZzb7X6uninJyGwI6cVwmel
         FRw9rv2v19rFIwtvIBAs9DgmS8eaGxvXXcCqPKbYJDP76zFVSp9KrLFKWRi11X58HDjQ
         nHRlImm8P/qklMlhqnWZqTjmavcfJXh9bPtoPHv8umtvst1ib45rULCK+ASI7t7+KufZ
         MNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=946/2yvMlPzM1sSOde8+YXos18lkiwC4XRtancTRXWc=;
        b=kIKheLoPu+seEHAwXeez6B/NT2bzCR2dQVWw1xYY+p4lReYhF1aqW13WzKo33icPC2
         nCZgo5hO0uanPdfdQ83A64K9y9xnaPvbnCEEgGNFOk4g8YAA3gbdcyhYyl+ZtyJLouh3
         bMZDAns3qfhbSoNqZUs2ksQhFMpezbnAZvLZ4f6v27GcRwYw2QUsph20yOQyaQRTPE48
         NuSrvThLu5QP/fLT82ncAV3qtRbn4YcG4a6CSOEV2Zr4/TJqjwVrwP7GE+j72Q/35wUZ
         Dz1TS9+hiK/dvlmosA3CQ6qrcft5HcxBD4caZ+plRr9E4tMrIHtzbG2yW5SQ2n5SO0RY
         48NQ==
X-Gm-Message-State: AOAM532EqZRe3M4IxUy9uxT4XXl64JNivMj80ICOVha7OQ7YIoJtUAiW
	giboXHq+37ab1o/yQ/h+bdw3p55830H29LTv
X-Google-Smtp-Source: ABdhPJy4dVIIsjrEbkNidacH48foZpzHzAr45UQlIbA9JVCRMvN/PnWXMwIpNq1pc7F7hG//xiHBXQ==
X-Received: by 2002:a65:68cb:: with SMTP id k11mr20469913pgt.430.1607956682729;
        Mon, 14 Dec 2020 06:38:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:01 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/25] ffmpeg: fix reproducibility
Date: Mon, 14 Dec 2020 04:36:48 -1000
Message-Id: <359f8e8bf9979aafedeafc3d012c6005ffcf3174.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4f7c6f831a551e3df503091fdca5c9f4add879d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-assembly-with-full-path-from-sourc.patch | 97 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  6 ++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
new file mode 100644
index 0000000000..3b503c49c9
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
@@ -0,0 +1,97 @@
+From 24a58d70cbb3997e471366bd5afe54be9007bfb1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 15:32:14 +0000
+Subject: [PATCH] libavutil: include assembly with full path from source root
+
+Otherwise nasm writes the full host-specific paths into .o
+output, which breaks binary reproducibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libavutil/x86/cpuid.asm      | 2 +-
+ libavutil/x86/emms.asm       | 2 +-
+ libavutil/x86/fixed_dsp.asm  | 2 +-
+ libavutil/x86/float_dsp.asm  | 2 +-
+ libavutil/x86/lls.asm        | 2 +-
+ libavutil/x86/pixelutils.asm | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/x86/cpuid.asm b/libavutil/x86/cpuid.asm
+index c3f7866..766f77f 100644
+--- a/libavutil/x86/cpuid.asm
++++ b/libavutil/x86/cpuid.asm
+@@ -21,7 +21,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/emms.asm b/libavutil/x86/emms.asm
+index 8611762..df84f22 100644
+--- a/libavutil/x86/emms.asm
++++ b/libavutil/x86/emms.asm
+@@ -18,7 +18,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/fixed_dsp.asm b/libavutil/x86/fixed_dsp.asm
+index 979dd5c..2f41185 100644
+--- a/libavutil/x86/fixed_dsp.asm
++++ b/libavutil/x86/fixed_dsp.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/float_dsp.asm b/libavutil/x86/float_dsp.asm
+index 517fd63..b773e61 100644
+--- a/libavutil/x86/float_dsp.asm
++++ b/libavutil/x86/float_dsp.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION_RODATA 32
+ pd_reverse: dd 7, 6, 5, 4, 3, 2, 1, 0
+diff --git a/libavutil/x86/lls.asm b/libavutil/x86/lls.asm
+index 317fba6..d2526d1 100644
+--- a/libavutil/x86/lls.asm
++++ b/libavutil/x86/lls.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/pixelutils.asm b/libavutil/x86/pixelutils.asm
+index 36c57c5..8b45ead 100644
+--- a/libavutil/x86/pixelutils.asm
++++ b/libavutil/x86/pixelutils.asm
+@@ -21,7 +21,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index fddfef9e27..0e359848fa 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://CVE-2020-12284.patch \
+           file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
@@ -129,6 +130,11 @@ do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/config.h
+}
+
 PACKAGES =+ "libavcodec \
              libavdevice \
              libavfilter \
-- 
2.17.1

