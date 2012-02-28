Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S2USt-0005j2-IN
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 22:20:07 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1SLBZEV028690;
	Tue, 28 Feb 2012 13:11:35 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Feb 2012 16:09:57 -0500
Message-Id: <cover.1330463101.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: revision bump + pvr + checkout fix
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
X-List-Received-Date: Tue, 28 Feb 2012 21:20:08 -0000

Richard/Saul,

Naturally right after I sent my previous version bump to 3.2.7,
3.2.8 came out with an x86 floating point fix that was worth
picking up. Hence my quick bump to 3.2.8.

The other update to the 3.0/3.2 trees stages content for PVR
functionality in some future BSP work.

And finally, I added some extra checks and safety to the kernel
checkout code, since Saul was reporting issues that I couldn't
reproduce, I can't be sure if they fix his problem. But they do
fix issues with aborted builds and the korg recipe. I've built
many kernels and as many recipes as possible with these in place.

cc: Kishore Bodke <kishore.k.bodke@intel.com>

Cheers,

Bruce

The following changes since commit d86e3082e695cde555df276a2436873fa5381130:
  Otavio Salvador (1):
        licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: make kernel_checkout reentrant
  linux-yocto/meta: add pvr feature description
  linux-yocto: update to v3.2.8

 meta/classes/kernel-yocto.bbclass                 |   33 ++++++++++++--------
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   16 +++++-----
 6 files changed, 35 insertions(+), 28 deletions(-)



