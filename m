Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8F260034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 23:36:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t68NaXXQ018557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 16:36:33 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Jul 2015 16:36:32 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 19:36:28 -0400
Message-ID: <1436398588-18230-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] i2c-tools: uprev to 3.1.2
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
X-List-Received-Date: Wed, 08 Jul 2015 23:36:38 -0000
Content-Type: text/plain

The only changes based on the CHANGES file are:
  decode-dimms: Fix DDR3 extended temp range refresh rate decoding
  py-smbus: Add support for python 3
The python3 changes use python3 as the default and 2 as the fallback.
py-smbus is not currently built so no python changes have been made.

The local copy of Module.mk is unchanged aside from moving it to
a directory that is not version specific to avoid uprev noise.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/i2c-tools/{i2c-tools-3.1.1 => files}/Module.mk  | 0
 .../i2c-tools/{i2c-tools_3.1.1.bb => i2c-tools_3.1.2.bb}              | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools-3.1.1 => files}/Module.mk (100%)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_3.1.1.bb => i2c-tools_3.1.2.bb} (87%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools-3.1.1/Module.mk b/meta/recipes-devtools/i2c-tools/files/Module.mk
similarity index 100%
rename from meta/recipes-devtools/i2c-tools/i2c-tools-3.1.1/Module.mk
rename to meta/recipes-devtools/i2c-tools/files/Module.mk
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
similarity index 87%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
index 71c98a4..92f4d69 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2 \
            file://Module.mk \
 "
-SRC_URI[md5sum] = "0fdbff53ebd0b8d9249256d6c56480b1"
-SRC_URI[sha256sum] = "14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700"
+SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
+SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441"
 
 inherit autotools-brokensep
 
-- 
1.9.1


