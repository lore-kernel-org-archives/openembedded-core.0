Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0E761802
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:01:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4U91iWW003607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 02:01:44 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 02:01:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 17:01:34 +0800
Message-ID: <662548838a4367790781ef3dae982343550727eb.1369820334.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369820334.git.hongxu.jia@windriver.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] fuse-exfat: add version 1.0.1
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
X-List-Received-Date: Thu, 30 May 2013 09:01:41 -0000
Content-Type: text/plain

The fuse-exfat is read and write exFAT driver for FUSE

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/exfat/fuse-exfat_1.0.1.bb |   26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/exfat/fuse-exfat_1.0.1.bb

diff --git a/meta/recipes-support/exfat/fuse-exfat_1.0.1.bb b/meta/recipes-support/exfat/fuse-exfat_1.0.1.bb
new file mode 100644
index 0000000..d29dc0a
--- /dev/null
+++ b/meta/recipes-support/exfat/fuse-exfat_1.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "read and write exFAT driver for FUSE"
+DESCRIPTION = "fuse-exfat is a read and write driver implementing the \
+extended file allocation table as a filesystem in userspace. A mounthelper \
+is provided unter the name mount.exfat-fuse. \
+"
+HOMEPAGE = "http://code.google.com/p/exfat/"
+SECTION = "universe/otherosfs"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
+"
+DEPENDS = "fuse virtual/libc"
+RDEPENDS_${PN} += "util-linux-mount"
+
+inherit scons
+
+SRC_URI[md5sum] = "7988a5111841593231f20af22153362d"
+SRC_URI[sha256sum] = "12ac1ba1b7d4343bef64e7898176705a41cfe3b5a7a179e28549d242e2854758"
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


