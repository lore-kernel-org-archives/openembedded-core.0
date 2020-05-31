Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.17647.1590940446333750758
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i33Rzlm2;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id o15so6834996ejm.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q9/oxrjMCFdSo0PpaLITSEw5biFz32rp+EBc/d+VhYo=;
        b=i33Rzlm2L6ir0H414LCpyzkp2vOvb/B6egUhiwLzjW/E29gjc/ZVuCVQxi5u5hGlpE
         DeimE2Jak0bAjzr8qaFVBL74axcbVDafZlgACKOmA2t5VuT6vIDWoInEUB77AutzW6OI
         r6AIOSZqhwzOz6yv06c4ovOEATMjupY0iQ8toL8roc4MlAhvkay57Ay+1/t8jkX1yHQA
         Zjsr+3Nt5B+m3isKr6ekaaZ//cZCEFiC7nf++FfS0DuHGBI2w+2PSyspCOqYr/2JC3J4
         nd40qWdjxCOTgD4Snox+wRdvNFJr+uppG0O0ba61TsMh+weK+L1GsJWvLvNAps2ZPCj6
         knng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q9/oxrjMCFdSo0PpaLITSEw5biFz32rp+EBc/d+VhYo=;
        b=tjsHkTXvUCb0va8Ia9s4symQDHt7WGZSjWXe+uPOl0k2/uz8YJF23AnY1wCP9tCOIP
         YdoVNvwkDfix105f0sFtCT2k/beF+73FhjXDW8TNnQRM/3GlOU7QN0nDg+xr10ZXHbsD
         EI3kTEgJKghhJljH7bJ/evRntn8g6Lu1gCjEmbj159fSmdmXrX0Xv6LCq8PYBqJnORsI
         Toy/I4XLSk1DN1qc+ZSnXh46B6yylrHdXelvYMyRFQEZjd2Phd0BhkwYQGgvsmebAzID
         7u7w2ZVJj5LyfJzt32y9dmv59Lbg/Pb1f0dWSNTeQthTIbPp0wu8pKHotydnBDykhFhv
         ajNw==
X-Gm-Message-State: AOAM5326Yp0zgg0f2QgQYcohvAgCcpOAptFqMBiND3EKJXzot2o+/ahk
	hDBysPzm38k3gUD5VBqKSmbUCGwv
X-Google-Smtp-Source: ABdhPJygUTxYGe3QzPBSWKYnXbDTgwVlt6/Ukm3hFAzzW8oCGs8dLBPQuPxcUvzLW+pLjbS6ujgU5g==
X-Received: by 2002:a17:906:868f:: with SMTP id g15mr15634522ejx.208.1590940444630;
        Sun, 31 May 2020 08:54:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 43/70] libcap: upgrade 2.33 -> 2.34
Date: Sun, 31 May 2020 17:52:27 +0200
Message-Id: <20200531155254.10283-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...hread_yield-with-standard-sched_yiel.patch | 24 -------------------
 .../libcap/{libcap_2.33.bb => libcap_2.34.bb} |  7 +++---
 2 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
 rename meta/recipes-support/libcap/{libcap_2.33.bb => libcap_2.34.bb} (86%)

diff --git a/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch b/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
deleted file mode 100644
index 848ceb2c0c..0000000000
--- a/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a2c4cdb05d0e382101b13944c09c4375e8d7de5f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 31 Mar 2020 13:39:28 +0200
-Subject: [PATCH] psx.c: replace pthread_yield() with standard sched_yield()
-
-This was causing failures when building with musl C library in
-particular.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
-diff --git a/libcap/psx.c b/libcap/psx.c
-index 04d250f..7e4ac10 100644
---- a/libcap/psx.c
-+++ b/libcap/psx.c
-@@ -533,7 +533,7 @@ long int __psx_syscall(long int syscall_nr, ...) {
- 	if (!waiting) {
- 	    break;
- 	}
--	pthread_yield();
-+	sched_yield();
-     }
- 
-     errno = restore_errno;
diff --git a/meta/recipes-support/libcap/libcap_2.33.bb b/meta/recipes-support/libcap/libcap_2.34.bb
similarity index 86%
rename from meta/recipes-support/libcap/libcap_2.33.bb
rename to meta/recipes-support/libcap/libcap_2.34.bb
index bec492ca5f..a3bd969d2b 100644
--- a/meta/recipes-support/libcap/libcap_2.33.bb
+++ b/meta/recipes-support/libcap/libcap_2.34.bb
@@ -11,10 +11,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
-           file://0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch \
            "
-SRC_URI[md5sum] = "dcc6220b4a9bf260050b20c07edcddf4"
-SRC_URI[sha256sum] = "08edeaba2757021aeec45c4eeec52566675e0e0f5d4f057284d729e04f2643d6"
+SRC_URI[md5sum] = "66028a8080a0891c54b202bb5e749035"
+SRC_URI[sha256sum] = "aecdd42015955068d3d94b7caa9590fcb2de5df53ce53c61a21b912bfc0b1611"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
@@ -26,7 +25,7 @@ do_configure() {
 	# libcap uses := for compilers, fortunately, it gives us a hint
 	# on what should be replaced with ?=
 	sed -e 's,:=,?=,g' -i Make.Rules
-	sed -e 's,^BUILD_CFLAGS ?= $(.*CFLAGS),BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
+	sed -e 's,^BUILD_CFLAGS ?= ,BUILD_CFLAGS := $(BUILD_CFLAGS) ,' -i Make.Rules
 }
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-- 
2.26.2

