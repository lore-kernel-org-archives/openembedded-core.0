Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TMQa4-0005Pj-5W
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 23:46:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TMQNL-000382-DZ
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 23:33:03 +0200
Message-ID: <1349991029.4470.74.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2012 22:30:29 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] gtk-doc.bbclass: Run gtkdocize in ${S} not ${B}
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
X-List-Received-Date: Thu, 11 Oct 2012 21:46:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise it will fail if these two directories are not the same.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/gtk-doc.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 59063b0..eaa1385 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -15,5 +15,5 @@ EXTRA_OECONF_append = "\
 "
 
 do_configure_prepend () {
-	gtkdocize
+	( cd ${S} && gtkdocize )
 }
-- 
1.7.10.4





