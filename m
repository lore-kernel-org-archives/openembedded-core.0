Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TGFQp-0008W6-9t
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:39:07 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8OKQGrw000055;
	Mon, 24 Sep 2012 13:26:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 24 Sep 2012 16:25:44 -0400
Message-Id: <cover.1348518160.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto/3.4: v3.4.11 and BSP updates
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
X-List-Received-Date: Mon, 24 Sep 2012 20:39:07 -0000

Richard/Saul,

Updating the 3.4 trees SRCREVs to pickup the korg v3.4.11 -stable
and some minor tweaks to the beagleboard config to prep for a switch
to 3.4 as the preferred kernel version.

Build and boot tested on qemu* and build testing was done the hardware
reference boards.

Cheers,

Bruce

The following changes since commit 8b3aa00029e62df6d05710cf166fd5d09bdb29cf:

  documentation/poky-ref-manual/ref-variables.xml: Update B variable (2012-09-24 16:36:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.4: update kver to v3.4.11
  linux-yocto/3.4: update beagleboard configs

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    9 ++++-----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 13 deletions(-)

-- 
1.7.5.4



