Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TbI81-00087T-0L
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 22:46:47 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qALLWUKo020293;
	Wed, 21 Nov 2012 13:32:30 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Nov 2012 16:32:22 -0500
Message-Id: <cover.1353532567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: dvhart@linux.intel.com, linux-yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 21 Nov 2012 21:46:47 -0000

Richard/Saul,

Here's another small queue of patches, some minor updates to
kernel configs and fixes for YOCTO #3422 and YOCTO #3473.

patch 1/4 [linux-yocto/3.0: fix virtio configuration typo] fixes 
a build error atom-pc build in master by fixing the kernel fragment.

atom-pc should probably be using the 3.4 kernel, but that's a 
question for Darren/Tom/Nitin (so I've added them to the cc), since
there may be a reason (with respect to graphics) as to why it is on
3.0.

While fixing that build error, I also modified the kern tools to
clearly report the error and avoid needing to go to the logs for
diagnosis, that's patch 4/4 [kern-tools: report missing config fragments by name].

The other change is a comment fixup for YOCTO #3422, just to make
it clear if meta branches do or do not need to exist.

And finally, Tom noticed that a bad merge dropped some uprobes
configuration and sent a fixup patch.

cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Darren Hart <dvhart@linux.intel.com>
cc: Nitin Kamble <nitin.a.kamble@intel.com>

Cheers,

Bruce


The following changes since commit 1b4dcf10b0fe9b4e95ca84f32de0c7dcfee2b729:

  ldconfig/cdrtools/icecc-create-env/linuxdoc-tools/python: Set FILESPATH to find -native files (2012-11-21 16:56:04 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/3.0: fix virtio configuration typo
  linux-yocto/3.4: uprobes: reinstate config options for 'uprobe'
    feature
  kernel-yocto: clarify KMETA branch comments
  kern-tools: report missing config fragments by name

 meta/classes/kernel-yocto.bbclass                       |    5 +++--
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb         |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb            |    2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

-- 
1.7.10.4



