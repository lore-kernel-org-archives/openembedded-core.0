Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF26C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 17:33:34 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.79881.1638293613854256429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 09:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U6IuMZmK;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so18834802pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 09:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M8wxtnr4/X/5+D2JKYDhUIGN9+PPcNz0+6BnAm0RqLo=;
        b=U6IuMZmKR7rAG4KbJqlMg3WYdQyJyrrT+zdKeQajbfvzVte24tHf4bZ+//GTvAUZLC
         z97Zw3hekH6TUPh5IcALguKlzxlyyUIQmZR0wNG5hUK6GMeXWJHIo0pfIdJ7JMyiFtCU
         MagGTWwq2+3P023M2/wUtejlFn5T+aPnIOzmKd3Az9IMospFWklKDlADHEmHn/7N06dH
         kiXFnC0+St3UUt9cH/0/fk7zoYwc68SvSmYpNN8OtWtBwjxrzo4se7H62LGql0AAaSsZ
         ZiBCQLsfJjZm75pCLy178P5hP6dh9TaP31QowUElNE/KrCTpZslKPlqb9EaItU44ibl/
         Weag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M8wxtnr4/X/5+D2JKYDhUIGN9+PPcNz0+6BnAm0RqLo=;
        b=t1N5Q4xObyJMdl2+FIRyijUaYG0vUzvW2OVx6DSnmHRkom8kZnXa4SI0aIm9rfzORP
         h5s5V335j/Ex5cnlbKWXt2lWX3shFawS0HVaI2AfBI6QHN2I7eqzJ+TsHoWmKS7//3O6
         rnJ2MxQKGPnp4kP/vDLI88aZson57bh454JZG8GAdXxS90uSgMo+EH3e4ckFDaoV3CSA
         rFKf046GNXi4a1A+RWmDeXr6MxQzK0Isv8oQgLvZjGV2Y9tm+FGRGKMI5psJdOSeqUHj
         8S5kEp0zJS53qri+MMUyr3WXBmIGLaUpcTThIdTNnGBar9ciFcaQrQmRYsQzL+t0nvtj
         Gujg==
X-Gm-Message-State: AOAM531fJroU4jhbBRDxgVHJAE//Acbah1hBKCWKc09r2bGqaoflDv7i
	6YDepjP9m1oaBtEYOlovOlCr2OxQLj8U+A==
X-Google-Smtp-Source: 
 ABdhPJxN4IzH0khv2HbHjxDRVni7Ii+aPfbxGAHl/TxM1RMM4tdDyLaJ535cB3Lx5lBtdrFQi5XqBA==
X-Received: by 2002:a17:90a:564a:: with SMTP id
 d10mr334758pji.225.1638293613086;
        Tue, 30 Nov 2021 09:33:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 w5sm22363463pfu.219.2021.11.30.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:33:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libtool: Fix status format in patch header
Date: Tue, 30 Nov 2021 09:33:30 -0800
Message-Id: <20211130173330.1252824-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 17:33:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158984

Insert a space After 'Backport'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch      | 2 +-
 .../libtool/libtool/libool.m4-add-ARFLAGS-variable.patch        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch b/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
index 5c4a8fdb2d4..447640cef63 100644
--- a/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
+++ b/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
@@ -30,7 +30,7 @@ Fixes bug#19967.  Reported by Eric Blake.
 * doc/libtool.texi: Do 's/ar cru/ar cr/' in whole documentation.
 * NEWS: Document.
 
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=418129bc63afc312701e84cb8afa5ca413df1ab5]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=418129bc63afc312701e84cb8afa5ca413df1ab5]
 
 Signed-off-by: Li Wang <li.wang@windriver.com>
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
diff --git a/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch b/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
index 614961a256b..bb11887cda9 100644
--- a/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
+++ b/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
@@ -17,7 +17,7 @@ new 'lt_ar_flags' is to be used as the default value for AR_FLAGS
 at libtool-runtime.
 * NEWS: Document.
 
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=4335de1dfb7d2ec728427e07a54136b94a2d40f6]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=4335de1dfb7d2ec728427e07a54136b94a2d40f6]
 
 Signed-off-by: Li Wang <li.wang@windriver.com>
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-- 
2.34.1


