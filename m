Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 81D6A7DB8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:54:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b10so3470575wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rS3i8WvWKFeWp4sWwTOTWRaOMwLDgR2OQgE/VeF7Bgc=;
	b=UfP+Q2/xNZNmdr2jA7Pw3IGd37a6z/jS4zXYpvqOJ9VDP+cGkyCJIXwyYW4/dvrvlm
	CIVho5e4gUgutzE0SPpbusWwMvLfQ5/bDMkQx1DOteEdDTAVyYNlNmAeHfjkQZiIgXIc
	AUVjXTeNJLFD0KhrJq+aJrEjHE05Bre4PzN2vgn8rSO6hu8oBje5upq5O2z1c6XaT0Tb
	hnLB3ziCQ4UB2Q3MLndD88bnZyv6DP3dcmkApW75tIQxQYmhGKRtIwDs8yskg2hHkviE
	wLwzL0lCpxk1ZIuVFBzGBMge5tfjcuCshiUYX32uD6F7RouE6ZQ1Ah0Hthm+mmwla2uc
	p3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rS3i8WvWKFeWp4sWwTOTWRaOMwLDgR2OQgE/VeF7Bgc=;
	b=VyAcc9jA8j+CI+/NPxxS3rN30ZclczLfmTmanL43OHtLe6z5QCYfLa7UzIaFuvx+kn
	HZJWFFxRr3MgiWq4EnqXr00m+XR0L611DKHQ9zIq4nOvBwiDUgLee49mm5C8Xhl09dyL
	cjZQb8QNyDAe2p7fBwDS3hszSiST3yeY/PgXtNbbcxxGsz4DUUsa5hasDUBAjw/w5UoS
	8e7Rc+6l57iq5RR+pAt77eN5pbwPLMIjl9/Y/AH0wDVD8cX75EAXXa0HgeDRhBPysROf
	kcfU6gKGVqJNvHx4xKQc7+DI/gl/vkMnxfpYZ6nuT4zFgzDLxRZQ+ZfTZVmnBICQkCXa
	z40Q==
X-Gm-Message-State: APjAAAWZEfanBPzvUALCwsasWw6PfBDmlSOr+lFJKgttc9mmHcJio/EA
	ycss1FAaruJcENaUBLfe8y8BGYvVjYg=
X-Google-Smtp-Source: APXvYqwNhHU3kXMTAEClKiY/4v27Mhle2nfAasQPHFtiexDX2kQqwfw9MBMRDUBU0dmlzT/5LpTTUw==
X-Received: by 2002:a7b:ce85:: with SMTP id q5mr2838354wmj.54.1556625254950;
	Tue, 30 Apr 2019 04:54:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id f8sm244012wmb.32.2019.04.30.04.54.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 04:54:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 13:54:07 +0200
Message-Id: <20190430115408.21601-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Tue, 30 Apr 2019 11:54:14 -0000

Switch over to meson build, as it does not attempt to install
headers into /usr/share and pkg-config files into /usr/share/$libdir.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} (63%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
similarity index 63%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
index 5c3e1e6f03b..5aaa01a00a5 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
@@ -8,24 +8,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
                     file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
 
 # cairo >= 1.14
-DEPENDS = "cairo"
+DEPENDS = "cairo python3"
 
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
-SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e59494538f0b80497ad3462051368755016"
+SRC_URI[md5sum] = "7610da8a40a7bed548991aa3416431d1"
+SRC_URI[sha256sum] = "70172e58b6bad7572a3518c26729b074acdde15e6fee6cbab6d3528ad552b786"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-inherit setuptools3 pkgconfig
+inherit meson pkgconfig
 
 CFLAGS += "-fPIC"
 
 BBCLASSEXTEND = "native"
 
-do_install_append() {
-    install -d ${D}${includedir}/pycairo/
-    install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
-}
-FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-- 
2.17.1


