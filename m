Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R7XUL-0008R9-4v
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Sep 2011 21:02:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2011 11:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,435,1312182000"; d="scan'208";a="20265176"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.14])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2011 11:56:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Sep 2011 11:56:46 -0700
Message-Id: <cover.1316890497.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] v2 of attr/acl with qemuimage-testlib fix
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
X-List-Received-Date: Sat, 24 Sep 2011 19:02:13 -0000

Richard, 

These 2 patches would be for edison

Sau!

The following changes since commit 368b150416688654e35229a63b87177b52e83d02:

  populate_sdk_rpm: add pkgconfig(pkg-config) to the list (2011-09-23 19:55:43 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (2):
  attr/acl: add SSTATEPOSTINSTFUNC
  qemuimage-testlib: set a default geometry for xterm

 meta/recipes-support/attr/acl_2.2.51.bb  |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb |    2 +-
 meta/recipes-support/attr/ea-acl.inc     |   17 +++++++++++++++++
 scripts/qemuimage-testlib                |    4 ++--
 4 files changed, 21 insertions(+), 4 deletions(-)

-- 
1.7.6



