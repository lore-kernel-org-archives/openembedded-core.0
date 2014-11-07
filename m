Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 95FFE7203B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989816"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:41 -0800
Message-Id: <d2aac9d7e92a744e22cd735463a662ad50f59be9.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 16/19] less: Upgrade to 470
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/less/{less_466.bb => less_470.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_466.bb => less_470.bb} (88%)

diff --git a/meta/recipes-extended/less/less_466.bb b/meta/recipes-extended/less/less_470.bb
similarity index 88%
rename from meta/recipes-extended/less/less_466.bb
rename to meta/recipes-extended/less/less_470.bb
index c5b8a3f..5668329 100644
--- a/meta/recipes-extended/less/less_466.bb
+++ b/meta/recipes-extended/less/less_470.bb
@@ -26,8 +26,8 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7bc444bdb751bcf80ed0c39c17b4fcf4"
-SRC_URI[sha256sum] = "8305f5a06764ff094ed3428f94f29059541e2483eae201991f90823da6557212"
+SRC_URI[md5sum] = "abf7c37b1a2c3d83865eba3ab2eb369f"
+SRC_URI[sha256sum] = "f191dc51144e7ea0e7f116118d0ee7a5fe50d1ce330257e1ae5ee4c9d35d86ef"
 
 inherit autotools update-alternatives
 
-- 
1.8.3.1


