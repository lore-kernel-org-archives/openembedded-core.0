Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBB8A739C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:18:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5I2N2025155
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:18:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 22:18:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 13:17:55 +0800
Message-ID: <0d5b7204a5f233bfd196f8e228b0cf2d9de7247f.1426742194.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426742194.git.Qi.Chen@windriver.com>
References: <cover.1426742194.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 5/5] glibc-collateral.inc: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 19 Mar 2015 05:18:01 -0000
Content-Type: text/plain

Add LIC_FILES_CHKSUM to avoid warnings like below at rootfs time.

    WARNING: The license listed GPLv2 was not in the licenses collected for glibc-locale

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index dfcebae..e7258b9 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -1,5 +1,7 @@
 INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 
 # This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
-- 
1.9.1


