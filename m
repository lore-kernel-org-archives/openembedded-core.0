Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.7683.1614526645541666096
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HVUoCZNH;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id mj10so3426418ejb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JzBvEpp18dILpv2WCgb5N5ytsX8M9GI25RJ+8fPohe4=;
        b=HVUoCZNHRx7XRn1W4kHeiiWjZd9chr9aWdKmhlGqErjfh/Lp0+Xa6IgEhmhNM7Vwdw
         FYkYpHr3lF+MFMNpra3cwhwZSkGB0bYZuVjcE4XDaUwTMLddkwTLcXXaJMAxV9+m6zRW
         /fnmtgzn85zNyiULVAqf1fiPNuGMGzjVgnqd6yY7mqBvVCavJN1FAZdOahv3CT8oPK6M
         Pfa2t7sPHbp9r3xsPztkwK0gCvTFlX6Vro6vurVoENrq6mO+2kbusyvv8jb6HCu7QKgf
         JvQI17viNdmPup2Pe4oJfO14z3QDu70quH9BpqaP+/O4V4/Nx+px2WzcaHIIRMDcJisE
         LkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JzBvEpp18dILpv2WCgb5N5ytsX8M9GI25RJ+8fPohe4=;
        b=QP1IxF10ujXD1FX76Rsr6JhAkwbdhod+SlX/WwKtp1OoA0MGJYwb9Yb8B6T4h/Cpnm
         BskXNr/bvxCIlYukZIa+lFZpWf6DhfD/Qc4ZxLg9He3FFJLePEuLnfSFs0QiRkztU2tL
         jj7a711czkNjXHxm9s89HqfD0/7sY/0t3obZMKeTiLzTE2Pt13Li3zhvYsN7aV7u8l8t
         wgqQVK6VvBaJrHy7FI7jcyhEoL4QnKYerX8pzzEdfPvzVn8XAQ+2yiNPT4TnoHdSDDEJ
         3JtPd951ur8/MZoilflF1jBCmBnxXVxLKNwhjGT2rzyGaI55ErJhcyArm3s8B2hBVbOw
         XA+w==
X-Gm-Message-State: AOAM5323GGGDHIbIWGOGE/f9qhIP8SVVstyw5RLwbdynARwT9Gy26SEZ
	WyLXIt5ittSt8D6nwrhnR06Or92If8a67g==
X-Google-Smtp-Source: ABdhPJyQNiRLym3dP15SSgeIZTua4gJikaYGlkRoQAQXvJ+vEURNzCjDhs98bAP4c0/vUwKsPbiVfw==
X-Received: by 2002:a17:906:ad4:: with SMTP id z20mr4932356ejf.496.1614526644157;
        Sun, 28 Feb 2021 07:37:24 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:23 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/24] procps: update 3.3.16 -> 3.3.17
Date: Sun, 28 Feb 2021 16:36:56 +0100
Message-Id: <20210228153702.498275-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../procps/0001-w.c-correct-musl-builds.patch | 44 +++++++++++++++++++
 ...02-proc-escape.c-add-missing-include.patch | 23 ++++++++++
 .../{procps_3.3.16.bb => procps_3.3.17.bb}    |  4 +-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
 create mode 100644 meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
 rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb} (94%)

diff --git a/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
new file mode 100644
index 0000000000..c92ad28e4f
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
@@ -0,0 +1,44 @@
+From 22f8d25567b8d64bdbab0fb0b4915b4362561d9b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 24 Feb 2021 21:14:31 +0000
+Subject: [PATCH] w.c: correct musl builds
+
+No need to redefine UT_ stuff to something that does not exist.
+
+UT_ is already provided in musl but via utmp.h header, so include
+it always.
+
+Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ w.c | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/w.c b/w.c
+index 9d07ac9..d10639b 100644
+--- a/w.c
++++ b/w.c
+@@ -57,9 +57,8 @@
+ #include <unistd.h>
+ #ifdef HAVE_UTMPX_H
+ #	include <utmpx.h>
+-#else
+-#	include <utmp.h>
+ #endif
++#include <utmp.h>
+ #include <arpa/inet.h>
+ 
+ static int ignoreuser = 0;	/* for '-u' */
+@@ -72,12 +71,6 @@ typedef struct utmpx utmp_t;
+ typedef struct utmp utmp_t;
+ #endif
+ 
+-#if !defined(UT_HOSTSIZE) || defined(__UT_HOSTSIZE)
+-#	define UT_HOSTSIZE __UT_HOSTSIZE
+-#	define UT_LINESIZE __UT_LINESIZE
+-#	define UT_NAMESIZE __UT_NAMESIZE
+-#endif
+-
+ #ifdef W_SHOWFROM
+ # define FROM_STRING "on"
+ #else
diff --git a/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch b/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
new file mode 100644
index 0000000000..5fa1ac9d78
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
@@ -0,0 +1,23 @@
+From 4f964821398dff7ab21fec63da15e1e00b2e9277 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 24 Feb 2021 21:16:14 +0000
+Subject: [PATCH] proc/escape.c: add missing include
+
+Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ proc/escape.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/proc/escape.c b/proc/escape.c
+index 2e8fb7d..e1f4612 100644
+--- a/proc/escape.c
++++ b/proc/escape.c
+@@ -21,6 +21,7 @@
+ #include <sys/types.h>
+ #include <string.h>
+ #include <limits.h>
++#include <langinfo.h>
+ #include "procps.h"
+ #include "escape.h"
+ #include "readproc.h"
diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
similarity index 94%
rename from meta/recipes-extended/procps/procps_3.3.16.bb
rename to meta/recipes-extended/procps/procps_3.3.17.bb
index ef3ac86e97..c74a901d9a 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -14,8 +14,10 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
            file://sysctl.conf \
+           file://0001-w.c-correct-musl-builds.patch \
+           file://0002-proc-escape.c-add-missing-include.patch \
            "
-SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
+SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

