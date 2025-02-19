Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1EAC021AF
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 05:43:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15948.1739943777781907023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 21:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5gvdO027882;
	Tue, 18 Feb 2025 21:42:57 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k8jqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:42:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 21:42:56 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Feb 2025 21:42:56 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxml2: upgrade 2.13.5 -> 2.13.6
Date: Wed, 19 Feb 2025 13:42:55 +0800
Message-ID: <20250219054255.1290814-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b56f61 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=_vTAUrJiXwrBIAUweg8A:9 a=m9p5bXcFLgAA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BRg4zggaFwoWi8C3k8hNq8wgO4AjA0PU
X-Proofpoint-GUID: BRg4zggaFwoWi8C3k8hNq8wgO4AjA0PU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 05:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211663

https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.6

Release notes
Security

    [CVE-2025-24928] Fix stack-buffer-overflow in xmlSnprintfElements
    [CVE-2024-56171] Fix use-after-free after xmlSchemaItemListAdd
    pattern: Fix compilation of explicit child axis

Regressions

    xmllint: Support compressed input from stdin
    uri: Fix handling of Windows drive letters
    reader: Fix return value of xmlTextReaderReadString again
    SAX2: Fix xmlSAX2ResolveEntity if systemId is NULL

Portability

    dict: Handle ENOSYS from getentropy gracefully
    Fix compilation with uclibc (Dario Binacchi)
    python: Declare init func with PyMODINIT_FUNC
    tests: Fix sanitizer version check on old Apple clang
    cmake: Work around broken sys/random.h in old macOS SDKs

Build

    autotools: Set AC_CONFIG_AUX_DIR
    cmake: Always build Python module as shared library
    cmake: add missing Bcrypt link on Windows (Saleem Abdulrasool)
    cmake: Fix compatibility in package version file

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/{libxml2_2.13.5.bb => libxml2_2.13.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.5.bb => libxml2_2.13.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.13.5.bb b/meta/recipes-core/libxml/libxml2_2.13.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.5.bb
rename to meta/recipes-core/libxml/libxml2_2.13.6.bb
index 6fbdec30ca..3b3ca87e96 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.6.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "74fc163217a3964257d3be39af943e08861263c4231f9ef5b496b6f6d4c7b2b6"
+SRC_URI[archive.sha256sum] = "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


