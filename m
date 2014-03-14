Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 410256E717
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 15:12:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2014 08:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,655,1389772800"; d="scan'208";a="492006410"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2014 08:11:29 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Mar 2014 17:11:12 +0200
Message-Id: <1394809872-5525-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] make: add 'inherit pkgconfig'
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
X-List-Received-Date: Fri, 14 Mar 2014 15:12:06 -0000

Bitbaking make-native generates syntax error during
configure: 'PKG_PROG_PKG_CONFIG: command not found'.
Add 'inherit pkgconfig' to solve this issue.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-devtools/make/make.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 2e90eca..4036345 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -7,4 +7,4 @@ SECTION = "devel"
 
 SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
-- 
1.8.3.2


