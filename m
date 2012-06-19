Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11S-00028G-0X
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520341"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:40 -0700
Message-Id: <1cc64e57c78e4270e940888cc041e8326b207e20.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 22/39] procps: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/procps/procps.inc      |    6 ++++--
 meta/recipes-extended/procps/procps_3.2.8.bb |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps.inc b/meta/recipes-extended/procps/procps.inc
index ada3257..80080fc 100644
--- a/meta/recipes-extended/procps/procps.inc
+++ b/meta/recipes-extended/procps/procps.inc
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                   file://proc/COPYING;md5=6e29c688d912da12b66b73e32b03d812"
 DEPENDS = "ncurses"
 
-FILES_${PN} += "${base_libdir}/libproc-*.so"
-
 SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz \
            file://install.patch"
 
 inherit autotools
+
+FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
+FILES_SOLIBSDEV = ""
+FILES_${PN} += ""
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index dfae0b8..5508eb0 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r7"
+PR = "r8"
 
 inherit update-alternatives
 
-- 
1.7.7.6



