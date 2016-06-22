Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 910 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jun 2016 16:23:21 UTC
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id D9BF7605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:23:21 +0000 (UTC)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
	with SMTPS id 1466611688584936.0629465230608;
	Wed, 22 Jun 2016 09:08:08 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 11:08:03 -0500
Message-Id: <1466611683-25298-1-git-send-email-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] linux-libc-headers: Update doc for recipe depends
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
X-List-Received-Date: Wed, 22 Jun 2016 16:23:22 -0000

The previous documentation has not been accurate since at least
commit 46cdaf1.  Recipes that follow the old documentation will
not correctly build when sstate is enabled because the kernel
source will not actually be available.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 2ba6ed5..92acf8a 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -18,9 +18,10 @@ LICENSE = "GPLv2"
 # But you have some kernel headers you need for some driver? That is fine
 # but get them from STAGING_KERNEL_DIR where the kernel installs itself.
 # This will make the package using them machine specific but this is much
-# better than having a machine specific C library. This does mean your 
-# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
-# makes total sense.
+# better than having a machine specific C library. This does mean your
+# recipe needs a
+#    do_configure[depends] += "virtual/kernel:do_shared_workdir"
+# but again, that is fine and makes total sense.
 #
 # There can also be a case where your kernel extremely old and you want
 # an older libc ABI for that old kernel. The headers installed by this
-- 
2.8.2



