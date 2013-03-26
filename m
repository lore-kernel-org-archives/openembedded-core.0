Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKTU1-0006uN-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 14:00:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 05:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="276100081"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.191])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 05:43:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 12:43:03 +0000
Message-Id: <cover.1364301448.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] qemuimagetest debugging improvements
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
X-List-Received-Date: Tue, 26 Mar 2013 13:00:20 -0000

A couple of fixes to hopefully help us track down the qemuimagetest
failures on the autobuilder.


The following changes since commit d60aec3f5b319f4583fa72a8357b9ddd3be62b1a:

  docbook-utils-native: Unbreak the build after source and build dir split (2013-03-25 20:51:15 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qemuimagetest
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemuimagetest

Paul Eggleton (2):
  qemuimagetest: fix erroneous ps errors when qemu couldn't be started
  qemuimagetest: collect and print runqemu output

 meta/classes/imagetest-qemu.bbclass    |    1 +
 scripts/qemuimage-testlib              |   12 +++++++++---
 scripts/qemuimage-testlib-pythonhelper |    2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
1.7.10.4



