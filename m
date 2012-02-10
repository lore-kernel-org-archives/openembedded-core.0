Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlya-0001XA-Ob
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213848"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:38 -0800
Message-Id: <7b043bd554099f6f24dac883fd61234b47cd1562.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/20] useradd.bbclass: skip processing on virtclass-cross extended packages
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:05 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/useradd.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8eb6444..1fed755 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,6 +3,7 @@
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
 USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
+USERADDDEPENDS_virtclass-cross = ""
 USERADDDEPENDS_virtclass-native = ""
 USERADDDEPENDS_virtclass-nativesdk = ""
 
@@ -104,10 +105,12 @@ useradd_sysroot_sstate () {
 
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
+SYSROOTFUNC_virtclass-cross = ""
 SYSROOTFUNC_virtclass-native = ""
 SYSROOTFUNC_virtclass-nativesdk = ""
 SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
 SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
+SYSROOTPOSTFUNC_virtclass-cross = ""
 SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
-- 
1.7.6.5



