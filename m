Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Te9Mo-00073x-M7
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 20:01:47 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qATIlSG7007682;
	Thu, 29 Nov 2012 10:47:28 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 29 Nov 2012 13:47:09 -0500
Message-Id: <cover.1354214590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.4: move PREEMPT_NONE to beagleboard standard kernel only
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
X-List-Received-Date: Thu, 29 Nov 2012 19:01:47 -0000

Richard/Saul,

Just a minor kernel configuration tweak for anyone that wants
to try out preempt-rt on the beagleboard. This is the result 
of a conversion on the yocto list recently, and is a simple change
to make life easier for those experimenting with -rt support
on this board.

(this is stacked on top of the change I just sent for validate
branches, shout if you need that changed).

Cheers,

Bruce

The following changes since commit e7403df2bde00da021302a58fed6e782784ca629:

  kernel-yocto: checkout known branch before leaving do_validate_branches (2012-11-28 10:27:45 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: move PREEMPT_NONE to beagleboard standard kernel
    only

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4



