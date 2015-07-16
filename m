Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 815F47415A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 05:03:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G537da002189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 22:03:07 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 22:03:07 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 16 Jul 2015 01:03:04 -0400
Message-ID: <cover.1437022827.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: mips build fixes & config updates
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
X-List-Received-Date: Thu, 16 Jul 2015 05:03:12 -0000
Content-Type: text/plain

Richard,

Here are two fixes that I moved up in my queue in front of the 4.1 
kernel, and stable updates to other kernels. 

This fixes the mips build issues we've been seeing with gcc5.x and
the 4.9.3 update.

There are minor updates to 3.19 as well, that I wanted to get out now,
rather than sit on them.

Next up is updates to 4.1, the libc-headers and removal of older 
kernels.

Cheers,

Bruce

The following changes since commit ba07a69f3dc8fb798e372130bf665d059fed9d42:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:47:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.14: fix gcc 4.9.4/5.1 build issues, yaffs2 memory leak
  linux-yocto/3.19: drm and axxia updates

 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 18 +++++++++---------
 5 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.1.0


