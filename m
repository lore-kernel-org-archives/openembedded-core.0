Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 922C86AC98
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 00:57:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s630vobX025162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 17:57:50 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 2 Jul 2014 17:57:50 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:57:42 -0500
Message-ID: <ae065aa47bb0019cb28db71ec833cbe1a2cb2464.1404348351.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404348351.git.mark.hatle@windriver.com>
References: <cover.1404348351.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [v2 PATCH 2/7] db_5.3.*: Upgrade to 5.3.28
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
X-List-Received-Date: Thu, 03 Jul 2014 00:57:52 -0000
Content-Type: text/plain

Simple upgrade, the license checksum change is related to a copyright date
change.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/db/{db_5.3.21.bb => db_5.3.28.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/db/{db_5.3.21.bb => db_5.3.28.bb} (94%)

diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.28.bb
similarity index 94%
rename from meta/recipes-support/db/db_5.3.21.bb
rename to meta/recipes-support/db/db_5.3.28.bb
index caf6890..057c9d8 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -20,10 +20,10 @@ SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://fix-parallel-build.patch \
            "
 
-SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
-SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
+SRC_URI[md5sum] = "b99454564d5b4479750567031d66fe24"
+SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=32aefa5a8e7318be1f657432cbe2e768"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
 
 inherit autotools
 
-- 
1.9.3


