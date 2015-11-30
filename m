Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D9EBF605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 07:24:47 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so176101774pad.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Nov 2015 23:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8bjxSF/2jeiyle0UzTeu0OeV0finPK9KH2VV2JpcdD0=;
	b=pZCWZ4+fDD5PaLc7D28ubqXNAQthiTKw3okbjOVv5YvirUBz0fc9knhIeWEWJ3Xp68
	YZNhnHGp89LywE7WY3ml6POlfMmyvecLmeSkRLBhdACK9G6wmnlARdM+mIPTmZvEroUR
	NlpoAdOXN9SwLP+Bf3ALc4uwRxVbZowSfVQnCLdg/KJSrA4HAfzOHssN75m4bS7yKr7+
	8ptmkptqIJ9Gc84knnAQswBdSTNu4Zll2U6zSJyPTs5vMl9YzpTdQwP0uxm7wmDMlkJB
	SVFW8BdqDQjLktC1RMixY+NV0R7pN2ET5EID5TlAD5LKoaSzSejykAsXj94BxJj7ZI9T
	zVlQ==
X-Received: by 10.66.216.7 with SMTP id om7mr87748173pac.90.1448868288749;
	Sun, 29 Nov 2015 23:24:48 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-82.dsl.dynamic.fusionbroadband.com. [173.228.90.82])
	by smtp.gmail.com with ESMTPSA id
	kh9sm49610888pad.11.2015.11.29.23.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Nov 2015 23:24:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Nov 2015 23:24:41 -0800
Message-Id: <1448868281-6392-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] harfbuzz: update 1.1.0 -> 1.1.2
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
X-List-Received-Date: Mon, 30 Nov 2015 07:24:52 -0000

  http://cgit.freedesktop.org/harfbuzz/tree/NEWS

Overview of changes leading to 1.1.2
Wednesday, November 26, 2015
====================================

- Fix badly-broken fallback shaper that affected terminology.
  https://github.com/behdad/harfbuzz/issues/187
- Fix y_scaling in Graphite shaper.
- API changes:
  * An unset glyph_h_origin() function in font-funcs now (sensibly)
    implies horizontal origin at 0,0.  Ie, the nil callback returns
    true instead of false.  As such, implementations that have a
    glyph_h_origin() that simply returns true, can remove that function
    with HarfBuzz >= 1.1.2.  This results in a tiny speedup.

Overview of changes leading to 1.1.1
Wednesday, November 24, 2015
====================================

- Build fixes, specially for hb-coretext.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.1.0.bb => harfbuzz_1.1.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.1.0.bb => harfbuzz_1.1.2.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.1.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
index e12dc0d..f34a647 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "1223cefac2bc77298ff5c7422bb148d5"
-SRC_URI[sha256sum] = "0f584a5947e60ede565e7a4e122baa5e4b17a62eab872abf5f73d8552ceb716b"
+SRC_URI[md5sum] = "e6210d3cfd4064d95621fc16913268ed"
+SRC_URI[sha256sum] = "4a2c5790bd3db7c3ca8c02e4858f2fd592df7932c1d2fa9f6b99acbce0f8461f"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


