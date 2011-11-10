Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOG-0005ag-Pp
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351209"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:55 -0800
Message-Id: <f7ddc1b0abdb43124eb031813c5fb73bcc9646cd.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 13/33] keymaps: depend on kbd instead of console-tools
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:43 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* nowadays kbd seems more active

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 4fe7987..1876db8 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -5,11 +5,12 @@ SECTION = "base"
 # Distro can override initscripts provider
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} console-tools"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} kbd"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r19"
+PR = "r20"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.6.4



