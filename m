Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F17677029
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:26:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2015 05:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,247,1444719600"; d="scan'208";a="843801032"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2015 05:26:00 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 15:29:01 +0200
Message-Id: <de92b6d6c8c06e193b566cde62a4d4d19c5fce72.1446729162.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
References: <824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1446729162.git.jussi.kukkonen@intel.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] glib-networking: Upgrade 2.44.0 -> 2.46.1
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
X-List-Received-Date: Thu, 05 Nov 2015 13:26:01 -0000

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


