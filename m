Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SjCog-0000Uy-D2
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 19:11:10 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5PH09tG017802;
	Mon, 25 Jun 2012 10:00:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 25 Jun 2012 12:59:43 -0400
Message-Id: <cover.1340643139.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/5] linux-yocto/kern-tools: consolidated pull request
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
X-List-Received-Date: Mon, 25 Jun 2012 17:11:10 -0000

Richard/Saul,

Here is the first batch of updates to the kernel, configuration and 
tools for the 1.3 development work.

This update represents a baseline for the tools and configuration
parts of the system. We'll refine it further for the remaining
workflow and configuration changes that are underway, and for those
that we need to revisit for 1.3 (i.e. things like -tiny and a 
common base configuration).

These have been in use for about two weeks, and have been built/booted
on qemu + hardware reference platforms.

[YOCTO #843] and [YOCTO #1694] are addressed by this series.

cc: Darren Hart <dvhart@linux.intel.com>
cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  kern-tools: add buildall and robustness fixes
  linux-yocto/3.4: update and categorize configuration options
  linux-yocto/3.4: update to v3.4.3
  linux-yocto-rt/3.4: update qemuppc branch
  linux-yocto/3.4: -rt build fixes + configuration audit (part2)

 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |   10 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++++++++--------
 4 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.5.4



