Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4B1E67819
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 23:15:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.27025.1730589349458198594
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 16:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kXOuUS2B;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d5aedd177so1923474f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 16:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730589347; x=1731194147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/b0cWfnlF5LRCXspqgJzrmXaiS0djl3968xekcrMh0w=;
        b=kXOuUS2Bsw5/qyRHN9MjucRsvldCfP5xa+58wERwjg5OO4O6Pbp/CM6+CvLmoKwsww
         AkhTUFiAAtWDMtH2ExVq2u9Zc5qdFN1md5ZjBU/EXBgwdGy/5+5LJwTxAvNg335zln6j
         6WZBbf2msiie/VyfOQPsiZxh1tLeVcvQWjxXbqhqfzxEpW8V4spD/LuwOEz4EYZQFpZX
         zO4J0RvBAi8gqvno+w0Xs3PJhZSjauHDcfQBVvOjjgwbARwIkHEu92KpbKiI+cGLbYv6
         gkCUS6y3SuteYIA3zlhuENCsqEQ58VErPL3edxGs9RUlW3zihNu9Z2gtROf30kcC+MIZ
         odXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730589347; x=1731194147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/b0cWfnlF5LRCXspqgJzrmXaiS0djl3968xekcrMh0w=;
        b=AZxr4r1WI+xLh8uvm8dhqbRUpT9vjdXVmBt2CR1hGb2mbETrXTRhTQGuoNaDnFnqjX
         TBh4HT2R6qDWtkOE4DP7rsZmwlwlKvqmKOVJAlKP4SkoY211Zlr6UW5xDLDCdtiC1957
         y0tZezasiHqQN+qL6Rytc7gVEQOLokKwBRn70WUpIXgFIWtaQHfhSmuaV9jMTnBmviNq
         OQfVC81ka7kStv1gvhktxAUZKboduktSVD+pb2p8QE/5Gjp6T1fUQaWM9OMkhYkM9Jud
         FPHlNIgq0VUy/R7fnSX9zjvrKzWr8C1x0Ekd4C53h4xTzXeLUuN4pIzSVZmiSBxyZlPE
         ThoA==
X-Gm-Message-State: AOJu0YxECx8USGSCubz46QaK4JEmviJvHixJv21R48l6wAD7RLDUrQV9
	N1PLtFNQmJRYHPA9lvAOWLjPgq/EZNv8X/KSo+bjfYvIppgnof2J9VXW+w==
X-Google-Smtp-Source: AGHT+IGV+6pe3Y0UrdkNjFln3tlj5vG8+fnBL3cqHso1g+dwCOuS6X+t88FwS7R4OOd6slQpXO6Yjg==
X-Received: by 2002:a05:6000:4013:b0:37d:4517:acdb with SMTP id ffacd0b85a97d-381be783511mr9414144f8f.20.1730589347066;
        Sat, 02 Nov 2024 16:15:47 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947c26sm140220085e9.26.2024.11.02.16.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 16:15:46 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.78 -> 5.79
Date: Sat,  2 Nov 2024 23:15:36 +0000
Message-ID: <20241102231536.6624-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 23:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206661

Dropped two patches which are now merged upstream.
Added one new patch to resolve a build error when using musl.

Changelog
* Fix issue with handling address type while pairing.
* Add support for allowing to set A2DP transport delay.
* Add support for persistent userspace HID operation.
* Add support for handling syncing to multiple BISes.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   3 +-
 ...U-basename-compatible-implementation.patch | 147 ------------------
 ...0001-gdbus-define-MAX_INPUT-for-musl.patch |  34 ++++
 ...ove-local-basename-into-utility-file.patch | 114 --------------
 .../0001-test-gatt-Fix-hung-issue.patch       |   2 +-
 ...et-for-building-tests-without-runnin.patch |   2 +-
 .../bluez5/{bluez5_5.78.bb => bluez5_5.79.bb} |   2 +-
 7 files changed, 38 insertions(+), 266 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.78.bb => bluez5_5.79.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index b3bcd278e6..d31f4e2295 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,8 +69,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://0001-Provide-GNU-basename-compatible-implementation.patch \
-           file://0001-mesh-Move-local-basename-into-utility-file.patch \
+           file://0001-gdbus-define-MAX_INPUT-for-musl.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
deleted file mode 100644
index 4f028e589b..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 44e24350aae771daa93e5a85378856f91358688f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 26 Aug 2024 09:55:03 -0700
-Subject: [PATCH] Provide GNU basename compatible implementation
-
-Call to basename() relies on a GNU extension
-to take a const char * vs a char *. Let's define
-a trivial helper function to ensure compatibility
-with musl.
-
-Fixes Issue: https://github.com/bluez/bluez/issues/843
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-bluetooth/20240826173844.2918630-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac            | 11 ++++++++++-
- mesh/mesh-config-json.c |  4 +++-
- mesh/missing.h          | 21 +++++++++++++++++++++
- mesh/rpl.c              |  1 +
- tools/hex2hcd.c         |  1 +
- tools/missing.h         | 21 +++++++++++++++++++++
- 6 files changed, 57 insertions(+), 2 deletions(-)
- create mode 100644 mesh/missing.h
- create mode 100644 tools/missing.h
-
-diff --git a/configure.ac b/configure.ac
-index a7fb51f..254f1a7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,7 +70,16 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
- AC_CHECK_LIB(dl, dlopen, dummy=yes,
- 			AC_MSG_ERROR(dynamic linking loader is required))
- 
--AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
-+AC_CHECK_HEADERS(string.h linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
-+
-+# basename may be only available in libgen.h with the POSIX behavior,
-+# not desired here
-+AC_CHECK_DECLS([basename], [],
-+				AC_MSG_WARN([GNU basename extension not found]),
-+				[#define _GNU_SOURCE 1
-+				 #include <string.h>
-+				 ])
-+
- 
- PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28)
- 
-diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
-index c198627..e3b0a18 100644
---- a/mesh/mesh-config-json.c
-+++ b/mesh/mesh-config-json.c
-@@ -28,6 +28,7 @@
- #include <ell/ell.h>
- #include <json-c/json.h>
- 
-+#include "mesh/missing.h"
- #include "mesh/mesh-defs.h"
- #include "mesh/util.h"
- #include "mesh/mesh-config.h"
-@@ -2694,7 +2695,8 @@ bool mesh_config_load_nodes(const char *cfgdir_name, mesh_config_node_func_t cb,
- 
- void mesh_config_destroy_nvm(struct mesh_config *cfg)
- {
--	char *node_dir, *node_name;
-+	char *node_dir;
-+	const char* node_name;
- 	char uuid[33];
- 
- 	if (!cfg)
-diff --git a/mesh/missing.h b/mesh/missing.h
-new file mode 100644
-index 0000000..eaf3281
---- /dev/null
-+++ b/mesh/missing.h
-@@ -0,0 +1,21 @@
-+// SPDX-License-Identifier: LGPL-2.1-or-later
-+/*
-+ *
-+ *  BlueZ - Bluetooth protocol stack for Linux
-+ *
-+ *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
-+ *
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+#if !HAVE_DECL_BASENAME
-+#include <string.h>
-+static inline const char *basename(const char *path)
-+{
-+  const char *base = strrchr(path, '/');
-+
-+  return base ? base + 1 : path;
-+}
-+#endif
-diff --git a/mesh/rpl.c b/mesh/rpl.c
-index fb225dd..2fa17d7 100644
---- a/mesh/rpl.c
-+++ b/mesh/rpl.c
-@@ -24,6 +24,7 @@
- 
- #include <ell/ell.h>
- 
-+#include "mesh/missing.h"
- #include "mesh/mesh-defs.h"
- 
- #include "mesh/node.h"
-diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
-index e6dca5a..452ab2b 100644
---- a/tools/hex2hcd.c
-+++ b/tools/hex2hcd.c
-@@ -24,6 +24,7 @@
- #include <stdlib.h>
- #include <stdbool.h>
- #include <sys/stat.h>
-+#include "tools/missing.h"
- 
- static ssize_t process_record(int fd, const char *line, uint16_t *upper_addr)
- {
-diff --git a/tools/missing.h b/tools/missing.h
-new file mode 100644
-index 0000000..eaf3281
---- /dev/null
-+++ b/tools/missing.h
-@@ -0,0 +1,21 @@
-+// SPDX-License-Identifier: LGPL-2.1-or-later
-+/*
-+ *
-+ *  BlueZ - Bluetooth protocol stack for Linux
-+ *
-+ *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
-+ *
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+#if !HAVE_DECL_BASENAME
-+#include <string.h>
-+static inline const char *basename(const char *path)
-+{
-+  const char *base = strrchr(path, '/');
-+
-+  return base ? base + 1 : path;
-+}
-+#endif
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch
new file mode 100644
index 0000000000..de01dc864e
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch
@@ -0,0 +1,34 @@
+From 6f40d44acbfb0021f21bd63e6c0703ba701d19c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
+Date: Sat, 2 Nov 2024 16:03:34 +0000
+Subject: [PATCH] gdbus: define MAX_INPUT for musl
+
+This is the same solution as was done in src/shared/util.c
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=173056368428988&w=2]
+
+Signed-off-by: Guðni Már Gilbert  <gudni.m.g@gmail.com.com>
+---
+ gdbus/object.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gdbus/object.c b/gdbus/object.c
+index 84f116bf1..7b0476f1a 100644
+--- a/gdbus/object.c
++++ b/gdbus/object.c
+@@ -20,6 +20,12 @@
+ #include <dbus/dbus.h>
+ 
+ #include "gdbus.h"
++
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include "src/shared/util.h"
+ 
+ #define info(fmt...)
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch
deleted file mode 100644
index 33c12fc3a8..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From e64c2e70a74da452b0ee147350c4ce93e1db8d2f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Sep 2024 15:11:01 -0700
-Subject: [PATCH v2] mesh: Move local basename into utility file
-
-Defining an override via a missing.h can prove difficult when a file
-needs to use basename and dirname both the APIs and needs to include
-libgen.h for them, in such situations there will be signature clash
-for basename function.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-bluetooth/20240917031745.1641153-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-v2: Remove reference to missing.h in Makefile.mesh
-
- Makefile.mesh           |  2 +-
- mesh/mesh-config-json.c |  3 +--
- mesh/missing.h          | 21 ---------------------
- mesh/rpl.c              |  3 +--
- mesh/util.c             | 10 ++++++++++
- mesh/util.h             |  5 +++++
- 6 files changed, 18 insertions(+), 26 deletions(-)
- delete mode 100644 mesh/missing.h
-
---- a/mesh/mesh-config-json.c
-+++ b/mesh/mesh-config-json.c
-@@ -28,7 +28,6 @@
- #include <ell/ell.h>
- #include <json-c/json.h>
- 
--#include "mesh/missing.h"
- #include "mesh/mesh-defs.h"
- #include "mesh/util.h"
- #include "mesh/mesh-config.h"
-@@ -2708,7 +2707,7 @@ void mesh_config_destroy_nvm(struct mesh
- 	if (!hex2str(cfg->uuid, 16, uuid, sizeof(uuid)))
- 		return;
- 
--	node_name = basename(node_dir);
-+	node_name = mesh_basename(node_dir);
- 
- 	/* Make sure path name of node follows expected guidelines */
- 	if (strcmp(node_name, uuid))
---- a/mesh/missing.h
-+++ /dev/null
-@@ -1,21 +0,0 @@
--// SPDX-License-Identifier: LGPL-2.1-or-later
--/*
-- *
-- *  BlueZ - Bluetooth protocol stack for Linux
-- *
-- *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
-- *
-- */
--
--#ifdef HAVE_CONFIG_H
--#include <config.h>
--#endif
--#if !HAVE_DECL_BASENAME
--#include <string.h>
--static inline const char *basename(const char *path)
--{
--  const char *base = strrchr(path, '/');
--
--  return base ? base + 1 : path;
--}
--#endif
---- a/mesh/rpl.c
-+++ b/mesh/rpl.c
-@@ -24,7 +24,6 @@
- 
- #include <ell/ell.h>
- 
--#include "mesh/missing.h"
- #include "mesh/mesh-defs.h"
- 
- #include "mesh/node.h"
-@@ -147,7 +146,7 @@ static void get_entries(const char *iv_p
- 	if (!dir)
- 		return;
- 
--	iv_txt = basename(iv_path);
-+	iv_txt = mesh_basename(iv_path);
- 	if (sscanf(iv_txt, "%08x", &iv_index) != 1) {
- 		closedir(dir);
- 		return;
---- a/mesh/util.c
-+++ b/mesh/util.c
-@@ -161,3 +161,13 @@ void enable_debug(void)
- 	debug_enabled = true;
- 	l_debug_enable("*");
- }
-+
-+#if !HAVE_DECL_BASENAME
-+#include <string.h>
-+const char *mesh_basename(const char *path)
-+{
-+	const char *base = strrchr(path, '/');
-+
-+	return base ? base + 1 : path;
-+}
-+#endif
---- a/mesh/util.h
-+++ b/mesh/util.h
-@@ -16,3 +16,8 @@ void print_packet(const char *label, con
- int create_dir(const char *dir_name);
- void del_path(const char *path);
- void enable_debug(void);
-+#if !HAVE_DECL_BASENAME
-+const char *mesh_basename(const char *path);
-+#else
-+#define mesh_basename basename
-+#endif
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 1b1af4ba96..572f5b0be3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From b8371d1111e21a9b3285ec0864b78e98d7acf79f Mon Sep 17 00:00:00 2001
+From 825e15ddda4aa6d8e37c1c52181f7175d2237f66 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index b85c050ffc..f56142ee50 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From bbfecd4407b6425f409c4657ac96e67f0a995a12 Mon Sep 17 00:00:00 2001
+From 9ce6360d11f0b1252f61ff78ce6f8ef03b150dfd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.78.bb b/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.78.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.79.bb
index 23d1ad69d8..30ea6d317b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.78.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "830fed1915c5d375b8de0f5e6f45fcdea0dcc5ff5ffb3d31db6ed0f00d73c5e3"
+SRC_URI[sha256sum] = "4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0


