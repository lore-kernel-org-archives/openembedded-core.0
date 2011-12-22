Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rdn8u-0005AI-9C
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:13:24 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-187.ottawa.windriver.com [128.224.145.187])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBMI6DQM013678;
	Thu, 22 Dec 2011 10:06:13 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 22 Dec 2011 13:05:56 -0500
Message-Id: <cover.1324576164.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 22 Dec 2011 18:13:24 -0000

Richard/Saul,

Here's a consolidated pull request that adds the cedartrail, and 
updates some remaining reference platforms to 3.0.x, including
updated -rt support.

There are also a couple of minor bug fixes that I found when working
on M2 functionality.

Built and boot tested everywhere that I could.

The bulk of my changes are pending on the patch refactoring changes
that have been proposed, and will follow once something merges for
that, and I can re-test.

Cheers,

Bruce

cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit dee0fc1462ba18551571c3b2d0f2b443a2feca18:

  multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (4):
  linux-yocto: add cedartrail BSP support
  linux-yocto: update hardware reference boards to 3.0.12
  kern-tools: update SRCREV to pickup git operation fixes
  linux-yocto: use PATH to locate kconf_check

 meta/classes/kernel-yocto.bbclass                  |    4 ++--
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.4.1



