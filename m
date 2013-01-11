Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TtoGh-0008Pu-1F
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:44:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 15:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="242964327"
Received: from unknown (HELO localhost) ([10.255.14.242])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2013 15:28:53 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 17:28:47 -0600
Message-Id: <0e839ece9f4b1e2533cf3cdc341df37107da8d8c.1357946582.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <b7c087229da048ee38f14508c2d157bea10c8e49.1357946582.git.tom.zanussi@intel.com>
References: <b7c087229da048ee38f14508c2d157bea10c8e49.1357946582.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1357946582.git.tom.zanussi@intel.com>
References: <cover.1357946582.git.tom.zanussi@intel.com>
Subject: [PATCH 2/3] lttng2-ust: rename to lttng-ust
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 23:44:22 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

recipes-kernel/lttng/lttng-ust was removed by a previous patch, which
also removed the naming conflict that caused the lttng-2.0 version of
lttng-ust to be named lttng2-ust.  lttng2-ust was the only lttng-2.0
recipe to be named in this way and since that was entirely due to the
conflict, we can go back to the consistent naming for it.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb   | 2 +-
 meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb                   | 2 +-
 .../lttng-2.0/{lttng2-ust_2.1.0.bb => lttng-ust_2.1.0.bb}            | 5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.1.0.bb => lttng-ust_2.1.0.bb} (87%)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 591f33f..8f40c4e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -46,7 +46,7 @@ SYSTEMTAP_aarch64 = ""
 # which means we can not use syscall() to call it. So we ignore
 # it for x86_64/uclibc
 
-LTTNGUST = "lttng2-ust"
+LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
 LTTNGUST_mips = ""
 LTTNGUST_aarch64 = ""
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
index 482b9a6..16e1ccc 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt lttng2-ust"
+DEPENDS = "liburcu popt lttng-ust"
 
 SRCREV = "917f768512b5d336d553b801f6c5308d90252a89"
 PV = "v2.1.0"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb b/meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
similarity index 87%
rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
rename to meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
index 439e006..1076bde 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
@@ -12,6 +12,11 @@ inherit autotools
 
 DEPENDS = "liburcu util-linux"
 
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "lttng2-ust"
+RREPLACES_${PN} = "lttng2-ust"
+RCONFLICTS_${PN} = "lttng2-ust"
+
 SRCREV = "0c9ad44b7604040dfcd1e67b18afc3dc5d025b19"
 PV = "2.1.0"
 PR = "r0"
-- 
1.7.11.4



