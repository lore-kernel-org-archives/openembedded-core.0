Return-Path: <Haitao.Mi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D60BC369D3
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 06:10:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2422.1745388599194494300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 23:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6208e84c0a=haitao.mi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N5e3jV001309;
	Tue, 22 Apr 2025 23:09:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jharcap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Apr 2025 23:09:54 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 22 Apr 2025 23:09:53 -0700
Received: from pek-lpd-ccm4.wrs.com (147.11.1.11) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 22 Apr 2025 23:09:52 -0700
From: Haitao Mi <haitao.mi@windriver.com>
To: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, <Haitao.Mi@windriver.com>
Subject: [PATCH v2] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM.
Date: Wed, 23 Apr 2025 14:09:51 +0800
Message-ID: <20250423060951.1692070-1-haitao.mi@windriver.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <D99MUROJP27W.R1R8AFSIJZW9@bootlin.com>
References: <D99MUROJP27W.R1R8AFSIJZW9@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zqZlSTIpd18nx6ZqnXmy8h9rRpFED13C
X-Proofpoint-ORIG-GUID: zqZlSTIpd18nx6ZqnXmy8h9rRpFED13C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzOSBTYWx0ZWRfXzy8LhiftcbOx QG9a1WDiU5UM7Agb7om2KX87wyO0mYju6Duwg/z1vMk9PbXbaK1SD9LbsKspHL4nEandGVAv7m4 TbiB9TFMH5tvO+rRd2KJhmUEjfA7nBpCpQXchbqGXdKH0exTl3jFH0feZy/LuxV2n9/ZFPXfftW
 /VIF7qSNCgYlevrjFvbq1MrjAQXHpqTKikry6mLu6hwssLY693vFzxTpbpO/2/f+NbUsawCmSn0 hEKuq6prKCC67BEZk0XSl1M8ahFsdubCDoNao15tD7GAWpH87/wtSYgy2cDjr2/Iv3YsdqGwTuv oxT83cCQSwzvsQUFxVxHR/RdCkWHl2vwBkBOJs36zE5Cad1uanwZ9/rmftHqYPO5aAc/I5p4BXe
 7eplaD/z+IGOnUZPLG3q/r4/Dr70hAj1fh9UhLb8RbkbWZX6hFMZOLE1E74hfjb4ApU2n4HN
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=68088432 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=8PLvU82cITkvvn23-DMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 mlxlogscore=803 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215262

A purl is composed with these fields:
scheme:type/namespace/name@version?qualifiers#subpath

Set 'namespace' field through SPDX_PURL_NAMESPACE variable, the default
value is ${DISTRO}.

Insert private project info into 'qualifiers' field through
PACKAGE_URL_QUALIFIERS_EXTEND variable, join the key=value format
with '&' symbol.

Set 'subpath' field through SPDX_PURL_SUBPATH variable, default is empty.

Signed-off-by: Haitao Mi <haitao.mi@windriver.com>
---
 meta/classes/create-spdx-3.0.bbclass |  9 +++++++++
 meta/lib/oe/spdx30_tasks.py          | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 044517d9f7..962e46e836 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -117,6 +117,14 @@ SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
 
+SPDX_PURL_NAMESPACE ??= "${DISTRO}"
+SPDX_PURL_NAMESPACE[doc] = "The value of the 'namespace' field in software_packageUrl"
+
+SPDX_PURL_QUALIFIERS_EXTEND[doc] = "The project private info can be inserted into \
+    the 'qualifiers' field of software_packageUrl through this variable."
+
+SPDX_PURL_SUBPATH[doc] = "The value of the 'subpath' field in software_packageUrl"
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
@@ -144,6 +152,7 @@ do_create_spdx[vardeps] += "\
     SPDX_NAMESPACE_PREFIX \
     SPDX_UUID_NAMESPACE \
     "
+oe.spdx30_tasks.create_spdx[vardepsexclude] += " MACHINE "
 
 addtask do_create_spdx after \
     do_collect_spdx_deps \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ba965821f8..310638277e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -631,6 +631,31 @@ def create_spdx(d):
             set_var_field("SUMMARY", spdx_package, "summary", package=package)
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
+            purl_qualifiers = "distro=%s-%s&arch=%s" % (d.getVar("DISTRO"), \
+                                                        d.getVar("DISTRO_VERSION"), \
+                                                        d.getVar("MACHINE"), \
+                                                        )
+            purl_qualifiers_extend = d.getVar("SPDX_PURL_QUALIFIERS_EXTEND")
+            if purl_qualifiers_extend:
+                purl_qualifiers += "&%s" % purl_qualifiers_extend
+
+            purl_type = d.getVar("IMAGE_PKGTYPE")
+            if purl_type == "ipk":
+                purl_type = "yocto"
+                purl_qualifiers = "file_extension=ipk&" + purl_qualifiers
+
+            purl_subpath = d.getVar("SPDX_PURL_SUBPATH")
+            purl_subpath = "#" + purl_subpath if purl_subpath else ""
+
+            purl = "pkg:%s/%s/%s@%s?%s%s" % (purl_type, \
+                                             d.getVar("SPDX_PURL_NAMESPACE"), \
+                                             pkg_name, \
+                                             d.getVar("EXTENDPKGV"), \
+                                             purl_qualifiers, \
+                                             purl_subpath \
+                                             )
+            setattr(spdx_package, "software_packageUrl", purl)
+
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
                 oe.spdx30.RelationshipType.hasOutput,

