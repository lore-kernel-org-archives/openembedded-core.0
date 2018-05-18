Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10FA675073
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 15:06:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4IF5D9G004304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 May 2018 08:06:09 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 May 2018 08:05:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 May 2018 11:05:47 -0400
Message-ID: <cover.1526655802.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 18 May 2018 15:06:35 -0000
Content-Type: text/plain

Hi all,

Here's the next round of -stable and -dev kernel updates. I've also included
khem's gcc8 fixes in this round, so we should be good to go from the kernel
point of view on that front.

As usual, I built and booted this as much as possible, but there are a lot
of combos to cover. If there are any issues, let me know and I'll take care
of them.

Cheers,

Bruce


The following changes since commit 13cc30cd7de4841990b600e83e1249c81a5171dd:

  local.conf.sample.extended: Drop obsolete rpc and libnsl (2018-05-15 11:07:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/4.12: update to v4.12.22
  linux-yocto/4.12: update to v4.12.23
  linux-yocto-dev: update to v4.17+
  linux-yocto/4.14: update to v4.14.30
  linux-yocto/4.15: update to v4.15.18
  linux-yoct/4.12: update to v4.12.24
  linux-yocto/4.14/4.15: gcc8 fixes

 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  4 +++-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto.inc          |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
 11 files changed, 52 insertions(+), 50 deletions(-)

-- 
2.5.0


