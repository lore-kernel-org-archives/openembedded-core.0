Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRWLg-0001jP-Ok
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 00:56:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Oct 2012 15:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,650,1344236400"; d="scan'208";a="210942424"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.104])
	by orsmga001.jf.intel.com with ESMTP; 25 Oct 2012 15:42:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2012 15:42:53 -0700
Message-Id: <1351204973-3449-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] ltp: add perl to RDEPENDS
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
X-List-Received-Date: Thu, 25 Oct 2012 22:56:25 -0000

Some of the ltp scripts are perl, this was not seen in the
past because ltp is normally installed in an -sdk build with
perl already there.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/ltp/ltp_20120903.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20120903.bb b/meta/recipes-extended/ltp/ltp_20120903.bb
index e3e760d..1bc1d60 100644
--- a/meta/recipes-extended/ltp/ltp_20120903.bb
+++ b/meta/recipes-extended/ltp/ltp_20120903.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
@@ -33,6 +33,8 @@ export exec_prefix = "/opt/ltp"
 
 inherit autotools
 
+RDEPENDS_${PN} = "perl"
+
 FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
 FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
 FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
-- 
1.7.7.6



