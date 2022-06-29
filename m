Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0890C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 10:57:43 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.10138.1656500255354330649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 03:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AbEzgaAW;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id v126so10799001pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 03:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xCzWuSZPyqTcJZ34KYoCD+of4IsT5Z1MHkdQ0MohA/M=;
        b=AbEzgaAWBkyLFHWzxr50Q0O9OcsNsrMVV75Tvxp/0mc40Wl/ReiGEgo/c/7P6y1RmO
         X7SK4R2qUAwbUGCmpdvfsYHe8mKyuDW0rGttBZxThCQ1fZT7oDiYckgd5TjAbc7RdkOr
         yWigCs0hm7tadFh3SzMa+YTYCEoLik8+aqPVzQITtc7YST5WerBaawUkuoHBKLZtULfx
         uKoOJYVBG+YBjuKzMR7/JA1JI/PemEhL8bBLNrmfvyOmHxAGFWXTdbEox3399qaWYbWT
         WqNayJq1WWjK7cHKhxwN5Zgwqk+AzMCEO70oSNrksRmHUsZBeGu8bwNe9fP7jLxKzR6F
         OGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xCzWuSZPyqTcJZ34KYoCD+of4IsT5Z1MHkdQ0MohA/M=;
        b=uF/K0W4QkewS0J0yue9QENKp4H4/y7BHpIr76m/PzzPvbARqirMcuxGkYSJaMjpKgd
         rrsUoYR0jPblxe5nps/KxC1CqBtB7YUqv6i90AGdNXEduXN63KbFNhbNevJOX8BXSrmT
         c/wjZddOkoMuYD9m9iHhTkHZZUKm4buZrgnwGELv3v2tyHFaU5XQ800ti1HSqweMmCN0
         wpW9tmVpZ+zRi7e8U8qJRJssLQcz9PWCIVVEtK1GVVnAo5kuhOKonda7asltcjY7tlhe
         JyMDCDHJmkCAHpvAZYZa6VQBSyU8Qtkuga6FKnzgYnz1XF5+cX6MhEusv9ao3rslhzqZ
         tDdA==
X-Gm-Message-State: AJIora8OEUQvyxzf8dwEbaiYKaLNWlo3u4CxT1Ns8RhVqDbkIe51YL4g
	zNP9UpeF5QJQ7pLAvgo52GDkOKIDtHE=
X-Google-Smtp-Source: 
 AGRyM1vVxPM9d86xyoKGOV/WmqVailnrxCx5GuQ+BEutqEvNkR1Is+tg+UHJAuvQEAUsDKAApo+57w==
X-Received: by 2002:a05:6a00:1a08:b0:510:979e:f5b with SMTP id
 g8-20020a056a001a0800b00510979e0f5bmr9657461pfv.34.1656500254320;
        Wed, 29 Jun 2022 03:57:34 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 g2-20020a170902d5c200b0015e8d4eb29csm11073587plh.230.2022.06.29.03.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 03:57:34 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [kirkstone][PATCH] binutils : CVE-2019-1010204
Date: Wed, 29 Jun 2022 16:27:28 +0530
Message-Id: <20220629105728.2354528-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 10:57:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167372

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=2a4fc266dbf77ed7ab83da16468e9ba627b8bc2d]

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0014-CVE-2019-1010204.patch      | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index dc0a2a4054..a069071c97 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -32,5 +32,6 @@ SRC_URI = "\
      file://0011-sync-with-OE-libtool-changes.patch \
      file://0012-Check-for-clang-before-checking-gcc-version.patch \
      file://0013-Avoid-as-info-race-condition.patch \
+     file://0014-CVE-2019-1010204.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch b/meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
new file mode 100644
index 0000000000..dad4a62038
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
@@ -0,0 +1,49 @@
+From 2a4fc266dbf77ed7ab83da16468e9ba627b8bc2d Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Jun 2022 13:07:40 +0100
+Subject: [PATCH] Have gold's File_read::do_read() function check the start
+ parameter
+
+	PR 23765
+	* fileread.cc (File_read::do_read): Check start parameter before
+	computing number of bytes to read.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=2a4fc266dbf77ed7ab83da16468e9ba627b8bc2d]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ gold/ChangeLog   | 6 ++++++
+ gold/fileread.cc | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gold/ChangeLog b/gold/ChangeLog
+index 5103dab7b67..8557dc6db7f 100644
+--- a/gold/ChangeLog
++++ b/gold/ChangeLog
+@@ -1,3 +1,9 @@
++2022-06-27  Nick Clifton  <nickc@redhat.com>
++
++	PR 23765
++	* fileread.cc (File_read::do_read): Check start parameter before
++	computing number of bytes to read.
++
+ 2022-02-17  Nick Clifton  <nickc@redhat.com>
+ 
+ 	* po/sr.po: Updated Serbian translation.
+diff --git a/gold/fileread.cc b/gold/fileread.cc
+index 2b653f78c2e..af2df215468 100644
+--- a/gold/fileread.cc
++++ b/gold/fileread.cc
+@@ -385,6 +385,12 @@ File_read::do_read(off_t start, section_
+   ssize_t bytes;
+   if (this->whole_file_view_ != NULL)
+     {
++      // See PR 23765 for an example of a testcase that triggers this error.
++      if (((ssize_t) start) < 0)
++	gold_fatal(_("%s: read failed, starting offset (%#llx) less than zero"),
++		   this->filename().c_str(),
++		   static_cast<long long>(start));
++	
+       bytes = this->size_ - start;
+       if (static_cast<section_size_type>(bytes) >= size)
+ 	{
-- 
2.25.1


