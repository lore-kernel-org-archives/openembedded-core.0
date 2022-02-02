Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B93C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:15 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.2290.1643826494075136021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pxUR1Zrz;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k25so252950ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p+3wY2xZGcC/mj6wEwfrI2whSezoSgRnaqLjzBgMKN0=;
        b=pxUR1ZrzS9JWQ7E+4jxmVN0DhVsNAMz30w+YtQB+v2GqlpcSgnHCollQ0pzvH1sC2w
         MQAnLVp61yYGn8t4tyNXBv33+RguhvHd7KoupE/BRfw0DJmvcXMIdrrS8gh2j/aFB+Dv
         UJYLdAoMr0+spQxoXKRtC5lDe7PsAAbgNtAAtC9xSZbp6GtuDJjy6zbuXRpo+yEdIqzO
         rLbc7CfxwpNrX6XGOYzfYy4k6Q7erijP8dMAeI1jwBtUueiuiRDbtfDrUAYRkvUUBa0F
         W/TF/tvWOwMtq4ZrdubMu6qFZbGPh7tV9AS+ieD9M8QervTYk2DW7gbmEOBxdtUspu7g
         FQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+3wY2xZGcC/mj6wEwfrI2whSezoSgRnaqLjzBgMKN0=;
        b=0XxFhePcezGnZCZg0kYMyFhO3IKJCwXkjJ5EOSNar04O0cH93b8xHsBT+ypsvlq3Ko
         8rCKCZ1VHcWFokDY5IFBEjmdJW/A6p0drenVt4/CC/B6FBm/IP3VnwSUsvYxKqpNGiPT
         ahu2+liU07F2xeL6BUQrP+2fPbTXFMW92XCnGXL8B/ZT3wRH/YYakJ1CMlrJVXL/Gxmi
         xYuTazxeEKoCFbtAfJv6thoMu13ELYkdJ6HLpWaxdZLLZdh6w/asP4//BL+BguZMheYq
         d9uMNY1Yi66Dz4F55ch1yZZJgqlvefyBwJkLjLZUeRblViJFfVjEsh6L2QkmW1knB+tE
         hlCw==
X-Gm-Message-State: AOAM530SRHFAPLfZPUvoVK6j5Ro5IcP4yggL/rgg8vALUCoSIaU9JS6U
	vjOJ3MSfKigP6ie0dQKMIjHZM969Tks=
X-Google-Smtp-Source: 
 ABdhPJx4E/2plkJNrpSbK3KMqJwli41o3tylcuDc54gq7zJlGG8Hf2tlMwxncLMUjec7g8hhdb7PQg==
X-Received: by 2002:a17:906:30c9:: with SMTP id
 b9mr26812687ejb.377.1643826492533;
        Wed, 02 Feb 2022 10:28:12 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Scott Garman <scott.a.garman@intel.com>,
	Chen Qi <Qi.Chen@windriver.com>
Subject: [PATCH 11/33] at: update 3.2.2 -> 3.2.4
Date: Wed,  2 Feb 2022 19:27:36 +0100
Message-Id: <20220202182758.919991-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161236

Drop patch for issue fixed upstream.

Change additional source copying to be a part of do_configure
to allow automated upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../at/at/fix_parallel_build_error.patch      | 37 -------------------
 .../at/{at_3.2.2.bb => at_3.2.4.bb}           | 24 ++++++------
 2 files changed, 11 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-extended/at/at/fix_parallel_build_error.patch
 rename meta/recipes-extended/at/{at_3.2.2.bb => at_3.2.4.bb} (81%)

diff --git a/meta/recipes-extended/at/at/fix_parallel_build_error.patch b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
deleted file mode 100644
index e4f32b82b6..0000000000
--- a/meta/recipes-extended/at/at/fix_parallel_build_error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 24ef2a6544f9c7ec01bc7ae73dffa2974a1e251d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 5 Dec 2018 09:46:22 +0800
-Subject: [PATCH] fix parallel build error
-
-make -j was failing sometimesa like this
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/home/nitin/build/build0/tmp/sysroots/i586-poky-linux -I. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -o atd atd.o daemon.o  -lfl  -lpam -Wl,-O1 -Wl,--as-needed
-| parsetime.l:5:19: fatal error: y.tab.h: No such file or directory
-| compilation terminated.
-| make: *** [lex.yy.o] Error 1
-| make: *** Waiting for unfinished jobs....
-
-Fixed the issue by adding a dependency in the makefile.
-Nitin <nitin.a.kamble@intel.com>
-2010/09/02
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.in | 2 ++
- 1 file changed, 2 insertions(+)
-
-Index: at-3.2.1/Makefile.in
-===================================================================
---- at-3.2.1.orig/Makefile.in
-+++ at-3.2.1/Makefile.in
-@@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
- lex.yy.c: parsetime.l
- 	$(LEX) -i parsetime.l
- 
-+parsetime.l: y.tab.h
-+
- atd.service: atd.service.in
- 	cat $< | sed -e 's![@]sbindir[@]!$(sbindir)!g' | sed -e 's![@]atjobdir[@]!$(atjobdir)!g' > $@
- 
diff --git a/meta/recipes-extended/at/at_3.2.2.bb b/meta/recipes-extended/at/at_3.2.4.bb
similarity index 81%
rename from meta/recipes-extended/at/at_3.2.2.bb
rename to meta/recipes-extended/at/at_3.2.4.bb
index 14b9dace2a..af8c3d6b4c 100644
--- a/meta/recipes-extended/at/at_3.2.2.bb
+++ b/meta/recipes-extended/at/at_3.2.4.bb
@@ -23,21 +23,20 @@ RCONFLICTS:${PN} = "atd"
 RREPLACES:${PN} = "atd"
 
 SRC_URI = "http://software.calhariz.com/at/${BPN}_${PV}.orig.tar.gz \
-    file://fix_parallel_build_error.patch \
-    file://posixtm.c \
-    file://posixtm.h \
-    file://file_replacement_with_gplv2.patch \
-    file://atd.init \
-    file://atd.service \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-    file://makefile-fix-parallel.patch \
-    file://0001-remove-glibc-assumption.patch \
-    "
+           file://posixtm.c \
+           file://posixtm.h \
+           file://file_replacement_with_gplv2.patch \
+           file://atd.init \
+           file://atd.service \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://makefile-fix-parallel.patch \
+           file://0001-remove-glibc-assumption.patch \
+           "
 
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[sha256sum] = "2211da14914fde1f9cc83592838fb6385a32fb11fcecb7816c77700df6559088"
+SRC_URI[sha256sum] = "76990cbb6f4b9bfedb926637904fdcc0d4fa20b6596b9c932117a49a0624c684"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
@@ -53,10 +52,9 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "atd.service"
 
-copy_sources() {
+do_configure:prepend() {
 	cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
-do_patch[postfuncs] += "copy_sources"
 
 do_install () {
 	oe_runmake -e "IROOT=${D}" install
-- 
2.20.1


