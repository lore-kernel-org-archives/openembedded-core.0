Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 132B2700FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:32:12 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id e35so3071123qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=DWQcDa+0Gi9Bx5bfpfgJICIJ2gjBm84gDwJOEH5TrDE=;
	b=KgMHOack7lkdw0Wk/e4IiB2PWcuUAp6gkRPQtaUqZuucmTs+d9082JhVvrK5pnyZhD
	Tvr+hlGsXJmh+bchk/t0FuamX7PIwEv7ZRva5MZpqKCcKxg1G0sAk1kaClvbgDJyo2t0
	I/YXPNYZyfIEVQuhjDhaOlXGPQ5Mr4dAMxE8k+/Z5dH9E1bb2wet+qVphhjak42kMQIE
	A4HA4qZfz/nb8Y1CtAGxJOCWwkMaKv9CYzKNsO5m3U1Ovh8eNTvHOB5CcZWCZVHJQjWv
	zEkctE7uTnFIcnRekCOwKlfAm79nR8YoPCQZaAaVla4/UEoB+WRRF/XXlTcUfschOOTx
	ue1g==
X-Gm-Message-State: AOPr4FU6RxOmbj6NaTC++tpb/Jv95pzf7EOLbaIE2pSRadwVlqc4Nac9Ap0GY+NWOR4PGw==
X-Received: by 10.140.39.243 with SMTP id v106mr3832199qgv.23.1462977133325;
	Wed, 11 May 2016 07:32:13 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	r66sm3514385qhe.47.2016.05.11.07.32.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:32:12 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:32:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:42 -0300
Message-Id: <1462977042-7436-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 11/11] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Wed, 11 May 2016 14:32:13 -0000

When the distribution has X11 and Wayland backends, we enable XWayland
support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
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


