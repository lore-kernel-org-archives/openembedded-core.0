Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EEFFF60984
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 17:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QXM40n6tz4J;
	Sun, 23 Feb 2020 18:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582479136;
	bh=Y2MAuohw7e2zoRi8Mu/6pNsxf8JbfH6F9oMCixlsLPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mbIFpJuUUpXFPLBX2TwsKzop9Mxy53bjnHLGVeRru9U8/mEU4n+cjQNZVSNDcx3hH
	na710Iphn7rkxlGh07h9TtfU5fOqqq9qBEF1M9dPe6usjgZwnBZuTJ9Yehqfj4+myL
	Lv5a7uUYMfDF6YrL4TR9nCak/+H6JE5f+79pf54BSfjfvT089OvGXBmBjlqkkydki0
	dZ++yIkTjgCwJoS0KNypOTp8CWtxaVWPaxHSCv3DbMoLMAOB19o9SkfDdb8BrWrkNJ
	ckxPDrziRasf3WDVOx41AmtrFumQyU/nFxHVooRNbMhcZW3g6sawRkkQynLKpMz2yS
	16HAkfhr3ksIfCdIgRxR3Qhvuz+m46vCD2iw1Ld5adL2WdymR4HEouEgZ1rpJyPyGz
	w0rV4zgG6ULpjblCubT/6WN1FmhuxTsZyMFDOPetpoVNl7Bqcm58U97IqiCSl34M8k
	+uKG0gTW8O2Xdls122O/Q2BLRtuPQXOz0ecJBOz4fSlqtCd4hP33N5uC/e0wjT3vZz
	V4Ri95BaWbIZ4JVXAsibuhxEtjEW9t5Q90WSsr+kI2UEorEfp6LcfOyBYfxi1tT6fO
	+MHYvA0QTw0UkPJfHJ7mE8QLUbf4QVDtfkJOkDHHAa96HfbIjtg9ePXXhll2Iea4fV
	P/oVdScJdICSkN/2xcIgnavg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 19:32:10 +0200
Message-Id: <20200223173214.9487-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223173214.9487-1-bunk@stusta.de>
References: <20200223173214.9487-1-bunk@stusta.de>
Subject: [PATCH 2/6] webkitgtk: Remove unused DEPENDS on pulseaudio
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


