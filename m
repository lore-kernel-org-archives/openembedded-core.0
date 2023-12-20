Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92671C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:41:25 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.17037.1703058078121872962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EUlj/Tjl;
 spf=pass (domain: mvista.com, ip: 209.85.167.179, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ba40df6881so4046306b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703058076; x=1703662876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21euJ1ehQiJXiCndwQlk6/VYrHE+gUnkvKojSQKUZtw=;
        b=EUlj/TjlT0w02SWt6vhQnjpn9B+C1InU613hU8joHdtFuFzkt4H25Qv4omcnFaKlOa
         TYNiiObwiof+KxeCKlbzR+EN3ZGzn1pmhPbEqz8GuuxM1TPrDjHGls1pIvW6on2ixm2Z
         9sdf0P5wgrqEu/TCU0ioLjqRfCZ6nouXB3wJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703058076; x=1703662876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21euJ1ehQiJXiCndwQlk6/VYrHE+gUnkvKojSQKUZtw=;
        b=A6ZmdgKkMpjnWbMKHR0XrZhdOeQQUtZPFLzZaBzJPzorVaUUVfXyAUfSL7Y+ANAqtU
         fVDDlv7y0ri0sUsd5Vc2YlNegCN9KQxjFU3GNXnHN/AzTL9WwRKZYYnlp4wbkICCvqvg
         k4XqxkX8vQT/SJRBiI4rT/heVH3J60m+cwkwg+G0oXSTCJbBJOWakqSkdFOLwIajCLcj
         tAC6hcIdJBPhfPm+677mrh2q5X6YYs3R7hBlGqw2Awlzdl6hO1P41ahwKXdw3MzLQlC2
         xwUNCDCuXUby5Oc5+Po+1iSesKUNM7XDDMg5lSaFbHK4cQCGtfbYZAKZd83tGzInUdHw
         dDNg==
X-Gm-Message-State: AOJu0YzJ3WYWwVr4Xmr19Duzd2nhEH0CsY++mXMU/8FITbnl1R+C3zf9
	yZ8nqpN70Y7KnSzrfTksBkqUHciRTOzLAyGak8E=
X-Google-Smtp-Source: AGHT+IFNQJEXrfX67AsPtKzaYnyWrXWNY93sI0X0VHvQnvoAFisA6LJhKeNTKBiACuU7L5shN/WUNQ==
X-Received: by 2002:a05:6808:208a:b0:3b9:da28:feeb with SMTP id s10-20020a056808208a00b003b9da28feebmr23151016oiw.27.1703058076510;
        Tue, 19 Dec 2023 23:41:16 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006d9632b6195sm200759pfo.43.2023.12.19.23.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:41:16 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/4] libssh: upgrade 0.8.9 -> 0.10.4
Date: Wed, 20 Dec 2023 13:08:57 +0530
Message-Id: <20231220073900.96121-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192773

From: Vijay Anusuri <vanusuri@mvista.com>

ChangeLog:
https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

Drop CVE-2020-16135.patch

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=4b7e4341327e867208bfc3d8ba1954af66641e60

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2020-16135.patch        | 44 -------------------
 .../{libssh_0.8.9.bb => libssh_0.10.4.bb}     | 16 ++-----
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb => libssh_0.10.4.bb} (62%)

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
deleted file mode 100644
index 63b78688d..000000000
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Wed, 3 Jun 2020 10:04:09 +0200
-Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()
-
-Add a missing NULL check for the pointer returned by ssh_buffer_new() in
-sftpserver.c.
-
-Thanks to Ramin Farajpour Cami for spotting this.
-
-Fixes T232
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)
-
-Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/patch/?id=0a9268a60f2d3748ca69bde5651f20e72761058c]
-CVE: CVE-2020-16135
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/sftpserver.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/sftpserver.c b/src/sftpserver.c
-index 1717aa417..1af8a0e76 100644
---- a/src/sftpserver.c
-+++ b/src/sftpserver.c
-@@ -64,6 +64,12 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
- 
-   /* take a copy of the whole packet */
-   msg->complete_message = ssh_buffer_new();
-+  if (msg->complete_message == NULL) {
-+      ssh_set_error_oom(session);
-+      sftp_client_message_free(msg);
-+      return NULL;
-+  }
-+
-   ssh_buffer_add_data(msg->complete_message,
-                       ssh_buffer_get(payload),
-                       ssh_buffer_get_len(payload));
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
similarity index 62%
rename from meta-oe/recipes-support/libssh/libssh_0.8.9.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index 061f13912..3a57a728a 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
-           file://CVE-2020-16135.patch \
-          "
-SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10"
+SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
 
 S = "${WORKDIR}/git"
 
@@ -25,15 +23,7 @@ EXTRA_OECMAKE = " \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
-    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+    -DWITH_EXAMPLES=0 \
     "
 
-do_configure:prepend () {
-    # Disable building of examples
-    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
-        || bbfatal "Failed to disable examples"
-}
-
-TOOLCHAIN = "gcc"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


