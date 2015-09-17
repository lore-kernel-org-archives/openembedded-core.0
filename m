Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E2B7277003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:41:19 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nH12g3tpDz3hj25;
	Thu, 17 Sep 2015 16:31:55 +0200 (CEST)
X-Auth-Info: lu7nuZpLLVx/o155SkzU8+JOwUJvLIHiNP17ItvNVz4=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nH12g1ylLzvdWt;
	Thu, 17 Sep 2015 16:31:55 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:31:51 +0200
Message-Id: <1442500317-9064-3-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442500317-9064-1-git-send-email-marex@denx.de>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 2/8] kernel-arch: Add nios2 to valid archs
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
X-List-Received-Date: Thu, 17 Sep 2015 14:41:20 -0000

Add nios2 target to valid arch list definition.

Based on previous work by Walter Goossens <waltergoossens@home.nl>
at https://github.com/wgoossens/meta-nios2 .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/classes/kernel-arch.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 211b72b..3ed5986 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -13,7 +13,8 @@ valid_archs = "alpha cris ia64 \
                sh sh64 um h8300   \
                parisc s390  v850 \
                avr32 blackfin \
-               microblaze"
+               microblaze \
+               nios2"
 
 def map_kernel_arch(a, d):
     import re
-- 
2.1.4


