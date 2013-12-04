Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 84DB0615B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:35:49 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so15416302wes.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jE2i0D6Avw4e8fxL7RxGDyqHZoYX8TepNiGCJxnlzuc=;
	b=doYYAAmUAWQENKJMZRWAUwC4xZL15q3PMTmDctty1EIGUI26rGYqSyBmLYub/FZ24l
	Hv8tfkMP5gItxqVEabjJ746krLimxb38XUO+GzZ4QRMkbJ2ZpsaW/rpU4vl2fpoLrw4w
	DXJQ7aeoTF7exrjzhdbcsUihFyhVlOXgZVjaD0ngUcvZE/aMwLWfl2YQfR4pTTS3+79R
	p2DkB8xV7MLhJrfv/jERE9jM4EPhb99EbxzK2S0UTL+H6GZQYY8GqSOzvLIXJw/BCo6T
	sQlD2g1GXiXJsJiuIgErhKXmKPCn5r2PXhZMc3rzhkUiLYVGY8k1ZLlRCk1/Ooy0ifT2
	kM9Q==
X-Gm-Message-State: ALoCoQk+VX3OV3duE+RX4EXcFhGPBOERcAr6OHwpBzcTGUsgRXRN4Ng9OPweBT5qKHXwHj7qoFqc
X-Received: by 10.180.221.38 with SMTP id qb6mr7708794wic.8.1386171348727;
	Wed, 04 Dec 2013 07:35:48 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm7982684wic.4.2013.12.04.07.35.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:35:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:35:38 +0000
Message-Id: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] pango: upgrade to 1.36.1
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
X-List-Received-Date: Wed, 04 Dec 2013 15:35:50 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/{pango_1.32.6.bb => pango_1.36.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.32.6.bb => pango_1.36.1.bb} (56%)

diff --git a/meta/recipes-graphics/pango/pango_1.32.6.bb b/meta/recipes-graphics/pango/pango_1.36.1.bb
similarity index 56%
rename from meta/recipes-graphics/pango/pango_1.32.6.bb
rename to meta/recipes-graphics/pango/pango_1.36.1.bb
index 9c5c1cd..c6377aa 100644
--- a/meta/recipes-graphics/pango/pango_1.32.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.1.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://no-tests.patch \
             file://multilib-fix-clean.patch \
 "
 
-SRC_URI[archive.md5sum] = "1af2e3a0ac5a258eff5ceddb6ed60ebd"
-SRC_URI[archive.sha256sum] = "8e9a3eadebf30a31640f2b3ae0fb455cf92d10d1cad246d0ffe72ec595905174"
+SRC_URI[archive.md5sum] = "9e0d3a1ea395172f8c39ba98a4d2081a"
+SRC_URI[archive.sha256sum] = "42e4b51cdc99e6878a9ea2a5ef2b31b79c1033f8518726df738a3c54c90e59f8"
-- 
1.7.10.4


