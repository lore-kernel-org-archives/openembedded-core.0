Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9A18F74926
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254287"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:48 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:40 +0300
Message-Id: <20180504123244.43049-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/14] procps: update to 3.3.14
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
X-List-Received-Date: Fri, 04 May 2018 12:38:48 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../procps/0001-Fix-out-of-tree-builds.patch       | 24 ++++++++++++++++++++++
 .../procps/{procps_3.3.12.bb => procps_3.3.14.bb}  |  7 ++++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
 rename meta/recipes-extended/procps/{procps_3.3.12.bb => procps_3.3.14.bb} (92%)

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
diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.14.bb
similarity index 92%
rename from meta/recipes-extended/procps/procps_3.3.12.bb
rename to meta/recipes-extended/procps/procps_3.3.14.bb
index ecf215fecf5..1aba5116123 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.14.bb
@@ -14,10 +14,11 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
-          "
+           file://0001-Fix-out-of-tree-builds.patch \
+           "
 
-SRC_URI[md5sum] = "957e42e8b193490b2111252e4a2b443c"
-SRC_URI[sha256sum] = "6ed65ab86318f37904e8f9014415a098bec5bc53653e5d9ab404f95ca5e1a7d4"
+SRC_URI[md5sum] = "fce371ccc1c15a67af9d85e4057e559d"
+SRC_URI[sha256sum] = "5eda0253999b7d786e690edfa73301b3113c7a67058478866e98e9ff6736726c"
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-- 
2.16.1


