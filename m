Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rko1W-0004H0-Vk
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 03:34:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jan 2012 18:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95050664"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2012 18:27:15 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 18:27:13 -0800
Message-Id: <cover.1326248768.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/6] Misc recipe fixes & upgrades
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
X-List-Received-Date: Wed, 11 Jan 2012 02:34:47 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Thanks,
Nitin

The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324e494e:

  Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:33:25 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (6):
  locale: fix package's "provides" tag
  diffstat: upgrade from 1.54 to 1.55
  insane.bbclass: fix elf.arch not matching error for x32 kernel
  libpcre: upgrade from 8.20 to 8.21
  btrfs-tools: upgrade to newer git commit
  distro_tracking: update manual_check_date fields

 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/libc-package.bbclass                  |    3 --
 .../conf/distro/include/distro_tracking_fields.inc |   36 +++++++++++---------
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |    4 +-
 .../{diffstat_1.54.bb => diffstat_1.55.bb}         |    6 ++--
 .../libpcre/{libpcre_8.20.bb => libpcre_8.21.bb}   |    5 ++-
 7 files changed, 31 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.54.bb => diffstat_1.55.bb} (82%)
 rename meta/recipes-support/libpcre/{libpcre_8.20.bb => libpcre_8.21.bb} (93%)

-- 
1.7.6.4



