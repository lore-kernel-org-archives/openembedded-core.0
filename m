Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA1D789EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:56:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5D7uC6g017309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:56:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:56:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:20 +0800
Message-ID: <78d81bad83a0886acd44c9e5c39bc91ca23bbf14.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528870775.git.Qi.Chen@windriver.com>
References: <cover.1528870775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] watchdog: remove the useless watchdog-conf.patch
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
X-List-Received-Date: Wed, 13 Jun 2018 07:56:12 -0000
Content-Type: text/plain

This patch modifies watchdog.conf file. But this file is deliberately
deleted in do_install. The current mechanism in OE is to use another
recipe watchdog-conf to handle watchdog configuration. So the patch
is really useless.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../watchdog/watchdog/watchdog-conf.patch                | 16 ----------------
 meta/recipes-extended/watchdog/watchdog_5.15.bb          |  1 -
 2 files changed, 17 deletions(-)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
deleted file mode 100644
index ec44c80..0000000
--- a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Signed-off-by: Diego Rondini <diego.ml@zoho.com>
-Upstream-Status: Inappropriate
-
-Index: watchdog-5.15/watchdog.conf
-===================================================================
---- watchdog-5.15.orig/watchdog.conf
-+++ watchdog-5.15/watchdog.conf
-@@ -28,7 +28,7 @@
- #retry-timeout		= 60
- #repair-maximum		= 1
- 
--#watchdog-device	= /dev/watchdog
-+watchdog-device	= /dev/watchdog
- 
- # Defaults compiled into the binary
- #temperature-sensor	=
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 24791c4..d3f0353 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -12,7 +12,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
            file://0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch \
            file://watchdog-init.patch \
-           file://watchdog-conf.patch \
            file://wd_keepalive.init \
 "
 
-- 
1.9.1


