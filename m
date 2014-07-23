Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1CAC465CAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 21:04:25 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XA3i6-0003jS-1B from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jul 2014 14:04:26 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 23 Jul 2014 14:04:25 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 23 Jul 2014 14:04:25 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 17:04:22 -0400
Message-ID: <1406149462-14828-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Jul 2014 21:04:25.0848 (UTC)
	FILETIME=[AF5FB780:01CFA6B9]
Subject: [PATCH] libomxil-0.9.3: Updated CORE_NAME to drop .0 extension.
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
X-List-Received-Date: Wed, 23 Jul 2014 21:04:28 -0000
Content-Type: text/plain

As a result of commit 0ef3734c2f279bf463ba4d1aef5241cd4882d483 the ".0"
extension for GSTREAMER_1_0_OMX_CORE_NAME is no longer needed.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index b423863..9085acc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -13,7 +13,7 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 PR = "r1"
 
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
-GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
+GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so"
 
 EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET}"
 
-- 
1.9.1


