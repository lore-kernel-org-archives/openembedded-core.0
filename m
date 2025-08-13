Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7594DC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:32:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1047.1755102742203369251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 09:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0320f648ca=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DBUYWI3849852;
	Wed, 13 Aug 2025 09:32:15 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvk2206q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Aug 2025 09:32:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 09:32:02 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 09:32:00 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [oe-core][walnascar][PATCH 2/2] glib-2.0: update 2.84.1 -> 2.84.2
Date: Wed, 13 Aug 2025 22:01:41 +0530
Message-ID: <20250813163141.120945-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250813163141.120945-1-praveen.kumar@windriver.com>
References: <20250813163141.120945-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE1NSBTYWx0ZWRfX/1/ZINERmwZ9
 2pBDw15t8JdoS8vZ39T18Yv0EWKFwh7JEaJ//lrZGvo+Gg3kHwqOlXv2iNr3QFq2UkCDBfyGuhD
 kXuq7oFqJ74+KcSktHZ7IXCX6K0a2oxE2nTqmtYQV4M2XpSdk1b3TefpZ4SFuH01WAQ2RPIyXai
 QPK6+DpTNUa+CR62hr1VLKeY1VF5YyqV65L8brxPJuUD8iGc2MzdbsKRvXIuAlZFLrkR6p+FcNo
 AxRQRPHi02fN+7e1ST/yyKMrIChwo5TtqLr2/ujqNiGkh9nPL/OsnRw2am5gibBVrYLBAd9PPdC
 st4m3fBLPsATb1PdUP8D2hdR76Vdu3WI+ls2IgnOlPNe2wnbl0AEVzT1fYf280=
X-Proofpoint-ORIG-GUID: cPhO6DIygNAInmedju9j33b_ZO6mkrOI
X-Proofpoint-GUID: cPhO6DIygNAInmedju9j33b_ZO6mkrOI
X-Authority-Analysis: v=2.4 cv=PsOTbxM3 c=1 sm=1 tr=0 ts=689cbe0f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=drK4fEOgAKdWdMypPr8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57DBUYWI3849852
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 16:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221818

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3deb6b59f3fa91d4fa755f49dad4ac62c3a518fb)
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
index 4368e51df85..819f3ff50ab 100644
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


