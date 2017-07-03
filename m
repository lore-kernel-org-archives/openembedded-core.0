Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5D05B6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 15:59:39 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id j186so97101976pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=076ljz1RdSuvdJDDKxb1LxClfvKziqxdcS5IEgbr/Gc=;
	b=jebctts7ovtQL6Jk0ICnSgMGrA8GxIUOlgL530SmSjAD4M7beLc4YmolRgJnFi/NAH
	cvWa04LH6Xa9saCAQg8nKQX356cxXYk7lv3n1+QGkyOf7XlqIeoDsBvoSuQ1IYghnjaH
	Rskf74mZjUk1mZ1AOHDYG7dgNtjD8q2unJXwa3jufgMNlCeuda+SXyabxTTS3fucVXwd
	yFXJkcK3Aykhgi61r+M2TuCb0Oht3k6q+ANkebje7AqGmwlNWtnjtHM1Pr4+zBGf6FMB
	cL8snz2DVjMks8fR2De3/vD5/9mUzn/th22pkh1GvCtMnhNGN01lKUYcGFXTyVyECQ0c
	i4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=076ljz1RdSuvdJDDKxb1LxClfvKziqxdcS5IEgbr/Gc=;
	b=qjZgIFcqOiPmHSMoojuyiOKDc+wYu7BQ2KTrJ43/7SP9SiwGK1RN8E6JdkefDtSaEj
	Nv2d9szK/kH409TWGBOxX1L+tRsbw9q7/TzHkMwRtNrWSgFxa7OCZSBqiPNnbOYiKfh0
	ujLTH7PsgmeZdciFr9F57YbtAETc5WauLbYVwl75JJ363n0P/YNT51mK4ckBFUF2ld6q
	qyJ+7ckJy5miCZZnHSdTg8HRuoAYzsPLarC1SNwL7WS80fNqHg8JapOzNbgo1NhmcSNJ
	bFvVSgk66tHORRihUUAxixdFfpaiu2pksnkC9veCTZS1iokQOkvBer0zsFsEhtK8e6G9
	hBDw==
X-Gm-Message-State: AIVw110LgSxr5uz5KT0Lpys/fF/v83t/f5vikN6pA9+FbRRwrS4n5kdd
	iKiKc0Zh3oziqXMS
X-Received: by 10.99.132.198 with SMTP id k189mr11277960pgd.233.1499097579986; 
	Mon, 03 Jul 2017 08:59:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	l4sm32369249pgr.21.2017.07.03.08.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 08:59:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 08:59:27 -0700
Message-Id: <20170703155927.888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] systemd: Do not use xlocale.h
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
X-List-Received-Date: Mon, 03 Jul 2017 15:59:39 -0000

glibc specific header which has been removed from glibc 2.26+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-util-Do-not-include-unneeded-xlocale.h.patch | 27 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_232.bb           |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch b/meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
new file mode 100644
index 0000000000..cad1867a4c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
@@ -0,0 +1,27 @@
+From 0c50b8332092178378257c2de800fb6b6b4a8706 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 3 Jul 2017 08:45:04 -0700
+Subject: [PATCH] parse-util: Do not include unneeded xlocale.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport [ partial https://github.com/systemd/systemd/commit/284d1cd0a12cad96a5ea61d1afb0dd677dbd147e]
+
+ src/basic/parse-util.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index c98815b9b..a0eb45805 100644
+--- a/src/basic/parse-util.c
++++ b/src/basic/parse-util.c
+@@ -23,7 +23,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <xlocale.h>
+ 
+ #include "alloc-util.h"
+ #include "extract-word.h"
+-- 
+2.13.2
+
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index d54e92707f..287e07b153 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -31,7 +31,8 @@ SRC_URI += " \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch \
            file://0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch \
-"
+           file://0022-parse-util-Do-not-include-unneeded-xlocale.h.patch \
+           "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 PACKAGECONFIG ??= "xz \
-- 
2.13.2


