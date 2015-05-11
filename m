Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2D2373FAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:32:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B8W3oZ004461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 01:32:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 01:32:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 01:32:00 -0700
Message-ID: <d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431333085.git.liezhi.yang@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Mon, 11 May 2015 08:32:05 -0000
Content-Type: text/plain

The default is auto, we can disable it rather than depend on wayland or
add a PACKAGECONFIG since they are two display servers.

Fixed do_compile error:
hw/xwayland/xwayland.h:36:28: fatal error: wayland-client.h: No such file or directory
 #include <wayland-client.h>
                            ^
compilation terminated.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 30299c2..512266c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -104,6 +104,7 @@ EXTRA_OECONF += "--with-fop=no \
                  --disable-record \
                  --disable-dmx \
                  --disable-xnest \
+                 --disable-xwayland \
                  --enable-xvfb \
                  --enable-composite \
                  --without-dtrace \
-- 
1.7.9.5


