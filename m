Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 128D06069D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:02:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8I2Iur003461
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Dec 2016 10:02:18 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 09:58:56 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:47 -0500
Message-ID: <cover.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 08 Dec 2016 18:02:19 -0000
Content-Type: text/plain

Hi all,

Here are the pending changes in my queue.

There are a few bug & CVE fixes:

  - aufs warning
  - kernel_configcheck warnings
  - linux-yocto/4.x: CVE-2016-8655
  
Stable updates:

  - v4.1.36
  - v4.4.36
  - v4.8.12

-rt refreshes:

  - 4.4-rt43

And a kern-tools fix to get rid of the last leaking files to /tmp:

 -  kern-tools: ensure that no shared directories are used

I built and booted these on as many machines as possible, but it is a wide
matrix with three kernel versions all getting bumped.

The kern-tools fix is independent of the version bumps, so it is safe to
take, even if the -stable updates happen to show issues.

Cheers,

Bruce

The following changes since commit e38775a1d82e6dc60fc96cf243ecb94be964d9b2:

  kernel-yocto: exit on non-zero return code (2016-12-07 10:46:09 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/4.8: aufs warning and ixgbe calltrace
  linux-yocto/4.4/4.8: Fix remaining kernel_configcheck warnings in
    Intel BSPs
  linux-yoct/4.1: update to v4.1.36
  linux-yocto/4.4: update to v4.4.36
  linux-yocto/4.8: update to v4.8.12
  kern-tools: ensure that no shared directories are used
  linux-yocto-rt/4.4: update to -rt43
  linux-yocto/4.x: CVE-2016-8655

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb         | 20 ++++++++++----------
 10 files changed, 49 insertions(+), 49 deletions(-)

-- 
2.5.0


