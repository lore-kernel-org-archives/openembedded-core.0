Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DEEB560589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 21:55:11 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l126so86917972wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 13:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=govoD66Chsjfw/984erbeZ5wFVqpIr6XpzEQXrD70ms=;
	b=19AskDdxEmdBcTvNWYQFlQ6v71LiPWY867yPnYfHtVTHk4jMoF18yslOwEdMEr3Azq
	ne01g4VkBphxri70/HZYjM9285HA4iHqJONMC40YvfQLXVmhUNsIwt6blQ+Zrmwlr6Gc
	gb9yEJUbRxZwRKa+anHnDwkHChs2VpaexlMlFu4563Cef+KzjIpmMk6UZW2bzhkVDX8T
	yGZj1rWxWTgUjRwi920Jn0K9Qds1n4a3KSCAVGi+lUVNQE0cz1QzNSLuNtdVFgdGg0l7
	uIPQj4CmlZ4ySnW0HpIQ+mpvabs3d8foG7ycuks+TqLgNzO5VYSsz92/KfxOqbgikCNE
	bGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=govoD66Chsjfw/984erbeZ5wFVqpIr6XpzEQXrD70ms=;
	b=i+oJ7azrLpC3yk8/QqtYIp2yPe0/ZQHJWU4Vpjt4q4wG6hJlBy0xLWDse5BEJmPMSn
	1avCwRD2o+rbE+hVIUio/ixyy6lBXR0+sYV4tJxfMN3LaFF37QJ2BMXFf1/cC8c/FcdD
	Uev4LdlIiyJxByGWFC880JcAMr2GZj4SSzPBmTH/R1tEU5uo+0wyi6DCg571J4ncuhjG
	xaE9x98IDZPgCe/qo3D0A2EKAlwX2o0xbKoGN19mUOr68FKJ4LsVavm34cEcq4ESw5hu
	bWcmECb2OlZxVMqb4q/dhM2PqBVPiF/eCdvNUPD4T9i6QBkIJMr9iR6TcwgaPg/U/WEe
	Rhww==
X-Gm-Message-State: ALoCoQnQeb67cLQpiYq3i4tQKt+SdV/dzzM5aOdYX+wEwO9YBura9LkiNkTwzOt+G3O+PrwVD5S7CtNhOxxLo5aLS9dqpCXpRA==
X-Received: by 10.28.221.85 with SMTP id u82mr12859861wmg.95.1450734911783;
	Mon, 21 Dec 2015 13:55:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x125sm21760952wmg.1.2015.12.21.13.55.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 13:55:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Dec 2015 21:54:53 +0000
Message-Id: <1450734893-31431-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] conf/local.conf.sample: comment out ASSUME_PROVIDED=libsdl-native
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
X-List-Received-Date: Mon, 21 Dec 2015 21:55:12 -0000

Ubuntu 15.10 and Debian testing can't build qemu-native against the host libsdl.
Now that libsdl-native is buildable, comment out the ASSUME_PROVIDED which meant
it wouldn't be used.

[ YOCTO #8553 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/local.conf.sample | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 3ae24ab..42647c4 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -201,12 +201,12 @@ BB_DISKMON_DIRS = "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. This assumes there is a
-# libsdl library available on your build system.
+# seen. The two lines below enable the SDL backend too. By default libsdl-native will
+# be built, if you want to use your host's libSDL instead of the minimal libsdl built
+# by libsdl-native then uncomment the ASSUME_PROVIDED line below.
 PACKAGECONFIG_append_pn-qemu-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-ASSUME_PROVIDED += "libsdl-native"
-
+#ASSUME_PROVIDED += "libsdl-native"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.6.4


