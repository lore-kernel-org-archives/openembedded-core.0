Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TStTX-0004yO-0j
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:50:13 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TStGQ-0000qb-SM
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:36:38 +0100
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2012 17:36:37 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351532198.13864.18.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] polkit: remove license.html from LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 29 Oct 2012 17:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a generated file and gets removed by "make clean" which then
causes subsequent rebuilds to fail.  Also, the content in this file
is taken verbatim from COPYING (which is already in LIC_FILES_CHKSUM)
so checking it for a second time doesn't accomplish much.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 52e6618..67c375a 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "The polkit package is an application-level toolkit for defining a
 HOMEPAGE = "http://code.google.com/p/polkit/"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
-                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4 \
-                    file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
+                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
 
 DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
 
-- 
1.7.10.4





