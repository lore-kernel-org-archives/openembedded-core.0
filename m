Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerh-00041j-Qa
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203788"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:28 -0700
Message-Id: <2bec29bdfcb31a300153488f2d832045621822b4.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/32] less: update to 443
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../less/{less_436.bb => less_443.bb}              |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/less/{less_436.bb => less_443.bb} (80%)

diff --git a/meta/recipes-extended/less/less_436.bb b/meta/recipes-extended/less/less_443.bb
similarity index 80%
rename from meta/recipes-extended/less/less_436.bb
rename to meta/recipes-extended/less/less_443.bb
index e6c8c71..0928ad4 100644
--- a/meta/recipes-extended/less/less_436.bb
+++ b/meta/recipes-extended/less/less_443.bb
@@ -9,14 +9,14 @@ SECTION = "console/utils"
 # less is a 2-clause BSD-like permissive license
 LICENSE = "GPLv3+ | less"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE;md5=fd5ccf3de28f72a0254fa8768ec8180c"
+                    file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
 DEPENDS = "ncurses"
 PR = "r0"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "817bf051953ad2dea825a1cdf460caa4"
-SRC_URI[sha256sum] = "57a16ff07431a9af45cf1cd5b374e1066d019304219f0d156e22bb8c4d6734d2"
+SRC_URI[md5sum] = "47db098fb3cdaf847b3c4be05ee954fc"
+SRC_URI[sha256sum] = "a4c3e8af81fd0944941ee7c74eecc7759422a227df52335e899e69de5eae30ca"
 
 
 inherit autotools update-alternatives
-- 
1.7.3.4



