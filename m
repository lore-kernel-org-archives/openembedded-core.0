Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0518EEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4568.1689587081473290316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=cfIa/OCu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6562b8c1f1=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36H9iemj024230;
	Mon, 17 Jul 2023 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=Jb4h6LdJgOZfMD70el
	HFClFwInKhqomJhgY716F62C4=; b=cfIa/OCuGwskF9GHf4nyhxQifp1t64lyu+
	lCNmj5qXBxgwD4KcdSXD0utxHKbLY9s6KYcvt/+ew2FRG7gJR9tMwZgexSxzg7sJ
	oOOxYMsBKx4pRl9FDlCiJ5oGJHC8ezcyvleWfTSG/9pMVMrTjnrYfQS4miXMiLFM
	Iw5IPw5FAqthfSKz8OEvgmRx6cVqs35lYogJz5OPsjVhFzgSSjjvrX5FaPO4gEnX
	MWMa+qmdC34AzraoWEVzSeo3iNyeDrq0hEiVM7cJQrEmlkJuP+L0tYdbxpTTHtKo
	HVJSQ1SWT0PbPf61Ko0dL9JlbFxB2WLOLwKVAvya0a7YiAmG93pA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jseby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:44:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 02:44:39 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 02:44:38 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] webkitgtk: 2.38.5 -> 2.38.6
Date: Mon, 17 Jul 2023 17:44:35 +0800
Message-ID: <20230717094435.337190-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: E00A2mwU9fdKGlHvpfqLurt7Ddway6EB
X-Proofpoint-ORIG-GUID: E00A2mwU9fdKGlHvpfqLurt7Ddway6EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_07,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=897 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307170087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36H9iemj024230
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184459

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.38.5 to 2.38.6. It fixes CVE-2023-27932 and
CVE-2023-27954.

What=E2=80=99s new in the WebKitGTK 2.38.6 release?

* Enable the Asynchronous Clipboard API to make certain pages work (e.g.
  GithHub started recently requiring it).
* Support :has() CSS selectors in content filters.
* Apply basic font properties as font variation settings.
* The Bubblewrap sandbox no longer requires setting an application
  identifier via GApplication to operate correctly. Using GApplication
  is still recommended, but optional.
* Improvements to the GStreamer multimedia playback, in particular
  around MSE, WebRTC, and seeking.
* Fix the build with journald support enabled when using elogind instead
  of the systemd libraries.
* Fix the build with Link-Time Optimization enabled (-flto=3Dauto).
* Fix context menus not working in the remote Web Inspector.
* Fix usage of the remote Web Inspector over HTTP.
* Fix debug logs not being emitted in release builds.
* Fix several crashes and rendering issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2.38.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2.38=
.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.38.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
index 36c6233b33..5e8adf50fc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
            "
-SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389bb08=
aee08c5b0bb0c1a7"
+SRC_URI[sha256sum] =3D "1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac70=
0935fae0724ad48b"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
--=20
2.34.1


