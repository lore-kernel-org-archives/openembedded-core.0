Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9361DC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6236.1750250627059597621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I3e2Hm011628;
	Wed, 18 Jun 2025 05:43:41 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkm992-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 05:43:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:40 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:37 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [oe-core][walnascar][PATCH 7/7] glib-2.0: update 2.84.1 -> 2.84.2
Date: Wed, 18 Jun 2025 18:12:56 +0530
Message-ID: <20250618124256.3261625-7-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: GMhZORF9NFCvIEr42HPq_LObQmuIrhjv
X-Proofpoint-ORIG-GUID: GMhZORF9NFCvIEr42HPq_LObQmuIrhjv
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=6852b47d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=drK4fEOgAKdWdMypPr8A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfX9uNd2qzS5hfF Di4UJe0wfWN35caFT9VPQL08d7opa5Wl0cgAW1i6CF/tPK1zT5FirvWAtP1itq5Z8OdxkxotB1E T2/YEBOd8rYOXt5JxlnaFG++5G092kH837Qvc5EybCdidCABIDRhTKhPE3qcCz3YeMqDYaautVx
 RGmDNgkeoON/Ya/qFNETuUu6sWCyVwBA4nc/F9KzAN0foRg4v/aXiTHbCiFd3axQneVc8/AM03Q Oe2IP2DFMT5RzT8tMVAkF/TK3NsmT7y9Na5N9pjohZo9tehMAN9IbLa0lO5XSzQwuzMlY69dfNr feEpv/jF4F8Q8HFsBtXzn5SBnR4bpzFsCz6oE8FBup0Mq+QQKGpvKqyvNQTnFrFeD4svqYVRJxR
 qSEqM4IzC6jMC/2j66IbpJdgSX//KhHjZLnhBcfy2gCU4eKt/wYnr7qdUQnPoxR4DDU2GflO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=885 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55I3e2Hm011628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219006

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

(From OE-Core rev: 3deb6b59f3fa91d4fa755f49dad4ac62c3a518fb)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


