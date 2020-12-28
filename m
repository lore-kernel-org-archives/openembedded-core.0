Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.2380.1609185888277603318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QGd3wgA7;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id g20so15622918ejb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=47YP+prhEfGdDReaIEvcQqdbNTFoBY+YGxPgrwsh3C8=;
        b=QGd3wgA7qi63eeoJcFSn86z3NA0sa0EYcfiywY2F1nA67dFvaOJDjrIyudU64cqwRj
         KP/kJQihLXvliTY4Si1icoSc4ROqT8QHGAPKYUXqdMzSyh5NdtZwadcHDwa9EE7ARUk9
         oLSB2nAR9GJ019399/R2PwYoRWxIsrMRWHycp+gV+neYgqaV/tNJGCUpqDA3tEmdn/1z
         TCl4UeEMB/d+2FEAeMohrar4TKaNjKSxmN8BC3/hh7PB6X1MZr5mHLEe5LU/XrNoMjhU
         cyJLkHM6d9Je6t7ZdYIc6toH3A32R30gZj5UlG+PbD1rwVYV1yXyA6rwx4tBESVyf1un
         Hzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=47YP+prhEfGdDReaIEvcQqdbNTFoBY+YGxPgrwsh3C8=;
        b=i095bzsOZQKPu6X8jJ9Dh/gh1zbsEeEjkCu0/53SZ89AF4ffjDcsBSkwhAlSs6qOjD
         8CXslmhqajGblrfzmzIYb3owsqZ555enhkGtA4uQTbspHyFnFTz3EaMsEjyonjpGdxag
         eHwjyAZ2DUztT1S3R1tvGegwrE9GYehe8WIXBKcAnhvAT/09SWsgEfx4yqzANoE1yTwr
         LdTYAVO9u4aHcmtXx5KB50IWekhiDi8GBL1643oCn8YzIcilF9rMm9WnuA6KmFydCAtc
         +Oh2WEB57pKMuOkxE0PoVmjJcfmY4pqPUIopY2eYEmE6QHm8HOQlBofYhuAeFYlTDKuD
         WEAw==
X-Gm-Message-State: AOAM530sGscTiLM7xI4PQec7WYQGaSSgzWTGNfrZTUlny3k96fpUnbzG
	1uxKDsmhSW76Jg5+kUAuQoLpVcJWD+A=
X-Google-Smtp-Source: ABdhPJzO3ZV0MPSsWhadcwCKvZmzpKhiC4rC3C1PnpseCFWp1wamCVR77hpZiAfQrdpU+6PV55yaew==
X-Received: by 2002:a17:906:3ac3:: with SMTP id z3mr12728263ejd.449.1609185886913;
        Mon, 28 Dec 2020 12:04:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/22] gnutls: update 3.6.15 -> 3.7.0
Date: Mon, 28 Dec 2020 21:04:20 +0100
Message-Id: <20201228200436.78130-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gnutls/gnutls/arm_eabi.patch | 15 +++++++++++++--
 .../gnutls/{gnutls_3.6.15.bb => gnutls_3.7.0.bb}  |  2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.15.bb => gnutls_3.7.0.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
index 34c8985c19..6eb1edbdb1 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -1,3 +1,8 @@
+From 8a5c96057cf305bbeac0d6e0e59ee24fbb9497fe Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Wed, 25 Jan 2017 13:52:59 -0800
+Subject: [PATCH] gnutls: account for ARM_EABI
+
 Certain syscall's are not availabe for arm-eabi, so we eliminate
 reference to them.
 
@@ -5,12 +10,18 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
+---
+ tests/seccomp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/seccomp.c b/tests/seccomp.c
+index ed14d00..3c5b726 100644
 --- a/tests/seccomp.c
 +++ b/tests/seccomp.c
-@@ -49,7 +49,9 @@ int disable_system_calls(void)
- 	}
+@@ -53,7 +53,9 @@ int disable_system_calls(void)
  
  	ADD_SYSCALL(nanosleep, 0);
+ 	ADD_SYSCALL(clock_nanosleep, 0);
 +#if ! defined(__ARM_EABI__)
  	ADD_SYSCALL(time, 0);
 +#endif
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.15.bb b/meta/recipes-support/gnutls/gnutls_3.7.0.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.6.15.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.0.bb
index b936db50d1..e3ca86b933 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.15.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "0ea8c3283de8d8335d7ae338ef27c53a916f15f382753b174c18b45ffd481558"
+SRC_URI[sha256sum] = "49e2a22691d252c9f24a9829b293a8f359095bc5a818351f05f1c0a5188a1df8"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.29.2

