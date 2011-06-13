Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW169-0002Fr-Kw
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500632"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:32 -0700
Message-Id: <ab6e52eabb4956da9aa2c9d3b17f20030ec00400.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 22/23] alsa-tools: fix Checksums
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
X-List-Received-Date: Mon, 13 Jun 2011 07:01:48 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 4a65b91..4f71559 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -5,12 +5,15 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
 
+PR = "r1"
+
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "6b9d146af621dd712472b3ebb519c596"
-SRC_URI[sha256sum] = "2a05047363b20f16820f36198ed3b139d1c55f55464750ea11d350e00b09cb86"
+SRC_URI[md5sum] = "08fe93a12006093e590d7ecc02b119dd"
+SRC_URI[sha256sum] = "17d43de93ab2db98886d89a53e45341daa46a4ef6edd405db87f4b5a5dc64a05"
 
+EXTRA_OEFLAGS = "--host ${HOST_SYS}"
 
 inherit autotools
-- 
1.7.3.4



