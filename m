Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDD1EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 23:20:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4024.1687908017717035028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 16:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hScGU6K4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55428ea07d=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35RMaipw019777
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:20:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gAyH3
	YZqVhGxSFDpMC+CW9QYMJehiZyW15+TP/Vh9Xg=; b=hScGU6K4O9w/cjJjrn0oW
	mmfI+GHd40grZNhxSOHbgBbBta7gvncEK3xnmVzD0dgSuaDlToWIviKEt/6BsePm
	0mVy/QA+lZYDvzd+eZqVd/rGvrwlGgQbtErOMMnWoNtcIUNGhoWsmOibTU2gjk+3
	M4p1gH6lpGnLQUuQ+sZHcvK1PimYYzRNG9Dtg2pfl0+aT3dS9PA8nLHC5wtSi1nn
	oR4sgoxyYBBPjZWNkMw388yOV8qH/VOjOunujWl+K/2cDneNyc8IUeUZATvNvemW
	DjkzJO3AZFR9jL8hRPLWyCUpbPWcYuKpt5yx5ggfsMojfzhcXtz35cyrB7SUKXnd
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb2h5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:20:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 16:20:15 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 16:20:15 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][oe-core][PATCH 1/1] libxml2: upgrade 2.10.3 -> 2.10.4
Date: Tue, 27 Jun 2023 16:20:15 -0700
Message-ID: <20230627232015.2718419-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: r4hoFP7JXRVadoj6lNUeWFV-4gQzYxv8
X-Proofpoint-ORIG-GUID: r4hoFP7JXRVadoj6lNUeWFV-4gQzYxv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=993 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 23:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183508

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Security

- [CVE-2023-29469] Hashing of empty dict strings isn't deterministic
- [CVE-2023-28484] Fix null deref in xmlSchemaFixupComplexType
- schemas: Fix null-pointer-deref in xmlSchemaCheckCOSSTDerivedOK

### Regressions

- SAX2: Ignore namespaces in HTML documents
- io: Fix "buffer full" error with certain buffer sizes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 9ddbbf2f86f046784c3baa58de5606a73e9e24f4)
---
 .../libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.3.bb b/meta/recipes-core/libxml/libxml2_2.10.4.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.10.3.bb
rename to meta/recipes-core/libxml/libxml2_2.10.4.bb
index 0ccd48964f..288631504c 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.4.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://libxml-m4-use-pkgconfig.patch \
            "
 
-SRC_URI[archive.sha256sum] = "5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c"
+SRC_URI[archive.sha256sum] = "ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.25.1


