Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF2A36156E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 02:34:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r892Y6Oi029325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Sep 2013 19:34:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 8 Sep 2013 19:34:06 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 10:34:41 +0800
Message-ID: <3db763ead1137e1be11252a64326f1321eea2c1c.1378694025.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378694025.git.Qi.Chen@windriver.com>
References: <cover.1378694025.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysvinit: remove unused files
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
X-List-Received-Date: Mon, 09 Sep 2013 02:34:04 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The 'need' and 'provide' files are there for simpleinit compatability,
according to the comments in these two files.

However, we don't use simpleinit and there's even no simpleinit recipe
in OE. Besides, these two files are not installed.

This patch removes these two unused files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/need       |    6 ------
 meta/recipes-core/sysvinit/sysvinit/provide    |    6 ------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    2 --
 3 files changed, 14 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/need
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/provide

diff --git a/meta/recipes-core/sysvinit/sysvinit/need b/meta/recipes-core/sysvinit/sysvinit/need
deleted file mode 100644
index 4d84bbe..0000000
--- a/meta/recipes-core/sysvinit/sysvinit/need
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# need binary that doesnt do anything, supplied for simpleinit
-# vs sysvinit compatibility for the supplied startup scripts
-
-exit 0
diff --git a/meta/recipes-core/sysvinit/sysvinit/provide b/meta/recipes-core/sysvinit/sysvinit/provide
deleted file mode 100644
index c90cf35..0000000
--- a/meta/recipes-core/sysvinit/sysvinit/provide
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# provide binary that doesnt do anything, supplied for simpleinit
-# vs sysvinit compatibility for the supplied startup scripts
-
-exit 0
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index ac915b7..97ecc51 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -13,8 +13,6 @@ SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvini
            file://install.patch \
            file://crypt-lib.patch \
            file://pidof-add-m-option.patch \
-           file://need \
-           file://provide \
            file://rcS-default \
            file://rc \
            file://rcS \
-- 
1.7.9.5


