Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RrxYI-00017H-UQ
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:10:11 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0UK2DFt017744;
	Mon, 30 Jan 2012 12:02:13 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 30 Jan 2012 15:02:09 -0500
Message-Id: <cover.1327952323.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: 3.2.2 and 3.0.18 updates
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
X-List-Received-Date: Mon, 30 Jan 2012 20:10:12 -0000

Richard/Saul,

Two kernel updates in this pull request. The bigger change is the
introduction/release of the 3.2 kernel repository. I've had this 
under test in one form or another for nearly two months now. It 
no only brings in a new kernel, but introduces some branching changes
and audited kernel configuration fragments. This needs head to the
servers now to allow add-on work to be completed.

I've built and booted sato on all the emulated targets for the 3.2
kernel.

There is an associated set of kern-tools changes to support the 
branching in the 3.2 kernel repository, and the changes are fully
compatible with the existing 3.0 tree.

The second update is a refresh of the 3.0 tree to pickup 3.0.18, and
to merge a set of pending features to that tree. The commit itself
tells the story.

I've built and booted this for all the emulated targets as well.

The following changes since commit b719d7e10bdb5bb4fc9ef70256eb93f925fbda4b:

  useradd: Ensure dependencies are only added for target recipes, not native or nativesdk (2012-01-27 16:59:56 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (3):
  kern-tools: import config audit and branch manipulation updates
  linux-yocto: add kernel 3.2.2 support
  linux-yocto: update to v3.0.18 + features

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   37 ++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   19 ++++-----
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   41 ++++++++++++++++++++
 5 files changed, 92 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb

-- 
1.7.4.1



