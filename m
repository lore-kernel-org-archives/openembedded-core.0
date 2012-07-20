Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SsFB2-0001DJ-5E
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:31:36 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6KFJt14008000;
	Fri, 20 Jul 2012 08:19:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 20 Jul 2012 11:19:22 -0400
Message-Id: <cover.1342796935.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull
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
X-List-Received-Date: Fri, 20 Jul 2012 15:31:36 -0000

Richard/Saul,

I've got some -stable updates, -rt updates and other changes
that are almost done, but I wanted to get these smaller patches
out of my queue first.

We have some cleanup patches from Robert P. J. Day and a meta
branch update for EMGD, CONFIG_MTD_NAND_VERIFY_WRITE and kmemcheck.

I've gone ahead and pushed the emgd update from Nitin, if it requires
re-work, we'll just add more commits to the branch. 

Tom/Nitin: speak up if there's a problem with this!

Cheers,

Bruce

cc: Nitin A Kamble <nitin.a.kamble@intel.com>
cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Andrea Adami <andrea.adami@gmail.com>
cc: Robert P. J. Day <rpjday@crashcourse.ca>

The following changes since commit 98a1fd1e734db50380a3a37d35767ccb4cc21f7c:

  documentation: Config fragment sections updated (2012-07-20 12:32:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: emgd, mtd nand and kmemcheck fixes

Robert P. J. Day (2):
  kernel-yocto.bbclass: Fix some obvious typoes in comments.
  kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git
    directory

 meta/classes/kernel-yocto.bbclass               |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.7.5.4



