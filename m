Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RiXKC-000525-Gn
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 21:20:42 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q04KDE7n001257;
	Wed, 4 Jan 2012 12:13:14 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Jan 2012 15:12:59 -0500
Message-Id: <cover.1325706838.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 04 Jan 2012 20:20:42 -0000

Richard/Saul,

Here's a 3pack of kernel changes. The breakdown is as follows:

1) kern-tools: import flexible branching support

This fixes an issue that Saul found with the Intel boards that
use the yocto/emgd, yocto/eg20t graphics branches. We need to
be able to have features that allow a branch to be tested via
multiple creations. So these changes allow that again.

2) linux-yocto: bump kernel version to v3.0.14

Normal maintainance here. Bumping the version to pickup 3.0.14 fixes.
  
3) linux-yocto: use src_patches for out of tree kernel feature support

This is to fix some issue we found in 1.1 and was on the M2
feature schedule. This sets the stage for Tom's BSP scripts and
out of tree development. 

At the least, you want #1 right away to fix potential breakage.

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
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   19 +++---
 4 files changed, 80 insertions(+), 16 deletions(-)

-- 
1.7.4.1



