Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S4orx-0004Nw-GN
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 08:31:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Mar 2012 23:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115184989"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by azsmga001.ch.intel.com with ESMTP; 05 Mar 2012 23:23:00 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 15:23:13 +0800
Message-Id: <415ea24e5428b5ec3a15c8a3586f17ab07ea3745.1331017518.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1331017518.git.edwin.zhai@intel.com>
References: <cover.1331017518.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1331017518.git.edwin.zhai@intel.com>
References: <cover.1331017518.git.edwin.zhai@intel.com>
Subject: [PATCH 4/4] shadow-sysroot: Fix for multilib
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
X-List-Received-Date: Tue, 06 Mar 2012 07:31:37 -0000

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
1.7.1



