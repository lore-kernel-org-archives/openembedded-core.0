Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.25163.1591602510667186463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uWKfEDwG;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id x93so12554779ede.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cOgu/8sHQdrlFR4qyqHj9Fa0vFWfOur9DOHL0F8+5Fg=;
        b=uWKfEDwGAh7JnqgEnSrzxcOvwetUVJQprfl9c7z8z1gS4ef1+JFhF1lBlxyHrAkO/f
         mXd9s7dmZu5XL13vj2JnCh/rAoPBL5itn3x55eK8YcBcizqqgvsDyFF6NrHVGqqYk8lS
         /CSovMkXuCMwCXdXRFk1P6QI2TPIizPMguVO5ttQkAQI4IynERVK6MjbVsLzBG3o9l7s
         T2pOIwAJF8fv89uwI0ZOa9FoM7oKX4FLxAzd9hrDtQxjnN3mUM2vPnOwSBIjLz7xRqBA
         3H7UncJZBIHcJlP8UbyVNwlf1GEHkRK0k8ZUh4pWVcTI0nELi//kv2fDrGE2BYp4M7GG
         cG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cOgu/8sHQdrlFR4qyqHj9Fa0vFWfOur9DOHL0F8+5Fg=;
        b=nfa1V5kPi9QNS/ksKw/7DQEM36IvD4HqOL+7TdPqVAm+z0z/fmXE+M9WJJL0w5Z17y
         sWz4UDx7wGVnwzFshUjtGVl20PiHBchegU49McAzF6cgrIxHqzgkxUng4UgJbrpd2Fik
         AR9ND5vA4IfPsg/VTVKZEAT5hFsgpoqL6GBjIULMS/ckdY9qo3Z9NMlIU/xDztS1nEl7
         Lm36ya+zOOY2A7y7eA1KN42ViQZi5Jc1PaiTOpGsreFsK6DHVhzYoYOUZphXMVOCa4qi
         Jma6HHMtSXQU6Rk3Qt+UVL3aN8Hbm6Hpzhe6CQ7CjbicYMfqTjHUz5KZs6MMfvbbG5Ai
         WQfw==
X-Gm-Message-State: AOAM531tkso3w2oqPw/KoaL4qvYxf6xEwNUDtb0/O7NMowJx1iSYd4gr
	DBxDP86CbMzuWSjH8u7hL8wOPB+RwMI=
X-Google-Smtp-Source: ABdhPJxp6WP4LqTY5Tcfu1PfqnADzegB2qEZU370bA/NrEybFmOsi+A7PRJW3OLKuA3ziyKhxC2odQ==
X-Received: by 2002:aa7:d806:: with SMTP id v6mr21478250edq.174.1591602508995;
        Mon, 08 Jun 2020 00:48:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/42] xkeyboard-config: upgrade 2.29 -> 2.30
Date: Mon,  8 Jun 2020 09:46:35 +0200
Message-Id: <20200608074659.7051-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-fix-python3-support.patch            | 34 -------------------
 ...onfig_2.29.bb => xkeyboard-config_2.30.bb} |  7 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.29.bb => xkeyboard-config_2.30.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch b/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
deleted file mode 100644
index f723f70332..0000000000
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 168ac446cdd9a1b59d6b708360a9556515ba56b9 Mon Sep 17 00:00:00 2001
-From: MilhouseVH <milhouseVH.github@nmacleod.com>
-Date: Sun, 16 Feb 2020 09:41:43 +0000
-Subject: [PATCH] fix python3 support
-
-https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/issues/197
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- rules/compat/map-variants.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/rules/compat/map-variants.py b/rules/compat/map-variants.py
-index ebbfec9..979ba43 100755
---- a/rules/compat/map-variants.py
-+++ b/rules/compat/map-variants.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- 
- import argparse
- import re
-@@ -12,8 +12,8 @@ class Layout(object):
-             assert variant is None
-             # parse a layout(variant) string
-             match = re.match(r'([^(]+)\(([^)]+)\)', layout)
--            self.layout = match[1]
--            self.variant = match[2]
-+            self.layout = match.groups()[0]
-+            self.variant = match.groups()[1]
- 
-     def __str__(self):
-         if self.variant:
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
index 598b584787..a4d67cd2ce 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
@@ -12,11 +12,8 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-confi
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
-SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2 \
-           file://0001-fix-python3-support.patch \
-           "
-SRC_URI[md5sum] = "b5980bdc6c7d79f6dcccba8c76bb6c5d"
-SRC_URI[sha256sum] = "1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802"
+SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "095a524f7b633ed257617202d06c9c71fe020c8897b106cf0dcdd0c6e8b797d4"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.26.2

