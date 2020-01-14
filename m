Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9BA7FA29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z3so12282784wru.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kqBiNlw8DdIfs5IYkoKE0CKWuHsI7nr1QMYk3U/2Bo0=;
	b=sSoSYyck4HsLIswWwpI8pDSXBwYyqlqXmxrAZTrfGa9enPfpW2sE0hDpGIBrWgf0gg
	mez8pAv4qKWTTIdYpA2Nn9Y3ljRlDpdrHGxpnF6NXrs9wl41F9bRw76ErsmQtUjmT4zg
	ZqmUdx4RbSR5YmP8dzIiLi8KQWkcvBvLENze6CYJCkeblCRD12MjiHuutyzxQQ6MGI+l
	FuqAawNwK+z80cID679wQwrqjGziDegQDGB5Okqd9LiIOYXByxivcyX1oog4Xh6JPpmJ
	9BlS7qodTvY/xQJVzoaKq+BJE68+rzIGr2nRAjVmzLGEIjo7BX5Io2b6NJvseJ4MNgop
	SDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kqBiNlw8DdIfs5IYkoKE0CKWuHsI7nr1QMYk3U/2Bo0=;
	b=JyIrlR0MI3fHAxNylK5zr//E9WNe0nSVAWPcEfALGotDpPbbKfVOhKpZCDpPV69KQY
	eE04O8JfI4VMSf7OoVY+EDA6r7cAciJwNW+6yvfqSNo4Q+Gao4T+0fHkim1YceQaDNXu
	UkuE9mMIn3ntHfwaKwnH9315GCo5EDapsQHXg9p5PLZPebDjuTwpOf+gZZ9j1aT9KUDS
	lOt23/2D2Ns/KDZEGFHcnQyzoSbY6dXD8b6j5XfhvzqfHxJ5t0kt/K1Xbr0GL+QSTnC7
	I4pazUpxRDVT9LWR/q+Fz1ZkZbAfJqTc14KTlDwzgpiSCxEhYyftkIay7L8RGOM7YU9L
	/kzA==
X-Gm-Message-State: APjAAAWi+dsTO5fjyeLCcNQG4esFFohnGW9iNju770HqOAWb+mnguEVr
	t2iOfpF7+4gLR3ch0mrjub6DnggE
X-Google-Smtp-Source: APXvYqzN6+7WUDdFplDJy7rp82ojN9ekIE++sWLiy0uhPE0SBgWHjtFsliRvBtWDSOzH29ehirK7rw==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr26724127wru.382.1579010422709;
	Tue, 14 Jan 2020 06:00:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:58 +0100
Message-Id: <20200114140007.36622-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/20] libcap: update to 2.31
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-run-target-executables.patch | 33 +++++++++++++++++++
 .../libcap/{libcap_2.27.bb => libcap_2.31.bb} |  5 +--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
 rename meta/recipes-support/libcap/{libcap_2.27.bb => libcap_2.31.bb} (90%)

diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
new file mode 100644
index 00000000000..26d108c209e
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -0,0 +1,33 @@
+From 6309554225e05e76167eda4e0df383fb3d1a62c3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 16:54:05 +0100
+Subject: [PATCH] tests: do not run target executables
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ tests/Makefile | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 95e4ca6..7162cf0 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -19,8 +19,6 @@ sudotest: test
+ install: all
+ 
+ run_psx_test: psx_test psx_test_wrap
+-	./psx_test
+-	./psx_test_wrap
+ 
+ psx_test: psx_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) -DNOWRAP $< -o $@ $(LIBPSXLIB)
+@@ -29,7 +27,6 @@ psx_test_wrap: psx_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB) -Wl,-wrap,pthread_create
+ 
+ run_libcap_psx_test: libcap_psx_test
+-	./libcap_psx_test
+ 
+ libcap_psx_test: libcap_psx_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
diff --git a/meta/recipes-support/libcap/libcap_2.27.bb b/meta/recipes-support/libcap/libcap_2.31.bb
similarity index 90%
rename from meta/recipes-support/libcap/libcap_2.27.bb
rename to meta/recipes-support/libcap/libcap_2.31.bb
index 3f64ff76364..be31c5a9964 100644
--- a/meta/recipes-support/libcap/libcap_2.27.bb
+++ b/meta/recipes-support/libcap/libcap_2.31.bb
@@ -9,9 +9,10 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
+           file://0002-tests-do-not-run-target-executables.patch \
            "
-SRC_URI[md5sum] = "2e8f9fab32eb5ccb37969fe317fd17aa"
-SRC_URI[sha256sum] = "dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
+SRC_URI[md5sum] = "52120c05dc797b01f5a7ae70f4335e96"
+SRC_URI[sha256sum] = "c6088de41e1c97fa8047e2e7de0e4ee0cd13e6cc16538022230ae76727a87c46"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1


