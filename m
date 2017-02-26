Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5316473133
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 04:29:54 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1chqT6-0004uf-Os from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2017 20:29:56 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 25 Feb 2017 20:29:53 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2017 22:29:45 -0600
Message-ID: <20170226042945.40308-2-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170226042945.40308-1-nathan_lynch@mentor.com>
References: <20170226042945.40308-1-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 2/2] lttng-tools: update to 2.9.4
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
X-List-Received-Date: Sun, 26 Feb 2017 04:29:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop upstreamed patch.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../utils-remove-bogus-interpreter.patch           | 35 ----------------------
 .../{lttng-tools_2.9.3.bb => lttng-tools_2.9.4.bb} |  8 ++---
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.3.bb => lttng-tools_2.9.4.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch b/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
deleted file mode 100644
index f08198208d4f..000000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4545eae3bccb0f5a97509d1405a28000029a8d7d Mon Sep 17 00:00:00 2001
-From: Nathan Lynch <nathan_lynch@mentor.com>
-Date: Mon, 9 Jan 2017 16:14:28 -0600
-Subject: [PATCH] lttng-tools: remove bogus interpreter line from utils shell
- library
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-tests/utils/utils.sh is always sourced, never executed, and
-/src/bin/bash is not a typical path for a shell interpreter.  Just
-delete it.
-
-Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
----
-
-Upstream-Status: Backport
-
- tests/utils/utils.sh | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
-index 05d88650e9f3..9db0640b70f3 100644
---- a/tests/utils/utils.sh
-+++ b/tests/utils/utils.sh
-@@ -1,5 +1,3 @@
--#!/src/bin/bash
--#
- # Copyright (C) - 2012 David Goulet <dgoulet@efficios.com>
- #
- # This library is free software; you can redistribute it and/or modify it under
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.4.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.9.4.bb
index 4c11e5b73dc3..fbf3ae985167 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.4.bb
@@ -28,11 +28,11 @@ PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
-           file://utils-remove-bogus-interpreter.patch \
-           file://run-ptest"
+           file://run-ptest \
+           "
 
-SRC_URI[md5sum] = "19fdcc5e9c307ef66581a2743a08a541"
-SRC_URI[sha256sum] = "a6e6baaaa977dcbc9bce6b675881eec664599b86f0d905a7b0b508539407b24e"
+SRC_URI[md5sum] = "10f47abfa214b167580358388428770d"
+SRC_URI[sha256sum] = "3c72456bceef961fad1d0861f07478db16b7659efa69099ba36645da89ca2cc5"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages
 
-- 
2.9.3


