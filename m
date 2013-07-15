Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 48E54608BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:23:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2013 00:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,667,1367996400"; d="scan'208";a="331428796"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.97])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2013 00:23:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 00:23:38 -0700
Message-Id: <cover.1373872671.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/18] Final Review Pending
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2013 07:23:38 -0000

Ross, Paul:

Please do a review of this set from over the weekend.

Hongxu's patch set includes an atom-pc patch that should have 
been on poky, I removed it from here.

I have reviewed the 2 package from the Auto Package Update (my
recipes) and they are correct.

Thanks
	Sau!


The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:

  distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru Palalau (1):
  lib/oeqa/runtime: add tests for syslog and df

Auto Package Upgrade (2):
  libidn: upgrade to 1.28
  mc: upgrade to 4.8.9

Chen Qi (1):
  core-image-lsb.bb: add 'package-management' to IMAGE_FEATURES

Hongxu Jia (5):
  pmount: add version 0.9.23
  udev-extraconf:fix xuser write to usb storage failed
  udev: fix invoking pmount failed based on sysvinit
  pmount: allow users in disk group to perform pmount/pumount
  xuser-account: add xuser to disk group

Laurentiu Palcu (1):
  xinput-calibrator: move it from meta-oe to oe-core

Saul Wold (1):
  initscripts: Update to 9.48

Stefan Stanacar (7):
  lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
    interface name
  lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
  testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
    configurable and increase it
  lib/oeqa/runtime/multilib.py: use readelf instead of file
  lib/oeqa/oetest.py: provide a ps command for all tests
  classes/testimage.bbclass: use a copy of rootfs for tests
  testimage.bbclass, lib/oeqa: add headers and comments

 meta/classes/testimage.bbclass                     |  43 +++++++-
 meta/lib/oeqa/oetest.py                            |  14 ++-
 meta/lib/oeqa/runtime/connman.py                   |   5 -
 meta/lib/oeqa/runtime/df.py                        |  13 +++
 meta/lib/oeqa/runtime/dmesg.py                     |   2 +-
 meta/lib/oeqa/runtime/multilib.py                  |   9 +-
 meta/lib/oeqa/runtime/syslog.py                    |  34 ++++++
 meta/lib/oeqa/utils/decorators.py                  |   8 ++
 meta/lib/oeqa/utils/qemurunner.py                  |  12 +--
 meta/lib/oeqa/utils/sshcontrol.py                  |  49 ++++-----
 meta/recipes-core/udev/udev-extraconf/mount.sh     |  31 +++++-
 meta/recipes-core/udev/udev/init                   |   1 +
 meta/recipes-extended/images/core-image-lsb.bb     |   2 +-
 .../libidn/{libidn_1.27.bb => libidn_1.28.bb}      |   4 +-
 ...binitscripts_9.47.bb => lsbinitscripts_9.48.bb} |   6 +-
 .../mc/{mc_4.8.8.bb => mc_4.8.9.bb}                |   4 +-
 ...-option-f-to-mount-already-mounted-device.patch | 115 +++++++++++++++++++++
 meta/recipes-extended/pmount/pmount_0.9.23.bb      |  34 ++++++
 .../pointercal-xinput/pointercal.xinput            |   1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |  18 ++++
 .../xinput-calibrator/30xinput_calibrate.sh        |   7 ++
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |  66 ++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |  30 ++++++
 .../user-creation/xuser-account_0.1.bb             |   2 +-
 24 files changed, 455 insertions(+), 55 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py
 mode change 100644 => 100755 meta/recipes-core/udev/udev-extraconf/mount.sh
 rename meta/recipes-extended/libidn/{libidn_1.27.bb => libidn_1.28.bb} (91%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.47.bb => lsbinitscripts_9.48.bb} (78%)
 rename meta/recipes-extended/mc/{mc_4.8.8.bb => mc_4.8.9.bb} (93%)
 create mode 100644 meta/recipes-extended/pmount/files/pmount-add-option-f-to-mount-already-mounted-device.patch
 create mode 100644 meta/recipes-extended/pmount/pmount_0.9.23.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.8.1.4


