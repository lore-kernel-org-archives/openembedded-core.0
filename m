Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F00B8610F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:53:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Oct 2013 08:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,602,1378882800"; d="scan'208";a="425276073"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.29])
	by fmsmga002.fm.intel.com with ESMTP; 30 Oct 2013 08:53:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 08:53:48 -0700
Message-Id: <cover.1383148391.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 30 Oct 2013 15:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Reviewed and built on AB yesterday.

Sau!

The following changes since commit 58ae94f1b06d0e6234413dbf9869bde85f154c85:

  recipes: Remove PR = r0 from all recipes (2013-10-30 14:51:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (1):
  systemd-compat-units: run-postinsts fix script link

Cristian Iorga (4):
  libuser: upgrade to 0.60
  iproute2: upgrade to 3.11.0
  telepathy-mission-control: upgrade to 5.16.0
  telepathy-glib: upgrade to 0.23.0

Hongxu Jia (1):
  coreutils: support command arch

Joe Slater (1):
  vala.bbclass: add dependency on vala

Paul Barrette (1):
  lsb: add begin function to lsb_log_message

Qiang Chen (1):
  nfs-utils: modify nfsserver init script indent

Richard Purdie (1):
  cross-canadian: Handle powerpc linux verses linux-gnuspe

Riku Voipio (3):
  ltp: cleanup recipe
  ltp: Fix aarch64 build
  ltp: enable power management and realtime tests

Seth Bollinger (1):
  ncurses-terminfo: Remove bashism from basic terminfo installation

Søren Holm (1):
  e2fsprogs: Escape filenames in populate-extfs.sh

Valentin Popa (2):
  shared-mime-info: upgrade to 1.2
  libx11: upgrade to 1.6.2

 meta/classes/cross-canadian.bbclass                | 31 ++++++++++++
 meta/classes/vala.bbclass                          |  9 ++--
 .../{iproute2_3.10.0.bb => iproute2_3.11.0.bb}     |  4 +-
 .../nfs-utils/nfs-utils/nfsserver                  | 12 ++---
 ...thy-glib_0.20.4.bb => telepathy-glib_0.23.0.bb} |  5 +-
 ...15.0.bb => telepathy-mission-control_5.16.0.bb} |  4 +-
 meta/recipes-core/coreutils/coreutils_8.21.bb      |  3 +-
 meta/recipes-core/ncurses/ncurses.inc              |  2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |  8 ++-
 .../systemd-compat-units/run-postinsts.service     |  4 +-
 .../binutils/binutils-cross-canadian.inc           |  2 +
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   | 20 ++++----
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |  5 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |  1 +
 meta/recipes-devtools/opkg/opkg.inc                |  2 +
 .../libuser/{libuser_0.59.bb => libuser_0.60.bb}   |  4 +-
 meta/recipes-extended/lsb/lsb/lsb_log_message      |  5 ++
 meta/recipes-extended/ltp/files/fix-arm64.patch    | 59 ++++++++++++++++++++++
 meta/recipes-extended/ltp/files/fix-pm-tests.patch | 30 +++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb          | 53 +++++++++----------
 .../{libx11-diet_1.6.1.bb => libx11-diet_1.6.2.bb} |  4 +-
 .../xorg-lib/libx11/X18NCMSstubs.diff              |  3 +-
 .../xorg-lib/{libx11_1.6.1.bb => libx11_1.6.2.bb}  |  4 +-
 .../shared-mime-info/parallelmake.patch            |  4 +-
 ...ed-mime-info_1.1.bb => shared-mime-info_1.2.bb} |  4 +-
 25 files changed, 210 insertions(+), 72 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.10.0.bb => iproute2_3.11.0.bb} (64%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.20.4.bb => telepathy-glib_0.23.0.bb} (80%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.15.0.bb => telepathy-mission-control_5.16.0.bb} (93%)
 rename meta/recipes-extended/libuser/{libuser_0.59.bb => libuser_0.60.bb} (88%)
 create mode 100644 meta/recipes-extended/ltp/files/fix-arm64.patch
 create mode 100644 meta/recipes-extended/ltp/files/fix-pm-tests.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.1.bb => libx11-diet_1.6.2.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.1.bb => libx11_1.6.2.bb} (47%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.1.bb => shared-mime-info_1.2.bb} (43%)

-- 
1.8.3.1


