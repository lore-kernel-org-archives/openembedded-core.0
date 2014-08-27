Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0082B6AC7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 16:42:38 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2DD06212CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 18:42:38 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 18:42:27 +0200
Message-Id: <1409157747-26825-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] gstreamer1.0-plugins-bad: add opencv haar cascade XML files to package
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
X-List-Received-Date: Wed, 27 Aug 2014 16:42:41 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index fb31293..e1e13e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -126,3 +126,5 @@ EXTRA_OECONF += " \
 
 ARM_INSTRUCTION_SET = "arm"
 
+FILES_gstreamer1.0-plugins-bad-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
+
-- 
1.8.3.2


