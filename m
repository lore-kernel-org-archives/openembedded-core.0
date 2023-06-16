Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE398EB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:48 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.267.1686926262735709866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=suN7GGmk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b4fef08cfdso5339845ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926262; x=1689518262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VwJUJF1gJNTSrU37rM1PJ7UqD+LCMc2NfovplALqO8=;
        b=suN7GGmk+sC0jBzmKuFlRs16LlZ2opti/3O7g4HZGksxzK7fIgmLnO2PypVQ7yrq8/
         9HFHQo/gH3GeKDsD/enR4mJ+M6B+C+THCBOuz3xxmgukJI5ZY2yc3aifIYaXn/7McZ55
         tq5Wzko80rCWsmAvgP0NtDaqLDDYg0BBcAV6k+teRRTnVg14CmefPbTUYGNruQgNhWVI
         VdlBhSet1n0euCpQuTyGZqgrgJYsDqRk21rn49+wuD6WX6SGbq/4/Fq5es5VrnAcGF7/
         4AbQrV4uQg4jfo8ZW01BB2aRnz5fZq5yUhFMipmDBAr4GZa0P8xBG52+qcTu5XTTzPPn
         uLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926262; x=1689518262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VwJUJF1gJNTSrU37rM1PJ7UqD+LCMc2NfovplALqO8=;
        b=W+632flWSYcCRlXPNSaCdFjjhbXmPUTI8NPrAlSmelCmbqLu2pwmuysqnD/CUKLdTZ
         RLgd1zxrtSTbEVsUI3TbmSgdeXJd72FhGOAXTy2vFw2/YctLJBtht0DBun9Bbvw0jrCI
         wLP8QJovSwQnsBd+MEGC/xSeWPYz2o3eL5TNr1b1EZPD/Wehz3WSLclgG2RCDP5ABJ3T
         hV+KF1nFTym6Zf+dQxWHMQu+Emn0+dqxidV6c0VnSwn2yunm258S3HGPqfAihEk6Atxe
         FFgtsfYCGGGB0H/THZYDfTmbUjdNA2MFeTh+gcleIwqREu7nciBCLSsnetjaQspchwHi
         yckQ==
X-Gm-Message-State: AC+VfDwpNH1TTIUcs0ak1coH9DSFfYkC3txMcniPrQCJrqSom36dMe6t
	BJk6azh+lbVvyNL/WO3C0aIAWUmrF5ayZIzP6Ig=
X-Google-Smtp-Source: ACHHUZ5BhX6++LZsLl3ZY05wDDII/NMbV1HK5ihb93/9RGvcmj4KiXQxHJCG+4etNOd2WK7U8vvgyQ==
X-Received: by 2002:a17:903:190:b0:1b1:9968:53be with SMTP id z16-20020a170903019000b001b1996853bemr1834715plg.64.1686926261701;
        Fri, 16 Jun 2023 07:37:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/24] inetutils: remove unused patch files
Date: Fri, 16 Jun 2023 04:37:03 -1000
Message-Id: <de86594c102e04aa55208b39d63c0593ade14b7c.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183033

From: Martin Jansa <Martin.Jansa@gmail.com>

* they were removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=a21e8fdf1b66961ddae5929d393daa08800bb748

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2030f2a651920435787b4a580dd18894c1bc02c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-multiple-definitions-of-errcatch-an.patch | 58 -------------------
 .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 --------
 2 files changed, 83 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch
deleted file mode 100644
index 49d319f59d..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 7d39930468e272c740b0eed3c7e5b7fb3abf29e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Aug 2020 10:36:22 -0700
-Subject: [PATCH] ftpd,telnetd: Fix multiple definitions of errcatch and not42
-
-This helps fix build failures when -fno-common option is used
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ftpd/extern.h     | 2 +-
- ftpd/ftpcmd.c     | 1 +
- telnetd/utility.c | 2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/ftpd/extern.h b/ftpd/extern.h
-index ab33cf3..91dbbee 100644
---- a/ftpd/extern.h
-+++ b/ftpd/extern.h
-@@ -90,7 +90,7 @@ extern void user (const char *);
- extern char *sgetsave (const char *);
- 
- /* Exported from ftpd.c.  */
--jmp_buf errcatch;
-+extern jmp_buf errcatch;
- extern struct sockaddr_storage data_dest;
- extern socklen_t data_dest_len;
- extern struct sockaddr_storage his_addr;
-diff --git a/ftpd/ftpcmd.c b/ftpd/ftpcmd.c
-index beb1f06..d272e9d 100644
---- a/ftpd/ftpcmd.c
-+++ b/ftpd/ftpcmd.c
-@@ -106,6 +106,7 @@
- #endif
- 
- off_t restart_point;
-+jmp_buf errcatch;
- 
- static char cbuf[512];           /* Command Buffer.  */
- static char *fromname;
-diff --git a/telnetd/utility.c b/telnetd/utility.c
-index e7ffb8e..46bf91e 100644
---- a/telnetd/utility.c
-+++ b/telnetd/utility.c
-@@ -63,7 +63,7 @@ static int ncc;
- static char ptyibuf[BUFSIZ], *ptyip;
- static int pcc;
- 
--int not42;
-+extern int not42;
- 
- static int
- readstream (int p, char *ibuf, int bufsize)
--- 
-2.28.0
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
deleted file mode 100644
index a91913cb51..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-tftpd: Fix abort on error path
-
-When trying to fetch a non existent file, the app crashes with:
-
-*** buffer overflow detected ***: 
-Aborted
-
-
-Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
-Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
-diff --git a/src/tftpd.c b/src/tftpd.c
-index 56002a0..144012f 100644
---- a/src/tftpd.c
-+++ b/src/tftpd.c
-@@ -864,9 +864,8 @@ nak (int error)
-       pe->e_msg = strerror (error - 100);
-       tp->th_code = EUNDEF;	/* set 'undef' errorcode */
-     }
--  strcpy (tp->th_msg, pe->e_msg);
-   length = strlen (pe->e_msg);
--  tp->th_msg[length] = '\0';
-+  memcpy(tp->th_msg, pe->e_msg, length + 1);
-   length += 5;
-   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
-     syslog (LOG_ERR, "nak: %m\n");
-- 
2.34.1


