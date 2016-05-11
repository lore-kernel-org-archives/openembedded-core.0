Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B73370031
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:06 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i7so3189853qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=PPidu5SepWZzu0jbO9kAb0kVSiso75R45//MLnbtYWY=;
	b=Ru3FuV+n1anZI58RkaTCdztDLI3r55iodJWYHkh9jLHo7O2/CzHxsuRmU9exu/iNXp
	hxbBmzsxWTqTt7m8rGdHsjD+Zr+MpPdW2XDauNSLCD2R70gkyNtBDdjtPs7GM24o1Dsl
	6JKKcnpUidnn5kWn/Mpm+vS+2hYu9x8TapaLvof4nwJD4E3D7v/RkD2bsqh0T2oQa2gp
	fvj9EtJ5km9K99mYRhxYUu/e3Ay9nm15UdlmV2NhM/TsN5b8Ja9PwDYduFLokhII2bl1
	7FfSFEHlS5HOyp0gTgikHUMBptYy0I+b/+Go+NSMgCbzc/Kg+cbqp91ddnlmFVI6yj8v
	CExw==
X-Gm-Message-State: AOPr4FUpPeZ79vSIkmF9s4GhSnbON9+IVfEJPLMmuyDHbv8dNk+yWH7Vxm3u+Y1kXTqe8A==
X-Received: by 10.55.96.197 with SMTP id u188mr4029863qkb.151.1462977067135;
	Wed, 11 May 2016 07:31:07 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	a207sm3544469qkb.28.2016.05.11.07.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:31:05 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:30:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:33 -0300
Message-Id: <1462977042-7436-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 02/11] weston: Fix SystemD service description
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
X-List-Received-Date: Wed, 11 May 2016 14:31:06 -0000

This improves the log shawn in boot. Now it shows:

  [  OK  ] Started Weston Wayland Compositor

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 4f1f7ff..12aedb7 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -1,5 +1,5 @@
 [Unit]
-Description=Weston Wayland compositor startup
+Description=Weston Wayland Compositor
 RequiresMountsFor=/run
 
 [Service]
-- 
2.8.2


