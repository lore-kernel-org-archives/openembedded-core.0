Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C1B8260746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:33:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id q128so219660277wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=YynLcdM25wMmm/gNHlki3LPTI4X3x3NOkZh1CeOJm/s=;
	b=a6wwHatAjIb4xW79vYGqqPl8nuWuHdI4SNxCAf3/1YATmMi1wMs0WixUBjZvYYU1eO
	8B8ZlSSlWv55wB/aSvTM4Jic2KCATCEiBUd7SPL9i7ZFH4xS8vQu43DpYhzzBgAYNDuq
	YiaXNNUQ3ZXV1f5qG2eGwGJdZ/atcb0aMbK5FkHWbb1lt7sRb82Z2K9zHX5zRnLAlCAV
	TtlQQDeBfGHz8nYDy+YHjtZUpTa9PTmwiXW7JZzgRFYsCShFHdXVgNBp61Rz83iBHTZ7
	VQkiIBIPmCR9aL8qohAMV3NrcV8iAS2nhsC2DIZCAmJwB8w9/7k5YDhl+Vh0LaMcXjy1
	5Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YynLcdM25wMmm/gNHlki3LPTI4X3x3NOkZh1CeOJm/s=;
	b=d2v6/ocDvv4fDJBWr35zCRNdDzGdxmVfo6haYz2ATrnUV90yVGSj6e40wdy51M/m2F
	xCJTwizeQOGQWRAh0zs+sfp17RIl8UzA62plKUzlP/F8tfs/7m4D/s6TOvWDwGL/4nrX
	bazos7uSod8Fh22/8/vJZQ5lY11IOTRCKv2yTnWQcDBta7P1i3f4LOx1ysSSO/OC/fq4
	/1upJaYQh0Gj28/FFNJMQYCKI0Bwc7mOdqn4FSni2+nzyfF1ddDSXGEaEwvUuvo/V/Ti
	SrRNhLjJxe/fAOr6jnx03VttcQRVT0VE2zfUJd/F+U3xoZA59OVo3ab2Dgxal5ftGHMQ
	L9zA==
X-Gm-Message-State: AEkoousweiFmnnf8AOR1cCjiO1bCbzvy8zMTFIEkyx6RgK5n0NzX1aCHeZVoo9dGEFHHhB02
X-Received: by 10.28.27.211 with SMTP id b202mr35567320wmb.12.1469637180211;
	Wed, 27 Jul 2016 09:33:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z18sm39099060wmz.6.2016.07.27.09.32.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 09:32:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:32:57 +0100
Message-Id: <1469637177-2657-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer1.0-plugins-bad: add missing wayland-native dependency
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
X-List-Received-Date: Wed, 27 Jul 2016 16:33:01 -0000

The wayland support requires wayland-scanner, so add a dependency on
wayland-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 9e2b94e..d8c8179 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -58,7 +58,7 @@ PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
+PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland-native wayland virtual/egl"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
-- 
2.8.1


