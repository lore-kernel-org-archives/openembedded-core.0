Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1171C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 21:34:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.232.1685741697074480422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 14:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AJF6VTMW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso2575940f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685741695; x=1688333695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jU4uJEEophNBBLU0l8JMvhTsZCl4SgEyCg/DPp2qCk=;
        b=AJF6VTMWS0Dq+/LklmZtneKdJUqb6b/hXN+TUWeXCVpEXVv0/GWl9P00oNwIsoYNt+
         EBYVDA+todTMu+6Rk6ghaQYiz+cgJye0BquanUD+OV2ojiX1qYl7FsPFs1egauAzqkXr
         7SdS5gIsGeOTwK2ejQXHAtmAFA4OdNjQIMqDkyqN6us36yiHE7A9T/tYO08Z0AO5/+AV
         TDXYQ2yB4C/5ugxziO+lLxtEhDcKDxdg+MrPSk+M+//I1FCnlnRzZVpfaeC3GVBzAO9C
         HyF6TCj7z/Kc/BRA9/Hea49TPgVNgh5cyU1FwKsNaMmZf52hW8Bmdb/gS/maD5HeMs3B
         iNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685741695; x=1688333695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jU4uJEEophNBBLU0l8JMvhTsZCl4SgEyCg/DPp2qCk=;
        b=UabddVoMGCSpyKLavGKTnA4I7GEYqy46Hg/Q9kst26Dhk9obLJqjClpxklYCTxuG1L
         QoDziW+yEmxdy1bg0dmc/T9j6YVYILVXXQX7rUn3QvMRc9gyYuSHlAFRazRhTyQVjDF3
         aN5ljQiu/jMGwoH2LAXbNrIxqxY/mdenC4sBx3yYk67D7CxlSSDK+DIlHkMxoc43kLGR
         cLI/HF8sZwQb+MB1LfzZ3aQ8/wXxR/hxwQ6Nwa+FB1rxxEaw2+7zELnsf5CfhMzjmxat
         tPLTfUjIfwECKBFRzC3L/BTG2tow/6SanitX9op9VbUtmwbZ+TCZbCHVyBONUW/G7Q5d
         qy5w==
X-Gm-Message-State: AC+VfDzwdXW40phpD+TApJ6nOAMJhsI1Hd9Ve+4JZs3vkaZKUDMTvFcc
	5uyAmcx61DUZ8F1ojybv7VcMhNITfEM=
X-Google-Smtp-Source: ACHHUZ6ATrVwl53YQWnnV6DlrAiREZ5bydFz6l9Iibob8+oBkF4J4UGR8Mxc/TF2HNn3PuiW+hMzqQ==
X-Received: by 2002:adf:e4ca:0:b0:309:46f5:cea7 with SMTP id v10-20020adfe4ca000000b0030946f5cea7mr867430wrm.17.1685741695236;
        Fri, 02 Jun 2023 14:34:55 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id y4-20020adfe6c4000000b00307bc4e39e5sm2649067wrm.117.2023.06.02.14.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:34:55 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libssh2: Upgrade to v1.11.0
Date: Fri,  2 Jun 2023 22:34:52 +0100
Message-Id: <20230602213452.23696-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 21:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182343

Changes:
Update license checksum: change in copyright year.
Remove patch fixed by upstream.
Disable rpath, hardcoded rpath failed curl-native build.
Adjust ptests.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../libssh2/libssh2/fix-ssh2-test.patch       | 23 -------------------
 .../recipes-support/libssh2/libssh2/run-ptest |  2 +-
 .../{libssh2_1.10.0.bb => libssh2_1.11.0.bb}  | 16 ++++++++-----
 3 files changed, 11 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
 rename meta/recipes-support/libssh2/{libssh2_1.10.0.bb => libssh2_1.11.0.bb} (67%)

diff --git a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch b/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
deleted file mode 100644
index ee916c42d4..0000000000
--- a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-In 8.8 OpenSSH disabled sha1 rsa-sha keys out of the box,
-so we need to re-enable them as a workaround for the test
-suite until upstream updates the tests.
-
-See: https://github.com/libssh2/libssh2/issues/630
-
-Upstream-Status: Backport [alternative fixes merged upstream]
-
-Patch taken from https://github.com/mirror-rpm/libssh2/commit/47f7114f7d0780f3075bad51a71881f45cc933c5
-
---- a/tests/ssh2.sh
-+++ b/tests/ssh2.sh
-@@ -25,7 +25,8 @@ $SSHD -f /dev/null -h "$srcdir"/etc/host
-     -o 'Port 4711' \
-     -o 'Protocol 2' \
-     -o "AuthorizedKeysFile $srcdir/etc/user.pub" \
--    -o 'UsePrivilegeSeparation no' \
-+    -o 'HostKeyAlgorithms +ssh-rsa' \
-+    -o 'PubkeyAcceptedAlgorithms +ssh-rsa' \
-     -o 'StrictModes no' \
-     -D \
-     $libssh2_sshd_params &
-
diff --git a/meta/recipes-support/libssh2/libssh2/run-ptest b/meta/recipes-support/libssh2/libssh2/run-ptest
index 5e7426f79d..ed87074fcd 100644
--- a/meta/recipes-support/libssh2/libssh2/run-ptest
+++ b/meta/recipes-support/libssh2/libssh2/run-ptest
@@ -2,7 +2,7 @@
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd tests
-for test in simple mansyntax.sh ssh2.sh
+for test in test_simple mansyntax.sh test_sshd.test
 do
 	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
 done
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
similarity index 67%
rename from meta/recipes-support/libssh2/libssh2_1.10.0.bb
rename to meta/recipes-support/libssh2/libssh2_1.11.0.bb
index d5513373b0..31a3c0c90b 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -5,20 +5,20 @@ SECTION = "libs"
 DEPENDS = "zlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
-           file://fix-ssh2-test.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
+SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
 
 inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += "\
                  --with-libz \
                  --with-libz-prefix=${STAGING_LIBDIR} \
+                 --disable-rpath \
                 "
 
 # only one of openssl and gcrypt could be set
@@ -41,9 +41,13 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
 	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
+	cp -rf ${B}/tests/test_simple ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/test_sshd.test  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/openssh_server ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/key* ${D}${PTEST_PATH}/tests/
+# Makefile.inc required as test_sshd.test generates the list of test from this
+	cp -rf ${S}/tests/Makefile.inc ${D}${PTEST_PATH}/tests/
 	mkdir -p ${D}${PTEST_PATH}/docs
 	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
-- 
2.30.2


