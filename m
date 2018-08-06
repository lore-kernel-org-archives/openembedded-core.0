Return-Path: <maksym.kokhan@globallogic.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2BF74553
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:17:06 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a134-v6so9200436lfe.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kYdAg6TrizWd0KeFF3GbZs+tSuUVhJBlxu1Jj1khWpA=;
	b=VDyzPAICXpuw9iTLisTgnNjp2vApVwKSmnt3v1cfUZp79iwtfxG+PfymASwPaWYiR3
	7tNJ7WkDKXnfPqKIxvrvRSjKnDiLCO75hQfm/yOxczV6VwYUvBpcH3eXnQQA+R+w86O8
	EyX3zizEGptLRo2dfebKRIldFRKFH3mhife5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kYdAg6TrizWd0KeFF3GbZs+tSuUVhJBlxu1Jj1khWpA=;
	b=Z+XfXiGRecf02iyru65gxS8NJPbbxr+SyRcgoPqlxPlxE+NQGKNZ0mrrMA+8vRVKUr
	rgDwf1Rf9kHlme7IhQKFo+zHgb7P5NsizR29TDZKkfvK//mRns/tvCA/TybfpsR85l/0
	CFKOd15HWSlxHsWCji7EpSi+rJhrFe/lxUs/vXnVWQWSeXSY9BcGVl8QGUiTEsWuTIJV
	JZC8YT3F/xr79Zd91YO1NZduCfPPaIzQnrcnfZgzvFWqQOhJm40FVqIY1Q+Pb1y6HJUX
	IkrhbTduPPWskelgoCN81jEYbI4XKVHuDE3ecL/VylvVJxWLQyBTr/HVWGnXOmiQNsa1
	LWAw==
X-Gm-Message-State: AOUpUlGgcj9DYAKeHIlsz2+52lzRasE+KQtSEDiggMZkLFZaTy76Z3QC
	rMyswOp4qwu7yTefMHB3bsb/TRm2IG0=
X-Google-Smtp-Source: AAOMgpcLTZUCQmUA7d+kkdnx3rKNv7EDcVJSYxBrg+ZY0/mrlUtsCETguomHg/CM6aSZ7jsnRQ5Rgw==
X-Received: by 2002:a19:a5c5:: with SMTP id
	o188-v6mr12241497lfe.149.1533565026848; 
	Mon, 06 Aug 2018 07:17:06 -0700 (PDT)
Received: from kbp1-lhp-f55466.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	u19-v6sm2325326lje.51.2018.08.06.07.17.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:17:06 -0700 (PDT)
From: Maksym Kokhan <maksym.kokhan@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 17:16:58 +0300
Message-Id: <1533565018-19188-1-git-send-email-maksym.kokhan@globallogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <a80f3bf9-abba-fd2c-b1b9-d2327de69f78@intel.com>
References: <a80f3bf9-abba-fd2c-b1b9-d2327de69f78@intel.com>
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
X-List-Received-Date: Mon, 06 Aug 2018 14:17:07 -0000

The run-ptest script was added to run existing libusb1 tests and libusb1
recipe was changed to add ptest support to that package.

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
index 1fefd14..56822a6 100644
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
+    install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}         
+}
+
 FILES_${PN} += "${base_libdir}/*.so.*"
 
 FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
-- 
2.7.4


