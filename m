Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D353C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.3452.1637741320687670790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hNDkEQGa;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id y196so1415390wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spkGq/6QDLPFBRAS2qqMCLA33D2qSljJhC22Pl/qeo0=;
        b=hNDkEQGaJyuwTH/wi4/CrQ8srGIiyV5QXjY6FlkHm3OSAvJAajHgiVJ407UENGQY9W
         fho2TiKiK8CuH8QJdcutmV/JjEMx1mvMHhhNBOH7DZ5slIMjOUWQ13j9k4GlBM9xGWBc
         MwM/VVyhsPHxON6uqBfZvGqvvrQoURpjxRYMscUxeTk+7oWoHgYY6qgsQVEiwGsOjVK4
         XyVCxx0alr/L1AAoNSR7fuMcfAR7SmRyRJD8xsHdWnqSRF/h1ZeDSiSUWBDdEBPFFmFT
         yytEPvbWHOp0/FpJh2E3DxSgVcYLauL8dKv0hUHx9JVSqtCGC0uFNkcbUWUxbjCfMmQ/
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spkGq/6QDLPFBRAS2qqMCLA33D2qSljJhC22Pl/qeo0=;
        b=CJ7TbpTKzwX//4r+EshjSHH04u1rmHkG5b78NlssuOK77xZbBk+hwKaBiBwjaUn8zO
         Q8+k67m8Llo8fYLmgYgfDSWFIoHUtF4GdjoPWifgkg8Nclg1wgx3k7QuDlawTp8yKlJc
         UZT4RzuTgHaSh4gozjQrOflYLmppNZd7PxEozZYgAfojn06RInHR0p6GcsIvJLnKqRQJ
         TQGqXA+YX7QBUOx5S4RbMUFBqJWHE/e/ve30l/oyyvM/eLsU61g0PTu3ddATyUPSIUJ9
         WlNF2krfTeX9nK5q/2uB6puPN0IWbYeYZUxKfq5YfAtmLWYnEtaoxZ/wCLTrDLiWmjWH
         Pm5w==
X-Gm-Message-State: AOAM531xv/5MVuC24E5azh1tZt/7blJ9MdF7EP+UuHbRxVn2urCB2KTS
	AbbKL31MsJgirw8WT9XkwbjKkAXgVhXSyw==
X-Google-Smtp-Source: 
 ABdhPJzChLYpZ6zwhIcfcUfIvwW/YexQ4H6kaNKxH8vW3dCVniS7g+kDIf2X8Yca5qcoioirGf05Og==
X-Received: by 2002:a05:600c:3c91:: with SMTP id
 bg17mr12621419wmb.80.1637741319313;
        Wed, 24 Nov 2021 00:08:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/21] diffstat: remove unneeded patch
Date: Wed, 24 Nov 2021 09:08:17 +0100
Message-Id: <20211124080828.530981-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158666

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...clocal.m4-add-missing-header-defines.patch | 24 -------------------
 .../diffstat/diffstat_1.64.bb                 |  1 -
 2 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch

diff --git a/meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch b/meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch
deleted file mode 100644
index 5bd94d7de4..0000000000
--- a/meta/recipes-devtools/diffstat/diffstat/0001-aclocal.m4-add-missing-header-defines.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 004bd80d2523f538467b5ada2623eb207b55dad7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 15:44:28 +0100
-Subject: [PATCH] aclocal.m4: add missing header defines
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- aclocal.m4 | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 3b19e82..c0c4acb 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -1927,3 +1927,8 @@ make an error
- fi
- fi # cf_cv_posix_visible
- ])
-+
-+AC_DEFINE([HAVE_TCGETATTR], [], [Description])
-+AC_DEFINE([HAVE_TCSETATTR], [], [Description])
-+AC_DEFINE([HAVE_TERMIOS_H], [], [Description])
-+
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.64.bb b/meta/recipes-devtools/diffstat/diffstat_1.64.bb
index 76ca30c20a..717f503039 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.64.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.64.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f605b1986cc3b808ec0e4fa9d0e0f2d9"
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
-           file://0001-aclocal.m4-add-missing-header-defines.patch \
            "
 
 SRC_URI[sha256sum] = "b8aee38d9d2e1d05926e6b55810a9d2c2dd407f24d6a267387563a4436e3f7fc"
-- 
2.20.1


