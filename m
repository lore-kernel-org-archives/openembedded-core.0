Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 60E8B79343
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id B0CAC6E8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:54 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:40 +0200
Message-Id: <20180926174244.20989-8-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 08/12] gstreamer1.0-vaapi: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:42 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...reamer1.0-vaapi_1.14.2.bb => gstreamer1.0-vaapi_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.2.bb => gstreamer1.0-vaapi_1.14.3.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.3.bb
index 34f2be9043..a852f0a938 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
           "
 
-SRC_URI[md5sum] = "12ee9c16dfa0bb1808c76683e1c9a328"
-SRC_URI[sha256sum] = "7f1064e27f5abd3a42ef66b425f1a2b9dbae7748c81bd9d090ce52a1aaf30d8a"
+SRC_URI[md5sum] = "c3aeaf8a7fdcbe37d9f40390b620775d"
+SRC_URI[sha256sum] = "8f5e65cb96aa6e44ff80926366d4a6fef9b8da68a04bab4bf2cbed93941c74f0"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.17.1


