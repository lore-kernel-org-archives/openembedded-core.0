Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5Ta2-0004Xe-5V
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 03:59:50 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2012 03:51:10 +0100
Message-Id: <1331175070-12257-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH][RFC] bitbake.conf: use empty SRC_URI by default
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
X-List-Received-Date: Thu, 08 Mar 2012 02:59:50 -0000

* Otherwise, recipes that only append to SRC_URI instead of
  overwriting it will get the full path of the recipe written
  into the Source: field of the package.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* I haven't tested this yet, I don't know whether there
  are any caveeats. What's the purpose of having ${FILE}
  in there, anyway?

 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c8d9a31..216da75 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -577,7 +577,7 @@ SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"
 SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
-SRC_URI = "file://${FILE}"
+SRC_URI = ""
 
 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
-- 
1.7.5.4



