Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0386C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 06:35:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42712.1747982156291102368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 23:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7238169bb2=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5CGZm002016
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 23:35:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrbh48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 23:35:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 22 May 2025 23:35:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 22 May 2025 23:35:34 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][PATCH 1/1] glib-2.0: update 2.84.1 -> 2.84.2
Date: Fri, 23 May 2025 12:05:47 +0530
Message-ID: <20250523063547.3912158-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1OSBTYWx0ZWRfXy0mg7NxvmguQ R2A8MKut9OFKoIi8G+8g9XH95NQy8zl4rX6eO7B3IB179pLin2dlAG0GKIRH3obFFaUf/FBPmY7 IdwBtU33UDFR0MMlJVt3MVcDEAPSrMGHlvIgAkVnT3k1rOFJqB+f8bSh7xU0Oghqld7icqQtD3p
 /dFflHwckT7XUESj7r0KDhQ0TfJe0i0LoaQZLsvpvBectNYG/Zu194Nj1hGLycRghHj6kShYION 4EOqisGJrjKjecDW5uBYR+Y0OrJv/X6tXyqPt744pOKfQbLin6u5ZvzsQ6wrXz4KMhmG1MAHVfO JPhcjUMdNpItomMX01U2akjlhPb0EK4qZ2Z53Ta4sf1NQpAZyC+Uj0sPt5KTEnEfeLKB5QBA2su
 PEfEl+5EKZQgSquFI8rqSdX7B4Lx/1KERXumQ8lRJNkiUNrBxCgZhX1RgaWtoHq+kpNHXNxB
X-Proofpoint-ORIG-GUID: VWvEnl6O9KZbpFBAwAGn3ylGobosmyPG
X-Proofpoint-GUID: VWvEnl6O9KZbpFBAwAGn3ylGobosmyPG
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=6830174b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=drK4fEOgAKdWdMypPr8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=905
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54N5CGZm002016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 06:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217176

Overview of changes in GLib 2.84.2, 2025-05-20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - !4576 Backport !4575 =E2=80=9Cgclosure: fix ATOMIC_CHANGE_FIELD to re=
ad vint
    atomically=E2=80=9D to glib-2-84
  - !4595 Backport !4582 =E2=80=9CWindows: fix wrong typelib path=E2=80=9D=
 to glib-2-84
  - !4614 Backport "gstring: carefully handle gssize parameters"
  - !4616 Backport !4613 =E2=80=9CUpdate macOS job for new CI runner=E2=80=
=9D to glib-2-84
  - !4623 Backport !4617 =E2=80=9Cgdate: Call tzset before localtime_r=E2=
=80=9D to glib-2-84
  - !4639 Backport -Wsign-conversion fixes for g_get_locale_variants() fr=
om
    !4590 to glib-2-84
  - !4640 Backport !4620 =E2=80=9Cglocalfile: Disable faccessat()-based q=
uery_exists on
    Android=E2=80=9D to glib-2-84

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../{glib-2.0-initial_2.84.1.bb =3D> glib-2.0-initial_2.84.2.bb}  | 0
 .../glib-2.0/{glib-2.0_2.84.1.bb =3D> glib-2.0_2.84.2.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.1.bb =3D> glib-=
2.0-initial_2.84.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.1.bb =3D> glib-2.0_2.84=
.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.84.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index d00bfe4c65..38e75aab61 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,7 +234,7 @@ SRC_URI:append:class-native =3D " file://relocate-mod=
ules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab=
6bb73396bf30789a"
+SRC_URI[sha256sum] =3D "88e960dd937057407d61fcb3b45a860704b25923c37ae247=
8b85f2ecb5a4021f"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.40.0


