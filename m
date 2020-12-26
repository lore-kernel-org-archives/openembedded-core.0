Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.19127.1608974891326893737
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mCnKb8ZF;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ga15so8320750ejb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EDD6hAZChxDog+ZSCBP50s1MA5aj6POGyz8WqSLQmCo=;
        b=mCnKb8ZFbcJO27odh2WlqM/shq+sHJeJXDHgLI44cLMPIqiGPrgc5+e5Ku8wI4XQvM
         zA4k/gxAt7pGAdxkNOWdMqKVrBCwBEGCthksCLruDz/BOBR8tKwspzkAsqstKKF3VXZh
         QW8w9h+JEo9dKTMnjJXeTCbfhwOS69bszHSLsBZeH5MAYSQcRfzLCuRI6mGlxzCmZfo1
         BrmnwxrR1DpMEsmiio5kr5FmsJ8U1lZhO9RjSyIzSVQQ+1s84qMlQ7wsecw9CZVvYCs3
         E54nBprM8x1It8CWxYWtETluodEBodIRsEet/nvRxH2wFZgDyjcbQtt6f7iXTEydMo3e
         Ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EDD6hAZChxDog+ZSCBP50s1MA5aj6POGyz8WqSLQmCo=;
        b=ruoGQix+26Ohf0ILsCkvqwNUdrS+rslfHQ1yGUR0+Sg5l3e9TOkTPOz9jc1lEA1T09
         x2cDFYTFiATL72mHkoDVF7Q2UGw9wWg2qILEsvK7GCX/CWBCrPNU4CvrNemLul/3guTT
         jHVeLqqAiNztt7lum4dwFgqPjA3Bps48f4hmaTyKuw8rzCdUeLhN2Uvbu3JP7Tp+DMef
         3o5RYgfj3BO2jwgUxfgImKXeyNnb/Z46bI/YxP4ctF9hmULDLcdqYT44cJHoivxSKvlD
         DgHxLluy5qmJUtLdNSFJGOTRqbqOkjhg7gbxLS3cNjo7xQuqGysaLWdAAnWIhACERbpR
         6Bfg==
X-Gm-Message-State: AOAM530dgKRbu5XyWdnHUKgQLuUrUbSYwstLTxKzyIhYYVTlHxESV+YI
	+iHk+4bhftEubIxUJtJdS7mbpN9y5ew=
X-Google-Smtp-Source: ABdhPJx0s0rsYtVjc0hUShP4FuYc1LHCTmLJ5c6JTBzE+658qC4QYCWZRlOtfaWc30aVBYGMy7eFEA==
X-Received: by 2002:a17:906:410e:: with SMTP id j14mr34445067ejk.253.1608974889980;
        Sat, 26 Dec 2020 01:28:09 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:09 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/48] ell: upgrade 0.33 -> 0.35
Date: Sat, 26 Dec 2020 10:27:19 +0100
Message-Id: <20201226092732.52323-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...l-add-missing-include-in-dhcp-server.patch | 23 ++++++++++++++++
 .../ell/0001-pem.c-do-not-use-rawmemchr.patch | 27 +++++++++++++++++++
 .../ell/{ell_0.33.bb => ell_0.35.bb}          |  7 +++--
 3 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
 create mode 100644 meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
 rename meta/recipes-core/ell/{ell_0.33.bb => ell_0.35.bb} (73%)

diff --git a/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
new file mode 100644
index 0000000000..2460d26bdc
--- /dev/null
+++ b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
@@ -0,0 +1,23 @@
+From dd350f4e2258b5a638bc8fb26a6193147902d292 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
+Date: Mon, 30 Nov 2020 18:40:33 -0300
+Subject: [PATCH] ell: add missing include in dhcp-server.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ell/dhcp-server.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c
+index c983ed4..144e83e 100644
+--- a/ell/dhcp-server.c
++++ b/ell/dhcp-server.c
+@@ -24,6 +24,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <linux/types.h>
+ #include <net/ethernet.h>
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
diff --git a/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
new file mode 100644
index 0000000000..f0ce6f1364
--- /dev/null
+++ b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
@@ -0,0 +1,27 @@
+From 277e1eca67fcc23cb31be7b826d83a19d9b89bd2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 22 Dec 2020 10:30:54 +0000
+Subject: [PATCH] pem.c: do not use rawmemchr()
+
+This is a glibc-only function, and causes build failures with
+alternative libc implementations such as musl.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ell/pem.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ell/pem.c b/ell/pem.c
+index 790f2c2..237ae02 100644
+--- a/ell/pem.c
++++ b/ell/pem.c
+@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf, size_t buf_len,
+ 
+ 		/* Check that each header line has a key and a colon */
+ 		while (start < end) {
+-			const char *lf = rawmemchr(start, '\n');
++			const char *lf = memchr(start, '\n', end - start);
+ 			const char *colon = memchr(start, ':', lf - start);
+ 
+ 			if (!colon)
diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell/ell_0.35.bb
similarity index 73%
rename from meta/recipes-core/ell/ell_0.33.bb
rename to meta/recipes-core/ell/ell_0.35.bb
index 2fa05104fb..ccc54b5ff7 100644
--- a/meta/recipes-core/ell/ell_0.33.bb
+++ b/meta/recipes-core/ell/ell_0.35.bb
@@ -13,8 +13,11 @@ DEPENDS = "dbus"
 
 inherit autotools pkgconfig
 
-SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-ell-add-missing-include-in-dhcp-server.patch \
+           file://0001-pem.c-do-not-use-rawmemchr.patch \
+           "
+SRC_URI[sha256sum] = "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.29.2

