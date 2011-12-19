Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RchEN-0007OV-8Q
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:42:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2011 09:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89154629"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 09:35:27 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 09:23:27 -0800
Message-Id: <2733471fa8e587a3fc4fbcb1500109e3bbbab796.1324315257.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324315257.git.elizabeth.flanagan@intel.com>
References: <cover.1324315257.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] less: Correcting generic license
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 17:42:33 -0000

I've asked and received permission from Mark Nudelman, the author
of less, to utilize a generic BSD 2 clause license for less, instead
of creating a common "less" license file.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-extended/less/less_444.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_444.bb
index f198692..f413ba0 100644
--- a/meta/recipes-extended/less/less_444.bb
+++ b/meta/recipes-extended/less/less_444.bb
@@ -7,10 +7,10 @@ SECTION = "console/utils"
 
 # (GPLv2+ (<< 418), GPLv3+ (>= 418)) | less
 # less is a 2-clause BSD-like permissive license
-# Reading LICENSE and COPYING indicate that GPL-3+ is suffient.
-# openSuse .spec and Debian seem to agree here. setting to GPL-3+
+# Mark Nudelman (author of less) has given permission to utilize a generic 
+# 2-clause BSD
 
-LICENSE = "GPLv3+"
+LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
 DEPENDS = "ncurses"
-- 
1.7.1



