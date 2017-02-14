Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C41971A75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 13:57:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so3703553wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 05:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5tBIJugbYnU/S2IiXQe3dg93iHZCAwwH3garhXyzPko=;
	b=TOkFcd7b7LEgjUY8+asblUv3fkQR5UEMUd7XAOYWfJL7qzVI/uxcpVWl5TVJVLufWf
	6jMkjj8XZZrAReGFwGwj0a5k0luPFqUIYlPJPC1uElChoFd7SGO+TTwLSM0939W0wrvt
	eF4Z1hW7NsnGu1y8UqRBR31lCMnR/junbResjeJwHqhSI29vl3elhs65v2/BbOCsRj+o
	EB1GbrCLsXK8If8GDJnpcibJxs9glRZbSRjlkUd8g3PaABXT+Lv3F3oY7k7v5rgawu8E
	fJiEjqgvw7CzkQMtmEbWxkVRmYDfYIxqefLrJlSvRa8UwUcwzYKE0Bs9OgM8J9qHQFKB
	MN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5tBIJugbYnU/S2IiXQe3dg93iHZCAwwH3garhXyzPko=;
	b=Ve4gcEDAarGbbuDJF8zasLdVjwOtyofo7hNvt9/z4hei56Ir9xkBA134beyXtfGjKf
	cZ8+dTsWG4snP8u4xFQRswh+VW42Z2TZsqYDs8sgKb2t/RLGuS3hYlMPyddZsK9kdOrf
	HaNku1GyCV/aZmqGcT5f9exzTrP/ZA6lY9bZDKP2T52oZKN/euCbo5MYZWL2qd1VhyUG
	Wv/8Tg8AA+Tywdg56PE0SDfk+ZKNbkxeFN6+LGlnVGKxtpLv/q9Kb2Hgx/quJH8aDu89
	fngUVnsNdW2s0X6vDzQoPdq3vPfFX3tN3OqipWtxoHzVTtkaAR86ZrDJQQKUmiBaFkmx
	tpiw==
X-Gm-Message-State: AMke39mrr8eYI3PM2HWp2fLNufo6kbQ+SrpguIQZVbjxU6jIbd5EwcKdup9uUIB5xljs/g==
X-Received: by 10.28.232.90 with SMTP id f87mr3291407wmh.35.1487080675905;
	Tue, 14 Feb 2017 05:57:55 -0800 (PST)
Received: from localhost.localdomain (ip-213-127-11-0.ip.prioritytelecom.net.
	[213.127.11.0])
	by smtp.gmail.com with ESMTPSA id 17sm927328wru.16.2017.02.14.05.57.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 05:57:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 05:57:49 -0800
Message-Id: <1487080669-10136-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] weston: fix LIC_FILES_CHKSUM endline and md5sum for src/compositor.c
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
X-List-Received-Date: Tue, 14 Feb 2017 13:57:57 -0000

The license text in Weston sources was changed from "MIT X11" to "MIT
Expat" in the 1.9.0 release. The new text is 3 lines longer than the
previous version, so endline and md5 hash have been incorrect for the
oe-core weston recipes from 1.9.0 onwards.

  https://cgit.freedesktop.org/wayland/weston/diff/src/compositor.c?id=a0bbfea64b04d3cf12327d8b488b9949a4cddc99

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/wayland/weston_1.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb b/meta/recipes-graphics/wayland/weston_1.11.1.bb
index 2736cc1..cdfac70 100644
--- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.11.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
-                    file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
+                    file://src/compositor.c;endline=26;md5=e342df749174a8ee11065583157c7a38"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
-- 
1.9.1


