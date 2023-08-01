Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D790EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:25:49 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.9454.1690885543829147809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=r65OAp5f;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ppjadhav456@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-349099fce6dso20008525ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690885543; x=1691490343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHp1GDwhoqc995CFaEJVI8DPDx5XjpxkTPsuvr6jfRs=;
        b=r65OAp5f4F6fMQJWx8Rsy5nEN8UyK/q+6oq00N2nQxf8FXJ3ZfMeg9/LPJv1RojSd0
         TILe0yagmwVAVC5m3EcyUoldtH01JhEHB2FOj28SM5zJC117dJZHcf3ohkM3N+SJCoZT
         8icueNb8gd5eXu7/bkHj7I4w2v1tesEJBxMoEHKklRDuaCNg1i8Tbbr/bFXKvfcbtQ3A
         kVaKj7CeEdpFTR9x0Z4qX6IDV9UyuJOmfkHXYB40JxGbsB/ITizxmg+PFNJhloZbNbf/
         7qqBeP6uae2U4+gBPTIEd06v19t7ca9BP408Pm174e1rbZaRXjXaTnfhuTtB7XKJvPvx
         iAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690885543; x=1691490343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHp1GDwhoqc995CFaEJVI8DPDx5XjpxkTPsuvr6jfRs=;
        b=N1LzbwodCrjqy4frAeeQpF2KJ5lg3S5iLuLrHkeksaRuvknjU16SfeH2hmxAKpP/XX
         9f+NxBTJHz00SK11xeaspUE24P+yw9EHPwCqqUQ9EJp7RmKmCDFa4niJYSlldkmeoUOr
         w13M/uutV+6PEE/v2JjllLVyu3Vxru31bShznkknpPLVlHmeG8EvlozwrOByaS0bh3Nc
         U5ZdJTOUmfi8I35bwJLgcSvAg+3TaWeW/rxIgZualjbDSDMoFV9JJXTSVTXsZa65ZojQ
         l2wFJ88GDMebXKvm3XKUuooVo2LqhYuUjWZgQb/IM4T/OPlQw6DO3jikiBpQ7unI7ZZE
         9cbw==
X-Gm-Message-State: ABy/qLY8u3degS6zEnTAKnAhUguZ5REzI9fC/R25ORImiOlolRiKqN0J
	Nz30ZT/4Py+Ciz0AGnYuKFKnt3BbtUM=
X-Google-Smtp-Source: APBJJlH002hmtxKxpKeJzh9QmF8oGZRsYodYV4oN6TOOtPhilO2G4Ysxy/+yhKR8VD21oprU8sTK+w==
X-Received: by 2002:a05:6e02:170e:b0:345:af82:dc3a with SMTP id u14-20020a056e02170e00b00345af82dc3amr13406784ill.14.1690885542679;
        Tue, 01 Aug 2023 03:25:42 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.165])
        by smtp.gmail.com with ESMTPSA id gw6-20020a17090b0a4600b00262d079720bsm9091777pjb.29.2023.08.01.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 03:25:42 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <Poonam.Jadhav@kpit.com>
Subject: [OE-core][dunfell][PATCH] alsa-lib: Add ptest
Date: Tue,  1 Aug 2023 15:55:34 +0530
Message-Id: <20230801102534.60770-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185236

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
 .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++++
 .../alsa/alsa-lib_1.2.1.2.bb                  | 19 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3fb7ec2657..b74e18a322 100644
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
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
index 4867c798b9..192e35ba3a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
@@ -18,11 +18,12 @@ SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://0005-ucm-Do-not-fail-to-parse-configs-on-cards-with-an-em.patch \
            file://0001-Fix-alsa-sound-.h-for-external-programs.patch \
            file://0001-uapi-Move-typedefs-from-uapi-to-sound.patch \
+           file://run-ptest \
            "
 SRC_URI[md5sum] = "82ddd3698469beec147e4f4a67134ea0"
 SRC_URI[sha256sum] = "958e260e3673f1f6ff6b2d2c0df3fc2e469bea5b2957163ce96ce17f23e87943"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
@@ -52,3 +53,19 @@ RREPLACES_alsa-conf = "alsa-conf-base"
 RCONFLICTS_alsa-conf = "alsa-conf-base"
 
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


