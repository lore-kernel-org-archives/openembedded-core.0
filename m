Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01588C25B7A
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 01:37:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18708.1716773828506193483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 18:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5877813c0a=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R1Ku9L003429
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 18:37:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybb909811-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 18:37:07 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:37:07 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:37:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] libgpg-error: upgrade 1.48 -> 1.49
Date: Mon, 27 May 2024 09:37:02 +0800
Message-ID: <20240527013705.2781009-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bMmUP1QRqByn7kJEvk-PxAOvfGz5W5Ht
X-Proofpoint-GUID: bMmUP1QRqByn7kJEvk-PxAOvfGz5W5Ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 01:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199890

From: Changqing Li <changqing.li@windriver.com>

Noteworthy changes in version 1.49 (2024-04-25) [C36/A36/R0]
-----------------------------------------------

 * Two new functions to improve the logging interface.  The
   gpgrt_logv_domain is currently the same as gpgrt_logv_prefix but
   allows to pass a domain string so that in future we will be able to
   select log output by domain.  It also provide a non yet functional
   feature to include a hex dump.

 * Add a "trunc" keyword to gpgrt_log_printhex.  [rE0a39fbefcb]

 * Avoid an endless loop in the argparser due to a conf file read
   error.  [rE2dc93cfecc]

 * Interface changes relative to the 1.48 release:
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 gpgrt_add_post_log_func        NEW.
 gpgrt_logv_domain              NEW.

 Release-info: https://dev.gnupg.org/T7012

[1] https://github.com/gpg/libgpg-error/blob/libgpg-error-1.49/NEWS

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libgpg-error/{libgpg-error_1.48.bb => libgpg-error_1.49.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.48.bb => libgpg-error_1.49.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
index 9f2b49209d..b7d41ab489 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f"
+SRC_URI[sha256sum] = "8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.25.1


