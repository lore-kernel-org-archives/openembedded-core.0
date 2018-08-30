Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBAC74582
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:45:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UDjovl001152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 06:45:51 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 06:45:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 09:45:40 -0400
Message-ID: <cover.1535636375.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel: consolidated pull request
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
X-List-Received-Date: Thu, 30 Aug 2018 13:45:51 -0000
Content-Type: text/plain

Hi all,

Now that 4.18 is in master, this is the next round of config updates,
-stable merges and the removal of the older versioned recipes.

There's also a devsrc fix for the arm targets. With this tweak, we can
once again build the test modules on target.

My last series fixed the kernel configuration audit output, and so we
now have some configuration updates to cleanup warnings and drop
obselete options.

Finally, we remove 4.12 and 4.15 from master, leaving 4.14 and 4.18 as
active kernels. I'll follow up with patches to other repos as required
if any references to those versions remain.

Bruce

The following changes since commit 4434777705cf49300a7d2c9ca8fa3080d551d795:

  bitbake: tests/fetch: Update gnome.org urls after upstream changes (2018-08-29 10:43:23 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  kernel-devsrc: fix arm/arm64 target module build
  linux-yocto: drop 4.15 versioned recipe
  linux-yocto/4.12: drop versioned recipes
  linux-yocto/4.18: remove obselete bsp configuration options
  qemuarm64: add compatibility with -rt
  linux-yocto/4.18: update to 4.18.5
  linux-yocto/4.14: update to v4.14.67
  kernel-yocto/cfg: configuration warning fixes

 meta/recipes-kernel/linux/kernel-devsrc.bb         |  4 ++
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 38 -----------------
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 41 -------------------
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  8 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 25 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 26 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 46 ---------------------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++-----
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 47 ----------------------
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++-----
 13 files changed, 37 insertions(+), 256 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.12.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.15.bb

-- 
2.5.0


