Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 288EB738AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:57:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1J9v0dI029172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 01:57:00 -0800
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.175) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Feb 2016 01:56:59 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 17:56:50 +0800
Message-ID: <cover.1455874404.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 19 Feb 2016 09:57:02 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

v1 to v2:
 - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
 - Update related doc files
 - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
 - Link built vmlinuz to boot directory for reference

The following changes since commit ed20c6ca446a8788615e497bd4452195537deab5:

  epiphany: Add libxml2-native to DEPENDS (2016-02-19 01:01:26 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945

for you to fetch changes up to 5ddb8ef58e1cd3c4b95de6439894510641f2e70a:

  kernel: Make symbol link to vmlinuz in boot directory (2016-02-19 04:23:28 -0500)

----------------------------------------------------------------

He Zhe (2):
  kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
  kernel: Make symbol link to vmlinuz in boot directory

 documentation/ref-manual/ref-tasks.xml             |   8 +-
 documentation/ref-manual/ref-variables.xml         |  10 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
 meta/classes/kernel-fitimage.bbclass               |  20 ++-
 meta/classes/kernel-grub.bbclass                   |  44 +++--
 meta/classes/kernel-uimage.bbclass                 |  22 +--
 meta/classes/kernel.bbclass                        | 184 ++++++++++++++-------
 meta/conf/documentation.conf                       |   3 +-
 meta/conf/machine/qemumips.conf                    |   2 +-
 meta/conf/machine/qemumips64.conf                  |   2 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |  49 +++---
 meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
 .../target/arch/mips/conf/machine/machine.conf     |   2 +-
 .../target/arch/mips64/conf/machine/machine.conf   |   2 +-
 .../target/arch/qemu/conf/machine/machine.conf     |   2 +-
 15 files changed, 228 insertions(+), 126 deletions(-)

-- 
1.9.1


