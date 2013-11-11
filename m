Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6812B6CC86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 17:25:28 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id b13so1361097wgh.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dj4rOo82RWGWqHTK9pr0XaGTh5J9+sgB7D8FohSvzNQ=;
	b=c3oqEDB+uZxae7OroPvBiDN3msztEOw6rkAQo3BYWdLzM/0mExHRZFKKf6t7b5WNe8
	8cCkrgf7gN1V6rnGCA7xuDn9br9wxt7mAJuEdUsPwNL3DSZ6hGyLQuJzfVnW7sHYRShr
	GaSxuKsHmTKeJ9QzVdtiZ5S4PBVryVJ+TIkj30DMZLQOEuvjOuGtepEo9yyWfkQHYJHp
	t/0UfvzcMg33F/4anAflaYYynVSnnap+P/yrcTpTTff5uFSIBMv8O8Liw9r8ymZZyIrx
	C6iApI88y24utL/MHKvdw26ZKpFkU8Dcmb6UHQJU3OUwkO5L5RG1va0+UK30st3smhRb
	bV1g==
X-Gm-Message-State: ALoCoQkSvSUSAevlF9H27EnKLoUQ/AUxQB1m6doOmLHop6p+TT4e6Q9pNj4suNpSYyS2QwtpqJXU
X-Received: by 10.180.24.6 with SMTP id q6mr2321907wif.0.1384190728847;
	Mon, 11 Nov 2013 09:25:28 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dz5sm12165437wib.7.2013.11.11.09.25.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 09:25:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 17:25:22 +0000
Message-Id: <1384190723-21986-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] freetype: upgrade to 2.5.0.1
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
X-List-Received-Date: Mon, 11 Nov 2013 17:25:30 -0000

Add disabled-by-default PACKAGECONFIG for pixmap glyphs (floating dependency on
libpng).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb}       |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb} (86%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.12.bb b/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
similarity index 86%
rename from meta/recipes-graphics/freetype/freetype_2.4.12.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
index 701c629..0b69af9 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.12.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
@@ -13,12 +13,11 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "3463102764315eb86c0d3c2e1f3ffb7d"
-SRC_URI[sha256sum] = "a78a17486689ab6852a9e1a759b179827ac9dfd7e2f237ddf169c73398c85381"
+SRC_URI[md5sum] = "c72e9010b1d986d556fc0b2b5fcbf31a"
+SRC_URI[sha256sum] = "57bce5b37989577aa8b4a588426839f6bf39bcc3869748cb18f6827df251f4e5"
 
 S = "${WORKDIR}/freetype-${PV}"
 
@@ -29,6 +28,9 @@ EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
 EXTRA_OEMAKE_class-native = ""
 EXTRA_OECONF = "--without-zlib --without-bzip2 CC_BUILD='${BUILD_CC}'"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[pixmap] = "--with-png,--without-png,libpng"
+
 do_configure() {
 	cd builds/unix
 	libtoolize --force --copy
-- 
1.7.10.4


