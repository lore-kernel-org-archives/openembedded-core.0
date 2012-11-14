Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejR-000874-3C
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:25 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343G022189;
	Wed, 14 Nov 2012 07:03:04 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:02:56 -0500
Message-Id: <cover.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto + kern tools consolidated pull request
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
X-List-Received-Date: Wed, 14 Nov 2012 15:18:25 -0000

Richard/Saul,

This is a collection of updates that I've had locally in the last few
weeks leading up to the 1.3 release, but they were held back to avoid
any negative impacts on the release.

I've kept all the kernel -stable and configuration updates as distinct
commits, so it will be possible to separate any issues that crop up 
into manageable chunks. It also shows the different test points that 
I've used while updating the kernels.

For the kernel trees we get the following:

  - the latest 3.2 and 3.4 -stable updates
  - the latest 3.2 and 3.4 -rt updates
  - configuration changes that have been collected for BSPs

  ** As far as I'm concerned these are all bugfix/stable changes and
     can go into danny-next. Others may not agree :)

These have been build tested to the amount that my cycles allow, and
others have already been used in the meta-intel BSPs. It's worth running
this through a test build if you are so inclined, just to be sure.

For the tools we get the following updates:

  - A fix for YOCTO #3226 that silences the warning:

       find: warning: -path $oe-path/linux/ will not match anything because it ends with /.

    ** This change should be considering for the danny-next branch as well.

  - A fix to the guilt SRC_URI to point at a valid tgz upstream.

    ** This change should be considering for the danny-next branch as well.

  - kern-tools improvements and fixes that are part of the 1.4 feature work.
    The kern-tools commit has the details of the changes. They'll be further
    improved in the upcoming weeks, but they have been in use locally for 
    over a month now, and have been tested by others as well, so they shouldn't
    cause any problems in master and are invisible to most users.

I've added Ross to the CC for the commits that can be pulled into the 1.3
maintenance branches.

I've added Rahul since there was some refactoring of the Rangely/dpdk
configuration that should be checked as well.

Cheers,

Bruce  

The following changes since commit 41125ddc8651494ffcf888d3b5efce1ae6d953bb:

  bitbake: print clear message for "bitbake -e ASSUME_PROVIDED" (2012-11-13 14:21:16 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/3.4: nfsd, pci, fishriver and rangely config changes
  linux-yocto/3.4: efi/mmc fixes and fri2 updates
  linux-yocto/3.4: bump kver to v3.4.16
  linux-yocto/3.4: v3.4.17, v3.4.18, -rt and config changes
  linux-yocto/3.2: update to v3.2.32 and 3.2.32-rt48
  kern-tools: kconf_check: fix find warning
  kern-tools: flexibility and usability enhancements
  guilt: change upstream tgz location

 meta/recipes-devtools/guilt/guilt-native_0.33.bb     |    4 ++--
 .../kern-tools/kern-tools-native_git.bb              |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb      |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb      |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb    |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb    |    7 +++----
 meta/recipes-kernel/linux/linux-yocto_3.2.bb         |   18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb         |   16 ++++++++--------
 8 files changed, 34 insertions(+), 35 deletions(-)

-- 
1.7.10.4



