Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id EEE8379086
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 01:40:14 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id r1-v6so9909534pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 18:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sE+bcSGE7fFijQINgLSCo60x1fJ+xdmirazRHN7b58o=;
	b=AU8gsUl/tCHFqMSZTHQOkj3KUZ0S2Bpud7gOrt8duq0o3nsQox5fGG6VGmzrFQbIUh
	2qmJJNiqIwEvf2PDi0pt28Q198AceHjo8zv5Tni6lbFEcBLOTvzT17tMyKrUo9w+XiLb
	sOR7XBmxfBPLEvI2kbG3dJ9z1YqQBGXsEgkGGNPBtAJJ6R8Ii796g8kIQOQ2Oiq22U5D
	KYtIgwRYLVUQJgCxD6dIaDVePlZAUE2dZK+TFs5qCErHg24rL4/DhnxdV2Fa7FB5fJO7
	OGjAhXX5+f6zwK9zQqqeWJCJA3VRSVpgDhV+vkW+8XjtGKUKWTrmYgBm+ExMww+16fP4
	HSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sE+bcSGE7fFijQINgLSCo60x1fJ+xdmirazRHN7b58o=;
	b=MoNpRwMrZ+ENavu85UNegXKaGcIq7N5CYzFKc7tgID+qofMz8RCMVg+p5CH/yMmGXO
	nt8A4/ocjHWEYd7TRg5LXW8oxVG1grfbWsRGhzZ2wITAtJE3bFQyWCpf5d083XoV4Rbz
	nk7/HmP9Xi5KF9V/vEjsP94LPkQ6J08ITFH66wn6XLDbbPXKRqUI/4z694RlbvpOhkJS
	qHRd7X+6hnoWGfG1cBQ0+a4oMBL2IJkvM3cpItKA2KwQBKqEPVIoN4lScS7Jx+aDAq40
	+4z0Flwqpys1ou0i/S5jpry0mTi6R62vXeVVcCo272MeOXuYwHZPw2E1zw6HSBmxDWS6
	97Zw==
X-Gm-Message-State: AOUpUlG6/BqsJAGSUKo9W/aybpy2tFsY+pj55xf21oTIkjeXviKsRWrT
	I8ztrHR6rS2f4L/8G+Sw2MVN17cG
X-Google-Smtp-Source: AA+uWPyj6uH3M9XYU0z8Ukr7oeEZ5cSZzsw69gtbPxVO0fCaGwhF3T6iT0ImEo1nnEbePG5PTJ7bNA==
X-Received: by 2002:a62:843:: with SMTP id
	c64-v6mr25799522pfd.14.1534297215457; 
	Tue, 14 Aug 2018 18:40:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	j15-v6sm25327387pfn.52.2018.08.14.18.40.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 18:40:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:40:04 -0700
Message-Id: <20180815014005.30479-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/2] libdrm: Upgrade to 2.4.93
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
X-List-Received-Date: Wed, 15 Aug 2018 01:40:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../drm/{libdrm_2.4.92.bb => libdrm_2.4.93.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.92.bb => libdrm_2.4.93.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb b/meta/recipes-graphics/drm/libdrm_2.4.93.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.92.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.93.bb
index 9ef31010a4..9219d87e4e 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.93.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "f9b00d985f82d0be6ecc20c799acc89e"
-SRC_URI[sha256sum] = "e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa"
+SRC_URI[md5sum] = "0ba45ad1551b2c1b6df0797a3e65f827"
+SRC_URI[sha256sum] = "6e84d1dc9548a76f20b59a85cf80a0b230cd8196084f5243469d9e65354fcd3c"
 
 inherit meson pkgconfig manpages
 
-- 
2.18.0


