Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T4mTo-0002e0-Mx
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 07:30:49 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7O5Ibkt024650;
	Thu, 23 Aug 2012 22:18:38 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 24 Aug 2012 01:18:33 -0400
Message-Id: <cover.1345785364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] kernel.bbclass: fix INC directory for SLANG
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
X-List-Received-Date: Fri, 24 Aug 2012 05:30:49 -0000

Richard/Saul,

Here's the perf slang fix implemented in the kernel.bbclass. I've removed
the old noslang patch, and built perf here. Everything seems sane.

The kernel patch portion (that isn't required to fix the build issue), will
come tomorrow along with some other kernel updates.

Take this for a spin, but it should solve everyone's problems with perf
and slang.

Cheers,

Bruce

The following changes since commit a865fbf423defb7d24c59ae8d7a79eb87e2e6a02:

  kernel-yocto: set master branch to a defined SRCREV (2012-08-23 15:35:35 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-perf

Liang Li (1):
  kernel.bbclass: fix INC directory for SLANG

 meta/classes/kernel.bbclass                        |    3 +++
 .../recipes-kernel/linux/linux-yocto/noslang.patch |   20 --------------------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 --
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 --
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 --
 5 files changed, 3 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto/noslang.patch

-- 
1.7.5.4



