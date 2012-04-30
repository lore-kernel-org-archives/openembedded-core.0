Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7N-00084I-R1
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453914"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:54 -0700
Message-Id: <5da3ede96713cf3bcd51ff633600fc26076f49cb.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/19] iptables: upgrade to version 1.4.13
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:54 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.7.6



