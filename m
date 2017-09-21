Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C57B177F38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:47 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id o42so4049780wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h1NE4HSTlWBRjp5NN2I/MLSOFlfO0wSBrmizG/XzzKM=;
	b=PHFdkRiRAeyIhnOlbC2HbdWR9xw3Yi4tYis4WU7/PbbDwF2z6Ui4WGPJmCJFkzFuEJ
	p5atYYnug6QKDuHjkmFa4y6qT6UOmw8skJ2jAY6yWfW47iT/+TmdSbkpsPEdG/CLl/r7
	GDlyM/MwBPNI/+UhIPULu9JT2ppoMptgf21Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h1NE4HSTlWBRjp5NN2I/MLSOFlfO0wSBrmizG/XzzKM=;
	b=bpjoXGQV6J+BdIx/gd0kvUijQ2TLQvK6pKQTubKc65PudGigTplWA1m8sH9cSRsXu2
	gxY2ZH9BQiBF7CVc4c2iRuE+sGYEWgzRnC8ZLgo8xKnjncxAFBPlz3AafIMM4FOTYaWl
	bHDp+5EOtPEVuXYAiNa6vDG9rHDlcQCIEE4/vNkhFQ1leVjF3Hbo9Rd117IymjyIxMNm
	6TatTEq9p24zoRxu2vy2SGQ05pz/5o4h5t1YZIHqJyiuy+up/ehc8G93Z6EV1os3QzWg
	pT6+X4nutoGO0reP/fvA/ITQ3kFLBHpgv7qkg1Yx0opsLEDUkpMuk8BVckp6yEdUVoaX
	JcmQ==
X-Gm-Message-State: AHPjjUgjDUtb3pQM/mS/F2qUnhl+nDfMituNoxS61ubhPEt8vqGzYoN/
	S2cNhB/VxEhdTEJfVtMjyFcnTGAtmi4=
X-Google-Smtp-Source: AOwi7QBB77y1kFC7QpLtJKCA+fBXfJoowG29lZhDJJaSL/bz6eBaKBby08rq3EaCKxZ5RD64PT6Y+A==
X-Received: by 10.223.171.21 with SMTP id q21mr1281081wrc.125.1505985708344;
	Thu, 21 Sep 2017 02:21:48 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:47 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:22 +0200
Message-Id: <20170921092131.25537-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 01/10] gstreamer1.0: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:49 -0000

Bugfixes release only. Removed local patch which was merged upstream.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...dd-switches-for-enabling-disabling-libdw-.patch | 70 ----------------------
 ...treamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} |  5 +-
 2 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} (59%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
deleted file mode 100644
index 1132fd5a48..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a0cb41ba72913eda06049d266ec43ea8f52b5bee Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Fri, 11 Aug 2017 21:21:36 +0200
-Subject: [PATCH] configure: Add switches for enabling/disabling libdw and
- libunwind
-
-[Original patch modified to be applicable to 1.12.2]
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=778193]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- configure.ac | 38 ++++++++++++++++++++++++++++++++------
- 1 file changed, 32 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b6b2923..32dd827 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -821,15 +821,41 @@ fi
- AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
- 
- dnl libunwind is optionally used by the leaks tracer
--PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
--if test "x$HAVE_UNWIND" = "xyes"; then
--  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
-+AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind=yes|no|auto],[use libunwind])],
-+            [], [with_unwind=auto])
-+if [ test "x${with_unwind}" != "xno" ]; then
-+  PKG_CHECK_MODULES(UNWIND, [libunwind],
-+      [
-+        HAVE_UNWIND=yes
-+        AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
-+      ],
-+      [
-+        HAVE_UNWIND=no
-+        if [ test "x${with_unwind}" = "xyes" ]; then
-+          AC_MSG_ERROR([could not find libunwind])
-+        fi
-+      ])
-+else
-+  HAVE_UNWIND=no
- fi
- 
- dnl libdw is optionally used to add source lines and numbers to backtraces
--PKG_CHECK_MODULES(DW, libdw, HAVE_DW=yes, HAVE_DW=no)
--if test "x$HAVE_DW" = "xyes"; then
--  AC_DEFINE(HAVE_DW, 1, [libdw available])
-+AC_ARG_WITH([dw],[AS_HELP_STRING([--with-dw=yes|no|auto],[use libdw])],
-+            [], [with_dw=auto])
-+if [ test "x${with_dw}" != "xno" ]; then
-+  PKG_CHECK_MODULES(DW, [libdw],
-+      [
-+        HAVE_DW=yes
-+        AC_DEFINE(HAVE_DW, 1, [libdw available])
-+      ],
-+      [
-+        HAVE_DW=no
-+        if [ test "x${with_dw}" = "xyes" ]; then
-+          AC_MSG_ERROR([could not find libdw])
-+        fi
-+      ])
-+else
-+  HAVE_DW=no
- fi
- 
- dnl Check for backtrace() from libc
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.3.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.3.bb
index 8d41a59d91..98928c9466 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.3.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-configure-Add-switches-for-enabling-disabling-libdw-.patch \
 "
-SRC_URI[md5sum] = "4748860621607ffd96244fb79c86c238"
-SRC_URI[sha256sum] = "9fde3f39a2ea984f9e07ce09250285ce91f6e3619d186889f75b5154ecf994ba"
+SRC_URI[md5sum] = "33dfcb690304fccdaff178440de13334"
+SRC_URI[sha256sum] = "d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.11.0


