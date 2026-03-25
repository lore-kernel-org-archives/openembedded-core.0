Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAF4103A9AD
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:32:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20284.1774438311337891689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bcTbRIz1;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486507134e4so28462485e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438309; x=1775043109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MCvP8XcaBoA5QZfGrh5/9pURwh22T/ybtF05fVpIT4=;
        b=bcTbRIz1mBzc346CoNckhqKr03/o+qx+6IftRkPvbyJbsII0AIDL5nQoJXQg8F+AYg
         7H9VRR/AlkTj0jCDSJfl0jYQ5VMIAygffAw3fvlplikEVBeYmIbxUmB7pFjNd1vHRbOj
         r6lFiULJ+a+i7c6kauKc1lytBQggmDg6I9YsdpV9VaIaXsqBsCBJ/J5pZ9RFZUi2jkur
         nmRclme5oq+RqoialyGjFgVdf8Ekseo4/jrpiMRCwD4L0Q73xYAwKXCfFcoju84lsqvy
         vzZGsBTmOn4UK/y3Ir3W0WcQ7hFrLCnHl9JNesloK3lnsUCQjFuQrCle3HtTqBiJ53NY
         e3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438309; x=1775043109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MCvP8XcaBoA5QZfGrh5/9pURwh22T/ybtF05fVpIT4=;
        b=fah5cZf8Wn1w7tJs0ANPNohJ0IAX7oDmN96kT2fBWHxXYDWERKvsfxIagFWNLLKJ22
         d2MqREdlzoYzs9oBeg3oGYbItr+43Vus6fEL5kTO1xBUtuGO5hxhF2h3eY/0Rz8qU15v
         ewYd011L/uG3wCt3WRjSQbpDIfj1dDyRISBY/frETy+J+vkNNyUWlwcEHdq/uoeZ8m2z
         vGc6PCYif9lTxl4Rnv3ft/D12zHkFx6qWdQRhsQZwWM2dcpJ9FYEcaAYM10MatYZdPTn
         Hf8sEI+W6dI0MZiKJVI1ytk27FACQpXs8t9WWEQLc2kPkR3psapgLB/5FmCqjc1WLGMW
         7T0Q==
X-Gm-Message-State: AOJu0YxCJPakW1zSWLx3yhOKc7wVFtVUg/t7/duNQEYftNUBUN/Q8/AK
	Zz8z3HYniQBIJlXuq+cet/zm7+nNwiQsu5It++M6YDepueEsgutlA1aEjc+EdA==
X-Gm-Gg: ATEYQzxybTDgUmbRI9cfG9dRy7g8/N9hB2LzABv0Q18YCv6EyZ9lcoDyWQO/J6tUbc5
	ZSO/+KuVPpaiuaLndGOnoCP4JgcJc0cDWXUuqvZqoDG+QljlKB4/YKVK5E5xlB9SonmSQrzJ9fm
	hawsIQsJ6SnHCFWakYJQY9iBPpLCeFZKh8DIvMcoCOkzgXm05jAKUJyaiN5QbR8x6WKp05xtrmN
	osDwmQz4dyKr82nEYe3GRK2CKi2yCffeAa9owynfdStGmfJk6aCJuApmdnuNv5DRE4u5e26ia45
	/1067NhuE+ihjjIlSN2ScTg7vhfqvC1CQ1bWI+uYzcJM++v+gb+gJvubMvrD5lyFEqBSI9Vdmxc
	mhYY+Hme/5rQ3b7nzBtYIC4AaR6348FvelQKgyaGP2aCmMmhECRkPTKVGEWHzcF+6xRsIr3xrsU
	DPWqNFy6d1w8MXWw==
X-Received: by 2002:a05:600c:8489:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-48715fc3925mr47286295e9.4.1774438309410;
        Wed, 25 Mar 2026 04:31:49 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:47 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 12/14] rpm: Support Python freethreading
Date: Wed, 25 Mar 2026 12:24:22 +0100
Message-ID: <20260325113112.1163632-13-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233886

Added a patch to stop using the stable CPython API (of 3.7!)
as it prevents building rpm against a Python build with
freethreading enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../files/0001-rpm-Don-t-use-stable-API.patch | 37 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch b/meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch
new file mode 100644
index 0000000000..3d82fdab3f
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch
@@ -0,0 +1,37 @@
+From 2fb202730b49538bbe6d1439d419c18a89eb4c91 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 25 Mar 2026 08:20:13 +0100
+Subject: [PATCH] rpm: Don't use stable API
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With Python freethreading enabled, these explicit errors are
+triggered in the Python headers:
+
+  #error "The limited API is not currently supported in the free-threaded build"
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [python freethreading specific]
+---
+ python/CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index acc003ad6..3f21205c8 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -18,9 +18,6 @@ Python3_add_library(_rpm
+ 	spec-py.c spec-py.h
+ )
+ 
+-# Select Python stable ABI
+-target_compile_definitions(_rpm PRIVATE Py_LIMITED_API=0x03070000)
+-
+ target_link_libraries(_rpm PRIVATE librpmio librpm librpmbuild librpmsign)
+ 
+ install(TARGETS _rpm
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index ba967ec1fa..05be3933e0 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
            file://0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch \
+           file://0001-rpm-Don-t-use-stable-API.patch \
            "
 
 PE = "1"
-- 
2.53.0


