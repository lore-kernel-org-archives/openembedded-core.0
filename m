Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsuES-0002c1-Mt
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:17:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 03:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,373,1309762800"; d="scan'208";a="41534198"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 03:12:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 11:12:38 +0100
Message-Id: <0ac6f1690cc977c6604217dfeae47668b36392e3.1313402929.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] qt4: delete unpackaged uic3 to avoid unpackaged file warning
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
X-List-Received-Date: Mon, 15 Aug 2011 10:17:24 -0000

All the other utilities get deleted as they should not be packaged,
delete this one as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 815ebc2..ba6fad5 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -279,6 +279,7 @@ do_install() {
 	# These are host binaries, we should only use them in staging
 	rm ${D}/${bindir}/qmake
 	rm ${D}/${bindir}/uic
+	rm ${D}/${bindir}/uic3
 	rm ${D}/${bindir}/moc
 	rm ${D}/${bindir}/rcc
 	rm ${D}/${bindir}/lrelease
-- 
1.7.4.1



