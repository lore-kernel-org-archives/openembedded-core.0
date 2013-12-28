Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D463A6B708
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010029"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:12 +0000
Message-Id: <29dc43488654db8cb2cf22290338cfcfa34cfd76.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/38] xev: add proper SUMMARY and DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:07 -0000

Add these consistent with other X.Org application recipes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/xorg-app/xev_1.2.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.1.bb b/meta/recipes-graphics/xorg-app/xev_1.2.1.bb
index 298910a..8dcb1ec 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.1.bb
@@ -1,7 +1,13 @@
 require xorg-app-common.inc
+
+SUMMARY = "X Event Viewer"
+DESCRIPTION = "Xev creates a window and then asks the X server to send it events \
+whenever anything happens to the window (such as it being moved, resized, \
+typed in, clicked in, etc.). You can also attach it to an existing window."
+
 LIC_FILES_CHKSUM = "file://xev.c;beginline=1;endline=33;md5=577c99421f1803b891d2c79097ae4682"
-DESCRIPTION = "X Event Viewer"
 LICENSE = "MIT"
+
 PE = "1"
 
 DEPENDS += "libxrandr xproto"
-- 
1.8.1.2


