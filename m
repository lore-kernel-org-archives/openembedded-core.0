Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9727FCDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:22 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q10so11504532wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kre1oL/WTXJZxlDJp1MWV/2pOv/JwwbjMvnU8kht9uo=;
	b=BZFlIHZJFYK0C5mTO1jEJVb6jUTwjfngQUWGxDgtKkRYpyLif+HbnhGQSkq7mIG7/3
	B0UJzbFNpfPCE27sL6+3RtlXIUC3kT/+Hvvth0nkbKq/K1E1jTqPLah1hF9A7BDf1ga8
	zXeQVU/8ldKYS06GwEFM6i1JxZyHDEM6L0oJSKtxxLPzvpoBvxljfHEUEx+ntAfBQHUw
	Mvy2iCqTi3HzO/kipHO1hQEUc9SrhO1/fxfhK02dpYxasOgM20B0hDPI3G8Yya1cZOtI
	9AetYyULidZHg1Mzp3RMObmN9jyMprwCibtDgK1m3E7n7is7IJOyp5g5bkXbXiRuZlvD
	p8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kre1oL/WTXJZxlDJp1MWV/2pOv/JwwbjMvnU8kht9uo=;
	b=WuoAs/2/A4vkd34l4hL34XefcCWIUksr99X6AstnZ4LhPasJHIU1IrUUPwjEyfZD+D
	GS2dFaTbCdZpJxoD0ao7Vj1Mesu9UDUnr+fYJmdBX9/QLALm6y7OoO6i5Tg6GUh03v6z
	EbMNeblWkIjghbn51bNaj+8KKG6jEJ+hOFnuvw8NpIXde+GFQagqGt+yabipegPN/kbq
	pltEA7Nkqq+yfvxhqlyOFLqlSX1GNoWhg8y216KTgoIv69plKNez3WDoMwzrEN47p8pA
	qoT1+V1YVs6382pfERKVV+frVPMsW/tzC3/OxfvHmbnwZhnkpQcu/9+I9qsECvMcUMty
	gKZA==
X-Gm-Message-State: APjAAAW3cdIZJuiQos2SIKKugxN1gku+mgb8oILCI6G8RsyCmtlxfHgK
	rKhSYFSuVRqj+13KFR56YpqziOQs
X-Google-Smtp-Source: APXvYqzy42E8i2hJGrLyWN2oitNQZjMxEtC1x7qLN3wjfW2iyRp/1BOerSAOW6zDS05VnM7luaqPrA==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr8856611wrw.277.1580134762745; 
	Mon, 27 Jan 2020 06:19:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:08 +0100
Message-Id: <20200127141908.84922-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127141908.84922-1-alex.kanavin@gmail.com>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
Subject: [PATCH 9/9] lttng-tools: disable tests that sporadically fail
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:22 -0000

Upstream is aware, and will investigate and fix.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ression-disable-the-tools-live-tests.patch | 29 +++++++++++++++++++
 .../lttng/lttng-tools_2.11.0.bb               |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
new file mode 100644
index 00000000000..a558a0993f9
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
@@ -0,0 +1,29 @@
+From 5f0ef3e007ed83c1ce7ae817308e5942decc1230 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 24 Jan 2020 18:03:25 +0100
+Subject: [PATCH] tests/regression: disable the tools/live tests
+
+They have been found to sporadically fail; the issue has been
+reported upstream and they will work to investigate and fix:
+https://bugs.lttng.org/issues/1217
+
+Upstream-Status: Inappropriate [upstream is working on a real fix]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/regression/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
+index 73eb9f7..92fc18f 100644
+--- a/tests/regression/Makefile.am
++++ b/tests/regression/Makefile.am
+@@ -9,9 +9,6 @@ TESTS = tools/filtering/test_invalid_filter \
+ 	tools/filtering/test_valid_filter \
+ 	tools/streaming/test_ust \
+ 	tools/health/test_thread_ok \
+-	tools/live/test_ust \
+-	tools/live/test_ust_tracefile_count \
+-	tools/live/test_lttng_ust \
+ 	tools/tracefile-limits/test_tracefile_count \
+ 	tools/tracefile-limits/test_tracefile_size \
+ 	tools/exclusion/test_exclusion \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
index 639d4b62114..9cb896314b8 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
+           file://0001-tests-regression-disable-the-tools-live-tests.patch \
            "
 
 SRC_URI[md5sum] = "e6c23244a36e2a09783d03a362eb63cb"
-- 
2.17.1


