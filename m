Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82B2B73259
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:19:12 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1BFJDlS019539 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 09:19:13 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021109191328-894662 ;
	Thu, 11 Feb 2016 09:19:13 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 17:18:56 +0200
Message-Id: <1455203936-28150-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/11/2016 09:19:13 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/11/2016 09:19:13 AM,
	Serialize complete at 02/11/2016 09:19:13 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-11_06:, , signatures=0
Subject: [PATCH 1/1] tune-cortexa9.inc: add vfpv3 tunes
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
X-List-Received-Date: Thu, 11 Feb 2016 15:19:13 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Define tunnings to enable 32 register VFPv3 for cortexa9 processor cores

More details: http://www.arm.com/products/processors/technologies/vector-floating-point.php

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/conf/machine/include/tune-cortexa9.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 965f2d9..3d8dc1d 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -34,3 +34,18 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-ar
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp cortexa9t2hf-neon"
+
+# VFPv3 Tunes
+AVAILTUNES += "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3 cortexa9thf-vfpv3"
+ARMPKGARCH_tune-cortexa9-vfpv3          = "cortexa9"
+ARMPKGARCH_tune-cortexa9t-vfpv3         = "cortexa9"
+ARMPKGARCH_tune-cortexa9hf-vfpv3        = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf-vfpv3       = "cortexa9"
+TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-armv7a-vfpv3}          cortexa9"
+TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-armv7at-vfpv3}         cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-armv7ahf-vfpv3}        cortexa9"
+TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-armv7athf-vfpv3}       cortexa9"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3}  cortexa9-vfp cortexa9-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cortexa9t2-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3}  cortexa9hf-vfp cortexa9hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9t2hf-vfp cortexa9t2hf-vfpv3"
-- 
2.7.0


