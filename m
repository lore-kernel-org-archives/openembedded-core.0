Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id EBE1D78974
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 12:53:02 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id f25so20418371qkm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 04:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hWiqSX1hBQIzbKRecTwF743jQaBIaL7iddmCm1ux6fk=;
	b=LC94YfU+RJIg5zLDXyat8NXv1U8kq1AUDiIACSQorjT1jfg+fkfKjCdz9ZcjxsjETM
	0+sfkqt4hnWzSMZee2m2agx5PiwdyegKefcc3Cb/xrAmxf+AvkB7JhILdP+OF1ctm+yp
	ewYguuDNnAc09InF/Uhvv0NKNwZSbeyKCRd4xYBz9LzZ7S1PWfcZh8stIDZszzZyFhl2
	APmjSEPJTclkEc814i70RhyCIYGBScS1FeKNc03eG4Xzm2IM27YfrmnTPhuI+vmrgmR3
	Xrn910NcQl5nRwMOJVovVTKokLS7VNW1+Pr8lK4BQdSLy0aDWmLJFHSerd1lcKYUVisM
	+BVA==
X-Gm-Message-State: AElRT7HCRDIQn3EBqrrd+bJu0mEnadwY8yybmARldAVLvvKTpZ5EIAoh
	ebP/TvRVt2sqZ3KeZcBgslV3RU+E
X-Google-Smtp-Source: AG47ELtahuvz1WAv1YAFJ8tLjuG30z3TiIb2eJgFqDr09E5t2BuwhT0RzbepUiPvLTVQHHPGn6QVXQ==
X-Received: by 10.55.15.92 with SMTP id z89mr14357825qkg.301.1520254383655;
	Mon, 05 Mar 2018 04:53:03 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id z9sm9043364qtb.49.2018.03.05.04.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 04:53:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 07:52:40 -0500
Message-Id: <1520254360-16927-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pycairo: update to 1.16.3
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
X-List-Received-Date: Mon, 05 Mar 2018 12:53:03 -0000

Update to the latest stable release
Add the .pc file to the list of FILES

Tested in qemux86-64 running core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pycairo_1.15.6.bb => python3-pycairo_1.16.3.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.16.3.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
index 5c3e1e6..b648852 100644
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
 
@@ -28,4 +28,7 @@ do_install_append() {
     install -d ${D}${includedir}/pycairo/
     install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
 }
-FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
+FILES_${PN} += " \
+    ${datadir}/include/pycairo/py3cairo.h \
+    ${datadir}/lib/pkgconfig/py3cairo.pc \
+"
-- 
2.7.4


