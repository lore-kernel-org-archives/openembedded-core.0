Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R6SVO-0003F6-Ve
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:30:51 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(overflow-147-248.ottawa.windriver.com [128.224.147.248])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8LJPSVS023222;
	Wed, 21 Sep 2011 12:25:29 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Sep 2011 15:25:20 -0400
Message-Id: <cover.1316632767.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: kernel config updates
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
X-List-Received-Date: Wed, 21 Sep 2011 19:30:51 -0000

Richard/Saul,

Here's another small series of kernel config updates from the linux-yocto
tree. During some build/boot and regression testing I noticed that some
configuration warnings weren't being dumped to a visible location. When
I moved all the warnings (patch 3/3) to the kernel audit phase, there were
some obvious clenaups to the configs to get us a clean audit.

I've built and booted all the qemu machine. The net result here is
that we don't have any runtime config changes and we have met the clean
kernel configuration goal.

The following changes since commit bcfff457f63f43f53bcaf04f116e09bb2bba9bd6:

  Fix mercurial fetcher in fetch2 (2011-09-21 14:07:31 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: simplify kernel configuration check expression
  linux-yocto: add blktrace feature
  linux-yocto: kernel configuration cleanups

 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.4.1



