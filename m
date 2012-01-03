Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004iK-Qu
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752272"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:09 -0800
Message-Id: <abb5741c7b17832f1181b78ba3d03c070cab6304.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 083/113] procps: raise update-alternatives priority
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:39 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

This fixes a problem with the uptime utility:

root@beagleboneA3-0088:/var/lib/cloud9# busybox uptime
 16:00:17 up 2 days,  6:46,  load average: 0.14, 0.04, 0.05
root@beagleboneA3-0088:/var/lib/cloud9# uptime.procps
 16:00:22 up 2 days,  6:46,  1 user,  load average: 0.14, 0.05, 0.06
root@beagleboneA3-0088:/var/lib/cloud9# uptime.coreutils
 16:00pm  up 4382 days 15:58,  1 user,  load average: 0.13, 0.05, 0.05
root@beagleboneA3-0088:/var/lib/cloud9# ls /usr/bin/uptime -la
lrwxrwxrwx 1 root root 16 Dec 26 08:56 /usr/bin/uptime -> uptime.coreutils

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/procps/procps_3.2.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index d989955..6a41ccd 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,12 +1,12 @@
 require procps.inc
 
-PR = "r3"
+PR = "r4"
 
 inherit update-alternatives
 
 ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
                      ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
-ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_PRIORITY = "110"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
-- 
1.7.6.4



