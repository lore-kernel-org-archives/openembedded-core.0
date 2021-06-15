Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.6322.1623744778138936482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E8sWub6b;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g18so47917061edq.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GJLnyM4aWYDN5ZwiKMKI9c/TBeLExR3dWghYnM6A+y8=;
        b=E8sWub6bLBwWPr9b9YT6sPe97TkkG3Xw4v+LiSkOaq+PslgZwQnu1nr1o0VX+w8nnH
         kVvbzErPNbaMCWFynhCj15ESC3fapSayv3I1xlGSO80r83kw4FUmAKJNTK/io95+8rpN
         EVGIS9NAsOnq8+sueG5TfxCjTf2wc7g1RnO/gORYTmaliOQYf8d++xoGfhu42v60WIb2
         SkCBfOId3BIvfNJQC1o7uTZOnfvzjV2q/INHqJ5+3OsUd+ps4HhITG52qcsh11kEXFVZ
         YchksWEWC+LO3NioUXTCx5FobIx4YMB0nMdIJtPGs/eOCwnKYh0CWtYm00iLbjCkC5q/
         m+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJLnyM4aWYDN5ZwiKMKI9c/TBeLExR3dWghYnM6A+y8=;
        b=CZNrVxtjAKX5WDRv1VWL8TE9Oodr3Fj1ZrlEXasl0zjYIOcXFLfoLUc5LPcD3LrbWh
         lGsnZY0Bw8znrYnw/RoHLquekUL4EAO84dI+bZBzpjsrZF+NN/4MIUBCGo9wuXYwdTrM
         MeZ9lTrjADrUUHwB2TzZIACnCrPYe18ZqnfM5lREO7euw9N0lfy/B/vIP42y2jueDrJ6
         //ADfHNqmba+d9eVFXNgF5P+Lkzg2jnLg7L5PQAvDZ4rzt/b+PXCAbUBVo9XKP/0StM4
         0OrpMY5wJBH3F2D3vLglcJXWU56qUy3J16YNb3YMHXHgnznIdIRbyfOUci0YaPFL/1mW
         EGYg==
X-Gm-Message-State: AOAM532fP8LBh3OTcKoN8iXUml/R/D/XEMIj4uvXlEXrkOxnkchqZ/wA
	c84Ax+oSHFZ0AWqKuuaemlePYsEO0DR22g==
X-Google-Smtp-Source: ABdhPJyXpwnebd0XIOkcQTWtXzuBKOjMOdJiboaloFd1gnn6kGRSgGIXq46Q0GQz9I8uyRkEn+A3NA==
X-Received: by 2002:a05:6402:344:: with SMTP id r4mr21382294edw.226.1623744776805;
        Tue, 15 Jun 2021 01:12:56 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/31] grub: upgrade 2.04+2.06~rc1 -> 2.06
Date: Tue, 15 Jun 2021 10:12:26 +0200
Message-Id: <20210615081240.1734087-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{grub-efi_git.bb => grub-efi_2.06.bb}     |  2 ++
 meta/recipes-bsp/grub/grub2.inc               | 19 ++-----------------
 .../grub/{grub_git.bb => grub_2.06.bb}        |  0
 3 files changed, 4 insertions(+), 17 deletions(-)
 rename meta/recipes-bsp/grub/{grub-efi_git.bb => grub-efi_2.06.bb} (98%)
 rename meta/recipes-bsp/grub/{grub_git.bb => grub_2.06.bb} (100%)

diff --git a/meta/recipes-bsp/grub/grub-efi_git.bb b/meta/recipes-bsp/grub/grub-efi_2.06.bb
similarity index 98%
rename from meta/recipes-bsp/grub/grub-efi_git.bb
rename to meta/recipes-bsp/grub/grub-efi_2.06.bb
index 240fde7dbf..287845c507 100644
--- a/meta/recipes-bsp/grub/grub-efi_git.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.06.bb
@@ -11,6 +11,8 @@ SRC_URI += " \
            file://cfg \
           "
 
+S = "${WORKDIR}/grub-${PV}"
+
 # Determine the target arch for the grub modules
 python __anonymous () {
     import re
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3c6b434c2d..19294760c4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 CVE_PRODUCT = "grub2"
 
-SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
+SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
@@ -22,26 +22,11 @@ SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
 "
 
-SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074145484"
-
-REALPV = "2.06~rc1"
-PV = "2.04+${REALPV}"
-
-# Fixed in 2.06~rc1, can be removed for 2.06 final
-CVE_CHECK_WHITELIST += "\
-    CVE-2020-14308 CVE-2020-14309 CVE-2020-14310 CVE-2020-14311 CVE-2020-10713 \
-    CVE-2020-14372 CVE-2020-15705 CVE-2020-15706 CVE-2020-15707 \
-    CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 CVE-2020-27779 \
-    CVE-2021-3418 CVE-2021-20225 CVE-2021-20233"
+SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
 
 # Applies only to RHEL
 CVE_CHECK_WHITELIST += "CVE-2019-14865"
 
-S = "${WORKDIR}/grub-${REALPV}"
-
-UPSTREAM_CHECK_URI = "${GNU_MIRROR}/grub"
-UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)\.tar\.(gz|xz)"
-
 DEPENDS = "flex-native bison-native gettext-native"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_2.06.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub_git.bb
rename to meta/recipes-bsp/grub/grub_2.06.bb
-- 
2.31.1

