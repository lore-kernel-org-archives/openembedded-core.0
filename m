Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RlTdU-0007Y1-87
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Jan 2012 14:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55951840"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jan 2012 14:20:36 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 14:20:33 -0800
Message-Id: <cover.1326406744.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/7] Misc recipe fixes and upgrades
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 0f4d99d207b224bb9ce23de00a48f795ae20b3a0:

  multilib.conf: Clean up file and add missing entries for various dependencies (2012-01-11 23:53:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (7):
  locale: fix package's "provides" tag
  diffstat: upgrade from 1.54 to 1.55
  insane.bbclass: fix elf.arch not matching error for x32 kernel
  libpcre: upgrade from 8.20 to 8.21
  btrfs-tools: upgrade to newer git commit
  distro_tracking: update manual_check_date fields
  grub-efi-native: fix errors with automake 1.11.2

 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/libc-package.bbclass                  |    3 -
 .../conf/distro/include/distro_tracking_fields.inc |   36 +-
 .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5888 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    5 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |    4 +-
 .../{diffstat_1.54.bb => diffstat_1.55.bb}         |    6 +-
 .../libpcre/{libpcre_8.20.bb => libpcre_8.21.bb}   |    5 +-
 9 files changed, 5922 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
 rename meta/recipes-devtools/diffstat/{diffstat_1.54.bb => diffstat_1.55.bb} (82%)
 rename meta/recipes-support/libpcre/{libpcre_8.20.bb => libpcre_8.21.bb} (93%)

-- 
1.7.6.4



