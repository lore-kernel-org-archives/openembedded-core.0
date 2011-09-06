Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0zUz-00037d-Pd
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:31:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 10:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,339,1312182000"; d="scan'208";a="49562724"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:26:25 -0700
Message-Id: <5fffa523f5f4eddd888b071dbaec5235aa969726.1315329511.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 5/5] web: Update SRCREV to address ccs_parser_parse_stylesheet arg mismatch
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
X-List-Received-Date: Tue, 06 Sep 2011 17:31:51 -0000

[YOCTO #1454]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/web/web_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/web/web_git.bb b/meta/recipes-sato/web/web_git.bb
index c1a1334..b606e64 100644
--- a/meta/recipes-sato/web/web_git.bb
+++ b/meta/recipes-sato/web/web_git.bb
@@ -2,9 +2,9 @@ LICENSE = "GPLv2"
 SECTION = "x11"
 DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
 DESCRIPTION = "Web is a multi-platform web browsing application."
-PR = "r2"
+PR = "r0"
 
-SRCREV = "96da839f65e17ecc6d5261c1d74accd88423dd7a"
+SRCREV = "3fad2eb32b2312093dcd750612bafeff84e32bc9"
 PV = "0.0+git${SRCPV}"
 
 SRC_URI = 	"git://git.yoctoproject.org/web-sato;protocol=git \
-- 
1.7.6



