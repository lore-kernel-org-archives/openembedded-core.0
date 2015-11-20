Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id A582460722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 21:29:26 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so131489362pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UeRD6imkOxdUGST8eFFJQ/5F13Enr+jcvL5f5PI0qmA=;
	b=Hj33Jty4VsjbVllYiIBxJxLMfii77i8AUyyjlkJoDqVW77pgLC6MfsN8Po5JPVWcVS
	ar1DPTgndarlVHuBmsw6srm9DMyevKDw1CjwMQO18sDvY4ytvAzO6yxV0l70Wuwc89pd
	eC0pI4xgk8cvPpvZjichjJDONHZ6oM5mgYJOvtDKHS6KHQoz76HACchQR3rgCMghVTJs
	ZLdVKNPP83f43WtfLifgM2CElgmUoN78nnv92aYTjuTfvoISGka8OTE/omAllKkCWl6m
	27Tpw2tJ6eDxJDapeik3Ir66YqZzi151tT3fchUL6l8oQagYuozqVOOtIVxEd9d/XilW
	tHBw==
X-Received: by 10.66.63.70 with SMTP id e6mr2617338pas.32.1448054967042;
	Fri, 20 Nov 2015 13:29:27 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	rx10sm892699pab.21.2015.11.20.13.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 13:29:26 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 13:29:14 -0800
Message-Id: <1448054954-30680-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] harfbuzz: update 1.0.6 -> 1.1.0
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
X-List-Received-Date: Fri, 20 Nov 2015 21:29:26 -0000

  http://cgit.freedesktop.org/harfbuzz/tree/NEWS

Overview of changes leading to 1.1.0
Wednesday, November 18, 2015
====================================

- Implement 'stch' stretch feature for Syriac Abbreviation Mark.
  https://github.com/behdad/harfbuzz/issues/141
- Disable use of decompose_compatibility() callback.
- Implement "shaping" of various Unicode space characters, even
  if the font does not support them.
  https://github.com/behdad/harfbuzz/issues/153
- If font does not support U+2011 NO-BREAK HYPHEN, fallback to
  U+2010 HYPHEN.
- Changes resulting from libFuzzer continuous fuzzing:
  * Reject font tables that need more than 8 edits,
  * Bound buffer growth during shaping to 32x,
  * Fix assertions and other issues at OOM / buffer max-growth.
- Misc fixes and optimizations.
- API changes:
  * All fonts created with hb_font_create() now inherit from
    (ie. have parent) hb_font_get_empty().

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.0.6.bb => harfbuzz_1.1.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.6.bb => harfbuzz_1.1.0.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.6.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.0.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.0.6.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.1.0.bb
index 58541aa..e12dc0d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.6.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "2256fd144c936936db9c92e77510a011"
-SRC_URI[sha256sum] = "f616a7fbdc78a627043f9029000bf08c0c71df59cde4143fc92a014f6a993b26"
+SRC_URI[md5sum] = "1223cefac2bc77298ff5c7422bb148d5"
+SRC_URI[sha256sum] = "0f584a5947e60ede565e7a4e122baa5e4b17a62eab872abf5f73d8552ceb716b"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


