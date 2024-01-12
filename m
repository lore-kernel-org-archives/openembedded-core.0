Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9A1C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 05:30:31 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1379.1705037423073420338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 21:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbI1Hhl7;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da202aa138so4618132b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 21:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705037422; x=1705642222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q8bCstGvRZNK1zSL7TgOAlUi6dJkXp3MYMgTpsHyvY=;
        b=lbI1Hhl75U7QaS49BQu1RlRnxV6nJqm5d2ja6dl5/c2OV4uMROpxOQimxaGbTxs25E
         d9J8yP4sq1kikC0uefSs5UwEhFrw4I+EHApbt6+6IxJmKi0xKgoTVFvaKbTs/dPpW5YW
         BuEb83xohtLCOxzNQZI1Shk7TLxb4YPku6QdnvT0lCTeeJqVUrlvQy2lJVAgrMwiMPS5
         p5ScYww0oiMj9s3pB5i+QK6PilboVpPkF/+TwIfo4KInsHudzdPPFs+nQV1UkLhRKqj6
         TmgDOplEHEgxnOObFyzXEC3TDSKt27NJYR9KZdGIqWW8ALr7Xm13uRDVDhRkLAJ8b7/f
         kpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705037422; x=1705642222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Q8bCstGvRZNK1zSL7TgOAlUi6dJkXp3MYMgTpsHyvY=;
        b=h/ZuvT6j2IfQZzE4dYb9OO+0AjbyQ74zIQ7rgCxEyYhtCadnsT74uQuKnstnB9oDy8
         LomuHbObm3v9KjQs//eDtlOAjS+VeGCIKEdulrJAmdTOTRxszm563WrPTe7nGv6/KkyL
         y4WV/g4Pig8b8mRXCeLX2fTwTvtI+qqpB79IUr8cvaRYd38flZHH4OETSIsvkkbZOd1P
         GFfnqbQQ3FteMBx16IuPq3vt8SZbHQdjQwrYkVLeLHv+CR9G5U+6GXn8FrfL+FRru8Lz
         WgHVDmEwnS472MSFOVl8CkIXjGZTFf8hal8+Plo/c5aDw6nJZCy7MK8NSJzP3Z9AAlW8
         LzGg==
X-Gm-Message-State: AOJu0YyzEUdK/7sOQYpZ7wY8Fhuy2qcVod7CnsMc4XUZCmhVRqi7u/3+
	l5oeLA0tJW2326TcjFJF16mieSvZxWk=
X-Google-Smtp-Source: AGHT+IGwFmHAQKeBzCNF/WbY3+sTTBJzASWO1wBfZfB7d/hoEJ/j2SAGW8v73ukNnF61B21XBISVNg==
X-Received: by 2002:a05:6a00:cd3:b0:6d9:b173:4f9b with SMTP id b19-20020a056a000cd300b006d9b1734f9bmr637333pfv.38.1705037422254;
        Thu, 11 Jan 2024 21:30:22 -0800 (PST)
Received: from localhost.localdomain ([43.231.237.244])
        by smtp.gmail.com with ESMTPSA id b188-20020a6334c5000000b005c6eb4bc75esm2212157pga.35.2024.01.11.21.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 21:30:21 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: akash.hadke@kpit.com
Subject: [OE-core][kirkstone][PATCH] Revert "curl: Backport fix CVE-2023-32001"
Date: Fri, 12 Jan 2024 11:00:14 +0530
Message-Id: <20240112053014.21183-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 05:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193570

From: Poonam Jadhav <poonam.jadhav@kpit.com>

This reverts commit 5eab65275dc9faa0b9a4371d5bcb6e95cfda61cd.

CVE-2023-32001 has been marked "REJECT" in the NVD CVE List as
there is no safe measure against it.
These CVEs are stored in the NVD, but do not show up in search results.
Link: https://nvd.nist.gov/vuln/detail/CVE-2023-32001

Signed-off-by: Poonam Jadhav poonam.jadhav@kpit.com
---
 .../curl/curl/CVE-2023-32001.patch            | 39 -------------------
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
deleted file mode 100644
index 7ea3073755..0000000000
--- a/meta/recipes-support/curl/curl/CVE-2023-32001.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
-From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
-Date: Mon, 10 Jul 2023 21:43:28 +0200
-Subject: [PATCH] fopen: optimize
-
-Closes #11419
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6cda615a036b8a2b4125f2c404dde]
-CVE: CVE-2023-32001
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
-
- lib/fopen.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/lib/fopen.c b/lib/fopen.c
-index c9c9e3d6e73a2..b6e3cadddef65 100644
---- a/lib/fopen.c
-+++ b/lib/fopen.c
-@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
-   int fd = -1;
-   *tempname = NULL;
- 
--  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
--    /* a non-regular file, fallback to direct fopen() */
--    *fh = fopen(filename, FOPEN_WRITETEXT);
--    if(*fh)
--      return CURLE_OK;
-+  *fh = fopen(filename, FOPEN_WRITETEXT);
-+  if(!*fh)
-     goto fail;
--  }
-+  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
-+    return CURLE_OK;
-+  fclose(*fh);
-+  *fh = NULL;
- 
-   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
-   if(result)
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index a36d03f668..9e9ff00bf7 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -51,7 +51,6 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
-           file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
            file://CVE-2023-46218.patch \
-- 
2.25.1


