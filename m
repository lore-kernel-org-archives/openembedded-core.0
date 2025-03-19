Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C6CC36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2921.1742372183833350552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kS93+iue;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22398e09e39so140414165ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372183; x=1742976983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dytxn8/3v9xEKbbS6QXvvkvya0DqwV1g+1x9oT0lQLE=;
        b=kS93+iue/X5LnmYvKo9lBodxScSspWpCblhrDafcMXaHZURdIVCpunvWdWQoiZIrSH
         3lCq1syDehAYueSAVpHydsADBlrll6v1GdUQ7y30lPoPr2vdyfZ2ibxpVM0KsHIClagD
         +m1bSHi6s846Cjvb6wC1OxjPY3OTMpll41gp2PYIMqVj3M4tqbNRyqEYU9MiZ1CcqFyt
         HHjmCfZtUi416fwf9sdr9okK6wP3iSrSOh+hJN1xWlEDnXWPQoug9Ex3Yw/xW8/ZdiIk
         kQDySK2OI8xjwdcMOLlOBaVPqhgs9GOy+V2aCgS5cMmHG0mv44jzUfMEm9JLAOhvmWwk
         aS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372183; x=1742976983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dytxn8/3v9xEKbbS6QXvvkvya0DqwV1g+1x9oT0lQLE=;
        b=SdABgZO8o11Wif10TKsSK6YEBYFDwpWncomcOztHz4e15RRAJQ71fRX11OSOMp9q3T
         et8SWErbyaEHJ4WOMzvYbR8Dvl9vhM5D5IvbmYSHL6a2sLcitoMsDGhLqMW08qvpTvN2
         kqZmv2sNPzbeY/vi0vtx47hK8vyj+/AXdy3qtgzrMxvD5U1JPLFFs55GNtVfBfN+vaaW
         qEMpDtwpD+Ih0aewF41WYrCHWTzHkqfdOap5YNIzYNRKrv372Qy4k1T6EyQYfQHawTdD
         /rMuolooYi4oaqq8ecECSQwLHVyThkaJ7MZ1kS5Gqe6PF5NLYrluNPSishqa4sfQ95YY
         WTKQ==
X-Gm-Message-State: AOJu0YxSst7iEZCxnj8yPM/nX2QYekkQ4Q5v3vyAx53D7qu3qcUA+vug
	lzZqtZlKABweDI/HYy+fbC8wWaS0VdpYZ8gbmWkt8Hd0BVabpq9ETzlQbUv2
X-Gm-Gg: ASbGncuiDjSHcf8+JRnHb3tfKHH9rglpKnEcn9r5RlS2ixxCBS6VxsPqGcJieUes0i+
	xZm0Zd8XZhhgoHbKQMkQFJLjMPNsn1ZMvi5E2woo7zi2fqEJ4b2LWGON1ndqErGcETszY//l60/
	9bKx1gc4lubjqtQ4JC55+hRxplO2xvBUn3+R9vbO2KgorIf3RbEXUbh6L/2Vttvayf4OJk/FB4j
	x0wbvB3dKzFZXQk+CjKBJRDyQbotH8u56pbmRmiK3GT4knjLiGJHmqOVC1LBt9qz8OxZF8JvcQN
	oCvnLY6JgKgnZixVJGMPTNyXIPnVsuj9oedx
X-Google-Smtp-Source: AGHT+IHx7SXweQL+NO0KJtHw2FuU+eVAE4glZv57S3A7QdUqfVAQb2GJyVTSETml4wK7z2Uary/AlA==
X-Received: by 2002:a05:6a20:c707:b0:1f5:7cb4:b713 with SMTP id adf61e73a8af0-1fbebc8412fmr3210021637.19.1742372182891;
        Wed, 19 Mar 2025 01:16:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 11/27] e2fsprogs: Fix build failure with gcc 15
Date: Wed, 19 Mar 2025 01:15:39 -0700
Message-ID: <20250319081610.3536475-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213277

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

