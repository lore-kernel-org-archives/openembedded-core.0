Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3A87277317
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 14:06:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2015 06:05:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,287,1444719600"; d="scan'208";a="819151701"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2015 06:05:51 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 16:09:02 +0200
Message-Id: <1447423742-29488-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH] packagegroup-core-directfb: Don't depend on pango-modules
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
X-List-Received-Date: Fri, 13 Nov 2015 14:06:49 -0000

Recent pango upgrade means there is no pango-modules.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---


This is supposed to be a reply to my earlier message
"[OE-core][PATCH 00/19] X11 & GTK+ version upgrades".

I'm pushing this on top of the existing branch "jku/x11-gtk-upgrades".



 meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 53dc0ae..a657a1a 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -11,7 +11,6 @@ RDEPENDS_${PN} = " \
 		directfb \
 		directfb-examples \
 		pango \
-		pango-modules \
 		fontconfig \
 		${TOUCH} \
 "
-- 
2.1.4


