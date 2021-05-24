Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.20860.1621847660256114201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DHenBy+R;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id n2so40658996ejy.7
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3v10W2UGlHzShmqj79/1Epao95kVhj8wndk0EHQQcdM=;
        b=DHenBy+Rfj7aNazpPudXowneGflrnx/CZ50ZUfAPS2Tp2lCeTgu2Cw/z16UeAEzCKQ
         PEKhboOkjAiI+eHVOhusctzb+v9/UvkHJqP8hEu14+1gL1gEA8HYCxmERTIDbdZI+N1f
         qdkW5u52H5ns4bYQy2Wh0ZDh1XatXUvlNGfXUaRZ4Px/s/z0LPOEAPD5hvjR/ig4pDuo
         JljyvTmIsPWX/7aCpI1rcn5APtSPYZiQFF5N89872szmO3SzScsovoinSQRVh2eO8GLK
         FUXU8Ant8dw2T1Q4niQvwUj+mP9kTZ1IwLiNx4wRn1w1ck30Hd8aCqMSYVi9WvX5cOlS
         7Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3v10W2UGlHzShmqj79/1Epao95kVhj8wndk0EHQQcdM=;
        b=rG6HD6Mrye1ckdzK3A3qVNiHxPgKytFzz/lLOPP00VeENPtbNXv7LkxPUH7yVktZ3u
         NTDjj3sG9JOdDvRH6VODado1MmQ50laNYyLw/NtuZa8SGCTw/YEqw1H33fwvS+39VT+c
         1xPmTonNxGKmVlFGD34KqNLGLX8cdK74VpUiYytPkc5lW/Rs1vlgSsBFiwdDHCnWDRm3
         tu3g4eQNH9uYzM4Re1hpjhcDdWWnrT821d03PhXrkOe9ZyCq8fPAUgFNhceZH9KRVlSS
         n+gxLSGttLmqhgldVaHu8chv4EFRdvQgyq7V+RrS80BthZPe7LlrjyhlUUNHEr5TBSy0
         FIDQ==
X-Gm-Message-State: AOAM533Z2H3mp6trasZoExu8lkn1yUrWmZD2ZDdiYgS10hgWm9eKNtcG
	4M5JQq7xQ1lmmtIGIqi74prI+CPiU5I=
X-Google-Smtp-Source: ABdhPJxGTvVgG9fJZJ6z4OZ+ZgSZ4noUk0nSPPFkpcwIwGsfTNkxJiZuXKedso2oaK0B7pOsZZ5yRA==
X-Received: by 2002:a17:906:e0d0:: with SMTP id gl16mr22642045ejb.509.1621847658911;
        Mon, 24 May 2021 02:14:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/21] systemtap: update 4.4 -> 4.5
Date: Mon, 24 May 2021 11:13:47 +0200
Message-Id: <20210524091347.419253-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-transport-protect-include-and-callsite-with-same-con.patch
as upstream made the same change:
https://sourceware.org/git/?p=systemtap.git;a=commitdiff;h=0d80048e02ecf6876c9f9ebeea387af9fb2a8051

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-include-and-callsite-with-same-con.patch | 44 -------------------
 .../systemtap/systemtap_git.inc               |  5 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch b/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch
deleted file mode 100644
index efc79f6c0f..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From cbf27cd54071f788231e69d96dbaad563f1010d4 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Fri, 18 Dec 2020 13:15:08 -0500
-Subject: [PATCH] transport: protect include and callsite with same conditional
-
-transport.c has the following code block:
-
-  if (!debugfs_p && security_locked_down (LOCKDOWN_DEBUGFS))
-
-Which is protected by the conditional STAPCONF_LOCKDOWN_DEBUGFS.
-
-linux/security.h provides the definition of LOCKDOWN_DEBUGFS, and
-must be included or we have a compilation issue.
-
-The include of security.h is protected by #ifdef CONFIG_SECURITY_LOCKDOWN_LSM,
-which means that in some configurations we can get out of sync with
-the include and the callsite.
-
-If we protect the include and the callsite with the same #ifdef, we can
-be sure that they will be consistent.
-
-Upstream-status: Inappropriate (kernel-devsrc specific)
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- runtime/transport/transport.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/runtime/transport/transport.c b/runtime/transport/transport.c
-index bb4a98bd3..88e20ea28 100644
---- a/runtime/transport/transport.c
-+++ b/runtime/transport/transport.c
-@@ -21,7 +21,7 @@
- #include <linux/namei.h>
- #include <linux/delay.h>
- #include <linux/mutex.h>
--#ifdef CONFIG_SECURITY_LOCKDOWN_LSM
-+#ifdef STAPCONF_LOCKDOWN_DEBUGFS
- #include <linux/security.h>
- #endif
- #include "../uidgid_compatibility.h"
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 016b423847..23ecc61987 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,12 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "988f439af39a359b4387963ca4633649866d8275"
-PV = "4.4"
+SRCREV = "0eba8a46bc99c66e5dd274a9a4d661fe08ac4b8a"
+PV = "4.5"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-transport-protect-include-and-callsite-with-same-con.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.31.1

