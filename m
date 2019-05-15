Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00BA76B96C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 03:17:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4F3Hxp0017299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 May 2019 20:17:59 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 14 May 2019 20:17:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 15 May 2019 11:17:56 +0800
Message-ID: <1557890276-2264-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] grub/grub-efi: fix unrecognized command line option '-pipe-Wno-error' in CFLAGS
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
X-List-Received-Date: Wed, 15 May 2019 03:18:00 -0000
Content-Type: text/plain

Since commit [330fc83 grub: Use -Wno-error instead of doing this
on a per-warning basis] applied in oe-core, it missed a space
in append.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7d8c280..bac2d7d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,7 +60,7 @@ BUILD_CFLAGS = ""
 BUILD_CXXFLAGS = ""
 BUILD_LDFLAGS = ""
 
-CFLAGS_append = "-Wno-error"
+CFLAGS_append = " -Wno-error"
 
 do_configure_prepend() {
 	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
-- 
2.7.4


