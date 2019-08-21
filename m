Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 90ABD7E5E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 23:10:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z1so3534541wru.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nRiSVctWNOBG8+FOURcKvY/gMnTJRdob44O0rL5Jx0o=;
	b=A1yqvuDIngq79fjOg6ZC8kFCKCCVmL81xhaK5Post4XiM/BbeYGa7ZIwSPHg0kTJcl
	hzw/BwEP2UOtoCctg4FVh6PZ3hX4J2ZDrDdhlaD8VGHVC5tbNctnMVpYbIhNbTgwsqCv
	gBpnlUuI5sX0ZKA8uQQ0uIr/Rmqw9t5ynJzTxkZ5BAeM7O3uXe7kYURf9NhAF+LVB/Ia
	4mTEA+LPSDYHVKlbKIM8pBz9bFjRIKxekxVrkvUXp68UoEE+xIP8W9LZBLORAAwbqTq/
	fbEWKsG2n+SBhOf4kfdupjmlyiI5gIJLVnOTfrlKPz88q0ZH2y9qv633rEhNYryImdPO
	1e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nRiSVctWNOBG8+FOURcKvY/gMnTJRdob44O0rL5Jx0o=;
	b=l0S2tnTbISSOz1eBnOfEHaB+qodbzYdF43mmpEAtObgAqpn5h7ntEWAC00BzcPmS5k
	PPjs93E/5i0iGANeq9BG6glhYJnAH6iibThakhUd7ZzWij/MN8PSnhrsNPjGL8J16xBE
	ZENnxZXo5vM5FVWvngXL8Ew7z3FXmD5oXrgq43xuDMtGMsvYbYJPDmWTQujwel5YiLvj
	jZx+a8b/zHPCj/UP7Y2H/VGngJvvQy8t6HBe2dUvDIHzoOszN6zN2jrDtpMw4q2/xHVU
	Y6ZXsE4A0bqeUp3hngGSmgkKziI+3L/HcC7LpMVK71L8i8eH8DU3jYLItpAUhSWENkUq
	Plpw==
X-Gm-Message-State: APjAAAUFBV7lRSk0GUzTKBFNzruWeD4wiiYQo8aM1U1COaxFJYtfQ+3I
	nuopL6Y3j10eSO7KAllxurRg5R/8diI=
X-Google-Smtp-Source: APXvYqyuFEnfuMwJUr7YWqD3tbxi1kpGvxR1D6soNX86mFLndSvaI9bub7xDEwcBuI8OLNfIiD877A==
X-Received: by 2002:adf:82cd:: with SMTP id 71mr38142086wrc.265.1566429006641; 
	Wed, 21 Aug 2019 16:10:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x13sm1117046wmj.12.2019.08.21.16.10.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 16:10:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2019 00:10:02 +0100
Message-Id: <20190821231002.17414-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pango: upgrade to 1.44.5
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
X-List-Received-Date: Wed, 21 Aug 2019 23:10:07 -0000
Content-Transfer-Encoding: 8bit

This release ships some files that were previously missing from git but needed
for the test suite.

Add RDEPENDS on locale-base-en-us as some of the tests explictly use it.

No need to depend on liberation-fonts, all of the tests use Cantarell.

With these changes, just one test fails (filed upstream as
https://gitlab.gnome.org/GNOME/pango/issues/405) and there are no skips.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pango/{pango_1.44.3.bb => pango_1.44.5.bb}        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.44.3.bb => pango_1.44.5.bb} (83%)

diff --git a/meta/recipes-graphics/pango/pango_1.44.3.bb b/meta/recipes-graphics/pango/pango_1.44.5.bb
similarity index 83%
rename from meta/recipes-graphics/pango/pango_1.44.3.bb
rename to meta/recipes-graphics/pango/pango_1.44.5.bb
index 1973c63f824..a143723c7c6 100644
--- a/meta/recipes-graphics/pango/pango_1.44.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.5.bb
@@ -15,11 +15,9 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
-SRC_URI += "file://run-ptest \
-            "
-
-SRC_URI[archive.md5sum] = "7f91f1b5883ff848b445ab11ebabcf03"
-SRC_URI[archive.sha256sum] = "290bb100ca5c7025ec3f97332eaf783b76ba1f444110f06ac5ee3285e3e5aece"
+SRC_URI += "file://run-ptest"
+SRC_URI[archive.md5sum] = "b6bf689e3ce4f46b0fd887b64c850ea1"
+SRC_URI[archive.sha256sum] = "8527dfcbeedb4390149b6f94620c0fa64e26046ab85042c2a7556438847d7fc1"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
@@ -38,7 +36,8 @@ LIBV = "1.8.0"
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-RDEPENDS_${PN}-ptest += "liberation-fonts cantarell-fonts"
+RDEPENDS_${PN}-ptest += "cantarell-fonts"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"
 
 RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
-- 
2.20.1


