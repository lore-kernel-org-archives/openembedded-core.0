Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVJbR-0005q5-3i for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:40:39 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVJKK-0003w4-7e
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:22:56 +0200
Message-ID: <1366885375.14512.69.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 11:22:55 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Don't add ${PN} to RRECOMMENDS_${PN}-dbg
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
X-List-Received-Date: Thu, 25 Apr 2013 10:41:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This recommendation is of no obvious value and causes unexpected behaviour
when using IMAGE_FEATURES += "dbg-pkgs".

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/bitbake.conf |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c0efdee..bc2b071 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -310,7 +310,6 @@ FILES_${PN}-dbg = "${@d.getVar(['DOTDEBUG-dbg', 'DEBUGFILEDIRECTORY-dbg'][d.getV
 
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
-RRECOMMENDS_${PN}-dbg = "${PN} (= ${EXTENDPKGV})"
 
 FILES_${PN}-locale = "${datadir}/locale"
 
-- 
1.7.10.4





