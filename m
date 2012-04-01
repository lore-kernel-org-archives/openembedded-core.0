Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SENVg-0008GU-Kh
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 18:20:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2012 09:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136280134"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2012 09:09:55 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2012 00:10:12 +0800
Message-Id: <aa1db70b9409f1a12b197e4ebb77ef2be200247e.1333295123.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
Subject: [PATCH 4/5] builder: uncomment the settings for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Sun, 01 Apr 2012 16:20:09 -0000

We use sed to enable the 2 settingis in conf/local.conf.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
 .../builder/files/builder_hob_start.sh             |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 1324e5b..af6ba51 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index f43e6c5..98b2adb 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -10,6 +10,11 @@ export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
 
 cd /home/builder/poky
 . ./oe-init-build-env
+
+#uncomment the settings for BB_NUMBER_THREADS and PARALLEL_MAKE
+sed -i 's/^#BB_NUMBER_THREADS =/BB_NUMBER_THREADS =/g' conf/local.conf
+sed -i 's/^#PARALLEL_MAKE =/PARALLEL_MAKE =/g' conf/local.conf
+
 hob &
 
 matchbox-terminal&
-- 
1.7.6



