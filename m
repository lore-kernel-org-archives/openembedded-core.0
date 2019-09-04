Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0E32A60685
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 17:12:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p13so4713206wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s0Uh36HV6lGRd4N25K2dNaJkOsqqNOnUAVLd0zzDrS8=;
	b=xFIzjL09OjWnpdzWYy/Zp9olshUDcN/GMru1kRMlxekIFsiBBrlKlVgwUhBg1oroEs
	0xfPiyD1G3i6YwYp8YleVQaJbA/RPtQRkUflU+8J0Pzcvk5GR5CJmBxmOCBTZeqKBV7O
	s9BfSLo54XJyuuF1mnyiICTEJ+J6wGiUVVeFQVqS/rGpA/KmJFfAaL0h/RgvKKxZN6IZ
	acq0f9r6ru1WP5603hr1/ol5a2Z9xmgne97WlMeYitpLMqsZv1JZhCoriyK1jrHoL6JZ
	TfVXh6lWd5ibQPSQU8qo8w5sKnv6LsYMUGDY3gU1aAnlyPCr+rPVkgdGwmnWxkeealLu
	WXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s0Uh36HV6lGRd4N25K2dNaJkOsqqNOnUAVLd0zzDrS8=;
	b=jPSFi6GW0LcENA5nVOM+gSStc9mNoki+ccIxKp6SeH4Ry9zRnzYmWOvOKIAGR1sXoP
	sFidws8yuZ3WUU8w9XOXqfHhkMIX0kyczcYZFtRnQAZG0LrNrWp+NX0ydiMzFqRORSFY
	+eROI3HxHCnx74l0Aobg46vnv8T5P97CpGmIrSdZwYja1bmql31Ww55nmj91sLp0na0g
	mxRkMlXJ6OdUXaYOtGaQurpHJGOB8DVWfqtH3Bmi7q6EFboOSu39xF0z/bKKPdWPhc8+
	mhZOzXupQNfa3U8uDBhv6Blvzio7R9bwrcPGC1qn0CH/MWObfWaNeOZr5a4fHEB5WNxt
	X7aQ==
X-Gm-Message-State: APjAAAUNMhH1eR7HLtIym+uwOpmBguZOXvl4cY88dJK8KuZiBn0V+lIG
	Z2xCGCN9RGuqbkUDigls40iYP/5e0KI=
X-Google-Smtp-Source: APXvYqy0NBhZl+mv09xaN+6q/+rkkXvtFrdu3kAWqNffMyb0fXruOfz8KgnHLJJa/v4ZnQbFjtAEzA==
X-Received: by 2002:a05:600c:285:: with SMTP id
	5mr5760477wmk.161.1567617123251; 
	Wed, 04 Sep 2019 10:12:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q15sm4031639wrg.65.2019.09.04.10.12.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 10:12:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 18:11:58 +0100
Message-Id: <20190904171158.29525-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] harfbuzz: upgrade to 2.6.1
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
X-List-Received-Date: Wed, 04 Sep 2019 17:12:03 -0000
Content-Transfer-Encoding: 8bit

Add a (disabled) PACKAGECONFIG for Graphite2.

Update the license checksum for hb-ucd.cc, which for some reason was
checksumming the entire file and not just the license header.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../harfbuzz/{harfbuzz_2.5.3.bb => harfbuzz_2.6.1.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.5.3.bb => harfbuzz_2.6.1.bb} (76%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.5.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
similarity index 76%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.5.3.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
index a90ff522554..b0f565b9b07 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.5.3.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
@@ -5,25 +5,25 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
-                    file://src/hb-ucd.cc;md5=343f1797944de49ab2b5f5cf3126d3f2"
+                    file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
-SRC_URI[md5sum] = "29a310e74a90b4e4f6d62f3e74a571e5"
-SRC_URI[sha256sum] = "fed00dc797b7ba3ca943225f0a854baaed4c1640fff8a31d455cd3b5caec855c"
+SRC_URI[md5sum] = "89b758a2eb14d56a94406cf914b62388"
+SRC_URI[sha256sum] = "c651fb3faaa338aeb280726837c2384064cdc17ef40539228d88a1260960844f"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
 PACKAGECONFIG ??= "icu"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
+PACKAGECONFIG[graphite] = "--with-graphite2,--without-graphite2,graphite2"
 
 EXTRA_OECONF = " \
     --with-cairo \
     --with-fontconfig \
     --with-freetype \
     --with-glib \
-    --without-graphite2 \
 "
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
-- 
2.20.1


