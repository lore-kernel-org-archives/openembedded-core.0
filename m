Return-Path: <diego.rondini@kynetics.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE497BE00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 10:00:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b3so304377ede.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bgZF82wRdU+KgA6O4k8c8so6U7ytyAGtx08sguhQ0bg=;
	b=jSFLOxxZ3SvP/KvKuhvCZRGNvOEh+EeL0mkHwhflD7oi8sctX8Pm2glkX2gSkAIlh5
	YJsO9AlQsJK3gNqMqVXfc3FdiyrWhzbezK85vgjnstNyKP6rhobbAWktsek3OFF7gSpA
	OhjTgdXmXgpZXJwJVHnuauHs5LSZt0g7TZq/chVMMBIQ1/L5e4v1/VJP9q3QxXQkpJ7R
	AqNQeDe3h+yS/G4pg+mtswNWhNKxIw/4EamMpGKeWE4vtLnK14rDiYuHgEaHtZ1+8aBU
	RC0XKF2odBFnSLriGdqVSHw07ZRgWPwsBVNVbDd6x0XgoL389UUOOSsYxueDDIAQ8zSG
	4Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bgZF82wRdU+KgA6O4k8c8so6U7ytyAGtx08sguhQ0bg=;
	b=ZHH94IWhmwvVkrHIiaZONaxs3nhER25TKkr+76Sa4TZRJh8vLmb5lxakxxT6ZP64A0
	o9zxalnc0REAZLxgrkpkMKwuxZAqHkns01iNIUglAw0SvNnNRJ3kRYkN/8Q6lwjmGINz
	mVizu4bp1pj7aZ7EK0nBC+cyLeIYXgmNwAR3tE5Zu5sItAEXvmC67hzqr8G50ZCmZyxC
	BfSJe33eZsGjRiZzYVAiLlPdsHO5gju15LdtZyuWxIcoNdLwbyLcL4FgVHw7oPjItvHQ
	4MtjUa/YE8cjFDKa5n+rvc8xqvh+SkeXnpNNUQbmkAUKFC+ED2LNHgdPyJNj833HkIjn
	2OfA==
X-Gm-Message-State: AA+aEWY6KegWzyGyeq+D1+Y9tWx0xG/gDc0yStjDFTPcOJdDa0dc+iBJ
	+IhJYCHGm5M096Gv9+8AHdqGg1BOf5NCVEIs
X-Google-Smtp-Source: AFSGD/X7Jaz+JMBXxb9VA+jFApHu2G6ADdT2+IVQrVxe7V4J/Q8lDtPtjHYRpL7KduJayMxmqhx7pw==
X-Received: by 2002:aa7:cf88:: with SMTP id z8mr56126022edx.208.1546855248293; 
	Mon, 07 Jan 2019 02:00:48 -0800 (PST)
Received: from ip-172-31-7-228.eu-west-1.compute.internal
	(ec2-34-247-13-138.eu-west-1.compute.amazonaws.com. [34.247.13.138])
	by smtp.gmail.com with ESMTPSA id
	b45sm35137943eda.34.2019.01.07.02.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Jan 2019 02:00:47 -0800 (PST)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 09:58:55 +0000
Message-Id: <1546855135-2990-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] gtk+3: add PACKAGECONFIG for cups
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
X-List-Received-Date: Mon, 07 Jan 2019 10:00:48 -0000

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 6331a43..519a984 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -33,7 +33,6 @@ EXTRA_OECONF += " \
                  --disable-glibtest \
                  --disable-xinerama \
                  --enable-modules \
-                 --disable-cups \
                  --disable-colord \
                  ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
                  "
@@ -50,6 +49,7 @@ PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fon
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
+PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 
 do_install_append() {
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
-- 
2.7.4


