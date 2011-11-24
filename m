Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTWLO-0002tB-2H
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 11:15:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Nov 2011 02:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="79571399"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga002.jf.intel.com with ESMTP; 24 Nov 2011 02:08:10 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 18:08:10 +0800
Message-Id: <cover.1322128489.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/4] self-hosted-image: the first set of patch
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
X-List-Received-Date: Thu, 24 Nov 2011 10:15:50 -0000

This is the first patchset for the task Build Applianc: self-hosted-image:
https://wiki.yoctoproject.org/wiki/Build_Appliance_Design

The only notable issue left is:
there is an eglibc_initial do_insall failure that seems be caused by make-3.82.
If we downgrade to make-3.81(the hacking patch is at
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=gzhai/build-appliance&id=981a37e3e031e7c96361c1c170050ab3cdbadf6c),
"bitbake core-image-minimal" in the target can build fine. The built image can
run fine with host's qemu (in target, runqemu doesn't work yet as at least
sudo is absent -- we're fixing this).

The above patchset was done by the Build Appliance development team, including
Saul, Edwin and me.

Though there are still some known issues, now we want to share the patches.
Please review, comment and merge them(if they seem good :-).


Thanks!

-- Dexuan, on behalf of the team


The following changes since commit dc2d701207435b0dbd521a11d152f11d0f18d11e:

  apt: Fix locale header and hardcoded libname issues (2011-11-23 23:41:09 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self-hosted-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v2

Dexuan Cui (2):
  gcc-package-target.inc: add the symbol link /lib/cpp
  coreutils: build and install hostname

Saul Wold (2):
  runqemu: look for *image* to be more flexible for image names
  Self Hosted Image: Added Task and Images

 .../coreutils/coreutils-8.14/disable_doc_man.patch |   36 ++++
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    9 +-
 meta/recipes-core/images/self-hosted-image.bb      |   11 ++
 meta/recipes-core/tasks/task-self-hosted.bb        |  174 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 +
 scripts/runqemu                                    |    4 +-
 7 files changed, 231 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/disable_doc_man.patch
 create mode 100644 meta/recipes-core/images/self-hosted-image.bb
 create mode 100644 meta/recipes-core/tasks/task-self-hosted.bb

-- 
1.7.6



