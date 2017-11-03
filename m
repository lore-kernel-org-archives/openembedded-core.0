Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A83596FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32jYeI022622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:45:34 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:24 -0400
Message-ID: <cover.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9][stable] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:34 -0000
Content-Type: text/plain

Hi all,

This pull request is mainly for the -stable, and bug fixes that I gathered
during the last part of the 2.4 release.

I'm clearing my queue before I do the next round of -stable updates and
start removing kernels in preparation for 4.14 and feature work.

All of these commits are suitable for backport to the rocko stable branch.

I've built and booted on all the relevant arches via qemu .. but as usual,
the extra autobuilder coverage will help shake out anything subtle.

Cheers,

Bruce

The following changes since commit 5dacc5516718efdf0a470e074a5c05b1ecf8cc15:

  bitbake: main: Give a user readable error if we can't locate topdir (2017-10-31 09:09:21 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto-dev: bump to v4.14-rcX
  linux-yocto/4.12: configuration and feature updates
  linux-yocto/4.4: update to v4.4.93
  linux-yocto/4.9: update to v4.9.57
  linux-yocto/4.12: update to v4.12.14
  linux-yocto/4.12: stable backports and bug fixes
  kern-tools: make fuzzy matching optional
  linux-yocto/4.12: configuration fragment updates
  linux-yocto/4.12: ide:ide-cd: fix kernel panic resulting from missing
    scsi_req_init

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb         |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb        | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb         | 20 ++++++++++----------
 11 files changed, 50 insertions(+), 50 deletions(-)

-- 
2.5.0


