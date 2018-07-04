Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5531378AA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 00:55:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u16-v6so1795428pfh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 17:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ND9cBy56Nj3aRpHZ7wlXYkIUm0dvXvDjqvotLg5qGdw=;
	b=A/Bm9nDRogSi5kPLi2sJKfFvVquQL3Xf9WczRLRYjb+a0M752o65KJOIZ2K/dfJhnq
	8s6bJXCrVBv5UAXySHPpDtOevKf0A+Eewe85vyOhsOlKJ3ExXjYQGuIIDzcsrcIvn2YW
	QblmuL1/He6HToGENiryoKcHv96b5wX0My360tzLC+IhJ0YYLRj9oywCMziOunUAhbXV
	eb0gt2k6lsuJZMF7URQZnUeb1rYCpHWf/x1YAX9g+m+a4KSPS/F3VkAKr4YOOhXLNway
	yMw9DyoH4FyDwAXs4ZTs+xyhr7k9mtTMYaE9l7yUZl+S7xCYjFd1+fgVM6hmYvgAhL0B
	5YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ND9cBy56Nj3aRpHZ7wlXYkIUm0dvXvDjqvotLg5qGdw=;
	b=YvhMrHbUNomd+ZtH5EdlCGM/poX1LeCgAxvy1ZqVr1uhywpSkoSKXtBJEOk4HbWyVQ
	X7HZ599wrE94VoU6Tw+2vIr67Djn6MlqscOIuUiKGHWvRQBNkIU2Lhb/OuQQnbprLfk5
	dg8JgUX5ZwXMNNPHooQ2jPo6gpRvB2gFSi9leCUpVTRWejlYorWQW28fa08UCWJnZkI7
	i9MkxFN4xPk0QRWpHDGu1vD3fEHFjF1/l3x/jTx59+A2mX6st8U6h6zun43ZXRGxAU+r
	SdxvxnFCiTDMFzrlZEHyrpw15vcLR9KpwqVtCmWYgzYlU2B+SwyL1YlvMA5Ug4bH3iOS
	M6bg==
X-Gm-Message-State: APt69E2jct1l+xOB9D+pASimhILgnGNzXOaaRD2u+JI2SZ6GHHY6nrgc
	8tLVgnXpRwm7lLOLpoRQ+HZbvg==
X-Google-Smtp-Source: AAOMgpcmxNzP3O48CT/FKn3cMYpBXL6snSuyYk02Q32Ax53ode36ziGPsx4SAAwy/dCWYJA8cAexcg==
X-Received: by 2002:a62:864a:: with SMTP id
	x71-v6mr12203929pfd.252.1530665729290; 
	Tue, 03 Jul 2018 17:55:29 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r77-v6sm4479473pfr.117.2018.07.03.17.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jul 2018 17:55:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 17:55:22 -0700
Message-Id: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Wed, 04 Jul 2018 00:55:28 -0000

An over-ride replaces the original value regardless of whether or
not it's set up with +=. As replacing the original value seems to be
the intention here, drop the += to make it more explicit. Also some
minor recipe formatting tweaks.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index bf654be..3f1bfaa 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -2,7 +2,6 @@ SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
-
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=9a33897f1bca1160d7aad3835152e158"
 
 PYPI_PACKAGE_EXT = "zip"
@@ -13,16 +12,12 @@ SRC_URI[md5sum] = "dd4e3fa83a21bf7bf9c51026dc8a4e59"
 SRC_URI[sha256sum] = "f7cddbb5f5c640311eb00eab6e849f7701fa70bf6a183fc8a2c33dd1d1672fb2"
 
 DEPENDS += "${PYTHON_PN}"
-DEPENDS_class-native += "${PYTHON_PN}-native"
-DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
+DEPENDS_class-native = "${PYTHON_PN}-native"
+DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"
 
 DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR} \
                            --script-dir=${bindir}"
 
-RDEPENDS_${PN}_class-native = "\
-  ${PYTHON_PN}-distutils \
-  ${PYTHON_PN}-compression \
-"
 RDEPENDS_${PN} = "\
   ${PYTHON_PN}-compile \
   ${PYTHON_PN}-compression \
@@ -41,6 +36,11 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-xml \
 "
 
+RDEPENDS_${PN}_class-native = "\
+  ${PYTHON_PN}-compression \
+  ${PYTHON_PN}-distutils \
+"
+
 do_install_prepend() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
-- 
1.9.1


