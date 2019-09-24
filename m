Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 498297F276
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:05 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g3so345608pgs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TrpdWb1svT/GT5UoPd8rJIJSNpLmarPck42ruYQW/l0=;
	b=exk+xPQz+BKfby/B6mcrRifK29Xp79HfMaWWWAktQ56qW2pbeOfCFqEtWyHzLTn3LT
	ah8X6mW25/H2ZeNGmTNITLUVgrk2XgUlPpTHvBfmBMoFsbkViFGv/77nHMiiCfY2UxKt
	rpGqDfiTkNyG/RMu1hskQd56CZiXqC0HZtSpRoYs5eBDUvrmOhZj1LUqe4LdHXl4wfbA
	hnjknE0qDvwpgiSXtHyDqTbmKRiM48f7hrSekhhhkwJwQGPjYGEuTYMrtqivd9yqrnAx
	xuHiV6ei7wh7JpXr2T1wnXHpSzh4uTGmnAjr5hW7gVRf9rC0lKP3UAIP3CxBvurVvWRh
	5ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TrpdWb1svT/GT5UoPd8rJIJSNpLmarPck42ruYQW/l0=;
	b=dWQ9hI8Twv5S8MCZY9j9uvcUFSnHLNhCo/qPnc5yURDyrqqKDpE/jYqTs8o02krqrb
	SyVlnRlsmzH9qNnM5Zw2ciJfd4lTMlucPDdf3jtSM4W7kvwjP2EfGaUF+Mw72SsaL+9e
	ekpG65x2+IOlhh+AvyBkgCPPKJ0m/GiAZKmzhkrXFgLlfhAbE7ewzngIoWTSqobx1t2e
	R4R8FgNAbgb0PuuYbTwr8XQIh+hxdn2YUNeGKq/lJ1beaoWbN/0WYgZp7eyh57tXtfBQ
	3j7SJqq5M4/GBAk6gmxapiswFWPx/eUIB6okannUZYBzSbJ3yUh04A6r5NFmNZsUPUv/
	ImbA==
X-Gm-Message-State: APjAAAVaQ+rN7RD3nBWbGkjEddphEM2jLZuwYYZLRIADFca5cWX5ea6d
	taYQDseJp+1qg4n7QSeDd8ttRIBsjTU=
X-Google-Smtp-Source: APXvYqzf3Xu6OepfbpbLDhBEy5mVlQHXO2IbCrECW0M9LsuwSuoR9KxRja8Wdth7FnS3sCqH21uX1Q==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr420256pjg.80.1569293406260; 
	Mon, 23 Sep 2019 19:50:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:12 -0700
Message-Id: <449e5f1672e11fc11c1ec52825402cdab589a69b.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 32/50] powertop: import a fix from buildroot
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:05 -0000

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


