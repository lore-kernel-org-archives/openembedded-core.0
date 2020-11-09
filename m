Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.6357.1604890644275881271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cM2JCZET;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id z1so3976851plo.12
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Yw2JsJMFZMkLFMZ901+fQzVpa1oZ4spz16se3bAMYTs=;
        b=cM2JCZETQEeQYZ1CZa+U+Vm1n6lmt7pfPAnlgwd5eSiAQzKif/p6auzLVkIq70AdU7
         AY7kWkvv6gxLkyKHRo9BabHGPLhGgyCLYIbxoFFalO+eFAuUpfdMbP25tV8415a7MuMZ
         3ew+PPMMLTMX63GFSJ5a+5/OV1V50qKa+pOqDmVUFvE8AGq7NvaF18eyaBA+ionK9nY/
         vVWQbDZLtqw78VgTQhjQcvydnO5KDxjKYUvUBEeIcMHvXS1f4zPnc839e/zdfDG0+ibV
         yOLHnxxL7XBfCStUDQWSNi0KZy6s78GZUOdQL15C4k3BqRH5PXZALOofQcINYjsBn8IE
         Gifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Yw2JsJMFZMkLFMZ901+fQzVpa1oZ4spz16se3bAMYTs=;
        b=PZ8pMQQ9Ncxf/92gE+iKR/YDxrJwMdDN+X5DLiolBI1T7fvhNoFfcrWkhEZTZthHbo
         XRc7J5BjeadNVGqNH67PDsMjrzi8RkQic9IezA8mfjFbfYtVL6nJ7n7KouscF4u3tadz
         gAjmnRdxCg22EDGGSMPA0PvVbDV4KPJk2hs3PU/M8puxAzPMHCbmDbAanrx44r16InhT
         KVBl/6XH6cEdhpYnKm/GBBppmfkjzMj69Pj4Gg5zTp/uC/vFwSWAy5dApQdN5ouqaxAm
         A+RzNkRZ6v25U3UQFa4cX35BewVbprHmsEPsu71FpuaLpkfLrdHC0+OyRZoSD35R9x/7
         lpOw==
X-Gm-Message-State: AOAM5334ZhjbLgmasaTTpSar+7DAYAX+iWDg4e7g+0gUihcv+2TQkMJc
	4m0nllCVjERb/iP7fLh4umvwXpAEbTKHKwP5
X-Google-Smtp-Source: ABdhPJzKvPZ95HhC3FL2Ax2bepM/pgCfWB9XZCjp9VCYLlgG10MbA+dxkroIzQSHgKdFLyO4MAorxg==
X-Received: by 2002:a17:902:a717:b029:d6:e91:d02b with SMTP id w23-20020a170902a717b02900d60e91d02bmr10810281plq.23.1604890643258;
        Sun, 08 Nov 2020 18:57:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:22 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] grub: clean up CVE patches
Date: Sun,  8 Nov 2020 16:56:19 -1000
Message-Id: <4f395ad49ef9035954d0fda7b7df14dea18b49a0.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Yongxin Liu <yongxin.liu@windriver.com>

Clean up several patches introduced in commit 6732918498 ("grub:fix
several CVEs in grub 2.04").

1) Add CVE tags to individual patches.
2) Rename upstream patches and prefix them with CVE tags.
3) Add description of reference to upstream patch.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bcb8b6719beaf6625e6b703e91958fe8afba5819)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...14308-calloc-Use-calloc-at-most-places.patch} | 10 +++++++---
 ...rflow-checking-primitives-where-we-do-.patch} | 10 +++++++---
 ...-use-after-free-when-redefining-a-func.patch} | 10 +++++++---
 ...eger-overflows-in-initrd-size-handling.patch} | 10 +++++++---
 ...re-we-always-have-an-overflow-checking.patch} |  0
 ...-Add-LVM-cache-logical-volume-handling.patch} |  0
 ...ome-arithmetic-primitives-that-check-f.patch} |  0
 ...unused-fields-from-grub_script_functio.patch} |  0
 meta/recipes-bsp/grub/grub2.inc                  | 16 ++++++++--------
 9 files changed, 36 insertions(+), 20 deletions(-)
 rename meta/recipes-bsp/grub/files/{0003-calloc-Use-calloc-at-most-places.patch => CVE-2020-14308-calloc-Use-calloc-at-most-places.patch} (99%)
 rename meta/recipes-bsp/grub/files/{0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch => CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch} (99%)
 rename meta/recipes-bsp/grub/files/{0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch => CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch} (95%)
 rename meta/recipes-bsp/grub/files/{0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch => CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch} (96%)
 rename meta/recipes-bsp/grub/files/{0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch => calloc-Make-sure-we-always-have-an-overflow-checking.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0002-lvm-Add-LVM-cache-logical-volume-handling.patch => lvm-Add-LVM-cache-logical-volume-handling.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch => safemath-Add-some-arithmetic-primitives-that-check-f.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0006-script-Remove-unused-fields-from-grub_script_functio.patch => script-Remove-unused-fields-from-grub_script_functio.patch} (100%)

diff --git a/meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
similarity index 99%
rename from meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
index eb3e42c3af..637e368cb0 100644
--- a/meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
@@ -19,11 +19,15 @@ Among other issues, this fixes:
 
 Fixes: CVE-2020-14308
 
-Upstream-Status: Backport [commit f725fa7cb2ece547c5af01eeeecfe8d95802ed41
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-14308
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f725fa7cb2ece547c5af01eeeecfe8d95802ed41
+
 [YL: don't patch on grub-core/lib/json/json.c, which is not existing in grub 2.04]
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
diff --git a/meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
similarity index 99%
rename from meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
index 146602cd3e..896a2145d4 100644
--- a/meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
@@ -26,11 +26,15 @@ Among other issues, this fixes:
 
 Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
 
-Upstream-Status: Backport [commit 3f05d693d1274965ffbe4ba99080dc2c570944c6
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
+
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
  grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----
diff --git a/meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
similarity index 95%
rename from meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
index fedfc5d203..329e554a68 100644
--- a/meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
@@ -19,11 +19,15 @@ dependent on the current behaviour without being broken.
 
 Fixes: CVE-2020-15706
 
-Upstream-Status: Backport [commit 426f57383d647406ae9c628c472059c27cd6e040
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-15706
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=426f57383d647406ae9c628c472059c27cd6e040
+
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
  grub-core/script/execute.c  |  2 ++
diff --git a/meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
similarity index 96%
rename from meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
index 0731f0ec53..d4f9300c0a 100644
--- a/meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
@@ -7,12 +7,16 @@ These could be triggered by a crafted filesystem with very large files.
 
 Fixes: CVE-2020-15707
 
-Upstream-Status: Backport [commit e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Colin Watson <cjwatson@debian.org>
 Reviewed-by: Jan Setje-Eilers <jan.setjeeilers@oracle.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-15707
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
+
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
  grub-core/loader/linux.c | 74 +++++++++++++++++++++++++++++++++++-------------
diff --git a/meta/recipes-bsp/grub/files/0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch b/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch
rename to meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
diff --git a/meta/recipes-bsp/grub/files/0002-lvm-Add-LVM-cache-logical-volume-handling.patch b/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0002-lvm-Add-LVM-cache-logical-volume-handling.patch
rename to meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
diff --git a/meta/recipes-bsp/grub/files/0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch b/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch
rename to meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
diff --git a/meta/recipes-bsp/grub/files/0006-script-Remove-unused-fields-from-grub_script_functio.patch b/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0006-script-Remove-unused-fields-from-grub_script_functio.patch
rename to meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ef3e64671f..4ec7d0b0fc 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,14 +19,14 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://CVE-2020-10713.patch \
-           file://0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch \
-           file://0002-lvm-Add-LVM-cache-logical-volume-handling.patch \
-           file://0003-calloc-Use-calloc-at-most-places.patch \
-           file://0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch \
-           file://0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
-           file://0006-script-Remove-unused-fields-from-grub_script_functio.patch \
-           file://0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
-           file://0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
+           file://calloc-Make-sure-we-always-have-an-overflow-checking.patch \
+           file://lvm-Add-LVM-cache-logical-volume-handling.patch \
+           file://CVE-2020-14308-calloc-Use-calloc-at-most-places.patch \
+           file://safemath-Add-some-arithmetic-primitives-that-check-f.patch \
+           file://CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
+           file://script-Remove-unused-fields-from-grub_script_functio.patch \
+           file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
+           file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.17.1

