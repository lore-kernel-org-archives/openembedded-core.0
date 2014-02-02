Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 570276EA4A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 12:35:02 +0000 (UTC)
Received: from [212.183.132.39] (helo=[192.168.42.139])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W9wGK-00027E-8D
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Feb 2014 13:35:03 +0100
Message-ID: <1391341073.3068.53.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Sun, 02 Feb 2014 11:37:53 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.8.5-2+b1 
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: Commit 5cab5935d6924e0aca5da4b682bb83e54f20bc1d added
	dependencies on docbook-utils-native and linuxdoc-tools-native,
	even though the same commit
	ostensibly disabled building of the documentation and there was no
	explanation
	of why these dependencies might be necessary. It appears that they
	don't
	serve any useful purpose so let's remove them again. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] base-passwd: Remove unnecessary DEPENDS
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
X-List-Received-Date: Sun, 02 Feb 2014 12:35:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit 5cab5935d6924e0aca5da4b682bb83e54f20bc1d added dependencies on
docbook-utils-native and linuxdoc-tools-native, even though the same
commit ostensibly disabled building of the documentation and there was
no explanation of why these dependencies might be necessary.  It appears
that they don't serve any useful purpose so let's remove them again.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-
index 082037a..8bd053a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -4,8 +4,6 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-DEPENDS = "docbook-utils-native linuxdoc-tools-native"
-
 SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
            file://add_shutdown.patch \
            file://nobash.patch \



