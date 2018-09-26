Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 63E3679373
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 064156E94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:55 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:42 +0200
Message-Id: <20180926174244.20989-10-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 10/12] gstreamer1.0-python: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:41 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...amer1.0-python_1.14.2.bb => gstreamer1.0-python_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.14.2.bb => gstreamer1.0-python_1.14.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.3.bb
index 78c0046328..d42c9196e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.3.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5b0af1bd490d79a7d435b2be47568f8e"
-SRC_URI[sha256sum] = "dc40be5ab4f1a433ff3f0af2b3d2d79a363009020c41ec10f9747ba64200cb22"
+SRC_URI[md5sum] = "af6907b1b6c41a52b27939417e8c5ba9"
+SRC_URI[sha256sum] = "4fc3e76c965384e54fb6be819d606ab304988eb677cf0c5dcc0dd555e3ad8307"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.17.1


