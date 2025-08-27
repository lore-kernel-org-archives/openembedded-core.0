Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FCCC8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 05:18:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7972.1756271936711999968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 22:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ihC2LmI4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0334c62af5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57R4vTML3449704
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=T2OzDg8xbsZoA2jrkGVlKM85x0INxd73z63E7Br0p5U=; b=ihC2LmI4A/3j
	tyTqJKu0ZNyroiJmtvrCUhK4Fa3AIRktVDYjcIorSQMvNBGt6Ztvc3H95jyl0t9k
	C3LV3NyO8LqPur6rj3sVzcuCTDKeO79RkeDoGOa56Cs5Tf10LOVIO6Qu7UX+hpHb
	8AWxnhxsEauhOMhpeFm2u9oYI9JN2F1TE4LVu6IyJ0ICRnW8nsINpu4N0o6Z13to
	w9TmPilTbmPlPD+D1GrUtNhi4zEczdGuruBt5SromPK9nPWjdwH3nz0XJbhQ/+5b
	S3GS94TUf1MVSHDB5SwSOiPegxc1dhlsdvOkJWxjT2NtXIry8MWuDi5Wx+VZC7b2
	Mwy0o/fnsQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1c6w3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 22:18:54 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 26 Aug 2025 22:18:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] man-pages: 6.14 -> 6.15
Date: Wed, 27 Aug 2025 13:18:51 +0800
Message-ID: <20250827051852.3900650-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827051852.3900650-1-hongxu.jia@windriver.com>
References: <20250827051852.3900650-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: m1_Ww6l44MMJZ6c7fBdkS53TYZGkd9ZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDA0MSBTYWx0ZWRfX5KNT+R3KBxjY
 f/unGm4T6hVoM5XoIJqkrS6Lw9w1FL9CD5icoKn9EFqJ8Ujscq+345RgrpkDnpiVZT/B73NGKFS
 TfqUqBlDuAHt6QoX93b+NOE0y+ZrriM19AFxq0PaTu660Wp8p9tip3y9me77TDor9TySEMcPyqW
 wylUQcgHpev4E03orCfcfuryHvfejIHFFjrSy9vzohwiI3S4ZXykjVQ9Z3yX+ZXCF96aSfWLQGs
 KP1pyuKO0n49PVicfVIs/X5RbzhZzAjrtSUWx+sl1vxtmGCBYWT8vHonCDaLkWfgKVbOf5FsVF6
 0Rq17Bzoz2WdEs/Kd6q1G/hbj1rXFs/dShZCymxsl6Nf45iQr9Q4P3MVuCqkJw=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ae953f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=vj_J6YrToZJJJULNLwsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: m1_Ww6l44MMJZ6c7fBdkS53TYZGkd9ZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222493

License-Update: No change, `README: Files: Update man/ path'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_6.14.bb => man-pages_6.15.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.14.bb => man-pages_6.15.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.14.bb b/meta/recipes-extended/man-pages/man-pages_6.15.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.14.bb
rename to meta/recipes-extended/man-pages/man-pages_6.15.bb
index 92afff640d2..f01867d0f98 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.14.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.15.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
+LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
                     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
                     file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "a298963d8baf37fa5ecd2b07c803e1f29ab0476add405a7e263e5c63baf43588"
+SRC_URI[sha256sum] = "f0ede747b98732cb6d5bd36e9ab54101ea7ae5f78a8b8d7289ced01c1a6ec937"
 
 inherit manpages lib_package
 
-- 
2.34.1


