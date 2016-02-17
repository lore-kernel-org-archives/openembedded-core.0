Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBD3E731A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:01:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1HA1UqS019993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 02:01:32 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Feb 2016 02:01:29 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 05:01:27 -0500
Message-ID: <cover.1455702479.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Yocto Bug #6945
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
X-List-Received-Date: Wed, 17 Feb 2016 10:01:33 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This patch has been discussed previously and modified according to Richard's
suggestions, and adjusted against the latest code context.

The following changes since commit 152914f2983c5d69001de1d46ce99547fa1e75fe:

  oeqa/parselogs: Whitelist dmi firmware failure message in 4.4 kernels (2016-02-16 23:54:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945

for you to fetch changes up to d36ac8034f8914c57c27a514b9a692c3c1377f42:

  kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time (2016-02-17 04:37:59 -0500)

----------------------------------------------------------------

He Zhe (1):
  kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time

 meta/classes/kernel-fitimage.bbclass    |  20 ++--
 meta/classes/kernel-grub.bbclass        |  44 ++++++---
 meta/classes/kernel-uimage.bbclass      |  22 +++--
 meta/classes/kernel.bbclass             | 169 ++++++++++++++++++++++----------
 meta/conf/documentation.conf            |   1 +
 meta/recipes-kernel/linux/linux-dtb.inc |  49 +++++----
 6 files changed, 202 insertions(+), 103 deletions(-)

-- 
1.9.1


