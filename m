Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C589CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 22:18:44 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.5640.1712269117401770988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 15:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbcSFMlt;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7d0486cf91aso82007439f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712269116; x=1712873916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNm/NozS7Zm73/+LuRQmWrCYc7b3NFmEYpx3ccxOw7A=;
        b=YbcSFMltILw+JKWumJfBECC6+KMJU41IN4eoK9+0p71FQom5V7yeZxJtL47OWp3ZFT
         mLcBJwcVn6H3V+cKxLyZbDl+SEOVdGK5Kdug0HtJ0RQvi1O+2ZOlAz2hMDUKUj9lhFAY
         GeEK0q92YXIrpPlPMiKDXruJsUNfy5lMXUYMlmgnNTvCeQn2eEwnaB+cOV2e+8gxNFFp
         hnjtumKRIFqG/yLhD4eaKuiZYiEnJWmfCjZGpoJqzaSQC9HmL3kL8dz4sdKNWeV6ejH4
         piqCxi3TibVC0+wu+eL3LddgfI+pLzOWdDY/vcwNHL1gfcQYWrqkvGbMIyo9bnQHKftI
         DesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712269116; x=1712873916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNm/NozS7Zm73/+LuRQmWrCYc7b3NFmEYpx3ccxOw7A=;
        b=krGOm5rVq55xeD2elef8s5PePJuGuMDTNmeYdlHmp6k51HyDl2J+vIjp4V+Obz++wR
         bXx7xa+xqBQwqICP4Y2E7cuoO0g/0OsQPNHulL/RsBZP0XB7IxXDqf2+k7Gy6PqNsTj7
         k5Yw+g+pcn4jzzXBHIB0mKbRX03fQu35Srdn2L2ZvMnVb4Wgto6AK6BAANb5LSgSTexk
         gT4tZtMXObmUjOVhDDCKcByvAMA2yhVPcjzhajU7ALJOalCFFw0aPfeBAfVMnhtMscJE
         Bgng2g9hTfjERu4rtBxwUwFwSMZjx1LqeVk5z1rR++nRrN+2HIDXyvnAqIESh0G8ZN1y
         v7fw==
X-Gm-Message-State: AOJu0YxtgmUTVMVkyR8tGVBJy3gvoCTr2kamvbnxOm6crtABCfyM8+/j
	NBDLfJdanLkCK4QQzT9A0sp0vpPZsIQ1ZPmcWjVCKUKPA6SsZ+Ozb6cBwtBzvQI=
X-Google-Smtp-Source: AGHT+IGKXV/3PKIBqXnkQTWOGCQuE5b0Q2tr5a5cCDMRQCUTxPIGIKFkhSsQqv6KISjUAF6q0tSj6A==
X-Received: by 2002:a92:cdad:0:b0:368:a861:5a6b with SMTP id g13-20020a92cdad000000b00368a8615a6bmr721785ild.21.1712269116308;
        Thu, 04 Apr 2024 15:18:36 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id k11-20020a92c9cb000000b00369ffbc0176sm84928ilq.73.2024.04.04.15.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 15:18:35 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] shadow: install manpages
Date: Thu,  4 Apr 2024 16:18:23 -0600
Message-ID: <20240404221823.3671396-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 22:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197974

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Install the manpages for shadow, and also make the conflicting manpages
alternatives in util-linux.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 3 +++
 meta/recipes-extended/shadow/shadow.inc           | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 83b3f4e05b3..a3f9badbd97 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -282,8 +282,11 @@ blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1
 mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
 "
 ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
+ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'chfn-chsh', 'chfn.1 chsh.1', '', d)}"
 
 ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
+ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
+ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
 ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 40e6ab0b30e..0029d848bf1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -168,6 +168,10 @@ do_install:append:class-native() {
 SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
 INSANE_SKIP:${PN}:class-native = "already-stripped"
 
+do_install:append:class-target() {
+	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
+}
+
 PACKAGES =+ "${PN}-base"
 FILES:${PN}-base = "\
     ${base_bindir}/login.shadow \
@@ -193,6 +197,10 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1"
+ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
+ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
+
 ALTERNATIVE:${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-- 
2.41.0


