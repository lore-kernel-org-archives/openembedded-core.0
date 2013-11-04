Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 71C856D684
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 18:59:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2013 10:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="403485157"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.66])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2013 10:59:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2013 10:59:02 -0800
Message-Id: <cover.1383591290.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 0/8] Patches & Qemu Update
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
X-List-Received-Date: Mon, 04 Nov 2013 18:59:03 -0000

Richard,

I have tested this locally and on the Autobuilder.

Sau!

The following changes since commit 1d2d37d579492b63d20ff8aa890a43b9a1576cf0:

  toaster: add class to dump toaster-tracked data (2013-11-04 09:35:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  iproute2: de-bash its scripts to remove the bash dependency

Chris Patterson (1):
  qemu: upgrade to 1.6.1

Felipe F. Tonello (1):
  package.bbclass: Fix split_and_strip_files when file has single quote
    (')

Lu Chong (1):
  ppp: Add two structures in if_pppol2tp.h

Martin Jansa (1):
  db: Fix build with high PARALLEL_MAKE

Roy Li (1):
  eglibc-locale: Does not create {localedir} if the toolchain has no
    files under it

Stefan Stanacar (1):
  lib/oeqa: add oeTest superclass

Xufeng Zhang (1):
  kernel.bbclass: Delay rm_work to run after do_bundle_initramfs

 meta/classes/kernel.bbclass                        |  2 +-
 meta/classes/package.bbclass                       |  2 +-
 meta/lib/oeqa/oetest.py                            | 40 +++++------
 meta/lib/oeqa/utils/decorators.py                  | 10 +--
 .../iproute2/0001-iproute2-de-bash-scripts.patch   | 64 ++++++++++++++++++
 .../iproute2/iproute2_3.11.0.bb                    |  1 +
 ...1-ppp-Add-two-structures-in-if_pppol2tp.h.patch | 60 ++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |  4 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |  3 +-
 meta/recipes-devtools/qemu/files/fdt_header.patch  | 39 -----------
 .../qemu/files/relocatable_sdk.patch               | 34 ----------
 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch | 79 ----------------------
 .../qemu/files/target-ppc_fix_bit_extraction.patch | 70 -------------------
 meta/recipes-devtools/qemu/qemu.inc                |  6 +-
 .../qemu/{qemu_1.5.0.bb => qemu_1.6.1.bb}          | 15 ++--
 .../recipes-support/db/db/fix-parallel-build.patch | 19 ++++++
 meta/recipes-support/db/db_5.3.21.bb               |  3 +-
 17 files changed, 188 insertions(+), 263 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/relocatable_sdk.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.6.1.bb} (44%)
 create mode 100644 meta/recipes-support/db/db/fix-parallel-build.patch

-- 
1.8.3.1


