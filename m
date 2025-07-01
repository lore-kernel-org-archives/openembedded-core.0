Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FFBC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:38:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.258.1751384303635992871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9277eaff6f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5610maab014398
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:38:22 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9b5vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:38:22 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 08:38:19 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/3] webkitgtk: Fix build break on non-arm/non-x86 systems
Date: Tue, 1 Jul 2025 21:07:55 +0530
Message-ID: <20250701153757.2798866-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: HQqfV1pV68G5VbuwO5SlSRmja7mpXLjw
X-Proofpoint-GUID: HQqfV1pV68G5VbuwO5SlSRmja7mpXLjw
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686400ee cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8
 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=QqVrQa3FhnsI7-jUj8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNCBTYWx0ZWRfX9iCTiXTf7//2 MY2hehsZOtc5yYdH61alk4oYkapMSPfuBYwGogjq/IAulH7jSZrIYEGxYSQIe65Po2nxfsa0pRs N6xsjokDsn4Qq/94AuMwQV2o9d37uCJAJ+jZF4rkxDWVzSxlREsVzzYre6cJ6uG5iT319bGKG9R
 2L/NCwjGvuiJr0Y9d6CiYQ3nXhB3jgkBaBrlhZZlyi8fsPW2+LkEl/PiQInjfhYpTVzzw+4ZgPU Z1TY6e4htf7p5lIova3Fk2Fj9qLJ7oV8/d/MEOLgVVR2oHOcY96yDfVVmCeF5Pp28O2/UYt+TmS XG/LOO0YX/9yu/5pt81++pkoMbDq3UY2U5xs6opTSiVmIot3wiJOxfMc5PHeLYJJjdHvz2UCcsn
 szAyIFJUyOoMK8mTCnVq68eiXg5IaOSNMTmUOeK61VJbQl7nui8WqWPJDHr6yj0ApieW2njd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=787 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5610maab014398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219585

From: Khem Raj <raj.khem@gmail.com>

Fixes
/webkitgtk-2.48.1/Source/WebCore/platform/audio/DenormalDisabler.cpp:94:4=
7:
   =E2=86=AA error: expected ';' after default
   |    94 | DenormalDisabler::DenormalDisabler() =3D default
   |       |                                               ^
   |       |                                               ;

(From OE-Core rev: 3325e4e7fc82861abf7505ed4f7926dacab96b30)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkitgtk/fix-ftbfs-non-arm-non-x86.patch | 31 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-=
non-x86.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86=
.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.pat=
ch
new file mode 100644
index 0000000000..2381acb1b0
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
@@ -0,0 +1,31 @@
+From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 2 Apr 2025 15:01:55 -0500
+Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
+ non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=3D287662
+
+Unreviewed stable branch build fix.
+
+* Source/WebCore/platform/audio/DenormalDisabler.cpp:
+
+Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9=
eb95ae24c6a410f9cd614976f4653d020d9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source=
/WebCore/platform/audio/DenormalDisabler.cpp
+index 35715e663ce7e..44ba08a33d5d9 100644
+--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
++++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
+     }
+ }
+ #else
+-DenormalDisabler::DenormalDisabler() =3D default
++DenormalDisabler::DenormalDisabler() =3D default;
+ DenormalDisabler::~DenormalDisabler() =3D default;
+ #endif
+=20
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.48.1.bb
index 58d0a11202..5b9846a6d6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://fix-ftbfs-non-arm-non-x86.patch \
            "
 SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a=
93f71dbfa1eb258f"
=20
--=20
2.40.0


