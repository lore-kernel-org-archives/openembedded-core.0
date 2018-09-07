Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4DF8797A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 03:34:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w873YS6S014597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 20:34:28 -0700 (PDT)
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 20:34:27 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Sep 2018 11:32:11 +0800
Message-ID: <1536291131-24332-2-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536291131-24332-1-git-send-email-lu.jiang@windriver.com>
References: <1536291131-24332-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Cc: trini@konsulko.com
Subject: [PATCH] wic:mkefidisk:add use-uuid for all partitions
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
X-List-Received-Date: Fri, 07 Sep 2018 03:34:28 -0000
Content-Type: text/plain

Add use-uuid for all partitions on mkefidisk.wks.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 scripts/lib/wic/canned-wks/mkefidisk.wks | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 9f534fe..f06f6cd 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -2,10 +2,10 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
 
-part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --label msdos --active --align 1024 --use-uuid
 
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part / --source rootfs --fstype=ext4 --label platform --align 1024 --use-uuid
 
-part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+part swap --size 44 --label swap1 --fstype=swap --use-uuid
 
 bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
2.7.4


