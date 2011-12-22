Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rdp2B-0001kW-Gg
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 21:14:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Dec 2011 12:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105219796"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2011 12:07:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:07:23 -0800
Message-Id: <1324584443-7882-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH] coreutils: ensure --color works so DEPEND on libcap
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
X-List-Received-Date: Thu, 22 Dec 2011 20:14:36 -0000

[YOCTO #1860]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index cc05d88..251dabe 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
 PR = "r2"
-DEPENDS = "gmp"
+DEPENDS = "gmp libcap"
 DEPENDS_virtclass-native = ""
 
 inherit autotools gettext
-- 
1.7.6.4



