Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A77FC83F09
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 05:44:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1598.1752126237660463463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 22:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9286887760=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A5KDRc004197
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jul 2025 22:43:57 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn4rkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 22:43:57 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 9 Jul 2025 22:43:26 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 9 Jul 2025 22:43:25 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  1/1] openssl: upgrade 3.4.1 -> 3.4.2
Date: Thu, 10 Jul 2025 11:13:47 +0530
Message-ID: <20250710054347.3347260-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5QDFHQZ9SxXoMQRYsxKwTFWo1glVXD13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX9QvAeTCWhRo6 jjGG0C6ia7H9mCdanXRYx+FFI//aQnLOll55CTWPENVsgwsYenPuPVobGTIgFvGRBbv+fueSP0W W2xGws+Wkl0PzPipXq8G3NgeqNLhVJrTn/ySdAK4FCtjfLNYshnBwl59QIEqcoD58xOSKf6yn9i
 4gVkPjpmliKfAM6iaQiQH5LmAlc2/L0FuDvPLZbFo7ymvuuIeUqZOynxUi1wG+/NzljHbIESjt0 NLXyaDdt20IRTwyostF4u1QKcLxOJ9Q/+DPzH2TGOP9tus8YTWuO9a9syum4Sl+hdOqMUsuwAhh RE/VLkkwlPRVcKULeYkbxLDC/+XKipd9xfnrM6NWz50jXmfsXIufN87ZSH9aD/TXgatdX6kWHug V3bjy1uA
X-Proofpoint-ORIG-GUID: 5QDFHQZ9SxXoMQRYsxKwTFWo1glVXD13
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686f531d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=E6anlXapLMw7mTuY2RIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 05:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220112

From: Archana Polampalli <archana.polampalli@windriver.com>

https://github.com/openssl/openssl/blob/openssl-3.4.2/NEWS.md

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssl/{openssl_3.4.1.bb => openssl_3.4.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.1.bb => openssl_3.4.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/recipes-connectivity/openssl/openssl_3.4.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.4.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.4.2.bb
index 8da64aea6a..2998e37e75 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3"
+SRC_URI[sha256sum] = "17b02459fc28be415470cccaae7434f3496cac1306b86b52c83886580e82834c"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.40.0


