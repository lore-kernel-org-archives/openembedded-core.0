Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76907609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 00:58:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jul 2014 17:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,585,1400050800"; d="scan'208";a="563887075"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.100])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2014 17:58:31 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 17:56:51 -0700
Message-Id: <1404262611-19981-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Matt Fleming <matt.fleming@intel.com>,
	"Glenn P. Williamson" <glenn.p.williamson@intel.com>
Subject: [PATCH] kexec-tools: upgrade to 2.0.7
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
X-List-Received-Date: Wed, 02 Jul 2014 00:58:38 -0000

Kexec-tools v2.0.7 is out, upgrade accordingly.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
CC: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb | 13 -------------
 meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
deleted file mode 100644
index 5321dd4..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require kexec-tools.inc
-export LDFLAGS = "-L${STAGING_LIBDIR}"
-EXTRA_OECONF = " --with-zlib=yes"
-
-SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
-
-SRC_URI[md5sum] = "c39ea40a7598e49b6dc961ee7de38f57"
-SRC_URI[sha256sum] = "a9c6cd9adc8c1c37b3272782f581cb8b4b4070d0e3e921a558a9083f68dcf29a"
-
-PACKAGES =+ "kexec kdump"
-
-FILES_kexec = "${sbindir}/kexec"
-FILES_kdump = "${sbindir}/kdump"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
new file mode 100644
index 0000000..a5c1ced
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
@@ -0,0 +1,13 @@
+require kexec-tools.inc
+export LDFLAGS = "-L${STAGING_LIBDIR}"
+EXTRA_OECONF = " --with-zlib=yes"
+
+SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
+
+SRC_URI[md5sum] = "2309ba43981cb6d39d07ac3a9aac30ab"
+SRC_URI[sha256sum] = "dde5c38be39882c6c91f0129647349c4e1943b077d3020af1970b481ee954eb0"
+
+PACKAGES =+ "kexec kdump"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump"
-- 
1.9.1


