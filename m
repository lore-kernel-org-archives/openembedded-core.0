Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.25489.1588523194920866937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mM42mMYs;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id f13so17952774wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUqjBnPbSBZqPZAepfXkjAZ4w3I9EgHPGQy1n1ASs5Q=;
        b=mM42mMYs620s3ujv8ysEQykL3vjrXqmyX6mXDP2hiQ2VuYDY07y5B9BK4yMtHwHcFF
         xGBVCoDRV8ofqz1T4bqgNpln5Zy3SdvFcZ/rmo6Zpbfr3Wdwxc2K/yVUkfRlG4qf1Ao8
         v1is0QXTzFfcb5+vsnCl8RLxt/xWjhriQwQDn0eO+XbGZSeKaRe7Jk4JG3VqeJy3XY44
         SeG11PCHCZ9REEzC7CaQK2uPIH0vWd9xiVOc90LuWx2/kszlj+Q5TiPu2PIju9DTmD97
         wyqIisB7LyTYYHgGpEFJ2EsplvgX5PzYdrGTxOaanJZTDKxp0nempTvBtC/mjMQeiAn8
         hWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUqjBnPbSBZqPZAepfXkjAZ4w3I9EgHPGQy1n1ASs5Q=;
        b=Gbr3/RVNFlrkvFIj72txApzzHC4MVDLVjRsdKuavW4UCFO1cpFfkQ+KWvX+pmGgW5A
         +6QMqM8jDlF3r4yEQ3Mn54U5awRy7JDrT0eotf1JcNoWmzunIsKvTObXeOXepu+ZlvlI
         L+yx5yCGEJ/47Nrkg0qZ+ozlcbNirdMEZikcUdJR1u+gJLcN5QN5EUNaDBmQs1+bYGbq
         WvXm7rbLFaflysjFVs02ju5GrRZluNOQPn/jjRqE/tnvHDdNJjUDP08uXjxBILE1TRHa
         4HeFgXTYr3tsqFN/LOyQLKmAGDHdh8lvGp/I2Cx3dQq9/9d8KVxkwzG6dF8kZKrmTLFu
         fMrg==
X-Gm-Message-State: AGi0PuZNRUouJDCNbq4LJvNXB/oL/XItzyU+/BcRKrPCT0tvhnBnbqvu
	8qDm4EF3xHBz/J1q/19t3h3yrJ1H
X-Google-Smtp-Source: APiQypJw05xdeOU756QoiDk8v3WI216EusPZyXqXov/941hrwzwWH+HvqLwy5cvwAVvx0xGcR0bIwA==
X-Received: by 2002:a5d:5082:: with SMTP id a2mr14425910wrt.224.1588523193256;
        Sun, 03 May 2020 09:26:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/17] gptfdisk: update to 1.0.5
Date: Sun,  3 May 2020 18:25:47 +0200
Message-Id: <20200503162559.946-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to correctly include curses header.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...gptcurses-correctly-include-curses.h.patch | 27 +++++++++++++++++++
 .../{gptfdisk_1.0.4.bb => gptfdisk_1.0.5.bb}  |  8 +++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.4.bb => gptfdisk_1.0.5.bb} (78%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
new file mode 100644
index 0000000000..67689e838a
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
@@ -0,0 +1,27 @@
+From 607b0bed5e8a5f5c3754cd6ffcf499d8134c37f9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 30 Mar 2020 17:11:19 +0200
+Subject: [PATCH] gptcurses: correctly include curses.h
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gptcurses.cc | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/gptcurses.cc b/gptcurses.cc
+index 1b18cf2..4ebfde1 100644
+--- a/gptcurses.cc
++++ b/gptcurses.cc
+@@ -23,11 +23,7 @@
+ #include <iostream>
+ #include <string>
+ #include <sstream>
+-#ifdef __APPLE__
+ #include <ncurses.h>
+-#else
+-#include <ncursesw/ncurses.h>
+-#endif
+ #include "gptcurses.h"
+ #include "support.h"
+ 
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
similarity index 78%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
index b043c96543..c7850f03ca 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
@@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "util-linux"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "5ecc3c44913bb6b53d3708d1ac7ac295"
-SRC_URI[sha256sum] = "b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c7ba78d"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
+           file://0001-gptcurses-correctly-include-curses.h.patch \
+           "
+SRC_URI[md5sum] = "58dac67c85e46ca87b587231549aefe6"
+SRC_URI[sha256sum] = "0e7d3987cd0488ecaf4b48761bc97f40b1dc089e5ff53c4b37abe30bc67dcb2f"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.26.1

