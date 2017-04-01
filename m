Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 38F7571CA3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 20:06:44 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 79so22976468pgf.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Apr 2017 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=URoGGvAFc5wXIMKRmre9mMQOoQlfmRJ8JQT+IICebk4=;
	b=hgt8BwpzC0VzgP3dS2B2xHMhWSSB2OXeGpw1oVlT1h54g/qQ64tRm5Z3/BhjOh03pp
	YvRPDfwYwrcI2FnWLrS4vsNZWfplZtFV0IfrpixXUeDzmiLN9iGpErIBHiqo32f2w6uU
	niBbbV9b4YEfM0dOpee3281v8y5p0EC36ahgvj5bXZ7FpzewXrXkW69gHKwc2k5Z32f2
	FdRNYgoGhPY3QhUO8UbJVxFdoPe/0BEUoHqGa7FSwm6uMPnDA7DJohuSKjjzm4OWmw7s
	XkU1Q6vfLL/WFRrm6Mro/Ze8Eax1zTHJnS+CSO2XReU5Vz4G6vGj160t3aikcaFGhm6p
	D2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=URoGGvAFc5wXIMKRmre9mMQOoQlfmRJ8JQT+IICebk4=;
	b=D2h5G9QGeZM40+5WEuv09lCLflMbP3sGzG1YHmx5fSSVQIuZNYSoZoz0DRqYgfXx8Q
	Na7B0LtPfDW3YVqZKGgwIobKsg6H6WTQVJ4B9hE6Obocy3WCfDpaYEFJTeXsScp3KWvS
	j1ay7U91o4J4IAFO6uNmdzLtdXgD1x+ufQdw2Y51C0hXjLIMMy9fRBlgepA9Bg1WyEmE
	84zilRhJZRLVTXhs6w9OOJJPvfQes1hHji0h1rmTCSVLfYex+94VfbyRKcYPf7HF5UE4
	hiiN77VSwwRlPi36kCXkBd7NpLczBvITSQ66fuHq/W1VUOSVw/b9PbnoM2jpfXuvbBe9
	OFXQ==
X-Gm-Message-State: AFeK/H2z7c3ExD9rIZ1SAV3fvaNs0oMGKE6/F3FCXTLWis7spJwGAQyYoa9BL1PmDMFluw==
X-Received: by 10.98.8.129 with SMTP id 1mr9183754pfi.268.1491077206157;
	Sat, 01 Apr 2017 13:06:46 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	r12sm17532501pgn.26.2017.04.01.13.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Apr 2017 13:06:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat,  1 Apr 2017 13:06:44 -0700
Message-Id: <1491077204-30363-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] lz4: update to lastest 1.7.4
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
X-List-Received-Date: Sat, 01 Apr 2017 20:06:46 -0000

From: Armin Kuster <akuster@mvista.com>

update SRC_URI: as of 1.7.3, repo changed. same owner
Renamed recipe to reflect PV and added Epoch
Added ptest, tests added v1.7.3
updated LICENSE to be more accurate.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/files/run-ptest | 43 ++++++++++++++++++++++++++++++++
 meta/recipes-support/lz4/lz4.bb          | 21 ----------------
 meta/recipes-support/lz4/lz4_1.7.4.bb    | 33 ++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-support/lz4/files/run-ptest
 delete mode 100644 meta/recipes-support/lz4/lz4.bb
 create mode 100644 meta/recipes-support/lz4/lz4_1.7.4.bb

diff --git a/meta/recipes-support/lz4/files/run-ptest b/meta/recipes-support/lz4/files/run-ptest
new file mode 100644
index 0000000..d3bfc49
--- /dev/null
+++ b/meta/recipes-support/lz4/files/run-ptest
@@ -0,0 +1,43 @@
+#!/bin/sh
+cd testsuite
+
+echo -n "---- test-lz4 ----"
+make -C tests test-lz4  > /dev/null 2>&1
+
+if [ $? -eq 0 ]; then
+  echo "PASS"
+else
+  echo "FAIL"
+fi
+
+echo -n "---- test-fasttest ----"
+make -C tests test-fasttest  > /dev/null 2>&1
+if [ $? -eq 0 ]; then
+  echo "PASS"
+else
+  echo "FAIL"
+fi
+
+echo -n "---- test-frametest ----"
+make -C tests test-frametest > /dev/null 2>&1
+if [ $? -eq 0 ]; then
+  echo "PASS"
+else
+  echo "FAIL"
+fi
+
+echo -n "---- test-fullbench ----"
+make -C tests test-fullbench >  /dev/null 2>&1
+if [ $? -eq 0 ]; then
+  echo "PASS"
+else
+  echo "FAIL"
+fi
+
+echo -n "---- test-fuzzer ----"
+make -C tests test-fuzzer >  /dev/null 2>&1
+if [ $? -eq 0 ]; then
+  echo "PASS"
+else
+  echo "FAIL"
+fi
diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
deleted file mode 100644
index 03c5a7a..0000000
--- a/meta/recipes-support/lz4/lz4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Extremely Fast Compression algorithm"
-DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
-
-SRCREV = "d86dc916771c126afb797637dda9f6421c0cb998"
-
-PV = "131+git${SRCPV}"
-
-SRC_URI = "git://github.com/Cyan4973/lz4.git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
-
-do_install() {
-	oe_runmake install
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/lz4/lz4_1.7.4.bb b/meta/recipes-support/lz4/lz4_1.7.4.bb
new file mode 100644
index 0000000..5ddffd5
--- /dev/null
+++ b/meta/recipes-support/lz4/lz4_1.7.4.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Extremely Fast Compression algorithm"
+DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+
+LICENSE = "BSD | BSD-2-Clause | GPL-2.0"
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc\
+                    file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LICENSE;md5=7f2857d58beff6d04137bf9b09e5ffb6"
+
+PE = "1"
+
+SRCREV = "7bb64ff2b69a9f8367de9ab483cdadf42b4c1b65"
+
+SRC_URI = "git://github.com/lz4/lz4.git \
+           file://run-ptest \
+"
+
+S = "${WORKDIR}/git"
+inherit ptest
+
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}" 
+
+do_install() {
+	oe_runmake install
+}
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}/testsuite
+	cp -rf ${S}/* ${D}${PTEST_PATH}/testsuite
+}
+
+RDEPENDS_${PN}-ptest += "make python3"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


