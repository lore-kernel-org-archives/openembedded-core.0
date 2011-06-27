Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qb7A7-00035b-NO
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 10:27:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jun 2011 01:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,431,1304319600"; d="scan'208";a="19007690"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2011 01:23:37 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 16:37:48 +0800
Message-Id: <cover.1309163663.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1 v3][PULL] libc locale split
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
X-List-Received-Date: Mon, 27 Jun 2011 08:27:20 -0000

Hi Richard and Saul,

This pull request is the third version of libc locale split, please help to review and pull.

Changes from v2:
Fixed a mistake that virtual/libiconv should be in libc but not libc-locale.

Thanks,
Dongxiao


The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:

  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/libc-locale-v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/libc-locale-v3

Dongxiao Xu (1):
  libc-locale: split locale handling from libc recipe.

 meta/classes/libc-common.bbclass                   |   23 ++++++++
 meta/classes/libc-package.bbclass                  |   24 --------
 meta/conf/distro/include/tclibc-eglibc.inc         |    1 +
 meta/conf/distro/include/tclibc-glibc.inc          |    1 +
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   56 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
 meta/recipes-core/eglibc/eglibc.inc                |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
 meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
 meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   49 +++++++++++++++++
 meta/recipes-core/glibc/glibc-package.inc          |   29 ++---------
 meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
 .../meta/external-csl-toolchain_2008q3-72.bb       |    1 +
 14 files changed, 171 insertions(+), 79 deletions(-)
 create mode 100644 meta/classes/libc-common.bbclass
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
 create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb



