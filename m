Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B64976FF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:12:12 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so9772384wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=u8qgnnTlPJcSGdNHb8L33sWFS+N2Z3e2RKa2hMY649A=;
	b=Gof0yU3865P8e3o98dk88cwdvY2gZ/NskWnMIzZ8CvxVzVE4FlzAuWUzikw7dUerhP
	FXI3ddh58gRNk9S8KP6pQWgftGeCSgQzo/wl4lCo/pDsJ4WLQplzfPcWtl9XRvaHtMOw
	pW+//skXg7hXm4pBz/x3lMCMkMBLA4UXrIGcdB7SIHcnd6F5slsZmAwISTYLf91iWh18
	WCCa/KHspDPGCbA9XUEblS/xyHoxbkUa27XjXxelvEQjuI+5oU0dsvlWKEo/f7yVTmxc
	yGJuOnFxa472wMKkbIolSm9G0S8ZLdLtsqj82RYRBfYz04UDXsIz6XxNK7q5oCcy4Yit
	7ytw==
X-Received: by 10.194.104.39 with SMTP id gb7mr29091105wjb.150.1441048332204; 
	Mon, 31 Aug 2015 12:12:12 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pu6sm23568430wjc.34.2015.08.31.12.12.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:12:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 12:12:02 -0700
Message-Id: <105a8ba3de65ee37a616bff4e1c455d29bf89bf8.1441048182.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <02054faced424f2d07fb72f8ac92ee93521c519e.1441048182.git.chris_larson@mentor.com>
References: <02054faced424f2d07fb72f8ac92ee93521c519e.1441048182.git.chris_larson@mentor.com>
In-Reply-To: <cover.1441048182.git.chris_larson@mentor.com>
References: <cover.1441048182.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/3] pulseaudio: pass --with-systemduserunitdir
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
X-List-Received-Date: Mon, 31 Aug 2015 19:12:12 -0000

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


