Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA597CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 13:03:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41819.1781874209362124623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 06:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gvfeXCI1;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1093427a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781874209; x=1782479009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkKZJ6NiZ43/c0YebWT3gpWuifJyOPzLif5Hm8zr5p4=;
        b=gvfeXCI1ERnEaRDvbJjlUdvuMSTxveh44WN07PycnJq+2WS/owjAZV/aYLXPA9a65a
         8hD1nm/YUiJeSNcxF611Yta+YYcxmooQttkdZYxLJ/TqcRialgtH9iCo2s4ByGs+YtUJ
         o4PCwnKQaxEaYmCEOfqzlQyf/IVmW7+SuLNO4o2c8to8sgV8RwLjkskYmXWuCXzhYnkw
         Ih9VV8EeU1imMx02ifVCAjhdXHmaNrWu6ymcwNAEonrcNa878qrdrzUGug+LqqYs+NOJ
         mD4wj+8hzbv19VHSd/wgwSvYwFj0nrNehRjzuQvzGbjH/72vqEOd3+b0ZEgBgV9X6vs/
         or3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874209; x=1782479009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkKZJ6NiZ43/c0YebWT3gpWuifJyOPzLif5Hm8zr5p4=;
        b=DlokNKV69fOYP0bLGcxGjuHGO3XvgxaaoFY/U0M12SIpLU3DtNJg+sIMePRKIElDCi
         reWBgU00My4dWcd+TXT56y/hYg2xGlhd9twRlqFI0HTp0anBAqlH3Y4s2JJGQtm9Fb8t
         dtA4Nj00HbyjXlufvhS2YAIR8LmXKyFPfDj+kX9QI6qWdPcXyfk1ZPETN/vodjS4i9Hd
         yDHTChypuqHaTn6OWGyndMQjUTLE2iRQOx5T8piKARZSuUvXNra7rBISyyYQR3pxC6vh
         WbW4BSBU09bgUBHMldazubALgEiBph0xjSKuNaQQtj2Rm/4LaWeUUwj5jY+J1k9R505A
         aeXA==
X-Gm-Message-State: AOJu0YzaqH3T5FWGrIEOeyAcSaLeQokYUTEtEjhG4Tux4d0rIQjCDLUW
	ALYuTVqNxjzw4WpxzCS3vtV2BBJgvtUOie0SMNkde1yQgnBhkvRypYkMcPfBbvbwRpo=
X-Gm-Gg: AfdE7cnl9J8gs648tyMro8aoWaC0c77oyFEuPYEW8AHjINbDX68xfSk2AVw+VVixfEK
	aClcaKMQ634NW3+j8Z8KaFwL0K7pa3rmYk/KmHmyUeWjJAXGL4T2A9MpAAO9XdKiLohhTA4j1FW
	+/w0PrTDFseNI+a7L76dfmmfs+7/+dIgzBEp/uzdL086RVRHBuEsTRcqiEw9aEw5Lr8XUk4nO8q
	Qe7D0k1NyLG+N9W7Nl/t0Y7XsSikXxQljwlMADNmEgdjClRhMiPeHiaxZn0XAN2jDcjZtcwMCM0
	sfRBYArjp+LiUOv7xwMgqtcuLLzQCRXn8djSW1iMjsKX5bx4L8Zfd6Tvcdd3EoEblrnSwwoJoYh
	mXnIz0ngZVOKjRXmmxGRVx+yLBAxRfp0QlMpBADFKLf2+yVUsR1hfOQBHUXDU5b+GLvz3v3YLbY
	sQfn5bR1A6VKCjErFtH9TUF7tOcmLfPORgjqNDuh6kXpZpbSJ2iziraNo=
X-Received: by 2002:a17:90b:5708:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-37d1617a684mr3871029a91.20.1781874208329;
        Fri, 19 Jun 2026 06:03:28 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.90.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15581a76sm2895190a91.7.2026.06.19.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:03:27 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [OE-core][PATCH] oeqa/selftest/kernelmodulesplit: test cross-recipe kernel module dependencies
Date: Fri, 19 Jun 2026 18:33:23 +0530
Message-Id: <20260619130323.2640105-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 13:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239169

Add a selftest that exercises kernel module dependency generation across
recipes. Two external module recipes are added to meta-selftest:
kernel-module-testfoo exports a symbol and kernel-module-testbar consumes
it (DEPENDS on testfoo). The test builds both and asserts that the
consumer's real, KERNEL_VERSION-suffixed package RDEPENDS the exporter's
suffixed package - and not the empty unsuffixed kernel-module-testfoo
package - and that the suffixed package RPROVIDES the unsuffixed virtual.

This is the failure mode originally reported in [YOCTO #12290], where the
generated dependency resolved to the empty package after the KERNEL_VERSION
suffix was introduced. It works on current master; this test guards against
regressing it again.

The kernel version is derived from the produced package list rather than
KERNEL_VERSION, which is unset at parse time when the modules are restored
from sstate.

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 .../kernel-module-cross/files/Makefile.bar    | 14 ++++
 .../kernel-module-cross/files/Makefile.foo    | 14 ++++
 .../kernel-module-cross/files/testbar.c       | 19 +++++
 .../kernel-module-cross/files/testfoo.c       | 23 ++++++
 .../kernel-module-testbar_0.1.bb              | 20 ++++++
 .../kernel-module-testfoo_0.1.bb              | 16 +++++
 .../oeqa/selftest/cases/kernelmodulesplit.py  | 72 +++++++++++++++++++
 7 files changed, 178 insertions(+)
 create mode 100644 meta-selftest/recipes-test/kernel-module-cross/files/Makefile.bar
 create mode 100644 meta-selftest/recipes-test/kernel-module-cross/files/Makefile.foo
 create mode 100644 meta-selftest/recipes-test/kernel-module-cross/files/testbar.c
 create mode 100644 meta-selftest/recipes-test/kernel-module-cross/files/testfoo.c
 create mode 100644 meta-selftest/recipes-test/kernel-module-cross/kernel-module-testbar_0.1.bb
 create mode 100644 meta-selftest/recipes-test/kernel-module-cross/kernel-module-testfoo_0.1.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/kernelmodulesplit.py

diff --git a/meta-selftest/recipes-test/kernel-module-cross/files/Makefile.bar b/meta-selftest/recipes-test/kernel-module-cross/files/Makefile.bar
new file mode 100644
index 0000000000..1d4409bf3a
--- /dev/null
+++ b/meta-selftest/recipes-test/kernel-module-cross/files/Makefile.bar
@@ -0,0 +1,14 @@
+obj-m := testbar.o
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
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c *.mod
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-selftest/recipes-test/kernel-module-cross/files/Makefile.foo b/meta-selftest/recipes-test/kernel-module-cross/files/Makefile.foo
new file mode 100644
index 0000000000..1720b239c0
--- /dev/null
+++ b/meta-selftest/recipes-test/kernel-module-cross/files/Makefile.foo
@@ -0,0 +1,14 @@
+obj-m := testfoo.o
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
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c *.mod
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-selftest/recipes-test/kernel-module-cross/files/testbar.c b/meta-selftest/recipes-test/kernel-module-cross/files/testbar.c
new file mode 100644
index 0000000000..98470c407f
--- /dev/null
+++ b/meta-selftest/recipes-test/kernel-module-cross/files/testbar.c
@@ -0,0 +1,19 @@
+#include <linux/module.h>
+#include <linux/init.h>
+
+extern int testfoo_value(void);
+
+static int __init testbar_init(void)
+{
+	pr_info("testbar loaded, foo says %d\n", testfoo_value());
+	return 0;
+}
+
+static void __exit testbar_exit(void)
+{
+	pr_info("testbar unloaded\n");
+}
+
+module_init(testbar_init);
+module_exit(testbar_exit);
+MODULE_LICENSE("GPL");
diff --git a/meta-selftest/recipes-test/kernel-module-cross/files/testfoo.c b/meta-selftest/recipes-test/kernel-module-cross/files/testfoo.c
new file mode 100644
index 0000000000..e438db49cb
--- /dev/null
+++ b/meta-selftest/recipes-test/kernel-module-cross/files/testfoo.c
@@ -0,0 +1,23 @@
+#include <linux/module.h>
+#include <linux/init.h>
+
+int testfoo_value(void)
+{
+	return 42;
+}
+EXPORT_SYMBOL(testfoo_value);
+
+static int __init testfoo_init(void)
+{
+	pr_info("testfoo loaded\n");
+	return 0;
+}
+
+static void __exit testfoo_exit(void)
+{
+	pr_info("testfoo unloaded\n");
+}
+
+module_init(testfoo_init);
+module_exit(testfoo_exit);
+MODULE_LICENSE("GPL");
diff --git a/meta-selftest/recipes-test/kernel-module-cross/kernel-module-testbar_0.1.bb b/meta-selftest/recipes-test/kernel-module-cross/kernel-module-testbar_0.1.bb
new file mode 100644
index 0000000000..bf465169f5
--- /dev/null
+++ b/meta-selftest/recipes-test/kernel-module-cross/kernel-module-testbar_0.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Cross-recipe kernel module dependency test: consumer (Bug 12290)"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit module
+
+# This pulls in foo's Module.symvers via KBUILD_EXTRA_SYMBOLS (module.bbclass
+# __anonymous) so modpost records testfoo as a dependency of testbar.
+DEPENDS = "kernel-module-testfoo"
+
+SRC_URI = "\
+    file://testbar.c \
+    file://Makefile.bar \
+"
+
+S = "${UNPACKDIR}"
+
+do_configure:prepend() {
+    cp ${UNPACKDIR}/Makefile.bar ${UNPACKDIR}/Makefile
+}
diff --git a/meta-selftest/recipes-test/kernel-module-cross/kernel-module-testfoo_0.1.bb b/meta-selftest/recipes-test/kernel-module-cross/kernel-module-testfoo_0.1.bb
new file mode 100644
index 0000000000..8ea3ad3618
--- /dev/null
+++ b/meta-selftest/recipes-test/kernel-module-cross/kernel-module-testfoo_0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Cross-recipe kernel module dependency test: exporter (Bug 12290)"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit module
+
+SRC_URI = "\
+    file://testfoo.c \
+    file://Makefile.foo \
+"
+
+S = "${UNPACKDIR}"
+
+do_configure:prepend() {
+    cp ${UNPACKDIR}/Makefile.foo ${UNPACKDIR}/Makefile
+}
diff --git a/meta/lib/oeqa/selftest/cases/kernelmodulesplit.py b/meta/lib/oeqa/selftest/cases/kernelmodulesplit.py
new file mode 100644
index 0000000000..1627748a98
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/kernelmodulesplit.py
@@ -0,0 +1,72 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runCmd
+
+
+class KernelModuleSplit(OESelftestTestCase):
+    """
+    Tests for cross-recipe kernel module dependency generation.
+    """
+
+    def real_module_package(self, recipe):
+        """
+        Return the name of the real (.ko-containing) package for a kernel
+        module recipe, i.e. the one suffixed with ${KERNEL_VERSION}. The version
+        is read from the produced package list rather than from KERNEL_VERSION,
+        which can be unset at parse time when the module is restored from sstate.
+        """
+        packages = runCmd("oe-pkgdata-util list-pkgs -p %s" % recipe).output.split()
+        version_re = re.compile(r"^%s-(\d[^/]*)$" % re.escape(recipe))
+        matches = [p for p in packages if version_re.match(p)]
+        self.assertEqual(len(matches), 1,
+            "Expected exactly one %s-<version> package, found: %s" % (recipe, matches))
+        return matches[0]
+
+    def test_cross_recipe_module_dependency(self):
+        """
+        Summary:    Regression test for Yocto bug 12290. When one external
+                    kernel module recipe consumes an exported symbol from
+                    another, the consumer's auto-generated RDEPENDS must point
+                    at the exporter's real (-${KERNEL_VERSION}) package, not at
+                    the empty unsuffixed kernel-module-* package.
+        Expected:   kernel-module-testbar-${KERNEL_VERSION} RDEPENDS
+                    kernel-module-testfoo-${KERNEL_VERSION}, does not depend on
+                    the bare kernel-module-testfoo package, and RPROVIDES the
+                    unsuffixed kernel-module-testbar virtual.
+        Product:    OE-Core
+        """
+        consumer_recipe = "kernel-module-testbar"
+        exporter_recipe = "kernel-module-testfoo"
+
+        bitbake("%s %s" % (consumer_recipe, exporter_recipe))
+
+        consumer_pkg = self.real_module_package(consumer_recipe)
+        exporter_pkg = self.real_module_package(exporter_recipe)
+
+        rdepends = runCmd("oe-pkgdata-util read-value RDEPENDS %s" % consumer_pkg).output.split()
+
+        # The consumer must depend on the real (.ko-containing) exporter
+        # package, i.e. the one suffixed with KERNEL_VERSION ...
+        self.assertIn(exporter_pkg, rdepends,
+            "%s does not RDEPEND the real exporter package %s (got: %s)"
+            % (consumer_pkg, exporter_pkg, rdepends))
+
+        # ... and never on the bare, empty unsuffixed exporter package, which
+        # was the failure mode of bug 12290.
+        self.assertNotIn(exporter_recipe, rdepends,
+            "%s RDEPENDS the empty unsuffixed package %s (bug 12290 regression)"
+            % (consumer_pkg, exporter_recipe))
+
+        # The real package must virtual-provide the unsuffixed name so that
+        # existing references to kernel-module-testbar still resolve.
+        rprovides = runCmd("oe-pkgdata-util read-value RPROVIDES %s" % consumer_pkg).output.split()
+        self.assertIn(consumer_recipe, rprovides,
+            "%s does not RPROVIDE the virtual %s (got: %s)"
+            % (consumer_pkg, consumer_recipe, rprovides))
-- 
2.34.1


