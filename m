Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A104B7823D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:21:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v58JLvuL026347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Jun 2017 12:21:57 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 12:21:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Jun 2017 15:21:50 -0400
Message-ID: <cover.1496949552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 08 Jun 2017 19:21:58 -0000
Content-Type: text/plain

Hi all,

This pull request includes -stable updates for all the kernels that are
currently in master.  I'll be dropping one kernel as I move to 4.12+ for
the fall release, but for now, they all continue to get updates.

I've done smoke build/boot testing on the updates, but the build matrix
is huge, so I'll keep an eye on any autobuilder results just in case
something slipped through.

We also have some configuration changes and a bug fix to the kern-tools
when a BSP includes a file and inhibits patches.

Cheers,

Bruce

The following changes since commit 4a7612c7a12b9a381fb8343ba9586272b889fc15:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/meta: configuration changes (wifi, kexec and nft)
  kern-tools: avoid syntax errors when inheriting meta data
  linux-yocto-rt: 4.9-rt18
  linux-yocto/4.10: update to v4.10.17
  linux-yocto/4.9: update to 4.9.31
  linux-yocto/4.4: update to v4.4.71

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb        | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb         | 20 ++++++++++----------
 10 files changed, 49 insertions(+), 49 deletions(-)

-- 
2.5.0


