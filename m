Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.554.1793897302483771753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 08:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KWG0G+Yv;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so15218685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897301; x=1794502101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mFloBapDVcd3+/2Z7S2vb+KqfQUEwJ4Xpx4+fHx4jMw=;
        b=KWG0G+Yv0nZwNQ10psTvqYTVXKET3Pi64Tz0ardRnLKp26WOhKw8awz2QlfyY9TsUd
         fO2zCOEAG8Je+HWSWTSu70OakXYwXCsez2gjtQ9XbdQZYaFfdfPMHhSronfmHtEKt3WB
         ZUQvNGV+QLZcyaQklvii4jzotECMPzw54QQgTmzuHdvDmm4yqqGHoOf1cMzl9lKd1WlW
         SsaEPYkH+r6IRTwjkJIZXGMVV3WJ3UluP+viKAI8MtjrNwSP0MYsumSujsi9dgAAEPxD
         YzdH1NGVLYVzxNM1UcwrqwetQqrExZxI501SBAT06o95pm+ulzsZAG1iRuElpvyOWsXy
         bG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897301; x=1794502101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mFloBapDVcd3+/2Z7S2vb+KqfQUEwJ4Xpx4+fHx4jMw=;
        b=uDosn34xpMizeo22BzQEKuOeOzB0FJHy8IbRh4ZzrzUupHaNvZh8vhlP3mhiJBA0Fy
         p0LMh0a+DcO2iOI+3ULaE7Jec5jFR8QRrp4UuMJ517D7IZKIekc7TJd2GYYVNBmK+Rhe
         pWrOkVTmUkWlm/5WXtNen6OzZi4D+d05n/lD0GzoJPBYvDuoNVssdV3QkfSI2Rt4Tjpu
         LneyjW6rkNFClnnWVGhnOFZOWduxdXJMBtmThdkWvzSvaerPLsGgGrIgLX0eoxrx3/T8
         GywP3dhzCNyksxFE3m43nXHP6cDpgFn1jFz3DVrIygGXtgFVIUTL+xHEI/Sz4aBpSM3L
         oGsQ==
X-Gm-Message-State: APuU4Z8tKBIeLw9+XJDdx6U3Jbfh+jWnP9Xh3wuy0qrF9PucgWWgqLM+
	8MXJ8r0i/veUpG+QfEBPTkNYBXJwnnbHY7x990r8K0SwEl8W5NjSu7iIGZi+EQ==
X-Gm-Gg: AYBFou0+1cbZDrBxVmgxZmMszB+ihHjSMyfZfhUnltD/GoTEyHabnebpNgNmoqkppoE
	heZpwUZHSz/xpYEaSWeRBjZipbntvNHQE90pDtbuRv/8Rv7n4frIATK84kS4gzoj0jofAx/ZOmQ
	owhVtlIfPFCwytzPtkDZBKmeVwqU7jHP2WhNZS9JsE1GlAz6YBLvQoi0SSoe/1o6PcvFIS8dEPA
	JEWCCY3hNaQAY0K5vkzj/9EYZ9OWHpzglz1DSYlDJQ3ni8xRIFUC2u+dDYvACq/OlPVZYKbT/i8
	PE/yRjGDhi/B7z05Q/IXwchSjBTiqBuk18szOUF9XlzOTXnrjHQZr1HQIZvVUu/sA0Bfx5SF9sP
	zWY3dRY8KeSHQU3+sUTj+4ZetgAF2QjrU0gRbHJbHbV9vwgKV5jW6W+J+Wivztgy8aCFLJxYGXn
	NtdnOws+WmDpqcX36FUC7ZpquPMjfoaDcar7/Xj/8pH3nANyMF9Enck1eWpieJ7rYLTV3TEqfWl
	weOb8Knj0qj0lmoetjk9W67ibC+idnGLbnkOdQSrRQSSujF9KXyaNZcVIsIEJO3mwVhk6HXrinA
	B/4iE8n1mWrMjOgho6C0/lRjkUInenNNnQZ93ldH99dz+Lu6gRzyD+Bd9ppIrpTYDWVRItYknYH
	qrDlx8QL6Yg9efQ==
X-Received: by 2002:a05:600c:3b1a:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ac18c73d17mr435071245e9.28.1793897300650;
        Thu, 05 Nov 2026 08:48:20 -0800 (PST)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm42536975e9.2.2026.11.05.08.48.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:48:20 -0800 (PST)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 2/6] oe.fitimage: add metadata for multiple kernels
Date: Thu,  5 Nov 2026 17:48:22 +0100
Message-ID: <20261105164826.1340446-3-vgharaee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164826.1340446-1-vgharaee@gmail.com>
References: <20261105164826.1340446-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 19:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249573
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
2.56.0

