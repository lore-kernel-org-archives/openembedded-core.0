Return-Path: <zhe@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEF9D73BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:11:53 +0000 (UTC)
Received: from ala-lpggp4.wrs.com (ala-lpggp4.wrs.com [147.11.103.217])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6HABrnl006331
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jul 2015 03:11:53 -0700 (PDT)
Received: (from zhe@localhost)
	by ala-lpggp4.wrs.com (8.13.8/8.13.8/Submit) id t6HABrRn003922;
	Fri, 17 Jul 2015 03:11:53 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 03:11:50 -0700
Message-Id: <1437127912-3881-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.3.5
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 0/2] Yocto Bug #6945
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
X-List-Received-Date: Fri, 17 Jul 2015 10:11:56 -0000

From: Zhe He <zhe.he@windriver.com>

 - To support building packaging and installing multi types of kernel
   images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
   as a list.
 - Modify wherever reference KERNEL_IMAGETYPE accordingly.

He Zhe (2):
  kernel: Define KERNEL_IMAGETYPE as a list
  kernel: Pass sysroot mkimage to kernel makefile

 meta/classes/image_types.bbclass         |   6 +-
 meta/classes/kernel-fitimage.bbclass     |  22 +++---
 meta/classes/kernel-grub.bbclass         |  47 ++++++++----
 meta/classes/kernel-uimage.bbclass       |  31 +++++---
 meta/classes/kernel.bbclass              | 127 ++++++++++++++++++++++---------
 meta/conf/documentation.conf             |   2 +-
 meta/lib/oeqa/controllers/masterimage.py |   2 +-
 meta/lib/oeqa/targetcontrol.py           |   2 +-
 meta/recipes-kernel/linux/linux-dtb.inc  |  15 ++--
 scripts/test-remote-image                |   2 +-
 10 files changed, 175 insertions(+), 81 deletions(-)

Cc: Bruce Ashfield <bruce.ashfield@windriver.com>

