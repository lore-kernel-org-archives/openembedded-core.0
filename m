Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C05226EAFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:51:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2014 14:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="492416804"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.227])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 14:51:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 14:51:01 -0800
Message-Id: <58ca43555b67d759394f768a65449d6d135cb112.1393973357.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
References: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
In-Reply-To: <cover.1393973357.git.sgw@linux.intel.com>
References: <cover.1393973357.git.sgw@linux.intel.com>
Subject: [PATCH 4/6] grub-efi: use autotools-brokensep
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
X-List-Received-Date: Tue, 04 Mar 2014 22:51:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index e02def3..8958b04 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -51,7 +51,7 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE", grubimage)
 }
 
-inherit autotools
+inherit autotools-brokensep
 inherit gettext
 inherit deploy
 
-- 
1.8.3.1


