Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 123CF78844
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBLFnLmj007279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Dec 2017 07:49:21 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:20 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:11 -0500
Message-ID: <cover.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:22 -0000
Content-Type: text/plain

Here is my current queue of linux-yocto* patches. Some are repeats from previous
sends, but are included for completeness sake.

I have some other changes to send, but given that I'm out of the office for the
next week and a half, I'll hold on those workflow changes until I'm back to
normal hours.

I've also re-submitted the linux-yocto-dev + new kernel dependencies change,
anyone using 4.15+ will start running into these dependencies, so I'd like
to get the baseline work on it into the tree and tweak from there.

Cheers,

Bruce

The following changes since commit a2fee27d0a622cd9a40c5a6661b70fee4ec4bf9f:

  oeqa/selftest/cases/wic: update OETestID decorator for test_qemu (2017-12-21 10:21:00 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/4.12: update to v4.12.16
  linux-yocto/4.12: bug fixes and VRF feature addition
  linux-yocto/4.12: ipv4 stable backport and config changes
  linux-yocto/4.x: configuration updates
  linux-yocto/4.12: bug fixes and feature backports
  linux-yocto/4.12: update to v.4.12.18
  linux-yocto-dev: update to v4.15+
  linux-yocto/4.12: common-pc*: enable X2APIC by default
  linux-yocto/4.12: CQM and kmemleak fixes

 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  5 ++++-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |  2 +-
 10 files changed, 27 insertions(+), 24 deletions(-)

-- 
2.5.0


