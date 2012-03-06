Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvq-0003cc-VU
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714865"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:20 -0800
Message-Id: <b00d6f957a3ac9bcdab9dda1e887ad36b3bab852.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/20] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:18 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

As usual, this creates problems for upgrade paths, but splitting out the lib is worth the short term hassle

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/xz/xz_5.0.3.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.0.3.bb
index bae71ec..e8f96b6 100644
--- a/meta/recipes-extended/xz/xz_5.0.3.bb
+++ b/meta/recipes-extended/xz/xz_5.0.3.bb
@@ -14,8 +14,15 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
 SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools gettext
 
+PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
+
+FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
+FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
+FILES_liblzma-staticdev = "${libdir}/liblzma.a"
+FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
+
 BBCLASSEXTEND = "native"
-- 
1.7.7.6



