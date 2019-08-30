Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id C17DD7F43B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id g207so3219143wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Go2fhdh7cv0QMBkdkm6S4EELRUZWFCSaKExQ0o6K4OE=;
	b=pje2UFI6gvjbdeSgk/PuGdxp23e13J3FDk7IlvNZin8gcXVmhoLii6kQJYFo4/8pxr
	GSrZMxcECGEu9koF4gYIZsHKc3smoNUuZg+W23sRk/6gIXYMcyX6XPapSfU7DYEnEFuT
	PFp+JBTxRXxFXc8srzwNrxw5p0rEGh4R9y0dmVAJdzV9F/pQvaj+RMRIl/diyLh/ys6Z
	dZYpdnq5DfqlxVCXg6UxUzudXyJ11vh8zOGitANtBllLDrAMSdYhbqWkZRW29mhT8Y5c
	+eVbHP5VTGlaBO8PJkgZSH/meELDXtKqCzb43/ZhijyOQiRqwWbF8t4YZKRcuYY13NkK
	odPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Go2fhdh7cv0QMBkdkm6S4EELRUZWFCSaKExQ0o6K4OE=;
	b=BSn6bB71jd7swS4ab9EeP6f32RjCKSolUuatxFn3NSxTQUN8RBZpkdWXSJBOQRFAhq
	nkAUuLkcuZLSmSKfnnYzhoD2hbQz/L63tIU+RPHLyWvqjcLKTJUfGb4LvN7DPRhG3IGW
	nBBGM4YYDRfcWB8pwKeDP4OZvvp+cgZrARQcu9rwBJ0NCXxntx43mlhQZHT4lKze0fBs
	F0GcSAw++K8JKcPr+FdO0xSlbkd2fHYI3W4aBjBndcOUjA2cxjKn6TGyeg0GrqYh0aqn
	5vIYrqkpMa1l8WGTmQMzapUbskUT3CMn7NBAbtRWOh40uUqiio3G3rZOowtQZHW4J9gf
	uUxQ==
X-Gm-Message-State: APjAAAXJ+LEKHMFh+asAd1C8XRLt+uycghMEg99ZQF9kVbpTS7uKps/F
	zlh9ZQDY4K+pxYABtw6e3QcNSaQW
X-Google-Smtp-Source: APXvYqw90DPoTtuPEMiWYeyVOVlrWwPqhWdTDtzu3ffNho9dqeKnBmbIh2q3b6gHn3xvYRL/xwOKvQ==
X-Received: by 2002:a05:600c:228c:: with SMTP id
	12mr12773873wmf.33.1567169412243; 
	Fri, 30 Aug 2019 05:50:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:53 +0200
Message-Id: <f47b0db8aed1ab5857b33cdf2614d8a75f334a99.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 08/13] pseudo: use python 3 during builds
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-maketables-wrappers-use-Python-3.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch b/meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
new file mode 100644
index 00000000000..b2dbdad2780
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
@@ -0,0 +1,34 @@
+From dbd34b1b2af8fbf44a0d5c37abe3448405819823 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 28 Aug 2019 19:20:29 +0200
+Subject: [PATCH] maketables/wrappers: use Python 3
+
+Changelog indicates they should be compatible.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ maketables   | 2 +-
+ makewrappers | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/maketables b/maketables
+index a211772..52285e2 100755
+--- a/maketables
++++ b/maketables
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # Copyright (c) 2008-2010, 2013 Wind River Systems, Inc.
+ #
+diff --git a/makewrappers b/makewrappers
+index e84607d..b34f7eb 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # Copyright (c) 2008-2011,2013 Wind River Systems, Inc.
+ #
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9d2e3490872..78500e1cc6d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://fallback-group \
            file://moreretries.patch \
            file://toomanyfiles.patch \
+           file://0001-maketables-wrappers-use-Python-3.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.17.1


