Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 616ED62137
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 09:48:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4C9mvTb021458
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 02:48:58 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 May 2016 02:48:57 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2016 05:48:54 -0400
Message-ID: <cover.1463045020.git.zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH v4 0/2] Yocto Bug #6945
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
X-List-Received-Date: Thu, 12 May 2016 09:48:59 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This has been reviewed several rounds and no more comments are provided so far.
Here are the brief history. More details can be found in the previous threads.

v1 to v2:
 - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
 - Update related doc files
 - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
 - Link built vmlinuz to boot directory for reference

v2 to v3:
 - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order that users can still use the old variables.
 - Run oe_rummake in a loop for every types so that we can add different configurations to them easily in the future.
 - Warn, intead of die, users if one of the types are over the size limit.
 - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
 - Remove the doc parts. They will be submitted yocto-docs later.
 - Change some grep usage to make it more clear.
 - Correct a typo.

v3 to v4:
 - Adjust according to the latest code context

The following changes since commit 7ca60ec8bff7656b4e52f5a4d238913e851da089:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:48:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=zhe%2Fyocto-bug-6945

for you to fetch changes up to 1f37fe5af2c41d0a4e1aa5543466a48d3ae41ddc:

  kernel: Make symbol link to vmlinuz in boot directory (2016-05-11 04:05:08 -0400)

----------------------------------------------------------------
He Zhe (2):
      kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
      kernel: Make symbol link to vmlinuz in boot directory

 meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
 meta/classes/kernel-grub.bbclass          |  44 +++++++++++++++++++++-----------
 meta/classes/kernel-uimage.bbclass        |  22 ++++++++--------
 meta/classes/kernel.bbclass               | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
 meta/conf/documentation.conf              |   3 ++-
 meta/recipes-kernel/linux/linux-dtb.inc   |  49 ++++++++++++++++++++++--------------
 meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
 7 files changed, 218 insertions(+), 109 deletions(-)

-- 
2.8.1


