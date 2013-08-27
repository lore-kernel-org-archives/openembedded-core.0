Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7970E6BB99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:00:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2013 08:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="287368525"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 08:00:12 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 17:59:36 +0300
Message-Id: <ea4bf0233df1bcbb48edc01f80281d5476b289f1.1377613447.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
Subject: [PATCH 2/5] libnotify: add version 0.6.0 from meta-oe
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
X-List-Received-Date: Tue, 27 Aug 2013 15:00:12 -0000

Libnotify is a library that can be used to send
desktop notifications to a daemon. It's required
by the Midori web-browser.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
new file mode 100644
index 0000000..0a590e3
--- /dev/null
+++ b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Send desktop notifications to a notification daemon"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+PR = "r1"
+
+DEPENDS = "dbus gtk+"
+
+inherit gnome
+SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
+SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
+
+do_configure_prepend() {
+    sed -i /GTK3/d configure.ac
+    sed -i -e /test-gtk3/d -e 's/test-xy-stress \\/test-xy-stress/' tests/Makefile.am
+}
-- 
1.7.9.5


