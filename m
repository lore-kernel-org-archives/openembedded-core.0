Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DB823731AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:52:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 04:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1002968786"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2016 04:52:38 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 14:52:25 +0300
Message-Id: <d467cc7b85888e033b061790065efd39f93f9467.1466595928.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
References: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1466595928.git.jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/10] puzzles: Keep building even with deprecation warnings
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
X-List-Received-Date: Wed, 22 Jun 2016 11:52:38 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index a9daacd..882ee44 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -23,6 +23,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep distro_features_check pkgconfig
 
+CFLAGS_append = " -Wno-deprecated-declarations"
+
 PACKAGECONFIG ??= "gtk3"
 PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
 PACKAGECONFIG[gtk3] = "--with-gtk=3,,gtk+3,"
-- 
2.1.4


