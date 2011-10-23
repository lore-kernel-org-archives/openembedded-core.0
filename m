Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rW-0005xS-3U
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250253"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:27:04 -0700
Message-Id: <dfc5efb4c54797a39c2471dfba7b7cbf14fb6476.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/27] abiword: convert to svn
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-demoapps/recipes-gnome/abiword/abiword.inc    |    4 ++--
 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |   10 ----------
 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 ++++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
 create mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb

diff --git a/meta-demoapps/recipes-gnome/abiword/abiword.inc b/meta-demoapps/recipes-gnome/abiword/abiword.inc
index b1b0f67..2b34a7a 100644
--- a/meta-demoapps/recipes-gnome/abiword/abiword.inc
+++ b/meta-demoapps/recipes-gnome/abiword/abiword.inc
@@ -13,8 +13,8 @@ RRECOMMENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
 RELURI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
 RELSRC = "${WORKDIR}/abiword-${PV}/abi"
 
-CVSURI = "cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=abi"
-CVSSRC = "${WORKDIR}/abi"
+SVNURI = "cvs://svn.abisource.com/abiword/trunk;module=abiword;proto=http"
+SVNSRC = "${WORKDIR}/abi"
 
 #want 2.x from 2.x.y for the installation directory
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb b/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
deleted file mode 100644
index 163029e..0000000
--- a/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require abiword.inc
-
-SRCDATE = "20070130"
-PV="2.5.0+cvs${SRCDATE}"
-PR = "r4"
-
-SRC_URI = "${CVSURI}"
-
-S = "${CVSSRC}"
-
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword_svn.bb b/meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
new file mode 100644
index 0000000..a8946a8
--- /dev/null
+++ b/meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
@@ -0,0 +1,10 @@
+require abiword.inc
+
+SRCREV = "21818"
+PV="2.5.2+svnr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "${SVNURI}"
+
+S = "${SVNSRC}"
+
-- 
1.7.6.4



