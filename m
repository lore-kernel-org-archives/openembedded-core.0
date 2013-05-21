Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5F762235
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:08:53 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 4A481952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:08:54 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 16:08:43 +0100
Message-Id: <1369148923-20676-5-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 4/4] clutter-gst: removed no longer required configure fragment
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
X-List-Received-Date: Tue, 21 May 2013 15:08:53 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

The current package no longer use DOLT, so the DOLT configure frament is no
longer required.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
index f79795c..b5edcae 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
@@ -16,8 +16,3 @@ FILES_${PN}          += "${libdir}/gstreamer-0.10/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-dbg      += "${libdir}/gstreamer-0.10/.debug/lib*.so"
 FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
-
-do_configure_prepend () {
-       # Disable DOLT
-       sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-- 
1.7.10.4


