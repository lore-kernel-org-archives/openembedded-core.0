Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T1k3K-0007po-Im
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 22:18:54 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FK6sWb011691;
	Wed, 15 Aug 2012 13:06:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Aug 2012 16:06:19 -0400
Message-Id: <cover.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/4] linux-yocto: consolidated update
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
X-List-Received-Date: Wed, 15 Aug 2012 20:18:55 -0000

Richard/Saul,

Here's a consolidated update that I've had under test in one
way or another for 3 weeks now. Tom Z and others have also been
using parts of this for their work, so it has seen a reasonably
wide set of testers.

This series further streamlines working with linux-yocto* based
recipes/repositories by breaking the last branch based triggers
in the tooling. Branches were the most important piece of 
information when working with the tools and a linux-yocto repository,
but this has now been generalized, and BSP descriptions (among
other things) are now found by MACHINE and kernel type only. 

With this, KBRANCH now becomes what it was supposed to be, an 
human readible indication of the branch that is supposed to be
built, and one that the kern-tools will validate. If that branch
is not validated, an error is thrown. If the default branch is
left as-is, then the in-tree description leaves you on the 
proper branch and all is well.

I also have a collection of bug fixes to the tools, including
support for having a meta branch not called 'meta'.

I'd recommend that this go through some AB tests, and I'll be
around if there's a corner case that I managed to miss.

Cheers,

Bruce

The following changes since commit ee11e7ac55fa41cb69e9519f3e879a1746c4cf33:

  linux-yocto/meta-yocto/3.4: BSP, uprobes, config and cleanups (2012-08-15 13:52:00 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-dev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-dev

Bruce Ashfield (4):
  linux-yocto: make KBRANCH the exception and not the rule
  linux-yocto/3.4: remove explicit KBRANCH designations
  linux-yocto: explicitly export KMETA to scripts
  kern-tools: fixes (branching,buildall) + cleanups (checkpoint,cleaner)

 meta/classes/kernel-yocto.bbclass                  |   93 ++++++++++++++------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   11 +--
 3 files changed, 69 insertions(+), 37 deletions(-)

-- 
1.7.5.4



