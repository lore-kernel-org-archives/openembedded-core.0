Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYm-0008UK-Hk
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:06:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580345"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:17 -0700
Message-Id: <51def5af12c5e80bf2e4c87936b8e700a27691aa.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (Updated) 15/15] kernel-yocto: add CCACHE_DIR dependency to do_kernel_configme
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
X-List-Received-Date: Sun, 07 Aug 2011 05:06:00 -0000

[YOCTO #1350]

Since do_kernel_configme is added before the standard do_configure task
we needed to add CCACHE_DIR so when the kernel builds it's host configure
tools the CCACHE_DIR exists.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel-yocto.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f31ff61..daaee50 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -84,6 +84,7 @@ do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_patch after do_unpack
 
+do_kernel_configme[dirs] = "${CCACHE_DIR} ${S} ${B}"
 do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 
-- 
1.7.3.4



