Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913EDC5B555
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 12:30:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10165.1748953817613878979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 05:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vy1XvqZC;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5534edc6493so2192151e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 05:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953816; x=1749558616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNAQlanYwemVRwBFJ4fjgTYFameuGlOH1OL9yvBRZiQ=;
        b=vy1XvqZCK04JK9SxAfzUtjEGs5avbIfDHRL+Cyu6hKeojFIcNeB/i0rMTCbqYHB9LC
         G+23K3RBN84ReB4Uh1PbGnlAaI7ufMr3G91UoipLe1ui5XzXgx0FVTo7b8S5ss/g2K/T
         KZTchu3EmULqqIypa/yYgLtlEsp96S20774DLcuf67zvyPhE4VF34DxV6vbqJfMNOPAg
         N5Hk8yOjBvLspsGs9kz+pmkQWxs/lyxKgqKFtnAGCF7yhTxGsc7D2Q0xGtKV2u/CNMJo
         gvwiwmiqiu76JqSqCsbXhcwlf2ngXFOhDoc4ViSZxxmWAIfnZa5tWASKG5Fmgg+Kl01M
         H0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953816; x=1749558616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNAQlanYwemVRwBFJ4fjgTYFameuGlOH1OL9yvBRZiQ=;
        b=sFZoIr4IAsPO0EpogR+Gr5UlKC2lBRQ+YOhdGYHfth3a779dL5MwJLa12K9mKbbRWL
         rRXzmhzZgOs+8Sg4OOd55H1NSrSQW8Pqk2APR4jJBaHDMurxxIwC1hNcsgS5MXsvTcor
         7Y0cVkmPbt8FjuBDUrH6Uqp6qF8EslbljB5HZM78oZ1rJxProUDa8m++6iifAGbE87KU
         Q/TGbj2lTu3C0G8/j9wYuc+8K8rBN9EkhwJvc7CV9TJGVeFFJwpIC+a0WddZpT2jKNE2
         vt320esosnQ1IoUBZaOXqX/U7U8C2sGvgXqXsFx5fSYJMjLczY+vgwt2JXQLGwIf4T+r
         /QpA==
X-Gm-Message-State: AOJu0YwP0PA+AWVGe4wUK9tsw6k7HEvDy0guB326OLucY5XjhUNeGlbz
	bo/uwO4yThsI6BJl88fb1s+RBR7PGSV2js+xydAhAhe3VAJCuFFQZeWpFjY9zgQzEY8ujZxovTi
	0evt7i8A=
X-Gm-Gg: ASbGncv8duEpzKoBKzWfSAkv8nqQ+s31yg6TLPcM3VEgaz8wNy1krhjFqQUX6I2cv7a
	xcr2gk1zOypYb+eS3lXReGsKUaS1YitTIl4J+FNvkcC/biKp4yEkOfXBFUj2d1FxJdoqYv+MQMT
	5ZHHwWo5q6dOHm7xlh5ycdEL75DNyhOMtydA6F12U5cCubFM8/ga6Af9OWojHbm61K3K1WG4AcN
	KKMmfeVByvjWWxVOpQCeMcBkDQCGminTyKpY6JWbXs0ViUUndSPAn0TtyccpzQqh5HVNBWhA5IZ
	ga8NaEnFO29E1LyFwNePE6iV6CIcUpJu2+XIWu0eQhtepP4M/Vf9LCzOe1O71Rpe5LWMN3rKLBK
	sKxPiQsx1ha9LryQ4fJkkmWus13Tk
X-Google-Smtp-Source: AGHT+IHTpaBxzfIeh7hlCbJUNmKVQP6T7MdOzdEpnsomgNtIYIdD1DPKeAp+/B291Gj2OWI9m9wf8w==
X-Received: by 2002:a05:6512:3ca6:b0:553:2812:cefa with SMTP id 2adb3069b0e04-5533d14f146mr5186359e87.3.1748953815707;
        Tue, 03 Jun 2025 05:30:15 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d0bcsm1920295e87.208.2025.06.03.05.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 05:30:15 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 4/4] oeqa selftest uboot.py: add qemu KVM test case
Date: Tue,  3 Jun 2025 15:29:39 +0300
Message-ID: <20250603122939.1027947-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
References: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 12:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217813

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
 meta/lib/oeqa/selftest/cases/uboot.py | 59 ++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

v6: removed override of QB_OPT_APPEND to disable USB in qemu,
    instead u-boot has disabled USB support

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 96da4efb0695..980ea327f0cc 100644
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
@@ -41,3 +41,58 @@ QEMU_USE_KVM = "False"
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


