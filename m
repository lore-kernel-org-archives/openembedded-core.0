Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Jul 2014 21:00:16 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 132A270861
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:00:16 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 4D460331A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:53:33 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 22:53:21 +0200
Message-Id: <1406667203-14914-5-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
References: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 5/7] gstreamer1.0-plugins-ugly: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 29 Jul 2014 21:00:21 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...er1.0-plugins-ugly_1.2.4.bb => gstreamer1.0-plugins-ugly_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.4.bb => gstreamer1.0-plugins-ugly_1.4.0.bb} (66%)

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.4.bb b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.0.bb
similarity index 66%
rename from recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.4.bb
rename to recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.0.bb
index dd5cb4e..9035d2d 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.4.bb
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.0.bb
@@ -2,7 +2,7 @@ include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-SRC_URI[md5sum] = "c87a27db498bb736f6c266198657ea74"
-SRC_URI[sha256sum] = "4ef6f76a47d57b8385d457c7b620b4c28fc041ab1d7c2e3e2f5f05b12b988ea8"
+SRC_URI[md5sum] = "558146cb5ec8b313afe2113aafc3da85"
+SRC_URI[sha256sum] = "5314bb60f13d1a7b9c6317df73813af5f3f15a62c7c186b816b0024b5c61744d"
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.8.3.2


