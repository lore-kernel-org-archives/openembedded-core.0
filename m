Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B6EC7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:33 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3571.1684914781873941301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JqSxSG1b;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-510db954476so1233071a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914809; x=1687506809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSQF0qAeqcU3t4qUzbAtPN7anJ/TS4lvQG+LiQfI6bg=;
        b=JqSxSG1bv5jJ3bU+O/vHJRXNPyj/yfMw1xR+52U3YpFh0N3OHtDkT8GTfPBHLLr1zV
         f2n3dDOkC8xhf/FngZcDxvj2JpbCJBE61UNW9flERXhSZCymY1wfzLSXY/GI1QcJSMPh
         lZMfY8o+2QlQSzAspqpfTNb1PplAntyZjCqXqPfWc/5b1qgIdrYRUM8wB0DGzqt/EGbt
         0yrZo1vDl2Sw3PFsdGnCSpB55/SevPD/CSFoxY4vNzRlURmcNiyoab6A7318e2Nn3VXz
         Wgdt+XEAkmyGLYIUukyxoeskpy3PblmLIk66WstdVInQIP+qrKXetIy4KKcfMDkfH8YF
         5nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914809; x=1687506809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSQF0qAeqcU3t4qUzbAtPN7anJ/TS4lvQG+LiQfI6bg=;
        b=XQq4GLRC4mHErbERDV1tQq3zFGOirWlIrrJWQOvd+4beQfC1AxNB+ln1QtcQXSVwKV
         nnd7ZyjKIst9h2sRYdFIroRWEXPMcBJYAZbv6jo91QEmY44NQor9CE8liz1htOWWX79v
         il4sYHTmPanyyKai+8tvGub6rA97awMhfQfYl8ZO4wWB1pwEQf9p44HY+tUZT40pLAsO
         AOksfUXTR802lLHM/MEzL4XgU+yJ9iX/ctPJadoOFKeiYoMxdDYtpfBPS7s1jqV+njum
         kuO1itV1ohvErUxyuNkrlbjEZxuEgKf0J3MhwRRFLa9UZLWbnE4qh0GfFpopAVi3oXxT
         Howg==
X-Gm-Message-State: AC+VfDyzJMtmo3CPgW7LVOMxQgb9HA0nhQ928lSHdxZ1XRMD0m/oyBN7
	cuBbZ+TM9ltmQyXwVGtXviY5x4+8S7Y=
X-Google-Smtp-Source: ACHHUZ6Zx6A2U7zW7Kb6BBWD/MCCuN3+gk50uixuGiZhR5rxoJWksK+jkiCZSSug7dsq66TBP+GZRg==
X-Received: by 2002:a17:907:36c7:b0:96b:559d:ff19 with SMTP id bj7-20020a17090736c700b0096b559dff19mr15186317ejc.21.1684914808873;
        Wed, 24 May 2023 00:53:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b9-20020a170906490900b0093313f4fc3csm5461634ejq.70.2023.05.24.00.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 4/6] inetutils: remove unused patch files
Date: Wed, 24 May 2023 09:53:18 +0200
Message-Id: <20230524075320.1086358-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181663

* they were removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=a21e8fdf1b66961ddae5929d393daa08800bb748

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.40.1


