Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B09386065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:01:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4U91hPX006585
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 02:01:44 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 02:01:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 17:01:35 +0800
Message-ID: <79c51e1cc36b14f70b271c7413701d4807841690.1369820334.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369820334.git.hongxu.jia@windriver.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] exfat-utils: add version 1.0.1
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
X-List-Received-Date: Thu, 30 May 2013 09:01:42 -0000
Content-Type: text/plain

The utilities to create, check, label and dump exFAT filesystem

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/exfat/exfat-utils_1.0.1.bb |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/exfat/exfat-utils_1.0.1.bb

diff --git a/meta/recipes-support/exfat/exfat-utils_1.0.1.bb b/meta/recipes-support/exfat/exfat-utils_1.0.1.bb
new file mode 100644
index 0000000..a5a314f
--- /dev/null
+++ b/meta/recipes-support/exfat/exfat-utils_1.0.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "utilities to create, check, label and dump exFAT filesystem"
+DESCRIPTION = "Utilities to manage extended file allocation table filesystem. \
+This package provides tools to create, check and label the filesystem. It \
+contains \
+ - dumpexfat to dump properties of the filesystem \
+ - exfatfsck / fsck.exfat to report errors found on a exFAT filesystem \
+ - exfatlabel to label a exFAT filesystem \
+ - mkexfatfs / mkfs.exfat to create a exFAT filesystem. \
+"
+HOMEPAGE = "http://code.google.com/p/exfat/"
+SECTION = "universe/otherosfs"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI = "${DEBIAN_MIRROR}/main/e/exfat-utils/exfat-utils_${PV}.orig.tar.gz \
+"
+DEPENDS = "virtual/libc"
+
+inherit scons
+
+SRC_URI[md5sum] = "e592130829d0bf61fa5e3cd1c759d329"
+SRC_URI[sha256sum] = "eeacedca1878065dc3886674ae39cd51149c37bd7d6d7e9325c971a1d1acdab3"
+
+EXTRA_OESCONS = " \
+    DESTDIR=${D}/${base_sbindir} \
+"
+
+do_install_prepend() {
+    install -d ${D}/${base_sbindir}
+}
-- 
1.7.10.4


