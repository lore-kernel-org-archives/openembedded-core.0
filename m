Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QZJ9j-0002ZF-Ai
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 10:51:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2011 01:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,405,1304319600"; d="scan'208";a="21333037"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2011 01:47:51 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 17:01:08 +0800
Message-Id: <cover.1308732995.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1 v2][PULL] libc locale split
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
X-List-Received-Date: Wed, 22 Jun 2011 08:51:27 -0000

Hi Richard and Saul,

This pull request is the second version of libc locale split, please
help to review and pull.

This version reflects the comments from Phil Blundell <pb@pbcl.net>
that keep the eglibc locale package name unchanged.

Thanks,
Dongxiao

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/libc-locale-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/libc-locale-v2

Dongxiao Xu (1):
  libc-locale: split locale handling from libc recipe.

 meta/classes/libc-common.bbclass                   |   23 ++++++++
 meta/classes/libc-package.bbclass                  |   24 --------
 meta/conf/distro/include/tclibc-eglibc.inc         |    2 +-
 meta/conf/distro/include/tclibc-glibc.inc          |    2 +-
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   58 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
 meta/recipes-core/eglibc/eglibc.inc                |    4 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
 meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
 meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   50 +++++++++++++++++
 meta/recipes-core/glibc/glibc-package.inc          |   29 ++---------
 meta/recipes-core/glibc/glibc.inc                  |    2 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
 .../meta/external-csl-toolchain_2008q3-72.bb       |    1 +
 15 files changed, 176 insertions(+), 83 deletions(-)
 create mode 100644 meta/classes/libc-common.bbclass
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
 create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb



