Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A354D74D2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 10:46:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x12-v6so2998518wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ABP8f4LgP7xEFWFLeXBA5tN/qwntN0IDfmbII2rLX/A=;
	b=uABaP9GYlJS3UhjTGyxzhcn+d5F4AVNoXlJX4Kh9ywtxoMJpurFmIyb2ucco3x73m8
	Sa8mXoHfNfteQ7zbma2d284IFvBOswOVH0usGN5Z4t50j45YEN3+eR/9SEwZrrJSzr9N
	KQosaSyPCUTbrvaPHAEjKKphrRzHssc0LEow1OSLjlBhtiZujUag9jDMlIYh2hkY6MvG
	6k0Y43B1q9BJHg+NrhvrnZoljjZFFO4EQEzeD/vH3IjHf64g+7uJJ1DKHehGuaqhPH92
	kQw6nCVg2rCiwyiSSHk+MokqoJi5oWOrbiGiSD290eyefF5urIqmF1gwNWfDI3hbdhsX
	Kcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ABP8f4LgP7xEFWFLeXBA5tN/qwntN0IDfmbII2rLX/A=;
	b=BWCMnd+Uxmle3qk7rIIe2/ZPI13apJVXJxtyzaRazJxj9J3xWp2p1FLUfoM4Kwc7FH
	+EStYTlBwaKfF1FpOyIKk0W0uSwgwIYQ0yQ65/2QtLwxorrufZmSnY/M8yE9KxZSlB9Q
	VlXY3ve7kfyqTo9YevY+ZmJ5KSm8aX82IWHk/EXD3+9H/DP2HMDSn/ui9Nr+IiWDVv6+
	BtBINIa5+YfV3tB9YqD0IW985/wf2b4Ti8ufNW6ksJIcdyupMsFt6UQkRRjj1bz6DxyR
	juMxi8Hx0Ih2swDZ5ZRvO8zYcv/XVZuNyYzsXAeHQNV8BZ3nmwmCHrFPyUmP7wRt6nRw
	wntw==
X-Gm-Message-State: ALKqPweQqqVQfkCw82vVcUzpuyK+hTwdV7ZG7NlV7amJOQFZ/hUDSmBk
	v4V0At4BFjt7K+b6kFedbSLsgjRn
X-Google-Smtp-Source: AB8JxZorkPc+tGMbTxZZ9CXWyy/aCdA9CMD+RwvG0+wAHlylvknHkR7elO0WDGuN5e2fETjEuKNG3g==
X-Received: by 2002:a1c:4792:: with SMTP id
	m18-v6mr3950467wmi.144.1526640415763; 
	Fri, 18 May 2018 03:46:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	140-v6sm9990113wmi.9.2018.05.18.03.46.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 May 2018 03:46:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 11:46:53 +0100
Message-Id: <20180518104653.21665-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsdl2: remove redundant DEPENDS
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
X-List-Received-Date: Fri, 18 May 2018 10:46:55 -0000

These dependencies are in the x11 PACKAGECONFIG and will magically transform for
nativesdk builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index c37f6693218..6966dc5c348 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -12,8 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=02ee26814dd044bd7838ae24e05b880f"
 
 PROVIDES = "virtual/libsdl2"
 
-DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
-
 SRC_URI = " \
     http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 "
-- 
2.11.0


