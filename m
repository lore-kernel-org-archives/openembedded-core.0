Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFb-0003tW-Ad
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:29:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 15:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,233,1304319600"; 
   d="scan'208";a="4254752"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2011 15:26:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:38 -0700
Message-Id: <cover.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Koen Kooi <koen@dominion.thruhere.net>, Yi Zhao <yi.zhao@windriver.com>,
	Robert Berger <pokylinux@reliableembeddedsystems.com>,
	Paul Eggleton <paul.eggleton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 00/30] 18-May-2011 Consolidated Pull
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
X-List-Received-Date: Wed, 18 May 2011 22:29:55 -0000

This has a few core fixes to master for broken builds, utils.bbclass
address the perl failure and qt4-tools-native address a qt4 failure.

Additional this has Darren's new create/send pull request along with
fixes for 4.6 and libc overrides.

Thanks
  Sau!


The following changes since commit 1eb0207a7ae8cbc31ecde313a020ed4f12f70dd8:

  qt4: re-enable two 4.6.x patches in 4.7.3 (2011-05-18 14:32:28 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib.git sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto: fix gcc 4.6.0 compilation failures

Darren Hart (14):
  create-pull-request: alphabetize arguments
  create-pull-request: whitespace cleanup
  create-pull-request: use git request-pull and arbitrary remotes
  create-pull-request: rewrite known private URLs to public URLs
  create-pull-request: provide an RFC mode via -c argument
  send-pull-request: whitespace cleanup
  send-pull-request: remove local mta support
  send-pull-request: fix greedy auto-cc regex
  send-pull-request: don't send all patches to everyone even with -a
  send-pull-request: verify git sendemail config
  create-pull-request: add untested oe repository support
  send-pull-request: streamline git-send-email usage
  *pull-request: add copyright, license, and descriptions
  u-boot: update SRCREV to 2011.03

Dexuan Cui (1):
  package-index.bb: add support for deb and rpm.

Jessica Zhang (2):
  extract bitbake config setting into data_define, use more variables
    replacing hardcoded values
  Add adt repo checking

Koen Kooi (5):
  diffutils: fix libc overrides
  findutils: fix libc overrides
  lsof: fix libc overrides
  sysstat: fix libc overrides
  tcp-wrappers: fix libc overrides

Otavio Salvador (2):
  create-pull-request: do not check certificate
  create-pull-request: add GitHub remote support

Saul Wold (4):
  utils.bbclass: modify create_wrapper to correctly follow symlinks
  mklibs-native: Update to 0.1.33
  usbutils: Update to 0.91
  qt4-tools-native: Fix the patch location

Xiaofeng Yan (1):
  lsbsetup: Rename this file and add a link for lsb test

 meta/classes/package_deb.bbclass                   |    9 +
 meta/classes/package_ipk.bbclass                   |    9 +
 meta/classes/package_rpm.bbclass                   |    9 +
 meta/classes/utils.bbclass                         |    3 +-
 meta/recipes-bsp/uboot/u-boot_git.bb               |    8 +-
 .../{usbutils_0.86.bb => usbutils_0.91.bb}         |    2 +-
 meta/recipes-core/meta/package-index.bb            |    6 +-
 .../installer/adt-installer/adt_installer          |   15 +-
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    4 +-
 .../installer/adt-installer/scripts/data_define    |    1 -
 .../installer/adt-installer_1.0.bb                 |    4 +-
 .../mklibs/files/ac_init_fix.patch                 |    2 +
 .../mklibs/files/fix_STT_GNU_IFUNC.patch           |    3 +
 ...bs-native_0.1.31.bb => mklibs-native_0.1.33.bb} |    2 +-
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    2 +-
 meta/recipes-extended/diffutils/diffutils_3.0.bb   |    2 +-
 meta/recipes-extended/findutils/findutils.inc      |    2 +-
 .../recipes-extended/findutils/findutils_4.2.31.bb |    2 +-
 meta/recipes-extended/lsb/lsbsetup_0.9.bb          |   25 --
 meta/recipes-extended/lsb/lsbsetup_1.0.bb          |   27 ++
 meta/recipes-extended/lsof/lsof_4.84.bb            |    4 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    4 +-
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    3 +-
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   12 +-
 meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb      |    4 +-
 scripts/create-pull-request                        |  222 ++++++++++----
 scripts/send-pull-request                          |  307 +++++++++-----------
 28 files changed, 406 insertions(+), 289 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_0.86.bb => usbutils_0.91.bb} (91%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.31.bb => mklibs-native_0.1.33.bb} (98%)
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup_0.9.bb
 create mode 100644 meta/recipes-extended/lsb/lsbsetup_1.0.bb

-- 
1.7.3.4



