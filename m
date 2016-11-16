Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D665362134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:47:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 144so10216144pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ZBkoIf66MaZ/+qCCXfxCD4Xv2YZA6Jy0f53x6sqJAw=;
	b=VbdMA49CRqbozv9trZMzeUWHBoqk8vCBiEO8lsqhmm8Z2eMYwKGv8ZmB1cTyMI+RbG
	z8hphDRq2/cGT3wWMheP9/6WFgJaAP8mIOyDmtn3ohVXocMpukempDP61Dh8EWXs59Pd
	HMbA5IbKSAHd9aX6+c0u4KJwm0Jav7SS8wISkLLMUkudPhDtU5wb9fFeTo8cfz3iZkog
	ZjA87o3V8lKvMQ0pfjPWdkiC4VhggkQY20rGNANUv1s8WqAxkbAZSIvTT6LCuPA+RHBf
	iWrUC7GiViH0KojqM06Ncgg4McIR+NyUecqXQxR4sgWhHSiN0wkEb6iPw3g3m8l7vjYS
	1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6ZBkoIf66MaZ/+qCCXfxCD4Xv2YZA6Jy0f53x6sqJAw=;
	b=NFunTQ+20WXfaoo3W9O0FsEYjQbhYSY7LC9/WokAZLYBNTzvgGo/+T8ZhX0sFA3YD1
	92ANwIqcF3Ywcv9S/PN/uCB4Miw3wy98PdhJLW+bsC0/TAKeblfM5Fa1XDlMztyCsti0
	1fcT6l0brVo44Hq7e/REynRD4f1Cz6CwtU1Vg13ShuT2OWuWRogzR3tsjEn4Z4KQ7dko
	Ur3uP+8qp9ziud+gF8Nw8cLbopq1A+FOwZEzLSl3ERQ/fyPE6nVl/lZxX+VoFcjAG7cd
	cbZikIHeG5Wii1dBA20nuXvkcO2mT02JEIR+LBEPKwyG6t8tQUEa4r0fUTLUEgl3Z5b7
	qq9g==
X-Gm-Message-State: ABUngvfMVUA5Ip2ihoj84WIbow7eezIu7cVUvZPPkgKaQrOiMuibhdgwu2UI/ZOQ3McJpw==
X-Received: by 10.99.104.68 with SMTP id d65mr10597920pgc.52.1479318475712;
	Wed, 16 Nov 2016 09:47:55 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s2sm55946617pfi.10.2016.11.16.09.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:47:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:47:45 -0800
Message-Id: <20161116174748.26994-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161116174748.26994-1-raj.khem@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
Subject: [PATCH 2/5] taglib: Update to 1.11.1
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
X-List-Received-Date: Wed, 16 Nov 2016 17:47:54 -0000

Add depenedency on boost

Fixes

| CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
| Please set them or make sure they are set and tested correctly in the CMake files:
| Boost_INCLUDE_DIR (ADVANCED)

Enable c++11 in cmake as well as in CXXFLAGS

CXXFLAGS is required due to a cmake bug where
it does not honor CMAKE_CXX_FLAGS during configure
time checks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../taglib/{taglib_1.11.bb => taglib_1.11.1.bb}           | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.11.bb => taglib_1.11.1.bb} (71%)

diff --git a/meta/recipes-support/taglib/taglib_1.11.bb b/meta/recipes-support/taglib/taglib_1.11.1.bb
similarity index 71%
rename from meta/recipes-support/taglib/taglib_1.11.bb
rename to meta/recipes-support/taglib/taglib_1.11.1.bb
index c29bda9..408d084 100644
--- a/meta/recipes-support/taglib/taglib_1.11.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.1.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib boost"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "be39fa2054df40664cb557126ad7cf7c"
-SRC_URI[sha256sum] = "ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288"
+SRC_URI[md5sum] = "cee7be0ccfc892fa433d6c837df9522a"
+SRC_URI[sha256sum] = "b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b"
 
 UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
@@ -21,13 +21,16 @@ inherit cmake pkgconfig binconfig-disabled
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
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
2.10.2


