Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWGWw-0007td-5h
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 00:59:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Dec 2011 15:52:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="91294730"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2011 15:52:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 15:52:23 -0800
Message-Id: <1322783543-4287-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 1/3] kernel-yocto: fix extra CR in do_kernel_checkout
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
X-List-Received-Date: Thu, 01 Dec 2011 23:59:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel-yocto.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ad14aac..79f82e3 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -53,8 +53,7 @@ do_patch() {
 }
 
 do_kernel_checkout() {
-	if [ -d $
-{WORKDIR}/git/.git/refs/remotes/origin ]; then
+	if [ -d ${WORKDIR}/git/.git/refs/remotes/origin ]; then
 		echo "Fixing up git directory for ${LINUX_KERNEL_TYPE}/${KMACHINE}"
 		rm -rf ${S}
 		mkdir ${S}
-- 
1.7.6.4



