Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvp-0003cc-Rb
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:14 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714862"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:17 -0800
Message-Id: <6c792490fc2b41dd38843917b310a860c89fa9b6.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/20] shadow-sysroot: Fix for multilib
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:14 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Fix following error in multilib build:
"ERROR: Task do_package_setscene depends upon nonexistant task
poky/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb:do_populate_sysroot_setscene"

From richard.purdie@linuxfoundation.org

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/classes/useradd.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index db874bc..7981a68 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -114,7 +114,7 @@ SYSROOTPOSTFUNC_virtclass-cross = ""
 SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
-USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS_virtclass-cross = ""
 USERADDSETSCENEDEPS_virtclass-native = ""
 USERADDSETSCENEDEPS_virtclass-nativesdk = ""
-- 
1.7.7.6



