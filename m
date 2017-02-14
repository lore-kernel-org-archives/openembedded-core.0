Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC4F560745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1ELEQ8d023944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Feb 2017 13:14:26 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:25 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:14 -0500
Message-ID: <cover.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:29 -0000
Content-Type: text/plain

Hi all,

Here is the latest consolidated pull request for the 4.x linux yocto
kernels.

Nothing really earth shattering here, some config updates, -stable
integrations, -rt refreshes and a bump of linux-yocto-dev to 4.10.

Cheers,

Bruce

The following changes since commit e758547db9048d4aa1c1415d6af8072f519fae24:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:52:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Awais Belal (1):
  kernel-yocto.bbclass: ensure repatching when HEAD is checked out

Bruce Ashfield (10):
  linux-yocto/4.9: bump to v4.9.8
  linux-yocto/4.8: update to v4.8.18
  linux-yocto-rt/4.9: integrate 4.9-rt4
  linux-yocto/4.9: Intel-quark: Add intel-quark-preempt-rt bsp
    configuration
  linux-yocto/4.8/4.9: fix tpm.cfg and add dm-verity
  linux-yocto/4.9: update to v4.9.9
  linux-yocto-dev: bump to v4.10+
  linux-yocto/4.4: meta/configuration updates
  kernel-yocto: trivial: remove extra } from bsp_definition
  linux-yocto-rt/4.9: update to 4.9-rt6

 meta/classes/kernel-yocto.bbclass                    |  6 +++++-
 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb         |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb         |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb         | 20 ++++++++++----------
 12 files changed, 42 insertions(+), 38 deletions(-)

-- 
2.5.0


