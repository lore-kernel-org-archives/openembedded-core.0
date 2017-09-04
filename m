Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF0A7782F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 08:41:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Sep 2017 01:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,473,1498546800"; d="scan'208";a="307686270"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2017 01:41:38 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C3349580A35;
	Mon,  4 Sep 2017 01:41:37 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 11:39:24 +0300
Message-Id: <1504514364-25340-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa-gl: Fix build after recent mesa PACKAGECONFIG changes
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
X-List-Received-Date: Mon, 04 Sep 2017 08:41:37 -0000

48d39cf43b added "opengl" PACKAGECONFIG option to mesa: before that
the configuration was always enabled. "opengl" should have been added
to mesa-gl default PACKAGECONFIG but wasn't: do it now.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
index b9e3b80..73267eb 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
@@ -6,4 +6,4 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
-PACKAGECONFIG ??= "dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.1.4


