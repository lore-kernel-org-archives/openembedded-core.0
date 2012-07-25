Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Su8Ww-000476-IG
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 22:50:03 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6PKcSwG000113;
	Wed, 25 Jul 2012 13:38:29 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 25 Jul 2012 16:37:50 -0400
Message-Id: <cover.1343248324.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/rt: update BSP preempt-rt.scc files to enable live boot
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
X-List-Received-Date: Wed, 25 Jul 2012 20:50:03 -0000

Richard/Saul,

Here are some -rt updates from Darren for the x86 boards, nothing
much to see here, just configuration changes.

Note: these are stacked on my 3.4.6 and 3.4.x-rt14 which haven't
been merged yet.

Cheers,

Bruce

cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit 246570852170f316aebedabff48bce84de0b95dc:

  linux-yocto/3.4: 3.4.6 and 3.4.x-rt14 (2012-07-25 08:52:17 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-rt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rt

Bruce Ashfield (1):
  linux-yocto/rt: update BSP preempt-rt.scc files to enable live boot

 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.5.4



