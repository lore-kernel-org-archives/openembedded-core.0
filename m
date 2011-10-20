Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUu-0002o6-Aq
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982218"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:52 -0700
Message-Id: <88e5175f7bf08d1ae8067b6f22b043afcb248a78.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 16/26] liburi-perl: update to 1.59
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:05 -0000

From: Kang Kai <kai.kang@windriver.com>

Update liburi-perl to 1.59

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../{liburi-perl_1.58.bb => liburi-perl_1.59.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb => liburi-perl_1.59.bb} (81%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.58.bb b/meta/recipes-devtools/perl/liburi-perl_1.59.bb
similarity index 81%
rename from meta/recipes-devtools/perl/liburi-perl_1.58.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.59.bb
index 9b84e2c..877b252 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.58.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.59.bb
@@ -4,7 +4,7 @@ and manipulate the various components that make up these strings."
 
 SECTION = "libs"
 LICENSE = "Artistic | GPLv1+"
-PR = "r2"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
 
@@ -12,8 +12,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "540575aee18616ad9a21e0af7a1e7b18"
-SRC_URI[sha256sum] = "5ddeb8e4707bd4c37a3a60f634de8424e40c85bba98cf6c1053ae5e71c9b8289"
+SRC_URI[md5sum] = "fecebf8fa20e2d26ea4a1649c095e96e"
+SRC_URI[sha256sum] = "cb88d29b589db8d2adbc4713fd082284cba77883488717375f011bbd13b5cac6"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
1.7.6.2



