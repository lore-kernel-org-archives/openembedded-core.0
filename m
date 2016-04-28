Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 2DED66FF3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:25:31 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 84ACE38F67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 20:25:31 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 20:25:11 +0200
Message-Id: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH v2 1/8] orc: update to 0.4.25
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
X-List-Received-Date: Thu, 28 Apr 2016 18:25:32 -0000

This version fixes a bug in the build scripts that caused it to believe
it is being built for Android if a "liblog.so" is found in the sysroot.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-devtools/orc/{orc_0.4.24.bb => orc_0.4.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.24.bb => orc_0.4.25.bb} (84%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.24.bb b/meta/recipes-devtools/orc/orc_0.4.25.bb
similarity index 84%
rename from meta/recipes-devtools/orc/orc_0.4.24.bb
rename to meta/recipes-devtools/orc/orc_0.4.25.bb
index 520f88d..f3bde46 100644
--- a/meta/recipes-devtools/orc/orc_0.4.24.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.25.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9e793ec34c0e20339659dd4bbbf62135"
-SRC_URI[sha256sum] = "338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b"
+SRC_URI[md5sum] = "8582a28b15f53110c88d8043d9f55bcf"
+SRC_URI[sha256sum] = "c1b1d54a58f26d483f0b3881538984789fe5d5460ab8fab74a1cacbd3d1c53d1"
 
 inherit autotools pkgconfig
 
-- 
2.5.0


