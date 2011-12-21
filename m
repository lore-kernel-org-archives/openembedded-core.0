Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RdRvk-0008W3-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:34:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 11:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104762090"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2011 11:27:14 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 11:27:11 -0800
Message-Id: <cover.1324495514.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Cc: "H.J. Lu" <hjl.tools@gmail.com>
Subject: [PATCH 0/3] misc fixes
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
X-List-Received-Date: Wed, 21 Dec 2011 19:34:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here are few misc fixes for oecore.

Thanks,
Nitin

The following changes since commit dee0fc1462ba18551571c3b2d0f2b443a2feca18:

  multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

H.J. Lu (1):
  gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure

Nitin A Kamble (2):
  bitbake.conf multilib.conf: move the definition of baselib
  binutils: fix building on distros with matching binutils version

 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/multilib.conf                            |    2 -
 .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 +-
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   24 ++++++++-----------
 7 files changed, 15 insertions(+), 21 deletions(-)

-- 
1.7.6.4



