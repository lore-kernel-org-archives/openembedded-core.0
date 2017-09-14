Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAD1785BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDl3PJ029253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:03 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:02 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:53 -0400
Message-ID: <cover.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:03 -0000
Content-Type: text/plain

Hi all,

This is the last set of -stable and meta data changes for the 2.4
release window. I've also brough aufs4 into the 4.12 tree to keep
it feature consistent with all the previous linux-yocto kernels
(and given some bug reports, folks are using the aufs support).

They are -stable updates, some configuration tweaks and a round of
CVE fixes that won't make -stable before we release.

I'm still trying to track down the reported race in meta data
gathering and the rcu stalls in qemuppc, but no sense holding onto
these while those issues churn.

Cheers,

Bruce

The following changes since commit e3a69364eb1fdbf1dcb98a04b3ddfc8f9841a7fa:

  staging: gracefully abort if two recipes conflict in the sysroot (2017-09-11 17:30:30 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/meta: configuration feature additions
  linux-yocto/4.12: update to v4.12.12
  linux-yocto/4.9: update to v4.9.49
  linux-yocto/4.4: update to v4.4.87
  linux-yocto/4.12: integrate aufs4 core support
  linux-yocto/4.10: bluetooth: CVE-2017-1000251
  linux-yocto/4.12: bluetooth: CVE-2017-1000251
  linux-yocto/4.9: bluetooth: CVE-2017-1000251
  linux-yocto/4.4: bluetooth: CVE-2017-1000251

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


