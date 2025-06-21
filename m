Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343E9C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 07:31:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.3178.1750491105001550954
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 00:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNVvihMK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237311f5a54so26431765ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 00:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750491104; x=1751095904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4HaDQJy8sAE2wHhV/rMfUhV1cgUJroQ+n1cW2zQd9g=;
        b=BNVvihMKAIe41a24HRKW9RJbmOCdkWaob83pFN8O/MrC8bNEMC1c/2BKCBiZi0nN0o
         LKMWwtmQz5SKNDQESgQDW2lbElA1+Ui5k46rL+sKaXP7ewwgNpVeB3xoVoYBnq2J60dh
         FYFYaG80Mx8/heN33+kcTadavnuSGAj4Ir045mwUfBn393rnXEOssIz1j+fDEPU3IyjW
         L0SPqLbneaMCCb71cmfNsaYFAf+xxh1wewfNRppvJu869BuZL1hZIk2K2UBfIKs3Hd5o
         SDTWJehxpLYbEuG5gcvxpfZ4xOhyuTfJRpSBG+ngxnyjh3lsFQUhyjNtgIseNDhWWdrY
         1hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750491104; x=1751095904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4HaDQJy8sAE2wHhV/rMfUhV1cgUJroQ+n1cW2zQd9g=;
        b=odUa9bfiHo+aNgBhNldJoO0w1t7u2ed80J8fYrRm2cEfq648Yf17OffCN2xR0SQB/9
         QFh2oPfk9qxHYFld3y/COl+MRQ2+4l7UjnH6DZmdwHbupXDTX/Br3GMWX26hatsE8KTK
         cK23YJUeGB8QgOJbw9CyIf2YEu9QuadBzqNxWMXTX9jMybC/SZaHSHZtq5RDh7NdvCWc
         xwEn/PXALlbnGFIZUHpQGSr4DayvB2k/FqHlhPQLgOpRoQokrPvLZ1rYw323o46l5Jer
         OT7HDQ2O7ttcQ0Re4v7FHkgIJDs9rkWgWkUIs8KxPAJkAth5nnMisNiLy4x5InozxK78
         pCwg==
X-Gm-Message-State: AOJu0YzE6HeMTo4Q1SRnYOGy5E/Wm5Cn/L4zLmrg+STlBnWrzy8m4xR8
	HG54lilVI8dvL6nVlaIRC/cxcN+vRObl5CIbSCjauHSd8gcw8LbQkKLScXAJWQ==
X-Gm-Gg: ASbGncsZ32aV8DSZHFIlLZ7wBRhGYzhLiVSSlKtHc8KbKb22qrcbv/O0RhDLEtH/FjO
	ns0GN8Hlxq00Af3lgn1qfvZK/WVkQg+0jYl4ls2lyBwExi+XTshv/kgcJaSP/0YkxERcu1jdQ6V
	WCUuGyCQQ5d9MTgtAONtsc36uDNGI+Rgr4begrM3LTJQBf/Rceog96bbcIhNaxQLvwDUb65NiOI
	4Xz944CWATXwmdCZ58czCY26SlV2afD4KzlXbZr0qIUtAC9i+DL0j/0Etym5G4ACIR1ZfGSKLZc
	IQtgifgquepw/b+sa8+u/zRDNaWhndgTtap79t8V3F0qAQpBiwIybE0PtSa8jliq3IPwiJsJYi9
	I
X-Google-Smtp-Source: AGHT+IGOjtmpGxsHYY1c+vOEzzlO8vBQPD6Y3NAyDDxguD2H6iRr6okp618LmCgwGweRiriUFSxJMw==
X-Received: by 2002:a17:903:4b0c:b0:235:be0:db4c with SMTP id d9443c01a7336-237d9b6865amr89003805ad.41.1750491104155;
        Sat, 21 Jun 2025 00:31:44 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:93d9:15ef:f694:5c2a:2c89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8716a36sm33619265ad.230.2025.06.21.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:31:43 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH v3] meta/meta-selftest: add selftest-hello-mod recipe
Date: Sat, 21 Jun 2025 13:01:37 +0530
Message-ID: <20250621073137.47743-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219152

Kernel module specific oe test cases requires a test kernel
module package to work with. Added selftest-hello-mod
derived from meta-skeleton/recipes-kernel/hello-mod.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>

---
Previous patch version: https://lists.openembedded.org/g/openembedded-core/topic/113550149
---
 .../selftest-hello-mod/files/Makefile         | 14 +++++++++++
 .../selftest-hello-mod/files/hello.c          | 24 +++++++++++++++++++
 .../selftest-hello-mod/hello-mod_0.1.bb       | 17 +++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-hello-mod/files/Makefile
 create mode 100644 meta-selftest/recipes-test/selftest-hello-mod/files/hello.c
 create mode 100644 meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb

diff --git a/meta-selftest/recipes-test/selftest-hello-mod/files/Makefile b/meta-selftest/recipes-test/selftest-hello-mod/files/Makefile
new file mode 100644
index 0000000000..4ded35fbc3
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello-mod/files/Makefile
@@ -0,0 +1,14 @@
+obj-m := hello.o
+
+SRC := $(shell pwd)
+
+all:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+
+modules_install:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+
+clean:
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-selftest/recipes-test/selftest-hello-mod/files/hello.c b/meta-selftest/recipes-test/selftest-hello-mod/files/hello.c
new file mode 100644
index 0000000000..4f73455d20
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello-mod/files/hello.c
@@ -0,0 +1,24 @@
+/******************************************************************************
+ *
+ *   Copyright (C) 2011  Intel Corporation. All rights reserved.
+ *
+ *   SPDX-License-Identifier: GPL-2.0-only
+ *
+ *****************************************************************************/
+
+#include <linux/module.h>
+
+static int __init hello_init(void)
+{
+	pr_info("Hello World!\n");
+	return 0;
+}
+
+static void __exit hello_exit(void)
+{
+	pr_info("Goodbye Cruel World!\n");
+}
+
+module_init(hello_init);
+module_exit(hello_exit);
+MODULE_LICENSE("GPL");
diff --git a/meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb b/meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb
new file mode 100644
index 0000000000..f7d5bc88a2
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Example of how to build an external Linux kernel module -- selftest variant"
+DESCRIPTION = "${SUMMARY}"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit module
+
+SRC_URI = "file://Makefile \
+           file://hello.c \
+          "
+
+S = "${UNPACKDIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES:${PN} += "kernel-module-hello"
-- 
2.43.0


