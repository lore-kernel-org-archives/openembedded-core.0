Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 483F9605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 06:46:02 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id i5so159040937pgh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 22:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=L0d8NqdH+4fnXzu/AabK71vsajL0nPkar7kGYn7gkYk=;
	b=ygsqZl5X9KL1vaRJPGu9XA2WJaCLBhPVc+KVXljAm53TAn4YAtlPF0gOEAhhe+wGN6
	97ezaUb05x12zZmL4kRv76aymGDow+XUmuoVw/YuNwGEB7EUeiB2nUCUPyOX+s2G7zux
	1ajwtibfdt51cNTavpu7I+jvd0HnPCowCR7xc8zGXtQcH68T8S3vidLSVoA5V1BPySdW
	E0rKRb7chzHZzYgDiebAHrn/yFhGcoO2X/yyGQCDHlLD4Mq7+VXXxQSqddw9gCRe+hPG
	kmlD0+QiqyMnGN8lZpRJaZGZO5s0CMzMysUAx91F3+EGI5WC77rkNGEy6ECu8L8DCjpm
	M4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L0d8NqdH+4fnXzu/AabK71vsajL0nPkar7kGYn7gkYk=;
	b=s3NPPGBMYVyE7FAl9FIbR9DRxMma6jD4FQXk4tOlaroPcLpZ776sFXncJxCxF3E6W7
	4Y71ECDa7NTquW3SMpZBvodsHapCBBUjRbXp+5KoMPvRtXS1WcQPJwD/EUTM5G42pkGP
	RBrDdU+/ATI67jpvd6QjF1bMuCTaOxX/pCWQbMvmtsBlxjT0HRM/qgcI4Qu/xiLi+dvO
	9HYuVWBUHjJ6652yPPdSbQA/sQGjBmnpY1K4JcIox7zSjWepXx3TXt2JK5HCmKut6c+m
	QIzIAtlI8jfwA6B6G4TUAnIHvklc76Qj4APP2bRsHY+mtnpQgo96KrH48mb1N6laG3fH
	rDbQ==
X-Gm-Message-State: AIkVDXKnvxrJlCBN1r1kcOgGIsqUis2SJzEDGtaA26VnbSaFYABo+BO6oSXUQE4GuIcVe+Ff
X-Received: by 10.84.168.4 with SMTP id e4mr142297439plb.160.1483512363089;
	Tue, 03 Jan 2017 22:46:03 -0800 (PST)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	y189sm144104277pfy.32.2017.01.03.22.46.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 22:46:02 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:45:55 -0800
Message-Id: <1483512355-27961-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: koen@dominion.thruhere.net, mdf@kernel.org
Subject: [meta-oe][PATCH v3] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 04 Jan 2017 06:46:04 -0000

Add a recipe to build 'ectool' a utility to interact with the embedded
controller on Google's chromebooks (and other platforms using it).

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
Changes from v1:

- Replaced DESCRIPTION with SUMMARY (Martin)
- Use EXTRA_OEMAKE (Martin)
- Removed FILESEXTRAPATHS (Martin)
- Changed PV (Martin / Khem)
- Removed FILES_PN (Khem)

Changes from v2:

- Changed PV (Martin)

---
 .../chromium-utils/chromium-utils.bb               | 24 ++++++++++++++++++++
 .../files/0001-build-Add-HOST_LDFLAGS.patch        | 26 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils.bb
 create mode 100644 meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch

diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils.bb b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
new file mode 100644
index 0000000..f2216fe
--- /dev/null
+++ b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Chromium EC utilities"
+DEPENDS = "libftdi"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca36"
+
+SRCREV = "b19bb1f22a3fd0102030485d324c0321a18827e8"
+SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;protocol=https \
+           file://0001-build-Add-HOST_LDFLAGS.patch \
+          "
+
+PV = "1.1.9999+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'HOSTCC=${CC}' 'HOSTCFLAGS=${CFLAGS}' 'HOST_LDFLAGS=${LDFLAGS}'"
+
+do_compile() {
+    oe_runmake utils
+}
+
+do_install() {
+    install -m 0755 -d ${D}${bindir}
+    install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
+}
diff --git a/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
new file mode 100644
index 0000000..46e8cad
--- /dev/null
+++ b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
@@ -0,0 +1,26 @@
+From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
+From: Moritz Fischer <moritz.fischer@ettus.com>
+Date: Tue, 27 Dec 2016 22:24:07 -0800
+Subject: [PATCH] build Add HOST_LDFLAGS
+
+Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
+---
+ Makefile.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.rules b/Makefile.rules
+index 404454d..0057ba9 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -60,7 +60,7 @@ cmd_c_to_build = $(BUILDCC) $(BUILD_CFLAGS) \
+ 	         $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c) \
+ 	         $(BUILD_LDFLAGS) \
+ 	         -MMD -MF $@.d -o $@
+-cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d  -o $@ \
++cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF $@.d  -o $@ \
+ 	         $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c)
+ cmd_cxx_to_host = $(HOSTCXX) -std=c++0x $(COMMON_WARN) $(HOST_CXXFLAGS)\
+ 	-I ./$($(notdir $@)_ROOT) -o $@ $(filter %.cc,$^) $($(notdir $@)_LIBS)
+-- 
+2.4.11
+
-- 
2.7.4


