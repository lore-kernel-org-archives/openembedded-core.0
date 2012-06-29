Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkSqk-0002IS-B8
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 06:30:32 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2012 21:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171462149"
Received: from unknown (HELO localhost) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2012 21:19:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 21:17:51 -0700
Message-Id: <cover.1340942930.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/4] Enable building modules on target
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
X-List-Received-Date: Fri, 29 Jun 2012 04:30:32 -0000

This series simplifies the include mechanisms for the linux-yocto recipes
and adds support for a kernel-headers package which enables the building
of modules on the target.

Sending to both oe-core and poky as this series touches files in both
and I didn't want to confuse the intent or the dependency by splitting
them up.

The following changes since commit 4d48398798c898c5db08294ba64d9bfc7daca19c:

  local.conf.sample.extended: Add filtering function to archiver.bbclass (2012-06-28 16:32:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/modules
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/modules

Darren Hart (4):
  linux-libc-headers-yocto: Do not include linux-yocto
  linux-yocto: Use INC_PR and move kernel require to linux-yocto.inc
  kernel: Add kernel-headers package for target module build
  tasl-core-sdk: Add kernel-headers to task-core-sdk RDEPENDS

 .../linux-libc-headers/linux-libc-headers-yocto_git.bb      |    3 ++-
 meta/classes/kernel.bbclass                                 |   11 +++++++----
 meta/conf/bitbake.conf                                      |    2 +-
 meta/recipes-core/tasks/task-core-sdk.bb                    |    3 ++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb             |    3 +--
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb             |    3 +--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb             |    3 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb           |    3 +--
 meta/recipes-kernel/linux/linux-yocto.inc                   |    3 +++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb                |    3 +--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb                |    3 +--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb                |    3 +--
 12 files changed, 22 insertions(+), 21 deletions(-)

-- 
1.7.10.2



