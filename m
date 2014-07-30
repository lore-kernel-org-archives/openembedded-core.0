Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 5893D708B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 08:57:41 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 766CF331B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:57:42 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 10:57:30 +0200
Message-Id: <1406710655-6778-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406710655-6778-1-git-send-email-dv@pseudoterminal.org>
References: <1406710655-6778-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v3 2/7] gstreamer1.0-plugins-base: upgrade to 1.4.0
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
X-List-Received-Date: Wed, 30 Jul 2014 08:57:44 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...er1.0-plugins-base_1.2.4.bb => gstreamer1.0-plugins-base_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.4.bb => gstreamer1.0-plugins-base_1.4.0.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.0.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.0.bb
index dee0894..968f092 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.0.bb
@@ -9,6 +9,6 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
 "
 
-SRC_URI[md5sum] = "278e0a1872ecb981e91830b2cb7f3e98"
-SRC_URI[sha256sum] = "4d6273dc3f5a94bcc53ccfe0711cfddd49e31371d1136bf62fa1ecc604fc6550"
+SRC_URI[md5sum] = "1ff06280b03b9098a706d1290d8bb3bd"
+SRC_URI[sha256sum] = "5daed4b983b64e4e3fbe9cd29063e4302812cd03ba685a15b06a790911d04c1e"
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.8.3.2


