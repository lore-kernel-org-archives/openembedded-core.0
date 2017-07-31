Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C91E578348
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:56:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t138so15863682wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 01:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=51vaackDptD7fk3fZW619+OOfUjECjlfsgiOfzRFCHA=;
	b=Ksc9AC3AmAsfP0+aEkDzUlY/COtDRWL5O4Ju4EIm76pzAOF8blKevwpEdnT8fLgXI3
	6KCG9iiMX7lydOuLypxCr+rLua/NOy1OqLYQOFW/3BZ426kTZBHwa9SRUFv978Ttfc0W
	/pjNrsNcAjLKZyDBXfJK1wsdUs42uQxOUIL1X6SUyV+wSsLVJulZvmcviPBLIJC8KJZb
	RjebABmJeJkG0fVJN3vC9Ywapfslyn9WdU6mPkirJzsg5vMnJ4OuRdu3B9kQkhAfc6Aq
	uHX8l21FcD2HF4jO80ht0kj/WUKTbqoRKAN+uSpdJcVzWBXVLDzWdlFc2d8Qik+DwK7I
	XDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=51vaackDptD7fk3fZW619+OOfUjECjlfsgiOfzRFCHA=;
	b=e6oU3ra4NXGMjD+PCeC0HtTo2nyzpAz4ksN6T8oSbcgjjNqO/alFAmhee0d2KiV4WD
	ZBpxLVLyRYy046UIOLwrFiCXWLNu+gqOqSxfmFFHawb1Y1qlqG5+tt5I96UB+4M/kfeF
	69e+sFaZywLKxuohbP7dJbcWaAxK3yWGzQS3fksKnOj3CCVlm9/truWMSQIRb7ugAwEq
	iGy7USheHLONlt9FmABjeq/Oy+YLuTUPRe0NXfTtkLUnuw8PBFOTjMmIgmYEYxDBkR3u
	qnWM2VCkrgL4FkOHNV0EvU9S2CrQgpDT66iJ3KKLBEGnqYWth6n6lVA+mfqs1ESj7YFT
	EwQg==
X-Gm-Message-State: AIVw110MQ84PnkIfb88P2jO3aT8QZmq34q9hTCG33CTwA5GhLn/pTc1B
	odQv53eD0bYI3RfJ
X-Received: by 10.80.148.130 with SMTP id s2mr13461329eda.106.1501491398363;
	Mon, 31 Jul 2017 01:56:38 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	n2sm13382740edl.73.2017.07.31.01.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 01:56:37 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 10:56:28 +0200
Message-Id: <1501491388-15182-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] meta: drop do_bootdirectdisk do_vmimg references
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
X-List-Received-Date: Mon, 31 Jul 2017 08:56:38 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:
[ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]

Also drop the references to them and image-vm.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/grub-efi.bbclass     | 1 -
 meta/classes/license.bbclass      | 9 ++-------
 meta/classes/rm_work.bbclass      | 2 +-
 meta/classes/systemd-boot.bbclass | 3 +--
 meta/conf/documentation.conf      | 1 -
 5 files changed, 4 insertions(+), 12 deletions(-)

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
index 9f8f75e..9373070 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -7,10 +7,9 @@
 #                        maintenance.
 #
 # Set EFI_PROVIDER = "systemd-boot" to use systemd-boot on your live images instead of grub-efi
-# (images built by image-live.bbclass or image-vm.bbclass)
+# (images built by image-live.bbclass)
 
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


