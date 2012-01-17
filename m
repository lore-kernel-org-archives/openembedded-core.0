Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RnENP-0001Mz-QD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:07:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 10:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99658541"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.216])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 10:59:43 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 10:59:39 -0800
Message-Id: <d3cafd54bd36ccfa3e8600e7f75578fdc6fb8aed.1326826646.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
Subject: [PATCH 4/5] busybox: change syslog default to log to a file
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
X-List-Received-Date: Tue, 17 Jan 2012 19:07:24 -0000

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
1.7.7.5



