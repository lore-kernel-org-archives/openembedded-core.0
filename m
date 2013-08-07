Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E7BA66B5B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 10:48:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2013 03:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,832,1367996400"; d="scan'208";a="383195249"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.214])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2013 03:48:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 11:47:44 +0100
Message-Id: <cover.1375872311.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [dylan][PATCH 00/12] Backports from master (cover letter only)
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
X-List-Received-Date: Wed, 07 Aug 2013 10:48:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backports from the master branch. These have been tested on the Yocto
Project autobuilder.


The following changes since commit 319355e68006c0c7dca117d552e96a36dfef01c3:

  cups: add PACKAGECONFIG for avahi (2013-07-29 09:24:56 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Andre McCurdy (1):
  lib/oe/terminal.py: add support for MATE desktop terminals

André Draszik (1):
  directfb: don't patch pkg-config files

Laurentiu Palcu (1):
  csl-versions.inc: instruct user to check local.conf

Paul Eggleton (2):
  classes/sanity: check for suid root command evility
  grub: disable floating ncurses dependency for GPLv2 version

Peter Seebach (1):
  pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0

Richard Tollerton (1):
  shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt

Rogerio Nunes (1):
  packagegroup-core-tools-testapps: isolate x11 dependent tools

Ross Burton (1):
  u-boot: state the MACHINE when skipping u-boot

Saul Wold (1):
  external-sourcery: add missing providers

Tyler Hall (2):
  terminal: Run command using a wrapper script
  TmuxRunning: handle multi-word commands

 meta/classes/sanity.bbclass                        | 11 +++++
 meta/classes/terminal.bbclass                      | 41 ++++++++++++++----
 meta/conf/distro/include/csl-versions.inc          |  1 +
 .../distro/include/tcmode-external-sourcery.inc    |  3 ++
 meta/lib/oe/terminal.py                            |  6 ++-
 meta/recipes-bsp/grub/grub_0.97.bb                 |  2 +
 meta/recipes-bsp/u-boot/u-boot.inc                 |  2 +-
 .../meta/external-sourcery-toolchain.bb            |  2 +
 .../packagegroup-core-tools-testapps.bb            | 20 +++++----
 meta/recipes-devtools/pseudo/pseudo.inc            | 50 ++++++++++++++++++----
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  4 ++
 meta/recipes-graphics/directfb/directfb.inc        |  1 -
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      | 48 ---------------------
 13 files changed, 114 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch

-- 
1.8.1.2


