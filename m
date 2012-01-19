Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKQ-0004D6-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472088"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:26 -0800
Message-Id: <5b2dcbde7290616104afe5f20c67f87dbc734939.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/33] busybox: remove incorrect comments from syslog-startup.conf
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:42 -0000

From: Joshua Lock <josh@linux.intel.com>

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
1.7.6.5



