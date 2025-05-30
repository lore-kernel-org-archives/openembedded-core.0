Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097E0C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:52:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4492.1748605959831615745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d17ead=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UApOW1032370
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:52:39 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b16ge9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:52:38 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 04:52:15 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][master][walnascar][PATCH 1/1] screen: update 5.0.0 -> 5.0.1
Date: Fri, 30 May 2025 17:22:09 +0530
Message-ID: <20250530115209.2077098-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: QcsR71oii-evuK8UStroCtLYNRxSBmxx
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=68399c06 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=_gujzhlsYxkA:10 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=se9NS7BXRa2lIVGdoFwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QcsR71oii-evuK8UStroCtLYNRxSBmxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEwMyBTYWx0ZWRfX051jZnbja+22 PmI55x0vTEGhRk39swS2yADiqt/Uy2ccw6w7vGVw49y58kLcLGaFKRUwwsVj5kGL2ci3kWmXI2p /k/cpIK+8+Nv1kIQeiNB9LAjRUrZ6v1qCKxTyJydbidNoGDOnISmZlN3Dpaq2N9SO3wq5ZpbS62
 S9aAuTa3ek/a/SZAZd/Iw3T9VLWMYZ4H6cpF4OlWC/7DFn7Uj0/tkZz1/8/dMYyrORMyLMTOiBc bdGcW9LWAEc6cNVX/UCLZSnGLNanuQK6LJKcrDQ9sigpVHi9493+Qd6SPSkuykpgGBLRR9GxuZk ZJ35yRF4EX60QISPAqVmFccPV7kPexuBWNGzmtpIEcLQQlYYPPQ4k1nS15ClS5m11stpe7q6h9X
 OKVB75kBeEb4pq9syfQXa9K7/3lb0CdBUEbNosdOC7An26tPbTLj6hdGNKuxDK4RqeOh0OGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217502

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-46805, CVE-2025-46804,
CVE-2025-46803, CVE-2025-46802 and CVE-2025-23395.

Changelog:
=========
https://cgit.git.savannah.gnu.org/cgit/screen.git/tree/src/ChangeLog?h=v.5.0.1

* Fixes:
	- CVE-2025-46805: do NOT send signals with root privileges
	- CVE-2025-46804: avoid file existence test information leaks
	- CVE-2025-46803: apply safe PTY default mode of 0620
	- CVE-2025-46802: prevent temporary 0666 mode on PTYs in attacher
	- CVE-2025-23395: reintroduce lf_secreopen() for logfile
	- buffer overflow due bad strncpy()
	- uninitialized variables warnings
	- typos
	- combining char handling that could lead to a segfault

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../screen/{screen_5.0.0.bb => screen_5.0.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.0.bb => screen_5.0.1.bb} (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.0.bb b/meta/recipes-extended/screen/screen_5.0.1.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.0.bb
rename to meta/recipes-extended/screen/screen_5.0.1.bb
index fec5663fc2..69f4098519 100644
--- a/meta/recipes-extended/screen/screen_5.0.0.bb
+++ b/meta/recipes-extended/screen/screen_5.0.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            "
 
-SRC_URI[sha256sum] = "f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971"
+SRC_URI[sha256sum] = "2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d"
 
 inherit autotools-brokensep texinfo
 
-- 
2.40.0


