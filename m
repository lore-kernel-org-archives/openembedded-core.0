Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B958677026
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:34:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u377YZpT019217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 00:34:35 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 00:34:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 00:34:31 -0700
Message-ID: <2890c867d4fbace298fb94690e4bd24f8694a180.1460014426.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460014426.git.liezhi.yang@windriver.com>
References: <cover.1460014426.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] bdwgc: installed-vs-shipped for nativesdk
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
X-List-Received-Date: Thu, 07 Apr 2016 07:34:35 -0000
Content-Type: text/plain

Fixed:
ERROR: nativesdk-bdwgc-7.4.2-r0 do_package: QA Issue: nativesdk-bdwgc: Files/directories were installed but not shipped in any package:
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share/gc
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share/gc/porting.html
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share/gc/gcinterface.html
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share/gc/gcdescr.html
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share/gc/README.solaris2

[snip]

This was caused by hardcode of datadir.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index efa4632..8d4dab3 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
            file://0002-Altera-NIOS2-support.patch \
           "
 
-FILES_${PN}-doc = "/usr/share"
+FILES_${PN}-doc = "${datadir}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


