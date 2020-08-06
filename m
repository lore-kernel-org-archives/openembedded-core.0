Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2237.1596702406751185485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 01:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0768QjXn007109
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Aug 2020 01:26:46 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 6 Aug 2020 01:26:26 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] grub: set CVE_PRODUCT to grub2
Date: Thu, 6 Aug 2020 16:26:25 +0800
Message-ID: <20200806082625.3893-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

grub and grub-efi recipes' CVE_PRODUCT should be grub2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2024e13782..628ca64926 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -11,6 +11,8 @@ SECTION = "bootloaders"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+CVE_PRODUCT = "grub2"
+
 SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.17.1

