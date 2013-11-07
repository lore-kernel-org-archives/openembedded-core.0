Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E0B196D39D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 23:31:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2013 15:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,655,1378882800"; d="scan'208";a="429720009"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.29])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2013 15:31:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 15:31:19 -0800
Message-Id: <cover.1383866841.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/17]
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
X-List-Received-Date: Thu, 07 Nov 2013 23:31:21 -0000

Richard,

Built tested and reviewed.

This adds ORC from meta-oe to support gstreamer 1.2, I have also included 
Peter's U-A replacement for binutils-symlinks.

Sau!


The following changes since commit 1dbd65b4d14319e784a66776c1e9943d0179d3ee:

  toolchain-scripts/meta-environment: Further cleanup code duplication (2013-11-06 11:02:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alex J Lennon (1):
  sqlite3: Add support for column metadata API

Carlos Rafael Giani (1):
  orc: version 0.4.18 migrated from meta-oe

Chen Qi (2):
  bootlogd: create log file if not present
  sysvinit: adjust boot sequence and remove hack from udev

Hongxu Jia (1):
  qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+,
    libcap-ng

Jonathan Liu (2):
  eglibc_2.18.bb: accept make versions 4.0 and greater
  eglibc_2.17.bb: accept make versions 4.0 and greater

Laurentiu Palcu (1):
  flex: fix m4 issue on target

Lu Chong (2):
  makedevs: several fixes
  ppp: Fix compilation errors in Makefile

Peter Seebach (2):
  binutils: Use alternatives for the binutils-symlinks package.
  binutils: Drop binutils-symlinks

Richard Purdie (1):
  lib/oe/sstatesig: Ensure packagegroups don't continually rebuild

Saul Wold (3):
  kbd: upgrade to 2.0.1
  nspr: Update to 4.10.1
  binutils: remove embedspu

Stefan Stanacar (1):
  lib/oeqa/utils: sshcontrol: make timeout depend on output

 meta/lib/oe/sstatesig.py                           |  7 ++
 meta/lib/oeqa/utils/sshcontrol.py                  | 41 ++++++++----
 ...01-ppp-Fix-compilation-errors-in-Makefile.patch | 75 ++++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |  1 +
 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch  | 31 +++++++++
 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch  | 31 +++++++++
 meta/recipes-core/eglibc/eglibc_2.17.bb            |  1 +
 meta/recipes-core/eglibc/eglibc_2.18.bb            |  1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +-
 .../kbd/{kbd_2.0.0.bb => kbd_2.0.1.bb}             |  4 +-
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init  |  4 +-
 meta/recipes-core/udev/udev.inc                    |  2 +-
 meta/recipes-core/udev/udev/init                   |  4 +-
 meta/recipes-devtools/binutils/binutils.inc        | 72 ++++++++++++---------
 meta/recipes-devtools/flex/flex.inc                |  5 ++
 .../makedevs/makedevs-1.0.0/makedevs.c             | 18 +++++-
 meta/recipes-devtools/orc/orc.inc                  | 25 ++++++++
 meta/recipes-devtools/orc/orc_0.4.18.bb            |  6 ++
 meta/recipes-devtools/qemu/qemu.inc                | 19 +++++-
 .../modutils-initscripts/modutils-initscripts.bb   |  2 +-
 .../nspr/{nspr_4.10.bb => nspr_4.10.1.bb}          |  4 +-
 meta/recipes-support/sqlite/sqlite3_3080002.bb     |  5 ++
 22 files changed, 302 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
 rename meta/recipes-core/kbd/{kbd_2.0.0.bb => kbd_2.0.1.bb} (87%)
 create mode 100644 meta/recipes-devtools/orc/orc.inc
 create mode 100644 meta/recipes-devtools/orc/orc_0.4.18.bb
 rename meta/recipes-support/nspr/{nspr_4.10.bb => nspr_4.10.1.bb} (96%)

-- 
1.8.3.1


