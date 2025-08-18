Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE335CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 08:16:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.69857.1755504961949041299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 01:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CmEDaopF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457f5835dso40198545ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 01:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755504961; x=1756109761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx75IYNq168N+TVXxyt5fa6eZgiMDmsWf225i6fVCx8=;
        b=CmEDaopFa5klvo/cOnos/v0u+DShyX+LUuYoR8Pls+cUmOCY+bZKa8VnQzXKnhPksg
         n2kM3oaaxNIRqtPtvOBRv+Ag+cwnOQbl9zAvJd6re1GRnVikj0PDWFaUEMCEH9oWzqmP
         5r+t5S9BvuBKgp8oPPN81Qg2I09w//zcAPbevevEogK75JFqCxSetqUlT+8N8jzRMTl3
         a/oZrq5US9DuxzJYXkeq5bMuX1VZ8x3LKSyWchknjx4wwDUv+EcQvWlBQQINIAUeYdkM
         nnzp/ZQjcdaTuSDfepisJk0cW6ueGAHgOIDrGnsmyZ4fr5KLRYH7UWsl5Szi1e5E4bmy
         Ghkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504961; x=1756109761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx75IYNq168N+TVXxyt5fa6eZgiMDmsWf225i6fVCx8=;
        b=FFwNO3w+OVl/5cC+eWL0wJ5/WkiUtV3dlfOtNBo8sPACjPEpMlNoaa2K1owzdl2Y71
         nFMSmz06rwz8UImbgJnLYpjsl5JAVWQ18ek3TjKjEc4L656sFzzSwrBRMOYOdxvbyE6k
         4xxMvN/1rsNW9yQPe+r+WJFdmHZJavBLeN8fz6AochLJdbuyZRzFe1n60VSHVLb9m3FW
         I+t40B3aSpzyxc5ufN4yneE/O3pFp+aWTcIZNkK7xo+Mu/3MgfRyCjj7lOhYwjEu5p4x
         yz+LPrpQwQGJpfmXNH0y0iXFncfFmGyCD7f2lXniZrpqrLRjq5Lb6pXIODWZDm7K0Qlc
         TUHQ==
X-Gm-Message-State: AOJu0Yzkaac6XovrYK4JGlR6e8pheE+oKhJMhUc/at45KPn9c5RvczwL
	lSDV0P06ZQiHzMFjOu8nzfpUy9RfaGcTU4aNUALFSb9BahMYHrxSkh+A8HGYpw==
X-Gm-Gg: ASbGncuswAv0hNiGEg2Lz4C35zAK/PHzZ+aY3JQQqODl7zR4vmplp9lU0Ftalgo5yEv
	AFbj0y69kgdBQoJQEAXXEiRLzqpFSlFHcchw3+42qmW2/1GE924CnnPNU+m06c0Y8o29Wt5Bzqk
	L23JQ7q9MjgS2kcuOvYcsJPdZPEPAKt7x3xab5hR1bCcgeHnNxow4wZLlYg9Kriprao6h1DGC4p
	Qm2q9dXfnSGhAwv9wHCBGuzsoryNryWuxbAAlt9Esmapi9dka9bWom92ljqZaJY6aBTygz6oSwG
	Oy+AbKv9YposYW+XKiPdLH+FuXQdk9oBPfHCa0WUlnkMwaoaeAK8hmbuLVijMq+Bs0rgtPBGm6I
	T0bB4ivgb1fYOVrzoK/3nRkdgGho=
X-Google-Smtp-Source: AGHT+IF9iRU+5KbSx5hpZEnPhpViRQW2JHSBPcmfRK+rFvhr4mJRxA83DsZ7UWIepXRqtU6UBlIM/Q==
X-Received: by 2002:a17:902:ecc8:b0:243:1a1:5ed with SMTP id d9443c01a7336-2446d85c926mr127512145ad.27.1755504960972;
        Mon, 18 Aug 2025 01:16:00 -0700 (PDT)
Received: from L-16522.kpit.com ([49.205.201.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9d00bsm73456245ad.31.2025.08.18.01.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:16:00 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libmd: add ptest for 'libmd'
Date: Mon, 18 Aug 2025 13:45:57 +0530
Message-Id: <20250818081557.776364-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 08:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222035

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for libmd.
It takes less than 30seconds for ptest completion.

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-support/libmd/libmd/run-ptest      | 13 +++++++++++++
 meta/recipes-support/libmd/libmd_1.1.0.bb       | 16 ++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libmd/libmd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e3099439f4..6cfafdca5a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -31,6 +31,7 @@ PTESTS_FAST = "\
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
+    libmd \
     libnl \
     libpcre \
     libssh2 \
diff --git a/meta/recipes-support/libmd/libmd/run-ptest b/meta/recipes-support/libmd/libmd/run-ptest
new file mode 100644
index 0000000000..871b6a0102
--- /dev/null
+++ b/meta/recipes-support/libmd/libmd/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+for testFile in $(ls); do
+	if [ "$testFile" = "run-ptest" ]; then
+		continue
+	else
+		if ./${testFile}; then
+			echo "PASS: ${testFile}"
+		else
+			echo "FAIL: ${testFile}"
+		fi
+	fi
+done
diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
index dc588a0f95..223f1f1418 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -8,9 +8,21 @@ HOMEPAGE = "https://www.hadrons.org/software/libmd/"
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 
-SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
+SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
 
-inherit autotools
+inherit autotools ptest
+
+do_compile_ptest() {
+    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
+    oe_runmake check
+}
+
+do_install_ptest() {
+    # install the test dir
+    cp -rf ${B}/test/.libs/* ${D}${PTEST_PATH}
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


