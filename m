Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SAReq-0008BG-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:57:21 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 16:55:21 +0100
Message-Id: <1332345321-10001-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] mirrors.bbclass: remove dead kernel.org mirrors
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
X-List-Received-Date: Wed, 21 Mar 2012 19:57:21 -0000

* ftp.{us,uk,hk,au,jp}.kernel.org don't have DNS A records.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* Not sure whether it's just temporary or not.

 meta/classes/mirrors.bbclass |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index c613595..bf23e05 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -19,11 +19,6 @@ ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool \n \
 ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu \n \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
-${KERNELORG_MIRROR}	ftp://ftp.us.kernel.org/pub \n \
-${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub \n \
-${KERNELORG_MIRROR}	ftp://ftp.hk.kernel.org/pub \n \
-${KERNELORG_MIRROR}	ftp://ftp.au.kernel.org/pub \n \
-${KERNELORG_MIRROR}	ftp://ftp.jp.kernel.org/pub \n \
 ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/ \n \
 ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/ \n \
 ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/ \n \
-- 
1.7.5.4



