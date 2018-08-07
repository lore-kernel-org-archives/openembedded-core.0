Return-Path: <maksym.kokhan@globallogic.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4083578CC3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 14:07:26 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y200-v6so11727641lfd.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=IIISBxlVjE2F3Nvt0H1SjyALztLrNd8GfWw4D19N9ME=;
	b=XRv1MBYbsypIVr1mJS91lXTc22MmTRuGfViwzGXjLZeR9HX9j3EstTyStnuy1l+9JO
	eC5Uj2yfvGCAI5z+FuA7yPaXgZCKDfLwhRLJ/wNfhBUYCoEA9iI6HJeiII0pvq92NiU9
	0fMsVyXZHmfwg+wAVmDmDhWk0DtUbypy/QRTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IIISBxlVjE2F3Nvt0H1SjyALztLrNd8GfWw4D19N9ME=;
	b=JY80jWXE/mk77kAlTBrVblcqEF1HoEUzEmoqKY/Ze6Deq5zlbGlLP3Ukjg4wjiBZOl
	Vvsu0uZshqrdFaSdcBZxzmdcJMiBgXaCyvLE53sZ50mdoBheSqGeBBDlVdFhfklxt785
	8YDwy5r5xrfJFbUgByC7XzN8Hz7VhJvLyD5sMu9RGZwBbAzL3PFOblctt7dgEzIEOanD
	itHgoV30hkvpSMGv4DpuhFrqM64UhwbRgjdr3kjioKPAH0dSzTobjUTAxn0G3J6+MrXU
	hGxrH4QTI7a3DFceP4MIetnUkrEouJifr3NmZWJu/t30S7c9wkh4rz4SHkdbT0r+irrl
	tsiw==
X-Gm-Message-State: AOUpUlFOicNZWR9XSvZF/GqsMguCKYvZdJvIP2oPubywL5OpR8T50zLW
	4vZALr+uYD0vV5doGKdMUiPBfGe4xAg=
X-Google-Smtp-Source: AAOMgpeEtqTxClMIHVL04eLTiGpl6Gr6LnCtGuyTFEG7LcTq0ONZ+bmim0/NaFiPeDibauoeiEaUXQ==
X-Received: by 2002:ac2:4308:: with SMTP id
	l8-v6mr13616903lfh.35.1533650844755; 
	Tue, 07 Aug 2018 07:07:24 -0700 (PDT)
Received: from kbp1-lhp-f55466.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	z5-v6sm297605lff.96.2018.08.07.07.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Aug 2018 07:07:23 -0700 (PDT)
From: Maksym Kokhan <maksym.kokhan@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2018 17:07:14 +0300
Message-Id: <1533650834-19722-1-git-send-email-maksym.kokhan@globallogic.com>
X-Mailer: git-send-email 2.7.4
Cc: Ruslan Bilovol <ruslan.bilovol@globallogic.com>,
	Andrii Bordunov <andrii.bordunov@globallogic.com>,
	Maksym Kokhan <maksym.kokhan@globallogic.com>
Subject: [PATCH v3] libusb: Add ptest
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
X-List-Received-Date: Tue, 07 Aug 2018 14:07:26 -0000

Add ptest support to libusb package.
Uses existing libusb tests.

Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
Reviewed-by: Andrii Bordunov <andrii.bordunov@globallogic.com>
---
 meta/recipes-support/libusb/libusb1/run-ptest | 15 +++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.22.bb | 11 ++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/libusb/libusb1/run-ptest

diff --git a/meta/recipes-support/libusb/libusb1/run-ptest b/meta/recipes-support/libusb/libusb1/run-ptest
new file mode 100755
index 0000000..17ab436
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+echo
+echo "---------------------------- libusb1 tests ---------------------------"
+echo
+
+./stress | tr '\n' ' '  | \
+sed 's/Starting test run: \([a-zA-Z_]*\)\.\.\. \([a-zA-Z_]*\) (.) /\2 \1\n/g' | \
+sed '$d' | \
+sed '{
+	s/^Success/PASS:/g
+	s/^Failure/FAIL:/g
+	s/^Error/FAIL:/g
+	s/^Skip/SKIP:/g
+}'
diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-support/libusb/libusb1_1.0.22.bb
index 766c1c3..3ba1eff 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -10,6 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
            file://no-dll.patch \
+           file://run-ptest \
           "
 
 SRC_URI[md5sum] = "466267889daead47674df933cea9cacb"
@@ -17,7 +18,7 @@ SRC_URI[sha256sum] = "75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275
 
 S = "${WORKDIR}/libusb-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 # Don't configure udev by default since it will cause a circular
 # dependecy with udev package, which depends on libusb
@@ -30,6 +31,14 @@ do_install_append() {
 	fi
 }
 
+do_compile_ptest() {
+	oe_runmake -C tests stress
+}
+
+do_install_ptest() {
+	install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}
+}
+
 FILES_${PN} += "${base_libdir}/*.so.*"
 
 FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
-- 
2.7.4


