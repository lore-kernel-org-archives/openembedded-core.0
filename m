Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 240447FEBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so3423332wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BKPw1vsTEfEIv2gChjzvj3U+k7Gx3b4KfaZt9OnBPqk=;
	b=JK0HN3pxLySL5b4HiuKNvbCkZIY65LiGmOE3wtN4XHrfMKY/z3IVKcYhHWPcIFstLL
	eDXx1eMOh9lHQe1+Y4InRzPxh9IRVO28vXtQE3QNJz1sr9xS8iKimcHhhH4Gz/yXvJMU
	ZECpcl4iRHiJ6imAv70VdlP6/FBUEFsALzY/mzPmMV7W35hNS8pOwSFEqPCDO1OAmZdF
	AlQRWP0r7gVszjO27/GJ55lIlUQ4YlB8+43wXKLlVutz3SmW06QSh6YQblsjmgGcz3Ui
	VaepBs+vKnAz1CJLfsQbk5MH6IcZRKResP0zGQH/KiXid4ac472MzhrXV8ayqQIKjC6V
	P+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BKPw1vsTEfEIv2gChjzvj3U+k7Gx3b4KfaZt9OnBPqk=;
	b=jXPDxw+HKfMh2k0K71weuUP6QwwVAPRP+qR4No+xL1LuZPwsY3L89UyHqpSg5SBxr6
	ZuxucNmaiNmqttR6iscGZGMLcYSgDSrqcAK6acTM9PWVj6+GMHe6P7lJhCi00/mE22yT
	N0PCDhugq1v7m9XRm1d9V7oRD5CSPKTHmEDfM72IlZ3qX+GRHiLTVVoLmCZ+G95wquZ3
	hs5gfe+nk/u1ro9M9hGAcLbJBQD98NzQF/PBlQJItpLp2HDvrnBmwiM6AKUhPezsbECO
	jYjD4oCXktXzflP6dZjopR38ZAwlu1r8nw9vysTCbAg8gmdnbpVoBRQ5IZ+6mbWNBaCL
	3nmQ==
X-Gm-Message-State: APjAAAWRD7Bbn0PE2ROZTQurIAxMuVxw8ZhVW7QtKfOVWNSf22RfwCaa
	cAy5cxqH6gl3li2q4JhNsGbOnE6Y0Ik=
X-Google-Smtp-Source: APXvYqzVepR19/w2C/EX5azpIdgQoTLWC4kBGkJoGfZDYAMPQNPr+93PHRFRhZJxhMQp3TUfsfqq0A==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr4556393wrw.311.1578490100592; 
	Wed, 08 Jan 2020 05:28:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:45 +0100
Message-Id: <20200108132759.95603-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/28] libcap: update to 2.30
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-run-target-executables.patch | 33 +++++++++++++++++++
 .../libcap/{libcap_2.27.bb => libcap_2.30.bb} |  5 +--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
 rename meta/recipes-support/libcap/{libcap_2.27.bb => libcap_2.30.bb} (90%)

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
diff --git a/meta/recipes-support/libcap/libcap_2.27.bb b/meta/recipes-support/libcap/libcap_2.30.bb
similarity index 90%
rename from meta/recipes-support/libcap/libcap_2.27.bb
rename to meta/recipes-support/libcap/libcap_2.30.bb
index 3f64ff76364..890bf34bc0e 100644
--- a/meta/recipes-support/libcap/libcap_2.27.bb
+++ b/meta/recipes-support/libcap/libcap_2.30.bb
@@ -9,9 +9,10 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
+           file://0002-tests-do-not-run-target-executables.patch \
            "
-SRC_URI[md5sum] = "2e8f9fab32eb5ccb37969fe317fd17aa"
-SRC_URI[sha256sum] = "dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
+SRC_URI[md5sum] = "ea531f37a30a61dce8bf8544537a46e3"
+SRC_URI[sha256sum] = "a287bae0b0d95e5230a1c4177b835c70774511b631f87c7bd29e91a03e027f11"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1


