Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8643371DE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:31:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so10326854wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fzp9rShrR5Sftc8uQONwkp0yrGeE7Ycn0jQRcnXHigI=;
	b=N+iSUQiWXmdcG/alt+M8tBzFYZgicvuHqgJQ//FzL3jX96DNZhT76DTR0vpeVJq0yE
	GmkIlr7+Yqz/AaQXaBT2aLHvs5nLGYVYXZL0+64X+O9QrEY4+jj4bCLK1s2V8YJpym59
	C5YtsTMI1Nu1/qiT02BqUqfBD5HmXzp6JrTMNO+oYSdVPNDn0zmNlqc4RRa2K84wj2Pl
	m5+RtULw2J1n15EtdHuafLTCZoYAHYR85U2074Xzb/tEbKQqYr4V+69phav9LnWZC4T6
	6/zMspM0biuA8cSBOcSWWhy5rcC/g7ssrtN+LLoS3eP/zmP+nKW1q94jRiwmGpoBonyF
	9W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fzp9rShrR5Sftc8uQONwkp0yrGeE7Ycn0jQRcnXHigI=;
	b=W37cq/NFjlVUxg/soRkn9RBDr184FTpRd0kiIpYePY+yAjE4MQJ65IBD88njemdzpd
	BKgru3AD6YKJngfaRrB4mLDwCrc4gnnyxt2/PaOZt7vA5JJfED9sPHPj0+PYPoj9wW9/
	PuVnJczByjRv91oMI1LeEFEqn+C4FAtCgOFU0yWO95Wz/fcCPaZPgzF2xs8X4nAYa61U
	T3NsgqJvLkCfmQk5pWFvcVm9rrpfb0MMZcVSFv5tSYBm50zRLWanYAiUfqKNlcQgph1J
	vZumTgmf9T9cep57uZqrXFnwhecPV9NeUtCOEbOK5ZbFffy6ASc9zPws449RbBa90FcK
	59Pg==
X-Gm-Message-State: AIVw112dcgGNIvo0w+TjzvsKND9XHtNsb3OF88fcdcUhF6/Bryoczr74
	d5pVC84YTm2bIy+i
X-Received: by 10.80.147.91 with SMTP id n27mr13307728eda.84.1501489889152;
	Mon, 31 Jul 2017 01:31:29 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	t36sm7408923edb.38.2017.07.31.01.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 01:31:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 10:31:21 +0200
Message-Id: <1501489881-8481-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: drop do_bootdirectdisk do_vmimg references
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
X-List-Received-Date: Mon, 31 Jul 2017 08:31:28 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:
[ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]

Also need drop their references.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/grub-efi.bbclass     | 1 -
 meta/classes/license.bbclass      | 9 ++-------
 meta/classes/rm_work.bbclass      | 2 +-
 meta/classes/systemd-boot.bbclass | 1 -
 meta/conf/documentation.conf      | 1 -
 5 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index df7fe18..610479b 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -17,7 +17,6 @@
 # ${GRUB_ROOT} - grub's root device.
 
 do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
-do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUB_CFG_VM = "${S}/grub_vm.cfg"
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d4be478..4f7842c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -255,14 +255,9 @@ def get_boot_dependencies(d):
     """
 
     depends = []
-    boot_depends_string = ""
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-    # Only bootimg and bootdirectdisk include the depends flag
-    boot_tasks = ["do_bootimg", "do_bootdirectdisk",]
-
-    for task in boot_tasks:
-        boot_depends_string = "%s %s" % (boot_depends_string,
-                d.getVarFlag(task, "depends") or "")
+    # Only bootimg includes the depends flag
+    boot_depends_string = d.getVarFlag("do_bootimg", "depends") or ""
     boot_depends = [dep.split(":")[0] for dep
                 in boot_depends_string.split()
                 if not dep.split(":")[0].endswith("-native")]
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index badeaeb..0faa4a6 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -71,7 +71,7 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
-            *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*do_vmimg*|*do_write_qemuboot_conf*)
+            *do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*)
                 i=dummy
                 break
                 ;;
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 9f8f75e..733d380 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -10,7 +10,6 @@
 # (images built by image-live.bbclass or image-vm.bbclass)
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
-do_bootdirectdisk[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
 EFIDIR = "/EFI/BOOT"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 35b9103..a55e283 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -56,7 +56,6 @@ do_testsdk[doc] = "Installs an SDK and performs runtime tests on the tools insta
 do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the U-Boot bootloader"
 do_unpack[doc] = "Unpacks the source code into a working directory"
 do_validate_branches[doc] = "Ensures that the source/meta branches are on the locations specified by their SRCREV values for a linux-yocto style kernel"
-do_vmimg[doc] = "Creates an image for use with VMware or VirtualBox compatible virtual machine hosts (based on IMAGE_FSTYPES either .vmdk or .vdi)"
 
 # DESCRIPTIONS FOR VARIABLES #
 
-- 
2.7.4


