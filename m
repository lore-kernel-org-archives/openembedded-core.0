Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 07A8C72F1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:15:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 06:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,214,1484035200"; d="scan'208";a="1135500572"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2017 06:15:10 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DC07C6A4004;
	Mon, 27 Feb 2017 06:15:08 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 16:14:12 +0200
Message-Id: <1488204852-16793-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wireless-tools: Update URLs
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
X-List-Received-Date: Mon, 27 Feb 2017 14:15:11 -0000

wireless-tools is now hosted on
https://hewlettpackard.github.io/wireless-tools/Tools.html

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
index c3b8f66..0a34207 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for the Linux Standard Wireless Extension Subsystem"
-HOMEPAGE = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
+HOMEPAGE = "https://hewlettpackard.github.io/wireless-tools/Tools.html"
 LICENSE = "GPLv2 & (LGPLv2.1 | MPL-1.1 | BSD)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://iwconfig.c;beginline=1;endline=12;md5=cf710eb1795c376eb10ea4ff04649caf \
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "base"
 PE = "1"
 
-SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.${PV}.tar.gz \
+SRC_URI = "https://hewlettpackard.github.io/wireless-tools/wireless_tools.${PV}.tar.gz \
            file://remove.ldconfig.call.patch \
            file://man.patch \
            file://avoid_strip.patch \
@@ -17,7 +17,7 @@ SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.$
 SRC_URI[md5sum] = "ca91ba7c7eff9bfff6926b1a34a4697d"
 SRC_URI[sha256sum] = "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
 
-UPSTREAM_CHECK_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
+UPSTREAM_CHECK_URI = "https://hewlettpackard.github.io/wireless-tools/Tools.html"
 UPSTREAM_CHECK_REGEX = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
 
 S = "${WORKDIR}/wireless_tools.30"
-- 
2.1.4


