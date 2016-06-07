Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7C5E7713E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174383"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:03 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:23 +0300
Message-Id: <e9d1cbb821af38e87c9013b5c584145a0a65e792.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/37] sato-screenshot: Upgrade to 0.2
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:31 -0000

New version supports Gtk+3.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{sato-screenshot_git.bb => sato-screenshot_0.2.bb}             | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/sato-screenshot/{sato-screenshot_git.bb => sato-screenshot_0.2.bb} (86%)

diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
similarity index 86%
rename from meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
rename to meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
index 1b2b65d..92f0ee1 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.2.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://main.c;endline=9;md5=023e14d6404d0a961eb97cbd011fc141 \
                     file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
 
-DEPENDS = "matchbox-panel-2"
-SRCREV = "3a9688e8a01b63a78f402b4e7c0b8b005fcdfa29"
-PV = "0.1+git${SRCPV}"
-PR = "r2"
+DEPENDS = "matchbox-panel-2 gtk+3"
 
+# SRCREV tagged 0.2
+SRCREV = "5db2672fb857b2c80b949d8fce92e0f0029cc947"
 SRC_URI = "git://git.yoctoproject.org/screenshot"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


