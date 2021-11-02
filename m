Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9D8C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.6558.1635842601266936564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKHHtFTc;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u1so421390wru.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUiCUotWJHIfTl3JdVP9elkZM5jj64EE1KVDwGTBtv0=;
        b=bKHHtFTcvAX99b5Us0h3ePErRufI/dMwP/jm+ypHuH/fq1y6Xr26Tmqh+T7mDPeJJ7
         9J+oVvKh9asCT6rA5909sAfHKgNvkRggZUr3CvpZJuqM3+fk80a3Z6kGGLJs9Yg2I3RA
         UIHc64bjvv5FCCa5NsJuUTYYLIvU0H34MfUWlPQ/D1QNJhwmbwFNumGJTLOotqGPpXTh
         4pFq/D2UJA92V6E11bqPe+STMt7EuTeSj9PqzXE1rqFCD+Wj4LBLbK5HVbMaeYg8sUnd
         jdLeGLzM7EUKv47RMcDdM9VAgJ+xU4fQAu3xbwiTYAvfEc9nmF/j8ZbhNh6ef/WxV+r9
         iJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUiCUotWJHIfTl3JdVP9elkZM5jj64EE1KVDwGTBtv0=;
        b=esiwH7PyyyuVLFgWySdaEQ9Q69ZxZA53UJLC7ayZkJCDEhJYPpfdKSC+fncsHiamnt
         qpT3Pl8TrFf/JuGYnJh8xCnJ/QBGh1v01SV0n/6xlu8rkRMif0rOAEMpSzsRu4R5/N5e
         BsTFXVWWTEsjPTGskhFP4fWMMmgVLtv3yLJ7eKlRWUzHYUCvq8xEKlbvfq6J7qUcrM3H
         zjHFF9w40HlyA4poZRI09wV0emzCWQVd6UUB9XhpJaznQb8LlKMLGmy8EAx5NFLmHkNF
         NCnyttB6oYbeSTWp27mXx7M9O4UMDlwYJ58dAMgz77ZfnlLVrCIFVOzzQjy4QjAQDF9d
         o9PQ==
X-Gm-Message-State: AOAM530vS8eViDqIxShGU/fsdI0PIPVYoJjG5tjhK9720Fb1ykkewNAr
	5lzsNEBWIhe+vbrMjzloLTNG15WXQpI=
X-Google-Smtp-Source: 
 ABdhPJzqQnO5sbHg0vmU6mDGlb4TipmC7N4e3BV7hbp5V1RBSnKzsNuSre0Lt27hpniFicux8IGE5A==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr22468480wrt.22.1635842599904;
        Tue, 02 Nov 2021 01:43:19 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 23/33] gawk: update 5.1.0 -> 5.1.1
Date: Tue,  2 Nov 2021 09:42:53 +0100
Message-Id: <20211102084303.2974802-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157761

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Use-cross-AR-during-compile.patch    | 30 -------------------
 .../gawk/{gawk_5.1.0.bb => gawk_5.1.1.bb}     |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
 rename meta/recipes-extended/gawk/{gawk_5.1.0.bb => gawk_5.1.1.bb} (89%)

diff --git a/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
deleted file mode 100644
index be6dbe1e57..0000000000
--- a/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 47dce6a7002a8d7b818c19d574d81327b769871b Mon Sep 17 00:00:00 2001
-From: "Arnold D. Robbins" <arnold@skeeve.com>
-Date: Fri, 5 Jun 2020 13:14:54 +0300
-Subject: Allow for cross-compile version of ar.
-
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-(limited to 'configure.ac')
-
-diff --git a/configure.ac b/configure.ac
-index 31364ab8..8c256f21 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -105,6 +105,9 @@ AC_EXEEXT
- AC_PROG_INSTALL
- AC_PROG_MAKE_SET
- 
-+# support/ builds libsupport.a, allow for cross version of ar
-+AM_PROG_AR
-+
- # This is mainly for my use during testing and development.
- # Yes, it's a bit of a hack.
- AC_MSG_CHECKING([for special development options])
--- 
-cgit v1.2.1
diff --git a/meta/recipes-extended/gawk/gawk_5.1.0.bb b/meta/recipes-extended/gawk/gawk_5.1.1.bb
similarity index 89%
rename from meta/recipes-extended/gawk/gawk_5.1.0.bb
rename to meta/recipes-extended/gawk/gawk_5.1.1.bb
index 0961efa897..215ac8c860 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -17,12 +17,10 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-Use-cross-AR-during-compile.patch \
            file://test-time.patch \
-"
+           "
 
-SRC_URI[md5sum] = "f719bc9966df28e67fc6ebc405e7ea03"
-SRC_URI[sha256sum] = "03a0360edcd84bec156fe211bbc4fc8c78790973ce4e8b990a11d778d40b1a26"
+SRC_URI[sha256sum] = "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b744901da15fb4f06bffd"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.20.1


