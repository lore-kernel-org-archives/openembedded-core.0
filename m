Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C95187ED41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:09:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r1so26150129wrl.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YSIPFxCSyj0EeXrj4l4w9lccEzjhXYHvF1bPDbOmzpw=;
	b=WgCPed9YxcDlhWKgl2XCoYPxv1lH0FcMTL9e/EMANpVDTNH9zfbkogSP5NRDA+i2iv
	sEO2r9TqwXBFdghCd66uevgXWVW2Ms8ZYl3PcyHmPE8jR/drjl5u+h1bvncqmQ7K7Q9D
	LD91Ye5eBTExQUHbCb2EvKUlzjSW4i0F7wj7SlQP3PxjE1Pl15F2SKUwRKHOxfa1t7//
	jtGCL0HA1CK2zwqdyLfzgusp/eQqiMyF7geW0Tu5Obls3Q+XRY4Nxc+E9abCJxQ1rlvW
	nS2+wtjygTk+wRi3xh9ZZr1laqvklRPXIUbp/TQCC4lSara201IDa5gF3OuMKBPNRFUv
	5Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YSIPFxCSyj0EeXrj4l4w9lccEzjhXYHvF1bPDbOmzpw=;
	b=el8mWIrZobKmZiDEZBCK+0wVhmhiprX+/nGp6QzUjW6SoNf+l/iXRu0fYcHlfexbrx
	f4Odj6HTnXzwQ9el4iK4VE1xpxJEmVU3op2sPconWcZsMawuZbvnRIoFrFV5SoRXPRuH
	4zNp8nkY1254YshJ3aUQwmUqRF5QjJo94mfiPhRY8tZL55XMO6MkcBKQUnrKB+Au99Zg
	g3XA6WKBFYBAADdH15oPru9QB/KGsppu+HKb6GzIfgHuZokkYC5e4iJed+RE01YfnoKS
	oV7Wj9HiP+55HfFWlQFWJcuD1H5DZN4Wf2Nd7Lr5+X1GW47ewImQDA1aENfMvECsbEW1
	liNQ==
X-Gm-Message-State: APjAAAUQIOB8MsO9HfasZ0EFpTbsUcYxixveoU+gLLsl2mYlJRdvltLC
	tzfSCr6wDvDGVX2i2/PA5EL4lkcRgdQ=
X-Google-Smtp-Source: APXvYqx4xurJMgOEqynbCs2DedHW3rP4Xc3kiI4gBsYIQhOcFfLkq71zAj+QHtXr2I8UObKj1TY78w==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr44869818wru.311.1563394192314;
	Wed, 17 Jul 2019 13:09:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t185sm18694819wma.11.2019.07.17.13.09.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 13:09:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 21:09:49 +0100
Message-Id: <20190717200949.20659-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] xkeyboard-config: remove redundant intltool dependency
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
X-List-Received-Date: Wed, 17 Jul 2019 20:09:52 -0000
Content-Transfer-Encoding: 8bit

Upstream now uses plain gettext.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
index a6b2cc0eeaf..02156ad75b4 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
@@ -13,12 +13,11 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-
 SRC_URI[md5sum] = "316753e35d3906d042c74230612eab9f"
 SRC_URI[sha256sum] = "690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native util-macros libxslt-native"
+DEPENDS = "util-macros libxslt-native"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
-- 
2.20.1


