Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T5rSM-0007dh-B7
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 07:01:46 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7R4nShx010798;
	Sun, 26 Aug 2012 21:49:29 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Aug 2012 00:49:17 -0400
Message-Id: <cover.1346042224.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 27 Aug 2012 05:01:46 -0000

Richard/Saul,

Here's some changes that I've staged over the past week or so, 
everything checks out here, and there are some good changes in
this set of -stable updates, and and the linker fix from Khem.

I've also got a small tools fix here as well, that was needed
for some of the yocto-bsp builds. I think we've worked through
most of them now, and everything is looking good.

Cheers,

Bruce

cc: Khem Raj <raj.khem@gmail.com>
cc: Tom Zanussi <tom.zanussi@intel.com>

The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:

  yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  kern-tools: fix forced branching
  linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
  linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   12 ++++++------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++++++++--------
 6 files changed, 22 insertions(+), 22 deletions(-)

-- 
1.7.5.4



