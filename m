Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYVoX-0003N6-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 06:47:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 21:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,248,1352102400"; d="scan'208";a="246693785"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2012 21:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 21:32:45 -0800
Message-Id: <0c604e38ddcd6597371775a9c51625bf71c9f359.1352871028.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
Subject: [PATCH 3/9] less: Update to 451
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
X-List-Received-Date: Wed, 14 Nov 2012 05:47:07 -0000

LICENSE file was changed to match the BSD-2 Clause

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../less/{less_444.bb => less_451.bb}              |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/less/{less_444.bb => less_451.bb} (82%)

diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_451.bb
similarity index 82%
rename from meta/recipes-extended/less/less_444.bb
rename to meta/recipes-extended/less/less_451.bb
index 1ce9d92..93e4bbf 100644
--- a/meta/recipes-extended/less/less_444.bb
+++ b/meta/recipes-extended/less/less_451.bb
@@ -21,14 +21,14 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
+                    file://LICENSE;md5=866cc220f330b04ae4661fc3cdfedea7"
 DEPENDS = "ncurses"
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "56f9f76ffe13f70155f47f6b3c87d421"
-SRC_URI[sha256sum] = "be64ad3e22d6d4aa19fe7024d998563a1ce1671ee3625f8851d26b16dedcdeeb"
+SRC_URI[md5sum] = "765f082658002b2b46b86af4a0da1842"
+SRC_URI[sha256sum] = "9fe8287c647afeafb4149c5dedaeacfd20971ed7c26c7553794bb750536b5f57"
 
 inherit autotools update-alternatives
 
-- 
1.7.7.6



