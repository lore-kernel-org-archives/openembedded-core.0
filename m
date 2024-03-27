Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04FFC54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 17:16:20 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web11.1651.1711559777905314286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 10:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=AcpjvfpU;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1015; q=dns/txt; s=iport;
  t=1711559777; x=1712769377;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VDlTMf7xnwEtJh9SFaDnGKMhap0s9eT9tqC/9rtT4jU=;
  b=AcpjvfpUECUZR+Wk/RnYF6tBsfHHPjtjjq1cCeJfJPJYCmctCxvProF0
   ZBNPUsWAKHD7f/Ww3OvzjvUeS/YBcPpxM17cPB+0WR4oVCNxRAMFvkUy9
   sOiu1+bkCo2uvEQFKbuSRQdmjbqCjEzCfcXDkUAFCUyeTU4Il9kEVSoNa
   k=;
X-CSE-ConnectionGUID: 2MiN5WkxSE2LPNSKOTY+dA==
X-CSE-MsgGUID: kpWl8h/FTDyMaXkpEHQIcQ==
X-IPAS-Result: =?us-ascii?q?A0CMBgBBUgRm/5xdJa1agliCQHVWQUiUGo4VkheBJQNWD?=
 =?us-ascii?q?wEBAQ8xEwQBAY0NAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBBQEBBQEBAQIBB?=
 =?us-ascii?q?wWBChOFeocSARgBgX2DAAGCXwIBsE6CLIEBgyYBgVGuOoFqgUiMe4VfJxuBS?=
 =?us-ascii?q?USEB3aECoEGhXYEghKDN6AiSoEkA4EFaxsQHjcREBMNAwhuHQIxOgMFAwQyC?=
 =?us-ascii?q?hIMCx8FEkIDQwZICwMCGgUDAwSBLAULGgIQLCYDAxJJAhAUAzgDAwYDCjEuT?=
 =?us-ascii?q?0EMUANnHxkYCTwPDBoCGxQNJCMCLD4DCQoQAhYDHRYEMBEJCyYDKgY2AhIMB?=
 =?us-ascii?q?gYGXCAWCQQjAwgEA1ADIHARAwQaBAsHdoM9BBNEAxCBMooXgz+CIIERgydON?=
 =?us-ascii?q?AMJAwcFSUADCxgNSBEsNRQbBiIfbwejcAGCZoEOgUdiQMVuhB2MDJUdGjOqL?=
 =?us-ascii?q?5hipCCEY4FrCC2BWU0jFYMiCUkZD6gPQzUCOQIHCwEBAwmIboF6AQE?=
IronPort-Data: A9a23:UmtKjapwIv0WlzCTXizf38tGkm9eBmJQZBIvgKrLsJaIsI4StFCzt
 garIBmCOvjYajP3eIsnb42/o0kPuJKAxoM3TQQ4qyEzQiwa8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7wdOWn9T8kj/vgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYADNNwJcaDpOt/rY8kw35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rxSAEcTy
 v8IEx1XSiilvMGR/IP4RsA506zPLOGzVG8ekmtrwTecBvE8TNWeBa7L/tRfmjw3g6iiH96HO
 JFfMmUpPU+GOkARUrsUIMpWcOOAgXz2bzxFs1K9rqss6G+Vxwt0uFToGICOJIbSHpoNzi50o
 ErF51v9UhFdGuCz2B+MwnG0q8/2vCjCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIwa3O7kPEQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:9k9/3Klz0S0OL1zlwKANwY/1h2DpDfI/3DAbv31ZSRFFG/Fw8P
 re/8jzuiWatN98YhsdcLO7WJVoP0mzyXcd2+B4VotKNzOLhILHFuxfBPPZogEJ30bFh4tgPW
 AKSdkdNOHN
X-Talos-CUID: 9a23:qDEr/mwPbcXVaFMrkY6eBgVOP8EDL0Le3Ez9eWuAL11Kb4GkClO5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AoGAa/w1cAFD02umkD6pxjWNfxjUj4LyRDBAN1rs?=
 =?us-ascii?q?6l9ihPBxzIxq9tRW8e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,159,1708387200"; 
   d="scan'208";a="236203708"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 17:16:17 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTP id 42RHGGmA026294
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 17:16:17 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gmp: improve reproducibility
Date: Wed, 27 Mar 2024 17:16:16 +0000
Message-Id: <20240327171616.950846-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 17:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197565

nativesdk-gmp package contains host references in output packages.
remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
v2
 - move common code to separate function
---
---
 meta/recipes-support/gmp/gmp_6.3.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index 3dbcd68b5c..fd4aec92fd 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -29,13 +29,21 @@ do_install:append() {
 	oe_multilib_header gmp.h
 }
 
-do_install:prepend:class-target() {
+fix_absolute_paths () {
         sed -i \
         -e "s|--sysroot=${STAGING_DIR_HOST}||g" \
         -e "s|${DEBUG_PREFIX_MAP}||g" \
          ${B}/gmp.h
 }
 
+do_install:prepend:class-target() {
+    fix_absolute_paths
+}
+
+do_install:prepend:class-nativesdk() {
+    fix_absolute_paths
+}
+
 SSTATE_SCAN_FILES += "gmp.h"
 
 # Doesn't compile in MIPS16e mode due to use of hand-written
-- 
2.33.0


