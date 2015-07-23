Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A83E3761C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 00:22:36 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9468DF811DC; Wed, 22 Jul 2015 18:22:36 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2C979F811DA;
	Wed, 22 Jul 2015 18:22:36 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 18:22:36 -0600
Message-Id: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Thu, 23 Jul 2015 00:22:38 -0000

This recipe needs python3.  This patch arranges to use the bitbake-built
version, not the host version (which may be missing or not work...)

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
index 9816257..0330a7b 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -16,7 +16,7 @@ PV = "1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig python3native
 
 DEPENDS = "util-macros virtual/egl"
 
-- 
1.9.1


