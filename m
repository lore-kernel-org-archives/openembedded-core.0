Return-Path: <maksym.kokhan@globallogic.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7AA74C1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 12:08:39 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id r13-v6so10367760ljg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=dQr6CLDhfYzonuEq9nCnNDtkVQ/ZxirtwoB+guWihic=;
	b=KfubSlY6aOuMqPEvtDeT+MbV3+Z4Z9Mt4vz+MA3WRhGICQZs9A9yTneEosiuzmcPHM
	dmOBeX1cJJilRIKnHeOoUSlzz012QOGEH86GZeH7s/efd+EH/mEiQyNal1sEhXm43962
	nDrsuwD1pQJsAQPBDvUBvO/erwo98VxTpiUJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dQr6CLDhfYzonuEq9nCnNDtkVQ/ZxirtwoB+guWihic=;
	b=qdIQjZSroxZGyJBXcNREVjKv3kjlvPsAN2o2zQk6sMX5Tck84rnkSv/jjvN7eLF/0P
	/QaGrIN+SOtS8FT1sGcBp+Y8WjMmCfpPpOW/LI3BVXkgR+xL49s8oCP9WkcB2PrV0E1i
	ylVDfO7heV7goVLbtE2G1eL7VkTxKJxHhIib6CGxUVWntAvrH3Pdpq+AdyuffTB7KVWJ
	QXP51tTCdr/jqtg3Ik5hsH5zDjtVpfDUcVTihJ+i4YPzUrH5pgQx/dbGlRY7sa/XU1vG
	DprG44zARwdAYXBnnw+/fL7dXyLh8m89eCX4pn4cPv+lm6sKjJMhNTgjUIXHBOIuShaM
	ksQg==
X-Gm-Message-State: AOUpUlHY7cjG574marVMHkmsZnNxRGEQJ6JRc0t2TdWiW+Kl7hr3VJbx
	/79+r6abk0xMmQj6G9zQQDs8Wb4xMEM=
X-Google-Smtp-Source: AAOMgpeTHsz4i7Vh5v1ltJTLW0I1WwJ2WkDoWfw7w/rT965P287imVhB1YGaDMj0qY7Ed/M15fQ0tg==
X-Received: by 2002:a2e:9004:: with SMTP id
	h4-v6mr10946778ljg.44.1533557320280; 
	Mon, 06 Aug 2018 05:08:40 -0700 (PDT)
Received: from kbp1-lhp-f55466.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	q72-v6sm2292761lja.6.2018.08.06.05.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 05:08:39 -0700 (PDT)
From: Maksym Kokhan <maksym.kokhan@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:08:31 +0300
Message-Id: <1533557311-10453-1-git-send-email-maksym.kokhan@globallogic.com>
X-Mailer: git-send-email 2.7.4
Cc: Ruslan Bilovol <ruslan.bilovol@globallogic.com>,
	Andrii Bordunov <andrii.bordunov@globallogic.com>,
	Maksym Kokhan <maksym.kokhan@globallogic.com>
Subject: [PATCH] libusb: Add ptest
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
X-List-Received-Date: Mon, 06 Aug 2018 12:08:40 -0000

Add ptest support to libusb package.
Uses existing libusb tests.

Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
Reviewed-by: Andrii Bordunov <andrii.bordunov@globallogic.com>
---
 meta/recipes-support/libusb/libusb1/run-ptest | 15 +++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.21.bb | 11 ++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/libusb/libusb1/run-ptest

diff --git a/meta/recipes-support/libusb/libusb1/run-ptest b/meta/recipes-support/libusb/libusb1/run-ptest
new file mode 100755
index 0000000..646a966
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
diff --git a/meta/recipes-support/libusb/libusb1_1.0.21.bb b/meta/recipes-support/libusb/libusb1_1.0.21.bb
index 1fefd14..073de38 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.21.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.21.bb
@@ -10,6 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
            file://no-dll.patch \
+           file://run-ptest \
           "
 
 SRC_URI[md5sum] = "1da9ea3c27b3858fa85c5f4466003e44"
@@ -17,7 +18,7 @@ SRC_URI[sha256sum] = "7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66
 
 S = "${WORKDIR}/libusb-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 # Don't configure udev by default since it will cause a circular
 # dependecy with udev package, which depends on libusb
@@ -30,6 +31,14 @@ do_install_append() {
 	fi
 }
 
+do_compile_ptest() {                                                             
+    oe_runmake -C tests stress                                                   
+}                                                                                
+                                                                                 
+do_install_ptest() {                                                             
+    install -m 755 ${WORKDIR}/build/tests/.libs/stress ${D}${PTEST_PATH}         
+}
+
 FILES_${PN} += "${base_libdir}/*.so.*"
 
 FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
-- 
2.7.4


