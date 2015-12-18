Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62B25731BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:44:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBIKicun006337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Dec 2015 12:44:38 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 12:44:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 15:44:31 -0500
Message-ID: <cover.1450471022.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidate pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2015 20:44:40 -0000
Content-Type: text/plain

Hi all,

To get some of the prep out of the way early for the 2.1 release, consider
this a "needs more builds and testing" pull request. I've built for all
arches (both with -dev and 4.1), booted core-image-minimal and sato, and
built core-image-kernel-dev .. but when you are balancing all the combos,
some things can slip through.

4.4 is the next LTSI kernel, and will be the newest versioned/named recipe
for the release, so this series does the following:

 - updated -dev to 4.4-rc5
 - removed 3.14 and 3.19
 - fixes recipes/package that broke during 4.4/4.1 testing
 - has a minor regression fix for kernel checkouts

I'll follow up with patches to the yocto mailing list to remove references to
the 3.14 and 3.19 kernels.

Cheers,

Bruce

The following changes since commit 5f406915b5e26761faa4ea5e0edd887ac5ae6e2f:

  bitbake: toaster: remove 2 confusing parameters (2015-12-18 13:51:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  yaffs2: fix checkpoint functionality
  lttng-modules: fix build issue against kernel 4.4
  linux-yocto-dev: bump to 4.4-rcX
  linux-yocto/4.1: update to v4.1.15
  linux-yocto: remove 3.14 and 3.19 recipes

Jianxun Zhang (1):
  kernel-yocto: fix checkout bare-cloned kernel repositories

 meta/classes/kernel-yocto.bbclass                  | 13 +++++--
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 29 ---------------
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 23 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 23 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 42 ----------------------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 42 ----------------------
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 +++++------
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |  2 +-
 11 files changed, 28 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.19.bb

-- 
2.1.0


