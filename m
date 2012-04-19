Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL0Eg-0006ny-2B
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:53:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Apr 2012 15:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134590345"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2012 15:44:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Thu, 19 Apr 2012 15:44:14 -0700
Message-Id: <cover.1334875218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/10] Updates and Packaging fixes
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
X-List-Received-Date: Thu, 19 Apr 2012 22:53:58 -0000

Richard,

Here is a small batch of updates along with some final packaging
tweaks, not that I modified the kernel.bbclass and changed quilt
to have the native recipe provide the quiltrc.

I also added a gcc-plugins package for an ARM plugin.

I will be creating a consolidated pull with these later today along with
many community based changes.

Sau!  

The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (10):
  binutils: add embedspu for ppc builds
  libgcc: Package additional *crt*.o files for PPC
  xserver-kdrive: Add xkb to existing docs list
  kernel: Fix packaging issue
  gcc: Add plugins package for ARM, fix /usr/incude packaging
  quilt: move empty quiltrc to native
  sysstat: Upgrade to 10.0.3
  lame: Upgrade to 3.99.5
  sqlite3: Upgrade to 3.7.11
  distro_tracking: Update Manual Check

 meta/classes/kernel.bbclass                        |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   58 ++++++++++----------
 meta/recipes-devtools/binutils/binutils.inc        |    1 +
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    8 +++-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 meta/recipes-devtools/quilt/quilt-0.51.inc         |    5 --
 meta/recipes-devtools/quilt/quilt-native.inc       |    6 ++
 meta/recipes-devtools/quilt/quilt-native_0.51.bb   |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb          |    2 +-
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    8 ---
 meta/recipes-extended/sysstat/sysstat_10.0.4.bb    |    8 +++
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 .../lame/{lame_3.99.3.bb => lame_3.99.5.bb}        |    4 +-
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |   11 ----
 meta/recipes-support/sqlite/sqlite3_3.7.11.bb      |   11 ++++
 15 files changed, 71 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.3.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.4.bb
 rename meta/recipes-multimedia/lame/{lame_3.99.3.bb => lame_3.99.5.bb} (86%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.10.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.11.bb

-- 
1.7.7.6



