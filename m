Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58BFB6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:43:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPDgx9i026044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Nov 2015 05:42:59 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 05:41:57 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Nov 2015 08:41:52 -0500
Message-ID: <cover.1448458595.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto/4.1: -stable/-rt and old kernel removal warning
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
X-List-Received-Date: Wed, 25 Nov 2015 13:43:04 -0000
Content-Type: text/plain

Hi all,

Here are the latest 4.1 updates. I've built and booted qemu* for the
standard and -rt kernel updates. All appears well.

I've also built core-image-kernel-dev as well as sato to ensure that
there are no unexpected userspace entanglements with this udpate.

I also tested the configuration to see if I could see the warnings
that MartinJ has been seeing, and everything looked clean. If those
warnings are back, I'll dive back in and figure out what is going
on.

Next up on the update schedule is 4.4-rcX and removal of the older
kernels. 

I'm not sure if anyone actually reads these pull requests, but if they
do, the kernel versions scheduled to be dropped from master are:

  - 3.14
  - 3.19

Since we'll have 4.1, 4.4 and potentially 4.5+ for the next release.

Cheers,

Bruce

The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/4.1: update to v4.1.13
  linux-yocto/4.1: fsl-mpc8315e-rdb: Enable EEPROM
  linux-yocto-rt/4.1: update to -rt15
  linux-yocto/4.1: Bluetooth:Fix the connection fail of 6lowpan over BT
    LE

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.1.0


