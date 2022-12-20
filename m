Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D514DC4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:21:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52592.1671549655878341718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=lg2mfND+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9353b77df7=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BKCb2cd016668
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 15:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=6kj1zDnxwKCxAtuhJK5a/xPl/02MIaygmleARXnLf6A=;
 b=lg2mfND+/QtkmMw1HF218vamUeaQH6v6tV8n1TiqclII7M4X/6uQA7Uq2EESoziO+rJs
 r30xVt6gaFq/HmFBiDu1YNbxkOVHaEOBz24pj2oufFcnkT4MHYxXZBV6AJo/vINEDSn7
 tqABbof93qeLFRjYdB4lBg29TqCQ0hZhMfn4BW3YmPXKzuzrJP+iVy67xotlzI1jdcrk
 sK37BWvldTY+tBIlU2fFk+vmk6Mn9juqMxCNfVSz22b8prC5yl/jTkqcW3xo7wLOUqGv
 0026MJof7mFxeZmOrGvqApP4GKxzr3PRNsJUUz3lsPocO3uFG3TcqWhqoCzgNbfpBOIV /g== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9abub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 15:20:55 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 20 Dec 2022 07:20:53 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 20 Dec 2022 07:20:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] webkitgtk: 2.36.7 -> 2.36.8
Date: Tue, 20 Dec 2022 23:20:27 +0800
Message-ID: <20221220152027.39838-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Yid5BUvIPlYlJmPw1GYoPjOlSmv5vgah
X-Proofpoint-ORIG-GUID: Yid5BUvIPlYlJmPw1GYoPjOlSmv5vgah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_05,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BKCb2cd016668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 15:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174858

From: Kai Kang <kai.kang@windriver.com>

webkitgtk 2.36.8 is a bug fix release in the stable 2.36 series.

What=E2=80=99s new in the WebKitGTK 2.36.8 release?
* Fix jumpy elements when scrolling GitLab and other web sites.
* Fix WebKitWebView:web-process-terminated signal not being emitted for
  the first web view when sandboxing is enabled.
* Fix hang when opening HTML <select> elements in GTK4 builds.
* Fix kinetic scrolling with elements that use overflow scrolling.
* Fix several crashes and rendering issues.

It fixes CVES:
CVE: CVE-2022-32886
CVE: CVE-2022-32891
CVE: CVE-2022-32912

Refs:
* https://webkitgtk.org/2022/09/16/webkitgtk2.36.8-released.html
* https://webkitgtk.org/security/WSA-2022-0009.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/{webkitgtk_2.36.7.bb =3D> webkitgtk_2.36.8.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.7.bb =3D> webkitgtk_2.36=
.8.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.36.8.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 026e24ae39..7b2c5c6e36 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -9,14 +9,14 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPY=
ING.LIB;md5=3Dd0c6d6397a5d842
                     file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33=
ef338abbaf8b8a7c36b6eec80 \
                     "
=20
-SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-w=
ork.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CF=
LAG.patch \
            "
-SRC_URI[sha256sum] =3D "0c260cf2b32f0481d017670dfed1b61e554967cd06719560=
6c9f9eb5fe731743"
+SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136=
edbab2c133d00437"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gtk-doc
=20
--=20
2.17.1


