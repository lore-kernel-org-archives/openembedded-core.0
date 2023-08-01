Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7035EC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 13:39:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.13085.1690897147232000520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 06:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BgrTMNlf;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686e29b058cso4091843b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690897146; x=1691501946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSIku8vPB2CzESi9ipkjHbry8ATYRO7Ktb0dOKcWTiQ=;
        b=BgrTMNlf4SNwqJnKGd21ewJxt54/kDtUiewj7ijwnaRa8O+RyePuU2Y3GaAh3v1tFw
         cLTq/PcQPyuWwV0O5bQE8pfRB5gFdgMAvBz3sky/7/AA9FJx7TZTc0HuVgIDTJXRQpQ8
         xf4dWcHj3yhNAIa0hFewTUScCa75r5SEAPWOsgmQjIUNvYXL/c21pdG4wNLxkSzYrPA1
         FZEpvBCvDnhKzeZ7WAas1Ic8yq4r73DWpWl2ItI6FkZXGWQAoBqV2wrHhaB1XHfrrGAg
         N06B+93DM8W7zr9/Z7n/J3R3fvHpVc11BzXEoXf07HzYogOcahBjTc8jYvVu6h6HiYUy
         W9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690897146; x=1691501946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSIku8vPB2CzESi9ipkjHbry8ATYRO7Ktb0dOKcWTiQ=;
        b=AsOEHCrll57zKBhh0c1UMO2UvbqGwjPZgj/rkuR4tb4iL7VgATBxMITNmhhQ2cu0Ki
         YrBF9PxcACQjPHWvbxCY5HI36HBmrPHrkbsHDTqx+xRJzJSCHv3HLHyurCwyNiTZ2J/u
         GjhWOew7f3Y2ynwqwIZVr3MawRkHG/n+LyVW1lIZG+v2t5dAvuyIg3n8+BLtdBFUptEI
         BMTWEnDf8UPJgdgh8L9wf4mdUO0vfAZAw8BMKWYi29RpahdsnOmihpZAJosaA9hL1ho1
         IDKg9Oc6f8NW3fcw4vwMLoVAQu4QBvV+4+9FCGqOjeDywvSCdLlE5mkaa26IJ54PcuDR
         OaEg==
X-Gm-Message-State: ABy/qLauUS7iz98lUUwUBZxgGYJxsPpr3UGV9QZCv3B4VWwIzNsEzLhz
	sz/i3k2Eqwwi/Xbe0HQp78nIo8ir/so=
X-Google-Smtp-Source: APBJJlFscv1GPOnj1E9sAw1QlLTbrDCJBJFPkRb160dVGe0uybHPZI83JX429uhX7y7egKGyzRAgxg==
X-Received: by 2002:a05:6a21:329c:b0:13e:99c0:fe7f with SMTP id yt28-20020a056a21329c00b0013e99c0fe7fmr1341131pzb.11.1690897146087;
        Tue, 01 Aug 2023 06:39:06 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.165])
        by smtp.gmail.com with ESMTPSA id t7-20020aa79387000000b00686b649cdd0sm9384949pfe.86.2023.08.01.06.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 06:39:05 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] alsa-lib: Add ptest
Date: Tue,  1 Aug 2023 19:08:33 +0530
Message-Id: <20230801133833.96667-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 13:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185246

From: Poonam Jadhav <poonam.jadhav@kpit.com>

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
 .../recipes-multimedia/alsa/alsa-lib_1.2.9.bb | 22 +++++++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 6250cf081e..99f09132ae 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl \
+    alsa-lib \
     apr-util \
     attr \
     babeltrace \
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
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
index d482e27683..8dcd7c4448 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
@@ -9,10 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://run-ptest \
+          "
 SRC_URI[sha256sum] = "dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
@@ -42,3 +44,19 @@ RREPLACES:alsa-conf = "alsa-conf-base"
 RCONFLICTS:alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile:append() {
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/config.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o config
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/control.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o control
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/client_event"_filter.c -I "${S}/include" -L "${B}/src/.libs/" -lasound -o client_event_filter
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/namehint.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o namehint
+    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/midi_event.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o midi_event
+}
+
+do_install_ptest:append() {
+    install -m 0755 "${B}/config" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/control" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/client_event_filter" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/midi_event" "${D}${PTEST_PATH}"
+    install -m 0755 "${B}/namehint" "${D}${PTEST_PATH}"
+}
-- 
2.25.1


