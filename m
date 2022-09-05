Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C93ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 15:20:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.26123.1662391236096476247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mGWSxSQW;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id io18so94733plb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=A3rY5/Cx9P/r9nS+Fw0TFB+WuDmHnPrdVBa/dCDtC5Q=;
        b=mGWSxSQWXeDdnOEqIJHN68273OqVj1VOCLGgH7LPdukYp8LdnfffWrDPsOGo0BFE0Z
         NLXFqMdrb+6GugxNYZuwQ6uTlbGJmq+/zcgNyntcQbFIQ3Lh7FupIWX4FHMY/zLrZ0YE
         eAj/K/crHjNSuEIz/wFUyHlgzYK9jUPKpjcdwttiOQchfznbPO8cZdMe+pVjV6TyhaYd
         Ppk+RhW3Wsh2jEKDUg49N6Y3acsxxCJoMKEmnVFEwHkqrNqj74s4EfkFVAg8Q6rkJq0t
         jbGCz6DyG2QubNz/Z5VJ/XZFa8WXoM3b62kqpBK9TvJtBQmdUj+LV1Z824JpEhJ4G8JQ
         0V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=A3rY5/Cx9P/r9nS+Fw0TFB+WuDmHnPrdVBa/dCDtC5Q=;
        b=68S1Q8/yLwxJ314moqfFspln+kEHMcni1WBqCXd5c44xpSQbKdIOLK06qG+ODp4IxU
         hjcbp+caHfyxShm7oi1AFNwWvhuotPKwAuXVfh2HKKmTN8cWqntT6tOx0Rqst5bqX1dm
         RQVC4oc7sni66LqN9GctU6yu/eePXRD7xpCzWqU/KYLx1ZYfNHO/B4ptB+XBiZ7oY5NV
         2FzJa2IKSMQxgPczfn/H/fXpYqIJRixk6WcaKvBgZMG2ANd+johMfjxLb5eyiHGn9Yny
         Tha3jNP+VEIsWuSe42n+3m+cOfZ9JTLR5C5V5mGAbAJvG3bDOKBCP8JdPR/m+Ya403+R
         LNZg==
X-Gm-Message-State: ACgBeo2xWRUjvQlfb5XbxbKopNARgB3pTuBukjF3pB6svj68285Hrnq3
	g2RA6tikp8rrwxvww+EUmR8cqjls1qQ=
X-Google-Smtp-Source: 
 AA6agR79bRMHg9RVOKihKGW2Y9EGKYZ/TB83NFw8zHUeHMpVfJAEzXAqmi4XQ7r7TizqurGIxulT9g==
X-Received: by 2002:a17:902:e552:b0:16d:d3c0:85fb with SMTP id
 n18-20020a170902e55200b0016dd3c085fbmr48235658plf.38.1662391235204;
        Mon, 05 Sep 2022 08:20:35 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 f21-20020aa79695000000b00538405dfe4asm7843367pfk.111.2022.09.05.08.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 08:20:34 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] binutils : CVE-2022-38533
Date: Mon,  5 Sep 2022 20:50:28 +0530
Message-Id: <20220905152028.3596809-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 15:20:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170318

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.39.inc                |  1 +
 .../binutils/0013-CVE-2022-38533.patch        | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0013-CVE-2022-38533.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
index 89612a3eae..37627c8f93 100644
--- a/meta/recipes-devtools/binutils/binutils-2.39.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
@@ -31,5 +31,6 @@ SRC_URI = "\
      file://0010-sync-with-OE-libtool-changes.patch \
      file://0011-Check-for-clang-before-checking-gcc-version.patch \
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
+     file://0013-CVE-2022-38533.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0013-CVE-2022-38533.patch b/meta/recipes-devtools/binutils/binutils/0013-CVE-2022-38533.patch
new file mode 100644
index 0000000000..5d9ac2cb1f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0013-CVE-2022-38533.patch
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


