Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact6-0005Xs-FA
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596738"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:19 -0800
Message-Id: <3579737290442bd49a332e6416d01ac79678989c.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 11/13] libdumpvalue-perl: Update to 1.17
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:32 -0000

LICENSE file updated Copyright year to 2012, no other change

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...alue-perl_1.16.bb => libdumpvalue-perl_1.17.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-lsb4/perl/{libdumpvalue-perl_1.16.bb => libdumpvalue-perl_1.17.bb} (65%)

diff --git a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.16.bb b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
similarity index 65%
rename from meta/recipes-lsb4/perl/libdumpvalue-perl_1.16.bb
rename to meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
index 8476b94..148950f 100644
--- a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.16.bb
+++ b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
@@ -6,12 +6,12 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=31013c0a67276e1ca20f358868cf99ab"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f736bec5ada1fc5e39b2a8e7e06bbcbb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dumpvalue-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bef29bf25717db250929bf2b065c4183"
-SRC_URI[sha256sum] = "8204ea8f95dc6b137e225702e9bacaa23646ffa8c1c9eef45fa06a7f19f338f2"
+SRC_URI[md5sum] = "6ede9f693d4a9c4555541cb1a1cc2006"
+SRC_URI[sha256sum] = "9ea74606b545f769a787ec2ae229549a2ad0a8e3cd4b14eff2ce3841836b3bdb"
 
 S = "${WORKDIR}/Dumpvalue-${PV}"
 
-- 
1.7.7.6



