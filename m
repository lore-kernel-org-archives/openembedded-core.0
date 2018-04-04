Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 720FC7488E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599857"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:19 +0300
Message-Id: <20180404111321.10824-20-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/22] procps: update to 3.3.13
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../procps/0001-Fix-out-of-tree-builds.patch       | 24 ++++++++++++++++++++++
 .../procps/{procps_3.3.12.bb => procps_3.3.13.bb}  |  7 ++++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
 rename meta/recipes-extended/procps/{procps_3.3.12.bb => procps_3.3.13.bb} (92%)

diff --git a/meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch b/meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
new file mode 100644
index 00000000000..e548194362c
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
@@ -0,0 +1,24 @@
+From 0825db94fc91fa2150c0e649e92cc8dcc44f4b38 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 4 Apr 2018 14:09:45 +0300
+Subject: [PATCH] Fix out of tree builds
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ include/nls.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/nls.h b/include/nls.h
+index 1166b7b..f5abe05 100644
+--- a/include/nls.h
++++ b/include/nls.h
+@@ -6,7 +6,7 @@
+ #define PROCPS_NG_NLS_H
+ 
+ /* programs issuing textdomain() need PACKAGE string */
+-#include "../config.h"
++#include "config.h"
+ 
+ /* programs issuing bindtextdomain() also need LOCALEDIR string */
+ #ifndef LOCALEDIR
diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.13.bb
similarity index 92%
rename from meta/recipes-extended/procps/procps_3.3.12.bb
rename to meta/recipes-extended/procps/procps_3.3.13.bb
index 99e43c5349e..ae4a7226fc2 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.13.bb
@@ -14,10 +14,11 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
-          "
+           file://0001-Fix-out-of-tree-builds.patch \
+           "
 
-SRC_URI[md5sum] = "957e42e8b193490b2111252e4a2b443c"
-SRC_URI[sha256sum] = "6ed65ab86318f37904e8f9014415a098bec5bc53653e5d9ab404f95ca5e1a7d4"
+SRC_URI[md5sum] = "ad20fe97b3f45797dd43e2d3e046ff32"
+SRC_URI[sha256sum] = "52b05b2bd5b05f46f24766a10474337ebadd828df9915e2b178df291cf88f7d3"
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-- 
2.16.1


