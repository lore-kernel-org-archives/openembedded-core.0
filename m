Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8627E76DBC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:48 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id e32so258873779qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WeONo7x5CbxSyB/+2ypQeS5jyd/KzBrNwlAj06YhQ9E=;
	b=wjQyN3VniKPSyXB6ClLPPb3DAp/vZb/9uhjbSGwRq1kvmn7pTD13RjZw/NMwvaFWz2
	0Dmq1hcf4bxCrXdP3G6zimItrVVcrt/oYgSFibl33BeaLkmpMLTd3qczsU6NPHJO33OR
	pHdS/RDogHFwzno1nYw/Nyd2HSnsNxnS0anpievMY1iwkhgPWzADayf9cPuHSc7PT7Ij
	f4BbPattyV1iXGddYTc2w6lgSFgGI9fOUjFR2Kcapb5P0hlRhpypEcoUesF/eHp6YQQ8
	NB7PXKEXaJOxXMf6XdAnN2V5LUqb+ftDchv8m3kI4W7U6mexJDsVXsd3O7YqATTyhB6b
	hqhw==
X-Received: by 10.140.242.147 with SMTP id n141mr104316886qhc.2.1452248389397; 
	Fri, 08 Jan 2016 02:19:49 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:01 +0000
Message-Id: <d6cf5596d159935b91f74bba23e9f19e71190d20.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 33/53] babeltrace: Add missing header for MAXNAMLEN define
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:49 -0000

Fix bug exposed on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Include-sys-param.h-for-MAXNAMLEN-definti.patch | 29 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.3.1.bb      |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch b/meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch
new file mode 100644
index 0000000..eb16cd1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch
@@ -0,0 +1,29 @@
+From 8331b87845cafdda40e59a682f2ca8120ed0c472 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 08:17:40 +0000
+Subject: [PATCH] lttng-live: Include sys/param.h for MAXNAMLEN defintion
+
+exposed on musl based systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: pending
+
+ formats/lttng-live/lttng-live.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/formats/lttng-live/lttng-live.h b/formats/lttng-live/lttng-live.h
+index 4ab641d..808ed2b 100644
+--- a/formats/lttng-live/lttng-live.h
++++ b/formats/lttng-live/lttng-live.h
+@@ -25,6 +25,7 @@
+  */
+ 
+ #include <stdint.h>
++#include <sys/param.h>
+ #include "lttng-viewer-abi.h"
+ 
+ #define LTTNG_DEFAULT_NETWORK_VIEWER_PORT	5344
+-- 
+2.6.4
+
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
index 36345e3..1766026 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
@@ -6,14 +6,15 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
-inherit autotools pkgconfig
-
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
+inherit autotools pkgconfig
+
 SRCREV = "6e2b9096c77138593097335b9b27202d98918089"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.3 \
            file://0001-Fix-invalid-pointer-free-with-trace-collection.patch \
+           file://0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.0


