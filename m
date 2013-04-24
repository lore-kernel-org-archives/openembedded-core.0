Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV3GC-0007uf-F7
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 19:13:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 09:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,542,1363158000"; d="scan'208";a="231596433"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 09:55:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 09:55:35 -0700
Message-Id: <cover.1366822441.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/11] Updates, license fixes and patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 17:13:46 -0000


Richard,

Some Fixes to Licesnes and Updates starting to roll in, I will have more later!

Sau!


The following changes since commit 395b90054eccddc1c9062a9a8657ed4482b7710a:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-22 15:48:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (2):
  pax-utils : upgrade to 0.7
  openssh : upgrade to 6.2p1

Chen Qi (1):
  udev: create /var/volatile/tmp to avoid dead link

Darren Hart (1):
  linux-firmware: Look for RTL license in the right directory

Otavio Salvador (1):
  udev-extraconf: Avoid mounting unknown filesystems

Paul Barker (2):
  common-licenses: fill in AGPL-3.0
  common-licenses: remove HTMLisms from OFL-1.1

Phil Blundell (3):
  openssl: Disable parallel make
  icu: Remove unnecessary FULL_OPTIMIZATION_arm setting
  kernel-arch: Always use ld.bfd to link the kernel

Ting Liu (1):
  ltp: upgrade to 20130109 release

 meta/classes/kernel-arch.bbclass                   |   2 +-
 meta/files/common-licenses/AGPL-3.0                | 660 ++++++++++++++++++++-
 meta/files/common-licenses/OFL-1.1                 |   4 +-
 .../openssh/{openssh-6.1p1 => openssh-6.2p1}/init  |   0
 .../{openssh-6.1p1 => openssh-6.2p1}/nostrip.patch |   0
 .../openssh-CVE-2011-4327.patch                    |   0
 .../{openssh-6.1p1 => openssh-6.2p1}/ssh_config    |   0
 .../openssh/{openssh-6.1p1 => openssh-6.2p1}/sshd  |   0
 .../{openssh-6.1p1 => openssh-6.2p1}/sshd_config   |   0
 .../openssh/{openssh_6.1p1.bb => openssh_6.2p1.bb} |   4 +-
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +
 meta/recipes-core/udev/udev-extraconf/mount.sh     |   2 +-
 meta/recipes-core/udev/udev/init                   |   1 +
 .../{pax-utils_0.6.bb => pax-utils_0.7.bb}         |   4 +-
 .../ltp/{ltp_20120903.bb => ltp_20130109.bb}       |  12 +-
 .../linux-firmware/linux-firmware_git.bb           |   2 +-
 meta/recipes-support/icu/icu.inc                   |   1 -
 17 files changed, 675 insertions(+), 18 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.1p1 => openssh-6.2p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.1p1.bb => openssh_6.2p1.bb} (96%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.6.bb => pax-utils_0.7.bb} (82%)
 rename meta/recipes-extended/ltp/{ltp_20120903.bb => ltp_20130109.bb} (90%)

-- 
1.8.0.2



