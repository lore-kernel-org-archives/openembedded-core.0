Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C59C369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 17:33:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.14844.1744911215588191613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 10:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FB8gI3Tg;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2279915e06eso13814425ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744911215; x=1745516015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzpEz3/uM8vkYUPavjriJy06u9QZo0mEOskBSx2QKIk=;
        b=FB8gI3TgkLXYqQexwiilxvI1omt7NkOmMFyIfzqx776vPX4ldVjhExD/y5pDjAb+68
         Jgc6GKQ6dFzs0/DtnNyhidyzKFw8jJxLvbYm2N//t3HRwiN3v5XxAlD38COh46DWpV5B
         1G+HGhLxrpAgfS9TubXnZ/iwagkr8MO4vAbxhF/mkBT9yBNSqa37DkXPRjzfKVjngG4H
         nAm+/e4DtFTYaRyxPWh0T8/dAHP5YxfEBNIMBGGJbMBXYuvDIcLQCZKEy5voLKVa6k9K
         64jCLkDxzf047wgJ/tGt9YtoqO9baXH6M5h2sp1DCROkVsJs4ujUVb6WjswVcHnH/Gix
         ERtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744911215; x=1745516015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzpEz3/uM8vkYUPavjriJy06u9QZo0mEOskBSx2QKIk=;
        b=u404Y5N67/xnqQaYB7mXLPrHJ4cZhcjyOQ8Y4k4RwnwLPJna0qm+/W7A4QLZ7fN/Sq
         8gJmCNwdwUmA/nyXBUHrAEODj/8gIpsXvaQ7pS/85NS0YnUfwydB8NsClxbBn796ytBM
         84kl0c6xUQsOZkzwqInJMTjjkF8p7Mtvc6yjDj1xAdVgGd3a7YZTXdPJUQvg4E1Guy9C
         gbBEGqdDkApNMoBGh1PnZmtsttWEER3gFxH7pxrYHKoq/3qbhbmH8zQ89ybEvGVGMZpS
         rdQwu7AuBeUxQ1qKwZb+uV6aC8VqtIJ5TQbf/YY3PUvTlKK2Zq9ZJC8rBu+4Ey44v+cz
         wtTw==
X-Gm-Message-State: AOJu0YxctzrYMHpPgSz/bIo8liPs4bpkDlUmY0JiE+A8LHnwYi35GUhY
	uv+C2JzJY12N9/AkyxJyN6hDRUJE5DjzktFYo3xjoE2lr+FsIAdnsIWXzpp2
X-Gm-Gg: ASbGncuj1dwGrWkLfgwM2qwx1AJtiMZh6yWhmfwURbA7pVCu52vjrzRVNY4lwtwa2wv
	S/dfaUqBOK8Z/qMLEgzLWrSSXSiSip2dA/YtUwmJC62zSpmzCVUY3hVqJQ/x4r16QtnzqA1rXU3
	s9eLDqwf5Pvx6DXFpZZ7Y9B7cQloDcFTXyXQsTernXpn2s42W3ypbGyOGgMsZ5A2jGHoqoclB0Y
	+3Fz70wF920vt02P5W4fDJO+y5pbqqfJZ9q9bDzzJWi1jqi48Fw2lJHmVoV7uTZqHyYQUc3wQnE
	3rS4RR1Z/me9D/gk4WaVUqt54fIL5Ius
X-Google-Smtp-Source: AGHT+IGJGZ4Z5TWliansnrTHstSYMuqN1yEsZrfZ+aC8690A9OSqILA2h39fBwta0LJC5Lw+jMaYqw==
X-Received: by 2002:a17:903:1a0d:b0:220:d909:1734 with SMTP id d9443c01a7336-22c358d9f8emr110849325ad.14.1744911214719;
        Thu, 17 Apr 2025 10:33:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ece2f8sm2550245ad.189.2025.04.17.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 10:33:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] glibc: Forward -ffile-prefix-map option to assembler flags
Date: Thu, 17 Apr 2025 10:33:31 -0700
Message-ID: <20250417173332.554656-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215106

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch | 24 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
new file mode 100644
index 00000000000..862c7b9086e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -0,0 +1,24 @@
+From 603e50d6b8ccadb32d59b0497f76629665c1794b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Apr 2025 19:51:01 -0700
+Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2025-April/165969.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makeconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makeconfig b/Makeconfig
+index e35c5cfe4e..7a19c731c6 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -1176,7 +1176,7 @@ endif
+ 
+ # The assembler can generate debug information too.
+ ifndef ASFLAGS
+-ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
++ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
+ endif
+ override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu)
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index d707e1a6775..82dcf08fcd0 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"

