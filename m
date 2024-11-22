Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4F8D75E2C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:43:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22046.1732275799886946137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10568bfe45=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM6n8x7023008
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:43:19 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0pvn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:43:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 22 Nov 2024 03:43:17 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 22 Nov 2024 03:43:16 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] python3-requests: upgrade 2.32.1 -> 2.32.2
Date: Fri, 22 Nov 2024 11:43:13 +0000
Message-ID: <20241122114313.1666838-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 3hVRc0vTp4-DmS9zgLohGQ4pY1pFFec-
X-Proofpoint-GUID: 3hVRc0vTp4-DmS9zgLohGQ4pY1pFFec-
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=67406e56 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=UXIAUNObAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ocJjFF96mjsIcxKxQ_gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220099
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AM6n8x7023008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207603

From: Soumya Sambu <soumya.sambu@windriver.com>

https://requests.readthedocs.io/en/latest/community/updates/#id2

2.32.2 (2024-05-21)
  * Deprecations - To provide a more stable migration for custom HTTPAdap=
ters
    impacted by the CVE changes in 2.32.0, we=E2=80=99ve renamed _get_con=
nection to a
	new public API, get_connection_with_tls_context. Existing custom
	HTTPAdapters will need to migrate their code to use this new API.
	get_connection is considered deprecated in all versions of
	Requests>=3D2.32.0.
  * A minimal (2-line) example has been provided in the linked PR to ease
    migration, but we strongly urge users to evaluate if their custom ada=
pter
	is subject to the same issue described in CVE-2024-35195. (#6710)

https://github.com/psf/requests/compare/v2.32.1...v2.32.2

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-requests_2.31.0.bb =3D> python3-requests_2.32.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.31.0.bb =3D> pyt=
hon3-requests_2.32.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.31.0.bb b/me=
ta/recipes-devtools/python/python3-requests_2.32.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-requests_2.31.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.0.bb
index 287b4f8eee..b4df4c5dc7 100644
--- a/meta/recipes-devtools/python/python3-requests_2.31.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://requests.readthedocs.io"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
=20
-SRC_URI[sha256sum] =3D "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d=
2791656dbd6ad1e1"
+SRC_URI[sha256sum] =3D "fa5490319474c82ef1d2c9bc459d3652e3ae4ef4c4ebdd18=
a21145a47ca4b6b8"
=20
 inherit pypi setuptools3
=20
--=20
2.40.0


