Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F224E61185
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYdC03FXz4J
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582482575;
	bh=Y2MAuohw7e2zoRi8Mu/6pNsxf8JbfH6F9oMCixlsLPA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qnG1B/swJ6qh+DFV6t7Fhv+T2c5bRfLaKbeXExlpJ4fihFPtor315ZzizR9xHX6xK
	BLyww8m30H1foKGPS8fs/CRjJ9k/lSJNCb+8YHPorj1VTJQafHSvtBCdjlEo2TCWhP
	QFICcnh3spLO3fPPOSQcw9p9z+/pH9+PM+eP4uY4n1c+nME1RQzxVabvIZB0C41lvC
	U8fh0cqLeG6K5FaTqw0S3gBFq1YeNrRtaBHKDjU094H34tQvvvaOsFZdzVAz/IcU8n
	MgetQ7o4wHYhKBx5iXh9d+JmVBaWm4b5BnttewsKcBpPIdFaQn2p3iCUEXk/li5i/A
	waEUnYd3YvLXCfjk+qRJo66PuCbLxG8Wyz8bylC4DygvM9+HLLTpQ7kCnUCras6FBI
	va/TAEIh2p8qnD9tIbtZqFFuYwLkbUA+Z6xv/p8RVx42QiiYuP6l+Z74r6c9QUOqy/
	gvMtaBHwU6fOnTQwBUpaoGmRPkTq5Ga+E4XzjhiZOA8/vhZwAMiXjIX1qe1S8+mHLQ
	p+kJZgxXmj9I+WBZ8IE8W3P8+p2q3G5rmdQCr2/EKWqbQBw3hoZamSVQ6JbG8cRpHY
	NlfX+oFi2bL+kXkGVuyNjScv3+o1kkknN1S5bBNnqUNMuWav4LdLtMPc4dGAw9L/Yn
	GPAVYTLQTqLIJNoHyKCB5KRs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 20:29:29 +0200
Message-Id: <20200223182933.6168-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223182933.6168-1-bunk@stusta.de>
References: <20200223182933.6168-1-bunk@stusta.de>
Subject: [PATCH v2 2/6] webkitgtk: Remove unused DEPENDS on pulseaudio
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
X-List-Received-Date: Sun, 23 Feb 2020 18:29:37 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 51fba94964..80ed427352 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -33,7 +33,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
-	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
+	   atk udev harfbuzz jpeg libpng librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
 	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
-- 
2.17.1


