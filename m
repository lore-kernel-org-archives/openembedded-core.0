Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27F5C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:08:27 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.46943.1748336903622697064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GZsG5n+K;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso28901491fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748336902; x=1748941702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymzRLX8mHGWIXTl5rAqgtK+/CGnBh+2kv1JenCJbhYY=;
        b=GZsG5n+KRv+qtyENJVgPVzIxLrHC+1d0d7h2kH5FIvIPX43XGhq3CWEoeD0KPARPcX
         6OntZawDL5DjQ8dhGPYJ3OZSmRL6AcWe+C6BXAfeUVHqtSVA3L2lvboKqkp/NatOdydJ
         1KU565au/1bHUKny3EndpNE704+3a2gVv+o9JfsLtQCuFRpPJzcqTJtAoDyUWvv45HAG
         VlESMpcGWqL37VIwIs41iaffU3Ftvgx/CGxXyBR9wdmJxu4ydwcYdzH0WKdu4/er8zJF
         HKKnPaJt7nMTPpua47+YloUJkEQHA6AnH6hftrRfpVScAVex+ofOiidpPNU/wXGV2rOK
         8mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336902; x=1748941702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymzRLX8mHGWIXTl5rAqgtK+/CGnBh+2kv1JenCJbhYY=;
        b=Z3Il3pWxfr/l/zJMWHBf0OrBbSXDUL/QleAWbSgOY1lp9aiQA8YFX7ZTaXHArygTJ5
         pg+aQC8xtePIoseVUOdL0vUvUa9TkpyI7r1C33rBw3DdfKKEn+qqwnLTuq+w1NaXI5yq
         XvNaDkYbCOTiVvjM4aFFgTWUvSx8Lw/IDq1sEW64tgEa6SaGxAua2/53RWuHckDKRNaI
         TwAyfhVrUPBd0P2J41svQkyTV9XWqBixkRi2mgkARisuY0m5WNYQynMEzx4cmH6/S8/4
         HR1OdwiNxd5s3X77XeOdFdcltzhLy6tnrGRxrnaTlAlV047X0ZcgLgluf82u6kgPbxpJ
         J50w==
X-Gm-Message-State: AOJu0YwOPQrhMcv/G3D3JGk+XU45VWhjBBsqNshIyfKM3/QDwlsZGfPi
	2NyF47p1NImxh8r0hc87n1VVIklC3pwKDXD43iR5eUHRTro8/m6ng0Pq7E7AMEQcWb1QEMYSx8M
	MTdfKxW4=
X-Gm-Gg: ASbGncseQjohNjMAW8FszITTRda0q3h551UxU24LTvSTfeHClOTDxVHA/aiCCrQoNX1
	kMzdbFQ7AZPM6E9qzTs/Akpi4itR2N9Ka1B6snRhshZDJfRtvUVH73TqBrnK+Wh82XwDQsQ5L3W
	dwSZhIXxo5lx7HCImifaTHrWbxc9vG3i+MioKGGWocLaPwpERRTmXcFbDnSyROqT7OcBFK8Um7i
	Cq9L/V+vd3YVLNiqTmK4/B0LOnolQpnod5oHBdLS8o6NwxCJaO6TvqcwH3VcNY2umDSb6+RhRO9
	koFPdqL8NTYY2G447gk3V9Nmd4LGPxMR0i32c5uC/vq50VXSOLb9lMA9tgywUJHDOwZhB/QOeT+
	3c6k75yhyaat54buZvL4H4Vu5
X-Google-Smtp-Source: AGHT+IET1TylKvo5RrUotmXUqJZEW1BudhQDBl9wp2ElE7/MiGm50YGUmV3Z7An5khjPyZnNZQ0Uzg==
X-Received: by 2002:a05:651c:b20:b0:30b:cd68:b68d with SMTP id 38308e7fff4ca-3295b9ba38cmr32282881fa.10.1748336901685;
        Tue, 27 May 2025 02:08:21 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6d358ecbsm2290211fa.17.2025.05.27.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:08:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 4/4] oeqa selftest uboot.py: add qemu KVM test case
Date: Tue, 27 May 2025 12:07:57 +0300
Message-ID: <20250527090758.540188-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527090758.540188-1-mikko.rapeli@linaro.org>
References: <20250527090758.540188-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217293

Add a test case to boot target system via u-boot
using qemu with KVM. This was broken recently
and workaround proposed to u-boot. Test case
works with genericarm64 and qemuarm64 target machines
compiled and tested on aarch64 build host with KVM
support.

Test execution time with full sstate cache is
around 170 seconds. qemu boot itself takes just
a few seconds to full userspace.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 62 ++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 2 deletions(-)

v5: added WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot" to make
    sure EFI loader is compiled before wic runs, fixes for this are queued
    separately, hopefully fixes autobuilder side boot failure

v4: use skipIfNotBuildArch, variable for image name except config where
    bitbake syntax causes python parsing errors when replacing variables,
    check that target host arch and build arch are the same for KVM to work,
    fixed QB_DRIVE_TYPE syntax to include /dev/ path,
    tested on aarch64 build machine and genericarm64 and qemuarm64 target machines

v1: https://lists.openembedded.org/g/openembedded-core/message/217107

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 96da4efb06..4e203c4741 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -6,8 +6,8 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
-from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars, runCmd
+from oeqa.core.decorator.data import skipIfNotArch, skipIfNotBuildArch
 from oeqa.core.decorator import OETestTag
 
 uboot_boot_patterns = {
@@ -41,3 +41,61 @@ QEMU_USE_KVM = "False"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(status, 1, msg=output)
             self.assertTrue("U-Boot" in output, msg=output)
+
+    @skipIfNotArch(['aarch64'])
+    @skipIfNotBuildArch(['aarch64'])
+    @OETestTag("runqemu")
+    def test_boot_uboot_kvm_to_full_target(self):
+        """
+        Tests building u-boot and booting it with QEMU and KVM.
+        Requires working KVM on build host. See "kvm-ok" output.
+        """
+
+        runCmd("kvm-ok")
+
+        image = "core-image-minimal"
+        vars = get_bb_vars(['HOST_ARCH', 'BUILD_ARCH'], image)
+        host_arch = vars['HOST_ARCH']
+        build_arch = vars['BUILD_ARCH']
+
+        self.assertEqual(host_arch, build_arch, 'HOST_ARCH %s and BUILD_ARCH %s must match for KVM' % (host_arch, build_arch))
+
+        self.write_config("""
+QEMU_USE_KVM = "1"
+
+# Using u-boot in EFI mode, need ESP partition for grub/systemd-boot/kernel etc
+IMAGE_FSTYPES:pn-core-image-minimal:append = " wic"
+
+# easiest to follow genericarm64 setup with wks file, initrd and EFI loader
+INITRAMFS_IMAGE = "core-image-initramfs-boot"
+EFI_PROVIDER = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd-boot", "grub-efi", d)}"
+WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
+WKS_FILE = "genericarm64.wks.in"
+
+# use wic image with ESP for u-boot, not ext4
+QB_DEFAULT_FSTYPE = "wic"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+QB_DEFAULT_BIOS = "u-boot.bin"
+
+# let u-boot or EFI loader load kernel from ESP
+QB_DEFAULT_KERNEL = "none"
+
+# virt pci, not scsi because support not in u-boot to find ESP
+QB_DRIVE_TYPE = "/dev/vd"
+# qemu usb causes u-boot reset atm
+QB_OPT_APPEND = ""
+""")
+        bitbake("virtual/bootloader %s" % image)
+
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
+        with runqemu(image, ssh=False, runqemuparams='nographic kvm %s' % runqemu_params) as qemu:
+
+            # boot to target and login worked, should have been fast with kvm
+            cmd = "dmesg"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(status, 1, msg=output)
+            # Machine is qemu
+            self.assertTrue("Machine model: linux,dummy-virt" in output, msg=output)
+            # with KVM enabled
+            self.assertTrue("KVM: hypervisor services detected" in output, msg=output)
-- 
2.43.0


