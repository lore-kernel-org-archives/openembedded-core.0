Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BC72E77140
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861495"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:41:02 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:44:01 +0200
Message-Id: <2f7dd50dee5ac2e74b8a7613f87ad05629d1dc9c.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
References: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 4/8] glib-networking: Upgrade 2.44.0 -> 2.46.1
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
index 4f91b76..b56e757 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0 intltool-native"
 
-SRC_URI[archive.md5sum] = "6989b20cf3b26dd5ae272e04a9acb0b3"
-SRC_URI[archive.sha256sum] = "8f8a340d3ba99bfdef38b653da929652ea6640e27969d29f7ac51fbbe11a4346"
+SRC_URI[archive.md5sum] = "c000e0b579f5d8fd48efebc7ac4d95dc"
+SRC_URI[archive.sha256sum] = "d5034214217f705891b6c9e719cc2c583c870bfcfdc454ebbb5e5e8940ac90b1"
 
 PACKAGECONFIG ??= "ca-certificates gnutls"
 
-- 
2.1.4


