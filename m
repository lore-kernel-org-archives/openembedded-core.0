Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKP-0004Cw-QC
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472086"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:25 -0800
Message-Id: <0e85cd35a71fe14adc3da9b756b919836b687a12.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/33] busybox: drop MARKINT option from init script and syslog-startup.conf
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

This option has been disabled in busybox since 2007 as it was deemed too
buggy. See:

http://git.busybox.net/busybox/commit/?id=4998c818919477d90674a3f220e7407c26da17f9

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/busybox/files/syslog             |    3 ---
 .../recipes-core/busybox/files/syslog-startup.conf |    1 -
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 5ff6599..0be412b 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -37,9 +37,6 @@ if [ -f /etc/syslog-startup.conf ]; then
 	if [ "$LOG_LOCAL" = "1" -a "$LOG_REMOTE" = "1" ]; then
 		SYSLOG_ARGS="$SYSLOG_ARGS -L"
 	fi
-	if [ -n "$MARKINT" ]; then
-		SYSLOG_ARGS="$SYSLOG_ARGS -m $MARKINT"
-	fi
 	if [ "$REDUCE" = "yes" ]; then
 		SYSLOG_ARGS="$SYSLOG_ARGS -S"
 	fi
diff --git a/meta/recipes-core/busybox/files/syslog-startup.conf b/meta/recipes-core/busybox/files/syslog-startup.conf
index 903a60c..1e4c559 100644
--- a/meta/recipes-core/busybox/files/syslog-startup.conf
+++ b/meta/recipes-core/busybox/files/syslog-startup.conf
@@ -2,7 +2,6 @@
 # /etc/init.d/syslog[.busybox] to set syslog configuration at start time.
 
 DESTINATION=buffer		# log destinations (buffer file remote)
-MARKINT=20			# interval between --mark-- entries
 LOGFILE=/var/log/messages	# where to log (file)
 REMOTE=loghost:514		# where to log (syslog remote)
 REDUCE=no			# reduce-size logging
-- 
1.7.6.5



