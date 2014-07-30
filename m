Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4592708FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:54:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6U7sivs018119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 00:54:44 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 00:54:44 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 03:54:43 -0400
Message-ID: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] ghostscript: add missing dependencies on libgcrypt and libgpg-error
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
X-List-Received-Date: Wed, 30 Jul 2014 07:54:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix error:
tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.0/ld: cannot find -lgcrypt
tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.0/ld: cannot find -lgpg-error

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ghostscript/ghostscript_9.14.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
index e14e656..fbec6ce 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aad21ea85123608e6a0a58d54ee23567"
 
-DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
+DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libgcrypt libgpg-error"
 DEPENDS_class-native = ""
 
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz"
-- 
1.7.9.5


