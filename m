Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.5354.1588246953872442289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 04:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03UBg0hR018342
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 04:42:22 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 30 Apr 2020 04:42:10 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pbzip2: Fix license warning
Date: Thu, 30 Apr 2020 19:42:09 +0800
Message-ID: <1588246929-345428-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After below commit introduced, the LICENSE
field changed from BSD-4-Clause to bzip-1.0.6.
669600ef9b bzip2/pbzip2: Correct license information

But actually it should be bzip2-1.0.6,
update it to fix the below license warning:
WARNING: pbzip2-native-1.1.13-r0 do_populate_lic: pbzip2-native: No generic license file exists for: bzip-1.0.6 in any provider

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index d7450c7..e321cd2 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
 HOMEPAGE = "http://compression.ca/pbzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip-1.0.6"
+LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 
 DEPENDS = "bzip2"
-- 
2.7.4

