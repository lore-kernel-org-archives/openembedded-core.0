Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5416D8AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:43:48 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1VgEFW-0007NY-Cc
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Nov 2013 14:43:49 +0100
Message-ID: <1384263801.16718.168.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 13:43:21 +0000
X-Mailer: Evolution 3.4.4-4+b1 
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
	Content preview: do_configure() in binutils.inc includes an explicit
	call to
	gnu-configize so we need to make sure that gnu-config-native is
	present.
	Previously this was being dragged in with the rest of the autotools
	stuff, 
	but commit 54a3e2ee37003fc56af0339f857b0b6442790c26 disabled that for
	binutils-cross
	on the grounds that "we don't autoreconf" the toolchain components. Fix
	this
	by adding gnu-config-native itself explicitly to DEPENDS. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] binutils: Add gnu-config-native to DEPENDS
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
X-List-Received-Date: Tue, 12 Nov 2013 13:43:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

do_configure() in binutils.inc includes an explicit call to
gnu-configize so we need to make sure that gnu-config-native is
present.  Previously this was being dragged in with the rest of the
autotools stuff, but commit 54a3e2ee37003fc56af0339f857b0b6442790c26
disabled that for binutils-cross on the grounds that "we don't 
autoreconf" the toolchain components.  Fix this by adding 
gnu-config-native itself explicitly to DEPENDS.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 4575774..17c66bc 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -11,7 +11,7 @@ BUGTRACKER = "http://sourceware.org/bugzilla/"
 SECTION = "devel"
 LICENSE = "GPLv3"
 
-DEPENDS = "flex-native bison-native zlib-native"
+DEPENDS = "flex-native bison-native zlib-native gnu-config-native"
 
 inherit autotools gettext multilib_header
 
-- 
1.8.4.rc3




