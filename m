Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R6qgB-0002aX-3n
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 23:19:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Sep 2011 14:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="53955479"
Received: from unknown (HELO localhost) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2011 14:14:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 14:14:09 -0700
Message-Id: <e4dd377c38d0df65adb41959e5b720e5b539a47d.1316725800.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1316725800.git.dvhart@linux.intel.com>
References: <cover.1316725800.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] intltool: add libxml-parser-perl-native dependency to -native version
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
X-List-Received-Date: Thu, 22 Sep 2011 21:19:35 -0000

Fixes [YOCTO #1514]

Without a native dependency on libxml-parser-perl-native,
shared-mime-info-native can fail its do_configure task.

checking for XML::Parser... configure: error: XML::Parser perl module is
required for intltool

Testing: Successfully built shared-mime-info and shared-mime-info-native for
qemuppc.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Joshua Lock <josh@linux.intel.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Koen Kooi <koen@dominion.thruhere.net>
CC: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/intltool/intltool.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index 8d4bec5..23a1ee9 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -7,6 +7,7 @@ SRC_URI = "${GNOME_MIRROR}/intltool/${URLV}/intltool-${PV}.tar.bz2"
 S = "${WORKDIR}/intltool-${PV}"
 
 DEPENDS = "libxml-parser-perl-native"
+DEPENDS_virtclass-native = "libxml-parser-perl-native"
 #RDEPENDS_${PN} = "libxml-parser-perl"
 RRECOMMENDS_${PN} = "perl-modules"
 RRECOMMENDS_${PN}_virtclass-native = ""
-- 
1.7.6.2



