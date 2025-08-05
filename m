Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0314C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 06:20:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15594.1754374808700544586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 23:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755kEL14174555
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Aug 2025 06:20:07 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4897vx2dqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 06:20:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 4 Aug 2025 23:20:06 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 4 Aug 2025 23:20:05 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] ca-certificates: correct the SRC_URI
Date: Tue, 5 Aug 2025 14:20:05 +0800
Message-ID: <20250805062005.254626-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UfJRSLSN c=1 sm=1 tr=0 ts=6891a297 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=GZ1lude119JsvsS-DVEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NCBTYWx0ZWRfX0SA6z+EuMu/N
 NkTM4YjbbfgUKT2rl+S9WRb+kVkqKsWSMLuGGtxFoT8TdPH3OOy/0WuA/5ajlLawdvbQ8XZZrlH
 YEWm2u3L+kwjjSQnsQG475RKKQjRWWE4U9pgbegnIxYgI6Q5aWIbkeNMv3iDl1gV9RptZukKmj5
 IF13taBh1uix6macMgPchu3KGjfJ0wBFaZq3Lrs3TtCGpSAV90omfcLc+fFcWrjGOK3ePLLVEt7
 TOcoY9Uaw8ZF+w6X/B7xfYblt54YbwfDjWgxlWN40y9pYiRVfBi78DOp4dFGdJaEbDw9Q+DXNWh
 /7AiV76SVv1XqIijSBAleUBZW9t4qqjjCi520QqQMZo4yWT4G1eBMF+5FFc4dkDHpQgSUBOvccU
 BRYSvENV
X-Proofpoint-ORIG-GUID: 20R-qbQ-eOOH2miCjRszJA6TvYC5WZXw
X-Proofpoint-GUID: 20R-qbQ-eOOH2miCjRszJA6TvYC5WZXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508010196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 06:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221452

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL is no longer valid, as it has been moved to an archive
location. This update points to the new location.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/ca-certificates/ca-certificates_20241223.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
index bbdc7dd68d..7977e3ae5c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
@@ -15,7 +15,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
-SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20241223T143500Z/pool/main/c/${BPN}/${BPN}_${PV}.tar.xz \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
-- 
2.34.1


