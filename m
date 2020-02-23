Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3782F61621
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:53:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e8so7275063wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q3ExsBh19e3ZJsf4oF/LAjCu9j1wWuAHCh+4e2onPOY=;
	b=Vt7dzphafkVh46fxGVlAk1C3MpBjfmc0H1R+3Odmb4NdQJhOxxuJ9slkF/7z23oG+n
	mudwwVNQWCjQqSiLNi0UcR43eSJmrKucb8wWfFJdaiC5IgmKLTW+SJjG9ouib37eKJuv
	gE0kKDVDksq+8SD+dhSptC45lu06Y7pjciK4ZPuWE2o1VkOzbqDt5z3gl6oXwjWnqjIE
	nO3vOEm3xJt8/id1uUaoVPYzP4FKYiKkEKocraTuSzVzLs3Xv8z3h20Xr6mxkN/WON/q
	bJIXYw8qDr679tIForO8qDNmZqIRRzlK0fHxMDSRVq3wYZAMveJ5RAcnIbazGj38jt28
	WGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q3ExsBh19e3ZJsf4oF/LAjCu9j1wWuAHCh+4e2onPOY=;
	b=Bdcq+DtGMVXnP5MoujkZt2k6/sYynvOJyoYKX5YxJxb5wVxJtY/8M6kd4k/a1VVP0l
	GX5YjR92oP1Xz3eVpRhCVAu5mMLWQG0kf7K1xubNUqwbm/vCsLTGaRggk2rigXe5E/L6
	GGe+PKZF8hwltikLdFUpCHw4z+SrsMugoJBR8qQ5mB84eYmYf5L7H428Q0FSwPwZFZpz
	T/LDMZLZ4TgcphcpJARgA0ekd2XR7mVZ0yClDLFrLgnBwGfhyGev7Ikg32X9b3xRvF05
	ufBJLVFfJM38GTzGz+8DC/jzDA5NVwy/KZZSsdLboS87Unjxg8T1FGBXidwDCYzj9yfU
	+nnw==
X-Gm-Message-State: APjAAAWzrboOz/E03Yg0clKEjIPoLybH9XDqmh5QFWZMUFZDxcKNxOtn
	yxvOmIQ2xfY/qhAy1Gk222NByPWk
X-Google-Smtp-Source: APXvYqySP8PnR8ApZrSjhq9IbQB1hbPEnYBPJD02SYwIT2vNGwG55UXG1GzAOV7vR3XralsHSNWbRg==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr60264955wrs.42.1582466002620; 
	Sun, 23 Feb 2020 05:53:22 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g15sm13984949wro.65.2020.02.23.05.53.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 05:53:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:52:29 +0100
Message-Id: <20200223135231.22138-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/3] lttng-tools: exclude one more test that sporadically fails
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
X-List-Received-Date: Sun, 23 Feb 2020 13:53:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-regression-disable-the-tools-live-tests.patch | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
index a558a0993f..f2c14ecc94 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
@@ -1,4 +1,4 @@
-From 5f0ef3e007ed83c1ce7ae817308e5942decc1230 Mon Sep 17 00:00:00 2001
+From c69b68e5c03f1d260025fb1dd9ab7345e31e15ef Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 18:03:25 +0100
 Subject: [PATCH] tests/regression: disable the tools/live tests
@@ -10,14 +10,14 @@ https://bugs.lttng.org/issues/1217
 Upstream-Status: Inappropriate [upstream is working on a real fix]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- tests/regression/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
+ tests/regression/Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
 
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index 73eb9f7..92fc18f 100644
+index 73eb9f7..b92bdbd 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -9,9 +9,6 @@ TESTS = tools/filtering/test_invalid_filter \
+@@ -9,14 +9,10 @@ TESTS = tools/filtering/test_invalid_filter \
  	tools/filtering/test_valid_filter \
  	tools/streaming/test_ust \
  	tools/health/test_thread_ok \
@@ -27,3 +27,8 @@ index 73eb9f7..92fc18f 100644
  	tools/tracefile-limits/test_tracefile_count \
  	tools/tracefile-limits/test_tracefile_size \
  	tools/exclusion/test_exclusion \
+ 	tools/snapshots/test_ust_fast \
+-	tools/snapshots/test_ust_streaming \
+ 	tools/save-load/test_save \
+ 	tools/save-load/test_load \
+ 	tools/save-load/test_autoload \
-- 
2.25.0


