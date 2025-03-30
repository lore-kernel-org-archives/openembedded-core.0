Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD466C36008
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 02:36:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.24058.1743302195508784966
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 19:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7h/ncm9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso25436535e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743302193; x=1743906993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+WGvQCr9UeSiHTxR9l0/EI9F9ugYdAZPy5SLFy0AWtQ=;
        b=F7h/ncm96S2OC9MS9ecDCve49W+vDzYzPLSK+D1Smx8W4N3gAHfoWY15aTwG1Yt8B+
         0u0mz8z+r9LHcrtu6m/gk4Rn6TwTKR26AvQPwNTelFODrGd/n4f/5oHi+shnrgg+pX41
         7AWab4UIXVBo3RjC/e//wubbzL22i9j7pJ0iEZDJJ9D5aV43gUNSmQgwvDHa0xLN3akQ
         BC3eRDPRkDDARzaY+XtQRhgf2VZCWqoQd5D6mYN7DDdhLs2+nNfsLcLe0z5AjO6NmzUB
         7JJy3WGItryU9JxSQ2u10yWNKgbbP617bqlU5stjhvM8dKwzXYAuVJeAd2Zzkp6RSmJg
         FE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743302193; x=1743906993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WGvQCr9UeSiHTxR9l0/EI9F9ugYdAZPy5SLFy0AWtQ=;
        b=Y343LTRIA4vst6+vxptXMSzwVd6iyq3KBmYH0ZcEntTVdTEVNEpZflWjhjP2yalD3n
         aQz0HpSIrRUH0p6l353nUQWb9tCdPqY/4taJXI6Fq8A3crqm1XPoD1k0fAe2wgOb95F5
         8YABB6CZN7Mp47x57dgFcUi9BRyPHHjrDocoMEGIeLEa+FP8EYhf673iaVmhHPvEUraV
         eoXsOEuiQK1OlxQYuEMR4k7dgD+CIekFMBlyHghz1GsMz4m2yePzpLum/nE+dRXLn82V
         J6RHEzUVM137hn9ZkSCVZMVkJx6St6UeC33nkfyOQZoJqmEKrBNSVqAY9mvocHuAhpqn
         u7xg==
X-Gm-Message-State: AOJu0YyJsbDy+hwiQ7BpE3of9BOa1JwlQknXYghXG4Xs9JTMwlqHIWFI
	3GoVamrIj8xIcznclhgkLIKqbRRxKTtBiVx8BmGHpYo4LVh8TQ58BCdrvw==
X-Gm-Gg: ASbGncvRWTNVqYCxa2bcD8oXBiYG41sXRdYdCt16zl2GskW8DVSEMoCd+N+pv6R/I9H
	IFXBnLAR1NCXUmsdsIih1FL2Rgj9iOdJ1GgQXL6SbYV0Z2IGjAMGo+MVJaW8FnTd1sDWEsErz6k
	ytRNys/oWIO7/cZvTQdYiRPnbCyKnTO855EoL85NwPXPvw/f4/ii6NWGhC64xj8y3YlH9Dyo4y8
	nva/RScJPkZXbDwCUm6nDwccjhvAlTi2gQdwxG7op7X4Pn/JUzbdvvPKvphvRAJpN89gblOUra/
	tmy6Bgau/MrCbFP4NGeLLkQkAKcqOdQDn51SvXKbD+ZVQ8Mo/DZsNvj7lF+4h1QwdB7Y1QGHXTL
	Krreh
X-Google-Smtp-Source: AGHT+IFb6mPXKq2ZcPBwlD4bg4+io0VGWtiYz88MD/ZlUtXmfmsP81/qFOyaWq/AodfBOAgTLeNlDg==
X-Received: by 2002:a5d:584a:0:b0:390:f6aa:4e72 with SMTP id ffacd0b85a97d-39c120de3ddmr3278805f8f.18.1743302192957;
        Sat, 29 Mar 2025 19:36:32 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm7304692f8f.27.2025.03.29.19.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 19:36:31 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2 1/3] bluez5: upgrade 5.79 -> 5.80
Date: Sun, 30 Mar 2025 02:36:21 +0000
Message-ID: <20250330023624.58070-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 02:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213907

Changes relevant for the build:
* Four patches are dropped because they are included in 5.80.
* Removed changes to etc/bluetooth directory permission bits. They are
  now set correctly in 5.80 [1].
* AMP code has been removed [2]. This means "tools/amptest" can be
  removed from NOINST_TOOLS_BT

[1] - https://github.com/bluez/bluez/commit/b1fd409960001a77cda2a09ecc00147ebd9c3667
[2] - https://github.com/bluez/bluez/commit/1474c11618bc1092f7dd4b304d3768ce9da02b13

Changelog:

    Fix issue with handling address type for all types of keys.
    Fix issue with handling maximum number of GATT channels.
    Fix issue with handling MTU auto-tuning feature.
    Fix issue with handling AVRCP volume in reconfigured transports.
    Fix issue with handling VCP volume setting requests.
    Fix issue with handling VCP connection management.
    Fix issue with handling MAP qualification.
    Fix issue with handling PBAP qualification.
    Fix issue with handling BNEP qualification.
    Add support for PreferredBearer device property.
    Add support for SupportedTypes Message Access property.
    Add support for HFP, A2DP, AVRCP, AVCTP and MAP latest versions.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  9 ---
 ...0001-gdbus-define-MAX_INPUT-for-musl.patch | 34 -----------
 ...-shared-ad-fix-std-c23-build-failure.patch | 34 -----------
 .../0001-test-gatt-Fix-hung-issue.patch       |  2 +-
 ...et-for-building-tests-without-runnin.patch |  6 +-
 ...ared-shell-fix-std-c23-build-failure.patch | 34 -----------
 ...tt-helpers-fix-std-c23-build-failure.patch | 58 -------------------
 .../bluez5/{bluez5_5.79.bb => bluez5_5.80.bb} |  3 +-
 8 files changed, 5 insertions(+), 175 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.79.bb => bluez5_5.80.bb} (93%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d626872103..a81f317a37 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,10 +69,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://0001-gdbus-define-MAX_INPUT-for-musl.patch \
-           file://0001-shared-ad-fix-std-c23-build-failure.patch \
-           file://0002-shared-shell-fix-std-c23-build-failure.patch \
-           file://0003-shared-gatt-helpers-fix-std-c23-build-failure.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
@@ -113,11 +109,6 @@ do_install:append() {
 	for f in ${NOINST_TOOLS} ; do
 		install -m 755 ${B}/$f ${D}${bindir}
 	done
-
-	# Fix the /etc/bluetooth directory permissions when systemd is disabled
-	if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'false', 'true', d)}; then
-		chmod 0755 ${D}${sysconfdir}/bluetooth
-	fi
 }
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch
deleted file mode 100644
index de01dc864e..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-gdbus-define-MAX_INPUT-for-musl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6f40d44acbfb0021f21bd63e6c0703ba701d19c4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
-Date: Sat, 2 Nov 2024 16:03:34 +0000
-Subject: [PATCH] gdbus: define MAX_INPUT for musl
-
-This is the same solution as was done in src/shared/util.c
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=173056368428988&w=2]
-
-Signed-off-by: Guðni Már Gilbert  <gudni.m.g@gmail.com.com>
----
- gdbus/object.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/gdbus/object.c b/gdbus/object.c
-index 84f116bf1..7b0476f1a 100644
---- a/gdbus/object.c
-+++ b/gdbus/object.c
-@@ -20,6 +20,12 @@
- #include <dbus/dbus.h>
- 
- #include "gdbus.h"
-+
-+/* define MAX_INPUT for musl */
-+#ifndef MAX_INPUT
-+#define MAX_INPUT _POSIX_MAX_INPUT
-+#endif
-+
- #include "src/shared/util.h"
- 
- #define info(fmt...)
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
deleted file mode 100644
index 82eaed7929..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5c4cbf5cb95e4fc1a53545af52b420a8008b3ffa Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 13:02:56 +0000
-Subject: [PATCH 1/3] shared/ad: fix -std=c23 build failure
-
-gcc-15 switched to -std=c23 by default:
-
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-As a result `bluez` fails the build as:
-
-    src/shared/ad.c:1090:24: error: incompatible types when returning type '_Bool' but 'const char *' was expected
-     1090 |                 return false;
-          |                        ^~~~~
-
-Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=da5b5b0ecb1ead38676768ef78d46449d404bdc0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shared/ad.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/shared/ad.c b/src/shared/ad.c
-index d08ce7a..dac381b 100644
---- a/src/shared/ad.c
-+++ b/src/shared/ad.c
-@@ -1087,7 +1087,7 @@ bool bt_ad_add_name(struct bt_ad *ad, const char *name)
- const char *bt_ad_get_name(struct bt_ad *ad)
- {
- 	if (!ad)
--		return false;
-+		return NULL;
- 
- 	return ad->name;
- }
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 572f5b0be3..90c5ebdcc6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From 825e15ddda4aa6d8e37c1c52181f7175d2237f66 Mon Sep 17 00:00:00 2001
+From 0787e67bebbf8492b6c5f03ed816cf881edbea64 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index f56142ee50..ad04a46a36 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From 9ce6360d11f0b1252f61ff78ce6f8ef03b150dfd Mon Sep 17 00:00:00 2001
+From b6438d9e6cd5bdbca05b444ff6d955e5b70dbb2e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 68bf058..a376d10 100644
+index 0821530..e7cefb5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -713,6 +713,9 @@ endif
+@@ -723,6 +723,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
deleted file mode 100644
index 9ea622601b..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 408510d751e9482fe965e5dd96fbac7f9ee2ef62 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 13:03:29 +0000
-Subject: [PATCH 2/3] shared/shell: fix -std=c23 build failure
-
-gcc-15 switched to -std=c23 by default:
-
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-As a result `bluez` fails the build as:
-
-    src/shared/shell.c:365:24: error: incompatible types when returning type '_Bool' but 'struct input *' was expected
-      365 |                 return false;
-          |                        ^~~~~
-
-Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=4d60826865c760cc4e5718b6414746a394768110]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shared/shell.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/shared/shell.c b/src/shared/shell.c
-index a8fa876..aa6c16c 100644
---- a/src/shared/shell.c
-+++ b/src/shared/shell.c
-@@ -362,7 +362,7 @@ static struct input *input_new(int fd)
- 
- 	io = io_new(fd);
- 	if (!io)
--		return false;
-+		return NULL;
- 
- 	input = new0(struct input, 1);
- 	input->io = io;
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
deleted file mode 100644
index 996bb048ac..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 7c07bb10f57c80467bc3079d45dac4d3839927d0 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 13:03:55 +0000
-Subject: [PATCH 3/3] shared/gatt-helpers: fix -std=c23 build failure
-
-gcc-15 switched to -std=c23 by default:
-
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-As a result `bluez` fails the build as:
-
-    src/shared/gatt-helpers.c:1136:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
-     1136 |                 return false;
-          |                        ^~~~~
-    src/shared/gatt-helpers.c:1250:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
-     1250 |                 return false;
-          |                        ^~~~~
-    src/shared/gatt-helpers.c:1478:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
-     1478 |                 return false;
-          |                        ^~~~~
-
-Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=6f3111eb680df9c13502aacd65554846a9e13a3f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shared/gatt-helpers.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/shared/gatt-helpers.c b/src/shared/gatt-helpers.c
-index 50fcb26..f1fa630 100644
---- a/src/shared/gatt-helpers.c
-+++ b/src/shared/gatt-helpers.c
-@@ -1133,7 +1133,7 @@ struct bt_gatt_request *bt_gatt_discover_included_services(struct bt_att *att,
- 	uint8_t pdu[6];
- 
- 	if (!att)
--		return false;
-+		return NULL;
- 
- 	op = new0(struct bt_gatt_request, 1);
- 	op->att = att;
-@@ -1247,7 +1247,7 @@ struct bt_gatt_request *bt_gatt_discover_characteristics(struct bt_att *att,
- 	uint8_t pdu[6];
- 
- 	if (!att)
--		return false;
-+		return NULL;
- 
- 	op = new0(struct bt_gatt_request, 1);
- 	op->att = att;
-@@ -1475,7 +1475,7 @@ struct bt_gatt_request *bt_gatt_discover_descriptors(struct bt_att *att,
- 	uint8_t pdu[4];
- 
- 	if (!att)
--		return false;
-+		return NULL;
- 
- 	op = new0(struct bt_gatt_request, 1);
- 	op->att = att;
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.79.bb b/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
similarity index 93%
rename from meta/recipes-connectivity/bluez5/bluez5_5.79.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.80.bb
index 30ea6d317b..6e5b621971 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a"
+SRC_URI[sha256sum] = "a4d0bca3299691f06d5bd9773b854638204a51a5026c42b0ad7f1c6cf16b459a"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
@@ -41,7 +41,6 @@ NOINST_TOOLS_BT ?= " \
     tools/avinfo \
     tools/avtest \
     tools/scotest \
-    tools/amptest \
     tools/hwdb \
     tools/hcieventmask \
     tools/hcisecfilter \
-- 
2.43.0


