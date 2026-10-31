Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159.1793464005126114342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 09:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rNAVvIZ4;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd2c386so921352f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464003; x=1794068803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pmy/HQ2L/+JdDDbW4oH3apECpFF0tT6iV04eFC08gKE=;
        b=rNAVvIZ4hAQw9KPDdSrWdycm53w9u9id4Mc8b3+AZyKws2/QpquOhlv8v9ghRT44Gj
         UGDOmiXgVJ/Zr72d5kg3bx2SZaI/E9YcxW8P92PcFe+xl1UWI+Ikz0h7mAtFOrSUQDm7
         UybLrGc3uj5EoFDY6TjHjBDa4A8ssd6fp7mrsMHBO9L3OrOQd/6spzm9t7ohxOsjbrMJ
         6m3+HuYcfBN+L602ecWbS3EBj45dGoZSq8jLTvp1t0uSOsw/2chyNkUBb8tJNHpNZBWs
         2XKJWzn467JISjJUf745Ij2mDEfsjxC9/nZmbBOpFQdDp3mIIljzEoV3qbRO9P5janty
         TDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464003; x=1794068803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pmy/HQ2L/+JdDDbW4oH3apECpFF0tT6iV04eFC08gKE=;
        b=IwwTDhF0xHCIO7lXYz88lv3Ul3GN6Zr56jslSQapGsVI8Aqn2qk2KiqupniH7/vFGu
         lW616xUmIwJOtXFz+6NfxFbuNWcPFi9bnqLnHRQbZaAgxkpYpZDvXVhPtMey7hpZWH2I
         L/1F54HQwGR1rHH9UhFNp+wmPHmzErtNk30ar/tz2+qeC8GzV/mCprBovUJOLTQjMW1E
         mCQm0gm74sWPMHJ/k4LRCtPbPueps2jwI9CY4InKKTQtbkiR9hS+gtOmbyHpiZxw+9iu
         Q9w2azBIAyx3nFT9xPB1ATLXjIe2i/GObMIqfOGrDf0uZ42TTJg5yvSqzGLh3ZW8WLCI
         oXPg==
X-Gm-Message-State: AFq9FYIZkPMKT7ttLo4KVPKYr3+MFqW52114ZR6M3GTM7Jx9tl48MsG5
	AuGb2uGXzjEx1of2RZLJhzNckjupbTqd4bIwtUJ1DNEFn0A851/pXalmnD43sw==
X-Gm-Gg: AYBFou3zHqVeNlVy2mf2/ORF9R4qe0RWtHgkfP1BUqs50s/Q85XEqK2YXzQQkpTCoEt
	TA6OGtGMLgkqFQhIChL2dcelM7ySKEx7WyQjbgm5+wgzP34q4A+3OAAjC24YBgc9a/bkOLh9M7u
	ueoRa8WIxfThfM0caC9lwIXVXK4MBZCBN4MQHmr3Hu4FFebVPjQUfOTK/wz68SA3ytfAeejyumP
	k7inx1+uVDsVsgHvdl1f8tUO8O41Ih+n6CmY2xqGWfwkgugCjh1nfsBcrcfgCwxYnRqLkN9lIzp
	NaqCcFs1PwH8Y8hFm+3K7J09cIb8WOEQqhwHYK5CFBPM0enZO8HBy2VMpkQJt/VY7F1zUIyD2iS
	H8+iQvgvjJPLJ8ujSBKua3CWMqTOIHjxXMtr2lJXPqXqlYbFK3vMhedFuUzNXmROYaBkrIhssR/
	aAED/hb0oJTD1kSqxZNGnKDxEDzKaNb5fpRvsTNUpDCcTvmtL16lS95u5udWnfcuTdPPohCkxBe
	Udrz8hYv4t5qG6BCTV8cwXZb3kioPc/gA7lyfOPC2vAl5y8FRjptSlNN+Gr0zvJneb4STAeq4W7
	jAShkDgdPb5fPwbWgNyQ1k6bEqu9ZsfzWwZwnABYYKFKy/HSgQMYSChkUDXDKu1+xv84M1HE
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr131502185e9.16.1793464003341;
        Sat, 31 Oct 2026 09:26:43 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.fritz.box ([2001:16e0:257:b301:9825:3e45:cd0a:824b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm214214455e9.6.2026.10.31.09.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:26:42 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/6] oe.fitimage: add metadata for multiple kernels
Date: Sat, 31 Oct 2026 17:26:45 +0100
Message-ID: <20261031162649.944625-3-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031162649.944625-1-vgharaee@gmail.com>
References: <20261031162649.944625-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249160
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/conf/image-fitimage.conf | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index a06d30e494..21d54ce18d 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -102,3 +102,58 @@ FIT_UBOOT_ENV ?= ""
 # arch, os) if the corresponding flag is not set, while others (load address
 # and entry point) will be omitted in the final FIT.
 FIT_LOADABLES ?= ""
+
+# Allow user to insert additional kernel images, e.g. a second kernel built by
+# another recipe or multiconfig, or a prebuilt kernel. The default kernel
+# (kernel-1) from virtual/kernel is always included. Each entry is used as the
+# image node name and must not collide with other image nodes, e.g. kernel-1.
+# Entries can be configured through variable flags:
+#   FIT_KERNEL_FILENAME[id]    - kernel file, relative to FIT_KERNEL_DEPLOYDIR
+#                                (default: linux.bin, mandatory for prebuilt
+#                                kernels)
+#   FIT_KERNEL_DEPLOYDIR[id]   - directory containing the kernel file
+#                                (default: ${DEPLOY_DIR_IMAGE})
+#   FIT_KERNEL_RECIPE[id]      - recipe whose do_deploy provides the kernel
+#                                (default: none, the file must already exist).
+#                                Without FIT_KERNEL_MULTICONFIG the kernel file
+#                                must be deployed by this recipe.
+#   FIT_KERNEL_MULTICONFIG[id] - multiconfig building FIT_KERNEL_RECIPE[id]
+#                                (default recipe: virtual/kernel), requires
+#                                FIT_KERNEL_DEPLOYDIR[id]
+#   FIT_KERNEL_COMPRESSION[id] - default: for linux.bin deployed by
+#                                FIT_KERNEL_RECIPE or FIT_KERNEL_MULTICONFIG the
+#                                content of linux_comp next to it, else none
+#   FIT_KERNEL_LOADADDRESS[id] - default: ${UBOOT_LOADADDRESS}
+#   FIT_KERNEL_ENTRYPOINT[id]  - default: ${UBOOT_ENTRYPOINT}
+#   FIT_KERNEL_TYPE[id]        - default: ${UBOOT_MKIMAGE_KERNEL_TYPE}
+#   FIT_KERNEL_DESCRIPTION[id] - default: "Linux kernel"
+# Example, a kernel from the "rt" multiconfig with the same MACHINE:
+#   FIT_KERNELS = "kernel-rt"
+#   FIT_KERNEL_MULTICONFIG[kernel-rt] = "rt"
+#   FIT_KERNEL_DEPLOYDIR[kernel-rt] = "${TOPDIR}/tmp-rt/deploy/images/${MACHINE}"
+# Example, a second kernel recipe with KERNEL_PACKAGE_NAME = "kernel-rt":
+#   FIT_KERNELS = "kernel-rt"
+#   FIT_KERNEL_RECIPE[kernel-rt] = "linux-yocto-rt"
+#   FIT_KERNEL_DEPLOYDIR[kernel-rt] = "${DEPLOY_DIR_IMAGE}/kernel-rt"
+# Additional kernels are only referenced by configurations from FIT_CONFIGS.
+FIT_KERNELS ?= ""
+
+# Allow user to add configurations in addition to the ones generated per DTB
+# (or conf-1 without DTBs). Each entry results in a ${FIT_CONF_PREFIX}<id>
+# configuration node which can be configured through variable flags:
+#   FIT_CONFIG_KERNEL[id] - kernel image node, e.g. one of FIT_KERNELS
+#                           (default: kernel-1)
+#   FIT_CONFIG_DTB[id]    - DTB name as in KERNEL_DEVICETREE or a file name in
+#                           EXTERNAL_KERNEL_DEVICETREE (default: none)
+# The ramdisk, u-boot script, setup and loadables are referenced by all
+# configurations.
+# Example:
+#   FIT_CONFIGS = "rt"
+#   FIT_CONFIG_KERNEL[rt] = "kernel-rt"
+#   FIT_CONFIG_DTB[rt] = "am335x-boneblack.dtb"
+FIT_CONFIGS ?= ""
+
+# Allow user to select the default configuration by name without
+# FIT_CONF_PREFIX, e.g. "rt" for "conf-rt". Takes precedence over
+# FIT_CONF_DEFAULT_DTB.
+FIT_CONF_DEFAULT ?= ""
-- 
2.55.0

