Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 95BA173194
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:50:43 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id w36so31818836qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=90sZ2RQ+06oHw7JYXyLUzzrpPGZqybR2u/DTTrRmzFc=;
	b=gVF9ml1BjBRzzLYcpi3EHfPqXaOdrVNAa0sCEZHGLa3EEH5wEIUW5ncInuEjEV09uM
	pQZl46UpyibOxF0cojAJLc1Xqkisay8a56ISvgL2K7Mp3Veg/kebGi7OuJqSnTDYnGhF
	61r/F9wvVvMynAnsMQGw4cyK1AevFHBYCGjhlO/0yJnzXhrTZVcvFHr2mX+ru8KYZyW8
	1aHx9CiRqVgDRUMeRjZtcEkw3oataYL1ljqrsB2bsiob7g9qLYONcbB5S5uoI7N+Z6bc
	CkkUslOMzv6iiRy+KZ0nTgRTOvm9Ft/fL7sURx+sMV/1keBPmAAoV77oaBU1f63JEHDf
	/Zmw==
X-Gm-Message-State: AOPr4FVE49/klp7BU4erKcI2MOfGv1WpOvP4wEqwB0xSsvTBXQd7JvlMLLCcnHdar/RnKQ==
X-Received: by 10.140.220.137 with SMTP id q131mr7590667qhb.60.1462402244056; 
	Wed, 04 May 2016 15:50:44 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id s1sm2233783qge.9.2016.05.04.15.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:50:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:50:37 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:40 -0300
Message-Id: <1462402180-16861-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 8/8] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Wed, 04 May 2016 22:50:43 -0000

When the distribution has X11 and Wayland backends, we enable XWayland
support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- New patch.

Changes in v2: None

 meta/recipes-graphics/images/core-image-weston.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 52e271d..c65c1e3 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -9,3 +9,4 @@ inherit core-image distro_features_check
 REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xserver-xorg-xwayland', '', d)}"
-- 
2.8.2


