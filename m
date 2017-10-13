Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEEF60797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 11:14:59 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v9DBF0nE028437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 13:15:00 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v9DBF0iK027459;
	Fri, 13 Oct 2017 13:15:00 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 13:14:41 +0200
Message-Id: <1507893281-22628-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bmap-tools: add missing runtime dependencies
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
X-List-Received-Date: Fri, 13 Oct 2017 11:15:00 -0000

When running bmap on a target device the added dependncies are required.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index 7454f9d..348c9e8 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -14,7 +14,17 @@ SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} = "python-core python-compression python-mmap"
+RDEPENDS_${PN} = "\
+    python-core \
+    python-compression \
+    python-argparse \
+    python-shell \
+    python-fcntl \
+    python-threading \
+    python-xml \
+    python-subprocess \
+    python-mmap \
+    "
 
 inherit python3native
 inherit setuptools3
-- 
2.1.4


