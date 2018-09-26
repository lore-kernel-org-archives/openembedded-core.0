Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 528 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Sep 2018 17:51:41 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 62E2879368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id AD09B6E88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:53 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:34 +0200
Message-Id: <20180926174244.20989-2-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 02/12] gstreamer1.0-plugin-base: upgrade to version 1.14.3
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
 ...ins-base_1.14.2.bb => gstreamer1.0-plugins-base_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.14.2.bb => gstreamer1.0-plugins-base_1.14.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.3.bb
index dcea789192..a6a7c8d473 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.3.bb
@@ -21,8 +21,8 @@ SRC_URI = " \
             file://0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "8bc790d623350cd8eac68d3a13d79f7d"
-SRC_URI[sha256sum] = "a4b7e80ba869f599307449b17c9e00b5d1e94d3ba1d8a1a386b8770b2ef01c7c"
+SRC_URI[md5sum] = "2ba8eaef8a249c0fddb37f21e2912e16"
+SRC_URI[sha256sum] = "f0b319c36be0ffc2a00380c77ba269cdf04e2b39bbc49d30b641fc35aa0b7952"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.17.1


