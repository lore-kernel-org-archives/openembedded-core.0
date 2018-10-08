Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 744A2799F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 14:05:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 189-v6so8288299wmw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SVyHgO7nYHKCRZV8T0/jBuaB91aBhohK/edE9h/6fzQ=;
	b=YFVaSbeSarPSI0Ly3Zwm77sBhiioiihkqRJxTKU7fp3Rjv7z5L3d0m21V57ZcUvT9f
	tm6GJ7oOEQ6vH9MCfVzfHdMHFNWkzzrcdJOKVeeNdX2shwaBxKkDMSGqhAYAadtnIAMj
	bQleEoGOkIcns11O4p5x5g0EXCAcN528DIV8j860xoY+q3Ms4AXCM/FodiO6ia8RNG2z
	Id4ph90dW6pjVcXJ1c3WMEEbRz74ajuzhUuuuIWKvAiQMGWLBNwdMHDSa0BS/N0X2Y7T
	WTgoegrizNwLCQAlfwpWfz2rcAEmgOBlk2akGS3mifpUvwcaMF1daucrFMHhm0b9MRyF
	HLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SVyHgO7nYHKCRZV8T0/jBuaB91aBhohK/edE9h/6fzQ=;
	b=kfjaGI1KV5O5JLa5ob8AeWhRMF2iT4MinBqkeJWBUS45DARCiFyf7IQYzIp8rHTd6w
	1YHt4BBiHfqNoQ2oM7fsBwAsq1h4lWSI9OAgNg52X14K/XBO5QpqP1JJidB4xYc2ugvE
	ZbswdrLvofvzCRWWw7R2Pv+nUzUVi3Xa8vxRYyn44r+jfU58MyOXg/Zvvja8ZaFOpRRj
	xbreJYjuqG7Fw0XDCDb+TDUgzBgxYz4Ze+vH+nEvmVvHqmjBs+TXCK0Iyaj7deb5NamN
	GuzqDbNE2PW0oGZyisoobgj9D9+7HTUWPs0MJvfl9Fs1JwLhaVH4kFOnsek9QVpN2qlw
	g7gQ==
X-Gm-Message-State: ABuFfogm3Yrt1wq3XgpwTQzegWJgoeGiQ51R8RO4xOH6584KMq7ZMpuA
	V3cBXEorr0dXaFhCZQ6zAxnEqHwPQFw=
X-Google-Smtp-Source: ACcGV631fmKl6JvRClfSxfpeNF/+mSMfGGjNIQWAqtX9eTEQuRNorQ3eW0FKI6aWns3LkWf6R72EbA==
X-Received: by 2002:a1c:91cd:: with SMTP id
	t196-v6mr14533894wmd.63.1539007501807; 
	Mon, 08 Oct 2018 07:05:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o201-v6sm13027023wmg.16.2018.10.08.07.05.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 07:05:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 15:04:55 +0100
Message-Id: <20181008140455.8990-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181008140455.8990-1-ross.burton@intel.com>
References: <20181008140455.8990-1-ross.burton@intel.com>
Subject: [PATCH 4/4] lib11: fix patch headers
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
X-List-Received-Date: Mon, 08 Oct 2018 14:05:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch          | 3 ++-
 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch   | 3 ++-
 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
index 4ca2f42d4c7..c4c9396675a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
@@ -1,10 +1,11 @@
 From 62005ad019d6afb81da100b3113292a16472d241 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:08:27 +0800
-Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
+Subject: [PATCH] 
 
 Update patch to version 1.6.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Inappropriate [configuration]
 ---
  src/Makefile.am    |   5 +-
  src/X18NCMSstubs.c | 426 +++++++++++++++++++++++++++++++++++++++++++++++++++++
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
index 3677fb1c5ca..559250f9576 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
@@ -1,12 +1,13 @@
 From 5c1693028ef12ab767d7cdbc349c27efa1ada87a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:13:38 +0800
-Subject: [PATCH] Upstream-Status: Pending
+Subject: [PATCH]
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
 Update patch to version 1.6.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Pending
 ---
  src/Font.c | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
index 1a3069a9ad6..c077639f895 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
@@ -1,13 +1,14 @@
 From 046703373055c7029c19d171e415ff3caaa87372 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:16:33 +0800
-Subject: [PATCH] Upstream-Status: Pending
+Subject: [PATCH]
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
 Update patch to version 1.6.6
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Pending
 ---
  include/X11/Xlib.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.11.0


