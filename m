Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9924C6BC44
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 15:59:05 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id 4so18875457pld.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VWwdgehydkPvhrlij60rpcM++DPLQ3IiI6JYxuzD68s=;
	b=KIC2cjRFoR6WhpQbpuc+KlfkZj5bQWv5IcbXsEEhaqah+GQyvDBKBk2v7tyyS3w9W1
	pM/OCvoRwwHQc1VK3muLwSBjgI/bxDFveFFrEgxq1x3WUMTVBEwCHj8AcEvkpX8am2pG
	IS/kgx74WxqV+rlyBZ/Wllyp2Q1hBjJP48ofZiWq5UFGyXr/O1mbc7+WAhCkUMn9qCF9
	jrEwoR7W30Tq9D+uXtNAOfgb02D+oN8XvSmIMm6EKDY1ASslChKqJOU2/QZkbggiflpQ
	+oj+DVuhFHCjO6Qjpv2RENz163qJCz5MbckDPoZpIunNkj0xEHZIwF20yOU+M+Fl3WQr
	wP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VWwdgehydkPvhrlij60rpcM++DPLQ3IiI6JYxuzD68s=;
	b=Ga891ciGQDFVZmFA4zHFqoqrY09Ek8B0vjf7q+Gq7vgZ+sJawPGg4/zYh/tf3M7zdV
	1QHI/HLBQ3NjEelwq9TbXkwVsu6uALSV6TGfISuBkm6zgZRWQ127KKEoUQMzlTyCeJZX
	yLsiPIRtUb5C/5cQMOxVb0AtnjVESuEJOSWJcOM5so1KzNrbHZk3yj3Ss+rstuGsp1pP
	TeK/yLwPXlMY707ml5E+CPkqYk/i5YZvxgGjShkvfK1F+rKnCg2TS/XQSg943XYr6wTu
	+Su9K4IPAEoi9Sl1iMFfTfVWRwcvF3kWM1fMhpcW1xBTJSAv+cjET9f33b+YDTm9/4Ja
	NtPA==
X-Gm-Message-State: APjAAAV1qEHymys2GZ8EYVD0OJk7jJcUSIJnfBByGXv/sjn7SGaRn5NU
	Z3AxrUyoV255hjr+/wqer48a7W0qGxw=
X-Google-Smtp-Source: APXvYqxjZHDuam1LbMIHXuMTDzWWl+7GFLx+ECgMksZsHjGR7N6BpCxCtoxTFXnmNTc64RACd0X11A==
X-Received: by 2002:a17:902:100a:: with SMTP id
	b10mr61060931pla.338.1564243146319; 
	Sat, 27 Jul 2019 08:59:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	g2sm57118347pfi.26.2019.07.27.08.59.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 08:59:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jul 2019 08:58:49 -0700
Message-Id: <20190727155849.38385-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727155849.38385-1-raj.khem@gmail.com>
References: <20190727155849.38385-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lttng-tools: Fix build with glibc 2.30
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jul 2019 15:59:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...heck-for-gettid-API-during-configure.patch | 55 +++++++++++++++++++
 .../lttng/lttng-tools_2.10.7.bb               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch
new file mode 100644
index 0000000000..c494cee604
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-check-for-gettid-API-during-configure.patch
@@ -0,0 +1,55 @@
+From 69c62f5f3cc424b7dd0c8e4097743b39a9c48306 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 08:48:13 -0700
+Subject: [lttng-tools][PATCH] check for gettid API during configure
+
+Add support for gettid() provided by glibc 2.30+
+
+Since version 2.30 glibc provides gettid and it causes conflicts with
+locally defined gettid(). Use the local definition of
+gettid only if system gettid is not available.
+
+https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=NEWS;hb=HEAD<Paste>
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac            | 2 +-
+ src/common/compat/tid.h | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7b99f5c..e4bd82c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -190,7 +190,7 @@ AC_CHECK_HEADERS([ \
+ # Basic functions check
+ AC_CHECK_FUNCS([ \
+ 	atexit bzero clock_gettime dup2 fdatasync fls ftruncate \
+-	gethostbyname gethostname getpagesize localtime_r memchr memset \
++	gethostbyname gethostname getpagesize gettid localtime_r memchr memset \
+ 	mkdir munmap putenv realpath rmdir socket strchr strcspn strdup \
+ 	strncasecmp strndup strnlen strpbrk strrchr strstr strtol strtoul \
+ 	strtoull dirfd gethostbyname2 getipnodebyname epoll_create1 \
+diff --git a/src/common/compat/tid.h b/src/common/compat/tid.h
+index 40f562f..aa07a85 100644
+--- a/src/common/compat/tid.h
++++ b/src/common/compat/tid.h
+@@ -25,6 +25,7 @@
+ #ifndef LTTNG_TID_H
+ #define LTTNG_TID_H
+ 
++#if !HAVE_GETTID
+ #ifdef __linux__
+ #include <syscall.h>
+ #endif
+@@ -47,5 +48,5 @@ static inline pid_t gettid(void)
+ 	return getpid();
+ }
+ #endif
+-
++#endif /* HAVE_GETTID */
+ #endif /* LTTNG_TID_H */
+-- 
+2.22.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
index 469ad111c4..aa6d19d0fa 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.7.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://0001-Skip-when-testapp-is-not-present.patch \
            file://0002-Fix-check-for-lttng-modules-presence-before-testing.patch \
+           file://0001-check-for-gettid-API-during-configure.patch \
            "
 
 SRC_URI[md5sum] = "e7804d10e4cade381e241601f6047373"
-- 
2.22.0


