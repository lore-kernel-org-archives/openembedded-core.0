Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.9778.1620227946528020896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SGBpBFx+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id u13so2505785edd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Nprt1Ff+K64IwMh4DdQHxXa4EKx7kegIJwDoSdiyQo=;
        b=SGBpBFx+9FNij9C2i+vAwPcrmon4LkM47Ty67iG9ofufRpPqO06QUGQyWPqq58JE/3
         0laYI6Ab6q4nvKh6qaJCdPQGhhylPuJKI1rHja7vNBXLxdZISkVMe/DxEjbRZwzLDElE
         j2Ueyo8Eq+uxPf+L1hJ29zXgY84yPUZcuHeuurSloKAehD1D6fHcmygiKttbvb10sl//
         tiqcgEO1vzKNgkK3Uvx5Od2/bZMNeH0sbp14Vv/RLCdnHtKZDsCoRSqeKjmgNSsgamtN
         uJSqbuziizNfK6J3kLCmB6d7Q9Y9y7rwATVVqaeK0JpfEPaHG82YtNaAmMJ+GZh3d7tD
         HeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Nprt1Ff+K64IwMh4DdQHxXa4EKx7kegIJwDoSdiyQo=;
        b=Q1mHQq9dDngrswtQ6Wrtc2EN1zrBg5CgIwDRuCF3m4mRGVKC1x6niPL3vh7AegQXAG
         sT4zJByMyToCsJfgtui1R1u3ln1VbhwhHURvirF6JGxts1ZjyMtT1S6p71KfS8OEzMLf
         bsCygtaOQmnzWP8JVYng9zEXC5ejBM75tWml1xcwopfc4HSOHmxUhmfE5/5ctgLiF1yR
         IjM3/feLIiBb0pdp0CmSmSMM+FYSf+tJX3EuIGGBlQQ/Z0Uo/dtgpBn2Qm3q3c9gQCem
         U3gCgEBCyV5UL2d/kpPLYRqPfkHKaIfJHBjgeJ/H9HKL1HtSxjsio0pho3J43xQrl2I8
         uQwQ==
X-Gm-Message-State: AOAM532gjUPdHAFkgOZEOD5OiUfgHSqJgcrgAWLkzPMUEfTCtNi8azYr
	eWdzmV7hg4RrWMqiXviJUfaJuWfnuHEQAg==
X-Google-Smtp-Source: ABdhPJxHytWTI333Ueo5h26bpF8WrOyu0xPGNVN2qz5XgzT/7zA721Tduq4QsQ7/Zfxde0FUvqzayw==
X-Received: by 2002:a05:6402:51ce:: with SMTP id r14mr15425343edd.151.1620227944954;
        Wed, 05 May 2021 08:19:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/61] meson: update 0.57.1 -> 0.57.2
Date: Wed,  5 May 2021 17:18:00 +0200
Message-Id: <20210505151850.660512-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  4 +--
 .../0001-Make-CPU-family-warnings-fatal.patch |  2 +-
 ...ectly-set-uid-gid-of-installed-files.patch | 28 -------------------
 ...pport-building-allarch-recipes-again.patch |  2 +-
 .../{meson_0.57.1.bb => meson_0.57.2.bb}      |  0
 ...on_0.57.1.bb => nativesdk-meson_0.57.2.bb} |  0
 6 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
 rename meta/recipes-devtools/meson/{meson_0.57.1.bb => meson_0.57.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.57.1.bb => nativesdk-meson_0.57.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index e186dede92..149d06637f 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,10 +14,9 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
-           file://0001-minstall-Correctly-set-uid-gid-of-installed-files.patch \
            file://gi-target-dep.patch \
            "
-SRC_URI[sha256sum] = "72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6"
+SRC_URI[sha256sum] = "3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
@@ -25,7 +24,6 @@ SRC_URI_append_class-native = " \
 "
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".1"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 0808891a27..300797f9ee 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 76934bcbf2cfa7304e8864e28c51f58adda0392f Mon Sep 17 00:00:00 2001
+From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch b/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
deleted file mode 100644
index d55b7cc7c7..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3f6f4964dc79ae986f44afe1687922381f237edd Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Wed, 3 Mar 2021 12:47:28 +0100
-Subject: [PATCH] minstall: Correctly set uid/gid of installed files
-
-In commit caab4d3d, the uid and gid arguments passed to os.chown() by
-set_chown() were accidentally swapped, causing files to end up with
-incorrect owner/group if the owner and group are not the same.
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6226ac26ef63335bfb817db02b3f295c78214a82]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- mesonbuild/minstall.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 785ff5869..07da408aa 100644
---- a/mesonbuild/minstall.py
-+++ b/mesonbuild/minstall.py
-@@ -148,7 +148,7 @@ def set_chown(path: str, user: T.Optional[str] = None, group: T.Optional[str] =
-         Use a real function rather than a lambda to help mypy out. Also real
-         functions are faster.
-         """
--        real_os_chown(path, gid, uid, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
-+        real_os_chown(path, uid, gid, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
- 
-     try:
-         os.chown = chown
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ddc34c2f49..f6175a194c 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 6efb6114836fd4a1e012aa03b37f3beeeb22b466 Mon Sep 17 00:00:00 2001
+From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_0.57.1.bb b/meta/recipes-devtools/meson/meson_0.57.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.57.1.bb
rename to meta/recipes-devtools/meson/meson_0.57.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.57.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.57.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
-- 
2.31.1

