Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UaSu4-0005pf-TP
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 17:37:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2013 08:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="310775130"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.9])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2013 08:18:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 08:18:35 -0700
Message-Id: <1368112715-6757-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH][danny] powertop: inherit gettext
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
X-List-Received-Date: Thu, 09 May 2013 15:37:16 -0000

powertop uses gettext during config time and at build time to generate
the messages, so really should inherit gettext

[YOCTO #4470]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/powertop/powertop_2.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.3.bb b/meta/recipes-kernel/powertop/powertop_2.3.bb
index 8d290d3..8ee349c 100644
--- a/meta/recipes-kernel/powertop/powertop_2.3.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Power usage tool"
 DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
 HOMEPAGE = "http://01.org/powertop/"
 BUGTRACKER = "http://bugzilla.lesswatts.org/"
-DEPENDS = "ncurses virtual/gettext libnl pciutils"
+DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.t
 SRC_URI[md5sum] = "dc03608f20e56cdc99d121a6191556f6"
 SRC_URI[sha256sum] = "b8c1add69afee28c77dca56fdcedb4a46820f3a71c86aae7891b0c5c595cd744"
 
-inherit autotools
+inherit autotools gettext
 
 # we need to explicitly link with libintl in uClibc systems
 LDFLAGS += "${EXTRA_LDFLAGS}"
-- 
1.7.10.4



