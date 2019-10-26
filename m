Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 720D67FC25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id v6so4161624wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2WTMj01JSgWtpoi39PF726fVfQ+9mRtgyMBEt3pD6H8=;
	b=tthhr7Bwov2WevDPh/TUCDaY0a23an1BgtdQZnU8LtdGXN30RaUxVp6N8bIavDw1vu
	bOBKStlwSioRJ5Vw7RXhge70oUMQ/WnATBWhkf5SztPBNJMUStZqT/rBrFu3MaCfH2+/
	8V9AIDyTlAUNnDQq0Vn7edWonHgLq9IC1BP17QYCuFmtNJTOxuYKKeEE8JeIK2JOoevk
	+nBFKqXjN++B/J4mL/fJUdjrgEbbqF1lPwlWh+diSLAuLnxRvH2OQWjnWFZuOpwNautZ
	E/8uyzVkegI8ilmdNdDQ3cqbfPjRdQgQu8X1HnT6a+1TI6aracDuM9cJLCAH4nruapaK
	Hs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2WTMj01JSgWtpoi39PF726fVfQ+9mRtgyMBEt3pD6H8=;
	b=oKFXLfIDOkN0fmtUyh044G+PQF8u2ue39JLqcRWyuiz+C8kHvZtj1S94nsM8IVU3Jr
	XnX6hbgMjD7qFrQXgNCUa7vuAmvPnP6YCviVaQHhfyHBWc3nVdQY7sS75XsZS1sYW5Hk
	k1H/Wpv5yrey/k4SLZYR3A+tljhtaCr1Mp8QPV9rADCeC0pDJ5QFvmz5mN77HpMNtcCG
	9Fetn1P5H6GI6UiAAFMtBN/+bAtmhiOeQclsdfDrOUOxHXDPTF1RfCyX5471EtyROY11
	ngb4ry2rh0yXY9sPAHPTAihs2cL4JYqLMu7obeuFDne1P7krMJrpzG9U9ZnsRCVeNsi9
	uP3A==
X-Gm-Message-State: APjAAAWJf0o4gBO8cyH7J04RHTrwLnDB1foFm6gj/0xbFHImPJhO//Ds
	DeNYclqm7Dzz0aEZbKQJ1HBvBHAPHZ0=
X-Google-Smtp-Source: APXvYqzisixYlnCgUbTGonJTdcuWmWxWWOa9SYtBwmsOYZCZBbVKwoqvUKA+7hRMyxOncrvwv9PGrg==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr6332213wmc.32.1572072625862; 
	Fri, 25 Oct 2019 23:50:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:58 -0700
Message-Id: <1dd97c534b62b2ffeb98568892a0a3ad5517faa3.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 26/28] util-linux: fix PKNAME name is NULL when use lsblk [LIN1019-2963]
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:25 -0000

From: Liwei Song <liwei.song@windriver.com>

PKNAME is NULL when run "lsblk -o+PKNAME /dev/sda1"
backport an upstream patch to fix it.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5a987ff5e5e333e28be44a12e729907272ea3cb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...lsblk-force-to-print-PKNAME-for-partition.patch | 36 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.34.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch

diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
new file mode 100644
index 0000000..5d4c148
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
@@ -0,0 +1,36 @@
+From e3bb9bfb76c17b1d05814436ced62c05c4011f48 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 27 Jun 2019 09:22:18 +0200
+Subject: [PATCH] lsblk: force to print PKNAME for partition
+
+PKNAME (parent kernel device name) is based on printed tree according
+to parent -> child relationship. The tree is optional and not printed
+if partition specified (.e.g "lsblk -o+PKNAME /dev/sda1"), but old
+versions print the PKNAME also in this case.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/e3bb9bfb76c17b1d05814436ced62c05c4011f48]
+
+Addresses: https://github.com/karelzak/util-linux/issues/813
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ misc-utils/lsblk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/misc-utils/lsblk.c b/misc-utils/lsblk.c
+index e95af7af0256..3ce6da730264 100644
+--- a/misc-utils/lsblk.c
++++ b/misc-utils/lsblk.c
+@@ -1019,6 +1019,9 @@ static void device_to_scols(
+ 	DBG(DEV, ul_debugobj(dev, "add '%s' to scols", dev->name));
+ 	ON_DBG(DEV, if (ul_path_isopen_dirfd(dev->sysfs)) ul_debugobj(dev, " %s ---> is open!", dev->name));
+ 
++	if (!parent && dev->wholedisk)
++		parent = dev->wholedisk;
++
+ 	/* Do not print device more than one in --list mode */
+ 	if (!(lsblk->flags & LSBLK_TREE) && dev->is_printed)
+ 		return;
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recipes-core/util-linux/util-linux_2.34.bb
index 262f4ba..e9c2d80 100644
--- a/meta/recipes-core/util-linux/util-linux_2.34.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.34.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
+            file://0001-lsblk-force-to-print-PKNAME-for-partition.patch \
 "
 SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
 SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
-- 
2.7.4


