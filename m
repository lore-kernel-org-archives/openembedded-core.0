Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 85753760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:45:02 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id f92so62639224qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=asExlLaLTjPNgI4ek1dpPQWyFGQDOupLFlBsGowm9Ms=;
	b=Ze2T7l3iFP6+jaAZD/k5HjtCqI8VL3qVP0uhIjYL3AklOr2anPryl65oJVM1a988sk
	egyrFg0gPxhNcPhgOvgE7+wrCbzpByCtyihIozP8Qsa63l8iAJVvA8xRgt4P6UB3hDRg
	StfcbVVLxJoSdhJuV6X/6o8nmgyVapVDPkcEVjqwOy82Wxc9yM1z9JjYHxOYW9phLQRr
	GATGqDIfjih84V3yVAXFgmvHll6Oi7KCFWqdZ+0d2t8YdPg2MRxlzFwLEB5BQD7JLb/2
	N18W7HhwZSjPEtl8IAqFAsID+OQi6hAP7zOrtRkysfbXr6iX4fHnGomfxU+/t3mN2oc1
	MCWg==
X-Gm-Message-State: AOPr4FX7zD3YFJ2WwaHM3F6uBkgnIwiP0Bh20pOOdZKCMPnzxWO828zVCRkWOVQDE8KG4Q==
X-Received: by 10.140.231.72 with SMTP id b69mr22877418qhc.72.1462567503021;
	Fri, 06 May 2016 13:45:03 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	b28sm1369664qkj.19.2016.05.06.13.44.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:45:02 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:39 -0300
Message-Id: <1462567419-3459-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 10/10] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Fri, 06 May 2016 20:45:02 -0000

When the distribution has X11 and Wayland backends, we enable XWayland
support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
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


