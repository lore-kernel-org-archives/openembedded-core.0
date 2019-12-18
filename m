Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 383607FF7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so2566686wro.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5C9uqt8kvyZ+FJLiameK01PE3DYemsDSHPj6DrUGMUU=;
	b=BijAr0+hGLncw45m5IB3AgnBvD9dXgqPUUdUMuuG+Ifjqnkg25kesMaYfFfMEVLCHV
	2J5JWHYAqnzs657FsPxu+NvFNJe+7AIW1O2mg3N6+Rc0KW3kjlVPqb16cKhP2XD6Vezm
	JHIfdz6qqS8vn3aNlW/bF3dEsxQRAQafBDRl9IsN9d6e6RiHSYtjhAvvOhwCpHb4mx82
	V4GBBkqyfw1baURkaMwTy4QR4/Pyg/cHC95xaZJx/B60xc2LtVXD8/3OUBENAuta6/0j
	bz9BkIreuBzivESQXrMCbKk1YyJHPQNH4D9nSWRLgLhdTKc5DXTAvaeOmFxSWBrN/ceX
	IxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5C9uqt8kvyZ+FJLiameK01PE3DYemsDSHPj6DrUGMUU=;
	b=nb4wsx433U/mXjwn/iOn689LtL+qHq4E+tAlE+RbfwVYhbIpLEohTR41bcVh+MKpFH
	g6bTUj6v+7+8cWMTylM6PUiXtiXckhL0dcF6CB/r/eIBrasGQMl695IRC+nvo17Um7Nb
	HDujulzRvFEe7eU7SLOlCVJZxV09mJNFRNZapelNsDmVBQL8eWARsDXM/VTrVKz1rn4L
	Aip0jgnQ7ZPh1p4JelH1uNotXZjg3/rVkvNgEVzOHTsg6LDm8RQu/3RNotQkbm2NQOEv
	R6usxgV9Tru6Ht6cBUXFcs0sF7x47RyDrxdyf0sjWSXLCkvmzMqC9XhItFlXwQ9Wgydq
	ev0Q==
X-Gm-Message-State: APjAAAWfOOpgwJj7T25m+F3Yy5t4Loiy590UMUK/jVANSppLajSCjxSW
	gLnRZAzPjznVe8lE6lNQ5z/VGv2K9uo=
X-Google-Smtp-Source: APXvYqy/Jub2nzLpeFeFXQaIEjn3HI6rx6KCf2d00ZQ6fUA3PwpR/o00mLW6Av71Tdm+HG/JKsXX7g==
X-Received: by 2002:a05:6000:1044:: with SMTP id
	c4mr3384873wrx.204.1576679897772; 
	Wed, 18 Dec 2019 06:38:17 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:49 +0100
Message-Id: <20191218143758.129308-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/25] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:17 -0000

License-Update: formatting, dropped the gpl texts, as they're
not anymore in source tree, and the main file is specific enough.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{lttng-modules_2.10.11.bb => lttng-modules_2.11.0.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.11.bb => lttng-modules_2.11.0.bb} (83%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
similarity index 83%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
index cc4f44519a9..3465a43d388 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
@@ -2,10 +2,7 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad \
-                    "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 
 inherit module
 
@@ -20,8 +17,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0004-sunrpc-introduce-lttng_get_clid-helper.patch \
            "
 
-SRC_URI[md5sum] = "c618fb646514dfc1bf910cfd7cda4256"
-SRC_URI[sha256sum] = "7f91e39b2e8e46d8bbba2b4c8c1614f1fb380611cd1a1fccc1d1859be26112f1"
+SRC_URI[md5sum] = "46ec6c566e65cf27b391a1bb643e11b4"
+SRC_URI[sha256sum] = "98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7a535a491e4fad5f"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


