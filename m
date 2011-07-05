Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEjZ-0007kF-FA
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 01:08:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 2957E31336; Tue,  5 Jul 2011 23:51:26 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:13 +0100
Message-Id: <ab9242965628a301b702d6c8426e59182655fabf.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/17] x11perf: Packaged unpackaged files
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
X-List-Received-Date: Tue, 05 Jul 2011 23:08:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb b/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
index 8faffe0..26057d5 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
@@ -11,8 +11,10 @@ DEPENDS += "libxmu libxrender libxft libxext fontconfig"
 LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
                     file://x11perf.h;endline=24;md5=29555066baf406a105ff917ac25b2d01"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
+FILES_${PN} += "${libdir}/X11/x11perfcomp/*"
+
 SRC_URI[md5sum] = "c3ac3667a6f5c3cead9847fbf4b5f36e"
 SRC_URI[sha256sum] = "394d7355afe7f3b054ce6f30db78794c6305c6593d48b7fb86a9c89d9d9e21bd"
-- 
1.7.4.1



