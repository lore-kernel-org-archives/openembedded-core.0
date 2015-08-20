Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAA8608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:24:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 15:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="629341549"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2015 15:24:12 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 15:24:07 -0700
Message-Id: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: Try to fix qemu freezing due to full socket buffers
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
X-List-Received-Date: Thu, 20 Aug 2015 22:24:12 -0000

The following changes since commit a3d228a484cf471e999b6537987e2897d8a7bd4e:

  bitbake: main: Handle RuntimeError exception in list_extension_modules (2015-08-20 22:04:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/logthread

for you to fetch changes up to c0f8b3c28c4410031dc763e714bc2ad0f87171d6:

  qemurunner: Use two serial ports and log console with a thread (2015-08-20 14:16:29 -0700)

----------------------------------------------------------------
Randy Witt (3):
      qemurunner.py: Move some class variables that should only be local
      qemurunner: Make create_socket() return data and use exceptions
      qemurunner: Use two serial ports and log console with a thread

 meta/conf/machine/qemuarm.conf    |   2 +-
 meta/conf/machine/qemuarm64.conf  |   2 +-
 meta/conf/machine/qemumips.conf   |   2 +-
 meta/conf/machine/qemumips64.conf |   2 +-
 meta/conf/machine/qemuppc.conf    |   2 +-
 meta/conf/machine/qemux86-64.conf |   2 +-
 meta/conf/machine/qemux86.conf    |   2 +-
 meta/lib/oeqa/utils/qemurunner.py | 174 ++++++++++++++++++++++++++++++++------
 8 files changed, 155 insertions(+), 33 deletions(-)

