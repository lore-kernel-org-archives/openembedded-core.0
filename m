Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Qharq-0004gU-P0
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 07:23:15 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-217.ottawa.windriver.com [128.224.146.217])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6F5J3er008059;
	Thu, 14 Jul 2011 22:19:04 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jul 2011 01:19:01 -0400
Message-Id: <cover.1310706713.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/meta: update SRCREVs
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
X-List-Received-Date: Fri, 15 Jul 2011 05:23:15 -0000

The patch itself says it all, but here's an update to the 2.6.37
kernel that fixes a few issues. No sense sitting on this until
3.0 is ready, but these same fixes have already been applied 
to the dev kernel as well.

The first change is to meta, to address a couple of bugs with
the routerstation pro:

 Fixes bug [YOCTO #1161]
 Fixes bug [YOCTO #773]

This streamlines the routerstation pro configuration to remove options
that are either unecessary or that are causing bugs.

Also added to all branches is:

  commit ffd73d6b2a9bfa0de5710b90a2237f4be66ae9a7
  Author: Yinghai Lu <yinghai@kernel.org>
  Date:   Thu Jul 14 15:27:44 2011 -0700

    mm: use alloc_bootmem_node_nopanic() on really needed path

    commit 8f389a99b652aab5b42297280bd94d95933ad12f upstream.

Which is a commit from Darren that he needed when working on the
boot/footprint efforts.

The following changes since commit f30690695628d44023bd2b2d0e46dca10f7d9ba0:

  ncurses: Fix site_config (2011-07-14 15:02:29 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (1):
  linux-yocto/meta: update meta SRCREV for routerstation pro

 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.4.1



