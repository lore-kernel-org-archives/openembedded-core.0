Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7B159731B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739832"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:40 +0200
Message-Id: <e0075724223bd31843ba1468565983cdd84b7066.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/17] ifupdown: update to 0.8.2
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:22 -0000

Switch upstream to git, as old versions can disappear from archive.ubuntu.com

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ifupdown/{ifupdown_0.7.48.1.bb => ifupdown_0.8.2.bb}         | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.7.48.1.bb => ifupdown_0.8.2.bb} (81%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
similarity index 81%
rename from meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
index 24eb87b..732b295 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
@@ -6,16 +6,16 @@ the file /etc/network/interfaces."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/i/ifupdown/ifupdown_0.7.48.1ubuntu5.tar.gz \
+SRC_URI = "git://anonscm.debian.org/git/collab-maint/ifupdown.git;protocol=https \
 	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
 	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
 	   file://99_network \
 	  "
+SRCREV = "05ea2fd4f49bb1201aeef2a42efbcff8f336112f"
 
 EXTRA_OEMAKE = ""
 
-# needed so we don't get default S="${WORKDIR}/ifupdown-${PV}"
-S = "${WORKDIR}/ifupdown-${PV}ubuntu5"
+S = "${WORKDIR}/git"
 
 
 inherit update-rc.d update-alternatives
@@ -49,6 +49,3 @@ ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
 
 INITSCRIPT_NAME = "ifup"
 INITSCRIPT_PARAMS = "start 39 S . stop 39 0 6 1 ."
-
-SRC_URI[md5sum] = "85ba375f3c6f26d34efb2a8575e77fc8"
-SRC_URI[sha256sum] = "08dce14692c07b72b583b86c4d3ace0d9dac1928925144cc3ddde15b694ebbdf"
-- 
2.6.2


