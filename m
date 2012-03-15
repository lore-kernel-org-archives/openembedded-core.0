Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S89fz-0002Zr-84
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 13:21:03 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 13:12:15 +0100
Message-Id: <1331813535-9763-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] mirrors.bbclass: remove dead GNU mirrors
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
X-List-Received-Date: Thu, 15 Mar 2012 12:21:03 -0000

* ftp.matrix.com.br and sunsite.ust.hk don't have DNS records.
* ftp.cs.ubc.ca doesn't host the referenced directory.
* ftp.ayamura.org doesn't respond to ping or ftp.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/mirrors.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index c08a3d7..c613595 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -18,10 +18,6 @@ ${DEBIAN_MIRROR}	ftp://ftp.es.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool \n \
 ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu \n \
-${GNU_MIRROR}	ftp://ftp.matrix.com.br/pub/gnu \n \
-${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu \n \
-${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu \n \
-${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu \n \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.us.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub \n \
-- 
1.7.5.4



