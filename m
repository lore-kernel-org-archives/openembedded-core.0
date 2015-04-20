Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A08BD73D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89Oj8029738
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:24 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:17 -0700
Message-ID: <7cad7870362912d341c5b877b174843ca9643e8f.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] directfb: 1.7.6 -> 1.7.7
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/directfb/directfb_1.7.6.bb |    8 --------
 meta/recipes-graphics/directfb/directfb_1.7.7.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.7.6.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.7.7.bb

diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
deleted file mode 100644
index 1b49112..0000000
--- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require directfb.inc
-
-RV = "1.7-6"
-
-LEAD_SONAME = "libdirectfb-1.7.so.0"
-
-SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
-SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
diff --git a/meta/recipes-graphics/directfb/directfb_1.7.7.bb b/meta/recipes-graphics/directfb/directfb_1.7.7.bb
new file mode 100644
index 0000000..c6c070e
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb_1.7.7.bb
@@ -0,0 +1,8 @@
+require directfb.inc
+
+RV = "1.7-7"
+
+LEAD_SONAME = "libdirectfb-1.7.so.0"
+
+SRC_URI[md5sum] = "152cf1863b1a3a28aa1370e9053440bf"
+SRC_URI[sha256sum] = "b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3"
-- 
1.7.9.5


