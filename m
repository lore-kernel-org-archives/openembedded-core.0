Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id B25946007A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 14:39:52 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2D3AQDZNCNY/5tjdVtdHgYMgy8BAQEBAR9Yf7cOgg+CCBkMiAs/FAECAQEBAQEBAWIohTMBgX6IYAGgeJI8hB8Bh1WGPohyfIIAC4MJBZowhjiKFwKJeYYcApE9HjdjDwqCZAyCQD00AYR7gjwBAQE
X-IPAS-Result: A2D3AQDZNCNY/5tjdVtdHgYMgy8BAQEBAR9Yf7cOgg+CCBkMiAs/FAECAQEBAQEBAWIohTMBgX6IYAGgeJI8hB8Bh1WGPohyfIIAC4MJBZowhjiKFwKJeYYcApE9HjdjDwqCZAyCQD00AYR7gjwBAQE
X-IronPort-AV: E=Sophos;i="5.31,614,1473112800"; d="scan'208";a="192756606"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 09 Nov 2016 15:39:34 +0100
Received: from [192.168.10.140] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim)
	id 1c4U2I-0004xs-M9 for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 15:39:34 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 15:39:34 +0100
Message-Id: <1478702374-23791-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] webkitgtk: Add an option to disable opengl support
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
X-List-Received-Date: Wed, 09 Nov 2016 14:39:53 -0000

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
index 69c9f11..d6d9c14 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
@@ -41,7 +41,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
                    enchant \
                    libsecret \
                   "
@@ -53,6 +53,7 @@ PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant
 PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
+PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
 PACKAGECONFIG[libsecret] = "-DENABLE_CREDENTIAL_STORAGE=ON,-DENABLE_CREDENTIAL_STORAGE=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 
-- 
2.1.4


