Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QfEvt-0004qT-6m
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:33:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 10:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24991273"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2011 10:29:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:29:38 -0700
Message-Id: <cover.1310145969.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH v2 0/4] rootfs space issue along with eglibc and libx11
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
X-List-Received-Date: Fri, 08 Jul 2011 17:33:41 -0000

Richard,

This is v2 of my patch set with updated commit messages and 
reworked changes.  I grabbed the oe-dev change for ldd bashims,
but still included the RDEPENDS for others until the maintainers 
update the scripts.

Thanks
	Sau!

The following changes since commit 93ce74a299832ca7f24b4ce1b951abffa0232612:

  libc-common.bbclass: Fix typo (2011-07-08 18:08:26 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (4):
  rootfs_rpm: Add 50M to IMAGE_ROOTFS_EXTRA_SPACE for zypper /var space
  eglibc: unbash ldd (from oe.dev)
  eglibc: add RDEPENDS for bash on eglibc-utils
  libx11: enable xcb support

 meta/classes/rootfs_rpm.bbclass                |    5 +++++
 meta/recipes-core/eglibc/eglibc-package.inc    |    2 +-
 meta/recipes-core/eglibc/eglibc.inc            |    3 +--
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |   11 ++++++++---
 4 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.7.3.4



