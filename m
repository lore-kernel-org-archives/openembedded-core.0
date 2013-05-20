Received: from afflict.kos.to ([92.243.29.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <riku.voipio@linaro.org>) id 1UeQ6L-00072d-JO
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 15:26:19 +0200
Received: from aimless.elisa-laajakaista.fi
	(a91-156-57-234.elisa-laajakaista.fi [91.156.57.234])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 12BC426541;
	Mon, 20 May 2013 15:02:40 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 16:02:30 +0300
Message-Id: <1369054950-4271-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xserver-xorg: enable xvfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 13:26:46 -0000

Currently Xvfb has been enabled in openembedded-core. Xvfb is needed
for example in Mauve testsuite.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 0eca559..3d68413 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -111,7 +111,7 @@ EXTRA_OECONF += "--with-fop=no \
                  --disable-record \
                  --disable-dmx \
                  --disable-xnest \
-                 --disable-xvfb \
+                 --enable-xvfb \
                  --enable-composite \
                  --without-dtrace \
                  --with-int10=x86emu \
-- 
1.7.10.4



