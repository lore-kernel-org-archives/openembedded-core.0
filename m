Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SfZae-00070u-Nb
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 18:41:41 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5FGUw2w021628;
	Fri, 15 Jun 2012 09:30:58 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jun 2012 12:30:53 -0400
Message-Id: <cover.1339777686.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] meta-skeleton: add linux-yocto-custom reference recipe
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
X-List-Received-Date: Fri, 15 Jun 2012 16:41:41 -0000

Richard/Saul,

There have been some korg and custom recipes that use the linux-yocto
tools on top of other git repositories in poky-extras for quite some
time.

To increase the visibility, I've clean linux-yocto-custom and moved
it to meta-skeleton. All relevant documentation on how to use this is
within the recipe itself (and hence the patch that follows this
pull request).

Cheers,

Bruce

The following changes since commit 4bb7ef94fca392bcd389ed7069280c238f8fe094:

  directfb: added missing Upstream-status (2012-06-15 15:44:39 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/skeleton
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/skeleton

Bruce Ashfield (1):
  meta-skeleton: add linux-yocto-custom reference recipe

 .../recipes-kernel/linux/linux-yocto-custom.bb     |   46 ++++++++++++++++++++
 .../0001-linux-version-tweak.patch                 |   26 +++++++++++
 .../linux/linux-yocto-custom/feature.scc           |    1 +
 .../linux/linux-yocto-custom/smp.cfg               |    1 +
 4 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg

-- 
1.7.5.4



