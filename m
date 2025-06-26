Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAC5C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:48:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5232.1750934920632246630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8272a39b43=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q4wkoK018730
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:48:39 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2nfu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:48:39 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 03:48:34 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/2] libarchive: correct upstream version check
Date: Thu, 26 Jun 2025 16:18:13 +0530
Message-ID: <20250626104814.3113263-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MCBTYWx0ZWRfXxBjTwA5UgQCF XZ5dTFQOOSzT07dc+lrhK938xUJkHROpOylVZZ0NdFbFNi9VaAbMbiL8wvFq7cw3pgIEIfmlhrk hpxOv46X08zItf/hxmN8rJtGaG5VFJsjUUWf19/RPL2c7CgpA0/NuLCJaIK+9MwhQrAxHlk/QAt
 oAYtGphscX9VjIfGNDWxh7D5gqhBmUGlXaWJOblDotnAqaE9h0S4XTT4lyyFWojIUWhf/FFxduM 9kqDFSOHyR6FFys/gQeq+LSMlt7DMEcd4B0RhvIFs8IUep41nSP9hkhDkqCDlgD/J3mnqZe3iQ+ ZtrbFeNHXvyCv7CkmCBaoYvp3uRQrAPYTu3Ki+wnaqQ/VHY4dzuZZW8ZxVAMmP7W7vpixQNqu2V
 3desqRUeq1KEMsRAm/vSdFyunlXJzrkoopRPAm9aRGIdkxs1tM3B/Wv2SnhhPgJrSfenCj50
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685d2587 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=3uWsZ661AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=NhjlrqSTRuRly-VyEDAA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FUXuAB54IZdVy669ssvNrybpkWLqziDQ
X-Proofpoint-GUID: FUXuAB54IZdVy669ssvNrybpkWLqziDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=735 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219347

From: Alexander Kanavin <alex@linutronix.de>

File index works now:
http://libarchive.org/downloads/

(From OE-Core rev: 11dfb88badcbb0daf3744eb3ab82bf9290ae5981)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 9d134f7d38..d70cdb3d83 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -31,8 +31,6 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-UPSTREAM_CHECK_URI = "http://libarchive.org/"
-
 SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
 
 inherit autotools update-alternatives pkgconfig
-- 
2.40.0


