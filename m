Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 353687321C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851839"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:38 +0200
Message-Id: <068e8bb9fdcc7caaefeff5595081eba5ee456eee.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/12] ncurses: fix upstream version check
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/ncurses/ncurses_6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses_6.0.bb b/meta/recipes-core/ncurses/ncurses_6.0.bb
index 8587287..e877d67 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0.bb
@@ -9,3 +9,4 @@ SRC_URI += "file://tic-hang.patch \
 SRCREV = "c6b034b4d69f8c9092c2a1b5d5bb718282b2a522"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.6.4


