Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 93A387FA2E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 02:15:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n13so2534687pff.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 18:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2g2htjcv3Ca98QeJ7+b4Z3cDewymyBi3QU84lJy2OOs=;
	b=Mw+XXLqjao9suc6ka/7fKsyOK9ipjnZ4EjuVVb/kNiTozcGZo8EzMavA/fAAYZby4v
	ctmgZbN5UjbIgORiq5H8Rc0q9j5HcBcalRPFgltfX6NhIVf2SY3Cq121hevLOG4cOtXI
	Mv9/WlKdH4AbTO4CQLKWOPuT28udi86vUrb+xJHCjtMm06rEL7R28jyoZTNEvah6gLwK
	y/L7wR16n0645ZXR+CvA8WLTiZwXqz9NU5Z0EJss63bY7Xaj/MI1agfN+NtWuLvLQjHX
	qzQQ9KdhpxTewW3mcYf2c179uB0sBAv+0VTmFi00iy26Deb7MYlb/0G0/RQNtPRxdFyH
	IaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2g2htjcv3Ca98QeJ7+b4Z3cDewymyBi3QU84lJy2OOs=;
	b=EbTaHq6cJaNyhy91qI7pfjhSIFRaHDAz4ytCGLIyQKzfFnN5XcpYZj6Hy+kpR2PywM
	k3dW2qiI7Np9M3SbHpVXrsQvE1+mjt2+JyrU79sXsKLuUwJWmt8rXhccf2+HFC3weFJz
	i1gQDO4u1hQmPJXy+GRHBWhromYbQ+lry95tGlIodZLJYieLmVL7FCIJ6jVVv3g5KpIg
	whl1W+MPgRNbQk+qZAFQgSuLQlOndZQiMsRpl0HwC4uMDk+8KzsSVfVpiE8RfCmjEQzl
	oeMWkEr3bu3LjxKnr9Q3RCqL6XIPEAwoStzWeBkjWN6Tn9j9ig1CSo1xQ0AdSuNvOlZn
	1roA==
X-Gm-Message-State: APjAAAV3w8aDsWPAAdeigmhXO3Kepq1CaLudwV0KF9VbSQv763CLSVeC
	TOEHCLLLDcsy8WqjksHOsIed4LKHvDc=
X-Google-Smtp-Source: APXvYqzTmeGLwQXV5wznux3LiMOZ/V0qgSj4jC6w47sM/UWJyN1aHrbYttu/IAPaoVbmqovtyVVOqg==
X-Received: by 2002:a63:6704:: with SMTP id b4mr899025pgc.424.1575598537944;
	Thu, 05 Dec 2019 18:15:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id
	x11sm13385833pfn.53.2019.12.05.18.15.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 18:15:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 18:08:16 -0800
Message-Id: <20191206020816.3141604-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] nss: Backport clang build fix
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
X-List-Received-Date: Fri, 06 Dec 2019 02:15:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ppc64-inline-assembler-for-clang-r-j.patch | 35 +++++++++++++++++++
 meta/recipes-support/nss/nss_3.45.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch b/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
new file mode 100644
index 0000000000..59e44e6841
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
@@ -0,0 +1,35 @@
+From 6b351dbb049b3b3ab6c0d51aa3c1c7fb3c9df80c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
+Date: Mon, 22 Jul 2019 11:07:41 -0700
+Subject: [PATCH] Bug 1493916 - Fix ppc64 inline assembler for clang r=jcj
+ Seems clang's inline assembler doesn't want registers to be prefixed with
+ "r", while gcc accepts both - r0 and 0 for GPR0.
+
+tested with clang 6.0 and gcc 8.1
+
+--HG--
+extra : amend_source : 87e09bb59c78bdb25b9573b9f29511e10b9db6fa
+extra : histedit_source : 9b3fad70ac2851bf7de14d42c34db4a5fba41710
+
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/671d89b6c4a6f41707bb044534751098e2e3f211]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nss/lib/freebl/mpi/mpcpucache.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/mpi/mpcpucache.c b/nss/lib/freebl/mpi/mpcpucache.c
+index 336b4cc..2ad291f 100644
+--- a/nss/lib/freebl/mpi/mpcpucache.c
++++ b/nss/lib/freebl/mpi/mpcpucache.c
+@@ -727,7 +727,7 @@ static inline void
+ dcbzl(char *array)
+ {
+     register char *a asm("r2") = array;
+-    __asm__ __volatile__("dcbzl %0,r0"
++    __asm__ __volatile__("dcbzl %0,0"
+                          : "=r"(a)
+                          : "0"(a));
+ }
+-- 
+2.24.0
+
diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.45.bb
index e89e7d69d5..c8005a5b3a 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.45.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
+           file://0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch \
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
-- 
2.24.0


