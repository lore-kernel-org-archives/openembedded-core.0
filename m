Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 31CE277BDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 15:51:10 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id q85so3612660pfq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=076ljz1RdSuvdJDDKxb1LxClfvKziqxdcS5IEgbr/Gc=;
	b=F4Yf9dbq/dx8iVMHDttBhp8pWuLWQNcYJxCstxiRm37BI2GjJK9lPGJsM8lzm3c5mw
	R2gQ2x8tqiXmsSPHzqhmk6nlcmlYxzqS8gldLaKfCzYTVmcnBJv2r8vBY6XO/3/D1zMb
	CioV7Bqw247eHDoo7INrK45ObuCb6AvBqIcFrm3pqC8nkF1iiurwJ/AaV9DyWRujwFqz
	ZQB4in2qcsrjieUbgQSRjYc4/aZiOKTgAVhkpA6G98aGUjQ7DVoEmelF2JTPqug9VORC
	2ehAnDvrCVlJ0ZsznV7yAwT5bhVikno4wVMJht5EDSvlVBtcll+18E938ZY+3AQunWXh
	3M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=076ljz1RdSuvdJDDKxb1LxClfvKziqxdcS5IEgbr/Gc=;
	b=fOHbJnMquZvtm8J6omoVrG0cnySiZrmIAR/VfaqbeleziYzlwJXg53GzR/gffOEWS7
	YB3s23KyDHvKjWynvCTqJ4n8zvVdDxh/gzA56eX92msiBv8K3znO3RYECq549MS/T3hP
	hSgntSVefgQWsB+9gtXU7iDWsMQ47HAT9YApRVJoyBdqUPVfKbT6f3zqnFmMP0mMHINY
	0dwmDsc8ki5rCVAATzstsUOTjHqRTjVgcBbSNh8KwMkatfM+uTrGbEYiHmXlXAQ9Hoq9
	XUvgg8w99akzPi0X8TjPYB2i20fALURCPiLSu4nlcLXXTK7kInqOcIELX78FQH3Mv5KK
	MWMw==
X-Gm-Message-State: AIVw110iHyfY0hmkJkwsBBla9QIJeVYyNmhE5yP77n+FKuEthCO9WRQZ
	ft8FeFyGchFZp2Cx
X-Received: by 10.84.216.28 with SMTP id m28mr16990464pli.275.1499183471857;
	Tue, 04 Jul 2017 08:51:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r63sm36545914pgr.65.2017.07.04.08.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 08:51:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jul 2017 08:50:54 -0700
Message-Id: <20170704155056.12467-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 1/3] systemd: Do not use xlocale.h
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
X-List-Received-Date: Tue, 04 Jul 2017 15:51:11 -0000

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


