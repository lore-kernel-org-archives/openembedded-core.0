Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4A3678514
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:10:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA92AqL3027100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Nov 2017 18:10:52 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 8 Nov 2017 18:10:51 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Nov 2017 10:12:12 +0800
Message-ID: <147767da6ce8db0c0c796bc9f7e6e74f8fad81c1.1510193452.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510193452.git.Qi.Chen@windriver.com>
References: <cover.1510193452.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] sysstat: upgrade to 11.6.1
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
X-List-Received-Date: Thu, 09 Nov 2017 02:10:51 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.5.7.bb => sysstat_11.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.7.bb => sysstat_11.6.1.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.5.7.bb b/meta/recipes-extended/sysstat/sysstat_11.6.1.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.5.7.bb
rename to meta/recipes-extended/sysstat/sysstat_11.6.1.bb
index 72af931..4efd2a1 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.5.7.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.6.1.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "8f4a5d0de29f1056153e25e7a9c518d2"
-SRC_URI[sha256sum] = "4a38efaa0ca85ee5484d046bd427012979264fef17f07fd7855860e592819482"
+SRC_URI[md5sum] = "33cff6260b9c8f0b908fe94ce7ab2773"
+SRC_URI[sha256sum] = "4b2a2cfa8c8fe6ae0155e168ed9a7066caebc3ecb903b0e64a9ede28ecb68fcb"
-- 
1.9.1


