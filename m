Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 71BC26D432
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 18:29:43 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id x18so2285441lbi.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qBb0nKJbmy4kn//awneuvHwEeCCRaigm+Y1X2/dGesE=;
	b=p/Zp7oe5dIISX396OzIZdMhgWjOKSwL81qN2yBJTM30QdR4bn2gqU1AfXMKnN1ZhYW
	cThST1KzpdN4xFLYDejYBYIzM4QDgvlyyOCeVmIlUtUgqfvbs3IvmxiPCA4ru+nX2f4s
	8W+kDDO795qroEK81RMDoul0McCKy6cuAiDgl78Q/K3t3YXf0OEfEviUmVC3oCxVPY9U
	y1IqBdfzaEm8QCg7b8zlggCUVvnJqu+3KgUa2OWUbGa6Nj80/77yqxFLwRF3wFqJeb4D
	vcjMj8fqoe3MRcflXR+Uf6Z47Jfij6zItbMLD/ZgOJJpYopOI4dOmvzK7HlawwSEw0qz
	3lhw==
X-Received: by 10.112.136.195 with SMTP id qc3mr1704989lbb.55.1382639384779;
	Thu, 24 Oct 2013 11:29:44 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id e4sm3129834lba.15.2013.10.24.11.29.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 11:29:43 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZPfC-0000n0-9b; Thu, 24 Oct 2013 21:29:42 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 21:29:40 +0300
Message-Id: <7235d296dd0b3f671e3881246d4f3cbc4ef72fc2.1382639156.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <dfce1648ef7781347e1a159067e788c0f3c85f03.1382639156.git.cazfi74@gmail.com>
References: <dfce1648ef7781347e1a159067e788c0f3c85f03.1382639156.git.cazfi74@gmail.com>
In-Reply-To: <cover.1382639156.git.cazfi74@gmail.com>
References: <cover.1382639156.git.cazfi74@gmail.com>
Subject: [PATCH 3/3] harfbuzz: upgrade to upstream version 0.9.22
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
X-List-Received-Date: Thu, 24 Oct 2013 18:29:43 -0000

Code that was under ICU license has been removed.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../harfbuzz/{harfbuzz_0.9.19.bb => harfbuzz_0.9.22.bb}          | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.19.bb => harfbuzz_0.9.22.bb} (70%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
similarity index 70%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
index daf7273..e315f78 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
@@ -3,12 +3,9 @@ DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 
-LICENSE = "MIT & ICU"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
                     file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
-                    file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \
-                    file://src/hb-icu-le/license.html;md5=9136737088bbfbbf86d9a714da49fb89 \
-                    file://src/hb-old/COPYING;md5=6e8442c12d498ce55cfe39fc60f97981 \
 "
 
 SECTION = "libs"
@@ -16,8 +13,8 @@ SECTION = "libs"
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "9782581ee6ef972554772e84ca448131"
-SRC_URI[sha256sum] = "d2da0f060d47f6ad9de8c8781bb21fa4b9eae8ea1cd1e956b814095baa002f35"
+SRC_URI[md5sum] = "d3c1bcd7073cbca29fea37fab50ded7d"
+SRC_URI[sha256sum] = "989680807e76197418338e44f226e02f155f33031efd9aff14dbc4dc14af71da"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.rc3


