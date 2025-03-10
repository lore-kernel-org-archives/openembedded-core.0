Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467DEC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 07:12:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.31863.1741590756505321505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 00:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51640283d4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A6wR7k015788
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 00:12:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qhc6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 00:12:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Mar 2025 00:12:35 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Mar 2025 00:12:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] docbook-xml-dtd4: correct license name
Date: Mon, 10 Mar 2025 15:12:34 +0800
Message-ID: <20250310071234.2370628-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67ce90e3 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=xNf9USuDAAAA:8 a=mkMtH7XpAAAA:8 a=237vnFaWAAAA:8 a=t7CeM3EgAAAA:8 a=N3H5RjvU1fjBsXY7OnwA:9
 a=I9Slk6e--tAXHahELIuT:22 a=fmJdt-tbzUWq-ms2_4me:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Xd34Hqx2-9pZvyhMJ8-UGMO6tQXUSHxR
X-Proofpoint-ORIG-GUID: Xd34Hqx2-9pZvyhMJ8-UGMO6tQXUSHxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212490

- Use license in source file to instead local file LICENSE-OASIS

- Refer debian[1], rename license LICENSE-OASIS to DocBook

The content of license has no change

License-Update: rename license LICENSE-OASIS -> DocBook

[1] https://salsa.debian.org/debian/docbook-xml/-/blob/debian/master/debian/copyright?ref_type=heads#L28

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../common-licenses/DocBook}                     |  2 +-
 meta/files/common-licenses/OASIS                 | 13 -------------
 .../docbook-xml/docbook-xml-dtd4_4.5.bb          | 16 +++++++++-------
 3 files changed, 10 insertions(+), 21 deletions(-)
 rename meta/{recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS => files/common-licenses/DocBook} (92%)
 delete mode 100644 meta/files/common-licenses/OASIS

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS b/meta/files/common-licenses/DocBook
similarity index 92%
rename from meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
rename to meta/files/common-licenses/DocBook
index 6da7f5b8c74..822a0f07e40 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
+++ b/meta/files/common-licenses/DocBook
@@ -11,6 +11,6 @@ referencing additional sets of general entities and declaring
 additional notations, label your DTD as a variant of DocBook.  See
 the maintenance documentation for more information.
 
-Please direct all questions, bug reports, or suggestions for 
+Please direct all questions, bug reports, or suggestions for
 changes to the docbook@lists.oasis-open.org mailing list. For more
 information, see http://www.oasis-open.org/docbook/.
diff --git a/meta/files/common-licenses/OASIS b/meta/files/common-licenses/OASIS
deleted file mode 100644
index f93df7af270..00000000000
--- a/meta/files/common-licenses/OASIS
+++ /dev/null
@@ -1,13 +0,0 @@
-  Permission to use, copy, modify and distribute the DocBook DTD and
-  its accompanying documentation for any purpose and without fee is
-  hereby granted in perpetuity, provided that the above copyright
-  notice and this paragraph appear in all copies.  The copyright
-  holders make no representation about the suitability of the DTD for
-  any purpose.  It is provided "as is" without expressed or implied
-  warranty.
-
-  If you modify the DocBook DTD in any way, except for declaring and
-  referencing additional sets of general entities and declaring
-  additional notations, label your DTD as a variant of DocBook.  See
-  the maintenance documentation for more information.
-
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 5229a0366c2..d858d09630d 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -3,12 +3,14 @@ DESCRIPTION = "Document type definitions for verification of XML data \
 files against the DocBook rule set."
 HOMEPAGE = "https://docbook.org"
 
-# The upstream sources are not distributed with a license file.
-# LICENSE-OASIS is included as a "patch" to workaround this. When
-# upgrading this recipe, please verify whether this is still needed.
-
-LICENSE = "OASIS"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
+LICENSE = "DocBook"
+LIC_FILES_CHKSUM = "\
+    file://docbook-4.1.2/docbookx.dtd;beginline=12;endline=27;md5=21a24edab68530fae39dd512ba69840e \
+    file://docbook-4.2/docbookx.dtd;beginline=13;endline=28;md5=ab12da76ad94a41d04e1587693ebd9b6 \
+    file://docbook-4.3/docbookx.dtd;beginline=13;endline=28;md5=ab12da76ad94a41d04e1587693ebd9b6 \
+    file://docbook-4.4/docbookx.dtd;beginline=15;endline=30;md5=ab12da76ad94a41d04e1587693ebd9b6 \
+    file://docbook-4.5/docbookx.dtd;beginline=15;endline=30;md5=ab12da76ad94a41d04e1587693ebd9b6 \
+"
 
 # To support apps with xml schema backward compatibility, we must
 # install a set of schemas. Install the latest based on PV and then
@@ -31,7 +33,7 @@ SRC_URI = "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=do
            https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
            https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
            file://docbook-xml-update-catalog.xml.patch \
-           file://LICENSE-OASIS"
+           "
 
 SRC_URI[payload412.sha256sum] = "30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772"
 SRC_URI[payload42.sha256sum] = "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca40eeebe60fa2"
-- 
2.34.1


