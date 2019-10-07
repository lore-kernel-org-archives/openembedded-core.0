Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EBE036011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:38:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j11so9574042wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A3WbGVSPWAMwsCdn8stXU5nvctQ8m2u/mVO7rMB/lYY=;
	b=N3SyHwr84v5Jh/qMHlsg9xrAKQRZPM5HEhvGzPd8hD8vnX06g7vw31GUxmoctNrO/c
	z7TJAHPyEHhIB4Y/Cus9nOBMuvwVoz3ltKloNFotNeRHflaPAPai+9iNZvpGS17SWaWA
	EM9wfW5jhjWX7GhdutSfz2PHcUKFUTgS+g5hdTeLA07aYFucEpzdKXK8RTxQMoLKnaIa
	k8kz1zFxotwCj7epgv8vZQY9B2MSRmO09h8jZ4vO621gCxOVo9g5WqWLhPp6W3WAPR4Z
	Ug9/zxjR+JHFwK/1Yy9Sw3nuCCm77+mbciiat5thPo4g4fRDUZRSy4XNj6FITwKirq4D
	mixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A3WbGVSPWAMwsCdn8stXU5nvctQ8m2u/mVO7rMB/lYY=;
	b=NqQko5dLTOkl8SSkUvgj8y+g6nPhemA+1Su5/r1PQq934kEvyzXMO00QhaU9Z9TFW8
	LCCqhK6c8e+jnGgw881CUvbmAA5gUwhN2K2YIVkdec7/a433Xl/Bf2ZHwQGM3G6PIQak
	euNeub2E4SlH0Iqxbhf1u9NLoE2tWKkTJ5p46HfjGZ/sMBCM3J5SPfX1unMzaD/+JJVd
	Ejw0R+LVyCmGrMnnbpcY8rLhh6ebEabQ3uMrjgrT5uWzg4e5l2fKOlLmq4rK/ektZWuJ
	o+z0SaHF/71J7pHN+VGkHKfZSJ6vb3Z5983U5BLNAHuBEOX5/gcztDQ0loWDnANaDZMA
	l3aw==
X-Gm-Message-State: APjAAAWCq9jnR3NF2mz1SW/9fo8k5rH1w0GmcMbmKSguW6JbAgytM60O
	yEgBkkxqDxgt4W7PJ6selE2vZJc+jYQ=
X-Google-Smtp-Source: APXvYqyS11L3vqyYY6SrOivKhg2xnam7HiD78vrZRL1bFBzR4u8ZaHe5a4c9gZQ/ha/ElaAX2NPEsA==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr22575933wrv.207.1570455521359;
	Mon, 07 Oct 2019 06:38:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w3sm5473340wru.5.2019.10.07.06.38.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 06:38:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 14:38:36 +0100
Message-Id: <20191007133836.1307-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pango: add PACKAGECONFIGs for all the optional dependencies
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
X-List-Received-Date: Mon, 07 Oct 2019 13:38:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
index b0f565b9b07..b8a89d005e5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
@@ -7,24 +7,19 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
-DEPENDS = "glib-2.0 cairo fontconfig freetype"
-
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
 SRC_URI[md5sum] = "89b758a2eb14d56a94406cf914b62388"
 SRC_URI[sha256sum] = "c651fb3faaa338aeb280726837c2384064cdc17ef40539228d88a1260960844f"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-PACKAGECONFIG ??= "icu"
-PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
+PACKAGECONFIG ??= "cairo fontconfig freetype glib icu"
+PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo"
+PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig,fontconfig"
+PACKAGECONFIG[freetype] = "--with-freetype,--without-freetype,freetype"
+PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0"
 PACKAGECONFIG[graphite] = "--with-graphite2,--without-graphite2,graphite2"
-
-EXTRA_OECONF = " \
-    --with-cairo \
-    --with-fontconfig \
-    --with-freetype \
-    --with-glib \
-"
+PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
-- 
2.20.1


