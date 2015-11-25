Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CD0DB60723
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:02:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2015 05:02:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,342,1444719600"; d="scan'208";a="606912493"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2015 05:02:14 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Wed, 25 Nov 2015 15:05:39 +0200
Message-Id: <0a0f006a3e3c2e5891e2888453eef8c1ad6e2341.1448455166.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
References: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448455166.git.jussi.kukkonen@intel.com>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] gudev: Add from meta-oe
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
X-List-Received-Date: Wed, 25 Nov 2015 13:02:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libgudev was split from systemd and is used by recipes in oe-core.
udev already provides libgudev as well.

The recipe is from meta-oe (Andreas Müller).

Fixes [YOCTO #8686]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/libgudev/libgudev_230.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-gnome/libgudev/libgudev_230.bb

diff --git a/meta/recipes-gnome/libgudev/libgudev_230.bb b/meta/recipes-gnome/libgudev/libgudev_230.bb
new file mode 100644
index 0000000..ea8e82c
--- /dev/null
+++ b/meta/recipes-gnome/libgudev/libgudev_230.bb
@@ -0,0 +1,15 @@
+SUMMARY = "GObject wrapper for libudev"
+
+SRC_URI[archive.md5sum] = "e4dee8f3f349e9372213d33887819a4d"
+SRC_URI[archive.sha256sum] = "a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd620025b86347c18"
+
+DEPENDS = "glib-2.0 udev"
+
+RCONFLICTS_${PN} = "systemd (<= 220)"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+inherit gnomebase distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.1.4


