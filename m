Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C7DEB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 05:49:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.28089.1691387350807839934
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 22:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TEWhwreD;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6877eb31261so2899106b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691387350; x=1691992150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KX56169z0PGDlHWBaaNOjX9eOnqqzEF0ikKgYNySQR0=;
        b=TEWhwreDCi0svvHgFN4678FEXyeZjFrtmFk/1gmGxDXuz0TbkUdR02lCVkerhEF1y4
         VpAbkEOQvIy/VZFOHQKe2n7ryHWR6bkctK1VkUu0AbFGxwNGjH/WLTjsSfVJNtGo1R2x
         L18WMtaFbpM4Iw2a4nMk3DqKSsGf9TL25BYP4fjh0tRwgpcfGJGIYyYZRDb6LeH+t2Ui
         B5Uy+aPs3WAtSUWgvrHZLa5wZaGdkwplxd+O3/1e7ySYB3DWYQSQayw6raaktO63oJ7Z
         RG3cBv8Caof+p9FCiWX5Y/GWZaOZwPdLd+jeSUQBUjXuWG+rhKVo1SIAjyRcvG85ksNW
         xSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691387350; x=1691992150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KX56169z0PGDlHWBaaNOjX9eOnqqzEF0ikKgYNySQR0=;
        b=M1O4W5UfijqOVrZJnmlO7CDIVHUjh13kZq1QWqsYEzm4Bc4xQ0j7ipI2iL+D4yLJJv
         pnjRECDhtCUvn2Nz91534IVCWdyDVjKXe3osvQr8t2RED5DV5BC7XGhHUfYkIqxw115z
         yXRd0WeRh4psvN5n8Bx6icqrUot/cp34XtvjS/XQwmeAhJtz+h+sehoZ6uSymBfg21W8
         tkit1kSmk3ty4UNlL6Rbloq09eA7V/p4RcpUjqJnZyok+kxapLpiEWmjM0P9Lm7Lv2wa
         1HyPbKtDFsn2dQqcdXJTUvFLwyCyV0emRmj5OHxYdPK5mGfVaMAOc66zOaUB+47obiGZ
         VH6w==
X-Gm-Message-State: AOJu0YwbCCfmssT3BBn72iFzicB5PbCA98XITRLOVCpDjvRraOiQd8E3
	K5U6RA9DcIB1edcmo/f7/9/5BfvaLq0=
X-Google-Smtp-Source: AGHT+IFHSRysaHLN7WfUiJDRLmB5OazRYRklXV4eUWqkkAwAoq/4CI4Xvez3Gc5cF+gysMJBTNxTfg==
X-Received: by 2002:a05:6a00:1389:b0:687:b78f:463 with SMTP id t9-20020a056a00138900b00687b78f0463mr2123822pfg.34.1691387349760;
        Sun, 06 Aug 2023 22:49:09 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.181])
        by smtp.gmail.com with ESMTPSA id a12-20020a62bd0c000000b00686e00313easm5245768pff.157.2023.08.06.22.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 22:49:09 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <Poonam.Jadhav@kpit.com>
Subject: [OE-core][kirkstone][PATCH] alsa-lib: Add ptest
Date: Mon,  7 Aug 2023 11:18:58 +0530
Message-Id: <20230807054858.28804-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 05:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185582

From: Poonam Jadhav <Poonam.Jadhav@kpit.com>

Alsa-lib is a user space library that provides audio
and MIDI functionality apis for simplifying application
programming and provide higher level functionality

ptest executes below binaries on target:
1.config
2.control
3.client_event_filter
4.midi_event
5.namehint

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++
 .../alsa/alsa-lib_1.2.6.1.bb                  | 22 +++++++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..1a91880321 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl-ptest \
+    alsa-lib-ptest \
     apr-ptest \
     apr-util-ptest \
     attr-ptest \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
new file mode 100644
index 0000000000..8fbf9f140a
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+set -eux
+
+for t in config control midi_event client_event_filter client_event_filter
+do
+    if "./$t" > "alsa-lib_$t.log" 2>&1
+    then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+        cat "alsa-lib_$t.log"
+    fi
+    rm "alsa-lib_$t.log"
+done
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
index ca6bedae97..78e9c172f1 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
@@ -9,10 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://run-ptest \
+          "
 SRC_URI[sha256sum] = "ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
@@ -42,3 +44,19 @@ RREPLACES:alsa-conf = "alsa-conf-base"
 RCONFLICTS:alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile_append() {
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/config.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o config
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/control.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o control
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/client_event"_filter.c -I "${S}/include" -L "${B}/src/.libs/" -lasound -o client_event_filter
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/namehint.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o namehint
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/midi_event.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o midi_event
+}
+
+do_install_ptest_append() {
+    install -m 0755 "${B}/config" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/control" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/client_event_filter" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/midi_event" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/namehint" "${D}${PTEST_PATH}"
+}
-- 
2.25.1


