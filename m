Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 095AD6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:20:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1OCKCCr008951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 04:20:12 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Feb 2016 04:20:12 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 07:20:08 -0500
Message-ID: <cover.1456315808.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3 0/2] Yocto Bug #6945
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
X-List-Received-Date: Wed, 24 Feb 2016 12:20:14 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

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

The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945

for you to fetch changes up to dc52a1efbb8248ea274a1cd0cca5734290b3025f:

  kernel: Make symbol link to vmlinuz in boot directory (2016-02-24 07:08:16 -0500)

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

He Zhe (2):
  kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
  kernel: Make symbol link to vmlinuz in boot directory

 meta/classes/kernel-fitimage.bbclass      |  20 ++--
 meta/classes/kernel-grub.bbclass          |  44 ++++---
 meta/classes/kernel-uimage.bbclass        |  22 ++--
 meta/classes/kernel.bbclass               | 187 +++++++++++++++++++++---------
 meta/conf/documentation.conf              |   3 +-
 meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
 meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
 7 files changed, 218 insertions(+), 109 deletions(-)

-- 
1.9.1


