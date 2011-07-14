Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhNEH-0006Vg-GR
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:49:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhNAS-0005Zz-8h
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:45:32 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2011 15:45:31 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310654732.2378.65.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libcap: pass prefix to "make install"
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
X-List-Received-Date: Thu, 14 Jul 2011 14:49:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise it will use /usr by default which may not be the right place.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libcap/libcap.inc     |    2 +-
 meta/recipes-support/libcap/libcap_2.20.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 3bff3b9..efa46d6 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -29,7 +29,7 @@ do_compile() {
 }
 
 do_install() {
-	oe_runmake install DESTDIR="${D}"
+	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
 }
 
 # pam files
diff --git a/meta/recipes-support/libcap/libcap_2.20.bb b/meta/recipes-support/libcap/libcap_2.20.bb
index c9741c2..a2b49c6 100644
--- a/meta/recipes-support/libcap/libcap_2.20.bb
+++ b/meta/recipes-support/libcap/libcap_2.20.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
 SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"
-- 
1.7.4.1





