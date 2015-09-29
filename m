Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF62B77035
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:31:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8TEVaqe024854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 07:31:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 07:31:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 29 Sep 2015 10:31:31 -0400
Message-ID: <cover.1443536748.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 29 Sep 2015 14:31:41 -0000
Content-Type: text/plain

Hi all,

Here is the latest round of linux-yocto related changes.

The first three are integrations of BSP patches/fixes, and a -stable
update for 4.1. I've built and booted them here. 

The only trick with the axxia BSP integration is that there's a branch
rename for standard/preempt-rt to standard/preempt-rt base, so when I 
push the rename, builds of -rt won't be happy until the related recipe
change merges to the tree. But otherwise, it is pretty standard stuff.

Khem noticed that in my quest to speed up and simplify the way that
layers patch and configure the tree, that I went too far and broke 
multiple layers patching the tree.

So the final fix is a tweak to the tools to address that, which both
Khem and I have tested.

Cheers,

bruce


The following changes since commit f78f90240a3041be426c6ba9085849352164ee8b:

  bitbake: prserv/serv.py: Better messaging when starting/stopping the server with port=0 (2015-09-28 12:00:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto-rt/4.1: integrate axxia BSP
  linux-yocto/4.1: update to 4.1.8 -stable
  linux-yocto/4.1: braswell bug fixes
  kern-tools: fix multi-layer patch application

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb      |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb         | 20 ++++++++++----------
 4 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.1.0


