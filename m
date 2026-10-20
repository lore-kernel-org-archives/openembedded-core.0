Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7614.1792503352806683948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P2QjIzIB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2007362f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792503351; x=1793108151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pmy/HQ2L/+JdDDbW4oH3apECpFF0tT6iV04eFC08gKE=;
        b=P2QjIzIB50QbPaSoF4kG37FYi80+XzLcERp6tumSvzPbxiJ2fLfy8etRhvXIq/UOap
         7nl5mwlp+Rj7kd9ei495CtqAglleYPEPcR9xPpipNgWnUeDnWkcTNraaGz0NpeqRlNYz
         MogYuXyBBMVHkIm/bc+otJgi1hm93nfzxQEI8Ofhgcrh7X9ge/O9ePNgsTzRUPCw+FaE
         6clBc0XIpZVvZVdWL0YaND5/3oBlHyBJIuyAgk7rkkT1lR9x1HNqmLKKL+eB8x9gK5CY
         UcVMqyqDOj0ZEQZITxrw82CG2I/H29YYMEjAdH2MJ4c+iNvRNZ9kI7OwJREej/roICWr
         2/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503351; x=1793108151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pmy/HQ2L/+JdDDbW4oH3apECpFF0tT6iV04eFC08gKE=;
        b=hM1UCWuR/8zavkSp8ds0PnLbQpybfqtWbwifFQkL7gXyMfx58nHTkKJBlBrfSA5Zm/
         P0BSHoWp3Ra2GB+2o6gj7vGGmfJmXQABRXJUNHSC4PJRV6SjuP6Q/896uC1lExMS+Fc3
         Ez3YMbFEutdKqcGYmXNjnTbY3ayojHnThsBlhHnqrf0tFk5zLt+wabfAXE6+BLB2NB4B
         5GFoKeFKAxHclueM/sFip/xqk8MqxvHxJHoa666jOSBNdsPh42E7vGlch1m/QjDP+ai2
         Y5Dn+wmHx+b26afjQ5mtBTx98spU7tOPedEgPV5VKFDqezk/kcWXdyIeQ2iy1Y+JcCI1
         +1gA==
X-Gm-Message-State: AFq9FYKUy60/z65wm3x6yJ5wabyYKae3ALO3+HkbptzEWscHRGsZ90+j
	NLn/KSz5H7aNM9NtQBI0WfoTQWf1rcFhQ0RReUe5d1tuApHS2sjYp6yjCBXXhw==
X-Gm-Gg: AYBFou3IuKp6DbJiUhdMKG3fL4W1vbmksgAbb9qTR8KtTcD2Y376tKmFbJDxUTBO6nY
	W+b7mdQOAuPlh8r430+la3NIVtWfo6C1OpVffuol0Xyqm+BXclXXfTR3kK4PVOWu0YOYb4h0AHw
	wtvl+5YzJLfePtw4I0osoeEzBNNfZ8Tr+zmXB7iZB+rh8Pi6Kivl+pH9+XcfbDAq+YC8VBmCizm
	zR0ANPoRhhW60K77rdaE5OAvOVyqishhpA/PrhlFv3oCZn1tScf67v8tcu5iVmmkjMBmbxsLOd7
	kEIpVzEy4CBdadiPeZ3POoJoOR/UwOl5q7BHpnml3v+OQgDLWG/KSU50WFLe2V65yLRIAtrNWlq
	scXK1nZr88ByvKS5EP/8p7KS1Py7wj+vvG6I3IR8mDlekConLO7zktHhOPLHRJMJPsA9Xm6otvp
	RjzTZqXn6OlKxrpZKxCOZ1yKT0vQeXAFnuHM0Ni8zlOXxtr9r9gLgY1sOOKE6jToJ7hyhqz0soW
	az//NTuSWUUB/Q7ABp0faCnDefC9zPe2EKmlwg=
X-Received: by 2002:a05:6000:25c9:b0:48e:1d87:f170 with SMTP id ffacd0b85a97d-48e1d87f1abmr5795260f8f.12.1792503350884;
        Tue, 20 Oct 2026 06:35:50 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm6060209f8f.31.2026.10.20.06.35.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:35:50 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] oe.fitimage: add metadata for multiple kernels
Date: Tue, 20 Oct 2026 15:35:49 +0200
Message-ID: <20261020133551.90185-3-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020133551.90185-1-vgharaee@gmail.com>
References: <20261020133551.90185-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248289
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

