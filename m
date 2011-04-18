Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBjcR-0005ks-79
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:15:39 +0200
Received: by wye20 with SMTP id 20so4091019wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:13:19 -0700 (PDT)
Received: by 10.217.6.202 with SMTP id y52mr2396733wes.42.1303114398887;
	Mon, 18 Apr 2011 01:13:18 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a50sm2437987wer.42.2011.04.18.01.13.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:13:18 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 10:13:05 +0200
Message-Id: <1303114385-9828-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] x11vnc: fix SRC_URI
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
X-List-Received-Date: Mon, 18 Apr 2011 08:15:39 -0000

The download structure got changed at some point and made this recipe unfetchable

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
index f92eb49..1c66318 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
@@ -11,7 +11,7 @@ DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib"
 
 PR = "r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz\
+SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
            file://starting-fix.patch \
            file://endian-fix.patch "
 
-- 
1.6.6.1



