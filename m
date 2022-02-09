Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7236C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 08:11:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.24036.1644394279944700337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 00:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZI+vAlsR;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso320505pjj.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 00:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eFM9uTx5TXv6FQ+uaoqMNEAW+6r9VWem2EEIKUFv9wI=;
        b=ZI+vAlsRZf+8PZnUFF640gCumi7EZCL7o9eAC0CP2FqCjWbPOF8RHVaggfzOMFtBSZ
         FMc2eEN4hV85rvWKIPHKbBLu/lsvmaKXKyJL0hZ3TSAQzJDlk2LjgjLzVEDeM3gcr/RH
         aesIs/Kt9xrmrArnDEncp2WG3PtzNFyYqO6TgZNGiIItFHAl1XShY5HT2Rmw5cIC/l5v
         iu3sahHvI0sYhGQbMdnuF7lNTB0BfZQy0tMU/MGT5EFyhi0CdKufZEpxk09Fjuujteqb
         39J2pqGOuF/Vl6ovKLCQbhZ8yh1X+fruwcJoI1IDd3kzm1Tr3sDPUL2hWrx6LE7VNjFe
         gnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eFM9uTx5TXv6FQ+uaoqMNEAW+6r9VWem2EEIKUFv9wI=;
        b=Notbr9UNYXTj7oC+9WCE+1X1PRLL3ejeVsG5OHCi7msM3FSaVIA/Afl7rzdRXqfwiF
         1eSyiCmiwv1V42nA+UD1hU7qR3Q3ypdzHwPkAF5EFYk3z+NgktXGbTjeFBB9fA9O30FB
         MVxDbm5E6u3VToZqA1ktVp9uqJ8K7gk1POrVA2nV+Ysy4dJa4K5nM0rw5pLefoBuXJUu
         mk7MEnSJSPdY4k1Gi2Jo18qGJ6aZZ/tz30E++Di1PWQkW0g+QNLJYOaHvZE0uCWee4GJ
         gjqaGwbGzdzhtAdiZ7tdpy2ll3z0+itYfrnkRjXGq2TgpvNVvpHXEXOlHn5iI8YsesUx
         h9XA==
X-Gm-Message-State: AOAM532A/fjs4k4ddcPqM6HhiLxZSOGFsVRIgfq6Cp/V+h5JTckJv965
	tjCIQM7nyLudE+GQFVCnuoMMtVnDtik=
X-Google-Smtp-Source: 
 ABdhPJzxskgng68FgJydo8dKNs5WyKRvAHBs0Ip2oh4k1LVesAxbJYhNae7K9aEsr62OV5SouMeNGQ==
X-Received: by 2002:a17:902:8b8c:: with SMTP id
 ay12mr1001384plb.7.1644394279129;
        Wed, 09 Feb 2022 00:11:19 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:54e0:830b:8827:cd16:3dee:a408])
        by smtp.gmail.com with ESMTPSA id
 y41sm18861784pfa.213.2022.02.09.00.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 00:11:18 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][master][PATCH 2/2] test_buildhistory: Add test to verify that
 LICENSE is added
Date: Wed,  9 Feb 2022 13:39:06 +0530
Message-Id: <20220209080906.20759-2-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209080906.20759-1-sanakazisk19@gmail.com>
References: <20220209080906.20759-1-sanakazisk19@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 08:11:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161539

Added test case which uses BUILDHISTORY_EXPORT_RECIPE_VARIABLES
and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to add LICENSE for glibc as a
sample recipe to buildhistory and the test verifies that expected
license value is written in latest file.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../recipes-test/glibc/glibc_%.bbappend       |  2 +
 .../oeqa/selftest/cases/test_buildhistory.py  | 50 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-selftest/recipes-test/glibc/glibc_%.bbappend
 create mode 100644 meta/lib/oeqa/selftest/cases/test_buildhistory.py

diff --git a/meta-selftest/recipes-test/glibc/glibc_%.bbappend b/meta-selftest/recipes-test/glibc/glibc_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/glibc/glibc_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta/lib/oeqa/selftest/cases/test_buildhistory.py b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
new file mode 100644
index 0000000000..5b0ce4be24
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
@@ -0,0 +1,50 @@
+import unittest
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.selftest.cases.buildhistory import BuildhistoryBase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+class BuildhistoryTests(BuildhistoryBase):
+
+    def test_write_license_to_latest_recipe(self):
+        target = 'glibc'
+        recipe_variables = []
+        self.write_recipeinc(target, 'BUILDHISTORY_EXPORT_RECIPE_VARIABLES += \"LICENSE\"')
+        self.run_buildhistory_operation(target)
+        add_buildhistory_config = 'PACKAGE_CLASSES = \"package_ipk\"'
+        self.append_config(add_buildhistory_config)
+        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
+        pkghistdir = get_bb_var('BUILDHISTORY_DIR')
+        PACKAGE_ARCH = get_bb_var('MULTIMACH_TARGET_SYS')
+        bitbake('-c package_write_ipk -f %s' % target)
+        infofile = "{}/packages/{}/{}/latest".format(pkghistdir, PACKAGE_ARCH, target)
+        expected = "LICENSE = GPLv2 & LGPLv2.1"
+        result = False
+        with open(infofile, "r") as f:
+            for line in f:
+                if line.strip() == expected:
+                    result = True
+                    break
+        if not result:
+            raise AssertionError("Expected License not found")
+
+    def test_write_license_to_latest_package(self):
+        target = 'glibc'
+        recipe_variables = []
+        self.write_recipeinc(target, 'BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += \"LICENSE\"')
+        self.run_buildhistory_operation(target)
+        add_buildhistory_config = 'PACKAGE_CLASSES = \"package_ipk\"'
+        self.append_config(add_buildhistory_config)
+        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
+        bitbake('-c package_write_ipk -f %s' % target)
+        pkghistdir = get_bb_var('BUILDHISTORY_DIR')
+        PACKAGE_ARCH = get_bb_var('MULTIMACH_TARGET_SYS')
+        infofile = "{}/packages/{}/{}/{}-dbg/latest".format(pkghistdir, PACKAGE_ARCH, target, target)
+        expected = "LICENSE = GPLv2 & LGPLv2.1"
+        result = False
+        with open(infofile, "r") as f:
+            for line in f:
+                if line.strip() == expected:
+                    result = True
+                    break
+        if not result:
+            raise AssertionError("Expected License not found")
-- 
2.17.1


