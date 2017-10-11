Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD117823A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945905"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:36 +0300
Message-Id: <3295fad057405f2787208ff8de2be59f28fc1982.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 44/50] clutter-gtk-1.0: update to 1.8.4
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb | 6 ------
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb
deleted file mode 100644
index 78050df7daf..00000000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI[archive.md5sum] = "6698207ee6e3d5a1c0ffc0a23444e12f"
-SRC_URI[archive.sha256sum] = "da27d486325490ad3f65d2abf9413aeb8b4a8f7b559e4b2f73567a5344a26b94"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
new file mode 100644
index 00000000000..f0300c7164c
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "b363ac9878e2337be887b8ee9e1da00e"
+SRC_URI[archive.sha256sum] = "521493ec038973c77edcb8bc5eac23eed41645117894aaee7300b2487cb42b06"
-- 
2.14.1


