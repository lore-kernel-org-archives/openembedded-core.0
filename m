Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDVAg-0004RZ-C6
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 08:18:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2012 23:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="126851850"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2012 23:09:44 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 14:06:11 +0800
Message-Id: <63127bb5f4637db198a0ee85b1b79abf5c1dc02b.1333087412.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1333087412.git.lianhao.lu@intel.com>
References: <cover.1333087412.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] adt-installer: Adapted environment file name for powerpc.
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
X-List-Received-Date: Fri, 30 Mar 2012 06:18:50 -0000

Adpated to the new environment file name for powerpc, due to the oe-core
commit c2d96179.

Fixed bug [YOCTO #2055].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    2 --
 .../installer/adt-installer_1.0.bb                 |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 684dc88..6201095 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -175,8 +175,6 @@ check_result
 echo_info "Updating environment script with target sysroot location."
 if [ "$1" == "x86"  ]; then
   env_filename=`ls $INSTALL_FOLDER/environment-setup-i586*`
-elif [ "$1" == "ppc" ]; then
-  env_filename=`ls $INSTALL_FOLDER/environment-setup-powerpc*`
 else
   env_filename=`ls $INSTALL_FOLDER/environment-setup-$1*`
 fi
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 27937d9..07bef88 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = ""
 
-PR = "r7"
+PR = "r8"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
-- 
1.7.0.4



