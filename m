Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F40E56176F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYdC2sYtz5h
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582482575;
	bh=5mc+DFTR+6OI1zp7aENGm4T9DI5D8+AE3BSTNuZTjhI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=srK2u3BDd7sOPNU0RI6CGzhvMk6PlwgPLIICJk/PPfaldBxr8bYzNwceiZjlKxK1R
	kSBOz4EweR8+a7ZDowrdq0X9WlExbMKiM0cH/5kIdx90doRQr2l6YGdjPabgOWWS+Z
	buuRXvmuDI/I2OXRW4164ql12SuwRV9eQIn4HytXe14jEFWa5SWWI/PHa7w1rX5Own
	eOiR3Mq5+80N6bCkpWcAME9Vlx5PJ7lnhwyCPU5fU+bUHg3Xk8f9GDFwsMLXYZlCPI
	2GDurMqLhWSprsu1zHyo3DL351Mo+80/DQKrbec3iEK5PAMZk/MAbmfT0D5warZ7d1
	BJ5tvl7ucyoHkDu9oO7q/nx9s92yMo6LBu3xcKPLVB5eLcG6yKPdH7QWL01eP18KT7
	bhvLW8iG/Yb+cGrCR6CbuH1fcjuATUenezyoUTmNqF4sC8ySCSlCKSiPOurVkO3+Wf
	Z7PQtwzVx0hGQC6djc48xsgL6EkzWwrAz289y4VNux4WQPI9LyPE8YkcrRzbmzDR4+
	U2ZZFBRGtHKPQ3D0NbVKOcZIc8boHgYD+gYx0CZ/7qLHJwdbYLFCecorhTuORWajUN
	9kWDC626lDHv6IySUtqTCRH+Xdsxxl6DmW3h9jaLQO7EVNSzBfjHlWW4R6wwJpD9nA
	y6wAcE8II8gm07wKz8t521Is=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 20:29:30 +0200
Message-Id: <20200223182933.6168-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223182933.6168-1-bunk@stusta.de>
References: <20200223182933.6168-1-bunk@stusta.de>
Subject: [PATCH v2 3/6] webkitgtk: Remove obsolete gtk2 packageconfig
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
X-List-Received-Date: Sun, 23 Feb 2020 18:29:37 -0000

Upstream no longer supports GTK2 plugins.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 80ed427352..a9c00862c3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -48,7 +48,6 @@ PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
-PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
 PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
-- 
2.17.1


