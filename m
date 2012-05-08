Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRlr7-0001Mq-8p
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:57:44 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-l1.corp.ad.wrs.com [128.224.145.171])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q48ElenM017426;
	Tue, 8 May 2012 07:47:40 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 May 2012 10:47:35 -0400
Message-Id: <cover.1336487836.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: streamlined repository support + fixes
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
X-List-Received-Date: Tue, 08 May 2012 14:58:08 -0000

Richard/Saul,

This pull requests represents some changes that I've been running here
for the past 1.5 months. It is a re-working of the tools and recipes to
allow more repository types to support the kern tools (branching and
fragments). 

It's one largish patch that consolidates recipe updates, tool changes
and streamlining of the patching phase.

This is step one, there are several more to follow after this merges
into the tree. Namely:
  
  - updated documents on what an inheriting recipe needs to do
  - movement of the linux-yocto-custom recipe from meta-kernel-dev
    to somewhere more visible
  - updates to meta-kernel-dev to fix those recipes
  - removal of the 2.6.37 recipe and introduction of the 3.4 kernel
    recipe
  - additional streamlining of the tools (more code deleted!).

I've converted the linux-yocto* recipes (except for 2.6.37, since I'll be
removing it shortly) and have built 3.0, 3.2 and -dev kernels for all the
boards I can. It's ready to go, but can also use a run through a 
nightly build before it merged (the changes were a bit tricky with a lot
of existing use cases to ensure were not broken).

FYI: I stacked this on top of my last pull request, let me know if this
needs to be rebased.

Cheers,

Bruce

The following changes since commit e116928e3a1af803b9c6fa06236902ad730f7bf8:

  linux-yocto/3.0: mm/msync: tweak tmpfs patch for syscall msync (2012-05-08 10:18:56 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-dev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-dev

Bruce Ashfield (2):
  linux-yocto: streamline support for multiple upstream repo types
  kern-tools: integrate minor fixes

 meta/classes/kernel-yocto.bbclass                  |  115 ++++++++++----------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    1 +
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +
 meta/recipes-kernel/linux/linux-yocto.inc          |    7 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |    2 +
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   23 +++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +
 8 files changed, 86 insertions(+), 68 deletions(-)

-- 
1.7.5.4



