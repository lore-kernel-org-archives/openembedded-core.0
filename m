Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QziCt-0002bt-SB
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 06:51:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2011 21:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,323,1312182000"; d="scan'208";a="47785119"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2011 21:45:49 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2011 23:45:30 -0500
Message-ID: <1315025130.31478.142.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 2/2] task-core-tools: add systemtap to qemuarm
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
X-List-Received-Date: Sat, 03 Sep 2011 04:51:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Systemtap now works with arm, so include it in task-core-tools-profile
for qemuarm.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 11ea723..3159e06 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r11"
+PR = "r12"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -77,7 +77,7 @@ LTTNGUST_libc-uclibc = ""
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemux86-64 = " ${LTTNGUST} ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemuppc = " ${LTTNGUST} ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemuarm = " ${LTTNGUST}"
+RDEPENDS_task-core-tools-profile_append_qemuarm = " ${LTTNGUST} ${SYSTEMTAP}"
 
 RDEPENDS_task-core-tools-testapps = "\
     blktool \
-- 
1.7.0.4





