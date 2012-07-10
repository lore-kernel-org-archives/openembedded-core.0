Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Soe8y-0007Yd-4O
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:22:36 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6AHBLlB001136;
	Tue, 10 Jul 2012 10:11:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 10 Jul 2012 13:11:02 -0400
Message-Id: <cover.1341933187.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: perf, unionfs, yaffs2 fixes
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
X-List-Received-Date: Tue, 10 Jul 2012 17:22:36 -0000

Saul,

Here are the SRCREV updates to activate Tom's mips perf fix (3.2
and 3.4). 

For 3.4, we also have a yaffs2 and unionfs fix.

Cheers,

Bruce

The following changes since commit 029e3cea52f86438a1d6868020b8888b5c93d623:

  bitbake: fetch2/wget: Use FETCHCMD_wget to provide the commandline and options (2012-07-10 14:25:38 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.2: perf: fix mips build
  linux-yocto/3.4: perf, unionfs and yaffs2 fixes

 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   12 ++++++------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 5 files changed, 17 insertions(+), 17 deletions(-)

-- 
1.7.5.4



