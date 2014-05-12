Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 341 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 12:20:41 UTC
Received: from mail-we0-f176.google.com (unknown [74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6083D65FCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 12:20:41 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q59so6620445wes.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 05:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CYJSjsoV8zZwSah5ONyOIyVaHIKd+Q+7rYnE0ORwE0Y=;
	b=JswmvkrmMV/RWugAkcIQXy3PHIC5B1rFmcIM1szz32pzzvNVhDFvV9xrmxVC5yEcOl
	3T/HV+gNc5rcG0M/o6JVWx+rIGT0SrUUUHVVUojOWaOYI9MiZyWl88imc71gVmFikUAi
	J4mUYrvd6uracCE7ybFIghA3dAHW1Kn4rvqFG676lPKn6SqUzLtdtyBuYhmtvk3A7u39
	FnE/kbhjyqSqnJj32/IuNTX6MZ/kXZIKR60isPtA1Pnq0g5XQ71Iw6SB8tpU7I55Doo7
	02C0j1goFQPOHwRgJwAngnFLyV01yOCKqMLCeDZwy5DwPjFjN22NX95avcjwZCDb7KJ5
	pd7w==
X-Gm-Message-State: ALoCoQlY2ldvaEchd9YZjA7bCt/H/6+Xc49un6yIBTZyXW8j91H9AvfDp0iuIuktdrD/uhPOv/Ck
X-Received: by 10.194.219.164 with SMTP id pp4mr5113558wjc.19.1399896903765;
	Mon, 12 May 2014 05:15:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ct2sm17699110wjb.33.2014.05.12.05.15.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 05:15:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:14:49 +0100
Message-Id: <1399896893-486-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399896893-486-1-git-send-email-ross.burton@intel.com>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/7] freetype: upgrade to 2.5.3
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
X-List-Received-Date: Mon, 12 May 2014 12:20:48 -0000

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


