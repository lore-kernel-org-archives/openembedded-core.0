Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2297C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:08:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.61605.1742893679575810596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51792dbb80=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P7jBhZ021478
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 02:07:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkar21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 02:07:58 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 25 Mar 2025 02:07:56 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] libarchive: upgrade 3.7.7 -> 3.7.8
Date: Tue, 25 Mar 2025 09:07:33 +0000
Message-ID: <20250325090733.1137503-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e2726e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Vs1iUdzkB0EA:10 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=yMtZ7uqkIXQdOIziOvQA:9 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SAR8P0W62_JGkPRQFlbieAcm-hygKW99
X-Proofpoint-ORIG-GUID: SAR8P0W62_JGkPRQFlbieAcm-hygKW99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503250063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213596

From: Yogita Urade <yogita.urade@windriver.com>

This upgrade includes fix for CVE-2024-57970, CVE-2025-25724 and
CVE-2025-1632

Changelog:
==========
Libarchive 3.7.8 is a bugfix and security release

Security fixes:
tar reader: Handle truncation in the middle of a GNU long linkname (#2422, CVE-2024-57970)
unzip: fix null pointer dereference (#2532, CVE-2025-1632)
tar reader: fix unchecked return value in list_item_verbose() (#2532, CVE-2025-25724)

Important bugfixes:
7zip reader: add SPARC (#2399) and POWERPC (#2459) filter support for non-LZMA compressors
tar reader: Ignore ustar size when pax size is present (#2405)
tar writer: Fix bug when -s/a/b/ used more than once with b flag (#2435)
cpio: Fix a Y2038 bug on Windows (#2471)
libarchive: Handle ARCHIVE_FILTER_LZOP in archive_read_append_filter (#2519)
libarchive: Adding missing seeker function to archive_read_open_FILE() (#2539)

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libarchive/{libarchive_3.7.7.bb => libarchive_3.7.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.7.bb => libarchive_3.7.8.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.7.bb b/meta/recipes-extended/libarchive/libarchive_3.7.8.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.7.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.8.bb
index 0a0a6b374b..d78b38d3e9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.8.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "4cc540a3e9a1eebdefa1045d2e4184831100667e6d7d5b315bb1cbc951f8ddff"
+SRC_URI[sha256sum] = "a123d87b1bd8adb19e8c187da17ae2d957c7f9596e741b929e6b9ceefea5ad0f"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.40.0


