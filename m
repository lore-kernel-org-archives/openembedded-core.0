Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TC2BG-0004am-D0
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 07:41:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2012 22:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,413,1344236400"; d="scan'208";a="192360472"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2012 22:29:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 22:29:03 -0700
Message-Id: <cover.1347514032.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/10] Misc Fixes (cover only)
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
X-List-Received-Date: Thu, 13 Sep 2012 05:41:38 -0000

Richard,

A few fixes from people.

I have the start of the libexec sanity (insane test) and a couple of
fixes for miss-packaged files.

Sau!

The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:

  rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (1):
  patch.bbclass: Use one TMPDIR per patching process

Khem Raj (3):
  kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
  uclibc: Revert systemd regressing patch from upsteam uclibc and uprev
    SRCREV
  runqemu: Explicitly specify MACHINE when calling bitbake

Matthew McClintock (1):
  valgrind_3.7.0.bb: fix missing leading space on _append

Ross Burton (1):
  connman: remove trailing whitespace

Saul Wold (4):
  insane.conf: add new libexec test
  oprofileui: Add Icons to oprofileui-viewer package
  kernelshark: add missing ${D}
  lttng-tools: skip new libexec insane test

 meta/classes/insane.bbclass                        |   14 +
 meta/classes/kernel-arch.bbclass                   |   13 +
 meta/classes/kernel.bbclass                        |   16 +-
 meta/classes/module-base.bbclass                   |   16 -
 meta/classes/patch.bbclass                         |   11 +
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    4 +-
 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb |    7 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    4 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    5 +-
 scripts/runqemu                                    |    2 +-
 13 files changed, 378 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch

-- 
1.7.7.6



