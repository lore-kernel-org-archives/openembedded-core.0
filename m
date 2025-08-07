Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805C0C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 20:14:03 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.5771.1754597633983433453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 13:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDigElg2;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-615c29fc31eso2650937a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754597632; x=1755202432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9keGd0BGFir4QAnKCwO1S9HBliuMeLPDbV5+oYJBSI=;
        b=GDigElg28d7NS/PSyeJ4O6MKirjOkYtIyKLjuLhVfkCu3dQvnwOUn1JINu5iiovI81
         4XPoveKKfBlIbiPHhJ7W5Y6g/Ck78J3DjbpSy8NLm1iZ3DipL0PFbPfo8QkPE3YvR/8F
         a/+EiMwzSLX/7SuwcvbKpLJtagJRLi/0TsHrVv2qTjEL4jJ4r2/XO199/tkoJnDQGTpV
         7ck5PD1sGL4lwhnQiPW7p/MMk9pIISeflYTW12iFHpAyFcnDVyHWd5T1mBPQw9SXQEos
         rvtMkqrBIhZ0x9xy5Yr9tqfGMfcrtfhxknIKEj1fMOeCXPVCBfCohZx4yqyxpho1lyOM
         izZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754597632; x=1755202432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9keGd0BGFir4QAnKCwO1S9HBliuMeLPDbV5+oYJBSI=;
        b=NW/FHHydi3TNoW+OjgbxbouYDpyiqWFjUEnNvp2FrrTR3Ccw8dMKPHjWS6f7ThAzE3
         T+tkFpFhXs40AfRygBXFZFRdf5Im6nMD2CGFm8SSyONw/5vdFkf1s3zMSzhvghX35QMd
         NlJKc2n33lhakTjGjg+3AXdVQM5E6XPnPlWNSTUH7AVHnSL8jmEpGH8uT/NRLOej5E0F
         ojJd/WFBBjgcml4Ow4p+4O3MkdCK6elKA0AJu7wSZs6VKg2PXlqIlAjff9HZwtcbGfzW
         EB8vTH86vrXZwtXV7csnOOGmdkHP/Qe3ORU67YBXNJpcr0yZkufDdpK5SpE/id1/Speb
         6tJA==
X-Gm-Message-State: AOJu0Yzx/IeB2BgJ/qxqnWeyksnbjZRFnTMknUCAvrC0IjviMp+/Uf2J
	iTVNe4ZgpVYUMaGmLurcYSA2Ihdti7x+A75ABxcu24N0FU4tTE9ZCECZ9pOGwA==
X-Gm-Gg: ASbGncuDPjWlVYUCdwQl51k0sbXkr6Sf6qSBXYcTdfjFbthzKxWDPeJHNx2yj/IZm/G
	1v2y8ImpAaLv8wm8YX0JcIPCqVOsBRSaOGNSCKvUhy1IsyZuvgjjyjmkK+TuK211/rUWUnjS1v9
	aksGEUds/N1B4GvtZK4QjmpASZ7SIFuLuLKVbWVU5uTJmKQgQt8+1bgKyQ8GcGkjjeZvqy7Yjn7
	8rsikk4gwgMcv5/fT9/w3lq7FhWqK/ZK1u6YJUV/npnc4eIxSVM7E7k8/mQn76XCPkA+ZBBXYf7
	Pqhvvltn7JppaFeV+qzTFW4sdhYvzBbuB+9Ep3yLFv50rijOqjeUrZ0AhkeO8ZR5wJruz3jhM4P
	PK1vdYGnAvyP9GPcuH1A=
X-Google-Smtp-Source: AGHT+IGeLNOv2i3r+OqCnrcLpA8ahhtdEZACOTLcPE/pwuVg7QRbrYH9sTtcLtlyr46T0GwfGu/l/A==
X-Received: by 2002:a17:907:c1c:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-af9c647bce8mr24266266b.35.1754597631575;
        Thu, 07 Aug 2025 13:13:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0757b7sm1361091866b.19.2025.08.07.13.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 13:13:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] dpkg: add ptest support
Date: Thu,  7 Aug 2025 22:13:50 +0200
Message-ID: <20250807201350.4026659-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 20:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221584

Added it to slow tests, as it takes betwen 165 and 190 seconds on my
machine to execute (qemux86-64 + kvm).

The test folder's Makefile contains a list of passing, failing and manual
tests. By default, only the expected-to-pass tests are executed by the
Makefile (unless magic environment variable is set).

The run-ptest script mimics the default behavior of executing the
expected-to-pass tests, however they are executed one by one, instead of
running them as one batch - that way it is easier to determine exactly
which tests pass and which fail.

One other thing that might worth a note, is that the tests folder that needs to be
installed contains a number of subfolders called "DEBIAN". When packaging them
at least with rpm, these folders are omitted from the package.
However these are essential for the tests, as they contain test data. As a
workaround, these folders are renamed during installation to DEBIAN-ptest,
and before execution the run-ptest script restores their names.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
v2: fix the output of the run-ptest script
v1: https://lists.openembedded.org/g/openembedded-core/message/221382

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/dpkg/dpkg.inc           | 16 ++++++++-
 meta/recipes-devtools/dpkg/dpkg/run-ptest     | 35 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |  1 +
 4 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 85c0350161..e3099439f4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -101,6 +101,7 @@ PTESTS_SLOW = "\
     curl \
     dbus \
     dosfstools \
+    dpkg \
     e2fsprogs \
     elfutils \
     gettext \
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index dea1894a4c..b4e9667107 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -11,7 +11,7 @@ RDEPENDS:${PN}:class-native = ""
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-inherit autotools gettext perlnative pkgconfig perl-version update-alternatives bash-completion
+inherit autotools gettext perlnative pkgconfig perl-version ptest update-alternatives bash-completion
 
 PERL:class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
@@ -56,6 +56,18 @@ do_install:append () {
 	fi
 }
 
+do_install_ptest () {
+        install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/src/sh
+        install -m 0755 ${S}/src/sh/dpkg-error.sh ${D}${PTEST_PATH}/src/sh/
+        cp --preserve=mode,timestamps -R ${S}/tests/* ${D}${PTEST_PATH}/tests
+
+        # The folder has a number of test folders called DEBIAN, but these are
+        # explicitly omitted from some packages, e.g. from rpm.
+        # However these are essential for the tests, so rename them to DEBIAN-ptest, and at runtime
+        # from the run-ptest script restore their names
+        find ${D}${PTEST_PATH}/tests -name DEBIAN -type d | xargs -n1 -I{} mv "{}" "{}-ptest"
+}
+
 PROV = "virtual/update-alternatives"
 PROV:class-native = ""
 PROV:class-nativesdk = ""
@@ -90,6 +102,8 @@ RDEPENDS:${PN}-perl += "perl-module-carp perl-module-constant \
                         perl-module-time-hires perl-module-time-piece \
                         perl-module-xsloader"
 
+RDEPENDS:${PN}-ptest += "make coreutils findutils"
+
 # Split out start-stop-daemon to its own package.  Note that it
 # is installed in a different directory than the one used for
 # the bitbake version.
diff --git a/meta/recipes-devtools/dpkg/dpkg/run-ptest b/meta/recipes-devtools/dpkg/dpkg/run-ptest
new file mode 100644
index 0000000000..8c4739ab66
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/run-ptest
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+rm -f dpkg-test.log
+cd tests
+
+FAILED_TESTS=0
+ALL_TESTS=0
+
+# During installation the "DEBIAN" folders are renamed to avoid
+# problems with packaging. Restore their names here.
+for d in $(find . -name DEBIAN-ptest -type d); do
+        dname=$(dirname "$d")
+        mv ${d} ${dname}/DEBIAN
+done
+
+# This allows running tests that require root access (which we have)
+export DPKG_AS_ROOT=1
+
+for test in $(grep "TESTS_PASS +=" Makefile | cut -f3 -d" "); do
+    ALL_TESTS=$((ALL_TESTS + 1))
+    make ${test}-test >> ../dpkg-test.log 2>&1
+
+    if [ $? -eq 0 ]; then
+        echo PASS: $test
+    else
+        echo FAIL: $test
+        FAILED_TESTS=$((FAILED_TESTS + 1))
+    fi
+done
+
+if [ $FAILED_TESTS -eq 0 ]; then
+    echo All $ALL_TESTS tests passed
+else
+    echo $FAILED_TESTS of $ALL_TESTS tests failed
+fi
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index cc30b71109..d793c26d57 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
            file://add_armeb_triplet_entry.patch \
+           file://run-ptest \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
            file://0001-script.c-avoid-use-of-chroot.patch \
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \

