Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U2l8G-00043s-06
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:12:30 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15FuZtJ028089;
	Tue, 5 Feb 2013 07:56:35 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  5 Feb 2013 10:56:32 -0500
Message-Id: <cover.1360079063.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:34 -0000

Richard/Saul,

Here's the latest batch of kernel changes. In this series, we are moving the
linux-yocto-dev recipe out of poky-extras into a more visible location (using
the scheme agreed upon to avoid AUTOREV network access). I also have a
cleanup patch to existing KERNEL_FEATURES references, and finally a bump of
the 3.4 and 3.4-rt versions.

Details follow:

[PATCH 1/3] linux-yocto/dev: linux-yocto development tree tracking recipe

  The linux-yocto-dev recipe uses the upstream tracking linux-yocto-dev repository.
  Since this tree is frequently updated, and periodically rebuilt, AUTOREV is used
  to track its contents.

  This recipe is just like other linux-yocto variants, with the only difference
  being that to avoid network access during initial parsing, static SRCREVs are
  provided and overridden if the preferred kernel provider is linux-yocto-dev.

[PATCH 2/3] linux-yocto/3.4: update to v3.4.28, 3.4.28-rt40

  Updating the linux-yocto_3.4 SRCREVs to pick up the 3.4.28 -stable update
  as well as the 3.4.28-rt40 refresh.

[PATCH 3/3] linux-yocto: KERNEL_FEATURES should reference full scc files

  Some existing KERNEL_FEATURE references use a shorcut notation, but mapping
  these shortcuts to actual .scc files in the tree are not obvious. So we clarify
  where they are found by referencing the full .scc filename in the KERNEL_FEATURE
  addtions.

Cheers,

Bruce

The following changes since commit 7e9cb437b1b720e656f4a33f73c07c5dc7356a2c:

  dropbear: fix RPROVIDES (2013-02-04 23:31:02 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/dev: linux-yocto development tree tracking recipe
  linux-yocto/3.4: update to v3.4.28, 3.4.28-rt40
  linux-yocto: KERNEL_FEATURES should reference full scc files

 meta/recipes-kernel/linux/linux-yocto-dev.bb      |   48 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |   18 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    8 ++--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   28 ++++++------
 6 files changed, 81 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-dev.bb

-- 
1.7.10.4



