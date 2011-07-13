Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qh2Yh-0002WK-63
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 18:45:11 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qh2Us-0004he-FQ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 18:41:14 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 17:41:13 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310575274.2378.32.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] gcc-4.6: update to 4.6.1 release
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
X-List-Received-Date: Wed, 13 Jul 2011 16:45:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Set SRCREV to match the point at which 4.6.1 was released, update PV appropriately.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 56064b5..8af5369 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r8"
+PR = "r0"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -8,7 +8,7 @@ PR = "r8"
 # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
 # to reflect that change
 
-PV = "4.6.0+svnr${SRCPV}"
+PV = "4.6.1+svnr${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
@@ -18,7 +18,7 @@ PV = "4.6.0+svnr${SRCPV}"
 
 BINV = "4.6.1"
 
-SRCREV = 175150
+SRCREV = 175454
 BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
-- 
1.7.4.1





