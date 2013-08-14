Return-Path: <Yang.Shi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A68636B74C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:47:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EGkw94019402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2013 09:46:58 -0700 (PDT)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 14 Aug 2013 09:46:58 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 09:41:54 -0700
Message-ID: <1376498514-23057-2-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1376498514-23057-1-git-send-email-yang.shi@windriver.com>
References: <1376498514-23057-1-git-send-email-yang.shi@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH] Revert "hello-mod: Ensure the produced package name begins with kernel-module-"
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
X-List-Received-Date: Wed, 14 Aug 2013 16:47:37 -0000
Content-Type: text/plain

[YOCTO #4286]

The package runtime mapping rename issue is already fixed by
commit 0bc564af07c1bae8112f834a60aea3b72af7de13, the "kernel-module-" workaround
is not necessary anymore for out-of-tree module package, so revert that commit.

This reverts commit 71aafc214fe407b7620e747c11dfb8326c867b1c.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 621f700..64a6dda 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -13,11 +13,3 @@ SRC_URI = "file://Makefile \
           "
 
 S = "${WORKDIR}"
-
-# Kernel module packages MUST begin with 'kernel-module-', otherwise
-# multilib image generation can fail.
-#
-# The following line is only necessary if the recipe name does not begin
-# with kernel-module-.
-#
-PKG_${PN} = "kernel-module-${PN}"
-- 
1.7.5.4


