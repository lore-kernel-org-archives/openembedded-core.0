Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 57B5B718E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:52:33 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id ft15so17096462pdb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=G1B+8BPCj/QxG/0aqDfhKMn2BPrLYL0M9bxv+7nEHWw=;
	b=ltrYcFR8l7h0jvDbWD9q1LCXzwTg6dEP/yh5oo3d6B1LB4K1sUQfGLHARIsfj9DJ13
	EpP8HN2cOYAPwKvMkSWszwLQiulGoWtjPVUgFFzdTEjuKoEATUJD8L8Zm2uF2jzfmJaa
	puR7qXDJ7ZRYBmSdiG/uRiLUTisCggnI5NLZX3jTOYi53e/hkKCDJzTeECLSK3ulDX+d
	nvhNj6oYN5joQUAxQeKByrwCJzAxGFUSK7RterxHP0mNVEJ2MxZmg/OJsLqrmQRgkaEj
	uidZIoa/8lexczEJE4RkC3HwaCcGLSS8+Za2sXFB47F7XJOdyv/zfcfp8UAhesnxcrGx
	UHNQ==
X-Received: by 10.70.101.136 with SMTP id fg8mr40875418pdb.65.1422341554350;
	Mon, 26 Jan 2015 22:52:34 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id mz7sm533112pdb.3.2015.01.26.22.52.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:52:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 22:56:09 -0800
Message-Id: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
Subject: [PATCH 1/5] usbutils: Fix typo in md5sum
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
X-List-Received-Date: Tue, 27 Jan 2015 06:52:40 -0000

Change-Id: I69b8df20e368de777bce3739dd766e9857625d10
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/usbutils/usbutils_008.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
index b032d4e..0f2d8d4 100644
--- a/meta/recipes-bsp/usbutils/usbutils_008.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
@@ -14,7 +14,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://iconv.patch \
           "
 
-RC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
+SRC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
 SRC_URI[sha256sum] = "6d5f16c2961df37e22e492c736a3e162a8fde24480f23a40d85f79af80d3fe95"
 
 inherit autotools gettext pkgconfig distro_features_check
-- 
2.1.1


