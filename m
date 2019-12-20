Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 342DE7FD30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:24:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so9999350wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IZZE+AoUGrDxnFlSwaAQ1Z0Y9rXP0/eoR/HNCDwEUJc=;
	b=tdTVc83or0yBsGQ/bzV2YcLG8WgMXKA1KK+CoF7WTdvA1Cwf79G6v572h1tQbydKtu
	TnI5iAVV6OISh+wEeqI1/3lR14+Wt7QepPVryFCg8kVN90SO8oYiWCHnn9ReK/s8RP8R
	gGP9k3kM4cmvG//xDDeUYP4o16r/vr9L+WvAgXzgv2k20FnS0AKpyLQBZeUHTifSVSU2
	LGY+5kkzk1H9kx3/ijO1QpeR7hqUfNnUQN2fTiJL2ILo/G1lSF7Zde3ku5wCbfjuJa5E
	l0IEN0rqCUevwZwqwCxt8kGWoVxTg2pO2xkQh8kRih8QXWpbdPo4kMNjC8oTdw/3fVJa
	prHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IZZE+AoUGrDxnFlSwaAQ1Z0Y9rXP0/eoR/HNCDwEUJc=;
	b=QK3xqSOd2O5iQRKlZgbJ0Le+R4C9umJ9YJEPGh9j4VOK1gtkXcF3B/ABHpV3bltTTu
	gR07RpAHCz+Xe0i9yP2mZF3GkmQ6yxH/yvIxqBSMJlp50Ds96fpsBvBxiAy0wO42URJK
	/+0tun8wfNL7O7tlDEz3FMxs5rdGw4fFXcYrSj4gWbFsFcv3Prh/9g9J1f0HY4i0oUlB
	5JLCyMe/d/ighCAHN9nTf+E7fCQBc0o/n5G7rz4O6vX5B+5mA7nDzrjamn4Egv/tv7Hy
	o955dm7KyJgyJh4p78K4wtxsPx3wjxM2A7y88obfu8DjzWhKIHchx6NNJ0LzBcCVIsC7
	IiLQ==
X-Gm-Message-State: APjAAAWHW8pYEKw07qa8JNYHkyJDyfg6P1b39anTSshuHi+EKvBZ/cOV
	8EI4AviuAW8WE3on/Gd71YDCL46xeYw=
X-Google-Smtp-Source: APXvYqyD9mpga9W8TToIgNrVEzcw6lRNyPOkyg1i+h14SMqkwYJdEHM14YWOWDwOH0T4nhWu46p3Bw==
X-Received: by 2002:a05:6000:1052:: with SMTP id
	c18mr16077262wrx.268.1576859044598; 
	Fri, 20 Dec 2019 08:24:04 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.24.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:24:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:50 +0100
Message-Id: <20191220162351.94498-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/11] libcap: update to 2.28
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:04 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-run-target-executables.patch | 32 +++++++++++++++++++
 .../libcap/{libcap_2.27.bb => libcap_2.28.bb} |  5 +--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
 rename meta/recipes-support/libcap/{libcap_2.27.bb => libcap_2.28.bb} (90%)

diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
new file mode 100644
index 00000000000..d6b2ad6f4f8
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -0,0 +1,32 @@
+From 05c5f9515d6b26ed0e1eeff72ed618ca6e42c1ba Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 16:54:05 +0100
+Subject: [PATCH] tests: do not run target executables
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/Makefile | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index b16bdcd..2cb510f 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -10,8 +10,6 @@ all: run_psx_test run_libcap_psx_test
+ install: all
+ 
+ run_psx_test: psx_test psx_test_wrap
+-	./psx_test
+-	./psx_test_wrap
+ 
+ psx_test: psx_test.c
+ 	$(CC) $(CFLAGS) $(IPATH) -DNOWRAP $< -o $@ $(LIBPSXLIB)
+@@ -20,7 +18,6 @@ psx_test_wrap: psx_test.c
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB) -Wl,-wrap,pthread_create
+ 
+ run_libcap_psx_test: libcap_psx_test
+-	./libcap_psx_test
+ 
+ libcap_psx_test: libcap_psx_test.c
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
diff --git a/meta/recipes-support/libcap/libcap_2.27.bb b/meta/recipes-support/libcap/libcap_2.28.bb
similarity index 90%
rename from meta/recipes-support/libcap/libcap_2.27.bb
rename to meta/recipes-support/libcap/libcap_2.28.bb
index 3f64ff76364..781309692e9 100644
--- a/meta/recipes-support/libcap/libcap_2.27.bb
+++ b/meta/recipes-support/libcap/libcap_2.28.bb
@@ -9,9 +9,10 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
+           file://0002-tests-do-not-run-target-executables.patch \
            "
-SRC_URI[md5sum] = "2e8f9fab32eb5ccb37969fe317fd17aa"
-SRC_URI[sha256sum] = "dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
+SRC_URI[md5sum] = "4066ddca53fb7e146f98372c8e43afc4"
+SRC_URI[sha256sum] = "c0e70c3bcce288ada2bfe8d748e816b601590495312222e92e307cf18d6a38aa"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1


