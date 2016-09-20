Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA896011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 15:16:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8KFGdhC027171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Sep 2016 08:16:40 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 08:16:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 20 Sep 2016 11:16:35 -0400
Message-ID: <cover.1474384321.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 20 Sep 2016 15:16:41 -0000
Content-Type: text/plain

Hi all,

Here is the latest update of content for the 4.8 kernel, it contains:

 - 4.8 -rc7
 - yaffs2 fixes from Kevin Hao
 - aufs is available
 - configuration warning fixes
 - preempt-rt

I've also included a fixup of the 4.1.32 and configuration warning fixes
for that tree.

Full disclosure: there are changes floating around for 4.1, 4.4, 4.8 for
both the core tree, the hardware reference boards and for the kernel
meta data.

I smoke tested what I could, and boot tested 4.8 and 4.1 to make sure they
were sane. But there are a lot of moving parts here, so the autobuilder will
be the final say if I managed to keep everything straight (while getting it
all done in less than a day).

Cheers,

Bruce

The following changes since commit 49a7839e602eac2c43415d9c8f17ad8315fd1da5:

  build-appliance-image: Create image in correct location (2016-09-19 08:58:10 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.1: 4.1.32 content and configuration warning fixes
  linux-yocto/4.8: integrate 4.8-rc7
  linux-yocto/4.8: introduce preempt-rt

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 6 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.5.0


