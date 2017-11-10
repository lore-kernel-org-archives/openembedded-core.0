Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5BF784C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:13 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2017 04:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; d="scan'208";a="174307208"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2017 04:00:14 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id A52495802D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:13 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:22 +0200
Message-Id: <1510315228-24186-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/7] ofono: upgrade to 1.21
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:14 -0000

1.20 -> 1.21

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_1.20.bb | 8 --------
 meta/recipes-connectivity/ofono/ofono_1.21.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.20.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.21.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.20.bb b/meta/recipes-connectivity/ofono/ofono_1.20.bb
deleted file mode 100644
index 18f983e..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.20.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-"
-SRC_URI[md5sum] = "fad0630fce6a9aecdb7db37bc1f1db7d"
-SRC_URI[sha256sum] = "5d7ba8f481a7715d013a79f8d6477eb89d8aaae399395d5d008a1317c34a31d5"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.21.bb b/meta/recipes-connectivity/ofono/ofono_1.21.bb
new file mode 100644
index 0000000..1f0e31d
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.21.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+"
+SRC_URI[md5sum] = "bc2b818f6fe5725d0dd8591aff6640d7"
+SRC_URI[sha256sum] = "a6b021cda0b444b772897cd637d5f455857fb5819b62c279a8302b44f9c7f2c3"
-- 
2.4.0


