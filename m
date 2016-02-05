Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 73FC877254
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:56:29 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id o4so3747819obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qJkC4TDgsoL+m9git45rTCRHOQskEsi2khFS2D79FvI=;
	b=ihpWD5Exgq2S7Sqdeybs3+FcHg90n9N37XImL9dNm22YmOQ91YIC5hfq5pW92BQZEb
	xKiT0cGSs9qiLjswbEGQCh2q1Z+xD3bu5Zy0nEyL9/7U8fiKt6yL5KsKIH1ctkWSllTK
	H97Ecu73WxM2GsSfOf3e0YhUz/GVEFf6efrPfscR3/3IFWbt1lv5lyktyCBSbNFQcvPr
	QVTdy7IHslH251VGo+CB7dXwEo5KPYW0TGDMrkdtjBmJnpWoasd9MXPtBpq27tNSRRQD
	I7TyO0yGCuvjUtqVZS8ckB6Fdj5iyX9RooAjBw6vtFqGrjvwu6MWeVU1ZfXgcKuhFht0
	Jmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qJkC4TDgsoL+m9git45rTCRHOQskEsi2khFS2D79FvI=;
	b=NS7cWvng+hZVTNO4iBBWhjuuchdwu+Q2pGXz6Tg9gZ+LUFoaeUUdxu9EQCl2a1a1rj
	u2r/PW4RkiHPHUytXQAkr0n0xDyL/HgBaoPBK3vSl47iBcAu2McZ9R+WD++HD1eX7tWZ
	gtKKfkmOce9834Wyi+bZIkCylnTPLqzgbkUJOkJ9rISbZLaQsPYJohP0mAeM+wiSSFj5
	g8LuUJ82CPdAN/N6fYd74egQEDGDSHmyACKBq1KwQszSpbOu0sHHDo/ovBt+JFRIjASG
	1+yf+7OLVSyPzSIvG0w7SorBlC5QI0rE01JPh/8j9lHA3F73yafwXKaNUG+WWGFCyTtx
	ylhg==
X-Gm-Message-State: AG10YOQFOE+CvEIpFMakC5q4ZB9NkfMEJn6xecn62HDy6ccDkw7fIfaL7mdO87cOcaNiRQ==
X-Received: by 10.60.232.99 with SMTP id tn3mr13407752oec.8.1454702189932;
	Fri, 05 Feb 2016 11:56:29 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f9sm10046151obw.13.2016.02.05.11.56.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 11:56:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:56:16 -0800
Message-Id: <1454702179-30239-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
References: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] gmp: move SRC_URI out of gmp.inc + minor reformatting
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
X-List-Received-Date: Fri, 05 Feb 2016 19:56:29 -0000

The base SRC_URI in gmp.inc was wrong for gmp 4.2.1 and was not being
used by gmp 6.1.0. Remove it and make each recipe responsible for
defining its own SRC_URI.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gmp/gmp.inc      | 11 ++++-------
 meta/recipes-support/gmp/gmp_4.2.1.bb |  7 ++++---
 meta/recipes-support/gmp/gmp_6.1.0.bb |  5 +++--
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 6752a39..1e3e2a0 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -1,16 +1,13 @@
-SECTION = "devel"
 SUMMARY = "GNU multiprecision arithmetic library"
 DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers"
 HOMEPAGE = "http://gmplib.org/"
-
-REVISION ?= ""
-SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2"
+SECTION = "devel"
 
 inherit autotools texinfo
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
+
 ARM_INSTRUCTION_SET = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index bfc6a38..c25e5ea 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://gmp-h.in;beginline=6;endline=21;md5=e056f74a12c3277d730dbcfb85d2ca34"
 
-SRC_URI += "file://Use-__gnu_inline__-attribute.patch \
-            file://gmp_fix_for_automake-1.12.patch \
-            "
+SRC_URI = "https://gmplib.org/download/${BPN}/archive/${BP}.tar.bz2 \
+           file://Use-__gnu_inline__-attribute.patch \
+           file://gmp_fix_for_automake-1.12.patch \
+"
 
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
 SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
diff --git a/meta/recipes-support/gmp/gmp_6.1.0.bb b/meta/recipes-support/gmp/gmp_6.1.0.bb
index b26b4d5..44bd8a2 100644
--- a/meta/recipes-support/gmp/gmp_6.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.0.bb
@@ -1,17 +1,19 @@
 require gmp.inc
 
-LICENSE="GPLv2+ | LGPLv3+"
+LICENSE = "GPLv2+ | LGPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 "
 
+REVISION = ""
 SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://amd64.patch \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            "
+
 SRC_URI[md5sum] = "86ee6e54ebfc4a90b643a65e402c4048"
 SRC_URI[sha256sum] = "498449a994efeba527885c10405993427995d3f86b8768d8cdf8d9dd7c6b73e8"
 
@@ -27,4 +29,3 @@ do_install_append_class-target() {
 }
 
 SSTATE_SCAN_FILES += "gmp.h"
-
-- 
1.9.1


