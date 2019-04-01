Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5587CFAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:02:12 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x31E2CCV008079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2019 16:02:12 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x31E2Bcn011199;
	Mon, 1 Apr 2019 16:02:12 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id DF94A95182D;
	Mon,  1 Apr 2019 16:02:10 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 16:01:53 +0200
Message-Id: <20190401140153.902-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] dropbear: update to 2019.78
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
X-List-Received-Date: Mon, 01 Apr 2019 14:02:13 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/dropbear/dropbear_2019.77.bb | 4 ----
 meta/recipes-core/dropbear/dropbear_2019.78.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2019.77.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2019.78.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2019.77.bb b/meta/recipes-core/dropbear/dropbear_2019.77.bb
deleted file mode 100644
index d2a71ba647..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2019.77.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "5d4f0256c5d13820b0a3eaadb1a0bc1a"
-SRC_URI[sha256sum] = "d91f78ebe633be1d071fd1b7e5535b9693794048b019e9f4bea257e1992b458d"
diff --git a/meta/recipes-core/dropbear/dropbear_2019.78.bb b/meta/recipes-core/dropbear/dropbear_2019.78.bb
new file mode 100644
index 0000000000..d2cd8161bf
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2019.78.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "a972c85ed678ad0fdcb7844e1294fb54"
+SRC_URI[sha256sum] = "525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4"
-- 
2.11.0


