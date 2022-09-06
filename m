Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B06C38145
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 04:48:43 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.363.1662439715975230532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 21:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PclPQ9cx;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q63so9580056pga.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 21:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Z1q6vzZfGA90ZImj19qHrS99WUOopR2udWZjHsa2p5Q=;
        b=PclPQ9cxjC0aPP/j36gQGo8gY/Ni35OdRxocLk6sV/IVxiTBqqbco9xgtPAkVGni60
         ailJVb5F/LRKFv8hMIpPZl/2PlsqygbwfYsUKq4qg1T5vVXdmPg2vTrDMGMB1HSVYNA8
         AvR3jofklt91jzP2dKdWoBXHkPl4Bz1BiFVrkZpZJaufDBs1ocZE3NwLaacxKVV2ZRNl
         Qg7J3aa+19GlxeZL3CcNOgb1d8+GPIYWZXegAizKMx0pcXvLFBIMXXoyx4pcB9WkmQ+x
         3f26Yu2S4qSuCP+fx+jvHJAQrsA88SPeMWFycu5jmjTmdv20u+lKHOakJHVmU6rB3zma
         g3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z1q6vzZfGA90ZImj19qHrS99WUOopR2udWZjHsa2p5Q=;
        b=4/kJLQe7MMxaHXETotNRtLUOhBwpd0XksvU95lJVtUp6w6AIv8ZcIyQKsDitmEJ097
         AtpnuwKQSV4sCcwyCx/CPyJR+hn3tDdu4iiBWW8wZkEo6Mr/2lpWKukGGNXtgDQNNIXE
         nKD9f3RCGvPQ1X+nnMofdWK9+O17tTdLlIopv5kP/e4s9GN5HLoYpdLQ1o4R7gGOVIs6
         N/MowxEvgePgNwk9EdgrZVrk87qSq77FNp43xfxoOD4XfU5hmzovxmAy+P123LUUMpqD
         sABFV63VhqvwCDqz06hylsBGkFFhoIddawz7V+ysZkzGQM2hFX+73A1anuNRG/+OL7au
         aJIQ==
X-Gm-Message-State: ACgBeo3j52UEEW/ELmBsquNPHajMGVnHzJ+hqLrJ79U4L+eqCPyqy/Tz
	1YJ0rLI1NM1v+EEZ4MV44g7JQpEUVxY=
X-Google-Smtp-Source: 
 AA6agR730AWXDympRo9Uj0gldArgXAMXeeEtz+SNdNLw+LA3K2SCS5IX+Vfh+YR0pVsP/CKcwG2opQ==
X-Received: by 2002:a63:da49:0:b0:434:459:307e with SMTP id
 l9-20020a63da49000000b004340459307emr12870224pgj.105.1662439715030;
        Mon, 05 Sep 2022 21:48:35 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 y187-20020a6264c4000000b0053db6f7d2f1sm3585654pfb.181.2022.09.05.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 21:48:34 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [kirkstone][PATCH] binutils : CVE-2022-38533
Date: Tue,  6 Sep 2022 10:18:26 +0530
Message-Id: <20220906044826.3104493-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 04:48:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170335

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport
[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0015-CVE-2022-38533.patch        | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index eed252976a..8aa8295881 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -33,5 +33,6 @@ SRC_URI = "\
      file://0012-Check-for-clang-before-checking-gcc-version.patch \
      file://0013-Avoid-as-info-race-condition.patch \
      file://0014-CVE-2019-1010204.patch \
+     file://0015-CVE-2022-38533.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch
new file mode 100644
index 0000000000..5d9ac2cb1f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch
@@ -0,0 +1,36 @@
+From ef186fe54aa6d281a3ff8a9528417e5cc614c797 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 13 Aug 2022 15:32:47 +0930
+Subject: [PATCH] PR29482 - strip: heap-buffer-overflow
+
+	PR 29482
+	* coffcode.h (coff_set_section_contents): Sanity check _LIB.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ bfd/coffcode.h | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 67aaf158ca1..52027981c3f 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -4302,10 +4302,13 @@ coff_set_section_contents (bfd * abfd,
+ 
+ 	rec = (bfd_byte *) location;
+ 	recend = rec + count;
+-	while (rec < recend)
++	while (recend - rec >= 4)
+ 	  {
++	    size_t len = bfd_get_32 (abfd, rec);
++	    if (len == 0 || len > (size_t) (recend - rec) / 4)
++	      break;
++	    rec += len * 4;
+ 	    ++section->lma;
+-	    rec += bfd_get_32 (abfd, rec) * 4;
+ 	  }
+ 
+ 	BFD_ASSERT (rec == recend);
-- 
2.25.1


