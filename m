Return-Path: <gthomas@zeus.chez-thomas.org>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 44BF76B0F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 16:02:30 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3F392F81213; Wed, 30 Oct 2013 10:02:32 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	NO_DNS_FOR_FROM autolearn=no version=3.3.2
Received: from zeus (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D8330F81212;
	Wed, 30 Oct 2013 10:02:31 -0600 (MDT)
Received: by zeus (Postfix, from userid 996)
	id BCE70520C99; Wed, 30 Oct 2013 10:02:46 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 10:02:44 -0600
Message-Id: <1383148964-15526-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] core-image-basic.bb: Allow user extensions
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
X-List-Received-Date: Wed, 30 Oct 2013 16:02:32 -0000

Allow the user to provide additional packages to this image.
This lets core-image-basic behave like all other core-image*
recipes (which do support CORE_IMAGE_EXTRA_INSTALL), as well
as match the documentation which suggests this as the mode to
extend any core-image* image.

v2 - drop redundant setting of CORE_IMAGE_EXTRA_INSTALL

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-extended/images/core-image-basic.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index 091f57d..d599e72 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -6,6 +6,7 @@ IMAGE_FEATURES += "splash ssh-server-openssh"
 IMAGE_INSTALL = "\
     packagegroup-core-boot \
     packagegroup-core-basic \
+    ${CORE_IMAGE_EXTRA_INSTALL} \
     "
 
 inherit core-image
-- 
1.7.9.5


