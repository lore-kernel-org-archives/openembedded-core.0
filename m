Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376E7C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 05:25:22 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.7998.1656480311986191587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 22:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R9nTuWWa;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id v126so10089300pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 22:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xCzWuSZPyqTcJZ34KYoCD+of4IsT5Z1MHkdQ0MohA/M=;
        b=R9nTuWWaTfJy8XJBtSjsyHKWGSScmxbrLokI9S2SlsglsJOHLiPq83tft7isilFmvf
         oEOiyX6fQN6Hs7ksx/mtAXjz1FYuc5s6dHXJwfq0PyYeQIHWEjWbgDw51VvQJajPcW4O
         GshmAHjuP7QitXL4pZJAIGNxrR7lEse+YyydCYOk+kiE9IzZUOwtgDb0tcVy/A7GPayw
         nTPhoDWIyPsUaWfjSkqCVCNF+N9GO9Hcl/GKPsREvh1UFB/83q1BFJy/hm33scFgJkqO
         lu8J7dm9xjwZg5Dyy6nGR/gLUijw5NFt3dnAiCfeQdpw9e8ILFN8vhRsmd/Qnvtp9413
         Sh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xCzWuSZPyqTcJZ34KYoCD+of4IsT5Z1MHkdQ0MohA/M=;
        b=Zi9wGUFi/7hiva/wtpdDR3f4MPRjTyVTsMlDEiBux9LtO/6Kbg70dz9BNx2s/saDbs
         l/1x/MJdK7yOq04GfaBa7Md0SnV1IfmITLCX1D5sH6Ri28hnH6+641KiEc3ZeK71sLAA
         IaMbwF9ymQ/PG6GVswb/6Zcl5DeXek3DD+r8PaMiQderFoXlnMmW+aPv4wAuAYs8FfFv
         8A6j0Fk9km5Q2PT6bSRqcDpW8RMbaj/v5DCk6N+rcCJHnoO6FZEd60Z7InsBOMTIfM3P
         xF3ba1WRrTApDTVIjdnPAnCVB4hsvcGkzfJuoYlsT9LZsgvBAdttOCoC7rnBmBZv5bKe
         j5Qg==
X-Gm-Message-State: AJIora8ISkYpdAS53XwWLFpbh1xPpt2laoN81bSWGZSdmSHC8UVTPD6w
	lqMtndCBA8bVmmpQKQPih0UKCPg0pDA=
X-Google-Smtp-Source: 
 AGRyM1tmeeodfDQHYETccVFhOupEP2Q7vXKWx4Uc5Gkn3sDT1gha25PlR2Ns38EKDK4t8135SFy6uw==
X-Received: by 2002:a05:6a00:4091:b0:527:b95d:6041 with SMTP id
 bw17-20020a056a00409100b00527b95d6041mr8535769pfb.10.1656480311160;
        Tue, 28 Jun 2022 22:25:11 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 71-20020a63034a000000b0040d2d9f15e0sm10302938pgd.20.2022.06.28.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 22:25:10 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] binutils : CVE-2019-1010204
Date: Wed, 29 Jun 2022 10:54:39 +0530
Message-Id: <20220629052439.2353562-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 05:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167366

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


