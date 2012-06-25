Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Sj1mr-0003l4-U7
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 07:24:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jun 2012 22:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="157768563"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by orsmga001.jf.intel.com with ESMTP; 24 Jun 2012 22:13:34 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2012 13:15:28 +0800
Message-Id: <cover.1340600710.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V3 0/3] misc IMAGE_FEATURE fixings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 05:24:34 -0000

This patch set fixed the bug [YOCTO #2605].

It allows to login to openssh with empty password if the IMAGE_FEATURE
debug-tweak feature is set.

It processes conflicting IMAGE_FEATURE features, i.e. ssh-server-dropbear 
and ssh-server-openssh.

It also adds the "openssh-sftp-server" into the IMAGE_FEATURE tools-debug.

The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:
  Bogdan Marinescu (1):
        guile: fix compilation on MIPS/PPC

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug2605
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2605

Lianhao Lu (3):
  classes/image: Allow openssh empty passwords login.
  image/core-image: Handle conflicting IMAGE_FEATURES.
  task-core-tools-debug: Added openssh-sftp-server.

 meta/classes/core-image.bbclass                  |   13 +++++++++++-
 meta/classes/image.bbclass                       |   24 ++++++++++++++++++++++
 meta/recipes-core/tasks/task-core-tools-debug.bb |    3 ++
 meta/recipes-sato/images/core-image-sato-sdk.bb  |    2 +
 4 files changed, 41 insertions(+), 1 deletions(-)



