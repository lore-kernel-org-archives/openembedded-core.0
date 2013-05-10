Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1Uaq7L-0007lt-HY
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 18:24:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2013 09:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="300540521"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2013 09:06:16 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id F227A6A408D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 09:06:05 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 19:06:23 +0300
Message-Id: <cover.1368201796.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/3] qemuimagetest support for more FSTYPES
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
X-List-Received-Date: Fri, 10 May 2013 16:24:28 -0000

The following changes since commit 88a7b041fbf2583472aa9408a33dd8881223a0c1:

  bitbake: pysh: Say what kind of token isn't implemented (2013-05-10 13:35:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/qemutests2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/qemutests2

Stefan Stanacar (3):
  scripts/runqemu: add ext4 to the list of extracted extensions
  runqemu-internal: support for ext2 and ext4 not only ext3
  imagetest-qemu.bbclass,qemuimage-testlib: add support for more FSTYPES

 meta/classes/imagetest-qemu.bbclass | 26 +++++++++++++++-----------
 scripts/qemuimage-testlib           | 19 +++++++++----------
 scripts/runqemu                     |  3 ++-
 scripts/runqemu-internal            | 14 +++++++-------
 4 files changed, 33 insertions(+), 29 deletions(-)

-- 
1.8.1.4



