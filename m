Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7985F77E93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7VJV6CB022227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 12:31:06 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:30:57 -0400
Message-ID: <cover.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto: conslidated pull request
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:06 -0000
Content-Type: text/plain

Hi all,

Now that 4.12 + headers are in the tree, this is the next (and possibly final)
around of -stable updates for the active kernels.

I've built and booted them on all four architectures. But as usual, this is a
lot of combinations to confirm.

The 4.12 update doesn't specifically address the kernel traces that RP has
been seeing, but it also doesn't regress things here. I'd be interested to
know if they help/hinder in the search to find the root cause.

I'll of course continue to track it down myself.

I also have some functionality fixes as well as configuration updates as part
of this update.

Cheers,

Bruce

The following changes since commit 52d71c17ffd2d58699bf05bc85e0dd0d49e51021:

  image_types.bbclass: improve reproducibility of .gz files (2017-08-31 17:41:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/4.10: fix aufs build
  linux-yoct/4.12: fix yaffs2 build
  linux-yocto/4.10/4.9: fix BRCMFMAC_PROTO_MSGBUF warning
  linux-yocto/4.12: silence qeumarma9 config warnings
  linux-yocto/4.12: update to v4.12.10
  linux-yocto/4.9: update to v4.9.46
  linux-yocto/4.4: update to v4.4.85

 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 20 ++++++++++----------
 12 files changed, 61 insertions(+), 61 deletions(-)

-- 
2.5.0


