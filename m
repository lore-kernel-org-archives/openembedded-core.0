Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RnGIu-0008Lg-OF
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 22:10:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jan 2012 13:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108067256"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2012 13:03:05 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 13:03:03 -0800
Message-Id: <cover.1326834014.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCHv2 0/6] resend with typo fixes & distro tracking data
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
X-List-Received-Date: Tue, 17 Jan 2012 21:10:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This is same as last pull requests + typo fixes + a commit for adding distro
tracking information for the new recipes.

Thanks,
Nitin

The following changes since commit 5724ee9c3a99519fea96446638910b727b89898d:

  package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:54 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (6):
  bdwgc: new recipe for autogen
  libunistring: new recipe for autogen
  guile: new recipe for autogen
  autogen-native: new recipe for grub-efi-native
  grub-efi-native: fix errors with automake 1.11.2
  distro-tracking: add data for newer recipes

 .../conf/distro/include/distro_tracking_fields.inc |   21 +
 .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5808 --------------------
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
 .../autogen/autogen-native_5.12.bb                 |   24 +
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 +
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 +
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 +
 .../guile/files/opensuse/guile-64bit.patch         |   38 +
 .../files/opensuse/guile-turn-off-gc-test.patch    |   48 +
 meta/recipes-devtools/guile/guile_2.0.3.bb         |   42 +
 meta/recipes-support/bdwgc/bdwgc_20110107.bb       |   38 +
 .../libunistring/libunistring_0.9.3.bb             |   27 +
 12 files changed, 324 insertions(+), 5810 deletions(-)
 create mode 100644 meta/recipes-devtools/autogen/autogen-native_5.12.bb
 create mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
 create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
 create mode 100644 meta/recipes-devtools/guile/guile_2.0.3.bb
 create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
 create mode 100644 meta/recipes-support/libunistring/libunistring_0.9.3.bb

-- 
1.7.6.4



