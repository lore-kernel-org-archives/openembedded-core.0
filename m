Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BB3C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:29:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.84537.1754044156406791788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03082e52e8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5715gJ913157773
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Aug 2025 10:29:15 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xpdcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 10:29:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 1 Aug 2025 03:29:14 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 1 Aug 2025 03:29:13 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ovmf: Don't define bool type if building in C23 mode
Date: Fri, 1 Aug 2025 18:29:12 +0800
Message-ID: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3NyBTYWx0ZWRfX/3qNK6iDNZRb
 hh5BTGWEX0BGaKjtDiBaSQm5qKKA/P44xb8fOcVn9YiXPLTyT1UUWW2KoPUq7950tifRCR2HwW8
 90am1/HpSktf1WRiQm1mgFR37zRlshX6fH9ivfOAKcq/WH2/nP9ywHzJL5BATBaTq/rvMwS4Ga0
 TxMWW2HbrivxzjZRZZSjlXyVFbt+AM+n82V7vg29cdhVbMSlady73hAN4nMSSNSFEWrvJECqsfa
 J6KpcPr7lrCDGinWPl+bZAT3v+3ut0+AWtFgyXrUPx0QCklHr6CSCsNVCwi0MTTpYolk96MJ1xR
 nCpqgxwmjYYxCoNDd7Cm4UXB5X93iGrAOJdg6fnyneRR5utxgRBD+dbpO0xOwpnjF4Ker7i1NQ/
 zaWnlfVz
X-Proofpoint-ORIG-GUID: sFI6caloQdCZ5bIucrwwy7xnabOQZCTJ
X-Proofpoint-GUID: sFI6caloQdCZ5bIucrwwy7xnabOQZCTJ
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=688c96fb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ri_5JkV0AAAA:8
 a=-FRhYnqVZGWO-uJQOMcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=4Qv8XOUJw1QQJyBSU6iG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221227

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix the below build failure:
 /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sources/ovm=
f-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmS=
tdBoolAlt.h:13:17: error: two or more data types in declaration specifiers
 13 | typedef BOOLEAN bool;
 | ^~~~
  /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sources/ov=
mf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/Libspdm=
StdBoolAlt.h:13:1: error: useless type name in empty declaration [-Werror]
  13 | typedef BOOLEAN bool;

[1] https://github.com/tianocore/edk2/commit/772fa11ac82579a8f6fa171e6b835f=
68af3f64be

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...t-define-bool-type-if-building-in-C2.patch | 35 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-SecurityPkg-Don-t-defi=
ne-bool-type-if-building-in-C2.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-SecurityPkg-Don-t-define-bool=
-type-if-building-in-C2.patch b/meta/recipes-core/ovmf/ovmf/0001-SecurityPk=
g-Don-t-define-bool-type-if-building-in-C2.patch
new file mode 100644
index 00000000000..a555070ca59
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-SecurityPkg-Don-t-define-bool-type-i=
f-building-in-C2.patch
@@ -0,0 +1,35 @@
+From 772fa11ac82579a8f6fa171e6b835f68af3f64be Mon Sep 17 00:00:00 2001
+From: Rebecca Cran <rebecca@bsdio.com>
+Date: Mon, 26 May 2025 08:01:39 -0600
+Subject: [PATCH] SecurityPkg: Don't define bool type if building in C23 mo=
de
+
+In C23 bool is a built-in type, so it's not necessary to typedef
+bool in LibspdmStdBoolAlt.h.
+
+Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/772fa1=
1ac82579a8f6fa171e6b835f68af3f64be]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ .../DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h     | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBool=
Alt.h b/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
+index 08af7296d0..395ef22d43 100644
+--- a/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
++++ b/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
+@@ -10,7 +10,10 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #ifndef LIBSPDM_STDBOOL_ALT_H=0D
+ #define LIBSPDM_STDBOOL_ALT_H=0D
+ =0D
++// In C23, bool is a built-in type=0D
++#if __STDC_VERSION__ < 202311L=0D
+ typedef BOOLEAN bool;=0D
++#endif=0D
+ =0D
+ #ifndef true=0D
+ #define true  TRUE=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 08879966c34..a8efcc2a462 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2024-38797-2.patch \
            file://CVE-2024-38797-3.patch \
            file://CVE-2024-38797-4.patch \
+           file://0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C=
2.patch \
            "
=20
 PV =3D "edk2-stable202502"
--=20
2.34.1


