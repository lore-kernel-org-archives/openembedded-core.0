Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.1477.1630022592867247097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 17:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RSj4Ng2l;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so7760171pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 17:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B3Qh1E2760co6VjZRhNAkezg3vXF0TKkms0Bw3tcsFU=;
        b=RSj4Ng2lxwabzjpyz6HVmj/Q6b/XVilcBvYD1PJM+dHTA/tFXp3mrqxXpf9jF75shF
         3ZXt9TEQ3TLnGLI4B3mEixgRHGtWH64dMQZIATPhsIzksk/nZ0zWhkUlOP6v8AEaG0Ha
         2fLZKU95bCCIYGJ227IxB4yqY7vANeO6i/JxjkDMKYlvcZrGAz+gpX9m5tQM5rRWGwuh
         +pqzjZrmviWfvBC7Mb6lTPSaytRTowPLmLT3Bw50aNQpN8LDUe44njgWkY9yX3yV4FsO
         0+7RIuIj6Q2Lws01jrUOkKgfKdD07wt5EVvH+X5Er2r7Gz7hVtwIT6Kz9oP1c69vIogz
         JlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3Qh1E2760co6VjZRhNAkezg3vXF0TKkms0Bw3tcsFU=;
        b=WOHiaWUe9nLQ19J49dulDdCV2lTPYm8eHwGjO88+7NSMszQRZlYGedczTLlO3alz45
         ol7QIe0R7KdGY9UWtFHjjKLbrtA0ICcSEOdwERBE/t6eAo5UAdhB39MyEgkntkJgkQG2
         bZ0OsCR18hL94d11gecX4SBuozjVMRyoTe/JAiHWWNUCOFBMqKIJyOXSnX8TxDGYkirL
         yUHPVTZshe5zUafOB0MUN4eF24ytlEou9sVbIqNzwI1Wzia+O7lLbMvqqKrpPygl24F3
         bLV7QuMq4Deb5LsHGyaPQ2Zc3YXOplrazWLkcAD2kX30csBhNCuIr5YA9fRqD68u/HyF
         iEFg==
X-Gm-Message-State: AOAM530ojV3JVlRQvKY9H3t6a0dTX9VpFrBHoPDUujYzjhShQHnfLL2B
	UgV5IMYmIp/AZ96RtZ0hc2LkgzxmypE=
X-Google-Smtp-Source: ABdhPJysMHBs8IXL1nQW05pOK77fi/a9cfSw3OvYI6EhBBcN9gW6eMjaUCX/e/BcfFSqjUfwEWrx/g==
X-Received: by 2002:a17:902:9b89:b0:12d:7f02:f6a5 with SMTP id y9-20020a1709029b8900b0012d7f02f6a5mr5874850plp.39.1630022592205;
        Thu, 26 Aug 2021 17:03:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:fe04:ee7:4da9:eb01])
        by smtp.gmail.com with ESMTPSA id k22sm3857531pff.154.2021.08.26.17.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 17:03:11 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 1/1] lz4: Security Fix for CVE-2021-3520
Date: Thu, 26 Aug 2021 17:03:09 -0700
Message-Id: <20210827000309.2004440-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827000309.2004440-1-akuster808@gmail.com>
References: <20210827000309.2004440-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://github.com/lz4/lz4
MR: 111604
Type: Security Fix
Disposition: Backport from https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
ChangeID: 58492f950164e75954a97cf084df6f9af3d88244
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../lz4/files/CVE-2021-3520.patch             | 27 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.2.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2021-3520.patch b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
new file mode 100644
index 0000000000..5ac8f6691f
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
@@ -0,0 +1,27 @@
+From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
+From: Jasper Lievisse Adriaanse <j@jasper.la>
+Date: Fri, 26 Feb 2021 15:21:20 +0100
+Subject: [PATCH] Fix potential memory corruption with negative memmove() size
+
+Upstream-Status: Backport
+https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
+CVE: CVE-2021-3520
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/lz4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/lib/lz4.c
+===================================================================
+--- git.orig/lib/lz4.c
++++ git/lib/lz4.c
+@@ -1665,7 +1665,7 @@ LZ4_decompress_generic(
+                  const size_t dictSize         /* note : = 0 if noDict */
+                  )
+ {
+-    if (src == NULL) { return -1; }
++    if ((src == NULL) || (outputSize < 0)) { return -1; }
+ 
+     {   const BYTE* ip = (const BYTE*) src;
+         const BYTE* const iend = ip + srcSize;
diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 20719fcc58..546bed39b0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -14,6 +14,7 @@ SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
            file://run-ptest \
+           file://CVE-2021-3520.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-- 
2.25.1

