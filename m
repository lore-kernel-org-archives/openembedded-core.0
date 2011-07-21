Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjnY7-0000mW-Gc
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:20:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2011 00:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="32877419"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 00:15:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:15:49 -0700
Message-Id: <bbc5129ecdec37a4ebf62f3b43e0f0e0a64210f9.1311232435.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311232435.git.sgw@linux.intel.com>
References: <cover.1311232435.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311232435.git.sgw@linux.intel.com>
References: <cover.1311232435.git.sgw@linux.intel.com>
Subject: [PATCH v2 1/1] gettext: Add depends to gettext to avoid host contamination
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
X-List-Received-Date: Thu, 21 Jul 2011 07:20:00 -0000

[YOCTO #1242]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 0b11a90..cc0129f 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
-DEPENDS = "gettext-native virtual/libiconv ncurses expat"
-DEPENDS_virtclass-native = ""
+PR = "r2"
+DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
+DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = ""
 CONFLICTS_${PN} = "proxy-libintl"
-- 
1.7.3.4



