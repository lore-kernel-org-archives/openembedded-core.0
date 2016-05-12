Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 60C326FF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 15:33:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n62so78557qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Vx9ZB1tJIqwOlGFBluENueQ6zkJxa+Adg3IY3eya9XI=;
	b=mMkGtLizzSiwyy7tWYSSVtfiYwrQNehL0Vt6wVhYeWvAHxg0uph3LR4E164tyo6opJ
	l2R9OemrmAWOHFQItV1i6YvKQxjfmPyF5ZqYbO33co0uwIlRYFNLPxnrAJij5/ppSLxT
	/RxLmKPnFdPn4a2uS1DjAOO1nCznL5PcghzQRjlEJlOTRPNCzEX9BD835ekJzt2mYhvv
	Dh6uOOvbKhtaQMQFZSS2Jt3KgWPJ9sNNJw4LiKW5BjtTTOO1lRpR9T/hiKKQxncBdH3f
	Pgel79+z4YbDvk5002GLaNhg00QQSAEHME64HgmCINDvg6+pT/naiLUr5cOlTf3nI7EO
	Fhsw==
X-Gm-Message-State: AOPr4FVP5FDyYg2PxBN5dytAkKOv+p1cXRXsE2D19Hy7bNM/0xKOCnNgTmdBmox/BYh6EQ==
X-Received: by 10.55.77.216 with SMTP id a207mr10859836qkb.80.1463067217123;
	Thu, 12 May 2016 08:33:37 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c68sm6276467qgc.12.2016.05.12.08.33.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 May 2016 08:33:35 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 12 May 2016 12:33:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2016 12:33:26 -0300
Message-Id: <1463067206-11570-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] weston: Use HTTPS for tarball download
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
X-List-Received-Date: Thu, 12 May 2016 15:33:40 -0000

The tarball now is served just on the HTTPS URI, thus update the
SRC_URI.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/wayland/weston_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 150d2bf..dc0a614 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://make-libwebp-explicitly-configurable.patch \
-- 
2.8.2


