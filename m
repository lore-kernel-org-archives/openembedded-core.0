Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TBSPo-0000Wp-SS
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:30:17 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFHgwr015656;
	Tue, 11 Sep 2012 08:17:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 11 Sep 2012 11:17:27 -0400
Message-Id: <cover.1347376358.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: x32 and features update
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
X-List-Received-Date: Tue, 11 Sep 2012 15:30:17 -0000

Richard/Saul,

This is my part of a change that Saul will complete with the
addition of x32 as a machine override for x86 BSPs that have
x32 as their tuning.

With this change, the x32 configuration fragment will be appended
to any give x86 BSP configuration and it will support the userspace
tuning. 

Also bundled with this change is an associated change to not have
the linux-yocto recipes directly assign KERNEL_FEATURES, but 
instead always append to the variable. This allows features like
x32 to be tested by setting the variable in a local.conf or
machine .conf file.

Cheers,

Bruce

cc: Saul Wold <saul.wold@intel.com>

The following changes since commit cc8bfedabfe61a0e06a8a8199f8c0fce4738260a:

  linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates (2012-09-10 14:05:15 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/x32

Bruce Ashfield (2):
  linux-yocto*: append to KERNEL_FEATURES instead of assigning
  linux-yocto/3.4: add x32 configuration fragment and tuning hook

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    5 +++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    5 +++--
 6 files changed, 10 insertions(+), 8 deletions(-)

-- 
1.7.5.4



