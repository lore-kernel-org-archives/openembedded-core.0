Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD47787B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 17:27:09 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d18so3323626qtl.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 10:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TBCZX672hdFA7lrojFzp/vZ6vjRDNopFX7mytmCgZ/Y=;
	b=uaDjpAl5NSt+uLcE4aStCjBVhm3MOsngCgWl3cWRXXI0sOMrNJsey5rIwfnO+9y0lc
	rl1dn9/pyRgq+qSefwuDyANa73xdcMgfTPTCQSptHOZmX6IQOWrQXUaBBcwdn9M9kt09
	1w3FpWyaFwy095IwJxWncQpqUo+XqoLHREjh1Nb3Zms5H1gZUAVkqzjzbkmrWRUXPplj
	y8YnF/oBI9mfdrJLG+5QjV2DV0uddeLSYDuAGJswO4Kx0bTaCkVWYzJ1lugl1QD0lMME
	CMbS3G41LGdV9JCvhfZMVJYtQrt1EhvFOxu20fLbEin0kNYCYeE5n3jkWLFuk2I/G/v9
	6w/g==
X-Gm-Message-State: AElRT7Gxiand6jghKd4Dqe8MV7MlVuPESwK3xfNM56u89KXedNW4yea4
	Y9bNsYVCjqVK6wg7HP/c3+2kQAYA
X-Google-Smtp-Source: AG47ELtIomQ65buh6n3PbaMmFcDGVPwdeFxhLMfbEcwhxqaE9HFEXle2zEPxiDTf2EkrJkpOpabi0Q==
X-Received: by 10.200.58.229 with SMTP id x92mr21527665qte.46.1521912429968;
	Sat, 24 Mar 2018 10:27:09 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id e30sm8504059qtg.1.2018.03.24.10.27.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 10:27:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2018 13:26:53 -0400
Message-Id: <1521912413-6148-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pycairo: update to version 1.16.3
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
X-List-Received-Date: Sat, 24 Mar 2018 17:27:09 -0000

Update to the latest stable release

Changes in this update:
  Add the .pc file to the list of -dev files
  Move py3cairo header to -dev package
  Added a comment for why the .pc and .h file are re-installed

Verified native build and dependency builds (python3-pygobject and bootchart2)
Tested in qemux86-64 running core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-pycairo_1.15.6.bb => python3-pycairo_1.16.3.bb} | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.16.3.bb} (58%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
similarity index 58%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
index 5c3e1e6..85f3752 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
-SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e59494538f0b80497ad3462051368755016"
+SRC_URI[md5sum] = "d2a115037ccd128219f43d5ed3df7926"
+SRC_URI[sha256sum] = "5bb321e5d4f8b3a51f56fc6a35c143f1b72ce0d748b43d8b623596e8215f01f7"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
@@ -25,7 +25,14 @@ CFLAGS += "-fPIC"
 BBCLASSEXTEND = "native"
 
 do_install_append() {
-    install -d ${D}${includedir}/pycairo/
+    # setup.py uses --install-data which points to a non-standard datadir  to install the header and .pc files
+    # Fix the paths here to install in the standard locations as well
+    install -d ${D}${includedir}/pycairo/ -d ${D}${nonarch_libdir}/pkgconfig
     install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
+    install -m 0644 ${D}${datadir}/lib/pkgconfig/py3cairo.pc ${D}${nonarch_libdir}/pkgconfig/
 }
-FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
+
+FILES_${PN}-dev += " \
+    ${datadir}/include/pycairo/py3cairo.h \
+    ${datadir}/lib/pkgconfig/py3cairo.pc \
+"
-- 
2.7.4


