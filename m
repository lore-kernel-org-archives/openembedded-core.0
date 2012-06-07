Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2Y-0004qt-FF
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:42 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07DW018923;
	Thu, 7 Jun 2012 13:00:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:41 -0400
Message-Id: <cover.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:42 -0000

Richard/Saul,

Here's a 9 patch series that is a collection of work that's been
brewing for about three weeks.

Highlights include:

  - removal of the 2.6.37 recipe, it's time is now gone
  - addition of the 3.4 kernel recipe
      - configuration fixups and audits within that 3.4 kernel
      - kernel *only* support for mips64 mti emulation
  - -stable updates for supported kernels 3.2.18, 3.0.32
  - machine fixes/configurations for the 3.2 and 3.0 kernels
  - kern tool updates, streamlining and fixes

I've built and booted the qemu* machines on 3.4, and have been doing
this for several weeks now. Built and boot tests have also happened
on the 3.0 and 3.2 trees as well. Some BSP layers are already using
these changes.

The tools changes set the stage for some follow on changes that 
I'm nearly done for the next oe-core/yocto release, but they are
useful by themselves, so I'm getting them out of my queue.

I'll follow up to other lists with updates to recipes and configs
that reference the modified kernels.

BSP layers can be updated as appropriate, since all these changes
have been pushed to the various kernel trees.

Cheers,

Bruce

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:

  ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (9):
  kern-tools: remove unused code, meta branch and directory assumptions
  linux-yocto/3.2: update to v3.2.18
  linux-yocto/3.0: update to v3.0.32
  linux-yocto: remove v2.6.37 recipe
  linux-yocto: add machine aliases for yocto BSPs
  linux-yocto: add 3.4 recipe
  linux-yocto/3.2: fri2 and chiefriver machine updates
  linux-yocto/3.0: add cedartrail kernel features
  kern-tools: anchor KMACHINE test

 .../kern-tools/kern-tools-native_git.bb            |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   15 ++------
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   15 ++------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    7 ++--
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   38 --------------------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   23 ++++--------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   23 ++++--------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   38 ++++++++++++++++++++
 8 files changed, 67 insertions(+), 96 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.4.bb

-- 
1.7.5.4



