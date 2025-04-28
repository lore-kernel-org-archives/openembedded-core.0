Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4ABC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 05:57:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41534.1745819842490548578
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 22:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139c79da=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4FL9g008429;
	Mon, 28 Apr 2025 05:57:21 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1agsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Apr 2025 05:57:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 27 Apr 2025 22:57:19 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 27 Apr 2025 22:57:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>,
        <hongxu.jia@windriver.com>
Subject: [PATCH v3] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM
Date: Mon, 28 Apr 2025 13:57:17 +0800
Message-ID: <20250428055717.2358310-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f18c1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=wECf3xPYAAAA:8 a=t7CeM3EgAAAA:8 a=fLV_1MGVFYYG-aurbFYA:9 a=ccNonjl4-tybilS9-zgM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gJodQHpErzIvwAi3v5Vho_viDJ9f7BTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA0OCBTYWx0ZWRfXxr8byo60xJeH t/ztncyGFpMHq5LCbpwQW8T2u9vb1TYNfo8F3wsKRTzn9o1BnkAs7DLuEcQPF6UzdbnfVODriXt SsU2diDdbk2UPnc42ubkIdeLyGxYCf47hp22Vk88ErxzX4d65EsuYs4qGeJoCokZSEMrG0ku34x
 NXKBfASlxDr8HKaKNC1jhMAYeZzLh9Hww/qdLD9RrUKtWlzKHiFnl35HlbSTjIZNWCv5BvLqV03 7HMVPFcQo1u9i9BgmY3IeDU+wLi7Zy8rgJs9ZvS0Giabk8cYsk9O76ANiscMtlDBqod9+dgn6Hi oERf1fdDYcdnbRR+tvmxt1ZqVCCj+my9YwUy4QeJx0DhjLAbfxRoWutbUz8Rky3y4jYGbYqTAOS
 2+5apumzdbhOlxZn7KpU1+wHDKE2ZZeX1kjgHZI35pcDqKrMusWgSUjpVm7PB9M6wovd8VT9
X-Proofpoint-GUID: gJodQHpErzIvwAi3v5Vho_viDJ9f7BTb
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215576

Define var-SPDX_PACKAGE_URL to provide software_packageUrl field [1][2]
in SPDX 3.0 SBOM, support to override with package name
SPDX_PACKAGE_URL:<pkgname>

Currently, the format of purl is not defined in Yocto, set empty for now
until we have a comprehensive plan for what Yocto purls look like.
But users could customize their own purl by setting var-SPDX_PACKAGE_URL

[1] https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Properties/packageUrl/
[2] https://spdx.github.io/spdx-spec/v3.0.1/annexes/pkg-url-specification/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx-3.0.bbclass | 5 +++++
 meta/lib/oe/spdx30_tasks.py          | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 044517d9f72..c0a5436ad68 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -117,6 +117,11 @@ SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
 
+SPDX_PACKAGE_URL ??= ""
+SPDX_PACKAGE_URL[doc] = "Provides a place for the SPDX data creator to record \
+the package URL string (in accordance with the Package URL specification) for \
+a software Package."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ba965821f86..61d7ba45e3e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -631,6 +631,14 @@ def create_spdx(d):
             set_var_field("SUMMARY", spdx_package, "summary", package=package)
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
+            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SPDX_PACKAGE_URL"):
+                set_var_field(
+                    "SPDX_PACKAGE_URL",
+                    spdx_package,
+                    "software_packageUrl",
+                    package=package
+                )
+
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
                 oe.spdx30.RelationshipType.hasOutput,
-- 
2.34.1


