Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9F976873
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:47:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7AClRKa020537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Aug 2015 05:47:27 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 10 Aug 2015 05:47:27 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 20:46:57 +0800
Message-ID: <cover.1439204789.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH v4 0/1] Yocto Bug #6945
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
X-List-Received-Date: Mon, 10 Aug 2015 12:47:31 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

 - Add KERNEL_IMAGETYPES to support building packaging and installing
multi types of kernel images, such as zImage uImage, at one time.
 - KERNEL_IMAGETYPE works as it did.
 - v2: Update with the latest oe-core
 - v3: Add KERNEL_IMAGETYPES, leave KERNEL_IMAGETYPE as is
 - v4: Turn package name to lower case to meet opkg's requrement
       Modify "if test" in kernel-fitimage.bbclass and kernel-uimage.bbclass


He Zhe (1):
  kernel: Add KERNEL_IMAGETYPES to build multi types of kernel at one
    time

 meta/classes/kernel-fitimage.bbclass    |  21 +++---
 meta/classes/kernel-grub.bbclass        |  46 +++++++----
 meta/classes/kernel-uimage.bbclass      |  22 +++---
 meta/classes/kernel.bbclass             | 130 +++++++++++++++++++++++---------
 meta/conf/documentation.conf            |   1 +
 meta/recipes-kernel/linux/linux-dtb.inc |  81 ++++++++++++--------
 6 files changed, 199 insertions(+), 102 deletions(-)

-- 
1.9.1


