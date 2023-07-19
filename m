Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8D9EB64DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 02:58:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5819.1689735487026235243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 19:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6564ce24fe=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J0ZaWF003703
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 19:58:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqyb9p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 19:58:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 19:58:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 19:58:05 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] acpica: Update SRC_URI
Date: Wed, 19 Jul 2023 10:58:03 +0800
Message-ID: <20230719025803.1281145-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: z3pUAQP-ncvaL9iEwjT01PA82-cqr07w
X-Proofpoint-ORIG-GUID: z3pUAQP-ncvaL9iEwjT01PA82-cqr07w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_19,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=687
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307190027
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36J0ZaWF003703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 02:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184565

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch warning.
 $ wget https://acpica.org/sites/acpica/files/acpica-unix-20220331.tar.gz
--2023-07-19 02:45:33--  https://acpica.org/sites/acpica/files/acpica-uni=
x-20220331.tar.gz
Resolving acpica.org... 20.29.206.128
Connecting to acpica.org|20.29.206.128|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.intel.com/content/www/us/en/developer/topic-technol=
ogy/open/acpica/overview.html [following]
--2023-07-19 02:45:33--  https://www.intel.com/content/www/us/en/develope=
r/topic-technology/open/acpica/overview.html
Resolving www.intel.com... 23.72.14.54
Connecting to www.intel.com|23.72.14.54|:443... connected.
HTTP request sent, awaiting response... 403 Forbidden
2023-07-19 02:45:34 ERROR 403: Forbidden.

 $ wget https://downloadmirror.intel.com/774879/acpica-unix-20220331.tar.=
gz
--2023-07-19 02:46:04--  https://downloadmirror.intel.com/774879/acpica-u=
nix-20220331.tar.gz
Resolving downloadmirror.intel.com... 18.164.154.85, 18.164.154.5, 18.164=
.154.74, ...
Connecting to downloadmirror.intel.com|18.164.154.85|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1911044 (1.8M) [application/gzip]
Saving to: =E2=80=98acpica-unix-20220331.tar.gz=E2=80=99

acpica-unix-20220331.tar.gz           100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>]   1.82M  1.61MB/s    in 1.1s

2023-07-19 02:46:06 (1.61 MB/s) - =E2=80=98acpica-unix-20220331.tar.gz=E2=
=80=99 saved [1911044/1911044]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/acpica/acpica_20220331.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20220331.bb b/meta/recip=
es-extended/acpica/acpica_20220331.bb
index 2c554f863a..73b9154ee7 100644
--- a/meta/recipes-extended/acpica/acpica_20220331.bb
+++ b/meta/recipes-extended/acpica/acpica_20220331.bb
@@ -16,7 +16,7 @@ COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
 DEPENDS =3D "m4-native flex-native bison-native"
=20
-SRC_URI =3D "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar=
.gz"
+SRC_URI =3D "https://downloadmirror.intel.com/774879/acpica-unix-${PV}.t=
ar.gz"
 SRC_URI[sha256sum] =3D "acaff68b14f1e0804ebbfc4b97268a4ccbefcfa053b02ed9=
924f2b14d8a98e21"
=20
 UPSTREAM_CHECK_URI =3D "https://acpica.org/downloads"
--=20
2.35.5


