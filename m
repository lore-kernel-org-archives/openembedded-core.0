Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.35174.1607956677904159062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eL/0IX1O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id c79so12164480pfc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=UvVzV2UhOzCpFd7VHTxC+NtnkwsyO17yUG99GVHTILo=;
        b=eL/0IX1OYht40b6/PmdU41OeZqLeSx30OaI3UeoqX+AdQtOfKjm6EOc2Q4OXXctWO2
         d4FwZSA5ubhFM8qzDhFmLMClv0WBc7vc6ineT2vj4/qG/seaC3WP5WwuJPuFKX55KJqY
         /1JdoMdDu8vzhTP8UO17bWYXkvjiVDUnfXDdMJOnaJ7NbjYbuYWGzL3gI9veInGOEHsl
         mzMJuFnWzZxa6us07Fiq/lVFCQn5gN5QiF3em88oGtjqNO+1kA9JEaHVUBMKWKZR+mZB
         Clt+FHoh9LShgnEde1yD51F66HDiq69QSjHmipAa/5P5j0da1OGmzICK2+hzXueJOOyz
         Uj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=UvVzV2UhOzCpFd7VHTxC+NtnkwsyO17yUG99GVHTILo=;
        b=TWGx7i7f3f11sSWDXqU/UYuSVZBAtnvOKIVPwL/lrwYeR4gIORaUDH2n/lgYnMr0gC
         O/syzn7eqx3IiQnEXjMD5f/wMsjp/2CpmxhFgN8b3xYGzICjGbUMNkHWPy3zxLnkV4xC
         S7T/XQz2qaU+XAelQHWIGcNwZd5ugLSFP+bZAei1pxPgVEtmqk9UmttN3zL1ItVpAn5A
         fy0UonYgcRLQQBF5yJ7f+qcsf8lMuR4JXnJPvuAnrTWuFB/m1auGsaYCn1t7ChY5AdIv
         u6ZLQkuBvUs94oZBlHSzQOiCC/jUXCNOkao4SMKfawdLYtCqGC7NjOdzKaKByE0HGoPN
         Vecw==
X-Gm-Message-State: AOAM531xYPvAhIg/2LdpGeRc8l4NIPzXY84FPQZSveQdbaWgxYxBxcJW
	czXcHWb4HR1wqsEIrR4B5IyFX68gOkaGKaVZ
X-Google-Smtp-Source: ABdhPJyMBa3UwgDSzx48fHcOxj+47wE1dvmV/vST0nrU/qo999IXlH7VzcfsDdZayz+hXSHQtJf9dQ==
X-Received: by 2002:a65:614c:: with SMTP id o12mr23934836pgv.111.1607956676756;
        Mon, 14 Dec 2020 06:37:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/25] ruby: fix reproducibility
Date: Mon, 14 Dec 2020 04:36:46 -1000
Message-Id: <d2619ca71a777ae4fd0ecb4340848ef98282a9ad.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07c26e3292dbaf71873f71bec2a631f880b2e76d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
new file mode 100644
index 0000000000..826daf2cda
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
@@ -0,0 +1,32 @@
+From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 Nov 2020 18:31:40 +0000
+Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
+ target config
+
+This helps reproducibility.
+
+Upstream-Status: Inapproppriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ template/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 10dc826..940ee07 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -657,11 +657,11 @@ mjit_config.h:
+ 	echo '#endif'; \
+ 	quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
+ 	sep=,; \
+-	quote "MJIT_CC_COMMON  " $(MJIT_CC); \
++	quote "MJIT_CC_COMMON  " ; \
+ 	quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
+ 	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
+ 	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
+-	quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
++	quote "MJIT_LDSHARED   " ; \
+ 	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
+ 	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
+ 	quote 'PRELOADENV       "@PRELOADENV@"'; \
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
index f87686f6f7..a6c65e887b 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
@@ -7,6 +7,7 @@ SRC_URI += " \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            file://CVE-2020-25613.patch \
+           file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
 SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-- 
2.17.1

