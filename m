Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rtvkz-00013l-9b
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 07:39:26 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q156VIVZ002873;
	Sat, 4 Feb 2012 22:31:19 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  5 Feb 2012 01:31:04 -0500
Message-Id: <cover.1328423023.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 05 Feb 2012 06:39:27 -0000

Richard/Saul,

This is a follow on to the 3.2 tree and src_patches changes that I sent
last week.

The ability to specify out of tree BSPs via single .scc files is not 
possible, as well as any automatic BSPs following the naming conventions
of the 3.2 tree.

The meta branch changes are routine, with the exception being that I got
a report that 3.0 -rt wasn't patching. That report turned out to be true,
and I've fixed it here.

Cheers,

Bruce

The following changes since commit cb89d43473a91ff4cb2447d642fcd9308d7366e3:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:34 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto: locate and use out of tree features specified on the
    SRC_URI
  linux-yocto: meta updates for sys940x and cleanup
  linux-yocto: rt compiliation fix
  kern-tools: remove explicit 'yocto' references from auto-bsp handling
  linux-yocto: fri2: use emgd-1.10

 meta/classes/kernel-yocto.bbclass                  |   21 ++++++++++++++++++++
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
 5 files changed, 25 insertions(+), 4 deletions(-)

-- 
1.7.4.1



