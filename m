Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKQ-0004Cw-KL
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472090"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:28 -0800
Message-Id: <bbf44dddcc473ca085fa5b2dda5f89c22ec31cc0.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/33] busybox: change syslog default to log to a file
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:47 -0000

From: Joshua Lock <josh@linux.intel.com>

This changes the default in syslog-startup.conf to log messages
to a file (/var/log/messages) because:

a) we already mount /var/log as a volatile mount by default
b) users are accustomed to looking at /var/log/messages as
most distributions don't ship with logread

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../recipes-core/busybox/files/syslog-startup.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/files/syslog-startup.conf b/meta/recipes-core/busybox/files/syslog-startup.conf
index 83b86f2..553490b 100644
--- a/meta/recipes-core/busybox/files/syslog-startup.conf
+++ b/meta/recipes-core/busybox/files/syslog-startup.conf
@@ -1,7 +1,7 @@
 # This configuration file is used by the busybox syslog init script,
 # /etc/init.d/syslog[.busybox] to set syslog configuration at start time.
 
-DESTINATION=buffer		# log destinations (buffer file remote)
+DESTINATION=file		# log destinations (buffer file remote)
 LOGFILE=/var/log/messages	# where to log (file)
 REMOTE=loghost:514		# where to log (syslog remote)
 REDUCE=no			# reduce-size logging
-- 
1.7.6.5



