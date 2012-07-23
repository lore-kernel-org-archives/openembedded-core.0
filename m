Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1StML0-00013c-Qh
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 19:22:35 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6NHAxFW029551;
	Mon, 23 Jul 2012 10:10:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 23 Jul 2012 13:10:23 -0400
Message-Id: <cover.1343063241.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/3.4: -stable and -rt updates
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
X-List-Received-Date: Mon, 23 Jul 2012 17:22:35 -0000

Richard/Saul,

A fairly simple refresh of the 3.4 kernel to pickup 3.4.6 and update
the -rt patch to -rt14.

Tested on qemu* locally. Updates to other layers will follow later.

Cheers,

Bruce

The following changes since commit 315d52934693b14f08b62f3f5f361d834484e180:

  Pyphon-native: Fix typo (2012-07-22 14:20:57 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: 3.4.6 and 3.4.x-rt14

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.5.4



