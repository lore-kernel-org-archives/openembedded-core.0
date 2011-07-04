Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmMD-0005VZ-AH
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 791F730C08; Mon,  4 Jul 2011 17:46:33 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:29 +0100
Message-Id: <aaf2dd419b01f164198436d8f806b6f63a8c9ede.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
References: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/8] lttng-viewer: Fixup various QA warnings and a false positive
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jul 2011 16:50:49 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
index 5e7bd4c..233d836 100644
--- a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
+++ b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f650d5f5af1e9648fe0b40e290d3adbb \
                     file://ltt/ltt.h;beginline=2;endline=18;md5=8b7da9190028c50396d97fc85bad0da9 \
                     file://lttv/lttv/traceset.c;beginline=2;endline=17;md5=bcab42863b64b41d153bf81bbe2490a6"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "gtk+ pango popt"
 
@@ -34,4 +34,6 @@ FILES_${PN} += "\
     ${datadir}/lttv/facilities/* \
     ${datadir}/lttv/pixmaps/* "
 FILES_${PN}-dbg += "${libdir}/lttv/plugins/.debug/"
-
+FILES_${PN}-dev += "${libdir}/lttv/plugins/*.la"
+FILES_${PN}-staticdev += "${libdir}/lttv/plugins/*.a"
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.4.1



