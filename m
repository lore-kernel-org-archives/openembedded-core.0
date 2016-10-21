Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B001605C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 02:47:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9L2lqw9013493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 19:47:53 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Thu, 20 Oct 2016 19:47:52 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2016 19:47:52 -0700
Message-ID: <20161021024752.5565-1-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] binutils: enable warn system direcotories in cross-canadian ld
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
X-List-Received-Date: Fri, 21 Oct 2016 02:47:53 -0000
Content-Type: text/plain

Warn system directories requires a configuration option to be enabled.
This patch enables the warning for cross-canadian ld, to align with the
cross version.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index ae14642..b3d591e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -6,6 +6,7 @@ BPN = "binutils"
 
 DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
+                --enable-poison-system-directories \
                 "
 
 # We have to point binutils at a sysroot but we don't need to rebuild if this changes
-- 
2.9.3


