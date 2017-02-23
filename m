Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4B77300E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:47:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 23 Feb 2017 04:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="1101412280"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2017 04:47:24 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 936166A4004;
	Thu, 23 Feb 2017 04:47:23 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 14:47:19 +0200
Message-Id: <dce1aeb27d33257832f5b4045834ffbf069dbf15.1487853010.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487853010.git.jussi.kukkonen@intel.com>
References: <cover.1487853010.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] x264: Upgrade to stable branch head
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
X-List-Received-Date: Thu, 23 Feb 2017 12:47:23 -0000

Small number of bug fixes and x86 optimizations.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 64193dc..69f52c2 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -13,9 +13,9 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            file://Fix-X32-build-by-disabling-asm.patch \
            "
 
-SRCREV = "86b71982e131eaa70125f8d0e725fcade9c4c677"
+SRCREV = "2b741f81e51f92d053d87a49f59ff1026553a0f6"
 
-PV = "r2491+git${SRCPV}"
+PV = "r2731+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


