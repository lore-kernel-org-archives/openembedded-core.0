Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 200A77F4C0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:54 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id s12so376461pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TrpdWb1svT/GT5UoPd8rJIJSNpLmarPck42ruYQW/l0=;
	b=Tw4Mh7Kq9VqnjWrxW3j/g4YbrvB7qXLLio3vHZtJiYMAgZoeb1YHMvc2FTpxx2zQPU
	Ez0yUHKrnIgFpxPowLvQpToKWeKsXEAkHfzzj3maIwTwgsx8KPkhq4etskzytrbY9Hjq
	uNUJqg4zwj2XMcLObYbKhZZwQ67LnqgrfnHEhdpyHBRrvKl2UjoI+caSnSEzZzLI3uM/
	YmVPfqz7J/xNOcwKCQ02eEqvUHs3HGy8tJ7njJcLuhtwc1XtZV7EhwLYedv9R/Rt/USC
	PXTPhxY8AgEPpB0nWSKqYkGs37+BOaFY8690bwJ+npzPHjNkf4kEBFJW20mILzVVZQS1
	3dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TrpdWb1svT/GT5UoPd8rJIJSNpLmarPck42ruYQW/l0=;
	b=dhARFpaGvfP/O6er4EsFtL8qkrXi43hKG752DSNMekkPKq8ViGHgcfBkFo7eQDI/fY
	uLIt6WOwLcd8piGMrb2w2vSh4xawms+1v1cjY+/2t49i3JOGdbV4DVmwkmgD/+IYJ99B
	56J92lFyGiHDwqvdrSYASCZS4veOi4I++Ge4mBdwCWomCc88IhlrAV52nouBAl3kUyxd
	UnuMtLG3jb+qBI057+XC4LSzGV66imM217gw+Uy5VIphmlUaevSv71rxyexxXKG5Yy8E
	X9+rooZ6eiSbJJtQuBIn7vUyhKYOzj8NFqo4JJO4po1kxHR1zY0QRx/iir3mzTqsTdrG
	oYsQ==
X-Gm-Message-State: APjAAAXxkg2J12vfT1O0D60sWkXe620qxjDxx+TIaISyamnIsn7/B32V
	1pjShPK80eiixhQXwTAkDN8975I0
X-Google-Smtp-Source: APXvYqwMjiU2Ew2Fh6c9GE6x4nfOIlRnUNdt/TDBPsEj/vpplCZ+D17dX7nk9hm9g+tUlhDH0t8FDA==
X-Received: by 2002:a62:641:: with SMTP id 62mr29145201pfg.55.1567348615206;
	Sun, 01 Sep 2019 07:36:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:10 -0700
Message-Id: <449e5f1672e11fc11c1ec52825402cdab589a69b.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 32/43] powertop: import a fix from buildroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Sep 2019 14:36:54 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-wakeup_xxx.h-include-limits.h.patch       | 55 ++++++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.10.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
new file mode 100644
index 0000000..7bfca8a
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
@@ -0,0 +1,55 @@
+From 4c24fdd8e0a42359df7308155b2d43c28a5e02fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 May 2019 20:25:00 +0200
+Subject: [PATCH] wakeup_xxx.h: include limits.h
+
+limits.h must be included to define PATH_MAX otherwise build will fail
+on:
+
+In file included from wakeup/wakeup_ethernet.cpp:45:0:
+wakeup/wakeup_ethernet.h:35:16: error: 'PATH_MAX' was not declared in this scope
+  char eth_path[PATH_MAX];
+
+In file included from wakeup/wakeup_usb.cpp:45:0:
+wakeup/wakeup_usb.h:35:16: error: 'PATH_MAX' was not declared in this scope
+  char usb_path[PATH_MAX];
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a0b3337cf4a827e6566f8b15b6bb180f0dcef7a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Submitted [https://lists.01.org/pipermail/powertop/2019-May/002052.html]
+---
+ src/wakeup/wakeup_ethernet.h | 1 +
+ src/wakeup/wakeup_usb.h      | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/wakeup/wakeup_ethernet.h b/src/wakeup/wakeup_ethernet.h
+index 682bf95..e0fa628 100644
+--- a/src/wakeup/wakeup_ethernet.h
++++ b/src/wakeup/wakeup_ethernet.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_ETHERNET_WAKEUP_H
+ #define _INCLUDE_GUARD_ETHERNET_WAKEUP_H
+ 
++#include <limits.h>
+ #include <vector>
+ 
+ #include "wakeup.h"
+diff --git a/src/wakeup/wakeup_usb.h b/src/wakeup/wakeup_usb.h
+index f7a1f7e..15898e3 100644
+--- a/src/wakeup/wakeup_usb.h
++++ b/src/wakeup/wakeup_usb.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_USB_WAKEUP_H
+ #define _INCLUDE_GUARD_USB_WAKEUP_H
+ 
++#include <limits.h>
+ #include <vector>
+ 
+ #include "wakeup.h"
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index d943ba9..5be8d23 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -7,6 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
+    file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
 
 SRC_URI[md5sum] = "a69bd55901cf919cc564187402ea2c9c"
-- 
2.7.4


