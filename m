Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S8aJk-0001DK-Ax
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:47:52 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2GGcx34023581;
	Fri, 16 Mar 2012 09:38:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 16 Mar 2012 12:38:44 -0400
Message-Id: <cover.1331915755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/4] linux-yocto: consolidated pull
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
X-List-Received-Date: Fri, 16 Mar 2012 16:47:52 -0000

Richard/Saul,

Here's the consolidated pull request that I mentioned
earlier in the week. Two -stable updates and some changes
for BSP configuration.

Tested on all the qemu* targets. No issues found here.

There are also some emenlow changes in the tree, but those will
be picked up by other layers.

cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit be0f9dd483af2a2f55b2ae8ef9ca172e7c90819c:

  python-imaging: bring in fixes from meta-oe (2012-03-16 10:57:09 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/3.0: update meta SRCREV
  linux-yocto/3.2: update fri2 configuration
  linux-yocto/3.2: update to v3.2.11
  linux-yocto/3.0: update to v3.0.24

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   18 +++++++++---------
 5 files changed, 29 insertions(+), 29 deletions(-)

-- 
1.7.5.4



