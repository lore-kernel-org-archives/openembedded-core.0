Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82BFCE7B09
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:08:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34258.1725628076350240798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 06:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9979a097e3=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4865ec4b004371
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Sep 2024 06:07:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41fhy2gvdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 06:07:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:07:54 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 06:07:53 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] expat: 2.6.2 -> 2.6.3
Date: Fri, 6 Sep 2024 13:07:51 +0000
Message-ID: <20240906130751.1512186-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=I5E3R8gg c=1 sm=1 tr=0 ts=66dafeab cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=ag1SF4gXAAAA:8 a=dmHQzXBwAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=hG7ARYT_sjMVYlF6uHcA:9
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=ZHTgszdjUGq-PTuYAr3K:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SbwkPM5NFr6r-h_WDPb-5mR4bJ4yhliN
X-Proofpoint-GUID: SbwkPM5NFr6r-h_WDPb-5mR4bJ4yhliN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_02,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=986 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409060096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204262

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2024-45490, CVE-2024-45491 and CVE-2024-45492.

https://blog.hartwork.org/posts/expat-2-6-3-released/

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.2.bb b/meta/recipes-core/expat/expat_2.6.3.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.2.bb
rename to meta/recipes-core/expat/expat_2.6.3.bb
index 6c9db91bef..5ae694a004 100644
--- a/meta/recipes-core/expat/expat_2.6.2.bb
+++ b/meta/recipes-core/expat/expat_2.6.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "9c7c1b5dcbc3c237c500a8fb1493e14d9582146dd9b42aa8d3ffb856a3b927e0"
+SRC_URI[sha256sum] = "b8baef92f328eebcf731f4d18103951c61fa8c8ec21d5ff4202fb6f2198aeb2d"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.40.0


