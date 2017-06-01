Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7C66FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 14:05:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 07:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="1155381989"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2017 07:05:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 139C758024C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:05:34 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 17:05:42 +0300
Message-Id: <1496325944-20339-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [krogoth][PATCH 1/3] pax-utils: update SRC_URI
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
X-List-Received-Date: Thu, 01 Jun 2017 14:05:37 -0000

Fixes this warning:

WARNING: pax-utils-1.1.5-r0 do_fetch: Failed to fetch URL
http://gentoo.osuosl.org/distfiles/pax-utils-1.1.5.tar.xz,
attempting MIRRORS if available

[YOCTO #11559]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb
index a887c03..b3d9662 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
+SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz \
 "
 
 SRC_URI[md5sum] = "bc3614322eaf88f167a608ae85d6b207"
-- 
2.4.0


