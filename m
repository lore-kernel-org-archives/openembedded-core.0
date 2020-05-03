Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.26079.1588523205842462225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBJeAbQQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id l18so7253031wrn.6
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mG8fT8wLygW4JbFzqtq3ne//savLoCLPwdddZwLWUyg=;
        b=lBJeAbQQNF7J60U9gHbQBWAGoS/8m6gWpBEeG87RJP8Pw7Yu/oV0erHp5x0ExLA0Vy
         zYyOiCbuDV0p/tcQcnFnCPoqPwh5lWLuz00mO+sWsGZjSxImZGvfJU+8Daogz8eCxioR
         Q1srWmSkXTinADsHJF4HGaqLwBkt0QhSNCtm0jQem4FVzJXLQUB/EGq+5QrQQyMKx/f6
         JbSc3exL62QakTqWmubZa+K9nQfGJ8Bm0HtnGoIUObgkqiPBTIs4yMlv60Bze72NgQyf
         EletvlQBXJgK0NHRs1fnkaMTnxxp0n21subs5Is3Y6/YWeZin4QBYIHQtOAiHjdZrUvR
         eOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mG8fT8wLygW4JbFzqtq3ne//savLoCLPwdddZwLWUyg=;
        b=WlUDVhmQm2dxFtfTeUPJtJUi+vUDuL3PpAoiKrVUbFKwgeJHqK2tHnw3Z2OUVK5gFk
         X7wmKg76YUHnPV0i3H5UjG7e6qwlZNeMkDMHcGggT0uLWPlogLI87fvrkWyg8i15GIB9
         PhNcqM8CO/esXUDg2ZsxRu3Kqm1eNFJq3zZxCptFGrLES+L+oSlZAo9K7eudbjDVBxgD
         K48sVRpHPT5APtUJOJgLLuyKwc/wLrNGQbMVA8Tp6Vb39rPYcNzlbirvuwnGsXFMH2kE
         Uc9bK6jlIn2psQkH6BbSUBVf6DqTI2aIzsbF8J8XB1PN5z7PWflfIHPlZ6IyMb11icMv
         TgGA==
X-Gm-Message-State: AGi0PuY8cSxXU1oN24erQ4Nur8rXJJC6oThFJdqyRj/q0BtLrbgCWqrX
	c/lEbP/Y9Y4EPuQfTXTUmPJkOlVd
X-Google-Smtp-Source: APiQypJn89Wvxqny1CnydLq7A7U4lv52L4EFwOrk6cLvmdJbdcyfxpiBZnQTIFbTZyw9qzjPJgnhBg==
X-Received: by 2002:adf:f343:: with SMTP id e3mr14153410wrp.51.1588523204116;
        Sun, 03 May 2020 09:26:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/17] xkeyboard-config: update to 2.29
Date: Sun,  3 May 2020 18:25:58 +0200
Message-Id: <20200503162559.946-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-fix-python3-support.patch            | 34 +++++++++++++++++++
 ...onfig_2.28.bb => xkeyboard-config_2.29.bb} |  8 +++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch b/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
new file mode 100644
index 0000000000..f723f70332
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
@@ -0,0 +1,34 @@
+From 168ac446cdd9a1b59d6b708360a9556515ba56b9 Mon Sep 17 00:00:00 2001
+From: MilhouseVH <milhouseVH.github@nmacleod.com>
+Date: Sun, 16 Feb 2020 09:41:43 +0000
+Subject: [PATCH] fix python3 support
+
+https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/issues/197
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ rules/compat/map-variants.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/rules/compat/map-variants.py b/rules/compat/map-variants.py
+index ebbfec9..979ba43 100755
+--- a/rules/compat/map-variants.py
++++ b/rules/compat/map-variants.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ 
+ import argparse
+ import re
+@@ -12,8 +12,8 @@ class Layout(object):
+             assert variant is None
+             # parse a layout(variant) string
+             match = re.match(r'([^(]+)\(([^)]+)\)', layout)
+-            self.layout = match[1]
+-            self.variant = match[2]
++            self.layout = match.groups()[0]
++            self.variant = match.groups()[1]
+ 
+     def __str__(self):
+         if self.variant:
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
index 7a3d694bd6..598b584787 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
@@ -12,9 +12,11 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-confi
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
-SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5a968ab77846ff85a04242410b2a61de"
-SRC_URI[sha256sum] = "69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce"
+SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2 \
+           file://0001-fix-python3-support.patch \
+           "
+SRC_URI[md5sum] = "b5980bdc6c7d79f6dcccba8c76bb6c5d"
+SRC_URI[sha256sum] = "1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.26.1

