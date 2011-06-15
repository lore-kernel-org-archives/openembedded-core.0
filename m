Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWr64-0005J3-4V for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:29:32 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWr2l-0005jl-Up
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 16:26:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 15 Jun 2011 15:26:06 +0100
Message-ID: <1308147966.25285.1758.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [patch] bind: adjust hardcoded install path references
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
X-List-Received-Date: Wed, 15 Jun 2011 14:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fixes do_install() on micro, which otherwise fails for obvious reasons.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-connectivity/bind/bind_9.7.2-P3.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.7.2-P3.bb b/meta/recipes-connectivity/bind/bind_9.7.2-P3.bb
index 4094aeb..e3089bb 100644
--- a/meta/recipes-connectivity/bind/bind_9.7.2-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.7.2-P3.bb
@@ -35,11 +35,11 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 
 do_install_append() {
-	rm "${D}/usr/bin/nslookup"
-	install -d "${D}/etc/bind"
-	install -d "${D}/etc/init.d"
-	install -m 644 ${S}/conf/* "${D}/etc/bind"
-	install -m 755 "${S}/init.d" "${D}/etc/init.d/bind"
+	rm "${D}${bindir}/nslookup"
+	install -d "${D}${sysconfdir}/bind"
+	install -d "${D}${sysconfdir}/init.d"
+	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
+	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
 }
 
 CONFFILES_${PN} = " \
-- 
1.7.2.5





