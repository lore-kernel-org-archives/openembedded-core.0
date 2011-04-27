Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzFB-0005Ui-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:33:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550750"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:30:12 -0700
Message-Id: <86113b5a68b397e16a7447b1c479b15ff7a389ce.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 16:37:48 -0700
Date: Wed, 27 Apr 2011  0:30:12 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 50/52] alsa-tools: Add checksums
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
X-List-Received-Date: Wed, 27 Apr 2011 07:33:07 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.20.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.20.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.20.bb
index 789b68e..4a65b91 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.20.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.20.bb
@@ -2,9 +2,15 @@ BROKEN = "1"
 
 DESCRIPTION = "Alsa Tools"
 SECTION = "console/utils"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
 
+LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2"
 
+SRC_URI[md5sum] = "6b9d146af621dd712472b3ebb519c596"
+SRC_URI[sha256sum] = "2a05047363b20f16820f36198ed3b139d1c55f55464750ea11d350e00b09cb86"
+
+
 inherit autotools
-- 
1.7.1.1



