Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R7IGk-0005c9-TG
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Sep 2011 04:47:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2011 19:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="55417433"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.14])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2011 19:41:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 19:41:44 -0700
Message-Id: <cover.1316832041.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Fix for bad links in sstate
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
X-List-Received-Date: Sat, 24 Sep 2011 02:47:11 -0000

Richard, 

This fixes a problem found on the AB when sstate from one machine
is used on by another machine.

Sau!

The following changes since commit 368b150416688654e35229a63b87177b52e83d02:

  populate_sdk_rpm: add pkgconfig(pkg-config) to the list (2011-09-23 19:55:43 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  attr/acl: add SSTATEPOSTINSTFUNC

 meta/recipes-support/attr/acl_2.2.51.bb  |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb |    2 +-
 meta/recipes-support/attr/ea-acl.inc     |   11 +++++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
1.7.6



