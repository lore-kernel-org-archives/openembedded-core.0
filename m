Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 06E416DA6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 14:52:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2014 07:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,638,1389772800"; d="scan'208";a="470959156"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2014 07:51:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 16:54:29 +0200
Message-Id: <1394636069-6139-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] musicpd: upgrade to 0.18.9
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
X-List-Received-Date: Wed, 12 Mar 2014 14:52:10 -0000

- Upgrade fixes a crash with libvorbis 1.3.4;
- Simplified SRC_URI;
- Reference for S no longer necessary.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.18.4.bb => mpd_0.18.9.bb}  | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.4.bb => mpd_0.18.9.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
index 77ccc1f..349ccbb 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
@@ -6,14 +6,11 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
 
 SRC_URI = " \
-    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
+    http://www.musicpd.org/download/${PN}/stable/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-
-SRC_URI[md5sum] = "0d881fb32f9d31afcdb0bb13cb78b9ab"
-SRC_URI[sha256sum] = "6b171985f192603150c879d105dc4d05d701ac60a2db41630a4dce823e068388"
-
-S = "${WORKDIR}/${PN}-0.18"
+SRC_URI[md5sum] = "0e5156a831d4302d2032998bcfd5c36f"
+SRC_URI[sha256sum] = "0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be5346f19de5f699a68de"
 
 inherit autotools useradd systemd
 
-- 
1.8.3.2


