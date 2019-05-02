Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0AF7D59C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 19:43:34 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h21so3257018ljk.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Chi0SZl3Z7CLhEnHYmhHN8PriaSz8Dx05ttImSx0nBg=;
	b=d7zsl+aG1QmrFDq+Jd/KeoL3XhYnsiWdX9HhQw2v2Z5z0tnF0CRco3ZtbUHnbcnvfD
	9TNhuWUOjw53YDH5uLajsjy0fhH6Px2QboZfwFuazBkYvCfhN2H6euXy5kRNblZP8dEk
	anqcjeRRWSNAeLHHZRM0uiEZ5eyDTY9GJOjGoAYNvW4d0zNzqGfkG0yX3k6psYBu47Wv
	X+lB94/WokVMl3nZILu3b3kp+27fHWtBa3PSRCWmSMQi6o/ZgGj/0MGtBi7SC/32q0te
	cPV96Cn/U/ZVvw456lCZYC/kid97Qi20DHnTdeXP4T8KY1BcD5Bu74NE/BcvlkIBxrSa
	MHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Chi0SZl3Z7CLhEnHYmhHN8PriaSz8Dx05ttImSx0nBg=;
	b=k2yxcaCYJxxp6Y2agVCvOpMZFcjH+0DOSHaIJBj+2QdCc7P2o6GcH35nCTlV0MZEae
	N3i3qj8tAL/YBoqKME+MwGqawc/skvbtZ3lh7sMd7wAvWPCMCxg0JMz6zHr3M+vsEbIh
	919oiLq29Qrja9M13sL+j7iC8Hb2R+YPl/Oi7bslMDMHMs4YZKDMwMsLk7ialhVu7MLE
	1PWD3G57AnflCAG6yQJW7+S36Bdcj2yOTpAlNqurGyXx9DFP366vE4cud//W+GSJeTTE
	hg6jOtI1f+ylvWxBieo6yWL3vzgQzPHjVfSTVWD90InLO6GZvClmcN8Dgb7K305vMOyb
	dClg==
X-Gm-Message-State: APjAAAWAA9mhpHDwf6EdBH3csWCnKGJpgFj7Mv/8rJlYjNW/Rx7V6t6O
	wN1lh5bkYRoQC/QsJfrVCaSrLcWNi3E=
X-Google-Smtp-Source: APXvYqweBnI7Q9aP9RGbafBM0mYi08cZU6TYJYWlWobBglsUv86wXnMSDPN9UKvTTazD8EDV6n5vfg==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr2971750lji.45.1556826214663;
	Thu, 02 May 2019 12:43:34 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	s26sm8968996ljj.52.2019.05.02.12.43.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 May 2019 12:43:33 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 21:40:54 +0200
Message-Id: <1556826055-7896-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
References: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 1/2] meta: unset REQUIRED_DISTRO_FEATURES for libx11 and its dependents
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
X-List-Received-Date: Thu, 02 May 2019 19:43:35 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is to allow libx11 to be built without the requirement for x11
distro feature.

The reason for doing this is because the libx11 is providing
libx11-locale package and that is being depended by libxkbcommon at
runtime, and libxkbcommon is not a X11 specific recipe, it should be
be able to be depended by other non-X11 recipes like weston or qtbase.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb   | 2 ++
 meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb   | 2 ++
 meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb  | 4 ----
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb | 2 ++
 meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb   | 2 ++
 5 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
index 6141f57..5c96e9a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
@@ -10,4 +10,6 @@ do_configure_append () {
     sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
 }
 
+REQUIRED_DISTRO_FEATURES = ""
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
index dcfc666..c4e5078 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
@@ -18,6 +18,8 @@ PE = "1"
 
 XORG_PN = "libXau"
 
+REQUIRED_DISTRO_FEATURES = ""
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "c5f16288f2da9f071b29111d68797480"
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
index 84303e6..6f9e700 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
@@ -28,10 +28,6 @@ FILES_${PN} = "${libdir}/libxcb.so.*"
 
 inherit autotools pkgconfig distro_features_check
 
-# The libxau and others requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-REQUIRED_DISTRO_FEATURES_class-native = ""
-
 export PYTHON = "python3"
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
index d43a146..254e015 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
@@ -20,6 +20,8 @@ PE = "1"
 
 XORG_PN = "libXdmcp"
 
+REQUIRED_DISTRO_FEATURES = ""
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "115c5c12ecce0e749cd91d999a5fd160"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index 5bf134b..27851b2 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -20,6 +20,8 @@ RDEPENDS_${PN}-dev = ""
 
 inherit gettext
 
+REQUIRED_DISTRO_FEATURES = ""
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "ce2fb8100c6647ee81451ebe388b17ad"
-- 
2.7.4


