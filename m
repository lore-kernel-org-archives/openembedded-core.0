Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QXPLw-00034H-0z
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 05:04:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2011 20:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,379,1304319600"; d="scan'208";a="17308206"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2011 20:00:40 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org, jmitchell@ll.mit.edu,
	dvhart@linux.intel.com
Date: Fri, 17 Jun 2011 11:00:21 +0800
Message-Id: <cover.1308278404.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH 0/1] bump PR to fix the perl-native issue
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
X-List-Received-Date: Fri, 17 Jun 2011 03:04:12 -0000

I did a core-image-sato-sdk and meta-toolchain-gmae building using a commit
of May 12 between 605141a9(the perl-native workaround patch) and
3ba6d018(populate perl-native into its own dir), and grepped
${STAGING_BINDIR_NATIVE}/perl in
${STAGING_BINDIR_NATIVE} to find out all the scripts needed to address. Some
recipes' PRs have been bumped, so this patch only bumps the omitted ones.

Please review the patch.

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/bump_PR
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bump_PR

Dexuan Cui (1):
  glib-2.0,intltool,rpm,sgmlspl-native: Bump PR to resolve perl-native
    issue

 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |    2 +-
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.2



