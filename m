Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QruAh-0007XT-MF
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:01:19 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qru6K-0000fX-VP
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 17:56:49 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 16:56:47 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313164608.6733.162.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] pixman: remove spurious dependency on libx11
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
X-List-Received-Date: Fri, 12 Aug 2011 16:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Nothing in pixman actually uses libx11, so no need to DEPEND on it.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
index e5472c0..1a33a18 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
@@ -13,8 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
 
-DEPENDS = "virtual/libx11"
-
 PE = "1"
 PR = "r0"
 
-- 
1.7.4.1





