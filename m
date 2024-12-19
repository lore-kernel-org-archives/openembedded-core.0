Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8811FE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 19:02:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.136495.1734634972715902125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 11:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2083d4188c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHAMiS025662
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 19:02:52 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1096a4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 19:02:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 11:02:50 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 11:02:49 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] python3-requests: upgrade 2.32.0 -> 2.32.3
Date: Thu, 19 Dec 2024 19:02:45 +0000
Message-ID: <20241219190245.2758293-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=bp62BFai c=1 sm=1 tr=0 ts=67646ddb cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=UXIAUNObAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=XsSkfP9iAkG48WMwnDcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VI3Zg0SYqGZ4XP5B2KcF8T_PPBmxZDsx
X-Proofpoint-GUID: VI3Zg0SYqGZ4XP5B2KcF8T_PPBmxZDsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_08,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190151
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BJHAMiS025662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 19:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208929

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
https://requests.readthedocs.io/en/latest/community/updates/#release-hist=
ory

2.32.3 (2024-05-29)
  * Bugfixes - Fixed bug breaking the ability to specify custom SSLContex=
ts
    in sub-classes of HTTPAdapter. (#6716)
  * Fixed issue where Requests started failing to run on Python versions
    compiled without the ssl module. (#6724)

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

2.32.1 (2024-05-20)
  * Bugfixes - Add missing test certs to the sdist distributed on PyPI.

https://github.com/psf/requests/compare/v2.32.0...v2.32.3

Also transition to using python_setuptools_build_meta.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...{python3-requests_2.32.0.bb =3D> python3-requests_2.32.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.0.bb =3D> pyt=
hon3-requests_2.32.3.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.0.bb b/me=
ta/recipes-devtools/python/python3-requests_2.32.3.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-requests_2.32.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.3.bb
index b4df4c5dc7..4f0638b50c 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "https://requests.readthedocs.io"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
=20
-SRC_URI[sha256sum] =3D "fa5490319474c82ef1d2c9bc459d3652e3ae4ef4c4ebdd18=
a21145a47ca4b6b8"
+SRC_URI[sha256sum] =3D "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402=
399eaf68af20a760"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     python3-certifi \
--=20
2.40.0


