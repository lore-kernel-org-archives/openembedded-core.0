Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMq-00065I-23
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292934"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:46 -0700
Message-Id: <fa15f1d564b425fbf9550520e55a5c8d352d011b.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/41] rpm: Fix PACKAGECONFIG dependencies
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:21 -0000

From: Mark Hatle <mark.hatle@windriver.com>

neon requires expat to be built first

lua similarly requires expat if enabled

selinux package name should be "libselinux" (from meta-selinux).

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 8e892a8..6ef1aae 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r44"
+PR = "r45"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -129,13 +129,13 @@ PACKAGECONFIG[libelf] = "--with-libelf,--without-libelf,elfutils,"
 
 WITH_SELINUX = "--with-selinux --with-sepol --with-semanage"
 WITHOUT_SELINUX = "--without-selinux --without-sepol --without-semanage"
-PACKAGECONFIG[selinux] = "${WITH_SELINUX},${WITHOUT_SELINUX},selinux,"
+PACKAGECONFIG[selinux] = "${WITH_SELINUX},${WITHOUT_SELINUX},libselinux,"
 
 WITH_NEON = "--with-neon --with-libproxy --with-expat --without-gssapi"
 WITHOUT_NEON = "--without-neon --without-libproxy --without-expat --without-gssapi"
-PACKAGECONFIG[neon] = "${WITH_NEON},${WITHOUT_NEON},neon,"
+PACKAGECONFIG[neon] = "${WITH_NEON},${WITHOUT_NEON},neon expat,"
 
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,expat,"
 PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
 
 PACAKGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
-- 
1.7.7.6



