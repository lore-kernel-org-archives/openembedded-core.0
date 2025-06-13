Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB75DC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 02:45:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.967.1749782724198550630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 19:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8259751d3b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D005Xd005333
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:45:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd96ady-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:45:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 19:45:21 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 19:45:20 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [walnascar][PATCH] python3-requests: upgrade 2.32.3 -> 2.32.4
Date: Fri, 13 Jun 2025 10:45:19 +0800
Message-ID: <20250613024519.3056340-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684b90c2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=8i0GZ58n1WKLIwykuTIA:9 a=a1s67YnXd6TbAZZNj1wK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyMCBTYWx0ZWRfX1rgOH4X4WBZy L3EgpRHDPpcW28sb9bOpYiqDJoVjiTjDRrMtm4mhw9UhV6C2FN4Jb7N/8DE3qCkay/hHysyrC6l WUwttBYpCAIfbomnFiaFzIVnkhk53gzXghTMPSGsFcPz5XRB0Uwzi2FI0HO12nLrU/fHD5/dtC/
 XRolZNXtH2k0jmq4s8RZmB/X2TlexcywT9gnlULThUBkhaXAw8NqWb3NzDN2BbBboqIvgTMUCs+ UPcLUxOPkfI4PUxCxMDFKdaXbuVWU84SkTcF6npKnaiy8GU2S8ha4v2cEwZQp2euoJQu3NZtqQG 1HfKbp1U7DEEqg4ztq30IwP4sZfdvV2yWWzSCFPBQLALRDWHvCyoL+AaSPGp6Dv/Rd3Yz5qRT3s
 XaJWoVEkNsYK6z6TtO1z6Pw1uwMXGxJvlUM0G1sXmH8m/ffmvQQxODpoy0jpDsiaaeKKtvAN
X-Proofpoint-ORIG-GUID: -YassH58Z-A9AysTEQVVQSiDoqiRpe5y
X-Proofpoint-GUID: -YassH58Z-A9AysTEQVVQSiDoqiRpe5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506130020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218551

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://requests.readthedocs.io/en/latest/community/updates/#release-history

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-requests_2.32.3.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.4.bb
index 4f0638b50c..0a015ab5d1 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
+SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


