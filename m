Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1675DC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.22421.1638602015054621692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S8QpA7eM;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d9so10560009wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vn/Rhq89XxiwbSiDeEukLz4qWL5OmvHtANFoHVxMx1I=;
        b=S8QpA7eMkKLpAOX5ww62gWv7SSlPkVpsORX6BoTT2eBpfXY+i/K6GbS3tZgmSGQicn
         PKwSC3oVQE6/1lZvgiA6D9qRtnSvn6TQ0OvIdBzbO4cg4KQlE2ZOP05mwCPZfK5FG4tA
         XOYsq21wag8XL6CFcwXWyfN4LY3XS7IcLrnG1d5L9fsdqiZFN9wLM6n4RdxYChbRqZRp
         B43T1YJMvxM9l9G2RNKw2LTbzumJ1TzeSWOaeq8QmVLgju4onBSQ6iMXWhWNgiOSbERp
         u8SlDVLkmUTEzq5IALAyAkkEUQNOIKsAqWFWyCbME9CkLpii3mSlBXzte7PDyz4HeoBJ
         zHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vn/Rhq89XxiwbSiDeEukLz4qWL5OmvHtANFoHVxMx1I=;
        b=cuWPv7AGvAkAUfPS4Kz5ZNbn9b51/pcPrAZ8DucvkGPvS2BFVUH4Yn9zD6nkECjjLa
         oqbFaWHaoAuQ1cuyQIKmIf/eQobyBF/jAYhydHtg9HdVYWS9EjLmIWykO/bFF3D42jug
         0f/xuPqNj9I4agg1WdJbfUark1J02Dg81ReZojjCUI0uUdDTpdbCaNdHTdrZCa/zWQ46
         miT0s0Z5+lBMsexIoEJvwGoK6QEOMFEbq6vZDMV2MxGumwTjvj2f4m1L3BMR+dPieqWf
         fJK5YxQ00/nZQUAe2YBSO4oR4zlG0Nx1FErbzluaXAGwmZiYFZPxh97O1aCw/zsxJvlW
         b3eg==
X-Gm-Message-State: AOAM530ekCRnGLIbSck3QTitUGaKFCsthgg79Ac4/WXADMICILu4RgIQ
	ea/H26zQP/rbJh0unEr3Cnt5BXMMRd41yA==
X-Google-Smtp-Source: 
 ABdhPJyfDP/D3x80QeTpU2O9dBkW2oUT15Fwfz7inGYWdGxDnBSySyGJF7wo6N2XZxjVZyE/N6hVnw==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr26798317wrq.44.1638602013710;
        Fri, 03 Dec 2021 23:13:33 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/26] lighttpd: remove unneeded (since meson switch) patch
Date: Sat,  4 Dec 2021 08:13:06 +0100
Message-Id: <20211204071323.2480163-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159156

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...or-pcre-dependency-instead-of-config.patch | 42 -------------------
 .../lighttpd/lighttpd_1.4.61.bb               |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
deleted file mode 100644
index f17bdce2c0..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 26 Aug 2016 18:20:32 +0300
-Subject: [PATCH] Use pkg-config for pcre dependency instead of -config script.
-
-RP 2014/5/22
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 16 ++++++++++++----
- 1 file changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5383cec..c29a902 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -651,10 +651,18 @@ AC_ARG_WITH([pcre],
- )
- AC_MSG_RESULT([$WITH_PCRE])
- 
--if test "$WITH_PCRE" != no; then
--  if test "$WITH_PCRE" != yes; then
--    PCRE_LIB="-L$WITH_PCRE/lib -lpcre"
--    CPPFLAGS="$CPPFLAGS -I$WITH_PCRE/include"
-+if test "$WITH_PCRE" != "no"; then
-+  PKG_CHECK_MODULES(PCREPKG, [libpcre], [
-+				PCRE_LIB=${PCREPKG_LIBS}
-+				CPPFLAGS="$CPPFLAGS ${PCREPKG_CFLAGS}"
-+  ], [
-+				AC_MSG_ERROR([pcre pkgconfig not found, install the pcre-devel package or build with --without-pcre])
-+  ])
-+
-+  if test x"$PCRE_LIB" != x; then
-+    AC_DEFINE([HAVE_LIBPCRE], [1], [libpcre])
-+    AC_DEFINE([HAVE_PCRE_H], [1], [pcre.h])
-+    AC_SUBST(PCRE_LIB)
-   else
-     AC_PATH_PROG([PCRECONFIG], [pcre-config])
-     if test -n "$PCRECONFIG"; then
--- 
-2.15.0
-
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
index 32b0ae4ace..583b0e260c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
@@ -17,7 +17,6 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
-           file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
            "
 
 SRC_URI[sha256sum] = "43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432"
-- 
2.20.1


