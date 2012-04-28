Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yH-0005LI-SI
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2012 01:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136424181"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2012 01:15:59 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:31 +0800
Message-Id: <df32e2734d954c3483dbb1d5e3d52a5fd5e654a9.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 7/8] iptables: upgrade to version 1.4.13
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:38 -0000

Remove a patch since it is already in upstream.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../iptables/iptables/GNUmakefile.patch            |   18 ------------------
 .../{iptables_1.4.12.2.bb => iptables_1.4.13.bb}   |    5 ++---
 2 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/GNUmakefile.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.12.2.bb => iptables_1.4.13.bb} (89%)

diff --git a/meta/recipes-extended/iptables/iptables/GNUmakefile.patch b/meta/recipes-extended/iptables/iptables/GNUmakefile.patch
deleted file mode 100644
index c60e84f..0000000
--- a/meta/recipes-extended/iptables/iptables/GNUmakefile.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Don't check unknown symbols.
-
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-diff -r abb89394ce0c extensions/GNUmakefile.in
---- a/extensions/GNUmakefile.in	Mon Jan 23 00:12:27 2012 +0800
-+++ b/extensions/GNUmakefile.in	Mon Jan 23 00:38:32 2012 +0800
-@@ -68,7 +68,7 @@
- 
- .PHONY: all install clean distclean FORCE
- 
--all: ${targets} check
-+all: ${targets}
- 
- check: ${targets}
- 	@echo "  CHECK    unknown symbols in .so files"; \
diff --git a/meta/recipes-extended/iptables/iptables_1.4.12.2.bb b/meta/recipes-extended/iptables/iptables_1.4.13.bb
similarity index 89%
rename from meta/recipes-extended/iptables/iptables_1.4.12.2.bb
rename to meta/recipes-extended/iptables/iptables_1.4.13.bb
index 663ddad..59782c0 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.12.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.13.bb
@@ -22,11 +22,10 @@ FILES_${PN} =+ "${libdir}/xtables/"
 FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
-           file://GNUmakefile.patch \
            file://types.h-add-defines-that-are-required-for-if_packet.patch"
 
-SRC_URI[md5sum] = "212112389c7f10c72efb31a4ed193a4c"
-SRC_URI[sha256sum] = "09fff7dfe6af95675474fd5d0fc67622fac5a0f3d6e02ee614deae9a2e5dae13"
+SRC_URI[md5sum] = "40a15608ec57b50e9377cace546dd115"
+SRC_URI[sha256sum] = "321e2600fc4541a958e44cafd85a42864b0035404097e0f2e082d474029b9ded"
 
 inherit autotools
 
-- 
1.7.4.1



