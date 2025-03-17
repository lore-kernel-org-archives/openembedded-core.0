Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD49C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 10:23:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.49002.1742206995343848196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 03:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=517106346d=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H80Cv0030305
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:23:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0t018-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:23:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 17 Mar 2025 03:23:13 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 17 Mar 2025 03:23:12 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] libpam: add ptest cases back
Date: Mon, 17 Mar 2025 18:22:55 +0800
Message-ID: <20250317102255.318925-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317102255.318925-1-kai.kang@windriver.com>
References: <20250317102255.318925-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: N1qvWzEQOma9_b93aARsN5cRfdx6H_J3
X-Proofpoint-GUID: N1qvWzEQOma9_b93aARsN5cRfdx6H_J3
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67d7f812 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=YCsg304685B99ycqEqUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=762 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503170076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213067

From: Kai Kang <kai.kang@windriver.com>

It removes the installation of ptest cases when upgrade libpam to 1.7.0.
Add them back to make ptest work. And 2 more cases in libpam 1.7.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index 1be3c9e2bb9..4abc52bd93b 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -142,6 +142,12 @@ do_install:append() {
 	fi
 }
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests
+    find ${B}/tests -maxdepth 1 -type f -exec cp {} ${D}${PTEST_PATH}/tests \;
+    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
+}
+
 pkg_postinst:${PN}() {
          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                  /etc/init.d/populate-volatile.sh update
-- 
2.34.1


