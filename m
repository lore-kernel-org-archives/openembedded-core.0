Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 77C086E5FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 17:55:36 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a197so37995679wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 09:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JH9Nm5muvBLqEsoVfS9iaTnkEX9TtM6cx4PHQhKQKmI=;
	b=WmnzvDgjicGoTqquGnIvvaM74WToXkoseNCswNGaBpcGbF3WRQs7Fp2F+YwP4oAdbH
	7B3c3tiKcf8up6yCRzGKlnI2tdfP6r/w0jFmXFo3xV5AuI0l2NH8Kh+9mtz6EUjhs4+3
	WQyT1AQoUHUMr1qkm7wfFHK60l6fTDMN9WI97eO54JKBzzBNKGmiQjvWc+06kaI/gJ3f
	E0cOCkPAxhVuBOf/z0HVuc1S9Ou9dmutJ+MyEMzd2k4pH8IUI6WxoopVdb0UhQ4U1XGk
	fprpDvt91Js3mIbFauBNI1AJLW0GUbEBNnn9cBkkjzcC0y0+ACCkfcrv8ZHoTyqPnFQS
	EQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JH9Nm5muvBLqEsoVfS9iaTnkEX9TtM6cx4PHQhKQKmI=;
	b=S5p892OzgHRorCCDeBIBOCw6osCamy1R1spRGV20hG9bJvhGT3C79YvHlGQ6qRZByO
	E4L3JfVHsksa1/MEiitkJuN3Cj3Q9XUwyqehBO6hZBfAZwn5HBkaQi8tftq/UyLsNVui
	SlGtY2ezBc1sD4NcUnGUyEw1SbUhWsmyvSZtuECo2TdwCTyqAZMa2JF5UMr4tFNzhY4c
	Zgaa5u2f+M2bWTuJT+alH8HhowrKqGsOoYVqaH2IfG7kEhwGOQJdeSbomkZa/KaWYWYI
	2cDaDyPjCGjHk4cUs8Y4CC4C/dKeEDb0IGFn1rzbQ2IHtri8T0xYFB1mtA4xUFOSQv/b
	sqAA==
X-Gm-Message-State: AKaTC03d7yocXd8fqU1estFkIoB5wQr7ZdDyngts5JCPvvjax0iwyA11gZZW5wVfvX/KSECh
X-Received: by 10.28.86.131 with SMTP id k125mr3826720wmb.89.1479837337153;
	Tue, 22 Nov 2016 09:55:37 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f76sm4161887wmd.15.2016.11.22.09.55.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Nov 2016 09:55:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2016 17:55:32 +0000
Message-Id: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][morty 1/2] Revert "libwnck3: remove the recipe"
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
X-List-Received-Date: Tue, 22 Nov 2016 17:55:38 -0000

The epiphany in morty still needs libwnck3, so bring it back.

This reverts commit 129281e8557ec8d29ecf863675884713a3050f4b.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb

diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
new file mode 100644
index 0000000..fd4ef69
--- /dev/null
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Window navigation construction toolkit"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+BPN = "libwnck"
+
+SECTION = "x11/libs"
+DEPENDS = "intltool-native gtk+3 gdk-pixbuf-native libxres"
+
+PACKAGECONFIG ??= "startup-notification"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
+inherit gnomebase gobject-introspection gtk-doc
+SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
+SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
+
+inherit distro_features_check
+# libxres means x11 only
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.8.1


