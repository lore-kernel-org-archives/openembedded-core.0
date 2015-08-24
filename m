Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id F0DEF76C25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:56 +0000 (UTC)
Received: by pacti10 with SMTP id ti10so33376463pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=u8qgnnTlPJcSGdNHb8L33sWFS+N2Z3e2RKa2hMY649A=;
	b=AQYIfxgxYLVAyhlZrl/mJDBJNum/h74rjB+EUoLGcwce5FIyeJhgclpj3LvIvsu7X7
	6ol5zptvDo+7YHJ6WDbKr9ncaBXkti5gNfnCvdNrqvK+dpuHiymuX3OTY2I4LkYRaZbB
	xIWT5+ykx7dO2rITXiTgZcgSmPjCvPdx+1zkvasFircE0T0QYM3ukgX2OeyWsw12s6IZ
	4AcAdZvd4WYUHAljB2nLlzItI8l8y/QieyJt86GTCnS+63Pl7sjLd3BppQVCL96ZjRUI
	6LXn7jZNic+QGk7ujgLYP6cofEWM160zmI2Kp+D089z5WHrf8xy4MJ4mCpCYmVX03f/n
	mFwQ==
X-Received: by 10.68.234.69 with SMTP id uc5mr49328509pbc.81.1440454796875;
	Mon, 24 Aug 2015 15:19:56 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u10sm18537623pdp.85.2015.08.24.15.19.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:46 -0700
Message-Id: <327ee498b15c62b6763dc6ad4907f6d633d1c2bb.1440454579.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454579.git.chris_larson@mentor.com>
References: <cover.1440454579.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/5] pulseaudio: pass --with-systemduserunitdir
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

We want to make sure our path variables are obeyed.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a098473..6199dcd 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -43,7 +43,7 @@ PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
 PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enable-systemd-journal,--disable-systemd-daemon --disable-systemd-login --disable-systemd-journal,systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enable-systemd-journal --with-systemduserunitdir=${systemd_user_unitdir},--disable-systemd-daemon --disable-systemd-login --disable-systemd-journal,systemd"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-- 
2.2.1


