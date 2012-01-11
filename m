Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rl5Oj-0003vf-Mo
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 22:07:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 13:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111235432"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.12])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2012 13:00:06 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 13:00:02 -0800
Message-Id: <684f4fe17d6365ec48993036fac6c69fd0491533.1326315478.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326315477.git.josh@linux.intel.com>
References: <cover.1326315477.git.josh@linux.intel.com>
In-Reply-To: <cover.1326315477.git.josh@linux.intel.com>
References: <cover.1326315477.git.josh@linux.intel.com>
Subject: [RFC PATCH 4/5] busybox: change syslog default to log to a file
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
X-List-Received-Date: Wed, 11 Jan 2012 21:07:53 -0000

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



