Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUgci-00058K-Ki for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 19:03:58 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UUgLe-0007rv-A1
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:45:42 +0200
Message-ID: <1366735541.5732.20.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 17:45:41 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] icu: Remove unnecessary FULL_OPTIMIZATION_arm setting
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
X-List-Received-Date: Tue, 23 Apr 2013 17:04:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is distro policy and shouldn't be getting set by the recipe.  It was
added in commit 9b547ecf849b66aa883328fb6b26d9b412a4d2ec as a workaround
for gcc bug #37436, but the compiler bug was fixed more than four years
ago and the workaround is no longer required.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/icu/icu.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index d7cb84a..77efcdb 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -10,7 +10,6 @@ S = "${WORKDIR}/icu/source"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 PARALLEL_MAKE = ""
-FULL_OPTIMIZATION_arm = "-Os"
 CPPFLAGS_append_libc-uclibc = " -DU_TIMEZONE=0"
 
 inherit autotools pkgconfig binconfig
-- 
1.7.10.4






