Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E5FCE60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 14:01:34 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so117370139wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rFM+32y9EjqE9wGpgObZj+JvGVcfL8yS9O7a6sGIoOQ=;
	b=YsgIQEQ5842VqxNfFSCf1hIUgl4StM0fPlad7SxHeCk5Q1RrzQshPRYVounUxFgPsd
	bh5TyIOZ68wSOrLlKETySp0LdjF+e0k05PNHLqGfaGvDcE8BQAQJ16JGc7cHlXa98reD
	7PFw6hihKT32Qy/gTSxOEEK0F/NfONZ1zDtyCxnoDHFSjuBe659lq8I8ENWwLZpCfxsN
	3lL+e70mPi4OXcGDpkagfM5Lq6LbLRsoVKkZUANfjkdRxdWnVEEd4htgySpg9MjDbppm
	w821YSUiq+TTOlPzt9cbnwAdUyrfU1kdgWoBmeP24tBWo0gGmXTsKqJg6CwoeLrJJt+y
	GH3w==
X-Received: by 10.180.182.107 with SMTP id ed11mr13349490wic.52.1442844093989; 
	Mon, 21 Sep 2015 07:01:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb5sm24309394wjc.17.2015.09.21.07.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 07:01:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 16:01:36 +0200
Message-Id: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 21 Sep 2015 14:01:37 -0000

* original webkit-gtk_1.8.3.bb recipe already had this, I don't know
  why it was removed when upgrading to 2.8.5

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index 82d670d..859d0cb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -18,7 +18,10 @@ SRC_URI = "\
 SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
 SRC_URI[sha256sum] = "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"
 
-inherit cmake lib_package pkgconfig perlnative pythonnative
+inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check
+
+# depends on libxt
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
            gtk+ gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
-- 
2.5.1


