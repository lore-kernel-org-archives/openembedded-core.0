Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4738C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 10:11:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6917.1751364669150006636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 03:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9277adc68a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614j2DQ009480
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 03:11:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4ar99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 03:11:08 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 03:11:07 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 1 Jul 2025 03:11:05 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][walnascar][PATCH  1/1] xwayland: upgrade 24.1.6 -> 24.1.8
Date: Tue, 1 Jul 2025 15:41:03 +0530
Message-ID: <20250701101103.1685191-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SykoSUJ7zgO0rBZ6jaRUHlYH1MA8Y2lH
X-Proofpoint-ORIG-GUID: SykoSUJ7zgO0rBZ6jaRUHlYH1MA8Y2lH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MSBTYWx0ZWRfX/IE5u6w/rzNo UZ/OCcnDgxeuPwXwYKwimkAVLJIwXtxQwKR5/j76BIZo2k4EcwtzBGbdEoztbS1xssYBCV1BOkd 2/VJO9oKs5SC+9X8Gi9XCyZiWhosJyKl8N1HXmTDsb7x1Sb0j+r7+i9WnQ8acOi/y190TiRdZwl
 XKogscQW4gG8oRypzxoz9ARsWp8M4h/HqDyOeSMIvf5m2qfA3UwfJTbrQATjdO/FZx+Od9jC2W7 O6K5wixkOybO33qmNFdKZM64UaFgExAZ4Ogvk1M4n3vlXpmiw3J7jg7u0SPj+ktJF6q0DkhjO39 LC56bKF4W3IXjKvwICslcb3V6J2Letw/daGO5Q2I+zqp7lobYnq7PDj0jUPs/HuGRhkCYdAY2Fv
 hZFSJxfqDIKMrp6XA1Cd9ekCBDLzAItQJY8J+68K0ELb2scRu1OEk5haQxWl8mcR5Dad6WfC
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=6863b43c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=_gujzhlsYxkA:10 a=Wb1JkmetP80A:10 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=Xde4170m0IR-YDjXq2YA:9 a=bUtnbScj8M4A:10
 a=v6M9_2kWc-sA:10 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 10:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219561

From: Archana Polampalli <archana.polampalli@windriver.com>

Includes security fix for:
CVE-2025-49175
CVE-2025-49176
CVE-2025-49177
CVE-2025-49178
CVE-2025-49179
CVE-2025-49180

https://lists.x.org/archives/xorg-announce/2025-June/003610.html
https://lists.x.org/archives/xorg-announce/2025-June/003613.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/{xwayland_24.1.6.bb => xwayland_24.1.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.6.bb => xwayland_24.1.8.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
index 540ec100bd..900da524b3 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
+SRC_URI[sha256sum] = "c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.40.0


