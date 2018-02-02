Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B59E78860
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 04:39:43 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f4so29399960qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 20:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bT+AIBeAZegEf1guikFTkqdnzO9F8Ma603Dx9U70x/U=;
	b=miPioWi6DmJal5RX0Zmye9qYw79pHXzkK3OxB0oJQpmoSbEXNw9E+HAwEA/pKtTv/2
	HVw/rzDl6NuFwZ1ajLl+vMFBECiR/2dqcyROI5GGNXmtbQy1p8r6EFLPb7tOgA3NhVm7
	cWRYhyJaDswVCWREux/X9Sop9sTXhA6+QMOFmsMQUjV6UjJl2UqtchrfgqR70JS7HCnE
	agJTRxfhWZHOrTMclMg/LJzlOfaCaGv5Deak3OYz+8o9p2uDYHyTUKXlIQ4eCqgSiHXW
	qR3MLKUwbiqvMHMLe/J2e2pafRXVoTdGR81nWXsg0RVHd2l18tPElcCQtGrE6L75kswu
	f60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bT+AIBeAZegEf1guikFTkqdnzO9F8Ma603Dx9U70x/U=;
	b=S7fuwcciY4QbWR2/HwhLJtLJzMLOA6RsNWnKlmYe9AG2es+DjCOqAaRHoMCTrhSYS2
	GtldGpO0f1vdQtnOkvkUJDrcv5MI3B6z5w6pwy7409pHNLx30wz/Vbp+r8t1ITpaElYd
	QDz0KRvJUFQzuhQ/nP5H5ikdtJTMj9wzyBLk88yrGcTlhESrwTqOxEoCUD6HjvqQXSEV
	aZy46AaJ4FbQ8gaLqLs7SuDbUzqf+ICUsXgXyXsVuUCw9KE7TQtN3BymAHa/hzac9TGg
	ANWyZLLFdoauHMkxocL5mNw+t9+rqydZp+dEFOOz2nxZ/aq10hqy97BsZ/PpnUICTWf9
	QfKg==
X-Gm-Message-State: APf1xPBn87S323/3pt/0b+BBO9v43mqx+njSaMChDlIl5Nd+BmLPjcmH
	KNmW3junN3Vp+LZGWZ6ieYiNu2sv0w==
X-Google-Smtp-Source: AH8x224aEKFNsPyTZskxhzKBYTzGUCkI4TqYMQJGScMcn6wKZdfNIBfoKFb1jC8/pjbvhZBxZmdlqw==
X-Received: by 10.200.17.144 with SMTP id d16mr5267643qtj.339.1517546384855;
	Thu, 01 Feb 2018 20:39:44 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id
	q128sm822770qkb.48.2018.02.01.20.39.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Feb 2018 20:39:43 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Feb 2018 02:27:30 -0200
Message-Id: <1517545650-29892-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] grub-efi: add configfile as default built-in
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
X-List-Received-Date: Fri, 02 Feb 2018 04:39:44 -0000

The module configfile allows loading a custom grub configuration file
from block devices, which can be used to customize the default grub
menu when creating images with wic (via configfile argument).

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index a72b189..d5aa64c 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -54,7 +54,7 @@ do_install_class-target() {
 }
 
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
-                 efi_gop iso9660 search loadenv test"
+                 efi_gop iso9660 configfile search loadenv test"
 
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
-- 
2.7.4


