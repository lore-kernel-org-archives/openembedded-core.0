Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFDE7FCB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so147671wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O4pwZk/fzVg3dX0vCwwh3prnADG2OZy2bVaouwsCG1I=;
	b=p6E9LH32VOV2EPHv+UbmUM94GQnJ71YsVjib3I4IzETTZoiYj+sD/wJls4h7A7TNNd
	shZkZn6yNjZgduejEQcFt1/CV+/dY26ck3EJuLB1w2G/b8JbArwiSBik7S52rA7NGEk4
	uaw58htsZd+QscRdrbFEBAWewM7KkTGw1Cpg94a04Qq0kikK8LIe07qIRhnT6xbE/Us+
	iMgN3tmFasHnrsKxyuTFDvTN5XbmhHVnt93bvPEOpGmbN7Z6h8+jUfyN/ZIu8bV1TE6V
	XaL05GU+VYV9uq3mmxpbHO4x6eCDOs+NDVoavKfyQyBNQOFTR+sv9CjI5+2aVSrRUH9Q
	DVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O4pwZk/fzVg3dX0vCwwh3prnADG2OZy2bVaouwsCG1I=;
	b=P0zI0AUNdzKscLfx5WkKKfx/t56/XMLc1h1S19JebgypmgarN0X5wt6k0Z01V2UJ4C
	5QEXLQUCPFcXLVkTS+JS34qyMh8EqIYBp1WAEBXzLpYS6d/c3ozHnx1SyHs4Saw2LDT4
	zM8yd5UiENkaHOyKckTSbF2KdiUF8i9YegXd66RjtTjK1EqwessQnR6sWf437rUlQShX
	7yHzbsQHYKhmLFKMdaqELnEIeXgnqxZbqC1taBeYm33tgMwMsPDFmpBdgBFr2cpxKv8v
	YgDQwP0zKMNqi7+/8qSBp6lrSZn35JkUx9F5ZqTubIZxmCsW6FaJ7M2hM91UBFrtNCLG
	qJkw==
X-Gm-Message-State: APjAAAU2TQp4/WR1yKNAy+y2GAEqgzGlLDXaKfFdTnXN/uB5EpFXMZ3t
	OK4GjdFUjfR15DJwEujRos7otXus
X-Google-Smtp-Source: APXvYqw6zxY8SMTwB1dadnystvd/rJKaCugBFNfCB/9iSUAVwTGKjEPSjgbFZDV4geDYWpMWQ7zPtA==
X-Received: by 2002:a1c:4004:: with SMTP id n4mr333044wma.153.1579541127750;
	Mon, 20 Jan 2020 09:25:27 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:52 +0100
Message-Id: <20200120172510.22648-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/24] libcap: update to 2.31
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:28 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch | 26 +++++++++++++++
 ...-tests-do-not-run-target-executables.patch | 33 +++++++++++++++++++
 .../libcap/{libcap_2.27.bb => libcap_2.31.bb} |  6 ++--
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
 create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
 rename meta/recipes-support/libcap/{libcap_2.27.bb => libcap_2.31.bb} (87%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
new file mode 100644
index 00000000000..e568cc47c5f
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -0,0 +1,26 @@
+From 1179b423cce8d119b42cebfb3daa77c540fdca43 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 15 Jan 2020 17:16:28 +0100
+Subject: [PATCH] tests: do not statically link a test
+
+This fails on e.g. centos 7
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 7162cf0..6af47af 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -29,7 +29,7 @@ psx_test_wrap: psx_test.c $(DEPS)
+ run_libcap_psx_test: libcap_psx_test
+ 
+ libcap_psx_test: libcap_psx_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create
+ 
+ clean:
+ 	rm -f psx_test psx_test_wrap libcap_psx_test
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
similarity index 87%
rename from meta/recipes-support/libcap/libcap_2.27.bb
rename to meta/recipes-support/libcap/libcap_2.31.bb
index 3f64ff76364..97959c1025b 100644
--- a/meta/recipes-support/libcap/libcap_2.27.bb
+++ b/meta/recipes-support/libcap/libcap_2.31.bb
@@ -9,9 +9,11 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
+           file://0002-tests-do-not-run-target-executables.patch \
+           file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[md5sum] = "2e8f9fab32eb5ccb37969fe317fd17aa"
-SRC_URI[sha256sum] = "dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
+SRC_URI[md5sum] = "52120c05dc797b01f5a7ae70f4335e96"
+SRC_URI[sha256sum] = "c6088de41e1c97fa8047e2e7de0e4ee0cd13e6cc16538022230ae76727a87c46"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1


