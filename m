Return-Path: <>
X-Greylist: delayed 535 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jun 2016 20:20:00 UTC
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by mail.openembedded.org (Postfix) with ESMTP id C11AD60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 20:20:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5MKB5DE016767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:11:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5MKB5cV000486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:11:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 22 Jun 2016 15:11:04 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5MKB5mH007192;	Wed, 22 Jun 2016 15:11:05 -0500
Received: from localhost (uda0226330.am.dhcp.ti.com [128.247.83.90])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	u5MKB4327185; Wed, 22 Jun 2016 15:11:04 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2016 15:11:02 -0500
Message-ID: <20160622201102.10039-1-afd@ti.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH] libsdl2: Add missing comma typo
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
X-List-Received-Date: Wed, 22 Jun 2016 20:20:01 -0000
Content-Type: text/plain

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
index 8f079c8..844ff33 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
-PACKAGECONFIG[directfb]   = "--enable-video-directfb --disable-video-directfb,directfb"
+PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
 PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
-- 
2.9.0


