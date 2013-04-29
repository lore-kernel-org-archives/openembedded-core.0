Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWnvU-0004Fn-MK for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 15:16:05 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UWneH-0001B8-KB
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 14:57:41 +0200
Message-ID: <1367240260.14512.120.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 13:57:40 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
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
X-List-Received-Date: Mon, 29 Apr 2013 13:16:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Nothing in this package uses xkbcomp so depending on it here is not appropriate.
Whatever package(s) is/are invoking that binary should be the ones to depend
on it.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
index ccb9f74..cf4da28 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
@@ -23,7 +23,6 @@ PR = "r0"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
-RDEPENDS_${PN} += "xkbcomp"
 FILES_${PN} += "${datadir}/X11/xkb"
 
 inherit autotools pkgconfig
-- 
1.7.10.4





