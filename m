Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD8376DEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:08:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t83L835K010694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Sep 2015 14:08:03 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 3 Sep 2015 14:08:02 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Sep 2015 14:08:02 -0700
Message-ID: <1441314482-15613-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] libinput: avoid --enable-event-gui=auto
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
X-List-Received-Date: Thu, 03 Sep 2015 21:08:07 -0000
Content-Type: text/plain

Specify a value via PACKAGECONFIG[gui].  The default is
--diable-event-gui.
---
 meta/recipes-graphics/wayland/libinput_0.21.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/libinput_0.21.0.bb b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
index d51fb37..ac5a249 100644
--- a/meta/recipes-graphics/wayland/libinput_0.21.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
@@ -18,6 +18,7 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 
 FILES_${PN} += "${libdir}/udev/"
 FILES_${PN}-dbg += "${libdir}/udev/.debug"
-- 
1.7.9.5


