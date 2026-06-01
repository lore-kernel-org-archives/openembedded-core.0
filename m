Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165EECD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 16:57:28 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3871.1780333040637406487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 09:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E5SEU0j6;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8587427468so750903a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333040; x=1780937840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s81sGL8j/xXNQj9VndVo5ElMtnzu7PMZPeciM61HH1k=;
        b=E5SEU0j6eLJhgu5wErC6x5e+sLT+q0C3ONXsF4BzTqXP22sIorjE/YyFAb3s4owLL9
         V8bwsxtIn8UIS3NARyPxBOlNGbxTIdmmcW4F49dGtqNPXiyz9TUAgoY1DAOtKSDIPVie
         lPyWfhQsOB9yFObW35bU4lsgO3COuEzd1AxMY22HT5QJGNWBDkU/Q95aZZa6aoHuUWex
         aJ5oxFzdUrGftNQL3MgLbEfc/8Cs4kTqgqJHX6+to60zUeu+YBgBGqUAldKtaRILQAYu
         4OLp6gUWrRz9xJw1aCYtiTMxLUa6WfZj3PkTiFJxRGeGn+BRFm0gh4pvDXm/ncXRqKic
         5rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333040; x=1780937840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s81sGL8j/xXNQj9VndVo5ElMtnzu7PMZPeciM61HH1k=;
        b=M0V+NWeKG7jqHIW9m2MnTRINebQuJRuOoHGYB+YYyuMsWx09pqDUMkKRQNwDORmh0R
         6xI/TRs/X6RebBtkKf+vvZCjncBEsIw2thbxWR0W+B1BaY4GMFgsjR4wIllWNpcwFPvD
         fW6qTSnmQ1TJQN2hWTZV0fzsDaHGEEtze93zIEvpME1NWbv9Q1uiTfZQCOQiFk2yi4Hs
         ea4R29kEcOHLLmDJgw+BYu5FmSb2MjZFkzEmn9h8VKWqIKFfb78hK3FcDsoNFo/J6bX8
         KrVneMplCJp+ZcY45kJuTDvzDcx2VjQ9Fl/TLPYX76Wjxd9yhpOZk+5artuZbh9Bo5T5
         H8Jg==
X-Gm-Message-State: AOJu0Yyk2TJZ31c1PrJvROIAgaB0YsU7fPjJKjmv4vQTCGkwpMHTpL+f
	SAXKGxsbBu3+uAP32Zy9W2e6ITvGjICgIHNgdTwtoF4zoC6IcqI1immWDjko
X-Gm-Gg: Acq92OE5/ka5qVOpA53+NE4EXKRymqHM3ZM6Y1je5LgLEcnH4Lfmj9zmpKAMrl2xooS
	IPpRy0WcEdiTZ4gLiMqHdQT/p0nUDY4t/JV2+r54SSYvC1telo19JuKnYA6tg+rglAESyGGZagY
	cN2mQQqDiPZ5QYZhXT9QUPnZ+gHBYq6kW9Sw3NxheqgPyTIu8I0qr4SFMhK/QOxZV/vbqcjJl7q
	ZeWAgchVfQRvYhnYWDwoizNMTkt3UH+VEDxGx1c4tSbZFOaILqQKsR7YQnozJ2BEwCct7pFkTx4
	h/QmS74c0EMlzqc5WDCkDOR9kumkJZiC8eEeeo/rSr8u90/VaZyf0Ts5jDjunbtKh+UZnGtqRqA
	D1W3ehtlfRqQ9v25W1b87mGMt83mlwuHdSDdmC0asoV6BqOMr5lnSCJhoS3NEwEgNE1FOaAxexu
	6bzFBnceIkDD5vE8etK1idtlaI97MRWL6RDf65z7ETlsAtdEwvgC+tx8haMlRny9DWiP3YXYE0d
	yVx95hTXAcGwmtqmpY=
X-Received: by 2002:a05:6a21:a03:b0:3b2:8677:813e with SMTP id adf61e73a8af0-3b427fc74c3mr13057370637.42.1780333039864;
        Mon, 01 Jun 2026 09:57:19 -0700 (PDT)
Received: from BLR1LPT000710.. ([2401:4900:1cc5:d90c:1d0e:e67f:fb95:f1c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85b8ceda40sm3431543a12.21.2026.06.01.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:57:19 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nikhil R <nikhilar2410@gmail.com>
Subject: [OE-core][master][PATCH] rsync: add ptest support
Date: Mon,  1 Jun 2026 16:56:58 +0000
Message-ID: <20260601165658.4086416-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 16:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237969

Package the upstream rsync testsuite and helper binaries
into rsync-ptest package and add a run-ptest wrapper for
executing the tests.

backup.test is skipped due to intermittent failures
observed on qemux86-64.
The issue has been reported upstream:

https://github.com/RsyncProject/rsync/issues/941

Tested on qemux86-64 using ptest-runner with all
executed tests passing.

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/rsync/files/run-ptest   | 17 +++++++
 meta/recipes-devtools/rsync/rsync_3.4.2.bb    | 45 ++++++++++++++++++-
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 50b6a8a41e..40af77a697 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -95,6 +95,7 @@ PTESTS_FAST = "\
     qemu \
     quilt \
     rpm-sequoia \
+    rsync \
     sed \
     slang \
     utfcpp \
diff --git a/meta/recipes-devtools/rsync/files/run-ptest b/meta/recipes-devtools/rsync/files/run-ptest
new file mode 100644
index 0000000000..762efd23a3
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+cd $(dirname $0)
+
+# backup.test intermittently fails on qemux86-64
+# (observed ~5 failures in 20 runs).
+# Upstream: https://github.com/RsyncProject/rsync/issues/941
+TESTS=$(cd testsuite && \
+    ls *.test | \
+    sed 's/\.test$//' | \
+    grep -v '^backup$')
+
+python3 runtests.py \
+    --rsync-bin=/usr/bin/rsync \
+    --tooldir=$(pwd) \
+    --srcdir=$(pwd) \
+    $TESTS
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 5fe1bc2c2b..86d414829b 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,12 +15,17 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
+RDEPENDS:${PN}-ptest += "\
+    python3-core \
+    bash \
+"
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
@@ -62,6 +67,44 @@ do_install:append() {
 	install -m 0644 ${UNPACKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
+# Avoid "make check" since it executes the testsuite during the build.
+# Only build the helper binaries required by the ptest package.
+do_compile_ptest() {
+    oe_runmake \
+        tls \
+        getgroups \
+        getfsdev \
+        testrun \
+        trimslash \
+        t_unsafe \
+        wildtest \
+        simdtest
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -d ${D}${PTEST_PATH}/support
+    cp -r ${S}/support/* ${D}${PTEST_PATH}/support/
+
+    # Several upstream tests access files directly from ${srcdir}
+    # (e.g. fuzzy.test, itemize.test, mkpath.test and wildmatch.test).
+    install -m 0644 ${S}/configure.ac ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/rsync.c ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/rsync.h ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/wildtest.txt ${D}${PTEST_PATH}/
+
+    install -m 0755 ${S}/runtests.py ${D}${PTEST_PATH}/
+    install -m 0644 ${B}/config.h ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/config.sub ${D}${PTEST_PATH}/
+
+    cp -r ${S}/testsuite ${D}${PTEST_PATH}/
+
+    for p in tls getgroups getfsdev testrun trimslash t_unsafe wildtest simdtest; do
+        install -m 0755 ${B}/$p ${D}${PTEST_PATH}/
+    done
+
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-12084] = "fixed-version: fixed since v3.4.0"
-- 
2.43.0


