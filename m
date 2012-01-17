Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RnENM-0001Mz-HP
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:07:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 10:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99658524"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.216])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 10:59:42 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 10:59:35 -0800
Message-Id: <cover.1326826646.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
Subject: [PATCH 0/5] Busybox syslog tweaks
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
X-List-Received-Date: Tue, 17 Jan 2012 19:07:20 -0000

The RFC version of this series didn't receive any C's..

This set of changes makes some minor changes to the configuration of busybox's
syslog.

The following changes since commit a0f5dd25a37fe3b8664c2133e80b6214559f93f6:

  package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:46 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/syslog
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/syslog

Joshua Lock (5):
  busybox: drop MARKINT option from init script and syslog-startup.conf
  busybox: remove incorrect comments from syslog-startup.conf
  busybox: enable log level configuration in syslog-startup.conf and
    script
  busybox: change syslog default to log to a file
  busybox: enable dropping of duplicates in syslog, off by default

 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 meta/recipes-core/busybox/files/syslog             |    9 ++++++---
 .../recipes-core/busybox/files/syslog-startup.conf |    9 +++++----
 4 files changed, 13 insertions(+), 9 deletions(-)

-- 
1.7.7.5



