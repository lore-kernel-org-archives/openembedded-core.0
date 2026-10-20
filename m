Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6671.1792500756863575644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MoLrml/c;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so40908205e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500755; x=1793105555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pmy/HQ2L/+JdDDbW4oH3apECpFF0tT6iV04eFC08gKE=;
        b=MoLrml/c8JDl9BXWnwuY8ar/FlTNyfDZGENKE3jOGt3x6POCoeq/Wn3jLV2BKAoAi6
         0zsa7OTm7Jf1Qc24tkQ6CjalgUbHdieHUHpiVCH4iveUpcq0S5VNTifVrrrZs1waP549
         nHF4jXMLhBKjMb+C6Wj+PEiFmMusc7a7zykY0ZetHE0wjYJd9WKIWY9iXhueE0QflR+o
         Ak5cYMI4PcNVR8x6Pqk3PdpcXpnhZCSG50y9O8ViX7YSO2QDU5tDntqHw7EY/k/hbrma
         QPn+7qe6tXu7lL9Dl9Jl2jPxP2Zz/5nctjMQUc2xpdxWyY8834F+7q+/M2ve2SKDzNOC
         rMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500755; x=1793105555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pmy/HQ2L/+JdDDbW4oH3apECpFF0tT6iV04eFC08gKE=;
        b=1rXzJf1HTeB4fJbrQ7VBRDEtvdxaeW+mlxE9UYwGMZ0sMZAnmecwIhURmlBxqhIakh
         c1GNUDjuGusEuvEyUsio1EbGTj+XrmmRhXtHJkTT5PXDng3X51GS10Lolbi0+tqQSEzT
         oXihaixqRVt9hCC7x9UF4ye2fx04JhEB9xiPyHBNnNXYlARBL0NcjE1ryRHt6DsdfIFn
         fZWh8St/f+8erA4eKyDnO5cf2FFXP0I3KImmXPidqwsHjWF2l1btTL+8O9Q498u3/c2t
         ovHgB7Bf1V92SH6+gUSRne3L3PALM4Cw+/JG2hSjA/zGJNouV+brctgkq3wDAvMZKn6d
         +9Sw==
X-Gm-Message-State: AFq9FYJ8fzwLvjzSQMYMttffjRl5DEUna3sJ9T4EDxLa5PuGnP8OJtwe
	tUaGuokEwzjnmZ5n+FNby5j9dMj1bIKBA8dUXob+mX7tuDQAjn4w8FrVvv1RBg==
X-Gm-Gg: AYBFou0bAzmW5ie/4rKLqFXwdZGgDlhIbQ299ine7CVQmYLnpQrjm1pqLgsfv24NHeb
	iCo+wH7lfDN0CUL1YV0C2laqforRGDnZgC8GuLk71Jof2heEPhnxVSzhQvrwphq041K+OwOBfwj
	T807cSEIBREOm5UCAWgOWqYeX/JYxuQ49IEx/zLWBPpGWiedOhiP9XMlZgOSKHrctjY6m6aBhIA
	sSw6yWIJByL12EAeEOmu4Y/Je6SJDLYYciWWHh7iD2G4q1B11x+KMXXlxU8IafBA1Ryev87eCfB
	QKn96QC7ofBo3tghIe2SyZdjbM1unONNTyF7dDpV8mrbJR7V3Ytv09Stn5rNhs86LUsEZKNP0Fn
	8V5r6qDD2RuCAUdgK2+r8fGiFbRCGXrhkhc9MrmIyhIWu2DdFvM0IfMhf47Id3F0ilBvv5Itkv6
	kw8KxRnY7oAmwlS6JmIZbhQzUbE6tB/pM+54tZqm0riX5fG6VJEH1fOC9EnAtXPnRoYS4CRufu8
	fVo2XVxVm7Krlu8RNCfqcqbV4qrJMrkz0IYPdw=
X-Received: by 2002:a05:600c:6215:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a1d762b705mr202181905e9.22.1792500754869;
        Tue, 20 Oct 2026 05:52:34 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6335698f8f.17.2026.10.20.05.52.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:34 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oe.fitimage: add new config interface variables for multi-kernel image, to fitimage config file
Date: Tue, 20 Oct 2026 14:52:31 +0200
Message-ID: <20261020125233.69997-3-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020125233.69997-1-vgharaee@gmail.com>
References: <20261020125233.69997-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248281
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

