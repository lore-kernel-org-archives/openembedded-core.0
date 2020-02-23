Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F1E166177E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 17:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QXM43q88z5h;
	Sun, 23 Feb 2020 18:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582479136;
	bh=5mc+DFTR+6OI1zp7aENGm4T9DI5D8+AE3BSTNuZTjhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fS+116cNP/J9cQKEAMhqjhjQLCf+JNVAi9YsCyyendvNVrDKzN9tUy3jfDWpoUwap
	t6OycFSBqU08wAG1Srop2OeqyEze7xUqkV2PGwYwF+q7nmDk1oLwLSgVY+956jl0KU
	wrA/o1nLG1DmqBxufJQXWHdBYHUFD5KolmlOskv74NE5vu2Z9f/6SSgrzz3C2aaOFP
	uMqpbtS88ZyYHcGcyzeM2Xm9Gsqw1K7nvNwaHlv/bEHv6HVE/zZxwtdj4g+0TP3hb5
	02aZNzWCDLQQwnTLuGsHP3uG7OwZtu6oCHtiUWztGP3w0SVPFj1C+TlE0fooWEW+Rr
	5oYgrvOpDWsquGP+5XggQAa8l9fXGuGk+TpKmvSMt7hNcSxnBQw4OliKbWJ5EakqZB
	jGUwPNMHO/oTZQOKPhueeVPW9q7dyPm9xbZeeBJw2fCB+y5/tpaJSRs2+Vdorkpw6y
	8LZIZ0HWjsSRnshw5csVSKt/80Qn6kTIIi3W/Ulhm5wXl3fQYbpEXPMwsX0JbQFAUQ
	ilGH/7fx7i4baxmqF4j4/WsiPdCyp7yozmzioyT6GF898XUdYjc4grNC4nHHKycv4r
	MNeOTtOm7ySMgHt77r1B3gJEpBXRxcRc+8RX4adRU5pVk/fHOnVDENQCk5sjlXwIz3
	0jjK5RwcMjSKVq4HML5I7tUo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 19:32:11 +0200
Message-Id: <20200223173214.9487-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223173214.9487-1-bunk@stusta.de>
References: <20200223173214.9487-1-bunk@stusta.de>
Subject: [PATCH 3/6] webkitgtk: Remove obsolete gtk2 packageconfig
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
X-List-Received-Date: Sun, 23 Feb 2020 17:32:18 -0000

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


