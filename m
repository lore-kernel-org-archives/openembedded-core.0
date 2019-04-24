Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3414C7D676
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:47:13 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k2so3636948lje.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eCWWeIuZFZczcyIiTqhT5IoXN6BQYIV+qOi4tghoYPU=;
	b=nfXLzxHmmmiZeH9d+GoHLCG0MyWGI96lqwmkWolplAZrc1LrZfsU4Hd4LYpk4XZBvw
	OpEUdcSVZU00eivrNchcBnBj14nx3n86EcWn0DuokN227nGi3ic8Cvm2ASLVYk3mLGC8
	9r9GrwjFwxLmStB64gOvJDWzXet26NQlPC62gyAIO+dmgpKJTpCZNZEMnapUmaDeJGiC
	7d6jM3fcgbF9ElRozwXo8upllHL50dWWABwljaU9p+sZ4kvrBxgGRakQyZqanS4EGh9x
	O0ULEaKg8q/vVyL5pU1xiMuVxZxPyoweGwfpS9Cn1HXTgdHzLg47qCWcN13niqgZ3Dr2
	3lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eCWWeIuZFZczcyIiTqhT5IoXN6BQYIV+qOi4tghoYPU=;
	b=qechDqA4vyYIlJp3piIQQsh5tefijmiK8peseA/aiGjkn6qQmPBvumtMZZRxLmY5pa
	u4CNLwXoItZEGSdDDP6LAcDmZ9dQFqSJl+cd+U0KNTcsNw5thQnYTAx3bcSCaCXvNYUX
	be1Ky933YYCmctcgx6oISca5we5S2eivMNyF/RzYpXPVBvvjWOrokpS1p8V6xYdzE+qr
	CdusIMT+OrpqU6YKCZ4UT9xLST7YDyG6no05tDckfgacB/UEgBxTr0lEHhIqbYkJhRkD
	XUNJ0M4BVtykjOWqhF9RCLpzslevrfARSmJtO+sz6YqgFnPnZMbstRhIp+SvMNUoiW7h
	2jjA==
X-Gm-Message-State: APjAAAXU7RqXyuicdWWEnbCA+BhjjYsT6et2Sh0MiCq34y51sgiCLhDd
	Eos+Tc2V5PKAhlufSzdRrXDfDBxW3OU=
X-Google-Smtp-Source: APXvYqyAakWbd7+iHxqPGcm4eBatoKetvYrHcHsuIvVNS6+224Kb2x0v6Xuj/F4BUs/wqMTtcca5wA==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr4912115lji.45.1556131634491;
	Wed, 24 Apr 2019 11:47:14 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id w2sm1716117ljh.72.2019.04.24.11.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:47:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:47:11 +0200
Message-Id: <20190424184711.19015-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Wed, 24 Apr 2019 18:47:14 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...on3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
index 5c3e1e6f03..6ede00b89e 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.18.1.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
-SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e59494538f0b80497ad3462051368755016"
+SRC_URI[md5sum] = "7610da8a40a7bed548991aa3416431d1"
+SRC_URI[sha256sum] = "70172e58b6bad7572a3518c26729b074acdde15e6fee6cbab6d3528ad552b786"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
@@ -28,4 +28,8 @@ do_install_append() {
     install -d ${D}${includedir}/pycairo/
     install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
 }
-FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
+
+FILES_${PN} += " \
+    ${datadir}/include/pycairo/py3cairo.h \
+    ${datadir}/lib/pkgconfig/py3cairo.pc \
+"
-- 
2.17.1


