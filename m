Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RitR0-0000qM-HM
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:57:12 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q05Jnf1W029208;
	Thu, 5 Jan 2012 11:49:41 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  5 Jan 2012 14:49:25 -0500
Message-Id: <cover.1325792752.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [v2 PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 05 Jan 2012 19:57:12 -0000

Richard/Saul,

This is a resend of my series from yesterday. Richard noted the
following two issues:

 http://autobuilder.pokylinux.org:8010/builders/nightly-ppc/builds/210/steps/shell_67/logs/stdio
 http://autobuilder.pokylinux.org:8010/builders/nightly-arm/builds/247/steps/shell_14/logs/stdio

The ARM build issue was introduced in 3.0.13, and has a mainline fix,
which I cherry picked into the kernel tree and pushed out. I'll likely
be able to drop it with 3.0.16 (assuming there is one).

The qemuppc one was due to stricter patch checking. I updated the meta
branch and that is now fixed.

Take all three as a unit, and the builds should be fine now.

Cheers,

Bruce


The following changes since commit 021848be9eeb71de8acfba6c66c11645b01523b8:

  valgrind: Fix for automake update (2012-01-04 16:04:08 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  kern-tools: import flexible branching support
  linux-yocto: bump kernel version to v3.0.14
  linux-yocto: use src_patches for out of tree kernel feature support

 meta/classes/kernel-yocto.bbclass                  |   67 +++++++++++++++++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +++---
 4 files changed, 79 insertions(+), 16 deletions(-)

-- 
1.7.4.1



