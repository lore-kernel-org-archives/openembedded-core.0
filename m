Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R3saw-0005zL-AD
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:45:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 09:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="17087348"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 09:40:42 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 03:13:13 -0700
Message-Id: <cover.1315994642.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] bug-fix for bug #1459
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
X-List-Received-Date: Wed, 14 Sep 2011 16:45:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


The reported issue gets fixed by the accompanying commit.

If the cmake is built on fedora 15 it also gets one extra symbol 
memcpy@@GLIBC_2.14. I tried various ways to get rid of this symbol from 
resulting binaries, but I could not get rid of it completely, Hence I did 
not add pieces of the patch to avoid that symbol. Still the memcpy symbol issue 
was not reported on the original bug, and for now the autobuilder should be happy 
with this commit.

The following changes since commit ce66e2c6bd117d1a40b547b10b376524f9276d16:

  core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:29:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  cmake-native: fix symbol not found error on old distros

 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb  |    4 ++-
 .../cmake/fix_for_running_on_older_distros.diff    |   26 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/fix_for_running_on_older_distros.diff

-- 
1.7.6



