Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBECC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:35 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.64579.1656876992173322453
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fhMwS00g;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so11526488pjl.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QhSDRUQHh6vDRe6i+5g4w6pvKSibNr3BO2ynIBLt4JM=;
        b=fhMwS00gL4OVdeSoJZOKMFbG2uCij0iA+XqugZEvOeu8lvb0ct+2gXFmgJy5CGbxmp
         RtWv20xfvFcUu+kEFxwpcLFwUDaTOHw7p22VfrDQylpdYQRWQXmk/E2eCc7HQqq6j3/7
         ekcwnFyoOYkLMqDQa5AeEFC7cH+QntpkpwxrkhHFm/9ilOxyLxA1LbCqLhPt1yzLce7e
         sJL/rADB5UiB1/T/PiD9cp/UnoLFF3fhAhgT9lFXjAInYjlJTg7jFqf4fv239Yk6S+MI
         bEIlTOb+V16KYp2xzBOq93IAEJDr9/V6S3DjM3IEMnWuKefXEnqSBGloUdpDbQ7VpAUZ
         85+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QhSDRUQHh6vDRe6i+5g4w6pvKSibNr3BO2ynIBLt4JM=;
        b=PyZmrG5K6wFezD9G8YWakX7IVgps8yX9gytzviXkODdaKafC/3zTOiWDDY3fQR9cjr
         Okg7iaEJmSMGjTrCzk9JQp1SAUiVSiM+iTtTCqGUfcWoK/FOD1skcHvFh9VXiiti+OxG
         IUTzjiejyo6Aa6yalFW8RagHCLG8VctWPaVDY+14X+6wJ8msrt/EZT9Ix5DGXanDC9A+
         h/IolHdn/FtRv2n5KwbJI6v0hYZTpNKqfFkunB0FTSi5j+D6am71tyR0cWUZUHboc7LJ
         NmWPz/AWR39Tmx3oWXJecDXGc8CQ/51joi5Pov8cjUNjnc8o10EIELPsjgxGyrCLEoIA
         QVxg==
X-Gm-Message-State: AJIora8/npbFDBETtKM6GP4D6r8Nc8bugSlyxVRVe7pBjlFCGd65Qgoo
	ImFJ8tsPf0W2DbbJbtYRvoSGhev4AS5DU1GT
X-Google-Smtp-Source: 
 AGRyM1uuNHaE/pXrmhc/4SLgaSXqxKxluCZpO97LT9/4C/1/rC/7NWWaxknr87pc87RTitwT4vTo5Q==
X-Received: by 2002:a17:903:120e:b0:16b:8167:e39e with SMTP id
 l14-20020a170903120e00b0016b8167e39emr31244734plh.165.1656876991111;
        Sun, 03 Jul 2022 12:36:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/30] binutils : CVE-2019-1010204
Date: Sun,  3 Jul 2022 09:35:38 -1000
Message-Id: 
 <4bc6bb36dba96a534998928959acf637f9360775.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167563

From: Pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=2a4fc266dbf77ed7ab83da16468e9ba627b8bc2d]

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c55355a83130c2c0a59e9fb94f8914499943dd4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


