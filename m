Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 18CED7838D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 11:05:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jan 2018 03:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,411,1511856000"; d="scan'208";a="26245284"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2018 03:05:29 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 45011580385
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 03:05:29 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 13:07:19 +0200
Message-Id: <1516878439-20757-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [morty][PATCH] pax-utils: update SRC_URI
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
X-List-Received-Date: Thu, 25 Jan 2018 11:05:30 -0000

The gentoo.osuosl.org mirror doesn't store all versions of pax-utils, so
use the maintainers own mirror which stores them all.

Fixes [YOCTO #11559]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
index 5cc5463..d450a04 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.6.bb
@@ -7,8 +7,7 @@ HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
-"
+SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "96f56a5a10ed50f2448c5ccebd27764f"
 SRC_URI[sha256sum] = "f5436c517bea40f7035ec29a6f34034c739b943f2e3a080d76df5dfd7fd41b12"
-- 
2.4.0


