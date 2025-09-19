Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DF8CAC5AD
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:58:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.14331.1758282643005448173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 04:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuAgsgXG;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b5eee40cc0so20228751cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758282642; x=1758887442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8Z8TdFLkSAPYFglI4iO60g7cjZ02ky+SSX740vBgag=;
        b=fuAgsgXGJZfo8TcQixIxve40qPq/EtaO5Frotmd1JR36kRv79+QwwGkoreiRO2UUre
         drEnOWHNjqNLW40RJHvEY3i7xv3MF+QLUJRHJZksc4PFguOGqvtUHyFBea3kYmCKsxVB
         9aCP2ftWZv7Qp+Qk0y8GiPsHDNZmP8opUM+ryH4zbYRXSe0FC+PRZww2G7UutLv+z/ba
         RCG6wYtXoQF6B1Qr1GYfGheWVtFM581zEWDBUR2UZPG1EzWVmcdauX6b9vBG7HkusavC
         /jRhSxxZb8HQx5V9DL/bQp0h/e6LB2Xx1+/3EB04j6zRMFKlSUj6TNqskBK0UcO4RmR5
         zpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758282642; x=1758887442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Z8TdFLkSAPYFglI4iO60g7cjZ02ky+SSX740vBgag=;
        b=YBaqKRMT3lyukqeqxoGrYJFZGlySYsLk8f3B1g8wXxnOtPxaR8nQkwcHO8X5SWGXXt
         SYM9Ls+uRgVkb+nHC2T6i8ys1UqZByP4xYts6YlWstyULS/Mye+hzDfV468k0I4jwk2e
         DQkh6mQOJpuzssMLcbmvqBVtMpNqpBdJSOGxlQyZBL/oL68HXKThhrSoVrhe9YMlEkUr
         Pqk6dnWpex2PU8oAa9fYXBSTzEWxGYN0G/2K4mTesBSR2EB/YZwvne+P3DprSkitRHZr
         Liztt667NjwxF3znMpMRlh9bKwurADdx1cf7uU7eMyVfZ8OflTYtWBPTMf96P4vNV/US
         RXuA==
X-Gm-Message-State: AOJu0YzirwKNcG39tcOLwDc51pm4kjp/sEqt/kfseLtweHTxTzBQ53VN
	zwQRpex6m+p5R2jLeVtx2VhI0vfseprhVcLzlsskqAE2Hc2SzRSHnVBfpP31RQ==
X-Gm-Gg: ASbGncszepaNw4mevpPBRrEfyGIgT1Q122RzF3d4PyeZdqusYA1RjPIbM48NmUwDepL
	/q1f9aGUWDmN5phhLHVoE3u/hl9ScOzt3GFmpfBlqamN+nJSPusTxvB+hDTdY3eVm7LRn+1ChnJ
	tgTStszPtQhcQJ7siJ33vac9nsun9kNEu0cZOuXFn7uL0DzV40E2y9NLAYYIauu4OUHd4w3Q7tf
	tDg6YtS5ML700lsHx1xGHnQVCby95beS6OkVDHNZ1xfU4p7YZfKjrGqBBFB+KMHprLAJVzpTR1o
	HIq4cUP4Fq7iNbD+JTXsW7gaf7rBNs9aMTzVmKy0zNUpTHoUN/56pOj8vguN2TILatOjiH2sv3G
	WeuhP6s0SMacvScxAdWxG05xM6cbtt1u0TW0TkIo=
X-Google-Smtp-Source: AGHT+IExZhbw5k+MC9D/mF3gObjLvV27mUBnn3r9mItbft1HYyMxSrYe4o7WxOAKCAEbtYPDQkorow==
X-Received: by 2002:a17:902:fc46:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-269ba534c77mr36525355ad.29.1758282247307;
        Fri, 19 Sep 2025 04:44:07 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm51385145ad.131.2025.09.19.04.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:44:07 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra.Thakur@kpit.com
Subject: [scarthgap][PATCH] libmd: add ptest for 'libmd'
Date: Fri, 19 Sep 2025 17:13:32 +0530
Message-Id: <20250919114332.1505081-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223770

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
index dc588a0f95..68a2ec7a16 100644
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
+            libtool --mode=install install "$bin" ${D}${PTEST_PATH}/test/$(basename "$bin")
+        fi
+    done
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


