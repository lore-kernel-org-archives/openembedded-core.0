Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7709AC36002
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4280.1742272745565887025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nec3Mewf;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2235189adaeso87915525ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272745; x=1742877545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=Nec3MewfH0l9lrs1Jm8r0Rmm7weQnncwTv74sDzMPnhOdgtjIFEnlHIXL3EWP33Owa
         r/Z5F6+ESmlKrNzK1ddVCQpkT4OyUcEe1mNKbQtr3nnCrzX4OrPlyjvinmg6q/t3eubE
         NkOJGh7AZmE9Oc/NpdEVqphSUOzrJvqmKfqQqn8M9vunCaL3Z+EboZOwHfBL3d2hY69s
         6igqyC0gq5K+lCv81hHDTWeOLM2G8EkAO8neEc9oGBM1pegPT7KS3ysN12MCha7/yUa8
         cBiBst1S/QI0IXy65NNaQ8zQ8vuzl3K4rYRfDeFIk41np7XBmcGJyru1mfCESo7tcCvH
         YshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272745; x=1742877545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=YuupG6QJr3F/X9IHBsC0liFYqWiZz3Nf0svPTA40uVjwpcSQ0H9lr9bMg0boCX6QFv
         pev6snp8tnCD5JTxk/cF7BqS77El6mA9xk1DTSIEl+S8rs8w5Eqy9S4Ny/WChf9A8rlo
         WbdIcA93/+1MLFSoW4ssMqaKiqCTZHX21yeELF5g+WFkBXzSY9EY2sOg4JRBGrDAlyqJ
         pSoQS97c3/Z5aVL0r1qwzTHw8MXcxKomQrL5s12/5zllz+R21qeL2CEQ0bN+EiPJdAcB
         8VFAq9WiEsPKp2NKt4hlpOXPTAhBMm34/748bYzOWv3d35pQ/F3jmGwkpWFgrqHNdLxI
         X6EA==
X-Gm-Message-State: AOJu0YyIB/8ucs57hl3G2Tg1tM+wC6MFaizkoBgNoxqWAJc+6VO6ESlu
	yds3T//SA7GK99aERC7jgL3K6BnEF9em16qZIekU6UzRQGpImPr3bZB5SDjf
X-Gm-Gg: ASbGncv7ZVYPVY/z/aaVLb1s5Lf9venWhlBs1JQ3EIRPrM/9VE8gaQyICqK3XnALoQ8
	/WQUo4VNkvibhLlDs34TeK9/vJz133NssjFwNqwILpd0uaSD4MapbsDtg7FiVQeOuB9tGRgk2ZX
	ee/IXSqRZyIjOZW6+0lThKmcXHCB90GzqOPG6XP56qE0pR9b0czehYzcS/MSVKuhO2yML9hy0DG
	K3XMdSv0jddvHYQ4O5XES8YpfTBuZx+NkffPH3IGD5mMgsZv2qJfabP5LwB4jLMolFZ5GVTTgBl
	k9Rf/Cdn1KxugeeFSes7J2zs2xwSnvUmONmnWem8Xj3NLM8=
X-Google-Smtp-Source: AGHT+IHKkwXezqXyNAz6Nc2ZVQqVF02V6L4g9J3y9OdIgzhvzkeJntniO6f+eHdJcwXwe4WeLFj1sg==
X-Received: by 2002:a17:902:d58d:b0:21f:6d63:6f4f with SMTP id d9443c01a7336-2262c97e7d1mr28533185ad.2.1742272744685;
        Mon, 17 Mar 2025 21:39:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 17/24] unzip: Fix build with GCC-15
Date: Mon, 17 Mar 2025 21:38:37 -0700
Message-ID: <20250318043846.2422141-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213151

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 00000000000..42a2f81681e
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,17 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Sign-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008ea..0a88b4c092b 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 

