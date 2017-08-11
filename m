Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 502BC78600
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:37:11 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3B1B64CB56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:37:12 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:37:01 +0200
Message-Id: <1502487421-18235-11-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
References: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 10/10] gstreamer1.0-python: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:37:11 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0-python_1.10.4.bb => gstreamer1.0-python_1.12.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.10.4.bb => gstreamer1.0-python_1.12.2.bb} (57%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.2.bb
similarity index 57%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.2.bb
index 1365f7c..b2dc05b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.12.2.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-python.inc
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
-SRC_URI[sha256sum] = "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
+SRC_URI[md5sum] = "da5c9fa42290bc3006661c869e076ffe"
+SRC_URI[sha256sum] = "f4cc32ad46a653e1ae2f27ac2a16078b00075c9106b2784a1a8d1f31c5069e47"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
-- 
2.7.4


