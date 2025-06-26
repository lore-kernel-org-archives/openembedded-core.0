Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3547C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:48:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5233.1750934921433786301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8272a39b43=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QAmQUH025712
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 03:48:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14wbep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 03:48:40 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 03:48:36 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 2/2] libarchive: upgrade 3.7.9 -> 3.8.1
Date: Thu, 26 Jun 2025 16:18:14 +0530
Message-ID: <20250626104814.3113263-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250626104814.3113263-1-divya.chellam@windriver.com>
References: <20250626104814.3113263-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: pQvOelyjJNyuse9XnPbkXl6IpsY2AlX0
X-Proofpoint-GUID: pQvOelyjJNyuse9XnPbkXl6IpsY2AlX0
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685d2588 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=AivZy-dr8VaupPB6Ye4A:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MCBTYWx0ZWRfX/ng86ZDGWrH/ MlEe9qJxOZYpsIb5wRa2kpUEpusA5hx/OFESC5PKk+3IaIqp1fzTz5j3jWU0x/4ju8WmMHA99ZL dBYDQgldBL8R1QqJeL3HVJuBoATV2pYypth+z5QVc4OD7iJrAFFw8DZjCBoKzV5pLh2G1HKb9R/
 xwJd9jvQR+dO/eBYpgUZZK8yiDOpfQU/FrXlWPUYieh+MaJihYIfgT+QxLLXGXc94UgLID6+9rG zSB2+JITdNucXoFlcavLx0xQxZIA7n+XyxFFQkfQL6YKRG+Q4FTfzyR525Vi+O+0NI4zh7Q8pte UJEJH5JjvsSkxiNcgAReCuI4l0GpuSJ5R+Lzl4NWOjO08HCymBn0iAeNqKiE9Jl0hKHL5nGloYY
 3cZxO5HNyEP5a6wa6Qs27B6FMFU2FtqacSThSQmpZVRzuisRU5tElWA74Hvo1BZQbXkbrOJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219348

From: Divya Chellam <divya.chellam@windriver.com>

Includes bugfixes for CVE-2025-5914, CVE-2025-5915, CVE-2025-5916, CVE-2025-5917
and CVE-2025-5918, which are introduced in version 3.8.0.

License-Update: Public Domain file changed from libarchive/archive_getdate.c
    to libarchive/archive_parse_date.c
    https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810

Changelog:
==========
https://github.com/libarchive/libarchive/releases/tag/v3.8.0
https://github.com/libarchive/libarchive/releases/tag/v3.8.1

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libarchive/{libarchive_3.7.9.bb => libarchive_3.8.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb => libarchive_3.8.1.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.1.bb
index d70cdb3d83..472b5820f0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ce08437ff7f5e24d72e666313ae4084"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -31,7 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
+SRC_URI[sha256sum] = "bde832a5e3344dc723cfe9cc37f8e54bde04565bfe6f136bc1bd31ab352e9fab"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.40.0


