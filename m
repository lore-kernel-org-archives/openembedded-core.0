Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A563DC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 13:41:36 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.60044.1749476487524138768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 06:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gAL7jZ37;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23508d30142so56680475ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749476487; x=1750081287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=II40oSe2Dn9Kxrsyk5M67csb7Fas+s3/GzIXrscREyM=;
        b=gAL7jZ37aqZyCpATRshje/yGk96SKTCesipb5FGCWpgz4awtMv2Ord6GADz9EPvNDx
         UYxjAMd/k5ED9D+YsdgqayAPszGVQNwwbD0rKmyOtp8Y8UwvpDTKn3wC5gJlNI1Bf8uD
         VHmWdUPf7QDc+JRZDeRBDmgdZLFGUQh8PPAa8DsBWqHuNHcen7H4FCTdz7Yxl8XyFs1s
         GScnpaAkLw+F0dqv+CLjMBGuG72ZgmLY/ALx/5OmMO0MyylUyiIN3NC5d295axjVIBOR
         SbVHv+5reXxtn8u1EDVx9RM6jsDjDIOVONmk7vOzsv9CpnQaiRgnvz46lGCEWeDAFM/5
         V3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749476487; x=1750081287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=II40oSe2Dn9Kxrsyk5M67csb7Fas+s3/GzIXrscREyM=;
        b=MwhO7ReHyJCNBMjdd4uFx6tKB7O0hcCJRR3Lx/VhsxyfQ1uaROy+0xxBhkvXFY3HTw
         JW2N1V4osFWlDPphPKWqCwjCjNYCgK9opCsM4HP2bWhVedh7wAAhzZQEZ2R63rINR/8v
         +PAvw1eSSqxxgijAAwiPh20X9l+6KGT4+uApXNcCpNXvF9O1sBwGzjAp9OAwYhj9fvfw
         AciFzuuSQgfi9IYzsOI9H3CszM4wwfF+L1niG5djtXJepapmPaqSeNSJenGnTmOJ9C9S
         Py6zLeaaV/4bYmsY+aCgjBy2//PQyC48YanNPkt1kYkNZvVYPWP/7pvHDg+d5hfR5wQM
         EY9g==
X-Gm-Message-State: AOJu0YzHugpsXUVCNNc/VxSMekDb5++Mw6CAzUpBWuXbZnnKw7Y2Tj/1
	1oWYsatGRzIrw5raIwgTCRsvNe75v2dRWArISwGkIT5a43TYbnm+8CxUlQCEgg==
X-Gm-Gg: ASbGncsrgBb0Ofg1+6Hians7f/yMwYOEuQarqXECRKa1n2y0xaR79KtBcVGTxu7kY9L
	n7Pwgix72W6QQd52e4bczb1ECj8t8YSNHLVojFBViJNAfK0ud1oC3cWuHKiYiUz/oLDezpveGYg
	7OebjLcXrO2XeXhTMXgOsZNuSbkA3hM2BXeILrpsNVSwhmXrOh7JiTX5fvOGHnBc7FjqTxUsmWX
	Y2mXKBTe+XyAWVUViE8VZDirHmBCcL+SzlmYGTYP4v2npKtE75jwIC+ULftzqEQ24tHNEzVY1o4
	fKc9fsQUEzjVuwF7CIAsDfn3FX2awZUaho1gcydGLaYy6f0PS7++9Zsh5liK0mMyjuvtqAPxxnY
	4
X-Google-Smtp-Source: AGHT+IHIgxwJ+iVAhsjYIsp/iEVl9AOEoY7m1o91SSsIaZtb5KPIIgjuG3+wk13hwaTxPzM+OfmWkw==
X-Received: by 2002:a17:903:230e:b0:234:ed31:fcaa with SMTP id d9443c01a7336-23601da5fb7mr166022945ad.50.1749476486526;
        Mon, 09 Jun 2025 06:41:26 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c45:df5e:58ab:910f:e76c:4271])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcf17sm54729795ad.115.2025.06.09.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:41:26 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH v2] meta/meta-selftest: add selftest-hello-mod recipe
Date: Mon,  9 Jun 2025 19:11:18 +0530
Message-ID: <20250609134119.11666-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 13:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218289

Kernel module specific oe test cases requires a test kernel
module package to work with. Added selftest-hello-mod
derived from meta-skeleton/recipes-kernel/hello-mod.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 .../files/hello-mod/Makefile                  | 14 +++++++++++
 .../files/hello-mod/hello.c                   | 24 +++++++++++++++++++
 .../selftest-hello-mod/hello-mod_0.1.bb       | 17 +++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/Makefile
 create mode 100644 meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/hello.c
 create mode 100644 meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb

diff --git a/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/Makefile b/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/Makefile
new file mode 100644
index 0000000000..4ded35fbc3
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/Makefile
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
diff --git a/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/hello.c b/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/hello.c
new file mode 100644
index 0000000000..4f73455d20
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/hello.c
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
index 0000000000..8a98c70703
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hello-mod/hello-mod_0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Example of how to build an external Linux kernel module - selftest variant"
+DESCRIPTION = "${SUMMARY}"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit module
+
+SRC_URI = "file://hello-mod/Makefile \
+           file://hello-mod/hello.c \
+          "
+
+S = "${WORKDIR}/hello-mod"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES:${PN} += "kernel-module-hello"
-- 
2.43.0


