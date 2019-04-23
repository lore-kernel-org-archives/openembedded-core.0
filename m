Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D56147D305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c1so816255wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TBVUSasSLPjregGbYT9FuK0al7BOqwnJSlzJzootz+o=;
	b=B0ECUS+nldkeLX81Um/7y8mu0hEvwkg9eiNU2R8jUSLBF4aMZJd+9szM3HWghSkK/Q
	JX+2eTPrc6nSg6bVqvlugAAWBwz+xSoxiGaSJDamRVKvnh+D1QLWpAKdc3av+PqbkUly
	kYSHO9OnrBclSm5UBkVnBLVMFRcNcSrZfAOte3UBg6gQHHS3WkWU3ZCHFU+92TGb44ZG
	fkPArwdM5EddXIXhDUUmiwnu02FuapPyKF8BQ/Eua8qC/jPaa4tZhgU8UDBWhRIkdJQn
	Hoe1OgVtg/Qd80Alsb4L5bq+KYGyoEmFxJ+UwcFrOshTF4TlipZBRO5lRrLNUy+2v80O
	Lflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TBVUSasSLPjregGbYT9FuK0al7BOqwnJSlzJzootz+o=;
	b=Ni67Tu+TCom97qcDhHLALnN5aEDhwt22Y5DNOs1UD7lGIxhRWLugwYA38sn4+1U9PZ
	EsiAmN26mIizY6l5V7P8vB03LDO4R+fkYszVOGNG1w8J4VPPFwf00nIhflPvwdrs/yoX
	Se8N7FiFNmmvY5hsljACqbe6b60+ds1dhvJk2pRMYGm4huGBnVdFS0smUcMEEoSB/Q8d
	UQ3bhApSw+mrK3WzGnfNIz79ZMZirlkAFrDm8XSgAsNXN8upy1AQUPimg5abnsveDF6h
	asC/5iuNWmgu1tcORGV/ztoYcQACA4TJ8xfnarddAaRD5459PzqB2aS3qPLUkse28rhi
	dXFA==
X-Gm-Message-State: APjAAAWrg2tqE4N25kuouQVjjUZHYCTmK4XVhlNii7lcxvYKKBGv3x8h
	VGX0dvhOFjaouz1PkghRU7csWaWm5+o=
X-Google-Smtp-Source: APXvYqwqclEaDz9WUkkO7pbiHiyuQ2fyTpaXjuPEDZdoM7uOdDfhiPb4aEwO0wfjWbyCdd7xVhIBEQ==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr2918791wmj.37.1556036373350;
	Tue, 23 Apr 2019 09:19:33 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:16 +0200
Message-Id: <20190423161916.25572-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 9/9] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:33 -0000

Switch over to meson build, as it does not attempt to install
headers into /usr/share and pkg-config files into /usr/share/$libdir.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} (65%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
similarity index 65%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
index 5c3e1e6f03b..db7cc921984 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
@@ -13,19 +13,15 @@ DEPENDS = "cairo"
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


