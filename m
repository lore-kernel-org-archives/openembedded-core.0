Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F11B16D330
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 15:16:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9OFH2ZB025540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 08:17:02 -0700 (PDT)
Received: from yow-kscherer-l1.wrs.com (128.224.147.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 24 Oct 2013 08:17:01 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Oct 2013 11:17:00 -0400
Message-ID: <1382627820-3165-2-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382627820-3165-1-git-send-email-konrad.scherer@windriver.com>
References: <1382627820-3165-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] cracklib: cracklib-native should not depend on zlib
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
X-List-Received-Date: Thu, 24 Oct 2013 15:17:00 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.0.bb b/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
index 34c2ff1..bbf88bb 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = "cracklib-native zlib"
-DEPENDS_class-native = "zlib"
+DEPENDS_class-native = "zlib-native"
 
 EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
-- 
1.8.1.2


