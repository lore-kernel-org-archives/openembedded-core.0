Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd76-00066R-20
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Oct 2011 20:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="67869513"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 27 Oct 2011 20:22:12 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:43 +0800
Message-Id: <9fd7c8848f526bda58723892d6c5e341f95c43ea.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 04/11] netbase: upgrade to version 4.46
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:12 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../netbase/{netbase-4.45 => netbase-4.46}/hosts   |    0
 .../netbase/{netbase-4.45 => netbase-4.46}/init    |    0
 .../{netbase-4.45 => netbase-4.46}/interfaces      |    0
 .../netbase/{netbase-4.45 => netbase-4.46}/nfsroot |    0
 .../qemuarm/interfaces                             |    0
 .../qemuarmv6/interfaces                           |    0
 .../qemuarmv7/interfaces                           |    0
 .../qemumips/interfaces                            |    0
 .../qemuppc/interfaces                             |    0
 .../qemux86-64/interfaces                          |    0
 .../qemux86/interfaces                             |    0
 .../netbase/{netbase_4.45.bb => netbase_4.46.bb}   |    6 +++---
 12 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/init (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/nfsroot (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuarm/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuarmv6/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuarmv7/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemumips/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuppc/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemux86-64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemux86/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase_4.45.bb => netbase_4.46.bb} (92%)

diff --git a/meta/recipes-core/netbase/netbase-4.45/hosts b/meta/recipes-core/netbase/netbase-4.46/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/hosts
rename to meta/recipes-core/netbase/netbase-4.46/hosts
diff --git a/meta/recipes-core/netbase/netbase-4.45/init b/meta/recipes-core/netbase/netbase-4.46/init
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/init
rename to meta/recipes-core/netbase/netbase-4.46/init
diff --git a/meta/recipes-core/netbase/netbase-4.45/interfaces b/meta/recipes-core/netbase/netbase-4.46/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/nfsroot b/meta/recipes-core/netbase/netbase-4.46/nfsroot
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/nfsroot
rename to meta/recipes-core/netbase/netbase-4.46/nfsroot
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemuarm/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemuarm/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemuarm/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemuarm/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemuarmv6/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemuarmv6/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemuarmv6/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemuarmv6/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemuarmv7/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemuarmv7/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemuarmv7/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemuarmv7/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemumips/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemumips/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemuppc/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemuppc/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemux86-64/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemux86-64/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemux86-64/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemux86-64/interfaces
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemux86/interfaces b/meta/recipes-core/netbase/netbase-4.46/qemux86/interfaces
similarity index 100%
rename from meta/recipes-core/netbase/netbase-4.45/qemux86/interfaces
rename to meta/recipes-core/netbase/netbase-4.46/qemux86/interfaces
diff --git a/meta/recipes-core/netbase/netbase_4.45.bb b/meta/recipes-core/netbase/netbase_4.46.bb
similarity index 92%
rename from meta/recipes-core/netbase/netbase_4.45.bb
rename to meta/recipes-core/netbase/netbase_4.46.bb
index 04ef3a0..b55a8a1 100644
--- a/meta/recipes-core/netbase/netbase_4.45.bb
+++ b/meta/recipes-core/netbase/netbase_4.46.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r1"
+PR = "r0"
 
 inherit update-rc.d
 
@@ -49,5 +49,5 @@ PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
 PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"
 
-SRC_URI[md5sum] = "a56cb362ece358a5b3b8972e5c7be534"
-SRC_URI[sha256sum] = "dea29d60b3d751f0c5669b5299af312ad269c48e6440e0072d0d68d9544ebad3"
+SRC_URI[md5sum] = "e15762f4a8280a62f7ddfea6093120f1"
+SRC_URI[sha256sum] = "2fdee144112731ee0028fee2584cc82d664857ca7004c2eb59de7bda5b159838"
-- 
1.7.1



