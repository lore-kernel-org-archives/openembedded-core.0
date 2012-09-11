Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBV3K-0004GL-6x
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:19:14 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TBUrF-0000Te-CF
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:06:45 +0200
Message-ID: <1347386679.29443.33.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 19:04:39 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES
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
X-List-Received-Date: Tue, 11 Sep 2012 18:19:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit 13544fbc6217fee1731a6da1e2cf94901a500842 changed the ordering
of PACKAGES so that ${PN}-dev came before ${PN}.  However, this caused
the FILES matching to go wrong if ${libdir} == ${base_libdir}.  Fix this
by moving ${PN} ahead of ${PN}-dev once again.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index edf7a75..adf31de 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,7 +17,7 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN} eglibc-extra-nss" 
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc" 
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
-- 
1.7.9





