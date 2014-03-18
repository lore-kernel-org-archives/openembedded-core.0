Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79D926F8DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 11:56:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IBuOFO003931
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 06:56:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IBuO1L005305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 06:56:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Mar 2014 06:56:23 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s2IBuGST032759;	Tue, 18 Mar 2014 06:56:22 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 06:56:13 -0500
Message-ID: <1395143773-26375-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mmc-utils: Add user space mmc utilities for eMMC
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
X-List-Received-Date: Tue, 18 Mar 2014 11:56:23 -0000
Content-Type: text/plain

* The mmc-utils are useful userspace utilities for configuring and
  working with MMC devices.  These are particularly useful when
  working with eMMC devices to do the initial programming of the
  device.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/mmc/mmc-utils_git.bb

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
new file mode 100644
index 0000000..abde4b1
--- /dev/null
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Userspace tools for MMC/SD devices"
+HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
+
+BRANCH ?= "master"
+SRCREV = "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
+
+PV = "0.1"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH}"
+
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 mmc ${D}${bindir}
+}
-- 
1.7.9.5


