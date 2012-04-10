Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHj5P-0002dK-3C
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 23:58:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2012 14:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130933011"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 14:49:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Tue, 10 Apr 2012 14:49:08 -0700
Message-Id: <560645d66f6a67d7a23531a3002d19ab37db1d01.1334094326.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334094326.git.sgw@linux.intel.com>
References: <cover.1334094326.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334094326.git.sgw@linux.intel.com>
References: <cover.1334094326.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] boot-directdisk: remove the default setting of SYSLINUXCFG and SYSLINUXMENU
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
X-List-Received-Date: Tue, 10 Apr 2012 21:58:51 -0000

These two should get setup in {S} and installed into {HDDDIR}, by
having them defined with {HDDDIR} they try to get created when the
directory does not exist yet.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/boot-directdisk.bbclass |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index e9e1ba3..7d8f8ff 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -40,9 +40,6 @@ AUTO_SYSLINUXCFG = "1"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
-SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
-SYSLINUXMENU = "${HDDDIR}/menu"
-
 inherit syslinux
 		
 build_boot_dd() {
-- 
1.7.7.6



