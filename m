Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CB3CA6CBD
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:16:37 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6590.1769505392420079385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AdxKT+q4;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82318702afbso4186279b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 01:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769505392; x=1770110192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uo5+32Q5wd/E33LU/YC7u45Wtfd3tdQQdWcZvTDf+sQ=;
        b=AdxKT+q4ZRitPs2aiZgCR4zAV+t8H7tmeN5yMCNV3mFEdNxufrmRIWkjseyNrR7G6v
         FEHI7/NMFOHjGYwNnL0d26S2eGjDvaK5ccfA6uwUoFcKtlhMOA20UBsjeLsLY70QoaqU
         sfS1PxJwGeO3qbBwfFnZQTLok28AIniDLCY8fpuElcKaCqSzykZ2+f80tynBpYFnqK17
         0/hBHHhWGYZeFHEWEPJuSfdqjObwmQqdEcpV/ODLNvpWsw0eASK4W+OPHR5sqoNRjM2o
         yCbhyFc2yWu4jwYTf8/tTTaZLXJ/JWxTuSG3RRbe3oEb/e77k0Sw1teuvbt9FGF8a4gQ
         Y9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505392; x=1770110192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uo5+32Q5wd/E33LU/YC7u45Wtfd3tdQQdWcZvTDf+sQ=;
        b=i82ueSPJdLBiYJZfkhUJmIOCmauVZKIlMRfGLLUGv3g6y9Xz1mEg/9V1WPkiJq9JO7
         FFxvJKNR35GubDFTOCrLIFUcTBZshcfRhynxffQbeA45bSCRm8ie/xCM6FMlBc0rzJec
         Jyu7z2VJJCmas+sO6A1TlFxxYOoLDLuElnJHxXHm9ZXu1ddO+iBEJd9CKGvzX6MNtl+e
         OK0O9kAypuRBJZi+krdK1aEnXtT+2y+Lnq81mFdyQcO3yDfjF4UUSyvCeDSXNqOG8AdL
         q1zrXeNTwgAMXPJSF1C7CvdsK0mEgUHsvSkbLPlnb5gnNmjslmvPcu2gVLnG3tUMkQsv
         Ju0w==
X-Gm-Message-State: AOJu0YyA73iHOBOlVsnOH4+gfbxKQwCCA26UbIdU0m3EvjdIYPASkFqc
	SgKBjynxl5rFdGg919biFgsdTehSRdvLRXX57yeWpJ9cRU6WjKcvFUA1h/XmVQ==
X-Gm-Gg: AZuq6aInmEPmruk8g8DiGxLaIznmAnDXkM0FQLVQqxSbxTkEh/NwMseSd8GfEsM5rKO
	PnKhRyPnJR3fTU6b2HzXbYxoG8S2tH1LvhmZzJe9Fn1qFsshhbb6AFFYM0i3Y+gGuVVI4lcfkku
	Z4xcSokLigDjx0BU+m8zmbCKyyJfgp+DdKLPDYj0Kob6utxg2jcW7lEB8HgoUsBk2Qb1m868jUG
	KaBDS1b2kmFlgP5njxJGAbq8DsZa7eVNs0eTMwLPfEXS+0Sk1AUa/7hwQwyIdY+khfwCmVGpn8V
	MdvLeQCuq2aCTjo7NZHl3UUYwDJTA/XE0bgXNrk2A5YcZpqKLQ6WsqYaeiLdhC8DcI18Evm0hur
	oZXMR/kaQe8TAARIjc2Q9tstuc1QCOQIABSVWJlC/05XtzsglbpbHCchY6PkBKMD1aqUR803xWR
	+zu6+092Tqje5DqoGR
X-Received: by 2002:a05:6a21:4d8d:b0:366:14ac:e1e5 with SMTP id adf61e73a8af0-38ec6446b2fmr962397637.75.1769505391446;
        Tue, 27 Jan 2026 01:16:31 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm109563755ad.46.2026.01.27.01.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:16:31 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH] libmd: add ptest for 'libmd'
Date: Tue, 27 Jan 2026 14:46:08 +0530
Message-Id: <20260127091608.598339-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230035

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for libmd.
It takes less than 30seconds for ptest completion

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
 meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libmd/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9950e46776..784176f579 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST = "\
     json-glib \
     libconvert-asn1-perl \
     libgpg-error\
+    libmd\
     libnl \
     libpcre \
     libssh2 \
diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-support/libmd/files/run-ptest
new file mode 100644
index 0000000000..0c4a5f64ec
--- /dev/null
+++ b/meta/recipes-support/libmd/files/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+cd test
+status = 0
+
+for testbin in *; do
+    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
+        if "./$testbin"; then
+            echo "PASS: $testbin"
+        else
+            echo "FAIL: $testbin"
+            status=1
+        fi
+    fi
+done
+
+return $status
+
diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
index dc588a0f95..ffc59deb26 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -8,9 +8,26 @@ HOMEPAGE = "https://www.hadrons.org/software/libmd/"
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 
-SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
+SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
+	   file://run-ptest \
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
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    for bin in ${B}/test/*; do
+        if [ -x "$bin" ]; then
+            ${B}/libtool --mode=install install "$bin" ${D}${PTEST_PATH}/test/$(basename "$bin")
+        fi
+    done
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


