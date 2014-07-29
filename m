Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9838965CE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 07:05:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T755xl017720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:05:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Jul 2014 00:05:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 00:05:04 -0700
Message-ID: <c0ff1bfc20e5ddbcc7f253f3cedfe9251fa1cc78.1406617454.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406617454.git.liezhi.yang@windriver.com>
References: <cover.1406617454.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image-vmdk.bbclass: use sda rather than hda
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
X-List-Received-Date: Tue, 29 Jul 2014 07:05:06 -0000
Content-Type: text/plain

The modern kernels may not support IDE (CONFIG_IDE=y), but it should
support SCSI in most of the cases. The boot-directdisk.bbclass uses
sda, too.

Remove an extra space from image-live.bbclass and image-vmdk.bbclass to
not confuse the user.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass |    2 +-
 meta/classes/image-vmdk.bbclass |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index c7e6937..7b770fb 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -2,7 +2,7 @@
 AUTO_SYSLINUXCFG = "1"
 INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz"
-SYSLINUX_ROOT = "root=/dev/ram0 "
+SYSLINUX_ROOT = "root=/dev/ram0"
 SYSLINUX_TIMEOUT ?= "10"
 SYSLINUX_LABELS ?= "boot install"
 LABELS_append = " ${SYSLINUX_LABELS} "
diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 703c00e..77b7fac 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -1,7 +1,7 @@
 
 #NOISO = "1"
 
-SYSLINUX_ROOT = "root=/dev/hda2 "
+SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_PROMPT ?= "0"
 SYSLINUX_TIMEOUT ?= "10"
 SYSLINUX_LABELS = "boot"
-- 
1.7.9.5


