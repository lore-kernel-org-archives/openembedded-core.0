Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 743FA73231
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 08:42:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 04 Aug 2015 01:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,607,1432623600"; d="scan'208";a="618895053"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 04 Aug 2015 01:42:43 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 1BAB46A4083;
	Tue,  4 Aug 2015 01:41:56 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 11:42:53 +0300
Message-Id: <1438677773-22693-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/ptest: Fixed glib ptest output.
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
X-List-Received-Date: Tue, 04 Aug 2015 08:42:45 -0000

It was creating output with FAILED instead of FAIL and it
was not compliant with our log parser.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 130ae09..98148b8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,3 +1,3 @@
 #! /bin/sh
 
-gnome-desktop-testing-runner glib
+gnome-desktop-testing-runner glib | sed -e "s/FAILED:/FAIL:/"
-- 
2.1.4


