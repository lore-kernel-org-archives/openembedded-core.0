Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 10A136D9B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 02:19:57 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id t187so1564062pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 19:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1wlBjAHDMB2JJmS4/fl19gH7QrVL4LSEnPT4fT5PyNA=;
	b=Zlml0524m91AdfWEENqIVE2cEXE1aA2w8ZlbpWvhqf+Ehg4h/7lTvPpjAF+hjFNG5j
	rzPhne3TYtFCRr8vz9qOFzDtGsZpwQwya1Sp2k0u+YW3UrzmgnHdeMwGWtTyqcsSGWiM
	qCMwi/dpG3465uqTfAd/oot2jY2S1/C3r82aHUnCbznVPjbD7z3oFrvai3wH8+lMN0TQ
	GFOgpXxflWEfzMUloh2uFVm2HyEa9IVH8YhdEbmcExW+BwOYSgR+MmxuIcecC1fq+qBM
	Qp0fsx6BidieHVhBHK8VEWUWwOucHXX1dficfSx8ZZHdikdAkKCAM+ZMqIEvVyglHDoc
	pSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1wlBjAHDMB2JJmS4/fl19gH7QrVL4LSEnPT4fT5PyNA=;
	b=ZbQPHZKi8C45iyOKcx8gVWaYkQv1GP7caPgzdEt+0um0M1YRqrK2s40UrU+WZ48vDC
	swFVLDYZuvup9AF8BeAJd+9dAso0KK7aY6xCpeH+xI/Ag9tj4d9EskU+KRtkCih+QXqq
	c58dZtRMVHjY+VfSg0cD/eAkcfjWJ9FHdAUtHRrogKTjn513Sm36/agBxfQb9iq3/E+H
	355kGZGtIAlxrFb9ZbyoHjCk51sZQ1qF40rhH5NixO599Zsd7mSQJ02mgTyelHj/5NPD
	Q0VEbp71Ghp5we5UQNkTfL5S6eSKa2kqex/lYsXKV8I+WqzeTKoE98pzfMnT7keFqEMe
	nGlA==
X-Gm-Message-State: APjAAAXYfGOWCvzE91Au9xxoQDF0qcXsAHBaGeiEp8hN7nWlcwrK86oT
	aLv0ozYZmEqHFZ8wZBFJxU6ekHc2
X-Google-Smtp-Source: APXvYqxE/75dTLIlV0OOVdk5EugvUo2pEkosQJ4xLo5JkZOPZR+EjXLTazd1wsJYKguYSMkmsISmcQ==
X-Received: by 2002:aa7:9095:: with SMTP id i21mr31201631pfa.134.1557109198954;
	Sun, 05 May 2019 19:19:58 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	v82sm18012067pfa.170.2019.05.05.19.19.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 19:19:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 19:19:55 -0700
Message-Id: <20190506021955.26534-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506021955.26534-1-akuster808@gmail.com>
References: <20190506021955.26534-1-akuster808@gmail.com>
Subject: [PATCH 2/2] nss: add ptest support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2019 02:19:58 -0000

This belongs in the long test group

Here is a baseline:

Tests summary:
--------------
Passed:             9132
Failed:             61
Failed with core:   0
ASan failures:      0
Unknown status:     0

DURATION: 15134

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nss/nss/oe_ptest_fixup.patch              | 34 +++++++++++++++++++
 meta/recipes-support/nss/nss/run-ptest        |  3 ++
 meta/recipes-support/nss/nss_3.43.bb          | 10 +++++-
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/nss/nss/oe_ptest_fixup.patch
 create mode 100644 meta/recipes-support/nss/nss/run-ptest

diff --git a/meta/recipes-support/nss/nss/oe_ptest_fixup.patch b/meta/recipes-support/nss/nss/oe_ptest_fixup.patch
new file mode 100644
index 0000000000..e8f64aad2b
--- /dev/null
+++ b/meta/recipes-support/nss/nss/oe_ptest_fixup.patch
@@ -0,0 +1,34 @@
+
+Upstream-Status: OE specific
+
+remove some tests that currently hang
+Update DIST path /usr
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: nss-3.43/nss/tests/common/init.sh
+===================================================================
+--- nss-3.43.orig/nss/tests/common/init.sh
++++ nss-3.43/nss/tests/common/init.sh
+@@ -267,7 +267,7 @@ if [ -z "${INIT_SOURCED}" -o "${INIT_SOU
+     COMMON=${TEST_COMMON-$common}
+     export COMMON
+ 
+-    DIST=${DIST-${MOZILLA_ROOT}/dist}
++    DIST=/usr
+     TESTDIR=${TESTDIR-${MOZILLA_ROOT}/tests_results/security}
+ 
+     # Allow for override options from a config file
+Index: nss-3.43/nss/tests/all.sh
+===================================================================
+--- nss-3.43.orig/nss/tests/all.sh
++++ nss-3.43/nss/tests/all.sh
+@@ -303,7 +303,7 @@ if [ $NO_INIT_SUPPORT -eq 0 ]; then
+     RUN_FIPS="fips"
+ fi
+ 
+-tests="cipher lowhash libpkix cert dbtests tools $RUN_FIPS sdr crmf smime ssl ocsp merge pkits ec gtests ssl_gtests policy"
++tests="cipher lowhash libpkix cert dbtests tools sdr crmf smime ocsp merge pkits ec policy"
+ # Don't run chains tests when we have a gyp build.
+ if [ "$OBJDIR" != "Debug" -a "$OBJDIR" != "Release" ]; then
+   tests="$tests chains"
diff --git a/meta/recipes-support/nss/nss/run-ptest b/meta/recipes-support/nss/nss/run-ptest
new file mode 100644
index 0000000000..7cdfdea9e1
--- /dev/null
+++ b/meta/recipes-support/nss/nss/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+HOST=localhost DOMSUF=localdomain ./tests/all.sh
diff --git a/meta/recipes-support/nss/nss_3.43.bb b/meta/recipes-support/nss/nss_3.43.bb
index f8cf5a46af..41e08cce0d 100644
--- a/meta/recipes-support/nss/nss_3.43.bb
+++ b/meta/recipes-support/nss/nss_3.43.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
+           file://oe_ptest_fixup.patch \
+           file://run-ptest \
            "
 
 SRC_URI[md5sum] = "67c8fa282c32cb56117fdd530dd77001"
@@ -39,7 +41,7 @@ SRC_URI[sha256sum] = "f30bc1b7330887b75de9fec37dbc173001758dc43fb095ffbc45dac409
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
 
-inherit siteinfo
+inherit siteinfo ptest
 
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
@@ -227,6 +229,11 @@ do_install_append_class-target() {
     install -m 0644 ${WORKDIR}/system-pkcs11.txt ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
 }
 
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -a ${S}/nss/tests/* ${D}${PTEST_PATH}/tests/.
+}
+
 PACKAGE_WRITE_DEPS += "nss-native"
 pkg_postinst_${PN} () {
     if [ -n "$D" ]; then
@@ -263,5 +270,6 @@ FILES_${PN}-dev = "\
     "
 
 RDEPENDS_${PN}-smime = "perl"
+RDEPENDS_${PN}-ptest = "nss bash tcsh make perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


