Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D5FB36060F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 09:36:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 01:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,426,1515484800"; d="scan'208";a="32452625"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 05 Mar 2018 01:36:25 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 300D05803CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 01:36:24 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 11:39:31 +0200
Message-Id: <1520242771-43426-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] connman-gtk: add initial version
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
X-List-Received-Date: Mon, 05 Mar 2018 09:36:25 -0000

Add initial version of connman-gtk recipe.

connman-gtk support most of the connman features (eg: setup/configure
DNS and proxy) with minimal dependencies.

To test this application, add the following line in local.conf file
and build image:

NETWORK_MANAGER="connman-gtk"

[YOCTO #8606]
[YOCTO #5874]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/connman/connman-gtk_1.1.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman-gtk_1.1.1.bb

diff --git a/meta/recipes-connectivity/connman/connman-gtk_1.1.1.bb b/meta/recipes-connectivity/connman/connman-gtk_1.1.1.bb
new file mode 100644
index 0000000..88172f8
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gtk_1.1.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "GTK GUI for ConnMan"
+HOMEPAGE = "https://github.com/jgke/connman-gtk"
+SECTION = "libs/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "gtk+3 dbus-glib intltool-native glib-2.0-native"
+RDEPENDS_${PN} = "connman"
+
+SRCREV = "6e997bb771f19c65670ac1099e21ee3e3497f4d8"
+SRC_URI = "git://github.com/jgke/connman-gtk.git \
+          "
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep gsettings pkgconfig distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+FILES_${PN} += "${datadir}/glib-2.0"
-- 
2.4.0


