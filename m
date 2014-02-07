Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 62B416E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:55:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2014 08:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,801,1384329600"; d="scan'208";a="479730362"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.102])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2014 08:55:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 08:55:26 -0800
Message-Id: <cover.1391791450.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [Consolidated Pull 00/21] Various Patches & some updates
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
X-List-Received-Date: Fri, 07 Feb 2014 16:55:25 -0000

Richard,

This patch set has been through the Autobuilder, the current failures
related to the kernel update as we had a clean master build prior to this.

Thanks
	Sau!

The following changes since commit cda502815c6acf789e1a0db7a7a1a7015b4ef71d:

  build-appliance-image: Update to poky commit b37dd451a52622d5b570183a81583cc34c2ff555 (2014-02-06 15:36:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandre Belloni (1):
  matchbox-keyboard: daemonize launch

Bruce Ashfield (1):
  kernel: stop using -exec rm for deleting files

Chen Qi (1):
  initscripts: add initscripts-functions-dev package

Chong Lu (2):
  acl: enable ptest support
  attr: enable ptest support

Cristian Iorga (2):
  sbc: upgrade to 1.2
  bluez5: upgrade to 5.14

Fathi Boudra (1):
  systemtap: add aarch64 support

Jason Plum (1):
  meta/oe/lib/path.py - check mount points, not device

Kai Kang (1):
  eglibc-dbg: provides libc6-dbg

Khem Raj (1):
  ossp-uuid: Use alternative source mirror

Koen Kooi (3):
  systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
  openssh: package sshd PAM config inside openssh-sshd package
  openssh: drag in required PAM modules.

Martin Jansa (1):
  package.bbclass: add SHLIBSSEARCHDIRS to define where to search for
    shlib providers

Paul Eggleton (1):
  classes/populate_sdk_base: remove nostamp from do_populate_sdk

Randy MacLeod (1):
  jpeg and directfb: cosmetic, fix perms for patches

Saul Wold (1):
  rootfs_deb: Fix whitespace issue

Stefan Stanacar (3):
  testimage: add ability to export tests
  lib/oeqa: add module for running tests outside of the build system
  oeqa/utils: targetbuild: don't use bb.fetch anymore

 meta/classes/kernel.bbclass                        |  18 ++-
 meta/classes/package.bbclass                       |  26 +++-
 meta/classes/populate_sdk_base.bbclass             |   1 -
 meta/classes/rootfs_deb.bbclass                    |   2 +-
 meta/classes/testimage.bbclass                     | 107 +++++++++++++---
 meta/lib/oe/path.py                                |  13 +-
 meta/lib/oeqa/oetest.py                            |  17 +--
 meta/lib/oeqa/runexported.py                       | 140 +++++++++++++++++++++
 meta/lib/oeqa/utils/targetbuild.py                 |  27 ++--
 meta/recipes-connectivity/bluez5/bluez5_5.13.bb    |   5 -
 meta/recipes-connectivity/bluez5/bluez5_5.14.bb    |   5 +
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |   5 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |   2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   4 +-
 .../jpeg/jpeg-8d/debian-libjpeg7_7-1.diff          |   0
 meta/recipes-core/systemd/systemd_208.bb           |   6 +
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   2 +-
 .../directfb/directfb/fusion.patch                 |   0
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   9 +-
 .../sbc/{sbc_1.1.bb => sbc_1.2.bb}                 |  10 +-
 .../matchbox-keyboard/files/80matchboxkeyboard.sh  |   3 +
 ...oxkeyboard.shbg => matchbox-keyboard-daemon.sh} |   1 -
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   8 +-
 meta/recipes-support/attr/acl.inc                  |  14 ++-
 meta/recipes-support/attr/acl/run-ptest            |   7 ++
 meta/recipes-support/attr/attr.inc                 |  17 ++-
 meta/recipes-support/attr/files/run-ptest          |   5 +
 27 files changed, 373 insertions(+), 81 deletions(-)
 create mode 100755 meta/lib/oeqa/runexported.py
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.13.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb
 mode change 100755 => 100644 meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
 mode change 100755 => 100644 meta/recipes-graphics/directfb/directfb/fusion.patch
 rename meta/recipes-multimedia/sbc/{sbc_1.1.bb => sbc_1.2.bb} (45%)
 create mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
 rename meta/recipes-sato/matchbox-keyboard/files/{80matchboxkeyboard.shbg => matchbox-keyboard-daemon.sh} (99%)
 create mode 100644 meta/recipes-support/attr/acl/run-ptest
 create mode 100644 meta/recipes-support/attr/files/run-ptest

-- 
1.8.3.1


