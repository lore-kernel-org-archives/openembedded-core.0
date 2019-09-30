Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id E73FF7F323
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:24 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y72so4846429pfb.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TrpdWb1svT/GT5UoPd8rJIJSNpLmarPck42ruYQW/l0=;
	b=o52lH2mmN3cexAqGPfD41bzuLcpLDzzg9R5pf/PLkDzHpPZPRgDyZ5uYBaX/9EYtHA
	YxUR3n2qjV3zepvgel5V2bnye0FJhaJv6EjJ0vxTfuNoSI2JkaQELr36qc6kHWJrZFSF
	JKY52iRM86olUXgkpa++u0eFmhXWuKlDFGkQgAkwe8oVuZjjXxCEUCT8ECR0nKAKB4gt
	dD03iOCMb4dlG2t8BfbY7aOeRkPE/UvzkCmhLbgzogueCGT4zpUkpWGloxD30gqWuCqc
	s9UjLt6WdTAzryNobXhwrEdqfBPAXAHT7NyPVny/ns5NsTTe/v8wQn13vgePlKcO2H6J
	4PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TrpdWb1svT/GT5UoPd8rJIJSNpLmarPck42ruYQW/l0=;
	b=miyOmDZlE3Ot6NYpIOm/848WlZBvUERyI1M/gLbdRJ8sELQwMdFUYP0j8+s4OppQdJ
	gj70PFIIfd1B5NpMCLWP+Nm63QBaYCwmT3HS2y4n+b/SP4PWblN8btjJcgTCkbLgiOVm
	3GN75ZDQLfJvEHeiyekEo2D6UGbVMcXkEkZxMFY4MssQq75KH52JQXWyJvvMLuoNaZmd
	TFclX+u3lekT/A5jPhGZisJnDeYddywZkMB2RvtMuyG6iXKbL2gvym+U2Gbjm4UXu4oY
	sx7ggtRrXiISq+4xLREE3RP5QglM+f0uFGc1RgizCNHli7POhEHQcAwkbyQ/VGNmxW4P
	q9zg==
X-Gm-Message-State: APjAAAWxD36ru2k/TcVT1zbJMUT91Y1CR41kmf2q6DbzZBQ/JSKbwvjZ
	0BRe+9OWiAKvML5KpZS961eyLtBoJQ0=
X-Google-Smtp-Source: APXvYqzDqoKbFXoOU6+ykXJ5d3QTRQAG72oaHR1t5qD4zv71FSJIzwi7I2TCRjB5BsnKDFrbEGO+pQ==
X-Received: by 2002:a63:f643:: with SMTP id u3mr20569464pgj.339.1569818905747; 
	Sun, 29 Sep 2019 21:48:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:26 -0700
Message-Id: <efd32b0e627fe5c8e9963c40c0e1abbd0b9ac8fc.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 31/54] powertop: import a fix from buildroot
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:25 -0000

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


