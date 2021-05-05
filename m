Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.9781.1620227948757490588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jaZn1bVa;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id m12so3488175eja.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E9n2tqJL6dv+JaiEU18rleQK6Bbcxvb0xQ2CgHisZtw=;
        b=jaZn1bVaKcsWMcaaC1Wo3iOHf9u/LtzVmag269lgZeQgsnTRoZ4RCbHmDmfgIFadBD
         HtHlrP5ej/Xo8le4MY+Rvo1rvhoV/BuXraKPo0MpLzuoFXj42T/GDmKEmcvs+ReL/OLg
         78aA8qb/OgQUdOFHOwFYn38TOnU5nHx8AD5cCM9yMjiGbaltx/n6CG6kbJtWDrKdJre/
         ASAYfcPDHWDBD7uB22mFZ69WhgUmUuAeZasg2pP5do9+KBDpAEs7w4UAwGfbfHxxvTqt
         eBFKMDVfcWAy3ETIwR0G0ommuA5jkYwfmiCPDSTY9Q0jlFvzEZMsjmtqhjW08wUW6jJj
         i5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9n2tqJL6dv+JaiEU18rleQK6Bbcxvb0xQ2CgHisZtw=;
        b=mfNe5sjxWY4/Acrgqg51lkXsLtSi6Q/kO86om5DTG4U918MNyx7CPFWR+DcIBfciAA
         XxUxf/EqFCVRpdY2wpzW6nvNVEgjK2AuzhUtfcpLDcBNktRiH62w+T14/+PTiTw5vuj4
         1Tb6oQ9HlROmLCypYYojhZCZVBetMAN9635SLUtnXCh475vjI3bPoLxP/hLYwztjfseK
         Jv7Dc5BHS53GvewAA1pHUR6yLiu82uVmG+wYEypXxAKORk42+SIm1hHg2tUcG+Gn+17L
         vJjNuUztpmFP0sWWKk7Xfy7h6bP92Aff45D8B2KA73ti6aAk9KcrEgw8MRif94iOUYK3
         b37A==
X-Gm-Message-State: AOAM532y/ZPvymCKS4loalt8qPvXCugyVBKe7qNedL67DfN5Zat0xU+D
	2tlGSw+7p542mMtghKoPMNAhd5pxFXUGTw==
X-Google-Smtp-Source: ABdhPJwnATJHEBJRg/p2Gwjt+02L0L0ajdbxgEeRT5j+bGmxWvEHdsP6Q+NWAvlR6Qo/s9VXtRp2FQ==
X-Received: by 2002:a17:906:4cc5:: with SMTP id q5mr28095465ejt.302.1620227947372;
        Wed, 05 May 2021 08:19:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/61] libdnf: upgrade 0.58.0 -> 0.62.0
Date: Wed,  5 May 2021 17:18:03 +0200
Message-Id: <20210505151850.660512-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...h-avoid-the-use-of-non-portable-__WORD.patch | 17 ++++++++++-------
 .../{libdnf_0.58.0.bb => libdnf_0.62.0.bb}      |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.58.0.bb => libdnf_0.62.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
index f8d256e011..b740521fda 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
@@ -1,23 +1,26 @@
-From 8aa5402393fabaf4fff51be3af4868e8dfab6da7 Mon Sep 17 00:00:00 2001
+From fc0b81bb717db3f41513f09f6661676a7aea6dd4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 9 Mar 2021 19:30:42 +0000
 Subject: [PATCH] libdnf/config.h: avoid the use of non-portable __WORDSIZE
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1159]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- libdnf/config.h | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
+ libdnf/config.h | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
 
 diff --git a/libdnf/config.h b/libdnf/config.h
-index 16121f6f..2925923e 100644
+index 01b330b4..dbd53f5e 100644
 --- a/libdnf/config.h
 +++ b/libdnf/config.h
-@@ -18,12 +18,10 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
+@@ -20,14 +20,11 @@
  
+ #ifdef __APPLE__
+ #include <stdint.h>
+-#else
 -#include <bits/wordsize.h>
+ #endif
 +#include <limits.h>
  
 -#if __WORDSIZE == 32
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
index dbe68d5a15..e2c2c41c6a 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
            "
 
-SRCREV = "85278894f21bc1957dc47a2a09ddacf59bc3cda8"
+SRCREV = "9a0e17562b19586b3ffa70fa93eb961b558794c7"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

