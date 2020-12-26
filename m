Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.19129.1608974900936808499
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YG8p1g7L;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id y24so5552959edt.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8OTwoj6vPZ2d3N7M1dYMD4qdigY/eqmSRI5prvsoFB4=;
        b=YG8p1g7LZtk0E4+J/1NRCLvvhwzGTxBLsSKGTTQcdmF9QqyKCmQHIBRF9WyMO6L4Wl
         XH2iNIszPKFB2K/bst/bo1IcDF4ma2RF4Nur/feY8MQSRk5Y6JUt0FKflYRT0c9ltENN
         L9VFHQcmtvaCJhyXqBImx1rYHAmfxaK6v219tyVHVgIhibM4DleC1MunnjF0ALTw9dYr
         Kny2nRi7pS2EIrgAkOVwBsnbmxKlP4QOsU9E5Azb2g6XsbrD0r0r6sUic8oZQzce6ahy
         edzrpS4OphDTLtE6aKh7lLnlZm5EgR5CvddIibWgxAm7MFXX5MoqY1pXyXa5pLGQHdLJ
         id/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8OTwoj6vPZ2d3N7M1dYMD4qdigY/eqmSRI5prvsoFB4=;
        b=GK3eUOnqahyMU80J53MFpD0v3z+Ow3eqzPjFiYlQnkWzOCyHEnR64Y0RZDNbcT8KjC
         jsUZGv0IvNTfdn4zeeLv/0R2QbccHjcDdGHGyrXoi3sOv4w+NZYpupDCikW2MjIQk8PV
         f4X5x73W0Y1/NNnA4mD/ezy2sUjS36+Jsd3u0GeFX7rNRiRrLuK3uu0A6ZU68vPOL1pi
         wStnyBkQbnpg524/XZCa1WRNDsdpCYpPqkpQKodrYwmeUPRaF0h1lypuyE8BFenuzi7G
         NpAK/0VvNjWdsCVC1T3uZhqkPNKaTQlpqsQCIemQpeLXN5d1BUzkO8zv8oq2YM8DoS73
         zJFQ==
X-Gm-Message-State: AOAM531dGGQjzsZhlQsblhTdL5qKAOhmCpm2zF4bGbl1XhG9YuETtnk4
	KsWZFQSvbvKbNLDiBQ8QcfGOXFbNqcg=
X-Google-Smtp-Source: ABdhPJzFZhK3hoYk2gBiKPDL1jfzAxvifZGuBTkOcvTEkr4LH0RFIMNOdL0o7Fmrm5JZfMNAl/jx/A==
X-Received: by 2002:a50:ed17:: with SMTP id j23mr34661121eds.218.1608974899585;
        Sat, 26 Dec 2020 01:28:19 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:19 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 47/48] zstd: add recipe from meta-oe
Date: Sat, 26 Dec 2020 10:27:31 +0100
Message-Id: <20201226092732.52323-47-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zstd is becoming increasingly popular as the modern compression
standard, and there are several recipes in core now that have an option
for it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-Fix-legacy-build-after-2103.patch    | 27 ++++++++++++++
 meta/recipes-extended/zstd/zstd_1.4.5.bb      | 37 +++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
 create mode 100644 meta/recipes-extended/zstd/zstd_1.4.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8dffa2fc95..b0ddfb89a8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -797,3 +797,4 @@ RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch b/meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
new file mode 100644
index 0000000000..c701554b8b
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
@@ -0,0 +1,27 @@
+From 93cec0c1d6d0be8dd3a9d01d3e7f2099f1728df7 Mon Sep 17 00:00:00 2001
+From: Orivej Desh <orivej@gmx.fr>
+Date: Fri, 22 May 2020 12:48:02 +0000
+Subject: [PATCH] Fix legacy build after #2103
+
+Upstream-Status: Backport
+Signed-of-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ lib/legacy/zstd_v04.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/legacy/zstd_v04.c b/lib/legacy/zstd_v04.c
+index 56bf45222498..19fda8980abf 100644
+--- a/lib/legacy/zstd_v04.c
++++ b/lib/legacy/zstd_v04.c
+@@ -74,7 +74,7 @@ extern "C" {
+ /*-*************************************
+ *  Debug
+ ***************************************/
+-#include "debug.h"
++#include "../common/debug.h"
+ #ifndef assert
+ #  define assert(condition) ((void)0)
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/zstd/zstd_1.4.5.bb b/meta/recipes-extended/zstd/zstd_1.4.5.bb
new file mode 100644
index 0000000000..cd0b471e17
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd_1.4.5.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Zstandard - Fast real-time compression algorithm"
+DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
+real-time compression scenarios at zlib-level and better compression ratios. \
+It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
+HOMEPAGE = "http://www.zstd.net/"
+SECTION = "console/utils"
+
+LICENSE = "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
+                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1 \
+           file://0001-Fix-legacy-build-after-2103.patch \
+           "
+
+SRCREV = "b706286adbba780006a47ef92df0ad7a785666b6"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
+PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
+
+# See programs/README.md for how to use this
+ZSTD_LEGACY_SUPPORT ??= "4"
+
+do_compile () {
+    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install () {
+    oe_runmake install 'DESTDIR=${D}'
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

