Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B0CC3600E
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.44215.1742834028370614087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UML5C52b;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224100e9a5cso88983125ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834028; x=1743438828; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU9EGrZMECHPiMp4Lw2CzdSffighwIfozvIGbvbOA2g=;
        b=UML5C52b8hugieqh6CTH/JDk0aWa5dQ+ndaqCOMizDyVnfJkcYhWqvDqyn8Patpjej
         Ceq2WtrZZZtGWAsGQUwHCvGJbavfRjF9AXWB8+yI1h/rLW1/hOYDBWS9JvEjMW19sXTr
         acbMVGTU+K37Iz2f84JxEDVWqqtMD/w3sb0x8W7+VRcOovvGlXOAjMqpn6npI3K7xETY
         F47tXrBo/GNeVdvWgyf4MDPF4mjYGQzJXp19wcysl5EU+R23Q5z4w1VIZnFsop6HOgFa
         bmXbXTIQpvvxuPCS2fYUTrYPNIJmxWgjqC5U3DVRRVg50cTV36k+cVsetDUPkdGwG3Hh
         ZlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834028; x=1743438828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU9EGrZMECHPiMp4Lw2CzdSffighwIfozvIGbvbOA2g=;
        b=AAuT5XNSn8BlKfbNXdmHL15mvI6Evso/csRL9Smf5d9+hYssIBASaNtfSQsSxYI9DD
         BtnzyZkdNh50TziYprEkQsLIsvFVg89gJypEnsmlkIWvfOeYW6VmUUwAzJf6QTFq2Kha
         9lXyskRyExAQEQQ6Ct+EYpTi4E23V0U6as4JjiNr+rVh4xk5Njd8WqKQCss/vXJbFwmq
         DTa6kteS+Wsj1b2AA6SgeK5tUwFojITjMDhVnRTp8FoOJtJ5JCGvgvSrwcr0C+dBkjp/
         cdW7KIItV1mf0bGyFX8u9VioXXxz8uttSAV/5LLGIshlmDkJ/u2Jm8pf/GG6mDL9ZHzx
         tslg==
X-Gm-Message-State: AOJu0YynRMkfk6WhcFRAXnRjqPP6cJhthVnkbvyRstcOmFx0zT4G0kMo
	EZxdfEibIysf3Bgd/5T1H+XhyyFAJ0FmdxvFV+KMUz0w7sl8FeOl9kvxQ3uN
X-Gm-Gg: ASbGncu9gN9GoWwAvkg9S0GpG9lHAGetcwHbmzb7+oYZZn1A/jRj4kcFg0m8RmMh2wN
	MN6gfiEEJy7V0p+st5+LGgVj5sJSgPXt/KwcOSQ6WWXX4IP8G9RGokSFY8Mk8qUgui60tG6VBDn
	5QpvVvUTzlXBy9TYiJ6zlD7HDhLL2k2EdEtFsZEEk1XJX45EZqyctcfRJHEiVNHptOX99QK8bG2
	8MFLVssecMWEyPIAbQyI7MKAKZWVAFl580/fWPZUgI1nJZQYglQZtqnin7y6C4pcP0eAPiz0cZU
	RNkoMeTAIxSfXmTYjiPLtgG5Xv5lz6QbCGRAHRgeHghY7dw=
X-Google-Smtp-Source: AGHT+IH3YBodze7ZQizFqtrlGo98n2Mc9mdegZaL8aAunUcO72pmpi9O23OJqYWFDXZFo56IUQbC+Q==
X-Received: by 2002:a05:6a21:3393:b0:1f5:8748:76cc with SMTP id adf61e73a8af0-1fe43010117mr24265367637.31.1742834027394;
        Mon, 24 Mar 2025 09:33:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:27 -0700
Subject: [PATCH 06/21] gawk: Fix build with gcc-15 on musl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-6-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213538

getopt signature needs to include parameters or else gcc-15 complains

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...arameter-signatures-for-getenv-and-getopt.patch | 54 ++++++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.1.bb           |  1 +
 2 files changed, 55 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch b/meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch
new file mode 100644
index 0000000000000000000000000000000000000000..7ed615a8812d6d6fe1a2782e148c4672696b4d92
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-Add-parameter-signatures-for-getenv-and-getopt.patch
@@ -0,0 +1,54 @@
+From 4a8352eeaa99bbea3461696855c973447e87abdd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 15:14:16 -0700
+Subject: [PATCH] Add parameter signatures for getenv() and getopt()
+
+GCC-15 complains about it when building for musl C library
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gawk/2025-03/msg00027.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ missing_d/fnmatch.c | 2 +-
+ support/getopt.c    | 2 +-
+ support/getopt.h    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/missing_d/fnmatch.c b/missing_d/fnmatch.c
+index ccb7e34..7f97fbf 100644
+--- a/missing_d/fnmatch.c
++++ b/missing_d/fnmatch.c
+@@ -121,7 +121,7 @@ USA.  */
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ # endif
+ 
+ # ifndef errno
+diff --git a/support/getopt.c b/support/getopt.c
+index eeb71ba..e7ebd19 100644
+--- a/support/getopt.c
++++ b/support/getopt.c
+@@ -152,7 +152,7 @@ static struct _getopt_data getopt_data;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ #endif
+ 
+ #endif /* not __GNU_LIBRARY__ */
+diff --git a/support/getopt.h b/support/getopt.h
+index 8393569..06482cf 100644
+--- a/support/getopt.h
++++ b/support/getopt.h
+@@ -181,7 +181,7 @@ extern int __posix_getopt (int ___argc, char *const *___argv,
+ #  endif
+ # endif
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int,  char * const*, const char *);
+ #endif /* __GNU_LIBRARY__ */
+ 
+ #ifndef __need_getopt
diff --git a/meta/recipes-extended/gawk/gawk_5.3.1.bb b/meta/recipes-extended/gawk/gawk_5.3.1.bb
index 724b561c93f38e1dc4f50a9dc706e9c06ed685de..1fe2f2b2a79422c45cf746836e5a135695474cfb 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
+           file://0001-Add-parameter-signatures-for-getenv-and-getopt.patch \
            "
 
 SRC_URI[sha256sum] = "fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c67651185bb49c38a7f9382b1e"

-- 
2.49.0


