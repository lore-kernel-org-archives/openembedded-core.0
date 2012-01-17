Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RnENO-0001Mz-3E
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:07:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 10:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99658529"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.216])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 10:59:42 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 10:59:37 -0800
Message-Id: <734d72275f9d80d822e4e52c30f923da0ac89e87.1326826646.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
Subject: [PATCH 2/5] busybox: remove incorrect comments from syslog-startup.conf
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
X-List-Received-Date: Tue, 17 Jan 2012 19:07:22 -0000

Setting rotation size and generations is supported with busybox syslogd

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../recipes-core/busybox/files/syslog-startup.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/files/syslog-startup.conf b/meta/recipes-core/busybox/files/syslog-startup.conf
index 1e4c559..f58cbe5 100644
--- a/meta/recipes-core/busybox/files/syslog-startup.conf
+++ b/meta/recipes-core/busybox/files/syslog-startup.conf
@@ -5,7 +5,7 @@ DESTINATION=buffer		# log destinations (buffer file remote)
 LOGFILE=/var/log/messages	# where to log (file)
 REMOTE=loghost:514		# where to log (syslog remote)
 REDUCE=no			# reduce-size logging
-#ROTATESIZE=0			# rotate log if grown beyond X [kByte] (incompatible with busybox)
-#ROTATEGENS=3			# keep X generations of rotated logs (incompatible with busybox)
+#ROTATESIZE=0			# rotate log if grown beyond X [kByte]
+#ROTATEGENS=3			# keep X generations of rotated logs
 BUFFERSIZE=64			# size of circular buffer [kByte]
 FOREGROUND=no			# run in foreground (don't use!)
-- 
1.7.7.5



