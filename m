Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DEC6B60589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 11:19:22 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id t79so19405682wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bAiZgmo4hkelQ3kiA3Ga6wzdAfaHLlycFcjaVNipcY0=;
	b=jrSEl1thQGwM48X1MqOmvWt96yDfOtHE9KqvaCu3i99PI7vH9wqidT4Z7qtoK4TMd5
	oxY+Ofu87YK3IBKg27wdoXCbh2qvwHMc8iYmR/AQf8Xm8jimd6GcaALcm2ZNmpKRC5If
	SOKWYnMWQ9VmOWi/d4yJA4vl3eKvlHUj9jnLCy5KZ6PM1a6rOANp8t+xXV8pc5deQ03J
	EO6PlYneNhb6TKSE6HpbAM0K1nSvF60h8XcYo8vyTt3Z/aKwX7XMZCfbagW/OtoXgAwF
	kH/ZRpbb3cCHvWaWZ6oaOyFVFB3wD7QZL8Q953h1fiH2yGuc4DFZ2Q1MYxqn3tKJo+8U
	41VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bAiZgmo4hkelQ3kiA3Ga6wzdAfaHLlycFcjaVNipcY0=;
	b=I0orT+p+b9raSmsCRrtZqW+BCckJkDH0Qopf7TXLX84f0AG9HMLWgshxS4uk83i3RW
	0g2SDjB1v0VCpsoeXLv7NvMYjjW8g+Lc0tznNsYN4D/7I0iR8X8q+NSiVjxU8nQiSPzH
	A+CFiVjiOalDIMTjdCiQW4QqE30utw3Ns/LVn0sD/lBWCQxqUAuH9w5G2UlA0UuUylvP
	RcYrcn22uv5cd2Nkzut6QbarxuZOgb4S2lAg1Y51caWRDt08C7ztDs4OgHaa7F7GmfCs
	5nKOBTTsfO/CL45f52sjaF0u2f4vxBphR6KnhUm9/2einH25EC6Z9xUJu9eiNleJoL63
	FsoQ==
X-Gm-Message-State: AKaTC00KWDnA5HEeuZqb41OJPKeOJ5uBtypcwDnX52dtLPa4TnNACP5wN1PDi9W4uxO+I8XC
X-Received: by 10.28.167.139 with SMTP id q133mr1996944wme.15.1479813563282;
	Tue, 22 Nov 2016 03:19:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b7sm30314245wjm.39.2016.11.22.03.19.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Nov 2016 03:19:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2016 11:19:20 +0000
Message-Id: <1479813560-8696-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] taglib: Update to 1.11.1
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
X-List-Received-Date: Tue, 22 Nov 2016 11:19:23 -0000

Forcibly disable Boost as the macros it looks for are also present in our C++
standard library.

Enable c++11 in cmake as well as in CXXFLAGS [Khem Raj]

CXXFLAGS is required due to a cmake bug where it does not honor CMAKE_CXX_FLAGS
during configure time checks [Khem Raj]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../taglib/{taglib_1.11.bb => taglib_1.11.1.bb}           | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.11.bb => taglib_1.11.1.bb} (68%)

diff --git a/meta/recipes-support/taglib/taglib_1.11.bb b/meta/recipes-support/taglib/taglib_1.11.1.bb
similarity index 68%
rename from meta/recipes-support/taglib/taglib_1.11.bb
rename to meta/recipes-support/taglib/taglib_1.11.1.bb
index c29bda9..ee1b523 100644
--- a/meta/recipes-support/taglib/taglib_1.11.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "be39fa2054df40664cb557126ad7cf7c"
-SRC_URI[sha256sum] = "ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288"
+SRC_URI[md5sum] = "cee7be0ccfc892fa433d6c837df9522a"
+SRC_URI[sha256sum] = "b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b"
 
 UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
@@ -21,13 +21,18 @@ inherit cmake pkgconfig binconfig-disabled
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
+                 -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE \
+                 -DHAVE_BOOST_BYTESWAP=FALSE \
+                 -DCMAKE_CXX_STANDARD=11 \
+                 -DCMAKE_CXX_STANDARD_REQUIRED=OFF \
+                 -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')} \
+"
+CXXFLAGS += "-std=c++11"
 
 do_configure_prepend () {
 	rm -f ${S}/admin/ltmain.sh
 	rm -f ${S}/admin/libtool.m4.in
-	# Don't have a floating dependeny on boost
-	sed -i -e "s/atomic.hpp/atomic-not-exist.hpp/" ${S}/ConfigureChecks.cmake ${S}/taglib/toolkit/trefcounter.cpp
 }
 
 # without -fPIC depending packages failed with many error like:
-- 
2.8.1


