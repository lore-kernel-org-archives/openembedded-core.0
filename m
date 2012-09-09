Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TAi18-0005k2-Ep
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 15:57:42 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TAhp6-0007hj-0s
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 15:45:16 +0200
Message-ID: <1347198189.4396.261.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 09 Sep 2012 14:43:09 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: libcap: respect ${base_sbindir}
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
X-List-Received-Date: Sun, 09 Sep 2012 13:57:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Need to pass the path explicitly to "make install" to ensure that the binaries end up
in the right locations.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-support/libcap/libcap.inc     |    2 +-
 meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 5d7291e..bfaeffd 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -43,7 +43,7 @@ do_compile() {
 }
 
 do_install() {
-	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
+	oe_runmake install DESTDIR="${D}" prefix="${prefix}" SBINDIR="${D}${base_sbindir}"
 }
 
 do_install_append() {
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
index b631c51..d57c102 100644
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "b4896816b626bea445f0b3849bdd4077"
 SRC_URI[sha256sum] = "e1cae65d8febf2579be37c255d2e058715785ead481a4e6a4357a06aff84721f"
-- 
1.7.9





