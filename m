Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivY-0002D1-RJ
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056924"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:28 -0700
Message-Id: <7d2cc70f122fefe0e629fb6cd751d216079993eb.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/33] parted: Upgrade to 3.0
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{parted-2.3 => parted-3.0}/no_check.patch      |    0
 .../{parted-2.3 => parted-3.0}/syscalls.patch      |    0
 .../parted/{parted_2.3.bb => parted_3.0.bb}        |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/parted/{parted-2.3 => parted-3.0}/no_check.patch (100%)
 rename meta/recipes-extended/parted/{parted-2.3 => parted-3.0}/syscalls.patch (100%)
 rename meta/recipes-extended/parted/{parted_2.3.bb => parted_3.0.bb} (78%)

diff --git a/meta/recipes-extended/parted/parted-2.3/no_check.patch b/meta/recipes-extended/parted/parted-3.0/no_check.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-2.3/no_check.patch
rename to meta/recipes-extended/parted/parted-3.0/no_check.patch
diff --git a/meta/recipes-extended/parted/parted-2.3/syscalls.patch b/meta/recipes-extended/parted/parted-3.0/syscalls.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-2.3/syscalls.patch
rename to meta/recipes-extended/parted/parted-3.0/syscalls.patch
diff --git a/meta/recipes-extended/parted/parted_2.3.bb b/meta/recipes-extended/parted/parted_3.0.bb
similarity index 78%
rename from meta/recipes-extended/parted/parted_2.3.bb
rename to meta/recipes-extended/parted/parted_3.0.bb
index 14c9c25..29daf01 100644
--- a/meta/recipes-extended/parted/parted_2.3.bb
+++ b/meta/recipes-extended/parted/parted_3.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
            file://no_check.patch \
            file://syscalls.patch "
 
-SRC_URI[md5sum] = "30ceb6df7e8681891e865e2fe5a7903d"
-SRC_URI[sha256sum] = "e81fa140805b5cd029ff6dda5cfa94d223e83ac182ebcae94f841d62ce468829"
+SRC_URI[md5sum] = "a94e84a9b9944715c4453f82ccc639bf"
+SRC_URI[sha256sum] = "8886eece015202f6bd5ce8414f4b68838452cef509f2e3389ad56128219837b7"
 
 EXTRA_OECONF = "--disable-Werror --disable-device-mapper"
 
-- 
1.7.3.4



