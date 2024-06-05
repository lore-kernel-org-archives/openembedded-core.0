Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCFFC41513
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 06:43:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.8677.1717569802393077200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 23:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GRbzF2je;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7023b6d810bso1563703b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717569801; x=1718174601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss7vRlduix33/ixYkESD1gbR5YWgRGIK1cCYBYPB0is=;
        b=GRbzF2jeiDNo5QzQpRrkajd6jS9o/FwI4J17+GPAy75WKvuK5MPKvYKNDjEguaewXT
         fhyyPqcCxNJZgr95y3ixvhc6QuLhMU1EBkTlzDeXV2y89jEWEUfshO1XfUa20qlETxWX
         wlu2SCnEPyO4dlfkHfav7KhLKy9ECnfEyU8z1p6uDveND4DCIOHc4dOIaY7lfmYBm2+/
         oBhiE30qFusW6B97WFBTJkW84vN3QA3wvkoaQTaSpwub/TTGQkFKqmwclu9AztTna+VU
         ZB7GWbtMjRxRmu9oLIlntn6vro+DYQ25DlouRDNhfVmt5+uLs5R8n5klO5ZDiuYkaey2
         o/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717569801; x=1718174601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss7vRlduix33/ixYkESD1gbR5YWgRGIK1cCYBYPB0is=;
        b=pWiqjsIfzTFarwOvVk/odylZUAIUtK61m7xepK/QkQ6wQVSjIILnoNHwKZpxCcPtG4
         u3OsGEcRBLY37kWUCIIctvllV0cW4vdSrPXsekl70VwcZ+D/C0HPZH227EwkktcL9KM5
         4/Yda5TWhl3GmkwSkUw6MRZFpwcuEU7u71gkiM8MpLLxaVkpRW+NO4RUIqHmeJFfEDJ/
         WtzRMo9lA91k1bf1L3yZRUdzt/tzUZSJEJAkAdCLPuXlEhWRdmlcDcpq/SWWYyXyLWkp
         9GgB3JQb45X6H3FEe8/w/LyKOpEbCHfr4xcSVD9ghILGSKAFWpD7y8ZCI5rdkRR15dkt
         7LeQ==
X-Gm-Message-State: AOJu0YyDFsFnalOi/lFjCQzkglTDuX3pNjfs8pb0Sms+Nq8vnjKt0rsr
	IO8bBSYKETom+XHYGkJOiqgV1C8fznpj4xBoybGJN5fK9YPCIpERaqrOg0d1
X-Google-Smtp-Source: AGHT+IEpowpwDX6bVETPsg1sKMFB/AVmGoTVuYTtvqPX7hBdnGjqu2GKPok8eFB+s4wmgcNbZ68MxA==
X-Received: by 2002:a05:6a00:2350:b0:702:711c:731d with SMTP id d2e1a72fcca58-703e5a49005mr1723768b3a.32.1717569801203;
        Tue, 04 Jun 2024 23:43:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703edadedd1sm436214b3a.92.2024.06.04.23.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 23:43:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] python3: Drop empty patch
Date: Tue,  4 Jun 2024 23:43:17 -0700
Message-ID: <20240605064317.1646597-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605064317.1646597-1-raj.khem@gmail.com>
References: <20240605064317.1646597-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200354

The fix brought by this patch is already part of python 3.12.3
therefore drop it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lize-struct-termios-before-calling-t.patch | 26 -------------------
 .../recipes-devtools/python/python3_3.12.3.bb |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
deleted file mode 100644
index 8406ef30a21..00000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 439aa02f42d6e6715c172076261757fcb89a936a Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jan 2024 23:02:02 +0100
-Subject: [PATCH] gh-114492: Initialize struct termios before calling
- tcgetattr() (GH-114495) (GH-114502)
-
-On Alpine Linux it could leave some field non-initialized.
-(cherry picked from commit d22c066b802592932f9eb18434782299e80ca42e)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/386c72d9928c51aa2c855ce592bd8022da3b407f]
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
-
-diff --git a/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
-new file mode 100644
-index 0000000..8df8299
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
-@@ -0,0 +1,2 @@
-+Make the result of :func:`termios.tcgetattr` reproducible on Alpine Linux.
-+Previously it could leave a random garbage in some fields.
diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
index f5f311f61c9..9102bb879e9 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
-           file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            file://0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch \

