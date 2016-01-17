Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A51776639
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:27 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id uo6so404040826pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WeONo7x5CbxSyB/+2ypQeS5jyd/KzBrNwlAj06YhQ9E=;
	b=gwOFNuNe0BXoTOl9wqM8Li4ZADJ/v8AlxTf17ubNR6Ob56St+UzUosTln1srTvFqB1
	RiJVWaILcSnTfYa88cz1ew2SOgCKp3VHsAoxzv7+PjgRlvQ9V4v2jBnVlSOSCmS+kic4
	vIpRkP1OJLAF89U7XZ7unKp7KbJA7YbpaBJgxJ4EVBIpuYfQ2/eZNCH4PJd3UthC4rRy
	gnoH0htNXk/hluWAW56E3BDxV4P+kwmW5AzlI3Ue/HPpwZfT+ZnFV1JJ2eLmQdgLhxo9
	1/Xp3nL7hX33Tg9H0bRJIXkpaLHGVGBTQDwOhkA0YM9bOsug0vR30H5dpHY8r7lN9DiA
	V3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WeONo7x5CbxSyB/+2ypQeS5jyd/KzBrNwlAj06YhQ9E=;
	b=bm73Qe1ifSpaO78k+xzY2KJXQvOJQflyGC2bQp+BWOtR2G1pwOHrWYxKZQGSpLAmPi
	Azuad4GKOiyMzklbIHHR0rmp8WPEMccwlzOgAE9lHzboQH0XzMnir28rZwl2wFTuf6mf
	Kzp/x4ROOEDj3fyE1OhYDB92G6885L5sN1TBT/s4buYp8PSfTzVZErmfMjPZD+m7sZ7f
	sTZIeOUONnx1FAXClDmMBldOQMcPnY90ug22jAhL2ZSptVA7+4DGmMVIRfym7LGKDxgf
	apDJgMmy1Uu54QfrNVqDkVOJYZfWh6PYHX/vjgsZkTcmghzKzKOJjm1sTn0qhetC50Gl
	34Gw==
X-Gm-Message-State: ALoCoQk/s9CycwMaYvmep4QcRvSHijMwgqF10dKAPY8V9OlKn/GpSLtULrGBBKu4c6NXsEEnyVuxFV9le2kfZuoRjLTNDOEsRw==
X-Received: by 10.66.158.129 with SMTP id wu1mr28652714pab.146.1453030648896; 
	Sun, 17 Jan 2016 03:37:28 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:04 -0800
Message-Id: <a29dd1e27ef398379f5fab6df3718c6f6620c1eb.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 31/73] babeltrace: Add missing header for MAXNAMLEN define
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:28 -0000

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


