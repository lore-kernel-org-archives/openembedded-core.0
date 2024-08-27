Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1481BC5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 07:14:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.72015.1724742853852689266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 00:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8969404eb5=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R5CUA0005921
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 00:14:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417at32k1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 00:14:13 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 00:14:10 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] bind: Upgrade 9.18.24 -> 9.18.28
Date: Tue, 27 Aug 2024 07:13:51 +0000
Message-ID: <20240827071351.2937277-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=F4YFdbhN c=1 sm=1 tr=0 ts=66cd7cc5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=SCo1hh1FAAAA:8 a=BoHI8RPFQyIR6A6YvZkA:9 a=vu9zOgKeCDsA:10
 a=jjiDOD437DYA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=nwb-CePKZZm3gL-ai9HY:22
X-Proofpoint-GUID: R1Eoqz2Z4Jx7Sr6ZIVkAA7du3R-wIEyj
X-Proofpoint-ORIG-GUID: R1Eoqz2Z4Jx7Sr6ZIVkAA7du3R-wIEyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408270053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 07:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203815

From: Divya Chellam <divya.chellam@windriver.com>

Includes security fixes for CVE-2024-4076, CVE-2024-1737,
CVE-2024-0760, CVE-2024-1975 and other bug fixes

Release Notes:
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-28
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-27
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-26
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-25

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../bind/{bind_9.18.24.bb => bind_9.18.28.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.28.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.24.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.24.bb
rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
index fbbebe89ad..67628a8650 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


