Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BF2956028A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 11:16:11 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W1Dau-0006W5-2Q
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jan 2014 12:16:12 +0100
Message-ID: <1389266170.9182.122.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Jan 2014 11:16:10 +0000
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: Although libsoup did use to support direct usage of
	libproxy, it hasn't done so for some time. Worse,
	if libsoup depends on libproxy then
	it is impossible to build libproxy against webkit since webkit itself
	depends
	on libsoup in some configurations. Fix this by removing the extraneous
	entry from DEPENDS. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] libsoup: Remove libproxy from DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2014 11:16:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Although libsoup did use to support direct usage of libproxy, it hasn't
done so for some time.  Worse, if libsoup depends on libproxy then it
is impossible to build libproxy against webkit since webkit itself
depends on libsoup in some configurations.  Fix this by removing the
extraneous entry from DEPENDS.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
index a7ea106..b245f68 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native"
+DEPENDS = "glib-2.0 gnutls libxml2 sqlite3 intltool-native"
 
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
 # by default but let it be easily disabled.
-- 
1.8.5




