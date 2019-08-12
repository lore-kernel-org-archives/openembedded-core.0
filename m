Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9777E5F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 09:51:12 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q12so13738603wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i+xaLNF6u2vT72WzPgdCKV4IOHYK/qo1JtppoZMLA+M=;
	b=joC1Hf7E6DmVnTzrBXS2RA6WpJ14FOrEUzEs1BqcBUWBFgTcaI/DB0Hkl0FwRFsKCj
	w+1JweBoRiw5el9BPRq24ZdfL4H0fOoqDbRaNyoDh30Qy8s5hPm+pqF+aNMp9rhIqkUQ
	M1HODEBYS4pz9Zu0wfRbNQ34zIpnHcGbxxyFt7u1YwfpHN2DcOnPtpjJd8CmyMmP2Yiu
	oQTBQWhjrEKeFlGB/eMRSbqQpivFdewN0sq9dVf6VPe3cn9xu2VjZPMYi3s/3xARKPli
	dXgEO/Lqi+Bufz92Uo8+gQZOg3ufz/cuPVtLKXMXDtkf2xSMaOGhTNgXGkxzkI4rKISy
	Qxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i+xaLNF6u2vT72WzPgdCKV4IOHYK/qo1JtppoZMLA+M=;
	b=EKWnr2B7sLtzJ1VkiUpxBUkfI19/GpvdR3mfqXSIHn9tyzSyOqO5/LCF7BnnYGrp5K
	gPaVOKw5XIHVkqDetd1gQX261NbRHZzseJJ+343xl8lMSC+qu+aZsWwE2sFaXc4tJUEK
	wZqS/phefu2ASvlgX5GopwX8pNVTzmp9gB+NjaR0KA8Ec+XAd7WROdTmDe0MWKQfvl+H
	nOXNJZSU/54jXgCMNusZ5+AX2G7AVQ0CV+68V3QGiFp2VFuu12v0fCkMNJ28h0zkdTvr
	00ZLFlhC6f8x6WtEajq9F6wvsr+fiNCRF5siq4l0LF07LhELM1FGFOVIgXmFEaHKkgGg
	H1uA==
X-Gm-Message-State: APjAAAWWLqHEEESvIJyBOu8/P+wiRz9StmoNe6Ly2X1Ymbd6kav6KM9t
	bP3S/20h3fd7k3uU1prO/UO+c6f8
X-Google-Smtp-Source: APXvYqwAjZoy+tQRlu68iG4AhL3J1R/sbENOY1KRNH20SoanrkPn36HRrez36RXdurGt9hPIwqdaiA==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr7945960wru.310.1565603472653; 
	Mon, 12 Aug 2019 02:51:12 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c1sm231913784wrh.1.2019.08.12.02.51.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 02:51:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 09:51:09 +0000
Message-Id: <20190812095109.295-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190812095109.295-1-Martin.Jansa@gmail.com>
References: <20190812095109.295-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/2] powertop: import a fix from buildroot
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
X-List-Received-Date: Mon, 12 Aug 2019 09:51:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-wakeup_xxx.h-include-limits.h.patch  | 55 +++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.10.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
new file mode 100644
index 0000000000..7bfca8abfd
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
index d943ba9f6e..5be8d23111 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -7,6 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
+    file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
 
 SRC_URI[md5sum] = "a69bd55901cf919cc564187402ea2c9c"
-- 
2.17.1


