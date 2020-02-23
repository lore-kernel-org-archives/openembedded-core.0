Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F2C9161782
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 17:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QXM46rdGz5k;
	Sun, 23 Feb 2020 18:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582479137;
	bh=a0YcOzDkeo8rpRfcGTojTHUJ6cEzNDnWDRj8Uwthjns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9cKPGl45pokTED+tOyXRMScwj/jdgcFYRK+hPcHsbuiW7s5AdTNEDV6o6p0S04Kl
	yUu66cEeCFD+ebw0/+DIhV7tCb+YvDoysL0EhDDsYNKjAWOodoqvehaHkJ+Alg9b/6
	wKxOAx8NXabnN8lQorptChngqZ5CspcbLXNCB3BUtD16Mgn0mv7mO0Q3BgF+Mv41YL
	bPCGR91Q4buhnCFkEZ2sJM7GFvGNicZj83jnWQ9H6H0Z0t/qulFybek/nI9ZadlzJi
	GTDZL28zmtdL7fwdzEsB/QR1T75VniOnlj/wuRVQw2qC7CdoedBmoatISXlAowgw16
	eIHycZp10xSLnXVdh52wEfhiuYyMM1SI7GOzmTMMHjwXKK/iy3A9pHXys5uceeIxeC
	jkKjl9dYBVAMgPPD8TEG/+x7jJ015fSXnjhuGRizCwJRZspBW58NdOgzuKJPe3dwNb
	aYW85x+Q7XqresndVhkSU8jNLQbah2oJBLi0Kbefl1PvOcZZ8QNEla4M3mcii0KRkY
	1hPF+JQd+VYpyzSEwoQFd/8H074mNO32VWUfqDRbE0O/T7beqdkC4jPJgC2d9yfVG7
	XidPXwK9XDH3AMzixFcX+nhFukF7hhQqslCs9eEJ7/CK5M1Q1WZ33o4maNF2Enzc9b
	RNUPi4P+EhMv450Y1svT47WE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 19:32:12 +0200
Message-Id: <20200223173214.9487-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223173214.9487-1-bunk@stusta.de>
References: <20200223173214.9487-1-bunk@stusta.de>
Subject: [PATCH 4/6] webkitgtk: Remove the unused DEPENDS on libidn
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
X-List-Received-Date: Sun, 23 Feb 2020 17:32:18 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index a9c00862c3..7b3d16d8cb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -30,7 +30,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
+DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng librsvg libtheora libvorbis libxcomposite libxtst \
-- 
2.17.1


