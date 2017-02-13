Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 46C66731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:00:24 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 65so12706725otq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ifg/a1M7VSHIhX7+pgAUIR/7EzZ50RsAX56ImEHn014=;
	b=aDX+qrIo3Oy3T4/BUvw6npIx/mj7we/aVQ5Q+FiAeehT8unLx55nYhypr8GMBfisBC
	ZLsNMLk8ngbpQLFt1t9hbIEuPxcMSPPcmGUjhbmdqSIkqSo+mQxWvXQumIMKS1z2eBoK
	Dd9Ebsh+RowSRo5YmhOvZRK66X6PMjoKhHPnsfwdWNcXE+e5ZN7sxTMA13BN7Tw8Ur2E
	GJQmvJq+rDa7GCRGozYZEs60fAk7pBypxO/9N9//EbniEzU8wqTzcRLblqDWBxkpw0HY
	hh0mVryx2DoB7hck4qzRMkGISbTer0tMYA1eXEewSLJNsQG7ksg8/k0JL1BxAidwsxhz
	15hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ifg/a1M7VSHIhX7+pgAUIR/7EzZ50RsAX56ImEHn014=;
	b=tyEgnCU0kYBihi5W9MqPLExSmTdiflv8T0U0syYXUnKfgMSHdycQhxYzQACsrdi5/s
	1smwGEz1ITx6NKd4adrxzXX3+irCuSSljzwdYJlBFv7eJ6vTPD2QbY6CvtYNvJVAbTWP
	G8MOCMuthyIvv/X6sLuqnXuAPcyLnpv7Ky/UCoBH5n0lJVupWEZO2e5capj/hDfn483E
	ns9ReT/sgr7Dq0INfrSsyK9DKIsY4suSCSC4G4FZ2V3yM8yI2QiNWCMRSDoE+rVVDoEN
	4ov+CH2R4mGBwbuNwt/zzvDprlX7oWBEjJvz5QLZocEdQQVfEpRDxYNDhGo6pE6P/OZy
	oTFQ==
X-Gm-Message-State: AMke39nZrFDVu3wf+Eljgl5vMatp3bX46QzVq+9xNVi61kkama97/rGpQmuXNPBTbFpUYw==
X-Received: by 10.99.55.26 with SMTP id e26mr28271835pga.15.1487008824925;
	Mon, 13 Feb 2017 10:00:24 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s21sm15995127pgg.65.2017.02.13.10.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 10:00:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 10:00:11 -0800
Message-Id: <20170213180012.14077-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170213180012.14077-1-raj.khem@gmail.com>
References: <20170213180012.14077-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] gdb: Upgrade to 7.12.1
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
X-List-Received-Date: Mon, 13 Feb 2017 18:00:25 -0000

Drop already applied patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdb/{gdb-7.12.inc => gdb-7.12.1.inc}           |  5 +--
 ...nadian_7.12.bb => gdb-cross-canadian_7.12.1.bb} |  0
 .../gdb/{gdb-cross_7.12.bb => gdb-cross_7.12.1.bb} |  0
 .../cb93dc7f262978bafe36397a41a56e409a302042.patch | 43 ----------------------
 .../gdb/{gdb_7.12.bb => gdb_7.12.1.bb}             |  0
 5 files changed, 2 insertions(+), 46 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.12.inc => gdb-7.12.1.inc} (83%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.12.bb => gdb-cross-canadian_7.12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.12.bb => gdb-cross_7.12.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
 rename meta/recipes-devtools/gdb/{gdb_7.12.bb => gdb_7.12.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.12.inc b/meta/recipes-devtools/gdb/gdb-7.12.1.inc
similarity index 83%
rename from meta/recipes-devtools/gdb/gdb-7.12.inc
rename to meta/recipes-devtools/gdb/gdb-7.12.1.inc
index 7eea65f4fa..b15a2b5832 100644
--- a/meta/recipes-devtools/gdb/gdb-7.12.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.12.1.inc
@@ -15,8 +15,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
-	   file://cb93dc7f262978bafe36397a41a56e409a302042.patch \
 "
-SRC_URI[md5sum] = "a0a3a00f7499b0c5278ba8676745d180"
-SRC_URI[sha256sum] = "834ff3c5948b30718343ea57b11cbc3235d7995c6a4f3a5cecec8c8114164f94"
+SRC_URI[md5sum] = "193453347ddced7acb6b1cd2ee8f2e4b"
+SRC_URI[sha256sum] = "4607680b973d3ec92c30ad029f1b7dbde3876869e6b3a117d8a7e90081113186"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.12.bb b/meta/recipes-devtools/gdb/gdb-cross_7.12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.12.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.12.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch b/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
deleted file mode 100644
index 3a42f0a770..0000000000
--- a/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e409a302042.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cb93dc7f262978bafe36397a41a56e409a302042 Mon Sep 17 00:00:00 2001
-From: Yao Qi <yao.qi@linaro.org>
-Date: Mon, 24 Oct 2016 10:59:11 +0100
-Subject: [PATCH] [GDBserver] Fix conversion warning
-
-I got the following warning if I build GDBserver for aarch64_be-linux-gnu,
-
-git/gdb/gdbserver/linux-aarch64-low.c:1539:39: error: invalid conversion from 'void*' to 'uint32_t* {aka unsigned int*}' [-fpermissive]
-   uint32_t *le_buf = xmalloc (byte_len);
-                                       ^
-The patch is to fix the warning.
-
-gdb/gdbserver:
-
-2016-10-24  Yao Qi  <yao.qi@linaro.org>
-
-	PR server/20733
-	* linux-aarch64-low.c (append_insns): Cast the return value to
-	'uint32_t *'.
-
-Upstream-status: Backport
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-
----
- gdb/gdbserver/linux-aarch64-low.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/gdbserver/linux-aarch64-low.c b/gdb/gdbserver/linux-aarch64-low.c
-index e54a8ba..ae80cdd 100644
---- a/gdb/gdbserver/linux-aarch64-low.c
-+++ b/gdb/gdbserver/linux-aarch64-low.c
-@@ -1536,7 +1536,7 @@ append_insns (CORE_ADDR *to, size_t len, const uint32_t *buf)
- {
-   size_t byte_len = len * sizeof (uint32_t);
- #if (__BYTE_ORDER == __BIG_ENDIAN)
--  uint32_t *le_buf = xmalloc (byte_len);
-+  uint32_t *le_buf = (uint32_t *) xmalloc (byte_len);
-   size_t i;
- 
-   for (i = 0; i < len; i++)
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/gdb/gdb_7.12.bb b/meta/recipes-devtools/gdb/gdb_7.12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.12.bb
rename to meta/recipes-devtools/gdb/gdb_7.12.1.bb
-- 
2.11.1


