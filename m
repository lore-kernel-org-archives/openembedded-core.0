Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 16857746BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 21:18:52 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b5-v6so10391040qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 14:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qWgVxA4jV0Y5+4S1eF3YRBKn0iWqW9cRGQjEcE0YEyI=;
	b=BW420Zt68vWydOTXvXVzFJItGKVoinjz94akKlvkzMmI/tffR+wWutd9p5EvbKnsvK
	SQ1TQNz4BNqgf0NfEqWa9LsZx/kWbFCxOJozW6vrNFKl+P3V6uVeUtB40Ya08tD4V/ov
	2c22016E5CQJ7L1/adrEE3fDR84KR412Xmdw2epd/qltzTEpGYTIChIXA6KxE8dr5bsb
	9n/FWkUrOsWPoCR4pi1Q6Zc1KWjytu6zZuW6NZcKvF/rxZeG4eOY3XFZ+E0Ebmdu4RFu
	MyhND4OD0FmKGpdi3AB8K9jVLk6jGoX2iHv41iDQMzURw7LIFO6CN0/HYO2U427cpGko
	ijyQ==
X-Gm-Message-State: APt69E26tV127ZW9gyRykgKGy3brv+vXjKvCwPOTR+2VxV5L2w32usy/
	xCwYliKsHYds+1v8fdRcnJmOqdmb
X-Google-Smtp-Source: AAOMgpeMqb8hWxcUmviNuFsYrgZmGkY3Vf37jmkWbUyxB09yFl/VIy3QnszfDWQEyBTXiC8aHU+rfA==
X-Received: by 2002:a37:2ac7:: with SMTP id
	q68-v6mr23479725qkq.374.1531257532646; 
	Tue, 10 Jul 2018 14:18:52 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	u27-v6sm14522019qkl.66.2018.07.10.14.18.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 14:18:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 17:18:46 -0400
Message-Id: <1531257526-30932-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pycairo: update to 1.17.1
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
X-List-Received-Date: Tue, 10 Jul 2018 21:18:52 -0000

Update the python3-pycairo package to the latest stable version and
move the .h and .pc files to the standard location

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-pycairo_1.15.6.bb => python3-pycairo_1.17.1.bb} | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.17.1.bb} (57%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.17.1.bb
similarity index 57%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.17.1.bb
index 5c3e1e6..54e7dcd 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.17.1.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
-SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e59494538f0b80497ad3462051368755016"
+SRC_URI[md5sum] = "34c1ee106655b450c4bd57e29371a4a7"
+SRC_URI[sha256sum] = "0f0a35ec923d87bc495f6753b1e540fd046d95db56a35250c44089fbce03b698"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
@@ -25,7 +25,10 @@ CFLAGS += "-fPIC"
 BBCLASSEXTEND = "native"
 
 do_install_append() {
-    install -d ${D}${includedir}/pycairo/
-    install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
+    install -d ${D}${includedir}/pycairo/ ${D}${libdir}/pkgconfig
+    # setup.py uses --install-data which points to a non-standard datadir  to install the header and .pc files
+    # Fix the paths here to install in the standard locations instead
+    mv ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
+    mv ${D}${datadir}/lib/pkgconfig/py3cairo.pc ${D}${libdir}/pkgconfig/
+    rm -rf ${D}${datadir}
 }
-FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
-- 
2.7.4


