Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D81D65F2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 16:05:45 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id n12so1231924wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 09:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CYJSjsoV8zZwSah5ONyOIyVaHIKd+Q+7rYnE0ORwE0Y=;
	b=hQD1ub9gX+tFl7ZbX6ClaBrYS4JT57hkc2iRnAmzIIvDvUM3n+1R9epVNcz9g8MRjE
	JFJog/Dr7sESThdxvUhNWFkj/JhgT1tESZ0Da38dT8leq0HoLQoNB/l1UdMeJsi32wuq
	tiAyJl5r4vx9yFvgqzMTy33MjWnfzYD4d+xZzTUfNeiQIdZbomysxkxrDMbMKI4fxZE+
	jQdE1bZPuK4IQxGkizlxIo4g5J6FyuBRq6YlxgYhgf58+dOKBCp8yt4F8q4bugwRmkGt
	z6WwU346WKNbAnp0OmIrNgoDvH5+bPX1ZLNjppaZXYnt6CeIFimJaea/O9FrbKDEqOWE
	+muQ==
X-Gm-Message-State: ALoCoQljjiblgxo7/4AdLG/dvcwDj9BJQBGFesdxhj0CBV9eJBWmhUTKgY7bBCKLI9/6A95uB3zv
X-Received: by 10.180.13.209 with SMTP id j17mr27043750wic.18.1399478746566;
	Wed, 07 May 2014 09:05:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	cd10sm32480474wib.0.2014.05.07.09.05.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:05:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 17:05:34 +0100
Message-Id: <1399478735-27819-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
References: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] freetype: upgrade to 2.5.3
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
X-List-Received-Date: Wed, 07 May 2014 16:05:46 -0000

Also drop the redundant definition of S.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/{freetype_2.5.2.bb => freetype_2.5.3.bb}        |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.2.bb => freetype_2.5.3.bb} (89%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.2.bb b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
similarity index 89%
rename from meta/recipes-graphics/freetype/freetype_2.5.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.3.bb
index 0c62a67..7182c21 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
@@ -13,13 +13,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
-"
-
-SRC_URI[md5sum] = "10e8f4d6a019b124088d18bc26123a25"
-SRC_URI[sha256sum] = "4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c0b9def"
-
-S = "${WORKDIR}/freetype-${PV}"
+SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
+SRC_URI[md5sum] = "d6b60f06bfc046e43ab2a6cbfd171d65"
+SRC_URI[sha256sum] = "c0848b29d52ef3ca27ad92e08351f023c5e24ce8cea7d8fe69fc96358e65f75e"
 
 inherit autotools-brokensep pkgconfig binconfig multilib_header
 
-- 
1.7.10.4


