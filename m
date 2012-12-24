Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn6ko-00052E-0D
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 13:03:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Dec 2012 03:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="238455258"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 24 Dec 2012 03:48:42 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 13:49:17 +0200
Message-Id: <1356349757-30497-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] libcroco: fix license
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 12:03:34 -0000

src/cr-rgb.c: adjust the license endline
- the license part ends at line #22

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 6f5995f..5c3fd5c 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -4,12 +4,12 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://src/cr-rgb.c;endline=25;md5=cbb4f64cc46ee9fcf602d3b0836cee56 \
+                    file://src/cr-rgb.c;endline=22;md5=31d5f0944d556c8589d04ea6055fcc66 \
                     file://tests/cr-test-utils.c;endline=21;md5=2382c27934cae1d3792fcb17a6142c4e"
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig gnome
 
-- 
1.7.11.7



