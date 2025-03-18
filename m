Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47F9C28B2F
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.2870.1742323134561444871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QgZJC2zb;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so7033629a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323134; x=1742927934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dytxn8/3v9xEKbbS6QXvvkvya0DqwV1g+1x9oT0lQLE=;
        b=QgZJC2zbBFpgEUKnMTITta/cWqlJKNjDU2aTt0Zd4QcJvYRP9J3TOQz1uVCRmdDb3l
         OucS9hxJQE2VTHy+qH9QUX7oRiA9D8sVY3Cuh9zdwFgPDLa21lxugbq0C35856BKloL0
         W6buY+QApGbu5x/Wv55iT5RIwgu6XGkURhNg84aB7rlYbTzn2lWF9yPFk1IBBvy3M7Dj
         8kQVGuZmHzZ1bvMJAu6XPQ1LSYWmREOCEBVUUxgoFT+a54vRFM3aYb1gaK+OgeEi2g/k
         FPxDksLqmhh7zp0sOvkJ42cU2AHoPSc+W3iqten00gQTKIZcfzXCGu4n2oQDM4rNDQPv
         nWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323134; x=1742927934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dytxn8/3v9xEKbbS6QXvvkvya0DqwV1g+1x9oT0lQLE=;
        b=TxknuKWxxmMizWfmrBne7I1tUXqpj6byp/fpzqLtBuhmuvaRdVGqobsk5FaRFNulY/
         ZDkYDvNwpEPEOndLALULpqw0S0LE54+ekVHvHKz+17mvYJYBBXweZwdg9PMUj1BUd+3B
         68bsqMIV7iCQ1eJye7gnaPdQZoI5CPjtpIbpZSEYWQrx+ooC+OJXGiNK1R7EISVedGBo
         LsWu7HpII0qLigSCNu0yupIgL1TyVqExxZJR5UOp8IgfoeqT/bUyoMjdom+w8BNOFrTO
         dj7MJH0iGwbnNnLiVACXjY9wyM+0u4wo/sLXKs+UlqlJ4Rnkbj72CvF3MFrPTWzGOLjr
         47bg==
X-Gm-Message-State: AOJu0Yzs0h6GM13sb28FEIKE0uMXcFvO1lqMBEoiRVAIqALlOl8zhnXq
	api2peyYp20GAc0wTzqU/fe3/g8bcK8TgSSqOWCOtC32ZSmKrlYh9LvsiNfx
X-Gm-Gg: ASbGnctSy0uEpI8BDx6gjq3spmqBvEj9Jbdy50dcQhR5HrBX7K6v9WRobkX658EWrMM
	PMojbiqQOj5MOWujKQxluMKsaOzdt429jGD5X8PrvVERUATrqeE3m3wm9SWlmT6LVKq4CpyLnWA
	wznMxQtsxW+6sySeSR5KHusLaHrIKm7/6Rk/ejZIL64twVxLTNyFwho+rZa0yJNZ5i4DJe1Ztlh
	Di4V0CcB8XRvWZyarsIlr+auxXXkT1ieE9ywX6XaYYTs3jSkA+MGA4BiSGngDWQqm7wLgSK5gHa
	HPYXXUwNX30hJ3Onfj4eC16ou1DzWzhKgIIi
X-Google-Smtp-Source: AGHT+IEkbkKtWHE8zAApI+lE2Q76NcbTOFoEhjyVUgHdI2dPBTj+Zu8tCBUtX0Sp3LahOLVbuLRDNg==
X-Received: by 2002:a17:90b:4fc5:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-301a5aff206mr5836909a91.7.1742323133637;
        Tue, 18 Mar 2025 11:38:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 11/25] e2fsprogs: Fix build failure with gcc 15
Date: Tue, 18 Mar 2025 11:38:26 -0700
Message-ID: <20250318183842.2256284-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213237

Backport a needed fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.1.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..01ab9d5afb5
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
@@ -0,0 +1,42 @@
+From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 22 Nov 2024 12:36:32 +0000
+Subject: [PATCH] libext2fs: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `e2fsprogs` fails the build so only typedef int bool
+for __STDC_VERSION__ <= 201710L (C17)
+
+    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
+    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
+      113 | typedef int bool;
+          | ^~~~~~~
+
+https://github.com/tytso/e2fsprogs/issues/202
+
+Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/ext2fs/tdb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
+index b07b2917..98dc95d8 100644
+--- a/lib/ext2fs/tdb.c
++++ b/lib/ext2fs/tdb.c
+@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
+ #endif
+ #endif
+ 
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int bool;
++#endif
+ 
+ #include "tdb.h"
+ 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
index bd6ac92cb14..022b016f123 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-libext2fs-fix-std-c23-build-failure.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \

