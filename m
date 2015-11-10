Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91BE173D46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 02:52:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAA2qutl015525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Nov 2015 18:52:56 -0800
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 9 Nov 2015 18:52:55 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Nov 2015 10:52:46 +0800
Message-ID: <cover.1447063422.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v5 0/1] Yocto Bug #6945
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
X-List-Received-Date: Tue, 10 Nov 2015 02:52:58 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This patch has been discussed previously and modified according to Richard's
suggestions, and adjusted against the latest code context.

 - Add KERNEL_IMAGETYPES to support building packaging and installing
multi types of kernel images, such as zImage uImage, at one time.
 - KERNEL_IMAGETYPE works as it did.
 - v2: Update with the latest oe-core
 - v3: Add KERNEL_IMAGETYPES, leave KERNEL_IMAGETYPE as is
 - v4: Turn package name to lower case to meet opkg's requrement
       Modify "if test" in kernel-fitimage.bbclass and kernel-uimage.bbclass

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945

for you to fetch changes up to 60c8a07a0e130d056862f6303cac080eb0fbc2d0:

  kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time (2015-11-09 04:55:00 -0500)

----------------------------------------------------------------

He Zhe (1):
  kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time

 meta/classes/kernel-fitimage.bbclass    |  21 +++--
 meta/classes/kernel-grub.bbclass        |  46 ++++++---
 meta/classes/kernel-uimage.bbclass      |  22 +++--
 meta/classes/kernel.bbclass             | 159 ++++++++++++++++++++++----------
 meta/conf/documentation.conf            |   1 +
 meta/recipes-kernel/linux/linux-dtb.inc |  80 +++++++++-------
 6 files changed, 212 insertions(+), 117 deletions(-)

-- 
1.9.1


