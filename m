Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.17610.1590940435996072299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KHE3qR2r;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id o26so2509075edq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZkLxDeAiUwTsx6+Dci+iJsBkfNWI31G7w1+WPNCupxw=;
        b=KHE3qR2rN8zKeDKdHGqJIKuHtTBbEbtor+3Ur8TJImLIv8bl9x4TOqRdehoGnYGyFQ
         JkSdOg1JFvPepwRbtsEFiwfre/x0LLJvHpHWL60I1t8/zgmlw4larkr7TGTAJRGFtvkL
         GOwyBzlAfo3oo4Xc5KsqFVrzw7DKDslElyr60+Z1uQxOPlf/+mHl2QZiD76tSnp4bKL8
         FlUtSw2IbwAzk1HM9zftnIozQxeSsCvsf1agrP1fmCwHP2yW1mN2wRZIVUTjnPh9togh
         9jv5RMzgg0xpnERoNN17aczTLMoaHk0IO/mhTvvz4YYcDEYIovVTFyUlE2ui0gGjnG9R
         VG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZkLxDeAiUwTsx6+Dci+iJsBkfNWI31G7w1+WPNCupxw=;
        b=Y5q4oPVEE3RohVA8RhK2ptRUeIwHtaWIq89LNQTFlrJzg094zQHnUtw/dgRhVaD/6I
         dbITQneuQPhNtWwFtkNyauSrwUeH2nakqT/CmqvhF/+V/MHGD4ZMCciEy5TlJYe5DbYJ
         clNSIQHfukb/TCWacKme+AXvcSCU1UEFPTqH5PfZ58ZfEOj9lyWeLGzFBf7wXJzt0c1U
         TsG6WPUjFePitaEvWl+c88LY/4MzM/pSu2+i0+fxkNrBQJHTv70Tg9bV/p71jBoF644v
         ZIoTwVLE2pcAWJceJ+S9APkHBVltyRv2VRn2m5OCv4qch7qeOUgcvIgRmPGehHffBGsu
         ozsA==
X-Gm-Message-State: AOAM531Wtt7OAQHSmNJTBm4Mtv/A/9/OYefu0kYK6luPN22/Wq2VNVeT
	NQ+6jkAxZIz5hP5vXRCnHBZ5bP8T
X-Google-Smtp-Source: ABdhPJz+uQLNrJmaN5NjJq1dznFE142NVpH+0AntybAQBv0fGbDeL0KaE5zBFjVSVYTVnEmY2He6cQ==
X-Received: by 2002:a05:6402:690:: with SMTP id f16mr18401308edy.9.1590940434297;
        Sun, 31 May 2020 08:53:54 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/70] mesa: merge the .bb content into .inc
Date: Sun, 31 May 2020 17:52:15 +0200
Message-Id: <20200531155254.10283-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows automated version updates to the recipe,
as mesa-gl.bb no longer has to include the main mesa.bb.

Bump mesa-gl to 20.0.7 at the same time.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{mesa-gl_20.0.2.bb => mesa-gl_20.0.7.bb}  |  2 +-
 meta/recipes-graphics/mesa/mesa.inc           | 22 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_20.0.7.bb     | 22 -------------------
 3 files changed, 23 insertions(+), 23 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.0.2.bb => mesa-gl_20.0.7.bb} (96%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.7.bb
similarity index 96%
rename from meta/recipes-graphics/mesa/mesa-gl_20.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.0.7.bb
index c7897cdaf3..e50782be1c 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_20.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.7.bb
@@ -1,4 +1,4 @@
-require mesa_${PV}.bb
+require mesa.inc
 
 SUMMARY += " (OpenGL only, no EGL/GLES)"
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bb43a9a8b6..965e12d17e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,6 +14,28 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=c1843d93c460bbf778d6037ce324f9f
 
 PE = "2"
 
+SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
+           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+           file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
+           file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           "
+
+SRC_URI[md5sum] = "609cb7664204e031d4c65c602c652a28"
+SRC_URI[sha256sum] = "fe6e258fe772c3cd2ac01741bf7408058c3ac02d66acff9a6e669bd72e3ea178"
+
+UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
+
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
diff --git a/meta/recipes-graphics/mesa/mesa_20.0.7.bb b/meta/recipes-graphics/mesa/mesa_20.0.7.bb
index 420565808e..d17d9eb04b 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.7.bb
@@ -1,23 +1 @@
 require ${BPN}.inc
-
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0002-meson.build-make-TLS-ELF-optional.patch \
-           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
-           file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
-           file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
-           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           "
-
-SRC_URI[md5sum] = "609cb7664204e031d4c65c602c652a28"
-SRC_URI[sha256sum] = "fe6e258fe772c3cd2ac01741bf7408058c3ac02d66acff9a6e669bd72e3ea178"
-
-UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
-}
-- 
2.26.2

