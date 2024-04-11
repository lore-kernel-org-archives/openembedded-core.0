Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6756DC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 22:36:49 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.33543.1712875001862754590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 15:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RdR/NQ+w;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-36a186af3a9so1636195ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712875001; x=1713479801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ON9lt/kK7B3yzf4+IGKyto55qR2BLldOC+WQFaue6es=;
        b=RdR/NQ+wC3W/zdRbtYS3xqYfB048Euii3Tb9Z28eT2VTonWxYjNMRoUxzerGQPLJzn
         3sE/qn0u8i1pxlmL639bA4vzXaq+t+BOg50cSCsyH5I2qjLwzShWNQBfbogpc3u7AqM3
         yeiK8dm96Wi6YzRO7y+Z47QLCHBTp0cvzSYuz0FY3REiuMx3SJdyOTEuqx5XF+CKA1S0
         YcksNhmE75SDpm9eNYPYzGrXjDWa3d/yCX9s5ktDhOkZ2ZUXSwY6/vXYhskzXvytLqro
         LLJDkG2/MyUtj2VKPsePgJx9nDPWXFTA8b5q+TzM3ZjBKwKZC3PBVodYAJg//r/KtBqt
         bELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712875001; x=1713479801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ON9lt/kK7B3yzf4+IGKyto55qR2BLldOC+WQFaue6es=;
        b=VKvJUHIxntGgC4yrQDK3ZI16Hcj0zeKU3BAZyrnVtj2m3slXQ77hJPEbSuzFi16Ek9
         cccNuJTs1bwMaN4uL0jq0BT27DXvfLQYHJ1NEZx39jGpFpvz79zX7TquO6kE9+ja8Ge7
         HXSS8bp4VpTojsRyj6N2Rtvv9V4fY9T/FYCMd3UxpvmfL6uSMSctXGYK59m+AqHbE0C6
         FetMTgy3BQoMIWUjdTIrBwImEBKwF3WcG/nvBjxzpP6wvF8y81X82G9ZzZ40NPT97+t2
         9CXM1+lYEBvKyhoAQY/IS7oAC/R5pjIQYEZzSa9uXdEJl1cz1MkfqYHd/zDjm41IjnjD
         u/3A==
X-Gm-Message-State: AOJu0Yx2TtnVgowitvd5Uy8oEuclwpG2WG/xmdiN6VvjCw6vUAxbUtxa
	l5fOPNZI0AzyHBUujL5niU5Tnirf/tJ5Z0lhjLpFVYV/CxhHaZSylsmxAPTr
X-Google-Smtp-Source: AGHT+IGZImYW490uQ+4d7HQ4IR/WAgx4Ko8F/K8xX2/JTGju6YOGcCAxZnnQxtSau9iZ70r+W6koqg==
X-Received: by 2002:a05:6602:3885:b0:7d5:e491:56be with SMTP id br5-20020a056602388500b007d5e49156bemr1228725iob.16.1712875000841;
        Thu, 11 Apr 2024 15:36:40 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id u5-20020a056638304500b00482be60fc20sm653102jak.94.2024.04.11.15.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 15:36:40 -0700 (PDT)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v2] shadow: install manpages
Date: Thu, 11 Apr 2024 16:36:13 -0600
Message-ID: <20240411223613.2051618-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 22:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198147

Install the manpages for shadow, and also make the conflicting manpages
alternatives in util-linux.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb |  3 +++
 meta/recipes-extended/shadow/shadow.inc           | 12 ++++++++++++
 2 files changed, 15 insertions(+)

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
index 40e6ab0b30e..a290dfc046e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -168,6 +168,14 @@ do_install:append:class-native() {
 SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
 INSANE_SKIP:${PN}:class-native = "already-stripped"
 
+do_install:append:class-nativesdk() {
+	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
+}
+
+do_install:append:class-target() {
+	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
+}
+
 PACKAGES =+ "${PN}-base"
 FILES:${PN}-base = "\
     ${base_bindir}/login.shadow \
@@ -193,6 +201,10 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
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


