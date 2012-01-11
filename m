Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rl5Of-0003vX-DU
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 22:07:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 13:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111235415"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.12])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2012 13:00:05 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 12:59:58 -0800
Message-Id: <cover.1326315477.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
Subject: [RFC PATCH 0/5] Busybox syslog tweaks
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
X-List-Received-Date: Wed, 11 Jan 2012 21:07:49 -0000

This RFC series makes some minor changes to the configuration of busybox's
syslog. The only one I think may be contentious, and why I've made this an RFC,
is the 4th patch "busybox: change syslog default to log to a file" which changes
the long-default behaviour.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

Cheers,
Joshua

The following changes since commit d5b8caac0e7fc4b05c76b4d3da0508e2a53f28cd:

  package.bbclass: per recipe PRSERV_HOST support (2012-01-11 10:33:24 +0000)

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



