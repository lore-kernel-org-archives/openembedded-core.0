Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6990734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 07:23:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6L7NqxH002932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 00:23:52 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 21 Jul 2015 00:23:51 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jul 2015 15:23:48 +0800
Message-ID: <cover.1437461993.git.zhe.he@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH v2 0/2] Yocto Bug #6945
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
X-List-Received-Date: Tue, 21 Jul 2015 07:23:53 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

 - To support building packaging and installing multi types of kernel
   images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
   as a list.
 - Modify wherever reference KERNEL_IMAGETYPE accordingly.
 - Pass mkimage in sysroot to kernel makefile by NATIVE_MKIMAGE to avoid
   depending on build machine's, when KEEPUIMAGE is "yes".
 - v2: update with the latest oe-core

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

-- 
2.1.0


