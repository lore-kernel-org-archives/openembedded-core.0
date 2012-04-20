Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH74-0005g2-5H
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167895"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:16 -0700
Message-Id: <7fa077a82fd38bb69407dbbef24f0833f1a05ec1.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/43] dropbear: Use update-alternatives class
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:14 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Use the MANUAL_ALTERNATIVE_LINKS to specify the update-alternatives
so that runtime provides are automatically added to packages.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc        |    4 ++++
 meta/recipes-core/dropbear/dropbear_2012.55.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 2d6aeb2..27a3b66 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -72,6 +72,10 @@ do_install() {
 
 }
 
+inherit update-alternatives
+
+MANUAL_ALTERNATIVE_LINKS = "${bindir}/scp:${sbindir}/dropbearmulti ${bindir}/ssh:${sbindir}/dropbearmulti"
+
 pkg_postinst_${PN} () {
 	update-alternatives --install ${bindir}/scp scp ${sbindir}/dropbearmulti 20
 	update-alternatives --install ${bindir}/ssh ssh ${sbindir}/dropbearmulti 20
diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
index 4f0ef80..18fea01 100644
--- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
+++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
 SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
 
-PR = "r0"
+PR = "r1"
-- 
1.7.7.6



