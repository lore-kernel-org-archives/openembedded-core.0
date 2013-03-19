Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI550-0003A7-8E
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="304767348"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:00 -0700
Message-Id: <cover.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/6] mkefidisk: Various fixes for 1.4 M6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 22:32:28 -0000

Fix bugs 4035 and 4036 as well as several other issues with mkefidisk.sh
without bugs reported.

The following changes since commit ee416ad6f4b0209f7ad7d54467e0d7d5e097dd2a:

  bitbake: utils.py: fix BB_ENV_WHITELIST (2013-03-19 13:56:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/mkefidisk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/mkefidisk

Darren Hart (6):
  mkefidisk: Cleanup comment length
  mkefidisk: Always specify a root= kernel parameter
  mkefidisk: Boot with ro kernel parameter instead of rw
  mkefidisk: Always use rootwait and document kernel parameters used
  mkefidisk: Remove startup.nsh
  mkefidisk: Use msdos partition tables

 scripts/contrib/mkefidisk.sh | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

-- 
1.8.1.2



