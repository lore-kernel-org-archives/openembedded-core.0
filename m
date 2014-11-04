Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1413E71FA0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 17:14:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 09:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="631275968"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2014 09:14:35 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:15:00 -0600
Message-Id: <1415121300-16524-9-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
References: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 8/8] glibc-locale: Added LIC_FILES_CHKSUM for avoid warnings in license manifest creation.
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
X-List-Received-Date: Tue, 04 Nov 2014 17:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 85e06da..e9e411d 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -1,5 +1,7 @@
 INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 
 do_fetch[noexec] = "1"
-- 
1.9.1


