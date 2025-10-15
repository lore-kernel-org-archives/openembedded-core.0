Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676ACCCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 05:08:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8603.1760504875196711737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 22:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fQpk+w6/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23830399db=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F50Dxc1858371;
	Wed, 15 Oct 2025 05:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rEtWn7k4gccNF8lhOU2c
	uX2IvLaponfZrlZ04DAORUA=; b=fQpk+w6/l1tEl/9pVDPN2Fx+O0ZbS/33zqnM
	wZua1oMQqnrC3KzvEISRViO7J/qasm9C06DTdfw9S+Ce5UVYZmtoSOpg2lO+tnTs
	NfehDfVzuCEsS1yYpfPuEPhX/+Jq7P3fhC1XPZp3txJ7pVv8bZJxBo6tigvu89HD
	Xp+eF8+F5N91PAKQNQlAdcy9PdinjznkH8kY9X/ZS2ETv5qIOjRBDhBxQJ8KCG5X
	XiVRJLghn7SeV5ZQyp4RxQZmjQmnIFk0HS7WOm/6TBQg4IaqqVQtBUy3pPxgrT+o
	Qa9TT5CIUfCog3Ux4duhtpj0WJQxnl0weL9LEBO1sDmgjwGeNQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmf0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Oct 2025 05:07:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 14 Oct 2025 22:07:49 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 14 Oct 2025 22:07:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [PATCH] spdx-licenses.json: Update to SPDX license version 3.27.0
Date: Wed, 15 Oct 2025 13:07:47 +0800
Message-ID: <20251015050747.211069-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: mZDpVVfFfZU51ubr9hoP9UlfX0a7B0Tb
X-Proofpoint-ORIG-GUID: mZDpVVfFfZU51ubr9hoP9UlfX0a7B0Tb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDAzNSBTYWx0ZWRfXwF0LoIR5V707
 Wf9a7fElyGTDXYKfO6WdLZb64icfz2PnbM7VsZbCOcdyN3E0BVpd/D74vyJBOKB5DTdvlagznYs
 zyKAgF5JslaWhDkR5Z6fyUU0XHmGzLFmeKOSTsBqup7D/7v1BrHjvxcSKWOjPRkrfd2edsEloyy
 ZMljYLsL3UO5eagpUyijFnvkzy2T+vbwkP2CqH5Ta99vfS9FLRRddNTQ9uLhGWRehSjyq72ERtO
 GG3XGJE8F69KnFwqvdKZBCUycHVrrJj0/mm7fMH52Gnx9c3sLdg3noBEN9Lvj2km0wmLZEBKPuC
 amlWsQL4QSi/oQ227nSO9MGmUmvjWuU31H0SDkp0RXlFImKSlJMzmU+RI73MZNUvrgPzLwSiyl9
 9F72UE7TpQgl/0K/ro0dgsyMtOUrpQ==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=0 sm=1 tr=1 ts=68ef2c27 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=24AZYWMyAAAA:8 a=y5Yq1ZyPAAAA:8 a=93Ubh6UdAAAA:8
 a=_7fKWT6FAAAA:8 a=vTr9H3xdAAAA:8 a=e5mUnYsNAAAA:8 a=jkQCmnJzAAAA:8
 a=a4NEJbfMAAAA:8 a=4F77bVRYAAAA:8 a=qw_YpOfSAAAA:8 a=mDV3o1hIAAAA:8
 a=DyznqomoAAAA:8 a=CCpqsmhAAAAA:8 a=Ikd4Dj_1AAAA:8 a=ahpTZqWBAAAA:8
 a=wyjpycHzAAAA:8 a=mV9VRH-2AAAA:8 a=t-IPkPogAAAA:8 a=pfyumP86AAAA:8
 a=_IEhM8lNAAAA:8 a=7FtUIQWGAAAA:8 a=6I5d2MoRAAAA:8 a=XdVk30-KAAAA:20
 a=1kW3h2mRAAAA:20 a=9xSBU8O8AAAA:8 a=7mOBRU54AAAA:8 a=inoG4m36AAAA:8
 a=mLKua8RHAAAA:8 a=h94Hfu5PAAAA:8 a=Gz7s5_CCAAAA:8 a=_ctWjzdLAAAA:8
 a=QB5P6clmAAAA:8 a=fXms6y0vAAAA:8 a=0X8AJ3mTAAAA:8 a=t7CeM3EgAAAA:8
 a=JIVOxcAaAAAA:8 a=-tVzTEf7AAAA:8 a=WY8_U8COAAAA:8 a=yPCof4ZbAAAA:8
 a=COfzQ7OkAAAA:8 a=NSyGwt37AAAA:8 a=x39b1jQNAAAA:8 a=ozQi6Qy7AAAA:8
 a=xNf9USuDAAAA:8 a=NPAVlATjAAAA:8 a=PBwXQV_YAAAA:8 a=AIPdC31oAAAA:8
 a=jpp-Wi3FAAAA:8 a=vo4bZTRiAAAA:8 a=xi40xmVRAAAA:8 a=t1MrwbVUAAAA:8
 a=VY3jW7vHAAAA:8 a=GqZI9gvVAAAA:8 a=6ieUZVJ8AAAA:8 a=bo0wxPrtAAAA:8
 a=TE3-CK5hAAAA:8 a=Bo1-saxaAAAA:8 a=gUbaYAUbAAAA:8 a=2m3dtJpDAAAA:8
 a=RTGxQonJAAAA:8 a=tff_f_YsAAAA:8 a=i0d_qFZxAAAA:8 a=8AHkEIZyAAAA:8
 a=70qzlKQjAAAA:8 a=Oh2cFVv5AAAA:8 a=yyJd0-ZHAAAA:8 a=Rr5kw0T3AAAA:8
 a=8r2qhXULAAAA:8 a=M67dUa9cAAAA:8 a=C4AcflNXAAAA:8 a=LR7c0X1yAAAA:8
 a=vnD-jzZmAAAA:8 a=fZ4oNwNWAAAA:8 a=237vnFaWAAAA:8 a=YCI-pV4WAAAA:8
 a=WeBNh-LTAAAA:8 a=m0Z5qpT1AAAA:8 a=sGKcSeiLAAAA:8 a=RnwK7N16AAAA:8
 a=dJQ_LABYAAAA:20 a=EuvBnV-pAAAA:8 a=JL-7mqT1AAAA:8 a=Sdu3sVE0AAAA:8
 a=FP58Ms26AAAA:8 a=E6nHzQDPAAAA:8 a=KmpA8lpPAAAA:8 a=lA4rYRJ5AAAA:8
 a=dk8rdlNhAAAA:8 a=uZUKiBMjAAAA:8 a=5JsHehISAAAA:8 a=Npn9PEg5AAAA:8
 a=RxGvw6ywAAAA:8 a=qNp_YjjoAAAA:8 a=FHv8RbM3AAAA:8 a=yjT4zig3AAAA:8
 a=B6GvL0XKAAAA:8 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=Cd_a9bp0AAAA:8
 a=YfCOm-DyAAAA:8 a=0homCqhpAAAA:8 a=0bwPlpDAAAAA:8 a=SSmOFEACAAAA:8
 a=aZrenTUAAAAA:8 a=iio8TCEMAAAA:8 a=iE-e0aDHAAAA:8 a=vd56H4qaAAAA:8
 a=2ifu6yujAAAA:8 a=SCo1hh1FAAAA:8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59F50Dxc1858371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 05:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224878

Update the SPDX license database from [1]

[1] https://github.com/spdx/license-list-data/blob/v3.27.0/json/licenses.=
json

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/files/spdx-licenses.json | 8882 +++++++++++++++++----------------
 1 file changed, 4689 insertions(+), 4193 deletions(-)

diff --git a/meta/files/spdx-licenses.json b/meta/files/spdx-licenses.jso=
n
index 1af3061121..8970ea00c7 100644
--- a/meta/files/spdx-licenses.json
+++ b/meta/files/spdx-licenses.json
@@ -1,2570 +1,2670 @@
 {
-  "licenseListVersion": "3.24.0",
+  "licenseListVersion": "3.27.0",
   "licenses": [
     {
-      "detailsUrl": "https://spdx.org/licenses/0BSD.json",
+      "reference": "https://spdx.org/licenses/0BSD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "0BSD",
+      "detailsUrl": "https://spdx.org/licenses/0BSD.json",
+      "referenceNumber": 316,
       "name": "BSD Zero Clause License",
-      "reference": "https://spdx.org/licenses/0BSD.html",
-      "referenceNumber": 537,
+      "licenseId": "0BSD",
       "seeAlso": [
         "http://landley.net/toybox/license.html",
         "https://opensource.org/licenses/0BSD"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/3D-Slicer-1.0.json",
+      "reference": "https://spdx.org/licenses/3D-Slicer-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "3D-Slicer-1.0",
+      "detailsUrl": "https://spdx.org/licenses/3D-Slicer-1.0.json",
+      "referenceNumber": 61,
       "name": "3D Slicer License v1.0",
-      "reference": "https://spdx.org/licenses/3D-Slicer-1.0.html",
-      "referenceNumber": 200,
+      "licenseId": "3D-Slicer-1.0",
       "seeAlso": [
         "https://slicer.org/LICENSE",
         "https://github.com/Slicer/Slicer/blob/main/License.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AAL.json",
+      "reference": "https://spdx.org/licenses/AAL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "AAL",
+      "detailsUrl": "https://spdx.org/licenses/AAL.json",
+      "referenceNumber": 424,
       "name": "Attribution Assurance License",
-      "reference": "https://spdx.org/licenses/AAL.html",
-      "referenceNumber": 406,
+      "licenseId": "AAL",
       "seeAlso": [
         "https://opensource.org/licenses/attribution"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
+      "reference": "https://spdx.org/licenses/Abstyles.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Abstyles",
+      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
+      "referenceNumber": 252,
       "name": "Abstyles License",
-      "reference": "https://spdx.org/licenses/Abstyles.html",
-      "referenceNumber": 526,
+      "licenseId": "Abstyles",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Abstyles"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AdaCore-doc.json",
+      "reference": "https://spdx.org/licenses/AdaCore-doc.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AdaCore-doc",
+      "detailsUrl": "https://spdx.org/licenses/AdaCore-doc.json",
+      "referenceNumber": 315,
       "name": "AdaCore Doc License",
-      "reference": "https://spdx.org/licenses/AdaCore-doc.html",
-      "referenceNumber": 382,
+      "licenseId": "AdaCore-doc",
       "seeAlso": [
         "https://github.com/AdaCore/xmlada/blob/master/docs/index.rst",
         "https://github.com/AdaCore/gnatcoll-core/blob/master/docs/index=
.rst",
         "https://github.com/AdaCore/gnatcoll-db/blob/master/docs/index.r=
st"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
+      "reference": "https://spdx.org/licenses/Adobe-2006.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Adobe-2006",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
+      "referenceNumber": 658,
       "name": "Adobe Systems Incorporated Source Code License Agreement"=
,
-      "reference": "https://spdx.org/licenses/Adobe-2006.html",
-      "referenceNumber": 558,
+      "licenseId": "Adobe-2006",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Adobe-Display-PostScript.=
json",
+      "reference": "https://spdx.org/licenses/Adobe-Display-PostScript.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Adobe-Display-PostScript",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Display-PostScript.=
json",
+      "referenceNumber": 499,
       "name": "Adobe Display PostScript License",
-      "reference": "https://spdx.org/licenses/Adobe-Display-PostScript.h=
tml",
-      "referenceNumber": 431,
+      "licenseId": "Adobe-Display-PostScript",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type=3Dheads#L752"
-      ]
+        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type\u003dheads#L752"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
+      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Adobe-Glyph",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
+      "referenceNumber": 492,
       "name": "Adobe Glyph List License",
-      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
-      "referenceNumber": 297,
+      "licenseId": "Adobe-Glyph",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Adobe-Utopia.json",
+      "reference": "https://spdx.org/licenses/Adobe-Utopia.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Adobe-Utopia",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Utopia.json",
+      "referenceNumber": 554,
       "name": "Adobe Utopia Font License",
-      "reference": "https://spdx.org/licenses/Adobe-Utopia.html",
-      "referenceNumber": 532,
+      "licenseId": "Adobe-Utopia",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/font/adobe-utopia-100dpi/-/=
blob/master/COPYING?ref_type=3Dheads"
-      ]
+        "https://gitlab.freedesktop.org/xorg/font/adobe-utopia-100dpi/-/=
blob/master/COPYING?ref_type\u003dheads"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
+      "reference": "https://spdx.org/licenses/ADSL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ADSL",
+      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
+      "referenceNumber": 76,
       "name": "Amazon Digital Services License",
-      "reference": "https://spdx.org/licenses/ADSL.html",
-      "referenceNumber": 463,
+      "licenseId": "ADSL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesL=
icense"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AFL-1.1.json",
+      "reference": "https://spdx.org/licenses/AFL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AFL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.1.json",
+      "referenceNumber": 7,
       "name": "Academic Free License v1.1",
-      "reference": "https://spdx.org/licenses/AFL-1.1.html",
-      "referenceNumber": 601,
+      "licenseId": "AFL-1.1",
       "seeAlso": [
         "http://opensource.linux-mirror.org/licenses/afl-1.1.txt",
         "http://wayback.archive.org/web/20021004124254/http://www.openso=
urce.org/licenses/academic.php"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
+      "reference": "https://spdx.org/licenses/AFL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AFL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
+      "referenceNumber": 480,
       "name": "Academic Free License v1.2",
-      "reference": "https://spdx.org/licenses/AFL-1.2.html",
-      "referenceNumber": 72,
+      "licenseId": "AFL-1.2",
       "seeAlso": [
         "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
         "http://wayback.archive.org/web/20021204204652/http://www.openso=
urce.org/licenses/academic.php"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
+      "reference": "https://spdx.org/licenses/AFL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AFL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
+      "referenceNumber": 41,
       "name": "Academic Free License v2.0",
-      "reference": "https://spdx.org/licenses/AFL-2.0.html",
-      "referenceNumber": 187,
+      "licenseId": "AFL-2.0",
       "seeAlso": [
         "http://wayback.archive.org/web/20060924134533/http://www.openso=
urce.org/licenses/afl-2.0.txt"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AFL-2.1.json",
+      "reference": "https://spdx.org/licenses/AFL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AFL-2.1",
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.1.json",
+      "referenceNumber": 682,
       "name": "Academic Free License v2.1",
-      "reference": "https://spdx.org/licenses/AFL-2.1.html",
-      "referenceNumber": 383,
+      "licenseId": "AFL-2.1",
       "seeAlso": [
         "http://opensource.linux-mirror.org/licenses/afl-2.1.txt"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AFL-3.0.json",
+      "reference": "https://spdx.org/licenses/AFL-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AFL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/AFL-3.0.json",
+      "referenceNumber": 343,
       "name": "Academic Free License v3.0",
-      "reference": "https://spdx.org/licenses/AFL-3.0.html",
-      "referenceNumber": 369,
+      "licenseId": "AFL-3.0",
       "seeAlso": [
         "http://www.rosenlaw.com/AFL3.0.htm",
         "https://opensource.org/licenses/afl-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
+      "reference": "https://spdx.org/licenses/Afmparse.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Afmparse",
+      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
+      "referenceNumber": 84,
       "name": "Afmparse License",
-      "reference": "https://spdx.org/licenses/Afmparse.html",
-      "referenceNumber": 345,
+      "licenseId": "Afmparse",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Afmparse"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
+      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "AGPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
+      "referenceNumber": 38,
       "name": "Affero General Public License v1.0",
-      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
-      "referenceNumber": 221,
+      "licenseId": "AGPL-1.0",
       "seeAlso": [
         "http://www.affero.org/oagpl.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
+      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AGPL-1.0-only",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
+      "referenceNumber": 415,
       "name": "Affero General Public License v1.0 only",
-      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
-      "referenceNumber": 334,
+      "licenseId": "AGPL-1.0-only",
       "seeAlso": [
         "http://www.affero.org/oagpl.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
+      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AGPL-1.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
+      "referenceNumber": 24,
       "name": "Affero General Public License v1.0 or later",
-      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
-      "referenceNumber": 527,
+      "licenseId": "AGPL-1.0-or-later",
       "seeAlso": [
         "http://www.affero.org/oagpl.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0.json",
+      "reference": "https://spdx.org/licenses/AGPL-3.0.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AGPL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0.json",
+      "referenceNumber": 427,
       "name": "GNU Affero General Public License v3.0",
-      "reference": "https://spdx.org/licenses/AGPL-3.0.html",
-      "referenceNumber": 394,
+      "licenseId": "AGPL-3.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/agpl.txt",
         "https://opensource.org/licenses/AGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-only.json",
+      "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AGPL-3.0-only",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-only.json",
+      "referenceNumber": 191,
       "name": "GNU Affero General Public License v3.0 only",
-      "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
-      "referenceNumber": 123,
+      "licenseId": "AGPL-3.0-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/agpl.txt",
         "https://opensource.org/licenses/AGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-or-later.json",
+      "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "AGPL-3.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-or-later.json",
+      "referenceNumber": 469,
       "name": "GNU Affero General Public License v3.0 or later",
-      "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
-      "referenceNumber": 105,
+      "licenseId": "AGPL-3.0-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/agpl.txt",
         "https://opensource.org/licenses/AGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Aladdin.json",
+      "reference": "https://spdx.org/licenses/Aladdin.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "Aladdin",
+      "detailsUrl": "https://spdx.org/licenses/Aladdin.json",
+      "referenceNumber": 495,
       "name": "Aladdin Free Public License",
-      "reference": "https://spdx.org/licenses/Aladdin.html",
-      "referenceNumber": 168,
+      "licenseId": "Aladdin",
       "seeAlso": [
         "http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.01/Public.htm"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AMD-newlib.json",
+      "reference": "https://spdx.org/licenses/AMD-newlib.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AMD-newlib",
+      "detailsUrl": "https://spdx.org/licenses/AMD-newlib.json",
+      "referenceNumber": 437,
       "name": "AMD newlib License",
-      "reference": "https://spdx.org/licenses/AMD-newlib.html",
-      "referenceNumber": 222,
+      "licenseId": "AMD-newlib",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/sys/a29khif/_close.S;h=3D04f52ae00de1dafbd9055ad8d73c5c697a3a=
ae7f;hb=3DHEAD"
-      ]
+        "https://sourceware.org/git/?p\u003dnewlib-cygwin.git;a\u003dblo=
b;f\u003dnewlib/libc/sys/a29khif/_close.S;h\u003d04f52ae00de1dafbd9055ad8=
d73c5c697a3aae7f;hb\u003dHEAD"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AMDPLPA.json",
+      "reference": "https://spdx.org/licenses/AMDPLPA.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
+      "detailsUrl": "https://spdx.org/licenses/AMDPLPA.json",
+      "referenceNumber": 194,
+      "name": "AMD\u0027s plpa_map.c License",
       "licenseId": "AMDPLPA",
-      "name": "AMD's plpa_map.c License",
-      "reference": "https://spdx.org/licenses/AMDPLPA.html",
-      "referenceNumber": 149,
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AMD_plpa_map_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AML.json",
+      "reference": "https://spdx.org/licenses/AML.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AML",
+      "detailsUrl": "https://spdx.org/licenses/AML.json",
+      "referenceNumber": 644,
       "name": "Apple MIT License",
-      "reference": "https://spdx.org/licenses/AML.html",
-      "referenceNumber": 13,
+      "licenseId": "AML",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Apple_MIT_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AML-glslang.json",
+      "reference": "https://spdx.org/licenses/AML-glslang.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AML-glslang",
+      "detailsUrl": "https://spdx.org/licenses/AML-glslang.json",
+      "referenceNumber": 439,
       "name": "AML glslang variant License",
-      "reference": "https://spdx.org/licenses/AML-glslang.html",
-      "referenceNumber": 1,
+      "licenseId": "AML-glslang",
       "seeAlso": [
         "https://github.com/KhronosGroup/glslang/blob/main/LICENSE.txt#L=
949",
         "https://docs.omniverse.nvidia.com/install-guide/latest/common/l=
icenses.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/AMPAS.json",
+      "reference": "https://spdx.org/licenses/AMPAS.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "AMPAS",
+      "detailsUrl": "https://spdx.org/licenses/AMPAS.json",
+      "referenceNumber": 15,
       "name": "Academy of Motion Picture Arts and Sciences BSD",
-      "reference": "https://spdx.org/licenses/AMPAS.html",
-      "referenceNumber": 420,
+      "licenseId": "AMPAS",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/BSD#AMPASBSD"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD.json",
+      "reference": "https://spdx.org/licenses/ANTLR-PD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ANTLR-PD",
+      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD.json",
+      "referenceNumber": 25,
       "name": "ANTLR Software Rights Notice",
-      "reference": "https://spdx.org/licenses/ANTLR-PD.html",
-      "referenceNumber": 576,
+      "licenseId": "ANTLR-PD",
       "seeAlso": [
         "http://www.antlr2.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD-fallback.json",
+      "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ANTLR-PD-fallback",
+      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD-fallback.json",
+      "referenceNumber": 218,
       "name": "ANTLR Software Rights Notice with license fallback",
-      "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
-      "referenceNumber": 194,
+      "licenseId": "ANTLR-PD-fallback",
       "seeAlso": [
         "http://www.antlr2.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/any-OSI.json",
+      "reference": "https://spdx.org/licenses/any-OSI.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "any-OSI",
+      "detailsUrl": "https://spdx.org/licenses/any-OSI.json",
+      "referenceNumber": 74,
       "name": "Any OSI License",
-      "reference": "https://spdx.org/licenses/any-OSI.html",
-      "referenceNumber": 121,
+      "licenseId": "any-OSI",
       "seeAlso": [
         "https://metacpan.org/pod/Exporter::Tidy#LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Apache-1.0.json",
+      "reference": "https://spdx.org/licenses/any-OSI-perl-modules.html"=
,
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Apache-1.0",
-      "name": "Apache License 1.0",
+      "detailsUrl": "https://spdx.org/licenses/any-OSI-perl-modules.json=
",
+      "referenceNumber": 230,
+      "name": "Any OSI License - Perl Modules",
+      "licenseId": "any-OSI-perl-modules",
+      "seeAlso": [
+        "https://metacpan.org/release/JUERD/Exporter-Tidy-0.09/view/Tidy=
.pm#LICENSE",
+        "https://metacpan.org/pod/Qmail::Deliverable::Client#LICENSE",
+        "https://metacpan.org/pod/Net::MQTT::Simple#LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Apache-1.0.html",
-      "referenceNumber": 616,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Apache-1.0.json",
+      "referenceNumber": 379,
+      "name": "Apache License 1.0",
+      "licenseId": "Apache-1.0",
       "seeAlso": [
         "http://www.apache.org/licenses/LICENSE-1.0"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Apache-1.1.json",
+      "reference": "https://spdx.org/licenses/Apache-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Apache-1.1",
+      "detailsUrl": "https://spdx.org/licenses/Apache-1.1.json",
+      "referenceNumber": 111,
       "name": "Apache License 1.1",
-      "reference": "https://spdx.org/licenses/Apache-1.1.html",
-      "referenceNumber": 313,
+      "licenseId": "Apache-1.1",
       "seeAlso": [
         "http://apache.org/licenses/LICENSE-1.1",
         "https://opensource.org/licenses/Apache-1.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
+      "reference": "https://spdx.org/licenses/Apache-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Apache-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
+      "referenceNumber": 162,
       "name": "Apache License 2.0",
-      "reference": "https://spdx.org/licenses/Apache-2.0.html",
-      "referenceNumber": 564,
+      "licenseId": "Apache-2.0",
       "seeAlso": [
         "https://www.apache.org/licenses/LICENSE-2.0",
-        "https://opensource.org/licenses/Apache-2.0"
-      ]
+        "https://opensource.org/licenses/Apache-2.0",
+        "https://opensource.org/license/apache-2-0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/APAFML.json",
+      "reference": "https://spdx.org/licenses/APAFML.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "APAFML",
+      "detailsUrl": "https://spdx.org/licenses/APAFML.json",
+      "referenceNumber": 474,
       "name": "Adobe Postscript AFM License",
-      "reference": "https://spdx.org/licenses/APAFML.html",
-      "referenceNumber": 136,
+      "licenseId": "APAFML",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/AdobePostscriptAFM"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/APL-1.0.json",
+      "reference": "https://spdx.org/licenses/APL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "APL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/APL-1.0.json",
+      "referenceNumber": 127,
       "name": "Adaptive Public License 1.0",
-      "reference": "https://spdx.org/licenses/APL-1.0.html",
-      "referenceNumber": 515,
+      "licenseId": "APL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/APL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/App-s2p.json",
+      "reference": "https://spdx.org/licenses/App-s2p.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "App-s2p",
+      "detailsUrl": "https://spdx.org/licenses/App-s2p.json",
+      "referenceNumber": 155,
       "name": "App::s2p License",
-      "reference": "https://spdx.org/licenses/App-s2p.html",
-      "referenceNumber": 470,
+      "licenseId": "App-s2p",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/App-s2p"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.0.json",
+      "reference": "https://spdx.org/licenses/APSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": true,
-      "licenseId": "APSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.0.json",
+      "referenceNumber": 86,
       "name": "Apple Public Source License 1.0",
-      "reference": "https://spdx.org/licenses/APSL-1.0.html",
-      "referenceNumber": 39,
+      "licenseId": "APSL-1.0",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Apple_Public_Source_Li=
cense_1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.1.json",
+      "reference": "https://spdx.org/licenses/APSL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "APSL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.1.json",
+      "referenceNumber": 23,
       "name": "Apple Public Source License 1.1",
-      "reference": "https://spdx.org/licenses/APSL-1.1.html",
-      "referenceNumber": 582,
+      "licenseId": "APSL-1.1",
       "seeAlso": [
         "http://www.opensource.apple.com/source/IOSerialFamily/IOSerialF=
amily-7/APPLE_LICENSE"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
+      "reference": "https://spdx.org/licenses/APSL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "APSL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
+      "referenceNumber": 265,
       "name": "Apple Public Source License 1.2",
-      "reference": "https://spdx.org/licenses/APSL-1.2.html",
-      "referenceNumber": 628,
+      "licenseId": "APSL-1.2",
       "seeAlso": [
         "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
+      "reference": "https://spdx.org/licenses/APSL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "APSL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
+      "referenceNumber": 568,
       "name": "Apple Public Source License 2.0",
-      "reference": "https://spdx.org/licenses/APSL-2.0.html",
-      "referenceNumber": 144,
+      "licenseId": "APSL-2.0",
       "seeAlso": [
         "http://www.opensource.apple.com/license/apsl/"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Arphic-1999.json",
+      "reference": "https://spdx.org/licenses/Arphic-1999.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Arphic-1999",
+      "detailsUrl": "https://spdx.org/licenses/Arphic-1999.json",
+      "referenceNumber": 649,
       "name": "Arphic Public License",
-      "reference": "https://spdx.org/licenses/Arphic-1999.html",
-      "referenceNumber": 131,
+      "licenseId": "Arphic-1999",
       "seeAlso": [
         "http://ftp.gnu.org/gnu/non-gnu/chinese-fonts-truetype/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0.json",
-      "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": true,
-      "licenseId": "Artistic-1.0",
-      "name": "Artistic License 1.0",
       "reference": "https://spdx.org/licenses/Artistic-1.0.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0.json",
       "referenceNumber": 388,
+      "name": "Artistic License 1.0",
+      "licenseId": "Artistic-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/Artistic-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
+      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Artistic-1.0-cl8",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
+      "referenceNumber": 291,
       "name": "Artistic License 1.0 w/clause 8",
-      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
-      "referenceNumber": 321,
+      "licenseId": "Artistic-1.0-cl8",
       "seeAlso": [
         "https://opensource.org/licenses/Artistic-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-Perl.json",
+      "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Artistic-1.0-Perl",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-Perl.json",
+      "referenceNumber": 20,
       "name": "Artistic License 1.0 (Perl)",
-      "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
-      "referenceNumber": 652,
+      "licenseId": "Artistic-1.0-Perl",
       "seeAlso": [
         "http://dev.perl.org/licenses/artistic.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
+      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Artistic-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
+      "referenceNumber": 217,
       "name": "Artistic License 2.0",
-      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
-      "referenceNumber": 355,
+      "licenseId": "Artistic-2.0",
       "seeAlso": [
         "http://www.perlfoundation.org/artistic_license_2_0",
         "https://www.perlfoundation.org/artistic-license-20.html",
         "https://opensource.org/licenses/artistic-license-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.j=
son",
+      "reference": "https://spdx.org/licenses/Artistic-dist.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ASWF-Digital-Assets-1.0",
-      "name": "ASWF Digital Assets License version 1.0",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-dist.json",
+      "referenceNumber": 511,
+      "name": "Artistic License 1.0 (dist)",
+      "licenseId": "Artistic-dist",
+      "seeAlso": [
+        "https://github.com/pexip/os-perl/blob/833cf4c86cc465ccfc627ff16=
db67e783156a248/debian/copyright#L2720-L2845"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Aspell-RU.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Aspell-RU.json",
+      "referenceNumber": 231,
+      "name": "Aspell Russian License",
+      "licenseId": "Aspell-RU",
+      "seeAlso": [
+        "https://ftp.gnu.org/gnu/aspell/dict/ru/aspell6-ru-0.99f7-1.tar.=
bz2"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.ht=
ml",
-      "referenceNumber": 330,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.j=
son",
+      "referenceNumber": 340,
+      "name": "ASWF Digital Assets License version 1.0",
+      "licenseId": "ASWF-Digital-Assets-1.0",
       "seeAlso": [
         "https://github.com/AcademySoftwareFoundation/foundation/blob/ma=
in/digital_assets/aswf_digital_assets_license_v1.0.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.j=
son",
+      "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.ht=
ml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ASWF-Digital-Assets-1.1",
+      "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.j=
son",
+      "referenceNumber": 153,
       "name": "ASWF Digital Assets License 1.1",
-      "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.ht=
ml",
-      "referenceNumber": 447,
+      "licenseId": "ASWF-Digital-Assets-1.1",
       "seeAlso": [
         "https://github.com/AcademySoftwareFoundation/foundation/blob/ma=
in/digital_assets/aswf_digital_assets_license_v1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Baekmuk.json",
+      "reference": "https://spdx.org/licenses/Baekmuk.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Baekmuk",
+      "detailsUrl": "https://spdx.org/licenses/Baekmuk.json",
+      "referenceNumber": 311,
       "name": "Baekmuk License",
-      "reference": "https://spdx.org/licenses/Baekmuk.html",
-      "referenceNumber": 436,
+      "licenseId": "Baekmuk",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:Baekmuk?rd=3DLicensing=
/Baekmuk"
-      ]
+        "https://fedoraproject.org/wiki/Licensing:Baekmuk?rd\u003dLicens=
ing/Baekmuk"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Bahyph.json",
+      "reference": "https://spdx.org/licenses/Bahyph.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Bahyph",
+      "detailsUrl": "https://spdx.org/licenses/Bahyph.json",
+      "referenceNumber": 505,
       "name": "Bahyph License",
-      "reference": "https://spdx.org/licenses/Bahyph.html",
-      "referenceNumber": 494,
+      "licenseId": "Bahyph",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Bahyph"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Barr.json",
+      "reference": "https://spdx.org/licenses/Barr.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Barr",
+      "detailsUrl": "https://spdx.org/licenses/Barr.json",
+      "referenceNumber": 420,
       "name": "Barr License",
-      "reference": "https://spdx.org/licenses/Barr.html",
-      "referenceNumber": 48,
+      "licenseId": "Barr",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Barr"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/bcrypt-Solar-Designer.jso=
n",
+      "reference": "https://spdx.org/licenses/bcrypt-Solar-Designer.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "bcrypt-Solar-Designer",
+      "detailsUrl": "https://spdx.org/licenses/bcrypt-Solar-Designer.jso=
n",
+      "referenceNumber": 167,
       "name": "bcrypt Solar Designer License",
-      "reference": "https://spdx.org/licenses/bcrypt-Solar-Designer.html=
",
-      "referenceNumber": 27,
+      "licenseId": "bcrypt-Solar-Designer",
       "seeAlso": [
         "https://github.com/bcrypt-ruby/bcrypt-ruby/blob/master/ext/mri/=
crypt_blowfish.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
+      "reference": "https://spdx.org/licenses/Beerware.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Beerware",
+      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
+      "referenceNumber": 556,
       "name": "Beerware License",
-      "reference": "https://spdx.org/licenses/Beerware.html",
-      "referenceNumber": 143,
+      "licenseId": "Beerware",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Beerware",
         "https://people.freebsd.org/~phk/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Bitstream-Charter.json",
+      "reference": "https://spdx.org/licenses/Bitstream-Charter.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Bitstream-Charter",
+      "detailsUrl": "https://spdx.org/licenses/Bitstream-Charter.json",
+      "referenceNumber": 47,
       "name": "Bitstream Charter Font License",
-      "reference": "https://spdx.org/licenses/Bitstream-Charter.html",
-      "referenceNumber": 560,
+      "licenseId": "Bitstream-Charter",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Charter#License_Text",
         "https://raw.githubusercontent.com/blackhole89/notekit/master/da=
ta/fonts/Charter%20license.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Bitstream-Vera.json",
+      "reference": "https://spdx.org/licenses/Bitstream-Vera.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Bitstream-Vera",
+      "detailsUrl": "https://spdx.org/licenses/Bitstream-Vera.json",
+      "referenceNumber": 208,
       "name": "Bitstream Vera Font License",
-      "reference": "https://spdx.org/licenses/Bitstream-Vera.html",
-      "referenceNumber": 581,
+      "licenseId": "Bitstream-Vera",
       "seeAlso": [
         "https://web.archive.org/web/20080207013128/http://www.gnome.org=
/fonts/",
         "https://docubrain.com/sites/default/files/licenses/bitstream-ve=
ra.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.0.json",
+      "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BitTorrent-1.0",
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.0.json",
+      "referenceNumber": 156,
       "name": "BitTorrent Open Source License v1.0",
-      "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
-      "referenceNumber": 373,
+      "licenseId": "BitTorrent-1.0",
       "seeAlso": [
-        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/license=
s/BitTorrent?r1=3D1.1&r2=3D1.1.1.1&diff_format=3Ds"
-      ]
+        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/license=
s/BitTorrent?r1\u003d1.1\u0026r2\u003d1.1.1.1\u0026diff_format\u003ds"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
+      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "BitTorrent-1.1",
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
+      "referenceNumber": 325,
       "name": "BitTorrent Open Source License v1.1",
-      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
-      "referenceNumber": 288,
+      "licenseId": "BitTorrent-1.1",
       "seeAlso": [
         "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/blessing.json",
+      "reference": "https://spdx.org/licenses/blessing.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "blessing",
+      "detailsUrl": "https://spdx.org/licenses/blessing.json",
+      "referenceNumber": 680,
       "name": "SQLite Blessing",
-      "reference": "https://spdx.org/licenses/blessing.html",
-      "referenceNumber": 469,
+      "licenseId": "blessing",
       "seeAlso": [
-        "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln=3D4-9",
+        "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln\u003d4-=
9",
         "https://sqlite.org/src/artifact/df5091916dbb40e6"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BlueOak-1.0.0.json",
+      "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "BlueOak-1.0.0",
+      "detailsUrl": "https://spdx.org/licenses/BlueOak-1.0.0.json",
+      "referenceNumber": 51,
       "name": "Blue Oak Model License 1.0.0",
-      "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
-      "referenceNumber": 60,
+      "licenseId": "BlueOak-1.0.0",
       "seeAlso": [
         "https://blueoakcouncil.org/license/1.0.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Boehm-GC.json",
+      "reference": "https://spdx.org/licenses/Boehm-GC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Boehm-GC",
+      "detailsUrl": "https://spdx.org/licenses/Boehm-GC.json",
+      "referenceNumber": 92,
       "name": "Boehm-Demers-Weiser GC License",
-      "reference": "https://spdx.org/licenses/Boehm-GC.html",
-      "referenceNumber": 322,
+      "licenseId": "Boehm-GC",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:MIT#Another_Minimal_va=
riant_(found_in_libatomic_ops)",
         "https://github.com/uim/libgcroots/blob/master/COPYING",
         "https://github.com/ivmai/libatomic_ops/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Borceux.json",
+      "reference": "https://spdx.org/licenses/Boehm-GC-without-fee.html"=
,
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Borceux",
-      "name": "Borceux license",
+      "detailsUrl": "https://spdx.org/licenses/Boehm-GC-without-fee.json=
",
+      "referenceNumber": 466,
+      "name": "Boehm-Demers-Weiser GC License (without fee)",
+      "licenseId": "Boehm-GC-without-fee",
+      "seeAlso": [
+        "https://github.com/MariaDB/server/blob/11.6/libmysqld/lib_sql.c=
c"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Borceux.html",
-      "referenceNumber": 552,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Borceux.json",
+      "referenceNumber": 335,
+      "name": "Borceux license",
+      "licenseId": "Borceux",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Borceux"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Brian-Gladman-2-Clause.js=
on",
+      "reference": "https://spdx.org/licenses/Brian-Gladman-2-Clause.htm=
l",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Brian-Gladman-2-Clause",
+      "detailsUrl": "https://spdx.org/licenses/Brian-Gladman-2-Clause.js=
on",
+      "referenceNumber": 198,
       "name": "Brian Gladman 2-Clause License",
-      "reference": "https://spdx.org/licenses/Brian-Gladman-2-Clause.htm=
l",
-      "referenceNumber": 457,
+      "licenseId": "Brian-Gladman-2-Clause",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L140=
-L156",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Brian-Gladman-3-Clause.js=
on",
+      "reference": "https://spdx.org/licenses/Brian-Gladman-3-Clause.htm=
l",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Brian-Gladman-3-Clause",
+      "detailsUrl": "https://spdx.org/licenses/Brian-Gladman-3-Clause.js=
on",
+      "referenceNumber": 675,
       "name": "Brian Gladman 3-Clause License",
-      "reference": "https://spdx.org/licenses/Brian-Gladman-3-Clause.htm=
l",
-      "referenceNumber": 409,
+      "licenseId": "Brian-Gladman-3-Clause",
       "seeAlso": [
         "https://github.com/SWI-Prolog/packages-clib/blob/master/sha1/br=
g_endian.h"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
+      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "BSD-1-Clause",
+      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
+      "referenceNumber": 286,
       "name": "BSD 1-Clause License",
-      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
-      "referenceNumber": 567,
+      "licenseId": "BSD-1-Clause",
       "seeAlso": [
-        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=
=3D326823"
-      ]
+        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=
\u003d326823"
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "BSD-2-Clause",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
+      "referenceNumber": 430,
       "name": "BSD 2-Clause \"Simplified\" License",
-      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
-      "referenceNumber": 264,
+      "licenseId": "BSD-2-Clause",
       "seeAlso": [
         "https://opensource.org/licenses/BSD-2-Clause"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Darwin.json"=
,
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Darwin.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-2-Clause-Darwin",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Darwin.json"=
,
+      "referenceNumber": 477,
       "name": "BSD 2-Clause - Ian Darwin variant",
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-Darwin.html",
-      "referenceNumber": 231,
+      "licenseId": "BSD-2-Clause-Darwin",
       "seeAlso": [
         "https://github.com/file/file/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-first-lines.=
json",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-first-lines.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-2-Clause-first-lines",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-first-lines.=
json",
+      "referenceNumber": 543,
       "name": "BSD 2-Clause - first lines requirement",
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-first-lines.h=
tml",
-      "referenceNumber": 245,
+      "licenseId": "BSD-2-Clause-first-lines",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L664=
-L690",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.json=
",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html"=
,
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "BSD-2-Clause-FreeBSD",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.json=
",
+      "referenceNumber": 622,
       "name": "BSD 2-Clause FreeBSD License",
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html"=
,
-      "referenceNumber": 192,
+      "licenseId": "BSD-2-Clause-FreeBSD",
       "seeAlso": [
         "http://www.freebsd.org/copyright/freebsd-license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.json"=
,
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "BSD-2-Clause-NetBSD",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.json"=
,
+      "referenceNumber": 531,
       "name": "BSD 2-Clause NetBSD License",
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
-      "referenceNumber": 449,
+      "licenseId": "BSD-2-Clause-NetBSD",
       "seeAlso": [
         "http://www.netbsd.org/about/redistribution.html#default"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Patent.json"=
,
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "BSD-2-Clause-Patent",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Patent.json"=
,
+      "referenceNumber": 584,
       "name": "BSD-2-Clause Plus Patent License",
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
-      "referenceNumber": 612,
+      "licenseId": "BSD-2-Clause-Patent",
       "seeAlso": [
         "https://opensource.org/licenses/BSDplusPatent"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Views.json",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-pkgconf-discl=
aimer.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-2-Clause-Views",
-      "name": "BSD 2-Clause with views sentence",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-pkgconf-disc=
laimer.json",
+      "referenceNumber": 624,
+      "name": "BSD 2-Clause pkgconf disclaimer variant",
+      "licenseId": "BSD-2-Clause-pkgconf-disclaimer",
+      "seeAlso": [
+        "https://github.com/audacious-media-player/audacious/blob/master=
/src/audacious/main.cc",
+        "https://github.com/audacious-media-player/audacious/blob/master=
/COPYING"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/BSD-2-Clause-Views.html",
-      "referenceNumber": 657,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Views.json",
+      "referenceNumber": 536,
+      "name": "BSD 2-Clause with views sentence",
+      "licenseId": "BSD-2-Clause-Views",
       "seeAlso": [
         "http://www.freebsd.org/copyright/freebsd-license.html",
         "https://people.freebsd.org/~ivoras/wine/patch-wine-nvidia.sh",
         "https://github.com/protegeproject/protege/blob/master/license.t=
xt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "BSD-3-Clause",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause.json",
+      "referenceNumber": 567,
       "name": "BSD 3-Clause \"New\" or \"Revised\" License",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
-      "referenceNumber": 216,
+      "licenseId": "BSD-3-Clause",
       "seeAlso": [
         "https://opensource.org/licenses/BSD-3-Clause",
         "https://www.eclipse.org/org/documents/edl-v10.php"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-acpica.json"=
,
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-acpica.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-acpica",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-acpica.json"=
,
+      "referenceNumber": 277,
       "name": "BSD 3-Clause acpica variant",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-acpica.html",
-      "referenceNumber": 408,
+      "licenseId": "BSD-3-Clause-acpica",
       "seeAlso": [
         "https://github.com/acpica/acpica/blob/master/source/common/acfi=
leio.c#L119"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Attribution.=
json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-Attribution",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Attribution.=
json",
+      "referenceNumber": 159,
       "name": "BSD with attribution",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.h=
tml",
-      "referenceNumber": 14,
+      "licenseId": "BSD-3-Clause-Attribution",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/BSD_with_Attribution"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-Clear",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
+      "referenceNumber": 259,
       "name": "BSD 3-Clause Clear License",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
-      "referenceNumber": 347,
+      "licenseId": "BSD-3-Clause-Clear",
       "seeAlso": [
         "http://labs.metacarta.com/license-explanation.html#license"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-flex.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-flex.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-flex",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-flex.json",
+      "referenceNumber": 205,
       "name": "BSD 3-Clause Flex variant",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-flex.html",
-      "referenceNumber": 211,
+      "licenseId": "BSD-3-Clause-flex",
       "seeAlso": [
         "https://github.com/westes/flex/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-HP.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-HP.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-HP",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-HP.json",
+      "referenceNumber": 643,
       "name": "Hewlett-Packard BSD variant license",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-HP.html",
-      "referenceNumber": 210,
+      "licenseId": "BSD-3-Clause-HP",
       "seeAlso": [
         "https://github.com/zdohnal/hplip/blob/master/COPYING#L939"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-LBNL.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "BSD-3-Clause-LBNL",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-LBNL.json",
+      "referenceNumber": 6,
       "name": "Lawrence Berkeley National Labs BSD variant license",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
-      "referenceNumber": 597,
+      "licenseId": "BSD-3-Clause-LBNL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/LBNLBSD"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification=
.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.=
html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-Modification",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification=
.json",
+      "referenceNumber": 497,
       "name": "BSD 3-Clause Modification",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.=
html",
-      "referenceNumber": 364,
+      "licenseId": "BSD-3-Clause-Modification",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Varia=
nt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Military-=
License.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-L=
icense.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-No-Military-License",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Military-=
License.json",
+      "referenceNumber": 498,
       "name": "BSD 3-Clause No Military License",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-L=
icense.html",
-      "referenceNumber": 30,
+      "licenseId": "BSD-3-Clause-No-Military-License",
       "seeAlso": [
         "https://gitlab.syncad.com/hive/dhive/-/blob/master/LICENSE",
         "https://github.com/greymass/swift-eosio/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-L=
icense.json",
-      "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-No-Nuclear-License",
-      "name": "BSD 3-Clause No Nuclear License",
       "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Li=
cense.html",
-      "referenceNumber": 21,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-L=
icense.json",
+      "referenceNumber": 108,
+      "name": "BSD 3-Clause No Nuclear License",
+      "licenseId": "BSD-3-Clause-No-Nuclear-License",
       "seeAlso": [
         "http://download.oracle.com/otn-pub/java/licenses/bsd.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-L=
icense-2014.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Li=
cense-2014.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-L=
icense-2014.json",
+      "referenceNumber": 239,
       "name": "BSD 3-Clause No Nuclear License 2014",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Li=
cense-2014.html",
-      "referenceNumber": 543,
+      "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
       "seeAlso": [
         "https://java.net/projects/javaeetutorial/pages/BerkeleyLicense"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-W=
arranty.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Wa=
rranty.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-W=
arranty.json",
+      "referenceNumber": 606,
       "name": "BSD 3-Clause No Nuclear Warranty",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Wa=
rranty.html",
-      "referenceNumber": 402,
+      "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
       "seeAlso": [
-        "https://jogamp.org/git/?p=3Dgluegen.git;a=3Dblob_plain;f=3DLICE=
NSE.txt"
-      ]
+        "https://jogamp.org/git/?p\u003dgluegen.git;a\u003dblob_plain;f\=
u003dLICENSE.txt"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.jso=
n",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-Open-MPI",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.jso=
n",
+      "referenceNumber": 637,
       "name": "BSD 3-Clause Open MPI variant",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html=
",
-      "referenceNumber": 376,
+      "licenseId": "BSD-3-Clause-Open-MPI",
       "seeAlso": [
         "https://www.open-mpi.org/community/license.php",
         "http://www.netlib.org/lapack/LICENSE.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Sun.json",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Sun.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-3-Clause-Sun",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Sun.json",
+      "referenceNumber": 240,
       "name": "BSD 3-Clause Sun Microsystems",
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Sun.html",
-      "referenceNumber": 554,
+      "licenseId": "BSD-3-Clause-Sun",
       "seeAlso": [
         "https://github.com/xmlark/msv/blob/b9316e2f2270bc1606952ea4939e=
c87fbba157f3/xsdlib/src/main/java/com/sun/msv/datatype/regexp/InternalImp=
l.java"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause.json",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "BSD-4-Clause",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause.json",
+      "referenceNumber": 227,
       "name": "BSD 4-Clause \"Original\" or \"Old\" License",
-      "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
-      "referenceNumber": 650,
+      "licenseId": "BSD-4-Clause",
       "seeAlso": [
         "http://directory.fsf.org/wiki/License:BSD_4Clause"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-Shortened.js=
on",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.htm=
l",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-4-Clause-Shortened",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-Shortened.js=
on",
+      "referenceNumber": 269,
       "name": "BSD 4 Clause Shortened",
-      "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.htm=
l",
-      "referenceNumber": 252,
+      "licenseId": "BSD-4-Clause-Shortened",
       "seeAlso": [
         "https://metadata.ftp-master.debian.org/changelogs//main/a/arpwa=
tch/arpwatch_2.1a15-7_copyright"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-4-Clause-UC",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
+      "referenceNumber": 21,
       "name": "BSD-4-Clause (University of California-Specific)",
-      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
-      "referenceNumber": 117,
+      "licenseId": "BSD-4-Clause-UC",
       "seeAlso": [
         "http://www.freebsd.org/copyright/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-4.3RENO.json",
+      "reference": "https://spdx.org/licenses/BSD-4.3RENO.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-4.3RENO",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4.3RENO.json",
+      "referenceNumber": 434,
       "name": "BSD 4.3 RENO License",
-      "reference": "https://spdx.org/licenses/BSD-4.3RENO.html",
-      "referenceNumber": 298,
+      "licenseId": "BSD-4.3RENO",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dl=
ibiberty/strcasecmp.c;h=3D131d81c2ce7881fa48c363dc5bf5fb302c61ce0b;hb=3DH=
EAD",
+        "https://sourceware.org/git/?p\u003dbinutils-gdb.git;a\u003dblob=
;f\u003dlibiberty/strcasecmp.c;h\u003d131d81c2ce7881fa48c363dc5bf5fb302c6=
1ce0b;hb\u003dHEAD",
         "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRI=
GHT#L55-63"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-4.3TAHOE.json",
+      "reference": "https://spdx.org/licenses/BSD-4.3TAHOE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-4.3TAHOE",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4.3TAHOE.json",
+      "referenceNumber": 685,
       "name": "BSD 4.3 TAHOE License",
-      "reference": "https://spdx.org/licenses/BSD-4.3TAHOE.html",
-      "referenceNumber": 0,
+      "licenseId": "BSD-4.3TAHOE",
       "seeAlso": [
         "https://github.com/389ds/389-ds-base/blob/main/ldap/include/sys=
exits-compat.h#L15",
-        "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.te=
xi?id=3Da74c6b4ee49397cf330b333da1042bffa60ed14f#n1788"
-      ]
+        "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.te=
xi?id\u003da74c6b4ee49397cf330b333da1042bffa60ed14f#n1788"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Advertising-Acknowled=
gement.json",
+      "reference": "https://spdx.org/licenses/BSD-Advertising-Acknowledg=
ement.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Advertising-Acknowledgement",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Advertising-Acknowled=
gement.json",
+      "referenceNumber": 345,
       "name": "BSD Advertising Acknowledgement License",
-      "reference": "https://spdx.org/licenses/BSD-Advertising-Acknowledg=
ement.html",
-      "referenceNumber": 423,
+      "licenseId": "BSD-Advertising-Acknowledgement",
       "seeAlso": [
         "https://github.com/python-excel/xlrd/blob/master/LICENSE#L33"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Attribution-HPND-disc=
laimer.json",
+      "reference": "https://spdx.org/licenses/BSD-Attribution-HPND-discl=
aimer.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Attribution-HPND-disclaimer",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Attribution-HPND-disc=
laimer.json",
+      "referenceNumber": 506,
       "name": "BSD with Attribution and HPND disclaimer",
-      "reference": "https://spdx.org/licenses/BSD-Attribution-HPND-discl=
aimer.html",
-      "referenceNumber": 171,
+      "licenseId": "BSD-Attribution-HPND-disclaimer",
       "seeAlso": [
         "https://github.com/cyrusimap/cyrus-sasl/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Inferno-Nettverk.json=
",
+      "reference": "https://spdx.org/licenses/BSD-Inferno-Nettverk.html"=
,
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Inferno-Nettverk",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Inferno-Nettverk.json=
",
+      "referenceNumber": 535,
       "name": "BSD-Inferno-Nettverk",
-      "reference": "https://spdx.org/licenses/BSD-Inferno-Nettverk.html"=
,
-      "referenceNumber": 401,
+      "licenseId": "BSD-Inferno-Nettverk",
       "seeAlso": [
         "https://www.inet.no/dante/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
+      "reference": "https://spdx.org/licenses/BSD-Protection.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Protection",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
+      "referenceNumber": 163,
       "name": "BSD Protection License",
-      "reference": "https://spdx.org/licenses/BSD-Protection.html",
-      "referenceNumber": 403,
+      "licenseId": "BSD-Protection",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Source-beginning-file=
.json",
+      "reference": "https://spdx.org/licenses/BSD-Source-beginning-file.=
html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Source-beginning-file",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Source-beginning-file=
.json",
+      "referenceNumber": 383,
       "name": "BSD Source Code Attribution - beginning of file variant",
-      "reference": "https://spdx.org/licenses/BSD-Source-beginning-file.=
html",
-      "referenceNumber": 97,
+      "licenseId": "BSD-Source-beginning-file",
       "seeAlso": [
         "https://github.com/lattera/freebsd/blob/master/sys/cam/cam.c#L4=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Source-Code.json",
+      "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Source-Code",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Source-Code.json",
+      "referenceNumber": 450,
       "name": "BSD Source Code Attribution",
-      "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
-      "referenceNumber": 22,
+      "licenseId": "BSD-Source-Code",
       "seeAlso": [
         "https://github.com/robbiehanson/CocoaHTTPServer/blob/master/LIC=
ENSE.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Systemics.json",
+      "reference": "https://spdx.org/licenses/BSD-Systemics.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Systemics",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Systemics.json",
+      "referenceNumber": 602,
       "name": "Systemics BSD variant license",
-      "reference": "https://spdx.org/licenses/BSD-Systemics.html",
-      "referenceNumber": 178,
+      "licenseId": "BSD-Systemics",
       "seeAlso": [
         "https://metacpan.org/release/DPARIS/Crypt-DES-2.07/source/COPYR=
IGHT"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSD-Systemics-W3Works.jso=
n",
+      "reference": "https://spdx.org/licenses/BSD-Systemics-W3Works.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BSD-Systemics-W3Works",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Systemics-W3Works.jso=
n",
+      "referenceNumber": 422,
       "name": "Systemics W3Works BSD variant license",
-      "reference": "https://spdx.org/licenses/BSD-Systemics-W3Works.html=
",
-      "referenceNumber": 350,
+      "licenseId": "BSD-Systemics-W3Works",
       "seeAlso": [
         "https://metacpan.org/release/DPARIS/Crypt-Blowfish-2.14/source/=
COPYRIGHT#L7"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
+      "reference": "https://spdx.org/licenses/BSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "BSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
+      "referenceNumber": 130,
       "name": "Boost Software License 1.0",
-      "reference": "https://spdx.org/licenses/BSL-1.0.html",
-      "referenceNumber": 514,
+      "licenseId": "BSL-1.0",
       "seeAlso": [
         "http://www.boost.org/LICENSE_1_0.txt",
         "https://opensource.org/licenses/BSL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/BUSL-1.1.json",
+      "reference": "https://spdx.org/licenses/BUSL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "BUSL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/BUSL-1.1.json",
+      "referenceNumber": 234,
       "name": "Business Source License 1.1",
-      "reference": "https://spdx.org/licenses/BUSL-1.1.html",
-      "referenceNumber": 549,
+      "licenseId": "BUSL-1.1",
       "seeAlso": [
         "https://mariadb.com/bsl11/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.5.json",
+      "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "bzip2-1.0.5",
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.5.json",
+      "referenceNumber": 412,
       "name": "bzip2 and libbzip2 License v1.0.5",
-      "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
-      "referenceNumber": 419,
+      "licenseId": "bzip2-1.0.5",
       "seeAlso": [
         "https://sourceware.org/bzip2/1.0.5/bzip2-manual-1.0.5.html",
         "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
+      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "bzip2-1.0.6",
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
+      "referenceNumber": 243,
       "name": "bzip2 and libbzip2 License v1.0.6",
-      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
-      "referenceNumber": 396,
+      "licenseId": "bzip2-1.0.6",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dbzip2.git;a=3Dblob;f=3DLICENSE;=
hb=3Dbzip2-1.0.6",
+        "https://sourceware.org/git/?p\u003dbzip2.git;a\u003dblob;f\u003=
dLICENSE;hb\u003dbzip2-1.0.6",
         "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html",
         "https://sourceware.org/cgit/valgrind/tree/mpi/libmpiwrap.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
+      "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "C-UDA-1.0",
+      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
+      "referenceNumber": 660,
       "name": "Computational Use of Data Agreement v1.0",
-      "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
-      "referenceNumber": 432,
+      "licenseId": "C-UDA-1.0",
       "seeAlso": [
         "https://github.com/microsoft/Computational-Use-of-Data-Agreemen=
t/blob/master/C-UDA-1.0.md",
         "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
+      "reference": "https://spdx.org/licenses/CAL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CAL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
+      "referenceNumber": 305,
       "name": "Cryptographic Autonomy License 1.0",
-      "reference": "https://spdx.org/licenses/CAL-1.0.html",
-      "referenceNumber": 653,
+      "licenseId": "CAL-1.0",
       "seeAlso": [
         "http://cryptographicautonomylicense.com/license-text.html",
         "https://opensource.org/licenses/CAL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exc=
eption.json",
+      "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exce=
ption.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CAL-1.0-Combined-Work-Exception",
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exc=
eption.json",
+      "referenceNumber": 569,
       "name": "Cryptographic Autonomy License 1.0 (Combined Work Excepti=
on)",
-      "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exce=
ption.html",
-      "referenceNumber": 217,
+      "licenseId": "CAL-1.0-Combined-Work-Exception",
       "seeAlso": [
         "http://cryptographicautonomylicense.com/license-text.html",
         "https://opensource.org/licenses/CAL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Caldera.json",
+      "reference": "https://spdx.org/licenses/Caldera.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Caldera",
+      "detailsUrl": "https://spdx.org/licenses/Caldera.json",
+      "referenceNumber": 483,
       "name": "Caldera License",
-      "reference": "https://spdx.org/licenses/Caldera.html",
-      "referenceNumber": 622,
+      "licenseId": "Caldera",
       "seeAlso": [
         "http://www.lemis.com/grog/UNIX/ancient-source-all.pdf"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Caldera-no-preamble.json"=
,
+      "reference": "https://spdx.org/licenses/Caldera-no-preamble.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Caldera-no-preamble",
+      "detailsUrl": "https://spdx.org/licenses/Caldera-no-preamble.json"=
,
+      "referenceNumber": 401,
       "name": "Caldera License (without preamble)",
-      "reference": "https://spdx.org/licenses/Caldera-no-preamble.html",
-      "referenceNumber": 585,
+      "licenseId": "Caldera-no-preamble",
       "seeAlso": [
         "https://github.com/apache/apr/blob/trunk/LICENSE#L298C6-L298C29=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Catharon.json",
+      "reference": "https://spdx.org/licenses/Catharon.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Catharon",
+      "detailsUrl": "https://spdx.org/licenses/Catharon.json",
+      "referenceNumber": 581,
       "name": "Catharon License",
-      "reference": "https://spdx.org/licenses/Catharon.html",
-      "referenceNumber": 45,
+      "licenseId": "Catharon",
       "seeAlso": [
         "https://github.com/scummvm/scummvm/blob/v2.8.0/LICENSES/Catharo=
nLicense.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CATOSL-1.1.json",
+      "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CATOSL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/CATOSL-1.1.json",
+      "referenceNumber": 97,
       "name": "Computer Associates Trusted Open Source License 1.1",
-      "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
-      "referenceNumber": 193,
+      "licenseId": "CATOSL-1.1",
       "seeAlso": [
         "https://opensource.org/licenses/CATOSL-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-1.0.json",
+      "referenceNumber": 559,
       "name": "Creative Commons Attribution 1.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
-      "referenceNumber": 37,
+      "licenseId": "CC-BY-1.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/1.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
+      "referenceNumber": 441,
       "name": "Creative Commons Attribution 2.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
-      "referenceNumber": 241,
+      "licenseId": "CC-BY-2.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/2.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5.json",
+      "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-2.5",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5.json",
+      "referenceNumber": 292,
       "name": "Creative Commons Attribution 2.5 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
-      "referenceNumber": 129,
+      "licenseId": "CC-BY-2.5",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/2.5/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
+      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-2.5-AU",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
+      "referenceNumber": 126,
       "name": "Creative Commons Attribution 2.5 Australia",
-      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
-      "referenceNumber": 583,
+      "licenseId": "CC-BY-2.5-AU",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/2.5/au/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
+      "referenceNumber": 576,
       "name": "Creative Commons Attribution 3.0 Unported",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
-      "referenceNumber": 302,
+      "licenseId": "CC-BY-3.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AT.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0-AT",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AT.json",
+      "referenceNumber": 107,
       "name": "Creative Commons Attribution 3.0 Austria",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
-      "referenceNumber": 324,
+      "licenseId": "CC-BY-3.0-AT",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/at/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AU.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-AU.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0-AU",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AU.json",
+      "referenceNumber": 648,
       "name": "Creative Commons Attribution 3.0 Australia",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-AU.html",
-      "referenceNumber": 342,
+      "licenseId": "CC-BY-3.0-AU",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/au/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-DE.json",
+      "referenceNumber": 458,
       "name": "Creative Commons Attribution 3.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
-      "referenceNumber": 239,
+      "licenseId": "CC-BY-3.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-IGO.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-IGO.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0-IGO",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-IGO.json",
+      "referenceNumber": 410,
       "name": "Creative Commons Attribution 3.0 IGO",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-IGO.html",
-      "referenceNumber": 19,
+      "licenseId": "CC-BY-3.0-IGO",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/igo/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-NL.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0-NL",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-NL.json",
+      "referenceNumber": 436,
       "name": "Creative Commons Attribution 3.0 Netherlands",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
-      "referenceNumber": 501,
+      "licenseId": "CC-BY-3.0-NL",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/nl/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-US.json",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-3.0-US",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-US.json",
+      "referenceNumber": 366,
       "name": "Creative Commons Attribution 3.0 United States",
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
-      "referenceNumber": 569,
+      "licenseId": "CC-BY-3.0-US",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/us/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-4.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
+      "referenceNumber": 66,
       "name": "Creative Commons Attribution 4.0 International",
-      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
-      "referenceNumber": 265,
+      "licenseId": "CC-BY-4.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by/4.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-1.0.json",
+      "referenceNumber": 428,
       "name": "Creative Commons Attribution Non Commercial 1.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
-      "referenceNumber": 167,
+      "licenseId": "CC-BY-NC-1.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/1.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.0.json",
+      "referenceNumber": 553,
       "name": "Creative Commons Attribution Non Commercial 2.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
-      "referenceNumber": 92,
+      "licenseId": "CC-BY-NC-2.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/2.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.5.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-2.5",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.5.json",
+      "referenceNumber": 49,
       "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
-      "referenceNumber": 253,
+      "licenseId": "CC-BY-NC-2.5",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/2.5/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-3.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0.json",
+      "referenceNumber": 686,
       "name": "Creative Commons Attribution Non Commercial 3.0 Unported"=
,
-      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
-      "referenceNumber": 199,
+      "licenseId": "CC-BY-NC-3.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/3.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.json",
+      "referenceNumber": 324,
       "name": "Creative Commons Attribution Non Commercial 3.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
-      "referenceNumber": 429,
+      "licenseId": "CC-BY-NC-3.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/3.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-4.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
+      "referenceNumber": 560,
       "name": "Creative Commons Attribution Non Commercial 4.0 Internati=
onal",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
-      "referenceNumber": 188,
+      "licenseId": "CC-BY-NC-4.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.json",
+      "referenceNumber": 442,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 1.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
-      "referenceNumber": 365,
+      "licenseId": "CC-BY-NC-ND-1.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd-nc/1.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.json",
+      "referenceNumber": 334,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 2.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
-      "referenceNumber": 416,
+      "licenseId": "CC-BY-NC-ND-2.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/2.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-2.5",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
+      "referenceNumber": 215,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 2.5 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
-      "referenceNumber": 58,
+      "licenseId": "CC-BY-NC-ND-2.5",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-3.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.json",
+      "referenceNumber": 94,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 3.0 Unported",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
-      "referenceNumber": 213,
+      "licenseId": "CC-BY-NC-ND-3.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.json",
+      "referenceNumber": 185,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 3.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
-      "referenceNumber": 84,
+      "licenseId": "CC-BY-NC-ND-3.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/3.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.json"=
,
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-3.0-IGO",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.json"=
,
+      "referenceNumber": 577,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 3.0 IGO",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
-      "referenceNumber": 587,
+      "licenseId": "CC-BY-NC-ND-3.0-IGO",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/3.0/igo/legalcode=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-ND-4.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.json",
+      "referenceNumber": 53,
       "name": "Creative Commons Attribution Non Commercial No Derivative=
s 4.0 International",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
-      "referenceNumber": 296,
+      "licenseId": "CC-BY-NC-ND-4.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.json",
+      "referenceNumber": 510,
       "name": "Creative Commons Attribution Non Commercial Share Alike 1=
.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
-      "referenceNumber": 170,
+      "licenseId": "CC-BY-NC-SA-1.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/1.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.json",
+      "referenceNumber": 199,
       "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
-      "referenceNumber": 484,
+      "licenseId": "CC-BY-NC-SA-2.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-2.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.json",
+      "referenceNumber": 356,
       "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.html",
-      "referenceNumber": 184,
+      "licenseId": "CC-BY-NC-SA-2.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-2.0-FR",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.json",
+      "referenceNumber": 301,
       "name": "Creative Commons Attribution-NonCommercial-ShareAlike 2.0=
 France",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
-      "referenceNumber": 116,
+      "licenseId": "CC-BY-NC-SA-2.0-FR",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/fr/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-2.0-UK",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.json",
+      "referenceNumber": 671,
       "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 England and Wales",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
-      "referenceNumber": 415,
+      "licenseId": "CC-BY-NC-SA-2.0-UK",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.0/uk/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-2.5",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.json",
+      "referenceNumber": 659,
       "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.5 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
-      "referenceNumber": 106,
+      "licenseId": "CC-BY-NC-SA-2.5",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/2.5/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-3.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
+      "referenceNumber": 359,
       "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 Unported",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
-      "referenceNumber": 323,
+      "licenseId": "CC-BY-NC-SA-3.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.json",
+      "referenceNumber": 279,
       "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
-      "referenceNumber": 150,
+      "licenseId": "CC-BY-NC-SA-3.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.json"=
,
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-3.0-IGO",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.json"=
,
+      "referenceNumber": 636,
       "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 IGO",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
-      "referenceNumber": 295,
+      "licenseId": "CC-BY-NC-SA-3.0-IGO",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/3.0/igo/legalcode=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-NC-SA-4.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
+      "referenceNumber": 89,
       "name": "Creative Commons Attribution Non Commercial Share Alike 4=
.0 International",
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
-      "referenceNumber": 351,
+      "licenseId": "CC-BY-NC-SA-4.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-ND-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
+      "referenceNumber": 118,
       "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
-      "referenceNumber": 56,
+      "licenseId": "CC-BY-ND-1.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-ND-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.0.json",
+      "referenceNumber": 587,
       "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
-      "referenceNumber": 640,
+      "licenseId": "CC-BY-ND-2.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.5.json",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-ND-2.5",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.5.json",
+      "referenceNumber": 394,
       "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
-      "referenceNumber": 276,
+      "licenseId": "CC-BY-ND-2.5",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/2.5/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-ND-3.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0.json",
+      "referenceNumber": 457,
       "name": "Creative Commons Attribution No Derivatives 3.0 Unported"=
,
-      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
-      "referenceNumber": 173,
+      "licenseId": "CC-BY-ND-3.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/3.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-ND-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
+      "referenceNumber": 610,
       "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
-      "referenceNumber": 525,
+      "licenseId": "CC-BY-ND-3.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-4.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-ND-4.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-4.0.json",
+      "referenceNumber": 11,
       "name": "Creative Commons Attribution No Derivatives 4.0 Internati=
onal",
-      "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
-      "referenceNumber": 328,
+      "licenseId": "CC-BY-ND-4.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/4.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-1.0.json",
+      "referenceNumber": 384,
       "name": "Creative Commons Attribution Share Alike 1.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
-      "referenceNumber": 453,
+      "licenseId": "CC-BY-SA-1.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/1.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0.json",
+      "referenceNumber": 260,
       "name": "Creative Commons Attribution Share Alike 2.0 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
-      "referenceNumber": 174,
+      "licenseId": "CC-BY-SA-2.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-2.0-UK",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.json",
+      "referenceNumber": 197,
       "name": "Creative Commons Attribution Share Alike 2.0 England and =
Wales",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
-      "referenceNumber": 387,
+      "licenseId": "CC-BY-SA-2.0-UK",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.0/uk/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-2.1-JP",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
+      "referenceNumber": 149,
       "name": "Creative Commons Attribution Share Alike 2.1 Japan",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
-      "referenceNumber": 471,
+      "licenseId": "CC-BY-SA-2.1-JP",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.5.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-2.5",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.5.json",
+      "referenceNumber": 631,
       "name": "Creative Commons Attribution Share Alike 2.5 Generic",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
-      "referenceNumber": 461,
+      "licenseId": "CC-BY-SA-2.5",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/2.5/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-3.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0.json",
+      "referenceNumber": 79,
       "name": "Creative Commons Attribution Share Alike 3.0 Unported",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
-      "referenceNumber": 621,
+      "licenseId": "CC-BY-SA-3.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-3.0-AT",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
+      "referenceNumber": 493,
       "name": "Creative Commons Attribution Share Alike 3.0 Austria",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
-      "referenceNumber": 31,
+      "licenseId": "CC-BY-SA-3.0-AT",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-3.0-DE",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
+      "referenceNumber": 683,
       "name": "Creative Commons Attribution Share Alike 3.0 Germany",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
-      "referenceNumber": 325,
+      "licenseId": "CC-BY-SA-3.0-DE",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-3.0-IGO",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.json",
+      "referenceNumber": 571,
       "name": "Creative Commons Attribution-ShareAlike 3.0 IGO",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.html",
-      "referenceNumber": 20,
+      "licenseId": "CC-BY-SA-3.0-IGO",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/3.0/igo/legalcode"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "CC-BY-SA-4.0",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
+      "referenceNumber": 256,
       "name": "Creative Commons Attribution Share Alike 4.0 Internationa=
l",
-      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
-      "referenceNumber": 155,
+      "licenseId": "CC-BY-SA-4.0",
       "seeAlso": [
         "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
+      "reference": "https://spdx.org/licenses/CC-PDDC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CC-PDDC",
+      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
+      "referenceNumber": 273,
       "name": "Creative Commons Public Domain Dedication and Certificati=
on",
-      "reference": "https://spdx.org/licenses/CC-PDDC.html",
-      "referenceNumber": 349,
+      "licenseId": "CC-PDDC",
       "seeAlso": [
         "https://creativecommons.org/licenses/publicdomain/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-PDM-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "CC0-1.0",
-      "name": "Creative Commons Zero v1.0 Universal",
-      "reference": "https://spdx.org/licenses/CC0-1.0.html",
-      "referenceNumber": 70,
+      "detailsUrl": "https://spdx.org/licenses/CC-PDM-1.0.json",
+      "referenceNumber": 547,
+      "name": "Creative    Commons Public Domain Mark 1.0 Universal",
+      "licenseId": "CC-PDM-1.0",
       "seeAlso": [
-        "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
-      ]
+        "https://creativecommons.org/publicdomain/mark/1.0/",
+        "https://creativecommons.org/share-your-work/cclicenses/"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
+      "reference": "https://spdx.org/licenses/CC-SA-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "CDDL-1.0",
-      "name": "Common Development and Distribution License 1.0",
-      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
-      "referenceNumber": 282,
+      "detailsUrl": "https://spdx.org/licenses/CC-SA-1.0.json",
+      "referenceNumber": 85,
+      "name": "Creative Commons Share Alike 1.0 Generic",
+      "licenseId": "CC-SA-1.0",
       "seeAlso": [
-        "https://opensource.org/licenses/cddl1"
-      ]
+        "https://creativecommons.org/licenses/sa/1.0/legalcode"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
+      "reference": "https://spdx.org/licenses/CC0-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CDDL-1.1",
-      "name": "Common Development and Distribution License 1.1",
-      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
-      "referenceNumber": 130,
+      "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
+      "referenceNumber": 369,
+      "name": "Creative Commons Zero v1.0 Universal",
+      "licenseId": "CC0-1.0",
       "seeAlso": [
-        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
-        "https://javaee.github.io/glassfish/LICENSE"
-      ]
+        "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CDL-1.0.json",
+      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CDL-1.0",
-      "name": "Common Documentation License 1.0",
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
+      "referenceNumber": 407,
+      "name": "Common Development and Distribution License 1.0",
+      "licenseId": "CDDL-1.0",
+      "seeAlso": [
+        "https://opensource.org/licenses/cddl1"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
+    },
+    {
+      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
+      "referenceNumber": 124,
+      "name": "Common Development and Distribution License 1.1",
+      "licenseId": "CDDL-1.1",
+      "seeAlso": [
+        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
+        "https://javaee.github.io/glassfish/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/CDL-1.0.html",
-      "referenceNumber": 592,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CDL-1.0.json",
+      "referenceNumber": 385,
+      "name": "Common Documentation License 1.0",
+      "licenseId": "CDL-1.0",
       "seeAlso": [
         "http://www.opensource.apple.com/cdl/",
         "https://fedoraproject.org/wiki/Licensing/Common_Documentation_L=
icense",
         "https://www.gnu.org/licenses/license-list.html#ACDL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json"=
,
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CDLA-Permissive-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json"=
,
+      "referenceNumber": 454,
       "name": "Community Data License Agreement Permissive 1.0",
-      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
-      "referenceNumber": 551,
+      "licenseId": "CDLA-Permissive-1.0",
       "seeAlso": [
         "https://cdla.io/permissive-1-0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-2.0.json"=
,
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CDLA-Permissive-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-2.0.json"=
,
+      "referenceNumber": 520,
       "name": "Community Data License Agreement Permissive 2.0",
-      "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
-      "referenceNumber": 319,
+      "licenseId": "CDLA-Permissive-2.0",
       "seeAlso": [
         "https://cdla.dev/permissive-2-0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
+      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CDLA-Sharing-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
+      "referenceNumber": 548,
       "name": "Community Data License Agreement Sharing 1.0",
-      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
-      "referenceNumber": 445,
+      "licenseId": "CDLA-Sharing-1.0",
       "seeAlso": [
         "https://cdla.io/sharing-1-0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
+      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CECILL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
+      "referenceNumber": 468,
       "name": "CeCILL Free Software License Agreement v1.0",
-      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
-      "referenceNumber": 219,
+      "licenseId": "CECILL-1.0",
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
+      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CECILL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
+      "referenceNumber": 100,
       "name": "CeCILL Free Software License Agreement v1.1",
-      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
-      "referenceNumber": 38,
+      "licenseId": "CECILL-1.1",
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CECILL-2.0.json",
+      "reference": "https://spdx.org/licenses/CECILL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "CECILL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.0.json",
+      "referenceNumber": 370,
       "name": "CeCILL Free Software License Agreement v2.0",
-      "reference": "https://spdx.org/licenses/CECILL-2.0.html",
-      "referenceNumber": 73,
+      "licenseId": "CECILL-2.0",
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
+      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CECILL-2.1",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
+      "referenceNumber": 95,
       "name": "CeCILL Free Software License Agreement v2.1",
-      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
-      "referenceNumber": 393,
+      "licenseId": "CECILL-2.1",
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CECILL-B.json",
+      "reference": "https://spdx.org/licenses/CECILL-B.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "CECILL-B",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-B.json",
+      "referenceNumber": 425,
       "name": "CeCILL-B Free Software License Agreement",
-      "reference": "https://spdx.org/licenses/CECILL-B.html",
-      "referenceNumber": 354,
+      "licenseId": "CECILL-B",
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
+      "reference": "https://spdx.org/licenses/CECILL-C.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "CECILL-C",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
+      "referenceNumber": 45,
       "name": "CeCILL-C Free Software License Agreement",
-      "reference": "https://spdx.org/licenses/CECILL-C.html",
-      "referenceNumber": 271,
+      "licenseId": "CECILL-C",
       "seeAlso": [
         "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CERN-OHL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
+      "referenceNumber": 398,
       "name": "CERN Open Hardware Licence v1.1",
-      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
-      "referenceNumber": 32,
+      "licenseId": "CERN-OHL-1.1",
       "seeAlso": [
         "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CERN-OHL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
+      "referenceNumber": 318,
       "name": "CERN Open Hardware Licence v1.2",
-      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
-      "referenceNumber": 95,
+      "licenseId": "CERN-OHL-1.2",
       "seeAlso": [
         "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
+      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CERN-OHL-P-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
+      "referenceNumber": 200,
       "name": "CERN Open Hardware Licence Version 2 - Permissive",
-      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
-      "referenceNumber": 198,
+      "licenseId": "CERN-OHL-P-2.0",
       "seeAlso": [
         "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-S-2.0.json",
+      "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CERN-OHL-S-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-S-2.0.json",
+      "referenceNumber": 175,
       "name": "CERN Open Hardware Licence Version 2 - Strongly Reciproca=
l",
-      "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
-      "referenceNumber": 370,
+      "licenseId": "CERN-OHL-S-2.0",
       "seeAlso": [
         "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
+      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CERN-OHL-W-2.0",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
+      "referenceNumber": 219,
       "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal"=
,
-      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
-      "referenceNumber": 82,
+      "licenseId": "CERN-OHL-W-2.0",
       "seeAlso": [
         "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CFITSIO.json",
+      "reference": "https://spdx.org/licenses/CFITSIO.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CFITSIO",
+      "detailsUrl": "https://spdx.org/licenses/CFITSIO.json",
+      "referenceNumber": 207,
       "name": "CFITSIO License",
-      "reference": "https://spdx.org/licenses/CFITSIO.html",
-      "referenceNumber": 96,
+      "licenseId": "CFITSIO",
       "seeAlso": [
         "https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/f_user/nod=
e9.html",
         "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fv/doc/licen=
se.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/check-cvs.json",
+      "reference": "https://spdx.org/licenses/check-cvs.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "check-cvs",
+      "detailsUrl": "https://spdx.org/licenses/check-cvs.json",
+      "referenceNumber": 377,
       "name": "check-cvs License",
-      "reference": "https://spdx.org/licenses/check-cvs.html",
-      "referenceNumber": 521,
+      "licenseId": "check-cvs",
       "seeAlso": [
-        "http://cvs.savannah.gnu.org/viewvc/cvs/ccvs/contrib/check_cvs.i=
n?revision=3D1.1.4.3&view=3Dmarkup&pathrev=3Dcvs1-11-23#l2"
-      ]
+        "http://cvs.savannah.gnu.org/viewvc/cvs/ccvs/contrib/check_cvs.i=
n?revision\u003d1.1.4.3\u0026view\u003dmarkup\u0026pathrev\u003dcvs1-11-2=
3#l2"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/checkmk.json",
+      "reference": "https://spdx.org/licenses/checkmk.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "checkmk",
+      "detailsUrl": "https://spdx.org/licenses/checkmk.json",
+      "referenceNumber": 389,
       "name": "Checkmk License",
-      "reference": "https://spdx.org/licenses/checkmk.html",
-      "referenceNumber": 272,
+      "licenseId": "checkmk",
       "seeAlso": [
         "https://github.com/libcheck/check/blob/master/checkmk/checkmk.i=
n"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ClArtistic.json",
+      "reference": "https://spdx.org/licenses/ClArtistic.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "ClArtistic",
+      "detailsUrl": "https://spdx.org/licenses/ClArtistic.json",
+      "referenceNumber": 690,
       "name": "Clarified Artistic License",
-      "reference": "https://spdx.org/licenses/ClArtistic.html",
-      "referenceNumber": 66,
+      "licenseId": "ClArtistic",
       "seeAlso": [
         "http://gianluca.dellavedova.org/2011/01/03/clarified-artistic-l=
icense/",
         "http://www.ncftp.com/ncftp/doc/LICENSE.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Clips.json",
+      "reference": "https://spdx.org/licenses/Clips.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Clips",
+      "detailsUrl": "https://spdx.org/licenses/Clips.json",
+      "referenceNumber": 65,
       "name": "Clips License",
-      "reference": "https://spdx.org/licenses/Clips.html",
-      "referenceNumber": 450,
+      "licenseId": "Clips",
       "seeAlso": [
         "https://github.com/DrItanium/maya/blob/master/LICENSE.CLIPS"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CMU-Mach.json",
+      "reference": "https://spdx.org/licenses/CMU-Mach.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CMU-Mach",
+      "detailsUrl": "https://spdx.org/licenses/CMU-Mach.json",
+      "referenceNumber": 178,
       "name": "CMU Mach License",
-      "reference": "https://spdx.org/licenses/CMU-Mach.html",
-      "referenceNumber": 410,
+      "licenseId": "CMU-Mach",
       "seeAlso": [
         "https://www.cs.cmu.edu/~410/licenses.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CMU-Mach-nodoc.json",
+      "reference": "https://spdx.org/licenses/CMU-Mach-nodoc.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CMU-Mach-nodoc",
+      "detailsUrl": "https://spdx.org/licenses/CMU-Mach-nodoc.json",
+      "referenceNumber": 391,
       "name": "CMU    Mach - no notices-in-documentation variant",
-      "reference": "https://spdx.org/licenses/CMU-Mach-nodoc.html",
-      "referenceNumber": 111,
+      "licenseId": "CMU-Mach-nodoc",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L718=
-L728",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
+      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CNRI-Jython",
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
+      "referenceNumber": 138,
       "name": "CNRI Jython License",
-      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
-      "referenceNumber": 509,
+      "licenseId": "CNRI-Jython",
       "seeAlso": [
         "http://www.jython.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Python.json",
+      "reference": "https://spdx.org/licenses/CNRI-Python.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CNRI-Python",
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Python.json",
+      "referenceNumber": 352,
       "name": "CNRI Python License",
-      "reference": "https://spdx.org/licenses/CNRI-Python.html",
-      "referenceNumber": 611,
+      "licenseId": "CNRI-Python",
       "seeAlso": [
         "https://opensource.org/licenses/CNRI-Python"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Python-GPL-Compatibl=
e.json",
+      "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible=
.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CNRI-Python-GPL-Compatible",
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Python-GPL-Compatibl=
e.json",
+      "referenceNumber": 673,
       "name": "CNRI Python Open Source GPL Compatible License Agreement"=
,
-      "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible=
.html",
-      "referenceNumber": 504,
+      "licenseId": "CNRI-Python-GPL-Compatible",
       "seeAlso": [
         "http://www.python.org/download/releases/1.6.1/download_win/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/COIL-1.0.json",
+      "reference": "https://spdx.org/licenses/COIL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "COIL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/COIL-1.0.json",
+      "referenceNumber": 526,
       "name": "Copyfree Open Innovation License",
-      "reference": "https://spdx.org/licenses/COIL-1.0.html",
-      "referenceNumber": 286,
+      "licenseId": "COIL-1.0",
       "seeAlso": [
         "https://coil.apotheon.org/plaintext/01.0.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Community-Spec-1.0.json",
+      "reference": "https://spdx.org/licenses/Community-Spec-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Community-Spec-1.0",
+      "detailsUrl": "https://spdx.org/licenses/Community-Spec-1.0.json",
+      "referenceNumber": 695,
       "name": "Community Specification License 1.0",
-      "reference": "https://spdx.org/licenses/Community-Spec-1.0.html",
-      "referenceNumber": 631,
+      "licenseId": "Community-Spec-1.0",
       "seeAlso": [
         "https://github.com/CommunitySpecification/1.0/blob/master/1._Co=
mmunity_Specification_License-v1.md"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
+      "reference": "https://spdx.org/licenses/Condor-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Condor-1.1",
+      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
+      "referenceNumber": 114,
       "name": "Condor Public License v1.1",
-      "reference": "https://spdx.org/licenses/Condor-1.1.html",
-      "referenceNumber": 251,
+      "licenseId": "Condor-1.1",
       "seeAlso": [
         "http://research.cs.wisc.edu/condor/license.html#condor",
         "http://web.archive.org/web/20111123062036/http://research.cs.wi=
sc.edu/condor/license.html#condor"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.0.json"=
,
+      "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "copyleft-next-0.3.0",
+      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.0.json"=
,
+      "referenceNumber": 122,
       "name": "copyleft-next 0.3.0",
-      "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
-      "referenceNumber": 421,
+      "licenseId": "copyleft-next-0.3.0",
       "seeAlso": [
         "https://github.com/copyleft-next/copyleft-next/blob/master/Rele=
ases/copyleft-next-0.3.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.1.json"=
,
+      "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "copyleft-next-0.3.1",
+      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.1.json"=
,
+      "referenceNumber": 583,
       "name": "copyleft-next 0.3.1",
-      "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
-      "referenceNumber": 119,
+      "licenseId": "copyleft-next-0.3.1",
       "seeAlso": [
         "https://github.com/copyleft-next/copyleft-next/blob/master/Rele=
ases/copyleft-next-0.3.1"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Cornell-Lossless-JPEG.jso=
n",
+      "reference": "https://spdx.org/licenses/Cornell-Lossless-JPEG.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Cornell-Lossless-JPEG",
+      "detailsUrl": "https://spdx.org/licenses/Cornell-Lossless-JPEG.jso=
n",
+      "referenceNumber": 331,
       "name": "Cornell Lossless JPEG License",
-      "reference": "https://spdx.org/licenses/Cornell-Lossless-JPEG.html=
",
-      "referenceNumber": 632,
+      "licenseId": "Cornell-Lossless-JPEG",
       "seeAlso": [
         "https://android.googlesource.com/platform/external/dng_sdk/+/re=
fs/heads/master/source/dng_lossless_jpeg.cpp#16",
         "https://www.mssl.ucl.ac.uk/~mcrw/src/20050920/proto.h",
         "https://gitlab.freedesktop.org/libopenraw/libopenraw/blob/maste=
r/lib/ljpegdecompressor.cpp#L32"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
+      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "CPAL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
+      "referenceNumber": 147,
       "name": "Common Public Attribution License 1.0",
-      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
-      "referenceNumber": 315,
+      "licenseId": "CPAL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/CPAL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
+      "reference": "https://spdx.org/licenses/CPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "CPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
+      "referenceNumber": 367,
       "name": "Common Public License 1.0",
-      "reference": "https://spdx.org/licenses/CPL-1.0.html",
-      "referenceNumber": 135,
+      "licenseId": "CPL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/CPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CPOL-1.02.json",
+      "reference": "https://spdx.org/licenses/CPOL-1.02.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "CPOL-1.02",
+      "detailsUrl": "https://spdx.org/licenses/CPOL-1.02.json",
+      "referenceNumber": 250,
       "name": "Code Project Open License 1.02",
-      "reference": "https://spdx.org/licenses/CPOL-1.02.html",
-      "referenceNumber": 479,
+      "licenseId": "CPOL-1.02",
       "seeAlso": [
         "http://www.codeproject.com/info/cpol10.aspx"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Cronyx.json",
+      "reference": "https://spdx.org/licenses/Cronyx.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Cronyx",
+      "detailsUrl": "https://spdx.org/licenses/Cronyx.json",
+      "referenceNumber": 32,
       "name": "Cronyx License",
-      "reference": "https://spdx.org/licenses/Cronyx.html",
-      "referenceNumber": 377,
+      "licenseId": "Cronyx",
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/font/alias/-/blob/master/CO=
PYING",
         "https://gitlab.freedesktop.org/xorg/font/cronyx-cyrillic/-/blob=
/master/COPYING",
         "https://gitlab.freedesktop.org/xorg/font/misc-cyrillic/-/blob/m=
aster/COPYING",
         "https://gitlab.freedesktop.org/xorg/font/screen-cyrillic/-/blob=
/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Crossword.json",
+      "reference": "https://spdx.org/licenses/Crossword.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Crossword",
+      "detailsUrl": "https://spdx.org/licenses/Crossword.json",
+      "referenceNumber": 347,
       "name": "Crossword License",
-      "reference": "https://spdx.org/licenses/Crossword.html",
-      "referenceNumber": 340,
+      "licenseId": "Crossword",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Crossword"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
+      "reference": "https://spdx.org/licenses/CryptoSwift.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "CrystalStacker",
-      "name": "CrystalStacker License",
+      "detailsUrl": "https://spdx.org/licenses/CryptoSwift.json",
+      "referenceNumber": 323,
+      "name": "CryptoSwift License",
+      "licenseId": "CryptoSwift",
+      "seeAlso": [
+        "https://github.com/krzyzanowskim/CryptoSwift/blob/main/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/CrystalStacker.html",
-      "referenceNumber": 593,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
+      "referenceNumber": 449,
+      "name": "CrystalStacker License",
+      "licenseId": "CrystalStacker",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd=3DLi=
censing/CrystalStacker"
-      ]
+        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd\u003=
dLicensing/CrystalStacker"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/CUA-OPL-1.0.json",
+      "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "CUA-OPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/CUA-OPL-1.0.json",
+      "referenceNumber": 298,
       "name": "CUA Office Public License v1.0",
-      "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
-      "referenceNumber": 553,
+      "licenseId": "CUA-OPL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/CUA-OPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Cube.json",
+      "reference": "https://spdx.org/licenses/Cube.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Cube",
+      "detailsUrl": "https://spdx.org/licenses/Cube.json",
+      "referenceNumber": 140,
       "name": "Cube License",
-      "reference": "https://spdx.org/licenses/Cube.html",
-      "referenceNumber": 404,
+      "licenseId": "Cube",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Cube"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/curl.json",
+      "reference": "https://spdx.org/licenses/curl.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "curl",
+      "detailsUrl": "https://spdx.org/licenses/curl.json",
+      "referenceNumber": 160,
       "name": "curl License",
-      "reference": "https://spdx.org/licenses/curl.html",
-      "referenceNumber": 604,
+      "licenseId": "curl",
       "seeAlso": [
         "https://github.com/bagder/curl/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/cve-tou.json",
+      "reference": "https://spdx.org/licenses/cve-tou.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "cve-tou",
+      "detailsUrl": "https://spdx.org/licenses/cve-tou.json",
+      "referenceNumber": 216,
       "name": "Common Vulnerability Enumeration ToU License",
-      "reference": "https://spdx.org/licenses/cve-tou.html",
-      "referenceNumber": 306,
+      "licenseId": "cve-tou",
       "seeAlso": [
         "https://www.cve.org/Legal/TermsOfUse"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/D-FSL-1.0.json",
+      "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "D-FSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/D-FSL-1.0.json",
+      "referenceNumber": 545,
       "name": "Deutsche Freie Software Lizenz",
-      "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
-      "referenceNumber": 154,
+      "licenseId": "D-FSL-1.0",
       "seeAlso": [
         "http://www.dipp.nrw.de/d-fsl/lizenzen/",
         "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/de/D-FSL-1_0_d=
e.txt",
@@ -2574,5702 +2674,6098 @@
         "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/germa=
n-free-software-license",
         "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL=
-1_0_de.txt/at_download/file",
         "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL=
-1_0_en.txt/at_download/file"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DEC-3-Clause.json",
+      "reference": "https://spdx.org/licenses/DEC-3-Clause.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "DEC-3-Clause",
+      "detailsUrl": "https://spdx.org/licenses/DEC-3-Clause.json",
+      "referenceNumber": 164,
       "name": "DEC 3-Clause License",
-      "reference": "https://spdx.org/licenses/DEC-3-Clause.html",
-      "referenceNumber": 15,
+      "licenseId": "DEC-3-Clause",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type=3Dheads#L239"
-      ]
+        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type\u003dheads#L239"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/diffmark.json",
+      "reference": "https://spdx.org/licenses/diffmark.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "diffmark",
+      "detailsUrl": "https://spdx.org/licenses/diffmark.json",
+      "referenceNumber": 50,
       "name": "diffmark license",
-      "reference": "https://spdx.org/licenses/diffmark.html",
-      "referenceNumber": 292,
+      "licenseId": "diffmark",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/diffmark"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DL-DE-BY-2.0.json",
+      "reference": "https://spdx.org/licenses/DL-DE-BY-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
+      "detailsUrl": "https://spdx.org/licenses/DL-DE-BY-2.0.json",
+      "referenceNumber": 530,
+      "name": "Data licence Germany =E2=80=93 attribution =E2=80=93 vers=
ion 2.0",
       "licenseId": "DL-DE-BY-2.0",
-      "name": "Data licence Germany \u2013 attribution \u2013 version 2.=
0",
-      "reference": "https://spdx.org/licenses/DL-DE-BY-2.0.html",
-      "referenceNumber": 225,
       "seeAlso": [
         "https://www.govdata.de/dl-de/by-2-0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DL-DE-ZERO-2.0.json",
+      "reference": "https://spdx.org/licenses/DL-DE-ZERO-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
+      "detailsUrl": "https://spdx.org/licenses/DL-DE-ZERO-2.0.json",
+      "referenceNumber": 139,
+      "name": "Data licence Germany =E2=80=93 zero =E2=80=93 version 2.0=
",
       "licenseId": "DL-DE-ZERO-2.0",
-      "name": "Data licence Germany \u2013 zero \u2013 version 2.0",
-      "reference": "https://spdx.org/licenses/DL-DE-ZERO-2.0.html",
-      "referenceNumber": 341,
       "seeAlso": [
         "https://www.govdata.de/dl-de/zero-2-0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DOC.json",
+      "reference": "https://spdx.org/licenses/DOC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "DOC",
+      "detailsUrl": "https://spdx.org/licenses/DOC.json",
+      "referenceNumber": 31,
       "name": "DOC License",
-      "reference": "https://spdx.org/licenses/DOC.html",
-      "referenceNumber": 397,
+      "licenseId": "DOC",
       "seeAlso": [
         "http://www.cs.wustl.edu/~schmidt/ACE-copying.html",
         "https://www.dre.vanderbilt.edu/~schmidt/ACE-copying.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Dotseqn.json",
+      "reference": "https://spdx.org/licenses/DocBook-DTD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Dotseqn",
-      "name": "Dotseqn License",
+      "detailsUrl": "https://spdx.org/licenses/DocBook-DTD.json",
+      "referenceNumber": 603,
+      "name": "DocBook DTD License",
+      "licenseId": "DocBook-DTD",
+      "seeAlso": [
+        "http://www.docbook.org/xml/simple/1.1/docbook-simple-1.1.zip"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/DocBook-Schema.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/DocBook-Schema.json",
+      "referenceNumber": 184,
+      "name": "DocBook Schema License",
+      "licenseId": "DocBook-Schema",
+      "seeAlso": [
+        "https://github.com/docbook/xslt10-stylesheets/blob/efd62655c11c=
c8773708df7a843613fa1e932bf8/xsl/assembly/schema/docbook51b7.rnc"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/DocBook-Stylesheet.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/DocBook-Stylesheet.json",
+      "referenceNumber": 494,
+      "name": "DocBook Stylesheet License",
+      "licenseId": "DocBook-Stylesheet",
+      "seeAlso": [
+        "http://www.docbook.org/xml/5.0/docbook-5.0.zip"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/DocBook-XML.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/DocBook-XML.json",
+      "referenceNumber": 672,
+      "name": "DocBook XML License",
+      "licenseId": "DocBook-XML",
+      "seeAlso": [
+        "https://github.com/docbook/xslt10-stylesheets/blob/efd62655c11c=
c8773708df7a843613fa1e932bf8/xsl/COPYING#L27"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Dotseqn.html",
-      "referenceNumber": 132,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Dotseqn.json",
+      "referenceNumber": 257,
+      "name": "Dotseqn License",
+      "licenseId": "Dotseqn",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Dotseqn"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DRL-1.0.json",
+      "reference": "https://spdx.org/licenses/DRL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "DRL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/DRL-1.0.json",
+      "referenceNumber": 446,
       "name": "Detection Rule License 1.0",
-      "reference": "https://spdx.org/licenses/DRL-1.0.html",
-      "referenceNumber": 16,
+      "licenseId": "DRL-1.0",
       "seeAlso": [
         "https://github.com/Neo23x0/sigma/blob/master/LICENSE.Detection.=
Rules.md"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DRL-1.1.json",
+      "reference": "https://spdx.org/licenses/DRL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "DRL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/DRL-1.1.json",
+      "referenceNumber": 135,
       "name": "Detection Rule License 1.1",
-      "reference": "https://spdx.org/licenses/DRL-1.1.html",
-      "referenceNumber": 278,
+      "licenseId": "DRL-1.1",
       "seeAlso": [
         "https://github.com/SigmaHQ/Detection-Rule-License/blob/6ec7fbde=
6101d101b5b5d1fcb8f9b69fbc76c04a/LICENSE.Detection.Rules.md"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/DSDP.json",
+      "reference": "https://spdx.org/licenses/DSDP.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "DSDP",
+      "detailsUrl": "https://spdx.org/licenses/DSDP.json",
+      "referenceNumber": 336,
       "name": "DSDP License",
-      "reference": "https://spdx.org/licenses/DSDP.html",
-      "referenceNumber": 485,
+      "licenseId": "DSDP",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/DSDP"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/dtoa.json",
+      "reference": "https://spdx.org/licenses/dtoa.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "dtoa",
+      "detailsUrl": "https://spdx.org/licenses/dtoa.json",
+      "referenceNumber": 578,
       "name": "David M. Gay dtoa License",
-      "reference": "https://spdx.org/licenses/dtoa.html",
-      "referenceNumber": 358,
+      "licenseId": "dtoa",
       "seeAlso": [
         "https://github.com/SWI-Prolog/swipl-devel/blob/master/src/os/dt=
oa.c",
-        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/stdlib/mprec.h;hb=3DHEAD"
-      ]
+        "https://sourceware.org/git/?p\u003dnewlib-cygwin.git;a\u003dblo=
b;f\u003dnewlib/libc/stdlib/mprec.h;hb\u003dHEAD"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
+      "reference": "https://spdx.org/licenses/dvipdfm.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "dvipdfm",
+      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
+      "referenceNumber": 319,
       "name": "dvipdfm License",
-      "reference": "https://spdx.org/licenses/dvipdfm.html",
-      "referenceNumber": 100,
+      "licenseId": "dvipdfm",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/dvipdfm"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ECL-1.0.json",
+      "reference": "https://spdx.org/licenses/ECL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "ECL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/ECL-1.0.json",
+      "referenceNumber": 641,
       "name": "Educational Community License v1.0",
-      "reference": "https://spdx.org/licenses/ECL-1.0.html",
-      "referenceNumber": 124,
+      "licenseId": "ECL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/ECL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ECL-2.0.json",
+      "reference": "https://spdx.org/licenses/ECL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "ECL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/ECL-2.0.json",
+      "referenceNumber": 338,
       "name": "Educational Community License v2.0",
-      "reference": "https://spdx.org/licenses/ECL-2.0.html",
-      "referenceNumber": 361,
+      "licenseId": "ECL-2.0",
       "seeAlso": [
         "https://opensource.org/licenses/ECL-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/eCos-2.0.json",
+      "reference": "https://spdx.org/licenses/eCos-2.0.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "eCos-2.0",
+      "detailsUrl": "https://spdx.org/licenses/eCos-2.0.json",
+      "referenceNumber": 647,
       "name": "eCos license version 2.0",
-      "reference": "https://spdx.org/licenses/eCos-2.0.html",
-      "referenceNumber": 372,
+      "licenseId": "eCos-2.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/ecos-license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EFL-1.0.json",
+      "reference": "https://spdx.org/licenses/EFL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "EFL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/EFL-1.0.json",
+      "referenceNumber": 145,
       "name": "Eiffel Forum License v1.0",
-      "reference": "https://spdx.org/licenses/EFL-1.0.html",
-      "referenceNumber": 335,
+      "licenseId": "EFL-1.0",
       "seeAlso": [
         "http://www.eiffel-nice.org/license/forum.txt",
         "https://opensource.org/licenses/EFL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EFL-2.0.json",
+      "reference": "https://spdx.org/licenses/EFL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "EFL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/EFL-2.0.json",
+      "referenceNumber": 604,
       "name": "Eiffel Forum License v2.0",
-      "reference": "https://spdx.org/licenses/EFL-2.0.html",
-      "referenceNumber": 88,
+      "licenseId": "EFL-2.0",
       "seeAlso": [
         "http://www.eiffel-nice.org/license/eiffel-forum-license-2.html"=
,
         "https://opensource.org/licenses/EFL-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
+      "reference": "https://spdx.org/licenses/eGenix.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "eGenix",
+      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
+      "referenceNumber": 613,
       "name": "eGenix.com Public License 1.1.0",
-      "reference": "https://spdx.org/licenses/eGenix.html",
-      "referenceNumber": 261,
+      "licenseId": "eGenix",
       "seeAlso": [
         "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.=
pdf",
         "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_Lice=
nse_1.1.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Elastic-2.0.json",
+      "reference": "https://spdx.org/licenses/Elastic-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Elastic-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Elastic-2.0.json",
+      "referenceNumber": 396,
       "name": "Elastic License 2.0",
-      "reference": "https://spdx.org/licenses/Elastic-2.0.html",
-      "referenceNumber": 147,
+      "licenseId": "Elastic-2.0",
       "seeAlso": [
         "https://www.elastic.co/licensing/elastic-license",
         "https://github.com/elastic/elasticsearch/blob/master/licenses/E=
LASTIC-LICENSE-2.0.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Entessa.json",
+      "reference": "https://spdx.org/licenses/Entessa.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Entessa",
+      "detailsUrl": "https://spdx.org/licenses/Entessa.json",
+      "referenceNumber": 40,
       "name": "Entessa Public License v1.0",
-      "reference": "https://spdx.org/licenses/Entessa.html",
-      "referenceNumber": 546,
+      "licenseId": "Entessa",
       "seeAlso": [
         "https://opensource.org/licenses/Entessa"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EPICS.json",
+      "reference": "https://spdx.org/licenses/EPICS.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "EPICS",
+      "detailsUrl": "https://spdx.org/licenses/EPICS.json",
+      "referenceNumber": 158,
       "name": "EPICS Open License",
-      "reference": "https://spdx.org/licenses/EPICS.html",
-      "referenceNumber": 120,
+      "licenseId": "EPICS",
       "seeAlso": [
         "https://epics.anl.gov/license/open.php"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EPL-1.0.json",
+      "reference": "https://spdx.org/licenses/EPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "EPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/EPL-1.0.json",
+      "referenceNumber": 558,
       "name": "Eclipse Public License 1.0",
-      "reference": "https://spdx.org/licenses/EPL-1.0.html",
-      "referenceNumber": 500,
+      "licenseId": "EPL-1.0",
       "seeAlso": [
         "http://www.eclipse.org/legal/epl-v10.html",
         "https://opensource.org/licenses/EPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EPL-2.0.json",
+      "reference": "https://spdx.org/licenses/EPL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "EPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/EPL-2.0.json",
+      "referenceNumber": 326,
       "name": "Eclipse Public License 2.0",
-      "reference": "https://spdx.org/licenses/EPL-2.0.html",
-      "referenceNumber": 407,
+      "licenseId": "EPL-2.0",
       "seeAlso": [
         "https://www.eclipse.org/legal/epl-2.0",
-        "https://www.opensource.org/licenses/EPL-2.0"
-      ]
+        "https://www.opensource.org/licenses/EPL-2.0",
+        "https://www.eclipse.org/legal/epl-v20.html",
+        "https://projects.eclipse.org/license/epl-2.0"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ErlPL-1.1.json",
+      "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ErlPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/ErlPL-1.1.json",
+      "referenceNumber": 541,
       "name": "Erlang Public License v1.1",
-      "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
-      "referenceNumber": 466,
+      "licenseId": "ErlPL-1.1",
       "seeAlso": [
         "http://www.erlang.org/EPLICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
+      "reference": "https://spdx.org/licenses/etalab-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "etalab-2.0",
+      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
+      "referenceNumber": 363,
       "name": "Etalab Open License 2.0",
-      "reference": "https://spdx.org/licenses/etalab-2.0.html",
-      "referenceNumber": 636,
+      "licenseId": "etalab-2.0",
       "seeAlso": [
         "https://github.com/DISIC/politique-de-contribution-open-source/=
blob/master/LICENSE.pdf",
         "https://raw.githubusercontent.com/DISIC/politique-de-contributi=
on-open-source/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EUDatagrid.json",
+      "reference": "https://spdx.org/licenses/EUDatagrid.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "EUDatagrid",
+      "detailsUrl": "https://spdx.org/licenses/EUDatagrid.json",
+      "referenceNumber": 262,
       "name": "EU DataGrid Software License",
-      "reference": "https://spdx.org/licenses/EUDatagrid.html",
-      "referenceNumber": 228,
+      "licenseId": "EUDatagrid",
       "seeAlso": [
         "http://eu-datagrid.web.cern.ch/eu-datagrid/license.html",
         "https://opensource.org/licenses/EUDatagrid"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
+      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "EUPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
+      "referenceNumber": 405,
       "name": "European Union Public License 1.0",
-      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
-      "referenceNumber": 227,
+      "licenseId": "EUPL-1.0",
       "seeAlso": [
         "http://ec.europa.eu/idabc/en/document/7330.html",
-        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id=3D31096"
-      ]
+        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id\u003d31096"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.1.json",
+      "reference": "https://spdx.org/licenses/EUPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "EUPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.1.json",
+      "referenceNumber": 393,
       "name": "European Union Public License 1.1",
-      "reference": "https://spdx.org/licenses/EUPL-1.1.html",
-      "referenceNumber": 266,
+      "licenseId": "EUPL-1.1",
       "seeAlso": [
         "https://joinup.ec.europa.eu/software/page/eupl/licence-eupl",
         "https://joinup.ec.europa.eu/sites/default/files/custom-page/att=
achment/eupl1.1.-licence-en_0.pdf",
         "https://opensource.org/licenses/EUPL-1.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.2.json",
+      "reference": "https://spdx.org/licenses/EUPL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "EUPL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.2.json",
+      "referenceNumber": 596,
       "name": "European Union Public License 1.2",
-      "reference": "https://spdx.org/licenses/EUPL-1.2.html",
-      "referenceNumber": 559,
+      "licenseId": "EUPL-1.2",
       "seeAlso": [
         "https://joinup.ec.europa.eu/page/eupl-text-11-12",
         "https://joinup.ec.europa.eu/sites/default/files/custom-page/att=
achment/eupl_v1.2_en.pdf",
         "https://joinup.ec.europa.eu/sites/default/files/custom-page/att=
achment/2020-03/EUPL-1.2%20EN.txt",
         "https://joinup.ec.europa.eu/sites/default/files/inline-files/EU=
PL%20v1_2%20EN(1).txt",
-        "http://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=3DCELEX=
:32017D0863",
+        "http://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri\u003dCE=
LEX:32017D0863",
         "https://opensource.org/licenses/EUPL-1.2"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
+      "reference": "https://spdx.org/licenses/Eurosym.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Eurosym",
+      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
+      "referenceNumber": 299,
       "name": "Eurosym License",
-      "reference": "https://spdx.org/licenses/Eurosym.html",
-      "referenceNumber": 63,
+      "licenseId": "Eurosym",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Eurosym"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Fair.json",
+      "reference": "https://spdx.org/licenses/Fair.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Fair",
+      "detailsUrl": "https://spdx.org/licenses/Fair.json",
+      "referenceNumber": 190,
       "name": "Fair License",
-      "reference": "https://spdx.org/licenses/Fair.html",
-      "referenceNumber": 570,
+      "licenseId": "Fair",
       "seeAlso": [
         "https://web.archive.org/web/20150926120323/http://fairlicense.o=
rg/",
         "https://opensource.org/licenses/Fair"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FBM.json",
+      "reference": "https://spdx.org/licenses/FBM.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FBM",
+      "detailsUrl": "https://spdx.org/licenses/FBM.json",
+      "referenceNumber": 476,
       "name": "Fuzzy Bitmap License",
-      "reference": "https://spdx.org/licenses/FBM.html",
-      "referenceNumber": 175,
+      "licenseId": "FBM",
       "seeAlso": [
         "https://github.com/SWI-Prolog/packages-xpce/blob/161a40cd82004f=
731ba48024f9d30af388a7edf5/src/img/gifwrite.c#L21-L26"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FDK-AAC.json",
+      "reference": "https://spdx.org/licenses/FDK-AAC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FDK-AAC",
+      "detailsUrl": "https://spdx.org/licenses/FDK-AAC.json",
+      "referenceNumber": 44,
       "name": "Fraunhofer FDK AAC Codec Library",
-      "reference": "https://spdx.org/licenses/FDK-AAC.html",
-      "referenceNumber": 49,
+      "licenseId": "FDK-AAC",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/FDK-AAC",
         "https://directory.fsf.org/wiki/License:Fdk"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Ferguson-Twofish.json",
+      "reference": "https://spdx.org/licenses/Ferguson-Twofish.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Ferguson-Twofish",
+      "detailsUrl": "https://spdx.org/licenses/Ferguson-Twofish.json",
+      "referenceNumber": 662,
       "name": "Ferguson Twofish License",
-      "reference": "https://spdx.org/licenses/Ferguson-Twofish.html",
-      "referenceNumber": 617,
+      "licenseId": "Ferguson-Twofish",
       "seeAlso": [
         "https://github.com/wernerd/ZRTPCPP/blob/6b3cd8e6783642292bad0c2=
1e3e5e5ce45ff3e03/cryptcommon/twofish.c#L113C3-L127"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Frameworx-1.0.json",
+      "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Frameworx-1.0",
+      "detailsUrl": "https://spdx.org/licenses/Frameworx-1.0.json",
+      "referenceNumber": 376,
       "name": "Frameworx Open License 1.0",
-      "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
-      "referenceNumber": 259,
+      "licenseId": "Frameworx-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/Frameworx-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
+      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FreeBSD-DOC",
+      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
+      "referenceNumber": 645,
       "name": "FreeBSD Documentation License",
-      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
-      "referenceNumber": 333,
+      "licenseId": "FreeBSD-DOC",
       "seeAlso": [
         "https://www.freebsd.org/copyright/freebsd-doc-license/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FreeImage.json",
+      "reference": "https://spdx.org/licenses/FreeImage.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FreeImage",
+      "detailsUrl": "https://spdx.org/licenses/FreeImage.json",
+      "referenceNumber": 264,
       "name": "FreeImage Public License v1.0",
-      "reference": "https://spdx.org/licenses/FreeImage.html",
-      "referenceNumber": 181,
+      "licenseId": "FreeImage",
       "seeAlso": [
         "http://freeimage.sourceforge.net/freeimage-license.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FSFAP.json",
+      "reference": "https://spdx.org/licenses/FSFAP.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "FSFAP",
+      "detailsUrl": "https://spdx.org/licenses/FSFAP.json",
+      "referenceNumber": 561,
       "name": "FSF All Permissive License",
-      "reference": "https://spdx.org/licenses/FSFAP.html",
-      "referenceNumber": 36,
+      "licenseId": "FSFAP",
       "seeAlso": [
         "https://www.gnu.org/prep/maintain/html_node/License-Notices-for=
-Other-Files.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FSFAP-no-warranty-disclai=
mer.json",
-      "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FSFAP-no-warranty-disclaimer",
-      "name": "FSF All Permissive License (without Warranty)",
       "reference": "https://spdx.org/licenses/FSFAP-no-warranty-disclaim=
er.html",
-      "referenceNumber": 536,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FSFAP-no-warranty-disclai=
mer.json",
+      "referenceNumber": 629,
+      "name": "FSF All Permissive License (without Warranty)",
+      "licenseId": "FSFAP-no-warranty-disclaimer",
       "seeAlso": [
-        "https://git.savannah.gnu.org/cgit/wget.git/tree/util/trunc.c?h=3D=
v1.21.3&id=3D40747a11e44ced5a8ac628a41f879ced3e2ebce9#n6"
-      ]
+        "https://git.savannah.gnu.org/cgit/wget.git/tree/util/trunc.c?h\=
u003dv1.21.3\u0026id\u003d40747a11e44ced5a8ac628a41f879ced3e2ebce9#n6"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FSFUL.json",
+      "reference": "https://spdx.org/licenses/FSFUL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FSFUL",
+      "detailsUrl": "https://spdx.org/licenses/FSFUL.json",
+      "referenceNumber": 59,
       "name": "FSF Unlimited License",
-      "reference": "https://spdx.org/licenses/FSFUL.html",
-      "referenceNumber": 454,
+      "licenseId": "FSFUL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
+      "reference": "https://spdx.org/licenses/FSFULLR.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FSFULLR",
+      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
+      "referenceNumber": 322,
       "name": "FSF Unlimited License (with License Retention)",
-      "reference": "https://spdx.org/licenses/FSFULLR.html",
-      "referenceNumber": 422,
+      "licenseId": "FSFULLR",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#=
License_Retention_Variant"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FSFULLRWD.json",
+      "reference": "https://spdx.org/licenses/FSFULLRSD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "FSFULLRWD",
-      "name": "FSF Unlimited License (With License Retention and Warrant=
y Disclaimer)",
+      "detailsUrl": "https://spdx.org/licenses/FSFULLRSD.json",
+      "referenceNumber": 300,
+      "name": "FSF Unlimited License (with License Retention and Short D=
isclaimer)",
+      "licenseId": "FSFULLRSD",
+      "seeAlso": [
+        "https://git.savannah.gnu.org/cgit/gnulib.git/tree/modules/COPYI=
NG?id\u003d7b08932179d0d6b017f7df01a2ddf6e096b038e3"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/FSFULLRWD.html",
-      "referenceNumber": 197,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FSFULLRWD.json",
+      "referenceNumber": 245,
+      "name": "FSF Unlimited License (With License Retention and Warrant=
y Disclaimer)",
+      "licenseId": "FSFULLRWD",
       "seeAlso": [
         "https://lists.gnu.org/archive/html/autoconf/2012-04/msg00061.ht=
ml"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/FTL.json",
+      "reference": "https://spdx.org/licenses/FSL-1.1-ALv2.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "FTL",
-      "name": "Freetype Project License",
+      "detailsUrl": "https://spdx.org/licenses/FSL-1.1-ALv2.json",
+      "referenceNumber": 585,
+      "name": "Functional Source License, Version 1.1, ALv2 Future Licen=
se",
+      "licenseId": "FSL-1.1-ALv2",
+      "seeAlso": [
+        "https://fsl.software/FSL-1.1-ALv2.template.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/FSL-1.1-MIT.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FSL-1.1-MIT.json",
+      "referenceNumber": 639,
+      "name": "Functional Source License, Version 1.1, MIT Future Licens=
e",
+      "licenseId": "FSL-1.1-MIT",
+      "seeAlso": [
+        "https://fsl.software/FSL-1.1-MIT.template.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/FTL.html",
-      "referenceNumber": 438,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/FTL.json",
+      "referenceNumber": 417,
+      "name": "Freetype Project License",
+      "licenseId": "FTL",
       "seeAlso": [
         "http://freetype.fis.uniroma2.it/FTL.TXT",
         "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/do=
cs/FTL.TXT",
         "http://gitlab.freedesktop.org/freetype/freetype/-/raw/master/do=
cs/FTL.TXT"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Furuseth.json",
+      "reference": "https://spdx.org/licenses/Furuseth.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Furuseth",
+      "detailsUrl": "https://spdx.org/licenses/Furuseth.json",
+      "referenceNumber": 72,
       "name": "Furuseth License",
-      "reference": "https://spdx.org/licenses/Furuseth.html",
-      "referenceNumber": 380,
+      "licenseId": "Furuseth",
       "seeAlso": [
-        "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRI=
GHT?ref_type=3Dheads#L39-51"
-      ]
+        "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRI=
GHT?ref_type\u003dheads#L39-51"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/fwlw.json",
-      "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "fwlw",
-      "name": "fwlw License",
       "reference": "https://spdx.org/licenses/fwlw.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/fwlw.json",
       "referenceNumber": 529,
+      "name": "fwlw License",
+      "licenseId": "fwlw",
       "seeAlso": [
         "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/fwlw/RE=
ADME"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GCR-docs.json",
+      "reference": "https://spdx.org/licenses/Game-Programming-Gems.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GCR-docs",
-      "name": "Gnome GCR Documentation License",
+      "detailsUrl": "https://spdx.org/licenses/Game-Programming-Gems.jso=
n",
+      "referenceNumber": 246,
+      "name": "Game Programming Gems License",
+      "licenseId": "Game-Programming-Gems",
+      "seeAlso": [
+        "https://github.com/OGRECave/ogre/blob/master/OgreMain/include/O=
greSingleton.h#L28C3-L35C46"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/GCR-docs.html",
-      "referenceNumber": 115,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/GCR-docs.json",
+      "referenceNumber": 270,
+      "name": "Gnome GCR Documentation License",
+      "licenseId": "GCR-docs",
       "seeAlso": [
         "https://github.com/GNOME/gcr/blob/master/docs/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GD.json",
+      "reference": "https://spdx.org/licenses/GD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GD",
+      "detailsUrl": "https://spdx.org/licenses/GD.json",
+      "referenceNumber": 549,
       "name": "GD License",
-      "reference": "https://spdx.org/licenses/GD.html",
-      "referenceNumber": 291,
+      "licenseId": "GD",
       "seeAlso": [
         "https://libgd.github.io/manuals/2.3.0/files/license-txt.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1.json",
+      "reference": "https://spdx.org/licenses/generic-xts.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/generic-xts.json",
+      "referenceNumber": 132,
+      "name": "Generic XTS License",
+      "licenseId": "generic-xts",
+      "seeAlso": [
+        "https://github.com/mhogomchungu/zuluCrypt/blob/master/external_=
libraries/tcplay/generic_xts.c"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/GFDL-1.1.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1.json",
+      "referenceNumber": 533,
       "name": "GNU Free Documentation License v1.1",
-      "reference": "https://spdx.org/licenses/GFDL-1.1.html",
-      "referenceNumber": 589,
+      "licenseId": "GFDL-1.1",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-only.=
json",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1-invariants-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-only.=
json",
+      "referenceNumber": 271,
       "name": "GNU Free Documentation License v1.1 only - invariants",
-      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.h=
tml",
-      "referenceNumber": 307,
+      "licenseId": "GFDL-1.1-invariants-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-la=
ter.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-lat=
er.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-la=
ter.json",
+      "referenceNumber": 538,
       "name": "GNU Free Documentation License v1.1 or later - invariants=
",
-      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-lat=
er.html",
-      "referenceNumber": 98,
+      "licenseId": "GFDL-1.1-invariants-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-on=
ly.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-onl=
y.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1-no-invariants-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-on=
ly.json",
+      "referenceNumber": 609,
       "name": "GNU Free Documentation License v1.1 only - no invariants"=
,
-      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-onl=
y.html",
-      "referenceNumber": 47,
+      "licenseId": "GFDL-1.1-no-invariants-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or=
-later.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-=
later.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1-no-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or=
-later.json",
+      "referenceNumber": 689,
       "name": "GNU Free Documentation License v1.1 or later - no invaria=
nts",
-      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-=
later.html",
-      "referenceNumber": 273,
+      "licenseId": "GFDL-1.1-no-invariants-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-only.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-only.json",
+      "referenceNumber": 456,
       "name": "GNU Free Documentation License v1.1 only",
-      "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
-      "referenceNumber": 626,
+      "licenseId": "GFDL-1.1-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.1-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
+      "referenceNumber": 67,
       "name": "GNU Free Documentation License v1.1 or later",
-      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
-      "referenceNumber": 644,
+      "licenseId": "GFDL-1.1-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2.json",
+      "referenceNumber": 350,
       "name": "GNU Free Documentation License v1.2",
-      "reference": "https://spdx.org/licenses/GFDL-1.2.html",
-      "referenceNumber": 520,
+      "licenseId": "GFDL-1.2",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-only.=
json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2-invariants-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-only.=
json",
+      "referenceNumber": 192,
       "name": "GNU Free Documentation License v1.2 only - invariants",
-      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.h=
tml",
-      "referenceNumber": 495,
+      "licenseId": "GFDL-1.2-invariants-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-or-la=
ter.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-lat=
er.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-or-la=
ter.json",
+      "referenceNumber": 261,
       "name": "GNU Free Documentation License v1.2 or later - invariants=
",
-      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-lat=
er.html",
-      "referenceNumber": 6,
+      "licenseId": "GFDL-1.2-invariants-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-on=
ly.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-onl=
y.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2-no-invariants-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-on=
ly.json",
+      "referenceNumber": 101,
       "name": "GNU Free Documentation License v1.2 only - no invariants"=
,
-      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-onl=
y.html",
-      "referenceNumber": 77,
+      "licenseId": "GFDL-1.2-no-invariants-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or=
-later.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-=
later.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2-no-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or=
-later.json",
+      "referenceNumber": 244,
       "name": "GNU Free Documentation License v1.2 or later - no invaria=
nts",
-      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-=
later.html",
-      "referenceNumber": 279,
+      "licenseId": "GFDL-1.2-no-invariants-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-only.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-only.json",
+      "referenceNumber": 595,
       "name": "GNU Free Documentation License v1.2 only",
-      "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
-      "referenceNumber": 648,
+      "licenseId": "GFDL-1.2-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-or-later.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.2-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-or-later.json",
+      "referenceNumber": 488,
       "name": "GNU Free Documentation License v1.2 or later",
-      "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
-      "referenceNumber": 318,
+      "licenseId": "GFDL-1.2-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
+      "referenceNumber": 652,
       "name": "GNU Free Documentation License v1.3",
-      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
-      "referenceNumber": 287,
+      "licenseId": "GFDL-1.3",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-only.=
json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3-invariants-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-only.=
json",
+      "referenceNumber": 69,
       "name": "GNU Free Documentation License v1.3 only - invariants",
-      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.h=
tml",
-      "referenceNumber": 289,
+      "licenseId": "GFDL-1.3-invariants-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-la=
ter.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-lat=
er.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-la=
ter.json",
+      "referenceNumber": 550,
       "name": "GNU Free Documentation License v1.3 or later - invariants=
",
-      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-lat=
er.html",
-      "referenceNumber": 497,
+      "licenseId": "GFDL-1.3-invariants-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-on=
ly.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-onl=
y.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3-no-invariants-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-on=
ly.json",
+      "referenceNumber": 516,
       "name": "GNU Free Documentation License v1.3 only - no invariants"=
,
-      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-onl=
y.html",
-      "referenceNumber": 254,
+      "licenseId": "GFDL-1.3-no-invariants-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or=
-later.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-=
later.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3-no-invariants-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or=
-later.json",
+      "referenceNumber": 73,
       "name": "GNU Free Documentation License v1.3 or later - no invaria=
nts",
-      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-=
later.html",
-      "referenceNumber": 207,
+      "licenseId": "GFDL-1.3-no-invariants-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3-only",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
+      "referenceNumber": 223,
       "name": "GNU Free Documentation License v1.3 only",
-      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
-      "referenceNumber": 635,
+      "licenseId": "GFDL-1.3-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "GFDL-1.3-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
+      "referenceNumber": 633,
       "name": "GNU Free Documentation License v1.3 or later",
-      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
-      "referenceNumber": 448,
+      "licenseId": "GFDL-1.3-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Giftware.json",
+      "reference": "https://spdx.org/licenses/Giftware.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Giftware",
+      "detailsUrl": "https://spdx.org/licenses/Giftware.json",
+      "referenceNumber": 519,
       "name": "Giftware License",
-      "reference": "https://spdx.org/licenses/Giftware.html",
-      "referenceNumber": 172,
+      "licenseId": "Giftware",
       "seeAlso": [
         "http://liballeg.org/license.html#allegro-4-the-giftware-license=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
+      "reference": "https://spdx.org/licenses/GL2PS.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GL2PS",
+      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
+      "referenceNumber": 360,
       "name": "GL2PS License",
-      "reference": "https://spdx.org/licenses/GL2PS.html",
-      "referenceNumber": 434,
+      "licenseId": "GL2PS",
       "seeAlso": [
         "http://www.geuz.org/gl2ps/COPYING.GL2PS"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Glide.json",
+      "reference": "https://spdx.org/licenses/Glide.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Glide",
+      "detailsUrl": "https://spdx.org/licenses/Glide.json",
+      "referenceNumber": 71,
       "name": "3dfx Glide License",
-      "reference": "https://spdx.org/licenses/Glide.html",
-      "referenceNumber": 189,
+      "licenseId": "Glide",
       "seeAlso": [
         "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Glulxe.json",
+      "reference": "https://spdx.org/licenses/Glulxe.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Glulxe",
+      "detailsUrl": "https://spdx.org/licenses/Glulxe.json",
+      "referenceNumber": 635,
       "name": "Glulxe License",
-      "reference": "https://spdx.org/licenses/Glulxe.html",
-      "referenceNumber": 85,
+      "licenseId": "Glulxe",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Glulxe"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
+      "reference": "https://spdx.org/licenses/GLWTPL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GLWTPL",
+      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
+      "referenceNumber": 27,
       "name": "Good Luck With That Public License",
-      "reference": "https://spdx.org/licenses/GLWTPL.html",
-      "referenceNumber": 190,
+      "licenseId": "GLWTPL",
       "seeAlso": [
         "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb44=
2c0b31e33a65b9d6e85"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
+      "reference": "https://spdx.org/licenses/gnuplot.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "gnuplot",
+      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
+      "referenceNumber": 247,
       "name": "gnuplot License",
-      "reference": "https://spdx.org/licenses/gnuplot.html",
-      "referenceNumber": 110,
+      "licenseId": "gnuplot",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Gnuplot"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0.json",
+      "reference": "https://spdx.org/licenses/GPL-1.0.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0.json",
+      "referenceNumber": 10,
       "name": "GNU General Public License v1.0 only",
-      "reference": "https://spdx.org/licenses/GPL-1.0.html",
-      "referenceNumber": 630,
+      "licenseId": "GPL-1.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0+.json",
+      "reference": "https://spdx.org/licenses/GPL-1.0+.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-1.0+",
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0+.json",
+      "referenceNumber": 177,
       "name": "GNU General Public License v1.0 or later",
-      "reference": "https://spdx.org/licenses/GPL-1.0+.html",
-      "referenceNumber": 26,
+      "licenseId": "GPL-1.0+",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-only.json",
+      "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GPL-1.0-only",
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-only.json",
+      "referenceNumber": 152,
       "name": "GNU General Public License v1.0 only",
-      "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
-      "referenceNumber": 12,
+      "licenseId": "GPL-1.0-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-or-later.json",
+      "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "GPL-1.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-or-later.json",
+      "referenceNumber": 68,
       "name": "GNU General Public License v1.0 or later",
-      "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
-      "referenceNumber": 642,
+      "licenseId": "GPL-1.0-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0.json",
+      "referenceNumber": 688,
       "name": "GNU General Public License v2.0 only",
-      "reference": "https://spdx.org/licenses/GPL-2.0.html",
-      "referenceNumber": 524,
+      "licenseId": "GPL-2.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
         "https://opensource.org/licenses/GPL-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0+.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0+.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-2.0+",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0+.json",
+      "referenceNumber": 144,
       "name": "GNU General Public License v2.0 or later",
-      "reference": "https://spdx.org/licenses/GPL-2.0+.html",
-      "referenceNumber": 25,
+      "licenseId": "GPL-2.0+",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
         "https://opensource.org/licenses/GPL-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-only.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-2.0-only",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-only.json",
+      "referenceNumber": 461,
       "name": "GNU General Public License v2.0 only",
-      "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
-      "referenceNumber": 618,
+      "licenseId": "GPL-2.0-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt",
-        "https://opensource.org/licenses/GPL-2.0"
-      ]
+        "https://opensource.org/licenses/GPL-2.0",
+        "https://github.com/openjdk/jdk/blob/6162e2c5213c5dd7c1127fd9616=
b543efa898962/LICENSE"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-or-later.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-2.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-or-later.json",
+      "referenceNumber": 99,
       "name": "GNU General Public License v2.0 or later",
-      "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
-      "referenceNumber": 164,
+      "licenseId": "GPL-2.0-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
-        "https://opensource.org/licenses/GPL-2.0"
-      ]
+        "https://opensource.org/licenses/GPL-2.0",
+        "https://github.com/openjdk/jdk/blob/6162e2c5213c5dd7c1127fd9616=
b543efa898962/LICENSE"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exc=
eption.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exce=
ption.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-2.0-with-autoconf-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exc=
eption.json",
+      "referenceNumber": 618,
       "name": "GNU General Public License v2.0 w/Autoconf exception",
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exce=
ption.html",
-      "referenceNumber": 146,
+      "licenseId": "GPL-2.0-with-autoconf-exception",
       "seeAlso": [
         "http://ac-archive.sourceforge.net/doc/copyright.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-except=
ion.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-excepti=
on.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-2.0-with-bison-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-except=
ion.json",
+      "referenceNumber": 358,
       "name": "GNU General Public License v2.0 w/Bison exception",
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-excepti=
on.html",
-      "referenceNumber": 374,
+      "licenseId": "GPL-2.0-with-bison-exception",
       "seeAlso": [
-        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id=3D=
193d7c7054ba7197b0789e14965b739162319b5e#n141"
-      ]
+        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id\=
u003d193d7c7054ba7197b0789e14965b739162319b5e#n141"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-classpath-ex=
ception.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-exc=
eption.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-2.0-with-classpath-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-classpath-ex=
ception.json",
+      "referenceNumber": 171,
       "name": "GNU General Public License v2.0 w/Classpath exception",
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-exc=
eption.html",
-      "referenceNumber": 331,
+      "licenseId": "GPL-2.0-with-classpath-exception",
       "seeAlso": [
         "https://www.gnu.org/software/classpath/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-font-excepti=
on.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exceptio=
n.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-2.0-with-font-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-font-excepti=
on.json",
+      "referenceNumber": 151,
       "name": "GNU General Public License v2.0 w/Font exception",
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exceptio=
n.html",
-      "referenceNumber": 542,
+      "licenseId": "GPL-2.0-with-font-exception",
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-faq.html#FontException"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-GCC-exceptio=
n.json",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception=
.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-2.0-with-GCC-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-GCC-exceptio=
n.json",
+      "referenceNumber": 525,
       "name": "GNU General Public License v2.0 w/GCC Runtime Library exc=
eption",
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception=
.html",
-      "referenceNumber": 68,
+      "licenseId": "GPL-2.0-with-GCC-exception",
       "seeAlso": [
-        "https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/libgcc1.c=
;h=3D762f5143fc6eed57b6797c82710f3538aa52b40b;hb=3Dcb143a3ce4fb417c68f5fa=
2691a1b1b1053dfba9#l10"
-      ]
+        "https://gcc.gnu.org/git/?p\u003dgcc.git;a\u003dblob;f\u003dgcc/=
libgcc1.c;h\u003d762f5143fc6eed57b6797c82710f3538aa52b40b;hb\u003dcb143a3=
ce4fb417c68f5fa2691a1b1b1053dfba9#l10"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0.json",
+      "reference": "https://spdx.org/licenses/GPL-3.0.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0.json",
+      "referenceNumber": 503,
       "name": "GNU General Public License v3.0 only",
-      "reference": "https://spdx.org/licenses/GPL-3.0.html",
-      "referenceNumber": 442,
+      "licenseId": "GPL-3.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0+.json",
+      "reference": "https://spdx.org/licenses/GPL-3.0+.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-3.0+",
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0+.json",
+      "referenceNumber": 131,
       "name": "GNU General Public License v3.0 or later",
-      "reference": "https://spdx.org/licenses/GPL-3.0+.html",
-      "referenceNumber": 270,
+      "licenseId": "GPL-3.0+",
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-only.json",
+      "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-3.0-only",
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-only.json",
+      "referenceNumber": 632,
       "name": "GNU General Public License v3.0 only",
-      "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
-      "referenceNumber": 133,
+      "licenseId": "GPL-3.0-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-or-later.json",
+      "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-3.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-or-later.json",
+      "referenceNumber": 467,
       "name": "GNU General Public License v3.0 or later",
-      "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
-      "referenceNumber": 390,
+      "licenseId": "GPL-3.0-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
         "https://opensource.org/licenses/GPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exc=
eption.json",
+      "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exce=
ption.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": false,
-      "licenseId": "GPL-3.0-with-autoconf-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exc=
eption.json",
+      "referenceNumber": 650,
       "name": "GNU General Public License v3.0 w/Autoconf exception",
-      "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exce=
ption.html",
-      "referenceNumber": 458,
+      "licenseId": "GPL-3.0-with-autoconf-exception",
       "seeAlso": [
         "https://www.gnu.org/licenses/autoconf-exception-3.0.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-GCC-exceptio=
n.json",
+      "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception=
.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": true,
-      "licenseId": "GPL-3.0-with-GCC-exception",
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-GCC-exceptio=
n.json",
+      "referenceNumber": 601,
       "name": "GNU General Public License v3.0 w/GCC Runtime Library exc=
eption",
-      "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception=
.html",
-      "referenceNumber": 356,
+      "licenseId": "GPL-3.0-with-GCC-exception",
       "seeAlso": [
         "https://www.gnu.org/licenses/gcc-exception-3.1.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Graphics-Gems.json",
+      "reference": "https://spdx.org/licenses/Graphics-Gems.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Graphics-Gems",
+      "detailsUrl": "https://spdx.org/licenses/Graphics-Gems.json",
+      "referenceNumber": 255,
       "name": "Graphics Gems License",
-      "reference": "https://spdx.org/licenses/Graphics-Gems.html",
-      "referenceNumber": 574,
+      "licenseId": "Graphics-Gems",
       "seeAlso": [
         "https://github.com/erich666/GraphicsGems/blob/master/LICENSE.md=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/gSOAP-1.3b.json",
+      "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "gSOAP-1.3b",
+      "detailsUrl": "https://spdx.org/licenses/gSOAP-1.3b.json",
+      "referenceNumber": 668,
       "name": "gSOAP Public License v1.3b",
-      "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
-      "referenceNumber": 655,
+      "licenseId": "gSOAP-1.3b",
       "seeAlso": [
         "http://www.cs.fsu.edu/~engelen/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/gtkbook.json",
+      "reference": "https://spdx.org/licenses/gtkbook.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "gtkbook",
+      "detailsUrl": "https://spdx.org/licenses/gtkbook.json",
+      "referenceNumber": 465,
       "name": "gtkbook License",
-      "reference": "https://spdx.org/licenses/gtkbook.html",
-      "referenceNumber": 237,
+      "licenseId": "gtkbook",
       "seeAlso": [
         "https://github.com/slogan621/gtkbook",
         "https://github.com/oetiker/rrdtool-1.x/blob/master/src/plbasena=
me.c#L8-L11"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Gutmann.json",
+      "reference": "https://spdx.org/licenses/Gutmann.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Gutmann",
+      "detailsUrl": "https://spdx.org/licenses/Gutmann.json",
+      "referenceNumber": 524,
       "name": "Gutmann License",
-      "reference": "https://spdx.org/licenses/Gutmann.html",
-      "referenceNumber": 441,
+      "licenseId": "Gutmann",
       "seeAlso": [
         "https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
+      "reference": "https://spdx.org/licenses/HaskellReport.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HaskellReport",
+      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
+      "referenceNumber": 605,
       "name": "Haskell Language Report License",
-      "reference": "https://spdx.org/licenses/HaskellReport.html",
-      "referenceNumber": 625,
+      "licenseId": "HaskellReport",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Repor=
t_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/hdparm.json",
+      "reference": "https://spdx.org/licenses/HDF5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "hdparm",
-      "name": "hdparm License",
+      "detailsUrl": "https://spdx.org/licenses/HDF5.json",
+      "referenceNumber": 19,
+      "name": "HDF5 License",
+      "licenseId": "HDF5",
+      "seeAlso": [
+        "https://github.com/HDFGroup/hdf5/?tab\u003dLicense-1-ov-file#re=
adme"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/hdparm.html",
-      "referenceNumber": 81,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/hdparm.json",
+      "referenceNumber": 283,
+      "name": "hdparm License",
+      "licenseId": "hdparm",
       "seeAlso": [
         "https://github.com/Distrotech/hdparm/blob/4517550db29a91420fb2b=
020349523b1b4512df2/LICENSE.TXT"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
+      "reference": "https://spdx.org/licenses/HIDAPI.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Hippocratic-2.1",
-      "name": "Hippocratic License 2.1",
+      "detailsUrl": "https://spdx.org/licenses/HIDAPI.json",
+      "referenceNumber": 310,
+      "name": "HIDAPI License",
+      "licenseId": "HIDAPI",
+      "seeAlso": [
+        "https://github.com/signal11/hidapi/blob/master/LICENSE-orig.txt=
"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
-      "referenceNumber": 299,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
+      "referenceNumber": 87,
+      "name": "Hippocratic License 2.1",
+      "licenseId": "Hippocratic-2.1",
       "seeAlso": [
         "https://firstdonoharm.dev/version/2/1/license.html",
         "https://github.com/EthicalSource/hippocratic-license/blob/58c0e=
646d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HP-1986.json",
+      "reference": "https://spdx.org/licenses/HP-1986.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HP-1986",
+      "detailsUrl": "https://spdx.org/licenses/HP-1986.json",
+      "referenceNumber": 282,
       "name": "Hewlett-Packard 1986 License",
-      "reference": "https://spdx.org/licenses/HP-1986.html",
-      "referenceNumber": 277,
+      "licenseId": "HP-1986",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/machine/hppa/memchr.S;h=3D1cca3e5e8867aa4bffef1f75a5c1bba25c0=
c441e;hb=3DHEAD#l2"
-      ]
+        "https://sourceware.org/git/?p\u003dnewlib-cygwin.git;a\u003dblo=
b;f\u003dnewlib/libc/machine/hppa/memchr.S;h\u003d1cca3e5e8867aa4bffef1f7=
5a5c1bba25c0c441e;hb\u003dHEAD#l2"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HP-1989.json",
+      "reference": "https://spdx.org/licenses/HP-1989.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HP-1989",
+      "detailsUrl": "https://spdx.org/licenses/HP-1989.json",
+      "referenceNumber": 8,
       "name": "Hewlett-Packard 1989 License",
-      "reference": "https://spdx.org/licenses/HP-1989.html",
-      "referenceNumber": 639,
+      "licenseId": "HP-1989",
       "seeAlso": [
         "https://github.com/bleargh45/Data-UUID/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND.json",
+      "reference": "https://spdx.org/licenses/HPND.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "HPND",
+      "detailsUrl": "https://spdx.org/licenses/HPND.json",
+      "referenceNumber": 209,
       "name": "Historical Permission Notice and Disclaimer",
-      "reference": "https://spdx.org/licenses/HPND.html",
-      "referenceNumber": 281,
+      "licenseId": "HPND",
       "seeAlso": [
         "https://opensource.org/licenses/HPND",
         "http://lists.opensource.org/pipermail/license-discuss_lists.ope=
nsource.org/2002-November/006304.html"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-DEC.json",
+      "reference": "https://spdx.org/licenses/HPND-DEC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-DEC",
+      "detailsUrl": "https://spdx.org/licenses/HPND-DEC.json",
+      "referenceNumber": 112,
       "name": "Historical Permission Notice and Disclaimer - DEC variant=
",
-      "reference": "https://spdx.org/licenses/HPND-DEC.html",
-      "referenceNumber": 577,
+      "licenseId": "HPND-DEC",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/app/xkbcomp/-/blob/master/C=
OPYING?ref_type=3Dheads#L69"
-      ]
+        "https://gitlab.freedesktop.org/xorg/app/xkbcomp/-/blob/master/C=
OPYING?ref_type\u003dheads#L69"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-doc.json",
+      "reference": "https://spdx.org/licenses/HPND-doc.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-doc",
+      "detailsUrl": "https://spdx.org/licenses/HPND-doc.json",
+      "referenceNumber": 600,
       "name": "Historical Permission Notice and Disclaimer - documentati=
on variant",
-      "reference": "https://spdx.org/licenses/HPND-doc.html",
-      "referenceNumber": 391,
+      "licenseId": "HPND-doc",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/C=
OPYING?ref_type=3Dheads#L185-197",
-        "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/C=
OPYING?ref_type=3Dheads#L70-77"
-      ]
+        "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/C=
OPYING?ref_type\u003dheads#L185-197",
+        "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/C=
OPYING?ref_type\u003dheads#L70-77"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-doc-sell.json",
+      "reference": "https://spdx.org/licenses/HPND-doc-sell.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-doc-sell",
+      "detailsUrl": "https://spdx.org/licenses/HPND-doc-sell.json",
+      "referenceNumber": 306,
       "name": "Historical Permission Notice and Disclaimer - documentati=
on sell variant",
-      "reference": "https://spdx.org/licenses/HPND-doc-sell.html",
-      "referenceNumber": 163,
+      "licenseId": "HPND-doc-sell",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/C=
OPYING?ref_type=3Dheads#L108-117",
-        "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/C=
OPYING?ref_type=3Dheads#L153-162"
-      ]
+        "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/C=
OPYING?ref_type\u003dheads#L108-117",
+        "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/C=
OPYING?ref_type\u003dheads#L153-162"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-export-US.json",
+      "reference": "https://spdx.org/licenses/HPND-export-US.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-export-US",
+      "detailsUrl": "https://spdx.org/licenses/HPND-export-US.json",
+      "referenceNumber": 459,
       "name": "HPND with US Government export control warning",
-      "reference": "https://spdx.org/licenses/HPND-export-US.html",
-      "referenceNumber": 214,
+      "licenseId": "HPND-export-US",
       "seeAlso": [
         "https://www.kermitproject.org/ck90.html#source"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-export-US-acknowledg=
ement.json",
+      "reference": "https://spdx.org/licenses/HPND-export-US-acknowledge=
ment.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-export-US-acknowledgement",
+      "detailsUrl": "https://spdx.org/licenses/HPND-export-US-acknowledg=
ement.json",
+      "referenceNumber": 487,
       "name": "HPND with US Government export control warning and acknow=
ledgment",
-      "reference": "https://spdx.org/licenses/HPND-export-US-acknowledge=
ment.html",
-      "referenceNumber": 610,
+      "licenseId": "HPND-export-US-acknowledgement",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L831=
-L852",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-export-US-modify.jso=
n",
+      "reference": "https://spdx.org/licenses/HPND-export-US-modify.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-export-US-modify",
+      "detailsUrl": "https://spdx.org/licenses/HPND-export-US-modify.jso=
n",
+      "referenceNumber": 172,
       "name": "HPND with US Government export control warning and modifi=
cation rqmt",
-      "reference": "https://spdx.org/licenses/HPND-export-US-modify.html=
",
-      "referenceNumber": 498,
+      "licenseId": "HPND-export-US-modify",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L115=
7-L1182",
         "https://github.com/pythongssapi/k5test/blob/v0.10.3/K5TEST-LICE=
NSE.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-export2-US.json",
+      "reference": "https://spdx.org/licenses/HPND-export2-US.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-export2-US",
+      "detailsUrl": "https://spdx.org/licenses/HPND-export2-US.json",
+      "referenceNumber": 1,
       "name": "HPND with US Government export control and 2 disclaimers"=
,
-      "reference": "https://spdx.org/licenses/HPND-export2-US.html",
-      "referenceNumber": 33,
+      "licenseId": "HPND-export2-US",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L111=
-L133",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-Fenneberg-Livingston=
.json",
+      "reference": "https://spdx.org/licenses/HPND-Fenneberg-Livingston.=
html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-Fenneberg-Livingston",
+      "detailsUrl": "https://spdx.org/licenses/HPND-Fenneberg-Livingston=
.json",
+      "referenceNumber": 445,
       "name": "Historical Permission Notice and Disclaimer - Fenneberg-L=
ivingston variant",
-      "reference": "https://spdx.org/licenses/HPND-Fenneberg-Livingston.=
html",
-      "referenceNumber": 145,
+      "licenseId": "HPND-Fenneberg-Livingston",
       "seeAlso": [
         "https://github.com/FreeRADIUS/freeradius-client/blob/master/COP=
YRIGHT#L32",
         "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L34"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-INRIA-IMAG.json",
+      "reference": "https://spdx.org/licenses/HPND-INRIA-IMAG.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-INRIA-IMAG",
+      "detailsUrl": "https://spdx.org/licenses/HPND-INRIA-IMAG.json",
+      "referenceNumber": 233,
       "name": "Historical Permission Notice and Disclaimer    - INRIA-IM=
AG variant",
-      "reference": "https://spdx.org/licenses/HPND-INRIA-IMAG.html",
-      "referenceNumber": 614,
+      "licenseId": "HPND-INRIA-IMAG",
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/ipv6cp.c#L7=
5-L83"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-Intel.json",
+      "reference": "https://spdx.org/licenses/HPND-Intel.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-Intel",
+      "detailsUrl": "https://spdx.org/licenses/HPND-Intel.json",
+      "referenceNumber": 228,
       "name": "Historical Permission Notice and Disclaimer - Intel varia=
nt",
-      "reference": "https://spdx.org/licenses/HPND-Intel.html",
-      "referenceNumber": 195,
+      "licenseId": "HPND-Intel",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/machine/i960/memcpy.S;hb=3DHEAD"
-      ]
+        "https://sourceware.org/git/?p\u003dnewlib-cygwin.git;a\u003dblo=
b;f\u003dnewlib/libc/machine/i960/memcpy.S;hb\u003dHEAD"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-Kevlin-Henney.json",
+      "reference": "https://spdx.org/licenses/HPND-Kevlin-Henney.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-Kevlin-Henney",
+      "detailsUrl": "https://spdx.org/licenses/HPND-Kevlin-Henney.json",
+      "referenceNumber": 528,
       "name": "Historical Permission Notice and Disclaimer - Kevlin Henn=
ey variant",
-      "reference": "https://spdx.org/licenses/HPND-Kevlin-Henney.html",
-      "referenceNumber": 428,
+      "licenseId": "HPND-Kevlin-Henney",
       "seeAlso": [
         "https://github.com/mruby/mruby/blob/83d12f8d52522cdb7c8cc46fad3=
4821359f453e6/mrbgems/mruby-dir/src/Win/dirent.c#L127-L140"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-Markus-Kuhn.json",
+      "reference": "https://spdx.org/licenses/HPND-Markus-Kuhn.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-Markus-Kuhn",
+      "detailsUrl": "https://spdx.org/licenses/HPND-Markus-Kuhn.json",
+      "referenceNumber": 623,
       "name": "Historical Permission Notice and Disclaimer - Markus Kuhn=
 variant",
-      "reference": "https://spdx.org/licenses/HPND-Markus-Kuhn.html",
-      "referenceNumber": 8,
+      "licenseId": "HPND-Markus-Kuhn",
       "seeAlso": [
         "https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c",
-        "https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dr=
eadline/readline/support/wcwidth.c;h=3D0f5ec995796f4813abbcf4972aec0378ab=
74722a;hb=3DHEAD#l55"
-      ]
+        "https://sourceware.org/git/?p\u003dbinutils-gdb.git;a\u003dblob=
;f\u003dreadline/readline/support/wcwidth.c;h\u003d0f5ec995796f4813abbcf4=
972aec0378ab74722a;hb\u003dHEAD#l55"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-merchantability-vari=
ant.json",
+      "reference": "https://spdx.org/licenses/HPND-merchantability-varia=
nt.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-merchantability-variant",
+      "detailsUrl": "https://spdx.org/licenses/HPND-merchantability-vari=
ant.json",
+      "referenceNumber": 157,
       "name": "Historical Permission Notice and Disclaimer - merchantabi=
lity variant",
-      "reference": "https://spdx.org/licenses/HPND-merchantability-varia=
nt.html",
-      "referenceNumber": 540,
+      "licenseId": "HPND-merchantability-variant",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/misc/fini.c;hb=3DHEAD"
-      ]
+        "https://sourceware.org/git/?p\u003dnewlib-cygwin.git;a\u003dblo=
b;f\u003dnewlib/libc/misc/fini.c;hb\u003dHEAD"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-MIT-disclaimer.json"=
,
+      "reference": "https://spdx.org/licenses/HPND-MIT-disclaimer.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-MIT-disclaimer",
+      "detailsUrl": "https://spdx.org/licenses/HPND-MIT-disclaimer.json"=
,
+      "referenceNumber": 313,
       "name": "Historical Permission Notice and Disclaimer with MIT disc=
laimer",
-      "reference": "https://spdx.org/licenses/HPND-MIT-disclaimer.html",
-      "referenceNumber": 185,
+      "licenseId": "HPND-MIT-disclaimer",
       "seeAlso": [
         "https://metacpan.org/release/NLNETLABS/Net-DNS-SEC-1.22/source/=
LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-Pbmplus.json",
+      "reference": "https://spdx.org/licenses/HPND-Netrek.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-Pbmplus",
-      "name": "Historical Permission Notice and Disclaimer - Pbmplus var=
iant",
+      "detailsUrl": "https://spdx.org/licenses/HPND-Netrek.json",
+      "referenceNumber": 387,
+      "name": "Historical Permission Notice and Disclaimer - Netrek vari=
ant",
+      "licenseId": "HPND-Netrek",
+      "seeAlso": [],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/HPND-Pbmplus.html",
-      "referenceNumber": 603,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/HPND-Pbmplus.json",
+      "referenceNumber": 339,
+      "name": "Historical Permission Notice and Disclaimer - Pbmplus var=
iant",
+      "licenseId": "HPND-Pbmplus",
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/ne=
tpbm.c#l8"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-=
xserver.json",
+      "reference": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-x=
server.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-sell-MIT-disclaimer-xserver",
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-=
xserver.json",
+      "referenceNumber": 341,
       "name": "Historical Permission Notice and Disclaimer - sell xserve=
r variant with MIT disclaimer",
-      "reference": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-x=
server.html",
-      "referenceNumber": 125,
+      "licenseId": "HPND-sell-MIT-disclaimer-xserver",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type=3Dheads#L1781"
-      ]
+        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type\u003dheads#L1781"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-sell-regexpr.json",
+      "reference": "https://spdx.org/licenses/HPND-sell-regexpr.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-sell-regexpr",
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-regexpr.json",
+      "referenceNumber": 681,
       "name": "Historical Permission Notice and Disclaimer - sell regexp=
r variant",
-      "reference": "https://spdx.org/licenses/HPND-sell-regexpr.html",
-      "referenceNumber": 633,
+      "licenseId": "HPND-sell-regexpr",
       "seeAlso": [
-        "https://gitlab.com/bacula-org/bacula/-/blob/Branch-11.0/bacula/=
LICENSE-FOSS?ref_type=3Dheads#L245"
-      ]
+        "https://gitlab.com/bacula-org/bacula/-/blob/Branch-11.0/bacula/=
LICENSE-FOSS?ref_type\u003dheads#L245"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant.json",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-sell-variant",
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant.json",
+      "referenceNumber": 13,
       "name": "Historical Permission Notice and Disclaimer - sell varian=
t",
-      "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
-      "referenceNumber": 344,
+      "licenseId": "HPND-sell-variant",
       "seeAlso": [
-        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/net/sunrpc/auth_gss/gss_generic_token.c?h=3Dv4.19"
-      ]
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/net/sunrpc/auth_gss/gss_generic_token.c?h\u003dv4.19",
+        "https://github.com/kfish/xsel/blob/master/COPYING"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-dis=
claimer.json",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disc=
laimer.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-sell-variant-MIT-disclaimer",
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-dis=
claimer.json",
+      "referenceNumber": 225,
       "name": "HPND sell variant with MIT disclaimer",
-      "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disc=
laimer.html",
-      "referenceNumber": 160,
+      "licenseId": "HPND-sell-variant-MIT-disclaimer",
       "seeAlso": [
         "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/REA=
DME"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-dis=
claimer-rev.json",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disc=
laimer-rev.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-sell-variant-MIT-disclaimer-rev",
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-dis=
claimer-rev.json",
+      "referenceNumber": 357,
       "name": "HPND sell variant with MIT disclaimer - reverse",
-      "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disc=
laimer-rev.html",
-      "referenceNumber": 609,
+      "licenseId": "HPND-sell-variant-MIT-disclaimer-rev",
       "seeAlso": [
         "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/dyn=
list.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-UC.json",
+      "reference": "https://spdx.org/licenses/HPND-UC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-UC",
+      "detailsUrl": "https://spdx.org/licenses/HPND-UC.json",
+      "referenceNumber": 210,
       "name": "Historical Permission Notice and Disclaimer - University =
of California variant",
-      "reference": "https://spdx.org/licenses/HPND-UC.html",
-      "referenceNumber": 386,
+      "licenseId": "HPND-UC",
       "seeAlso": [
-        "https://core.tcl-lang.org/tk/file?name=3Dcompat/unistd.h"
-      ]
+        "https://core.tcl-lang.org/tk/file?name\u003dcompat/unistd.h"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HPND-UC-export-US.json",
+      "reference": "https://spdx.org/licenses/HPND-UC-export-US.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HPND-UC-export-US",
+      "detailsUrl": "https://spdx.org/licenses/HPND-UC-export-US.json",
+      "referenceNumber": 143,
       "name": "Historical Permission Notice and Disclaimer - University =
of California, US export warning",
-      "reference": "https://spdx.org/licenses/HPND-UC-export-US.html",
-      "referenceNumber": 118,
+      "licenseId": "HPND-UC-export-US",
       "seeAlso": [
         "https://github.com/RTimothyEdwards/magic/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
+      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "HTMLTIDY",
+      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
+      "referenceNumber": 478,
       "name": "HTML Tidy License",
-      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
-      "referenceNumber": 134,
+      "licenseId": "HTMLTIDY",
       "seeAlso": [
         "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/IBM-pibs.json",
+      "reference": "https://spdx.org/licenses/IBM-pibs.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "IBM-pibs",
+      "detailsUrl": "https://spdx.org/licenses/IBM-pibs.json",
+      "referenceNumber": 242,
       "name": "IBM PowerPC Initialization and Boot Software",
-      "reference": "https://spdx.org/licenses/IBM-pibs.html",
-      "referenceNumber": 102,
+      "licenseId": "IBM-pibs",
       "seeAlso": [
-        "http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Darch/powerpc/cp=
u/ppc4xx/miiphy.c;h=3D297155fdafa064b955e53e9832de93bfb0cfb85b;hb=3D9fab4=
bf4cc077c21e43941866f3f2c196f28670d"
-      ]
+        "http://git.denx.de/?p\u003du-boot.git;a\u003dblob;f\u003darch/p=
owerpc/cpu/ppc4xx/miiphy.c;h\u003d297155fdafa064b955e53e9832de93bfb0cfb85=
b;hb\u003d9fab4bf4cc077c21e43941866f3f2c196f28670d"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ICU.json",
+      "reference": "https://spdx.org/licenses/ICU.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "ICU",
+      "detailsUrl": "https://spdx.org/licenses/ICU.json",
+      "referenceNumber": 289,
       "name": "ICU License",
-      "reference": "https://spdx.org/licenses/ICU.html",
-      "referenceNumber": 67,
+      "licenseId": "ICU",
       "seeAlso": [
         "http://source.icu-project.org/repos/icu/icu/trunk/license.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/IEC-Code-Components-EULA.=
json",
+      "reference": "https://spdx.org/licenses/IEC-Code-Components-EULA.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "IEC-Code-Components-EULA",
+      "detailsUrl": "https://spdx.org/licenses/IEC-Code-Components-EULA.=
json",
+      "referenceNumber": 399,
       "name": "IEC    Code Components End-user licence agreement",
-      "reference": "https://spdx.org/licenses/IEC-Code-Components-EULA.h=
tml",
-      "referenceNumber": 359,
+      "licenseId": "IEC-Code-Components-EULA",
       "seeAlso": [
         "https://www.iec.ch/webstore/custserv/pdf/CC-EULA.pdf",
         "https://www.iec.ch/CCv1",
         "https://www.iec.ch/copyright"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/IJG.json",
+      "reference": "https://spdx.org/licenses/IJG.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "IJG",
+      "detailsUrl": "https://spdx.org/licenses/IJG.json",
+      "referenceNumber": 512,
       "name": "Independent JPEG Group License",
-      "reference": "https://spdx.org/licenses/IJG.html",
-      "referenceNumber": 641,
+      "licenseId": "IJG",
       "seeAlso": [
-        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev=3D1.2"
-      ]
+        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev\u003d1.=
2"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/IJG-short.json",
+      "reference": "https://spdx.org/licenses/IJG-short.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "IJG-short",
+      "detailsUrl": "https://spdx.org/licenses/IJG-short.json",
+      "referenceNumber": 694,
       "name": "Independent JPEG Group License - short",
-      "reference": "https://spdx.org/licenses/IJG-short.html",
-      "referenceNumber": 615,
+      "licenseId": "IJG-short",
       "seeAlso": [
         "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/ljpg=
/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ImageMagick.json",
+      "reference": "https://spdx.org/licenses/ImageMagick.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ImageMagick",
+      "detailsUrl": "https://spdx.org/licenses/ImageMagick.json",
+      "referenceNumber": 472,
       "name": "ImageMagick License",
-      "reference": "https://spdx.org/licenses/ImageMagick.html",
-      "referenceNumber": 478,
+      "licenseId": "ImageMagick",
       "seeAlso": [
         "http://www.imagemagick.org/script/license.php"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/iMatix.json",
+      "reference": "https://spdx.org/licenses/iMatix.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "iMatix",
+      "detailsUrl": "https://spdx.org/licenses/iMatix.json",
+      "referenceNumber": 482,
       "name": "iMatix Standard Function Library Agreement",
-      "reference": "https://spdx.org/licenses/iMatix.html",
-      "referenceNumber": 327,
+      "licenseId": "iMatix",
       "seeAlso": [
         "http://legacy.imatix.com/html/sfl/sfl4.htm#license"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Imlib2.json",
+      "reference": "https://spdx.org/licenses/Imlib2.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Imlib2",
+      "detailsUrl": "https://spdx.org/licenses/Imlib2.json",
+      "referenceNumber": 552,
       "name": "Imlib2 License",
-      "reference": "https://spdx.org/licenses/Imlib2.html",
-      "referenceNumber": 169,
+      "licenseId": "Imlib2",
       "seeAlso": [
         "http://trac.enlightenment.org/e/browser/trunk/imlib2/COPYING",
         "https://git.enlightenment.org/legacy/imlib2.git/tree/COPYING"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Info-ZIP.json",
+      "reference": "https://spdx.org/licenses/Info-ZIP.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Info-ZIP",
+      "detailsUrl": "https://spdx.org/licenses/Info-ZIP.json",
+      "referenceNumber": 52,
       "name": "Info-ZIP License",
-      "reference": "https://spdx.org/licenses/Info-ZIP.html",
-      "referenceNumber": 269,
+      "licenseId": "Info-ZIP",
       "seeAlso": [
         "http://www.info-zip.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Inner-Net-2.0.json",
+      "reference": "https://spdx.org/licenses/Inner-Net-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Inner-Net-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Inner-Net-2.0.json",
+      "referenceNumber": 328,
       "name": "Inner Net License v2.0",
-      "reference": "https://spdx.org/licenses/Inner-Net-2.0.html",
-      "referenceNumber": 572,
+      "licenseId": "Inner-Net-2.0",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Inner_Net_License",
-        "https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3DLICENSES=
;h=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD#l207"
-      ]
+        "https://sourceware.org/git/?p\u003dglibc.git;a\u003dblob;f\u003=
dLICENSES;h\u003d530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb\u003dHEAD#l2=
07"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Intel.json",
+      "reference": "https://spdx.org/licenses/InnoSetup.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Intel",
-      "name": "Intel Open Source License",
+      "detailsUrl": "https://spdx.org/licenses/InnoSetup.json",
+      "referenceNumber": 354,
+      "name": "Inno Setup License",
+      "licenseId": "InnoSetup",
+      "seeAlso": [
+        "https://github.com/jrsoftware/issrc/blob/HEAD/license.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Intel.html",
-      "referenceNumber": 623,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Intel.json",
+      "referenceNumber": 419,
+      "name": "Intel Open Source License",
+      "licenseId": "Intel",
       "seeAlso": [
         "https://opensource.org/licenses/Intel"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Intel-ACPI.json",
+      "reference": "https://spdx.org/licenses/Intel-ACPI.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Intel-ACPI",
+      "detailsUrl": "https://spdx.org/licenses/Intel-ACPI.json",
+      "referenceNumber": 206,
       "name": "Intel ACPI Software License Agreement",
-      "reference": "https://spdx.org/licenses/Intel-ACPI.html",
-      "referenceNumber": 571,
+      "licenseId": "Intel-ACPI",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Intel_ACPI_Software_Li=
cense_Agreement"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Interbase-1.0.json",
+      "reference": "https://spdx.org/licenses/Interbase-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Interbase-1.0",
+      "detailsUrl": "https://spdx.org/licenses/Interbase-1.0.json",
+      "referenceNumber": 532,
       "name": "Interbase Public License v1.0",
-      "reference": "https://spdx.org/licenses/Interbase-1.0.html",
-      "referenceNumber": 654,
+      "licenseId": "Interbase-1.0",
       "seeAlso": [
         "https://web.archive.org/web/20060319014854/http://info.borland.=
com/devsupport/interbase/opensource/IPL.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/IPA.json",
+      "reference": "https://spdx.org/licenses/IPA.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "IPA",
+      "detailsUrl": "https://spdx.org/licenses/IPA.json",
+      "referenceNumber": 186,
       "name": "IPA Font License",
-      "reference": "https://spdx.org/licenses/IPA.html",
-      "referenceNumber": 94,
+      "licenseId": "IPA",
       "seeAlso": [
         "https://opensource.org/licenses/IPA"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
+      "reference": "https://spdx.org/licenses/IPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "IPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
+      "referenceNumber": 591,
       "name": "IBM Public License v1.0",
-      "reference": "https://spdx.org/licenses/IPL-1.0.html",
-      "referenceNumber": 332,
+      "licenseId": "IPL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/IPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ISC.json",
+      "reference": "https://spdx.org/licenses/ISC.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "ISC",
+      "detailsUrl": "https://spdx.org/licenses/ISC.json",
+      "referenceNumber": 58,
       "name": "ISC License",
-      "reference": "https://spdx.org/licenses/ISC.html",
-      "referenceNumber": 488,
+      "licenseId": "ISC",
       "seeAlso": [
         "https://www.isc.org/licenses/",
         "https://www.isc.org/downloads/software-support-policy/isc-licen=
se/",
         "https://opensource.org/licenses/ISC"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ISC-Veillard.json",
+      "reference": "https://spdx.org/licenses/ISC-Veillard.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ISC-Veillard",
+      "detailsUrl": "https://spdx.org/licenses/ISC-Veillard.json",
+      "referenceNumber": 317,
       "name": "ISC Veillard variant",
-      "reference": "https://spdx.org/licenses/ISC-Veillard.html",
-      "referenceNumber": 513,
+      "licenseId": "ISC-Veillard",
       "seeAlso": [
         "https://raw.githubusercontent.com/GNOME/libxml2/4c2e7c651f6c2f0=
d1a74f350cbda95f7df3e7017/hash.c",
         "https://github.com/GNOME/libxml2/blob/master/dict.c",
         "https://sourceforge.net/p/ctrio/git/ci/master/tree/README"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Jam.json",
+      "reference": "https://spdx.org/licenses/Jam.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Jam",
+      "detailsUrl": "https://spdx.org/licenses/Jam.json",
+      "referenceNumber": 475,
       "name": "Jam License",
-      "reference": "https://spdx.org/licenses/Jam.html",
-      "referenceNumber": 108,
+      "licenseId": "Jam",
       "seeAlso": [
         "https://www.boost.org/doc/libs/1_35_0/doc/html/jam.html",
         "https://web.archive.org/web/20160330173339/https://swarm.worksh=
op.perforce.com/files/guest/perforce_software/jam/src/README"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/JasPer-2.0.json",
+      "reference": "https://spdx.org/licenses/JasPer-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "JasPer-2.0",
+      "detailsUrl": "https://spdx.org/licenses/JasPer-2.0.json",
+      "referenceNumber": 103,
       "name": "JasPer License",
-      "reference": "https://spdx.org/licenses/JasPer-2.0.html",
-      "referenceNumber": 487,
+      "licenseId": "JasPer-2.0",
       "seeAlso": [
         "http://www.ece.uvic.ca/~mdadams/jasper/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/JPL-image.json",
+      "reference": "https://spdx.org/licenses/jove.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "JPL-image",
-      "name": "JPL Image Use Policy",
+      "detailsUrl": "https://spdx.org/licenses/jove.json",
+      "referenceNumber": 642,
+      "name": "Jove License",
+      "licenseId": "jove",
+      "seeAlso": [
+        "https://github.com/jonmacs/jove/blob/4_17/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/JPL-image.html",
-      "referenceNumber": 363,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/JPL-image.json",
+      "referenceNumber": 321,
+      "name": "JPL Image Use Policy",
+      "licenseId": "JPL-image",
       "seeAlso": [
         "https://www.jpl.nasa.gov/jpl-image-use-policy"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/JPNIC.json",
+      "reference": "https://spdx.org/licenses/JPNIC.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "JPNIC",
+      "detailsUrl": "https://spdx.org/licenses/JPNIC.json",
+      "referenceNumber": 655,
       "name": "Japan Network Information Center License",
-      "reference": "https://spdx.org/licenses/JPNIC.html",
-      "referenceNumber": 83,
+      "licenseId": "JPNIC",
       "seeAlso": [
         "https://gitlab.isc.org/isc-projects/bind9/blob/master/COPYRIGHT=
#L366"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/JSON.json",
+      "reference": "https://spdx.org/licenses/JSON.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "JSON",
+      "detailsUrl": "https://spdx.org/licenses/JSON.json",
+      "referenceNumber": 54,
       "name": "JSON License",
-      "reference": "https://spdx.org/licenses/JSON.html",
-      "referenceNumber": 65,
+      "licenseId": "JSON",
       "seeAlso": [
         "http://www.json.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Kastrup.json",
+      "reference": "https://spdx.org/licenses/Kastrup.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Kastrup",
+      "detailsUrl": "https://spdx.org/licenses/Kastrup.json",
+      "referenceNumber": 491,
       "name": "Kastrup License",
-      "reference": "https://spdx.org/licenses/Kastrup.html",
-      "referenceNumber": 226,
+      "licenseId": "Kastrup",
       "seeAlso": [
         "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/kast=
rup/binhex.dtx"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Kazlib.json",
+      "reference": "https://spdx.org/licenses/Kazlib.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Kazlib",
+      "detailsUrl": "https://spdx.org/licenses/Kazlib.json",
+      "referenceNumber": 312,
       "name": "Kazlib License",
-      "reference": "https://spdx.org/licenses/Kazlib.html",
-      "referenceNumber": 232,
+      "licenseId": "Kazlib",
       "seeAlso": [
-        "http://git.savannah.gnu.org/cgit/kazlib.git/tree/except.c?id=3D=
0062df360c2d17d57f6af19b0e444c51feb99036"
-      ]
+        "http://git.savannah.gnu.org/cgit/kazlib.git/tree/except.c?id\u0=
03d0062df360c2d17d57f6af19b0e444c51feb99036"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Knuth-CTAN.json",
+      "reference": "https://spdx.org/licenses/Knuth-CTAN.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Knuth-CTAN",
+      "detailsUrl": "https://spdx.org/licenses/Knuth-CTAN.json",
+      "referenceNumber": 332,
       "name": "Knuth CTAN License",
-      "reference": "https://spdx.org/licenses/Knuth-CTAN.html",
-      "referenceNumber": 290,
+      "licenseId": "Knuth-CTAN",
       "seeAlso": [
         "https://ctan.org/license/knuth"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LAL-1.2.json",
+      "reference": "https://spdx.org/licenses/LAL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LAL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.2.json",
+      "referenceNumber": 134,
       "name": "Licence Art Libre 1.2",
-      "reference": "https://spdx.org/licenses/LAL-1.2.html",
-      "referenceNumber": 165,
+      "licenseId": "LAL-1.2",
       "seeAlso": [
         "http://artlibre.org/licence/lal/licence-art-libre-12/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
+      "reference": "https://spdx.org/licenses/LAL-1.3.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LAL-1.3",
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
+      "referenceNumber": 521,
       "name": "Licence Art Libre 1.3",
-      "reference": "https://spdx.org/licenses/LAL-1.3.html",
-      "referenceNumber": 600,
+      "licenseId": "LAL-1.3",
       "seeAlso": [
         "https://artlibre.org/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
+      "reference": "https://spdx.org/licenses/Latex2e.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Latex2e",
+      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
+      "referenceNumber": 43,
       "name": "Latex2e License",
-      "reference": "https://spdx.org/licenses/Latex2e.html",
-      "referenceNumber": 439,
+      "licenseId": "Latex2e",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Latex2e"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Latex2e-translated-notice=
.json",
+      "reference": "https://spdx.org/licenses/Latex2e-translated-notice.=
html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Latex2e-translated-notice",
+      "detailsUrl": "https://spdx.org/licenses/Latex2e-translated-notice=
.json",
+      "referenceNumber": 523,
       "name": "Latex2e with translated notice permission",
-      "reference": "https://spdx.org/licenses/Latex2e-translated-notice.=
html",
-      "referenceNumber": 620,
+      "licenseId": "Latex2e-translated-notice",
       "seeAlso": [
-        "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.te=
xi?id=3Da74c6b4ee49397cf330b333da1042bffa60ed14f#n74"
-      ]
+        "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.te=
xi?id\u003da74c6b4ee49397cf330b333da1042bffa60ed14f#n74"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Leptonica.json",
-      "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Leptonica",
-      "name": "Leptonica License",
       "reference": "https://spdx.org/licenses/Leptonica.html",
-      "referenceNumber": 103,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Leptonica.json",
+      "referenceNumber": 137,
+      "name": "Leptonica License",
+      "licenseId": "Leptonica",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Leptonica"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
+      "referenceNumber": 676,
       "name": "GNU Library General Public License v2 only",
-      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
-      "referenceNumber": 353,
+      "licenseId": "LGPL-2.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0+.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.0+",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0+.json",
+      "referenceNumber": 409,
       "name": "GNU Library General Public License v2 or later",
-      "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
-      "referenceNumber": 62,
+      "licenseId": "LGPL-2.0+",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-only.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.0-only",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-only.json",
+      "referenceNumber": 329,
       "name": "GNU Library General Public License v2 only",
-      "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
-      "referenceNumber": 519,
+      "licenseId": "LGPL-2.0-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
+      "referenceNumber": 75,
       "name": "GNU Library General Public License v2 or later",
-      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
-      "referenceNumber": 366,
+      "licenseId": "LGPL-2.0-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.1.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.1",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1.json",
+      "referenceNumber": 677,
       "name": "GNU Lesser General Public License v2.1 only",
-      "reference": "https://spdx.org/licenses/LGPL-2.1.html",
-      "referenceNumber": 656,
+      "licenseId": "LGPL-2.1",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
         "https://opensource.org/licenses/LGPL-2.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1+.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.1+",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1+.json",
+      "referenceNumber": 448,
       "name": "GNU Lesser General Public License v2.1 or later",
-      "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
-      "referenceNumber": 64,
+      "licenseId": "LGPL-2.1+",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
         "https://opensource.org/licenses/LGPL-2.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.1-only",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
+      "referenceNumber": 297,
       "name": "GNU Lesser General Public License v2.1 only",
-      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
-      "referenceNumber": 177,
+      "licenseId": "LGPL-2.1-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
         "https://opensource.org/licenses/LGPL-2.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
+      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-2.1-or-later",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
+      "referenceNumber": 187,
       "name": "GNU Lesser General Public License v2.1 or later",
-      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
-      "referenceNumber": 24,
+      "licenseId": "LGPL-2.1-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
         "https://opensource.org/licenses/LGPL-2.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
+      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
+      "referenceNumber": 9,
       "name": "GNU Lesser General Public License v3.0 only",
-      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
-      "referenceNumber": 578,
+      "licenseId": "LGPL-3.0",
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
         "https://opensource.org/licenses/LGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0+.json",
+      "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-3.0+",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0+.json",
+      "referenceNumber": 169,
       "name": "GNU Lesser General Public License v3.0 or later",
-      "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
-      "referenceNumber": 233,
+      "licenseId": "LGPL-3.0+",
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
         "https://opensource.org/licenses/LGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-only.json",
+      "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-3.0-only",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-only.json",
+      "referenceNumber": 634,
       "name": "GNU Lesser General Public License v3.0 only",
-      "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
-      "referenceNumber": 3,
+      "licenseId": "LGPL-3.0-only",
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
         "https://opensource.org/licenses/LGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-or-later.json",
+      "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LGPL-3.0-or-later",
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-or-later.json",
+      "referenceNumber": 502,
       "name": "GNU Lesser General Public License v3.0 or later",
-      "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
-      "referenceNumber": 262,
+      "licenseId": "LGPL-3.0-or-later",
       "seeAlso": [
         "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
         "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
         "https://opensource.org/licenses/LGPL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LGPLLR.json",
+      "reference": "https://spdx.org/licenses/LGPLLR.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LGPLLR",
+      "detailsUrl": "https://spdx.org/licenses/LGPLLR.json",
+      "referenceNumber": 123,
       "name": "Lesser General Public License For Linguistic Resources",
-      "reference": "https://spdx.org/licenses/LGPLLR.html",
-      "referenceNumber": 477,
+      "licenseId": "LGPLLR",
       "seeAlso": [
         "http://www-igm.univ-mlv.fr/~unitex/lgpllr.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Libpng.json",
+      "reference": "https://spdx.org/licenses/Libpng.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Libpng",
+      "detailsUrl": "https://spdx.org/licenses/Libpng.json",
+      "referenceNumber": 62,
       "name": "libpng License",
-      "reference": "https://spdx.org/licenses/Libpng.html",
-      "referenceNumber": 186,
+      "licenseId": "Libpng",
       "seeAlso": [
         "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/libpng-2.0.json",
+      "reference": "https://spdx.org/licenses/libpng-1.6.35.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "libpng-2.0",
-      "name": "PNG Reference Library version 2",
+      "detailsUrl": "https://spdx.org/licenses/libpng-1.6.35.json",
+      "referenceNumber": 429,
+      "name": "PNG Reference Library License v1 (for libpng 0.5 through =
1.6.35)",
+      "licenseId": "libpng-1.6.35",
+      "seeAlso": [
+        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/libpng-2.0.html",
-      "referenceNumber": 257,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/libpng-2.0.json",
+      "referenceNumber": 226,
+      "name": "PNG Reference Library version 2",
+      "licenseId": "libpng-2.0",
       "seeAlso": [
         "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
+      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "libselinux-1.0",
+      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
+      "referenceNumber": 263,
       "name": "libselinux public domain notice",
-      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
-      "referenceNumber": 556,
+      "licenseId": "libselinux-1.0",
       "seeAlso": [
         "https://github.com/SELinuxProject/selinux/blob/master/libselinu=
x/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
+      "reference": "https://spdx.org/licenses/libtiff.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "libtiff",
+      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
+      "referenceNumber": 35,
       "name": "libtiff License",
-      "reference": "https://spdx.org/licenses/libtiff.html",
-      "referenceNumber": 392,
+      "licenseId": "libtiff",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/libtiff"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/libutil-David-Nugent.json=
",
+      "reference": "https://spdx.org/licenses/libutil-David-Nugent.html"=
,
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "libutil-David-Nugent",
+      "detailsUrl": "https://spdx.org/licenses/libutil-David-Nugent.json=
",
+      "referenceNumber": 402,
       "name": "libutil David Nugent License",
-      "reference": "https://spdx.org/licenses/libutil-David-Nugent.html"=
,
-      "referenceNumber": 400,
+      "licenseId": "libutil-David-Nugent",
       "seeAlso": [
         "http://web.mit.edu/freebsd/head/lib/libutil/login_ok.3",
         "https://cgit.freedesktop.org/libbsd/tree/man/setproctitle.3bsd"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LiLiQ-P-1.1.json",
+      "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-P-1.1.json",
+      "referenceNumber": 232,
+      "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 Permissive version=
 1.1",
       "licenseId": "LiLiQ-P-1.1",
-      "name": "Licence Libre du Qu\u00e9bec \u2013 Permissive version 1.=
1",
-      "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
-      "referenceNumber": 43,
       "seeAlso": [
         "https://forge.gouv.qc.ca/licence/fr/liliq-v1-1/",
         "http://opensource.org/licenses/LiLiQ-P-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LiLiQ-R-1.1.json",
+      "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-R-1.1.json",
+      "referenceNumber": 229,
+      "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 R=C3=A9ciprocit=C3=
=A9 version 1.1",
       "licenseId": "LiLiQ-R-1.1",
-      "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9=
 version 1.1",
-      "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
-      "referenceNumber": 74,
       "seeAlso": [
         "https://www.forge.gouv.qc.ca/participez/licence-logicielle/lice=
nce-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite=
-liliq-r-v1-1/",
         "http://opensource.org/licenses/LiLiQ-R-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.json",
+      "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.json",
+      "referenceNumber": 238,
+      "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 R=C3=A9ciprocit=C3=
=A9 forte version 1.1",
       "licenseId": "LiLiQ-Rplus-1.1",
-      "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9=
 forte version 1.1",
-      "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
-      "referenceNumber": 40,
       "seeAlso": [
         "https://www.forge.gouv.qc.ca/participez/licence-logicielle/lice=
nce-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite=
-forte-liliq-r-v1-1/",
         "http://opensource.org/licenses/LiLiQ-Rplus-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-1-para.js=
on",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-1-para.htm=
l",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Linux-man-pages-1-para",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-1-para.js=
on",
+      "referenceNumber": 78,
       "name": "Linux man-pages - 1 paragraph",
-      "reference": "https://spdx.org/licenses/Linux-man-pages-1-para.htm=
l",
-      "referenceNumber": 339,
+      "licenseId": "Linux-man-pages-1-para",
       "seeAlso": [
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/getcpu.2#n4"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft.=
json",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Linux-man-pages-copyleft",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft.=
json",
+      "referenceNumber": 640,
       "name": "Linux man-pages Copyleft",
-      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft.h=
tml",
-      "referenceNumber": 590,
+      "licenseId": "Linux-man-pages-copyleft",
       "seeAlso": [
         "https://www.kernel.org/doc/man-pages/licenses.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft-=
2-para.json",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-2=
-para.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Linux-man-pages-copyleft-2-para",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft-=
2-para.json",
+      "referenceNumber": 592,
       "name": "Linux man-pages Copyleft - 2 paragraphs",
-      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-2=
-para.html",
-      "referenceNumber": 86,
+      "licenseId": "Linux-man-pages-copyleft-2-para",
       "seeAlso": [
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/move_pages.2#n5",
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/migrate_pages.2#n8"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft-=
var.json",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-v=
ar.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Linux-man-pages-copyleft-var",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft-=
var.json",
+      "referenceNumber": 202,
       "name": "Linux man-pages Copyleft Variant",
-      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-v=
ar.html",
-      "referenceNumber": 337,
+      "licenseId": "Linux-man-pages-copyleft-var",
       "seeAlso": [
         "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/set_mempolicy.2#n5"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Linux-OpenIB.json",
+      "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Linux-OpenIB",
+      "detailsUrl": "https://spdx.org/licenses/Linux-OpenIB.json",
+      "referenceNumber": 513,
       "name": "Linux Kernel Variant of OpenIB.org license",
-      "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
-      "referenceNumber": 613,
+      "licenseId": "Linux-OpenIB",
       "seeAlso": [
         "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/infiniband/core/sa.h"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LOOP.json",
+      "reference": "https://spdx.org/licenses/LOOP.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LOOP",
+      "detailsUrl": "https://spdx.org/licenses/LOOP.json",
+      "referenceNumber": 237,
       "name": "Common Lisp LOOP License",
-      "reference": "https://spdx.org/licenses/LOOP.html",
-      "referenceNumber": 607,
+      "licenseId": "LOOP",
       "seeAlso": [
         "https://gitlab.com/embeddable-common-lisp/ecl/-/blob/develop/sr=
c/lsp/loop.lsp",
-        "http://git.savannah.gnu.org/cgit/gcl.git/tree/gcl/lsp/gcl_loop.=
lsp?h=3DVersion_2_6_13pre",
+        "http://git.savannah.gnu.org/cgit/gcl.git/tree/gcl/lsp/gcl_loop.=
lsp?h\u003dVersion_2_6_13pre",
         "https://sourceforge.net/p/sbcl/sbcl/ci/master/tree/src/code/loo=
p.lisp",
         "https://github.com/cl-adams/adams/blob/master/LICENSE.md",
         "https://github.com/blakemcbride/eclipse-lisp/blob/master/lisp/l=
oop.lisp",
         "https://gitlab.common-lisp.net/cmucl/cmucl/-/blob/master/src/co=
de/loop.lisp"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPD-document.json",
+      "reference": "https://spdx.org/licenses/LPD-document.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LPD-document",
+      "detailsUrl": "https://spdx.org/licenses/LPD-document.json",
+      "referenceNumber": 5,
       "name": "LPD Documentation License",
-      "reference": "https://spdx.org/licenses/LPD-document.html",
-      "referenceNumber": 522,
+      "licenseId": "LPD-document",
       "seeAlso": [
         "https://github.com/Cyan4973/xxHash/blob/dev/doc/xxhash_spec.md"=
,
         "https://www.ietf.org/rfc/rfc1952.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPL-1.0.json",
+      "reference": "https://spdx.org/licenses/LPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "LPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.0.json",
+      "referenceNumber": 136,
       "name": "Lucent Public License Version 1.0",
-      "reference": "https://spdx.org/licenses/LPL-1.0.html",
-      "referenceNumber": 196,
+      "licenseId": "LPL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/LPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
+      "reference": "https://spdx.org/licenses/LPL-1.02.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "LPL-1.02",
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
+      "referenceNumber": 656,
       "name": "Lucent Public License v1.02",
-      "reference": "https://spdx.org/licenses/LPL-1.02.html",
-      "referenceNumber": 69,
+      "licenseId": "LPL-1.02",
       "seeAlso": [
         "http://plan9.bell-labs.com/plan9/license.html",
         "https://opensource.org/licenses/LPL-1.02"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.0.json",
+      "reference": "https://spdx.org/licenses/LPPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LPPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.0.json",
+      "referenceNumber": 63,
       "name": "LaTeX Project Public License v1.0",
-      "reference": "https://spdx.org/licenses/LPPL-1.0.html",
-      "referenceNumber": 215,
+      "licenseId": "LPPL-1.0",
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-0.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
+      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LPPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
+      "referenceNumber": 542,
       "name": "LaTeX Project Public License v1.1",
-      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
-      "referenceNumber": 114,
+      "licenseId": "LPPL-1.1",
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-1.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.2.json",
+      "reference": "https://spdx.org/licenses/LPPL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "LPPL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.2.json",
+      "referenceNumber": 486,
       "name": "LaTeX Project Public License v1.2",
-      "reference": "https://spdx.org/licenses/LPPL-1.2.html",
-      "referenceNumber": 435,
+      "licenseId": "LPPL-1.2",
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-2.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3a.json",
+      "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "LPPL-1.3a",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3a.json",
+      "referenceNumber": 280,
       "name": "LaTeX Project Public License v1.3a",
-      "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
-      "referenceNumber": 18,
+      "licenseId": "LPPL-1.3a",
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-3a.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3c.json",
+      "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "LPPL-1.3c",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3c.json",
+      "referenceNumber": 33,
       "name": "LaTeX Project Public License v1.3c",
-      "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
-      "referenceNumber": 240,
+      "licenseId": "LPPL-1.3c",
       "seeAlso": [
         "http://www.latex-project.org/lppl/lppl-1-3c.txt",
         "https://opensource.org/licenses/LPPL-1.3c"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/lsof.json",
+      "reference": "https://spdx.org/licenses/lsof.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "lsof",
+      "detailsUrl": "https://spdx.org/licenses/lsof.json",
+      "referenceNumber": 563,
       "name": "lsof License",
-      "reference": "https://spdx.org/licenses/lsof.html",
-      "referenceNumber": 605,
+      "licenseId": "lsof",
       "seeAlso": [
         "https://github.com/lsof-org/lsof/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.json"=
,
+      "reference": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Lucida-Bitmap-Fonts",
+      "detailsUrl": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.json"=
,
+      "referenceNumber": 661,
       "name": "Lucida Bitmap Fonts License",
-      "reference": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.html",
-      "referenceNumber": 399,
+      "licenseId": "Lucida-Bitmap-Fonts",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/font/bh-100dpi/-/blob/maste=
r/COPYING?ref_type=3Dheads"
-      ]
+        "https://gitlab.freedesktop.org/xorg/font/bh-100dpi/-/blob/maste=
r/COPYING?ref_type\u003dheads"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.jso=
n",
+      "reference": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.html=
",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LZMA-SDK-9.11-to-9.20",
+      "detailsUrl": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.jso=
n",
+      "referenceNumber": 349,
       "name": "LZMA SDK License (versions 9.11 to 9.20)",
-      "reference": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.html=
",
-      "referenceNumber": 430,
+      "licenseId": "LZMA-SDK-9.11-to-9.20",
       "seeAlso": [
         "https://www.7-zip.org/sdk.html",
         "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/LZMA-SDK-9.22.json",
+      "reference": "https://spdx.org/licenses/LZMA-SDK-9.22.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "LZMA-SDK-9.22",
+      "detailsUrl": "https://spdx.org/licenses/LZMA-SDK-9.22.json",
+      "referenceNumber": 504,
       "name": "LZMA SDK License (versions 9.22 and beyond)",
-      "reference": "https://spdx.org/licenses/LZMA-SDK-9.22.html",
-      "referenceNumber": 244,
+      "licenseId": "LZMA-SDK-9.22",
       "seeAlso": [
         "https://www.7-zip.org/sdk.html",
         "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Mackerras-3-Clause.json",
+      "reference": "https://spdx.org/licenses/Mackerras-3-Clause.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Mackerras-3-Clause",
+      "detailsUrl": "https://spdx.org/licenses/Mackerras-3-Clause.json",
+      "referenceNumber": 539,
       "name": "Mackerras 3-Clause License",
-      "reference": "https://spdx.org/licenses/Mackerras-3-Clause.html",
-      "referenceNumber": 59,
+      "licenseId": "Mackerras-3-Clause",
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/chap_ms.c#L=
6-L28"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Mackerras-3-Clause-acknow=
ledgment.json",
+      "reference": "https://spdx.org/licenses/Mackerras-3-Clause-acknowl=
edgment.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Mackerras-3-Clause-acknowledgment",
+      "detailsUrl": "https://spdx.org/licenses/Mackerras-3-Clause-acknow=
ledgment.json",
+      "referenceNumber": 433,
       "name": "Mackerras 3-Clause - acknowledgment variant",
-      "reference": "https://spdx.org/licenses/Mackerras-3-Clause-acknowl=
edgment.html",
-      "referenceNumber": 598,
+      "licenseId": "Mackerras-3-Clause-acknowledgment",
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/auth.c#L6-L=
28"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/magaz.json",
+      "reference": "https://spdx.org/licenses/magaz.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "magaz",
+      "detailsUrl": "https://spdx.org/licenses/magaz.json",
+      "referenceNumber": 373,
       "name": "magaz License",
-      "reference": "https://spdx.org/licenses/magaz.html",
-      "referenceNumber": 516,
+      "licenseId": "magaz",
       "seeAlso": [
-        "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/magaz/m=
agaz.tex"
-      ]
+        "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/magaz/m=
agaz.tex",
+        "https://mirrors.ctan.org/macros/latex/contrib/version/version.s=
ty"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/mailprio.json",
+      "reference": "https://spdx.org/licenses/mailprio.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "mailprio",
+      "detailsUrl": "https://spdx.org/licenses/mailprio.json",
+      "referenceNumber": 381,
       "name": "mailprio License",
-      "reference": "https://spdx.org/licenses/mailprio.html",
-      "referenceNumber": 179,
+      "licenseId": "mailprio",
       "seeAlso": [
         "https://fossies.org/linux/sendmail/contrib/mailprio"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MakeIndex.json",
+      "reference": "https://spdx.org/licenses/MakeIndex.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MakeIndex",
+      "detailsUrl": "https://spdx.org/licenses/MakeIndex.json",
+      "referenceNumber": 165,
       "name": "MakeIndex License",
-      "reference": "https://spdx.org/licenses/MakeIndex.html",
-      "referenceNumber": 206,
+      "licenseId": "MakeIndex",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MakeIndex"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Martin-Birgmeier.json",
+      "reference": "https://spdx.org/licenses/man2html.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Martin-Birgmeier",
-      "name": "Martin Birgmeier License",
+      "detailsUrl": "https://spdx.org/licenses/man2html.json",
+      "referenceNumber": 120,
+      "name": "man2html License",
+      "licenseId": "man2html",
+      "seeAlso": [
+        "http://primates.ximian.com/~flucifredi/man/man-1.6g.tar.gz",
+        "https://github.com/hamano/man2html/blob/master/man2html.c",
+        "https://docs.oracle.com/cd/E81115_01/html/E81116/licenses.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Martin-Birgmeier.html",
-      "referenceNumber": 535,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Martin-Birgmeier.json",
+      "referenceNumber": 361,
+      "name": "Martin Birgmeier License",
+      "licenseId": "Martin-Birgmeier",
       "seeAlso": [
         "https://github.com/Perl/perl5/blob/blead/util.c#L6136"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/McPhee-slideshow.json",
+      "reference": "https://spdx.org/licenses/McPhee-slideshow.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "McPhee-slideshow",
+      "detailsUrl": "https://spdx.org/licenses/McPhee-slideshow.json",
+      "referenceNumber": 489,
       "name": "McPhee Slideshow License",
-      "reference": "https://spdx.org/licenses/McPhee-slideshow.html",
-      "referenceNumber": 492,
+      "licenseId": "McPhee-slideshow",
       "seeAlso": [
         "https://mirror.las.iastate.edu/tex-archive/graphics/metapost/co=
ntrib/macros/slideshow/slideshow.mp"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/metamail.json",
+      "reference": "https://spdx.org/licenses/metamail.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "metamail",
+      "detailsUrl": "https://spdx.org/licenses/metamail.json",
+      "referenceNumber": 455,
       "name": "metamail License",
-      "reference": "https://spdx.org/licenses/metamail.html",
-      "referenceNumber": 437,
+      "licenseId": "metamail",
       "seeAlso": [
         "https://github.com/Dual-Life/mime-base64/blob/master/Base64.xs#=
L12"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Minpack.json",
+      "reference": "https://spdx.org/licenses/Minpack.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Minpack",
+      "detailsUrl": "https://spdx.org/licenses/Minpack.json",
+      "referenceNumber": 28,
       "name": "Minpack License",
-      "reference": "https://spdx.org/licenses/Minpack.html",
-      "referenceNumber": 512,
+      "licenseId": "Minpack",
       "seeAlso": [
         "http://www.netlib.org/minpack/disclaimer",
         "https://gitlab.com/libeigen/eigen/-/blob/master/COPYING.MINPACK=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MirOS.json",
+      "reference": "https://spdx.org/licenses/MIPS.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "MirOS",
-      "name": "The MirOS Licence",
+      "detailsUrl": "https://spdx.org/licenses/MIPS.json",
+      "referenceNumber": 351,
+      "name": "MIPS License",
+      "licenseId": "MIPS",
+      "seeAlso": [
+        "https://sourceware.org/cgit/binutils-gdb/tree/include/coff/sym.=
h#n11"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/MirOS.html",
-      "referenceNumber": 183,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MirOS.json",
+      "referenceNumber": 692,
+      "name": "The MirOS Licence",
+      "licenseId": "MirOS",
       "seeAlso": [
         "https://opensource.org/licenses/MirOS"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT.json",
+      "reference": "https://spdx.org/licenses/MIT.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "MIT",
+      "detailsUrl": "https://spdx.org/licenses/MIT.json",
+      "referenceNumber": 515,
       "name": "MIT License",
-      "reference": "https://spdx.org/licenses/MIT.html",
-      "referenceNumber": 608,
+      "licenseId": "MIT",
       "seeAlso": [
-        "https://opensource.org/license/mit/"
-      ]
+        "https://opensource.org/license/mit/",
+        "http://opensource.org/licenses/MIT"
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
+      "reference": "https://spdx.org/licenses/MIT-0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "MIT-0",
+      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
+      "referenceNumber": 173,
       "name": "MIT No Attribution",
-      "reference": "https://spdx.org/licenses/MIT-0.html",
-      "referenceNumber": 395,
+      "licenseId": "MIT-0",
       "seeAlso": [
         "https://github.com/aws/mit-0",
         "https://romanrm.net/mit-zero",
         "https://github.com/awsdocs/aws-cloud9-user-guide/blob/master/LI=
CENSE-SAMPLECODE"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
+      "reference": "https://spdx.org/licenses/MIT-advertising.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-advertising",
+      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
+      "referenceNumber": 440,
       "name": "Enlightenment License (e16)",
-      "reference": "https://spdx.org/licenses/MIT-advertising.html",
-      "referenceNumber": 293,
+      "licenseId": "MIT-advertising",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-CMU.json",
+      "reference": "https://spdx.org/licenses/MIT-Click.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-CMU",
-      "name": "CMU License",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Click.json",
+      "referenceNumber": 438,
+      "name": "MIT Click License",
+      "licenseId": "MIT-Click",
+      "seeAlso": [
+        "https://github.com/kohler/t1utils/blob/master/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/MIT-CMU.html",
-      "referenceNumber": 575,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/MIT-CMU.json",
+      "referenceNumber": 287,
+      "name": "CMU License",
+      "licenseId": "MIT-CMU",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:MIT?rd=3DLicensing/MIT=
#CMU_Style",
+        "https://fedoraproject.org/wiki/Licensing:MIT?rd\u003dLicensing/=
MIT#CMU_Style",
         "https://github.com/python-pillow/Pillow/blob/fffb426092c8db24a5=
f4b6df243a8a3c01fb63cd/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
+      "reference": "https://spdx.org/licenses/MIT-enna.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-enna",
+      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
+      "referenceNumber": 580,
       "name": "enna License",
-      "reference": "https://spdx.org/licenses/MIT-enna.html",
-      "referenceNumber": 638,
+      "licenseId": "MIT-enna",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT#enna"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-feh.json",
+      "reference": "https://spdx.org/licenses/MIT-feh.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-feh",
+      "detailsUrl": "https://spdx.org/licenses/MIT-feh.json",
+      "referenceNumber": 408,
       "name": "feh License",
-      "reference": "https://spdx.org/licenses/MIT-feh.html",
-      "referenceNumber": 53,
+      "licenseId": "MIT-feh",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT#feh"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-Festival.json",
+      "reference": "https://spdx.org/licenses/MIT-Festival.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-Festival",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Festival.json",
+      "referenceNumber": 18,
       "name": "MIT Festival Variant",
-      "reference": "https://spdx.org/licenses/MIT-Festival.html",
-      "referenceNumber": 317,
+      "licenseId": "MIT-Festival",
       "seeAlso": [
         "https://github.com/festvox/flite/blob/master/COPYING",
         "https://github.com/festvox/speech_tools/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-Khronos-old.json",
+      "reference": "https://spdx.org/licenses/MIT-Khronos-old.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-Khronos-old",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Khronos-old.json",
+      "referenceNumber": 508,
       "name": "MIT Khronos - old variant",
-      "reference": "https://spdx.org/licenses/MIT-Khronos-old.html",
-      "referenceNumber": 249,
+      "licenseId": "MIT-Khronos-old",
       "seeAlso": [
         "https://github.com/KhronosGroup/SPIRV-Cross/blob/main/LICENSES/=
LicenseRef-KhronosFreeUse.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-Modern-Variant.json",
+      "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "MIT-Modern-Variant",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Modern-Variant.json",
+      "referenceNumber": 304,
       "name": "MIT License Modern Variant",
-      "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
-      "referenceNumber": 424,
+      "licenseId": "MIT-Modern-Variant",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:MIT#Modern_Variants",
         "https://ptolemy.berkeley.edu/copyright.htm",
         "https://pirlwww.lpl.arizona.edu/resources/guide/software/PerlTk=
/Tixlic.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
+      "reference": "https://spdx.org/licenses/MIT-open-group.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-open-group",
+      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
+      "referenceNumber": 404,
       "name": "MIT Open Group variant",
-      "reference": "https://spdx.org/licenses/MIT-open-group.html",
-      "referenceNumber": 283,
+      "licenseId": "MIT-open-group",
       "seeAlso": [
         "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/C=
OPYING",
-        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/CO=
PYING",
         "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/=
COPYING",
         "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COP=
YING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-testregex.json",
+      "reference": "https://spdx.org/licenses/MIT-testregex.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-testregex",
+      "detailsUrl": "https://spdx.org/licenses/MIT-testregex.json",
+      "referenceNumber": 496,
       "name": "MIT testregex Variant",
-      "reference": "https://spdx.org/licenses/MIT-testregex.html",
-      "referenceNumber": 427,
+      "licenseId": "MIT-testregex",
       "seeAlso": [
         "https://github.com/dotnet/runtime/blob/55e1ac7c07df62c4108d4ace=
df78f77574470ce5/src/libraries/System.Text.RegularExpressions/tests/Funct=
ionalTests/AttRegexTests.cs#L12-L28"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MIT-Wu.json",
+      "reference": "https://spdx.org/licenses/MIT-Wu.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MIT-Wu",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Wu.json",
+      "referenceNumber": 355,
       "name": "MIT Tom Wu Variant",
-      "reference": "https://spdx.org/licenses/MIT-Wu.html",
-      "referenceNumber": 459,
+      "licenseId": "MIT-Wu",
       "seeAlso": [
         "https://github.com/chromium/octane/blob/master/crypto.js"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MITNFA.json",
+      "reference": "https://spdx.org/licenses/MITNFA.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MITNFA",
+      "detailsUrl": "https://spdx.org/licenses/MITNFA.json",
+      "referenceNumber": 473,
       "name": "MIT +no-false-attribs license",
-      "reference": "https://spdx.org/licenses/MITNFA.html",
-      "referenceNumber": 157,
+      "licenseId": "MITNFA",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MITNFA"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MMIXware.json",
+      "reference": "https://spdx.org/licenses/MMIXware.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MMIXware",
+      "detailsUrl": "https://spdx.org/licenses/MMIXware.json",
+      "referenceNumber": 663,
       "name": "MMIXware License",
-      "reference": "https://spdx.org/licenses/MMIXware.html",
-      "referenceNumber": 474,
+      "licenseId": "MMIXware",
       "seeAlso": [
         "https://gitlab.lrz.de/mmix/mmixware/-/blob/master/boilerplate.w=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
+      "reference": "https://spdx.org/licenses/Motosoto.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Motosoto",
+      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
+      "referenceNumber": 507,
       "name": "Motosoto License",
-      "reference": "https://spdx.org/licenses/Motosoto.html",
-      "referenceNumber": 627,
+      "licenseId": "Motosoto",
       "seeAlso": [
         "https://opensource.org/licenses/Motosoto"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MPEG-SSG.json",
+      "reference": "https://spdx.org/licenses/MPEG-SSG.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MPEG-SSG",
+      "detailsUrl": "https://spdx.org/licenses/MPEG-SSG.json",
+      "referenceNumber": 303,
       "name": "MPEG Software Simulation",
-      "reference": "https://spdx.org/licenses/MPEG-SSG.html",
-      "referenceNumber": 417,
+      "licenseId": "MPEG-SSG",
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/co=
nverter/ppm/ppmtompeg/jrevdct.c#l1189"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/mpi-permissive.json",
+      "reference": "https://spdx.org/licenses/mpi-permissive.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "mpi-permissive",
+      "detailsUrl": "https://spdx.org/licenses/mpi-permissive.json",
+      "referenceNumber": 213,
       "name": "mpi Permissive License",
-      "reference": "https://spdx.org/licenses/mpi-permissive.html",
-      "referenceNumber": 80,
+      "licenseId": "mpi-permissive",
       "seeAlso": [
-        "https://sources.debian.org/src/openmpi/4.1.0-10/ompi/debuggers/=
msgq_interface.h/?hl=3D19#L19"
-      ]
+        "https://sources.debian.org/src/openmpi/4.1.0-10/ompi/debuggers/=
msgq_interface.h/?hl\u003d19#L19"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
+      "reference": "https://spdx.org/licenses/mpich2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "mpich2",
+      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
+      "referenceNumber": 102,
       "name": "mpich2 License",
-      "reference": "https://spdx.org/licenses/mpich2.html",
-      "referenceNumber": 482,
+      "licenseId": "mpich2",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/MIT"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MPL-1.0.json",
+      "reference": "https://spdx.org/licenses/MPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "MPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.0.json",
+      "referenceNumber": 665,
       "name": "Mozilla Public License 1.0",
-      "reference": "https://spdx.org/licenses/MPL-1.0.html",
-      "referenceNumber": 28,
+      "licenseId": "MPL-1.0",
       "seeAlso": [
         "http://www.mozilla.org/MPL/MPL-1.0.html",
         "https://opensource.org/licenses/MPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
+      "reference": "https://spdx.org/licenses/MPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "MPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
+      "referenceNumber": 679,
       "name": "Mozilla Public License 1.1",
-      "reference": "https://spdx.org/licenses/MPL-1.1.html",
-      "referenceNumber": 619,
+      "licenseId": "MPL-1.1",
       "seeAlso": [
         "http://www.mozilla.org/MPL/MPL-1.1.html",
         "https://opensource.org/licenses/MPL-1.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MPL-2.0.json",
+      "reference": "https://spdx.org/licenses/MPL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "MPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0.json",
+      "referenceNumber": 599,
       "name": "Mozilla Public License 2.0",
-      "reference": "https://spdx.org/licenses/MPL-2.0.html",
-      "referenceNumber": 263,
+      "licenseId": "MPL-2.0",
       "seeAlso": [
         "https://www.mozilla.org/MPL/2.0/",
         "https://opensource.org/licenses/MPL-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-excep=
tion.json",
+      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-except=
ion.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "MPL-2.0-no-copyleft-exception",
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-excep=
tion.json",
+      "referenceNumber": 174,
       "name": "Mozilla Public License 2.0 (no copyleft exception)",
-      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-except=
ion.html",
-      "referenceNumber": 455,
+      "licenseId": "MPL-2.0-no-copyleft-exception",
       "seeAlso": [
         "https://www.mozilla.org/MPL/2.0/",
         "https://opensource.org/licenses/MPL-2.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/mplus.json",
+      "reference": "https://spdx.org/licenses/mplus.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "mplus",
+      "detailsUrl": "https://spdx.org/licenses/mplus.json",
+      "referenceNumber": 17,
       "name": "mplus Font License",
-      "reference": "https://spdx.org/licenses/mplus.html",
-      "referenceNumber": 541,
+      "licenseId": "mplus",
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:Mplus?rd=3DLicensing/m=
plus"
-      ]
+        "https://fedoraproject.org/wiki/Licensing:Mplus?rd\u003dLicensin=
g/mplus"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MS-LPL.json",
+      "reference": "https://spdx.org/licenses/MS-LPL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MS-LPL",
+      "detailsUrl": "https://spdx.org/licenses/MS-LPL.json",
+      "referenceNumber": 674,
       "name": "Microsoft Limited Public License",
-      "reference": "https://spdx.org/licenses/MS-LPL.html",
-      "referenceNumber": 528,
+      "licenseId": "MS-LPL",
       "seeAlso": [
         "https://www.openhub.net/licenses/mslpl",
         "https://github.com/gabegundy/atlserver/blob/master/License.txt"=
,
         "https://en.wikipedia.org/wiki/Shared_Source_Initiative#Microsof=
t_Limited_Public_License_(Ms-LPL)"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MS-PL.json",
+      "reference": "https://spdx.org/licenses/MS-PL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "MS-PL",
+      "detailsUrl": "https://spdx.org/licenses/MS-PL.json",
+      "referenceNumber": 698,
       "name": "Microsoft Public License",
-      "reference": "https://spdx.org/licenses/MS-PL.html",
-      "referenceNumber": 499,
+      "licenseId": "MS-PL",
       "seeAlso": [
         "http://www.microsoft.com/opensource/licenses.mspx",
         "https://opensource.org/licenses/MS-PL"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
+      "reference": "https://spdx.org/licenses/MS-RL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "MS-RL",
+      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
+      "referenceNumber": 276,
       "name": "Microsoft Reciprocal License",
-      "reference": "https://spdx.org/licenses/MS-RL.html",
-      "referenceNumber": 343,
+      "licenseId": "MS-RL",
       "seeAlso": [
         "http://www.microsoft.com/opensource/licenses.mspx",
         "https://opensource.org/licenses/MS-RL"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MTLL.json",
+      "reference": "https://spdx.org/licenses/MTLL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MTLL",
+      "detailsUrl": "https://spdx.org/licenses/MTLL.json",
+      "referenceNumber": 588,
       "name": "Matrix Template Library License",
-      "reference": "https://spdx.org/licenses/MTLL.html",
-      "referenceNumber": 137,
+      "licenseId": "MTLL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Matrix_Template_Librar=
y_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MulanPSL-1.0.json",
+      "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "MulanPSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/MulanPSL-1.0.json",
+      "referenceNumber": 320,
       "name": "Mulan Permissive Software License, Version 1",
-      "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
-      "referenceNumber": 107,
+      "licenseId": "MulanPSL-1.0",
       "seeAlso": [
         "https://license.coscl.org.cn/MulanPSL/",
         "https://github.com/yuwenlong/longphp/blob/25dfb70cc2a466dc4bb55=
ba30901cbce08d164b5/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/MulanPSL-2.0.json",
+      "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "MulanPSL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/MulanPSL-2.0.json",
+      "referenceNumber": 182,
       "name": "Mulan Permissive Software License, Version 2",
-      "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
-      "referenceNumber": 490,
+      "licenseId": "MulanPSL-2.0",
       "seeAlso": [
         "https://license.coscl.org.cn/MulanPSL2"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Multics.json",
+      "reference": "https://spdx.org/licenses/Multics.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Multics",
+      "detailsUrl": "https://spdx.org/licenses/Multics.json",
+      "referenceNumber": 60,
       "name": "Multics License",
-      "reference": "https://spdx.org/licenses/Multics.html",
-      "referenceNumber": 573,
+      "licenseId": "Multics",
       "seeAlso": [
         "https://opensource.org/licenses/Multics"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Mup.json",
+      "reference": "https://spdx.org/licenses/Mup.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Mup",
+      "detailsUrl": "https://spdx.org/licenses/Mup.json",
+      "referenceNumber": 288,
       "name": "Mup License",
-      "reference": "https://spdx.org/licenses/Mup.html",
-      "referenceNumber": 440,
+      "licenseId": "Mup",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Mup"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NAIST-2003.json",
+      "reference": "https://spdx.org/licenses/NAIST-2003.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NAIST-2003",
+      "detailsUrl": "https://spdx.org/licenses/NAIST-2003.json",
+      "referenceNumber": 462,
       "name": "Nara Institute of Science and Technology License (2003)",
-      "reference": "https://spdx.org/licenses/NAIST-2003.html",
-      "referenceNumber": 104,
+      "licenseId": "NAIST-2003",
       "seeAlso": [
         "https://enterprise.dejacode.com/licenses/public/naist-2003/#lic=
ense-text",
         "https://github.com/nodejs/node/blob/4a19cc8947b1bba2b2d27816ec3=
d0edf9b28e503/LICENSE#L343"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
+      "reference": "https://spdx.org/licenses/NASA-1.3.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": true,
-      "licenseId": "NASA-1.3",
+      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
+      "referenceNumber": 432,
       "name": "NASA Open Source Agreement 1.3",
-      "reference": "https://spdx.org/licenses/NASA-1.3.html",
-      "referenceNumber": 127,
+      "licenseId": "NASA-1.3",
       "seeAlso": [
         "http://ti.arc.nasa.gov/opensource/nosa/",
         "https://opensource.org/licenses/NASA-1.3"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
+      "reference": "https://spdx.org/licenses/Naumen.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Naumen",
+      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
+      "referenceNumber": 307,
       "name": "Naumen Public License",
-      "reference": "https://spdx.org/licenses/Naumen.html",
-      "referenceNumber": 128,
+      "licenseId": "Naumen",
       "seeAlso": [
         "https://opensource.org/licenses/Naumen"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NBPL-1.0.json",
+      "reference": "https://spdx.org/licenses/NBPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NBPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/NBPL-1.0.json",
+      "referenceNumber": 460,
       "name": "Net Boolean Public License v1",
-      "reference": "https://spdx.org/licenses/NBPL-1.0.html",
-      "referenceNumber": 41,
+      "licenseId": "NBPL-1.0",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D37b4b3f6cc4bf34e1d3dec61e69914b9819d8894"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d37b4b3f6cc4bf34e1d3dec61e69914b9819d8894=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NCBI-PD.json",
+      "reference": "https://spdx.org/licenses/NCBI-PD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NCBI-PD",
+      "detailsUrl": "https://spdx.org/licenses/NCBI-PD.json",
+      "referenceNumber": 696,
       "name": "NCBI Public Domain Notice",
-      "reference": "https://spdx.org/licenses/NCBI-PD.html",
-      "referenceNumber": 362,
+      "licenseId": "NCBI-PD",
       "seeAlso": [
         "https://github.com/ncbi/sra-tools/blob/e8e5b6af4edc460156ad9ce5=
902d0779cffbf685/LICENSE",
         "https://github.com/ncbi/datasets/blob/0ea4cd16b61e5b799d9cc55ae=
cfa016d6c9bd2bf/LICENSE.md",
         "https://github.com/ncbi/gprobe/blob/de64d30fee8b4c4013094d7d313=
9ea89b5dd1ace/LICENSE",
         "https://github.com/ncbi/egapx/blob/08930b9dec0c69b2d1a05e5153c7=
b95ef0a3eb0f/LICENSE",
         "https://github.com/ncbi/datasets/blob/master/LICENSE.md"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
+      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NCGL-UK-2.0",
+      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
+      "referenceNumber": 392,
       "name": "Non-Commercial Government Licence",
-      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
-      "referenceNumber": 320,
+      "licenseId": "NCGL-UK-2.0",
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/non-commercial-governmen=
t-licence/version/2/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NCL.json",
+      "reference": "https://spdx.org/licenses/NCL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NCL",
+      "detailsUrl": "https://spdx.org/licenses/NCL.json",
+      "referenceNumber": 154,
       "name": "NCL Source Code License",
-      "reference": "https://spdx.org/licenses/NCL.html",
-      "referenceNumber": 153,
+      "licenseId": "NCL",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/=
src/modules/module-filter-chain/pffft.c?ref_type=3Dheads#L1-52"
-      ]
+        "https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/=
src/modules/module-filter-chain/pffft.c?ref_type\u003dheads#L1-52"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NCSA.json",
+      "reference": "https://spdx.org/licenses/NCSA.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "NCSA",
+      "detailsUrl": "https://spdx.org/licenses/NCSA.json",
+      "referenceNumber": 148,
       "name": "University of Illinois/NCSA Open Source License",
-      "reference": "https://spdx.org/licenses/NCSA.html",
-      "referenceNumber": 557,
+      "licenseId": "NCSA",
       "seeAlso": [
         "http://otm.illinois.edu/uiuc_openSource",
         "https://opensource.org/licenses/NCSA"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
+      "reference": "https://spdx.org/licenses/Net-SNMP.html",
+      "isDeprecatedLicenseId": true,
       "detailsUrl": "https://spdx.org/licenses/Net-SNMP.json",
-      "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Net-SNMP",
+      "referenceNumber": 638,
       "name": "Net-SNMP License",
-      "reference": "https://spdx.org/licenses/Net-SNMP.html",
-      "referenceNumber": 234,
+      "licenseId": "Net-SNMP",
       "seeAlso": [
         "http://net-snmp.sourceforge.net/about/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NetCDF.json",
+      "reference": "https://spdx.org/licenses/NetCDF.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NetCDF",
+      "detailsUrl": "https://spdx.org/licenses/NetCDF.json",
+      "referenceNumber": 626,
       "name": "NetCDF license",
-      "reference": "https://spdx.org/licenses/NetCDF.html",
-      "referenceNumber": 503,
+      "licenseId": "NetCDF",
       "seeAlso": [
         "http://www.unidata.ucar.edu/software/netcdf/copyright.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Newsletr.json",
+      "reference": "https://spdx.org/licenses/Newsletr.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Newsletr",
+      "detailsUrl": "https://spdx.org/licenses/Newsletr.json",
+      "referenceNumber": 607,
       "name": "Newsletr License",
-      "reference": "https://spdx.org/licenses/Newsletr.html",
-      "referenceNumber": 412,
+      "licenseId": "Newsletr",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Newsletr"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
+      "reference": "https://spdx.org/licenses/NGPL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "NGPL",
+      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
+      "referenceNumber": 64,
       "name": "Nethack General Public License",
-      "reference": "https://spdx.org/licenses/NGPL.html",
-      "referenceNumber": 275,
+      "licenseId": "NGPL",
       "seeAlso": [
         "https://opensource.org/licenses/NGPL"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NICTA-1.0.json",
+      "reference": "https://spdx.org/licenses/ngrep.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NICTA-1.0",
-      "name": "NICTA Public Software License, Version 1.0",
+      "detailsUrl": "https://spdx.org/licenses/ngrep.json",
+      "referenceNumber": 16,
+      "name": "ngrep License",
+      "licenseId": "ngrep",
+      "seeAlso": [
+        "https://github.com/jpr5/ngrep/blob/master/LICENSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/NICTA-1.0.html",
-      "referenceNumber": 311,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NICTA-1.0.json",
+      "referenceNumber": 406,
+      "name": "NICTA Public Software License, Version 1.0",
+      "licenseId": "NICTA-1.0",
       "seeAlso": [
         "https://opensource.apple.com/source/mDNSResponder/mDNSResponder=
-320.10/mDNSPosix/nss_ReadMe.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
+      "reference": "https://spdx.org/licenses/NIST-PD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NIST-PD",
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
+      "referenceNumber": 98,
       "name": "NIST Public Domain Notice",
-      "reference": "https://spdx.org/licenses/NIST-PD.html",
-      "referenceNumber": 309,
+      "licenseId": "NIST-PD",
       "seeAlso": [
         "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfec=
eb2db8cba05b7c2e0cd3/LICENSE.txt",
         "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c=
98348188a65a135d98/README.md"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
+      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NIST-PD-fallback",
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
+      "referenceNumber": 616,
       "name": "NIST Public Domain Notice with license fallback",
-      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
-      "referenceNumber": 34,
+      "licenseId": "NIST-PD-fallback",
       "seeAlso": [
         "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897=
d9a7d2656b42abe3/LICENSE",
         "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c5=
986071cf6568cc34/LICENSE.rst"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NIST-Software.json",
+      "reference": "https://spdx.org/licenses/NIST-Software.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NIST-Software",
+      "detailsUrl": "https://spdx.org/licenses/NIST-Software.json",
+      "referenceNumber": 447,
       "name": "NIST Software License",
-      "reference": "https://spdx.org/licenses/NIST-Software.html",
-      "referenceNumber": 76,
+      "licenseId": "NIST-Software",
       "seeAlso": [
         "https://github.com/open-quantum-safe/liboqs/blob/40b01fdbb270f8=
614fde30e65d30e9da18c02393/src/common/rand/rand_nist.c#L1-L15"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
+      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NLOD-1.0",
+      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
+      "referenceNumber": 249,
       "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
-      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
-      "referenceNumber": 565,
+      "licenseId": "NLOD-1.0",
       "seeAlso": [
         "http://data.norge.no/nlod/en/1.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
+      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NLOD-2.0",
+      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
+      "referenceNumber": 687,
       "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
-      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
-      "referenceNumber": 483,
+      "licenseId": "NLOD-2.0",
       "seeAlso": [
         "http://data.norge.no/nlod/en/2.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NLPL.json",
+      "reference": "https://spdx.org/licenses/NLPL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NLPL",
+      "detailsUrl": "https://spdx.org/licenses/NLPL.json",
+      "referenceNumber": 161,
       "name": "No Limit Public License",
-      "reference": "https://spdx.org/licenses/NLPL.html",
-      "referenceNumber": 71,
+      "licenseId": "NLPL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/NLPL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Nokia.json",
+      "reference": "https://spdx.org/licenses/Nokia.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Nokia",
+      "detailsUrl": "https://spdx.org/licenses/Nokia.json",
+      "referenceNumber": 464,
       "name": "Nokia Open Source License",
-      "reference": "https://spdx.org/licenses/Nokia.html",
-      "referenceNumber": 44,
+      "licenseId": "Nokia",
       "seeAlso": [
         "https://opensource.org/licenses/nokia"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
+      "reference": "https://spdx.org/licenses/NOSL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "NOSL",
+      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
+      "referenceNumber": 471,
       "name": "Netizen Open Source License",
-      "reference": "https://spdx.org/licenses/NOSL.html",
-      "referenceNumber": 126,
+      "licenseId": "NOSL",
       "seeAlso": [
         "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Noweb.json",
+      "reference": "https://spdx.org/licenses/Noweb.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Noweb",
+      "detailsUrl": "https://spdx.org/licenses/Noweb.json",
+      "referenceNumber": 77,
       "name": "Noweb License",
-      "reference": "https://spdx.org/licenses/Noweb.html",
-      "referenceNumber": 534,
+      "licenseId": "Noweb",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Noweb"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NPL-1.0.json",
+      "reference": "https://spdx.org/licenses/NPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "NPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.0.json",
+      "referenceNumber": 372,
       "name": "Netscape Public License v1.0",
-      "reference": "https://spdx.org/licenses/NPL-1.0.html",
-      "referenceNumber": 346,
+      "licenseId": "NPL-1.0",
       "seeAlso": [
         "http://www.mozilla.org/MPL/NPL/1.0/"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
+      "reference": "https://spdx.org/licenses/NPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "NPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
+      "referenceNumber": 518,
       "name": "Netscape Public License v1.1",
-      "reference": "https://spdx.org/licenses/NPL-1.1.html",
-      "referenceNumber": 418,
+      "licenseId": "NPL-1.1",
       "seeAlso": [
         "http://www.mozilla.org/MPL/NPL/1.1/"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NPOSL-3.0.json",
+      "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "NPOSL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/NPOSL-3.0.json",
+      "referenceNumber": 195,
       "name": "Non-Profit Open Software License 3.0",
-      "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
-      "referenceNumber": 579,
+      "licenseId": "NPOSL-3.0",
       "seeAlso": [
         "https://opensource.org/licenses/NOSL3.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NRL.json",
+      "reference": "https://spdx.org/licenses/NRL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NRL",
+      "detailsUrl": "https://spdx.org/licenses/NRL.json",
+      "referenceNumber": 146,
       "name": "NRL License",
-      "reference": "https://spdx.org/licenses/NRL.html",
-      "referenceNumber": 230,
+      "licenseId": "NRL",
       "seeAlso": [
         "http://web.mit.edu/network/isakmp/nrllicense.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NTP.json",
+      "reference": "https://spdx.org/licenses/NTIA-PD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "NTP",
-      "name": "NTP License",
+      "detailsUrl": "https://spdx.org/licenses/NTIA-PD.json",
+      "referenceNumber": 426,
+      "name": "NTIA Public Domain Notice",
+      "licenseId": "NTIA-PD",
+      "seeAlso": [
+        "https://raw.githubusercontent.com/NTIA/itm/refs/heads/master/LI=
CENSE.md",
+        "https://raw.githubusercontent.com/NTIA/scos-sensor/refs/heads/m=
aster/LICENSE.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/NTP.html",
-      "referenceNumber": 547,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/NTP.json",
+      "referenceNumber": 621,
+      "name": "NTP License",
+      "licenseId": "NTP",
       "seeAlso": [
         "https://opensource.org/licenses/NTP"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/NTP-0.json",
+      "reference": "https://spdx.org/licenses/NTP-0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "NTP-0",
+      "detailsUrl": "https://spdx.org/licenses/NTP-0.json",
+      "referenceNumber": 566,
       "name": "NTP No Attribution",
-      "reference": "https://spdx.org/licenses/NTP-0.html",
-      "referenceNumber": 460,
+      "licenseId": "NTP-0",
       "seeAlso": [
         "https://github.com/tytso/e2fsprogs/blob/master/lib/et/et_name.c=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Nunit.json",
+      "reference": "https://spdx.org/licenses/Nunit.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Nunit",
+      "detailsUrl": "https://spdx.org/licenses/Nunit.json",
+      "referenceNumber": 203,
       "name": "Nunit License",
-      "reference": "https://spdx.org/licenses/Nunit.html",
-      "referenceNumber": 634,
+      "licenseId": "Nunit",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Nunit"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
+      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "O-UDA-1.0",
+      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
+      "referenceNumber": 485,
       "name": "Open Use of Data Agreement v1.0",
-      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
-      "referenceNumber": 191,
+      "licenseId": "O-UDA-1.0",
       "seeAlso": [
         "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1=
.0/O-UDA-1.0.md",
         "https://cdla.dev/open-use-of-data-agreement-v1-0/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OAR.json",
+      "reference": "https://spdx.org/licenses/OAR.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OAR",
+      "detailsUrl": "https://spdx.org/licenses/OAR.json",
+      "referenceNumber": 251,
       "name": "OAR License",
-      "reference": "https://spdx.org/licenses/OAR.html",
-      "referenceNumber": 4,
+      "licenseId": "OAR",
       "seeAlso": [
-        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/string/strsignal.c;hb=3DHEAD#l35"
-      ]
+        "https://sourceware.org/git/?p\u003dnewlib-cygwin.git;a\u003dblo=
b;f\u003dnewlib/libc/string/strsignal.c;hb\u003dHEAD#l35"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
+      "reference": "https://spdx.org/licenses/OCCT-PL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OCCT-PL",
+      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
+      "referenceNumber": 371,
       "name": "Open CASCADE Technology Public License",
-      "reference": "https://spdx.org/licenses/OCCT-PL.html",
-      "referenceNumber": 596,
+      "licenseId": "OCCT-PL",
       "seeAlso": [
         "http://www.opencascade.com/content/occt-public-license"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OCLC-2.0.json",
+      "reference": "https://spdx.org/licenses/OCLC-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OCLC-2.0",
+      "detailsUrl": "https://spdx.org/licenses/OCLC-2.0.json",
+      "referenceNumber": 274,
       "name": "OCLC Research Public License 2.0",
-      "reference": "https://spdx.org/licenses/OCLC-2.0.html",
-      "referenceNumber": 308,
+      "licenseId": "OCLC-2.0",
       "seeAlso": [
         "http://www.oclc.org/research/activities/software/license/v2fina=
l.htm",
         "https://opensource.org/licenses/OCLC-2.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
+      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "ODbL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
+      "referenceNumber": 397,
       "name": "Open Data Commons Open Database License v1.0",
-      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
-      "referenceNumber": 243,
+      "licenseId": "ODbL-1.0",
       "seeAlso": [
         "http://www.opendatacommons.org/licenses/odbl/1.0/",
         "https://opendatacommons.org/licenses/odbl/1-0/"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ODC-By-1.0.json",
+      "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ODC-By-1.0",
+      "detailsUrl": "https://spdx.org/licenses/ODC-By-1.0.json",
+      "referenceNumber": 46,
       "name": "Open Data Commons Attribution License v1.0",
-      "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
-      "referenceNumber": 7,
+      "licenseId": "ODC-By-1.0",
       "seeAlso": [
         "https://opendatacommons.org/licenses/by/1.0/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFFIS.json",
+      "reference": "https://spdx.org/licenses/OFFIS.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OFFIS",
+      "detailsUrl": "https://spdx.org/licenses/OFFIS.json",
+      "referenceNumber": 368,
       "name": "OFFIS License",
-      "reference": "https://spdx.org/licenses/OFFIS.html",
-      "referenceNumber": 238,
+      "licenseId": "OFFIS",
       "seeAlso": [
         "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/dico=
m/README"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0.json",
+      "reference": "https://spdx.org/licenses/OFL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "OFL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0.json",
+      "referenceNumber": 589,
       "name": "SIL Open Font License 1.0",
-      "reference": "https://spdx.org/licenses/OFL-1.0.html",
-      "referenceNumber": 475,
+      "licenseId": "OFL-1.0",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web=
"
-      ]
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_=
web"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
+      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OFL-1.0-no-RFN",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
+      "referenceNumber": 653,
       "name": "SIL Open Font License 1.0 with no Reserved Font Name",
-      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
-      "referenceNumber": 23,
+      "licenseId": "OFL-1.0-no-RFN",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web=
"
-      ]
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_=
web"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-RFN.json",
+      "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OFL-1.0-RFN",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-RFN.json",
+      "referenceNumber": 201,
       "name": "SIL Open Font License 1.0 with Reserved Font Name",
-      "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
-      "referenceNumber": 11,
+      "licenseId": "OFL-1.0-RFN",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web=
"
-      ]
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_=
web"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1.json",
+      "reference": "https://spdx.org/licenses/OFL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "OFL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1.json",
+      "referenceNumber": 608,
       "name": "SIL Open Font License 1.1",
-      "reference": "https://spdx.org/licenses/OFL-1.1.html",
-      "referenceNumber": 248,
+      "licenseId": "OFL-1.1",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_we=
b",
         "https://opensource.org/licenses/OFL-1.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-no-RFN.json",
+      "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OFL-1.1-no-RFN",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-no-RFN.json",
+      "referenceNumber": 204,
       "name": "SIL Open Font License 1.1 with no Reserved Font Name",
-      "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
-      "referenceNumber": 550,
+      "licenseId": "OFL-1.1-no-RFN",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_we=
b",
         "https://opensource.org/licenses/OFL-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
+      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OFL-1.1-RFN",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
+      "referenceNumber": 82,
       "name": "SIL Open Font License 1.1 with Reserved Font Name",
-      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
-      "referenceNumber": 507,
+      "licenseId": "OFL-1.1-RFN",
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
+        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_we=
b",
         "https://opensource.org/licenses/OFL-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGC-1.0.json",
+      "reference": "https://spdx.org/licenses/OGC-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OGC-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OGC-1.0.json",
+      "referenceNumber": 612,
       "name": "OGC Software License, Version 1.0",
-      "reference": "https://spdx.org/licenses/OGC-1.0.html",
-      "referenceNumber": 166,
+      "licenseId": "OGC-1.0",
       "seeAlso": [
         "https://www.ogc.org/ogc/software/1.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGDL-Taiwan-1.0.json",
+      "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OGDL-Taiwan-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OGDL-Taiwan-1.0.json",
+      "referenceNumber": 129,
       "name": "Taiwan Open Government Data License, version 1.0",
-      "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
-      "referenceNumber": 468,
+      "licenseId": "OGDL-Taiwan-1.0",
       "seeAlso": [
         "https://data.gov.tw/license"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGL-Canada-2.0.json",
+      "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OGL-Canada-2.0",
+      "detailsUrl": "https://spdx.org/licenses/OGL-Canada-2.0.json",
+      "referenceNumber": 544,
       "name": "Open Government Licence - Canada",
-      "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
-      "referenceNumber": 464,
+      "licenseId": "OGL-Canada-2.0",
       "seeAlso": [
         "https://open.canada.ca/en/open-government-licence-canada"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGL-UK-1.0.json",
+      "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OGL-UK-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-1.0.json",
+      "referenceNumber": 168,
       "name": "Open Government Licence v1.0",
-      "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
-      "referenceNumber": 489,
+      "licenseId": "OGL-UK-1.0",
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/open-government-licence/=
version/1/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGL-UK-2.0.json",
+      "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OGL-UK-2.0",
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-2.0.json",
+      "referenceNumber": 400,
       "name": "Open Government Licence v2.0",
-      "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
-      "referenceNumber": 467,
+      "licenseId": "OGL-UK-2.0",
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/open-government-licence/=
version/2/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGL-UK-3.0.json",
+      "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OGL-UK-3.0",
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-3.0.json",
+      "referenceNumber": 570,
       "name": "Open Government Licence v3.0",
-      "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
-      "referenceNumber": 151,
+      "licenseId": "OGL-UK-3.0",
       "seeAlso": [
         "http://www.nationalarchives.gov.uk/doc/open-government-licence/=
version/3/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OGTSL.json",
+      "reference": "https://spdx.org/licenses/OGTSL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OGTSL",
+      "detailsUrl": "https://spdx.org/licenses/OGTSL.json",
+      "referenceNumber": 534,
       "name": "Open Group Test Suite License",
-      "reference": "https://spdx.org/licenses/OGTSL.html",
-      "referenceNumber": 367,
+      "licenseId": "OGTSL",
       "seeAlso": [
         "http://www.opengroup.org/testing/downloads/The_Open_Group_TSL.t=
xt",
         "https://opensource.org/licenses/OGTSL"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.1.json",
+      "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-1.1",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.1.json",
+      "referenceNumber": 333,
       "name": "Open LDAP Public License v1.1",
-      "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
-      "referenceNumber": 180,
+      "licenseId": "OLDAP-1.1",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D806557a5ad59804ef3a44d5abfbe91d706b0791f"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d806557a5ad59804ef3a44d5abfbe91d706b0791f=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.2.json",
+      "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-1.2",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.2.json",
+      "referenceNumber": 281,
       "name": "Open LDAP Public License v1.2",
-      "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
-      "referenceNumber": 229,
+      "licenseId": "OLDAP-1.2",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D42b0383c50c299977b5893ee695cf4e486fb0dc7"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d42b0383c50c299977b5893ee695cf4e486fb0dc7=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.3.json",
+      "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-1.3",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.3.json",
+      "referenceNumber": 386,
       "name": "Open LDAP Public License v1.3",
-      "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
-      "referenceNumber": 224,
+      "licenseId": "OLDAP-1.3",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3De5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003de5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.4.json",
+      "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-1.4",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.4.json",
+      "referenceNumber": 105,
       "name": "Open LDAP Public License v1.4",
-      "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
-      "referenceNumber": 255,
+      "licenseId": "OLDAP-1.4",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dc9f95c2f3f2ffb5e0ae55fe7388af75547660941"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003dc9f95c2f3f2ffb5e0ae55fe7388af75547660941=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.0",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.json",
+      "referenceNumber": 657,
       "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)=
",
-      "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
-      "referenceNumber": 208,
+      "licenseId": "OLDAP-2.0",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dcbf50f4e1185a21abd4c0a54d3f4341fe28f36ea"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003dcbf50f4e1185a21abd4c0a54d3f4341fe28f36ea=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.1.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.0.1",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.1.json",
+      "referenceNumber": 654,
       "name": "Open LDAP Public License v2.0.1",
-      "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
-      "referenceNumber": 79,
+      "licenseId": "OLDAP-2.0.1",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Db6d68acd14e51ca3aab4428bf26522aa74873f0e"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003db6d68acd14e51ca3aab4428bf26522aa74873f0e=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.1.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.1",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.1.json",
+      "referenceNumber": 170,
       "name": "Open LDAP Public License v2.1",
-      "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
-      "referenceNumber": 360,
+      "licenseId": "OLDAP-2.1",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Db0d176738e96a0d3b9f85cb51e140a86f21be715"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003db0d176738e96a0d3b9f85cb51e140a86f21be715=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.2",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.json",
+      "referenceNumber": 667,
       "name": "Open LDAP Public License v2.2",
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
-      "referenceNumber": 316,
+      "licenseId": "OLDAP-2.2",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D470b0c18ec67621c85881b2733057fecf4a1acc3"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d470b0c18ec67621c85881b2733057fecf4a1acc3=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.1.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.2.1",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.1.json",
+      "referenceNumber": 378,
       "name": "Open LDAP Public License v2.2.1",
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
-      "referenceNumber": 426,
+      "licenseId": "OLDAP-2.2.1",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D4bc786f34b50aa301be6f5600f58a980070f481e"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d4bc786f34b50aa301be6f5600f58a980070f481e=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.2.2",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
+      "referenceNumber": 314,
       "name": "Open LDAP Public License 2.2.2",
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
-      "referenceNumber": 384,
+      "licenseId": "OLDAP-2.2.2",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Ddf2cc1e21eb7c160695f5b7cffd6296c151ba188"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003ddf2cc1e21eb7c160695f5b7cffd6296c151ba188=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.3.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.3",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.3.json",
+      "referenceNumber": 411,
       "name": "Open LDAP Public License v2.3",
-      "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
-      "referenceNumber": 381,
+      "licenseId": "OLDAP-2.3",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dd32cf54a32d581ab475d23c810b0a7fbaf8d63c3"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003dd32cf54a32d581ab475d23c810b0a7fbaf8d63c3=
"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.4.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.4",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.4.json",
+      "referenceNumber": 382,
       "name": "Open LDAP Public License v2.4",
-      "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
-      "referenceNumber": 93,
+      "licenseId": "OLDAP-2.4",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dcd1284c4a91a8a380d904eee68d1583f989ed386"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003dcd1284c4a91a8a380d904eee68d1583f989ed386=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.5",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
+      "referenceNumber": 443,
       "name": "Open LDAP Public License v2.5",
-      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
-      "referenceNumber": 651,
+      "licenseId": "OLDAP-2.5",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D6852b9d90022e8593c98205413380536b1b5a7cf"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d6852b9d90022e8593c98205413380536b1b5a7cf=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.6",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
+      "referenceNumber": 344,
       "name": "Open LDAP Public License v2.6",
-      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
-      "referenceNumber": 568,
+      "licenseId": "OLDAP-2.6",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D1cae062821881f41b73012ba816434897abf4205"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d1cae062821881f41b73012ba816434897abf4205=
"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.7.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "OLDAP-2.7",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.7.json",
+      "referenceNumber": 574,
       "name": "Open LDAP Public License v2.7",
-      "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
-      "referenceNumber": 220,
+      "licenseId": "OLDAP-2.7",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D47c2415c1df81556eeb39be6cad458ef87c534a2"
-      ]
+        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\=
u003dblob;f\u003dLICENSE;hb\u003d47c2415c1df81556eeb39be6cad458ef87c534a2=
"
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.8.json",
+      "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OLDAP-2.8",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.8.json",
+      "referenceNumber": 364,
       "name": "Open LDAP Public License v2.8",
-      "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
-      "referenceNumber": 5,
+      "licenseId": "OLDAP-2.8",
       "seeAlso": [
         "http://www.openldap.org/software/release/license.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OLFL-1.3.json",
+      "reference": "https://spdx.org/licenses/OLFL-1.3.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OLFL-1.3",
+      "detailsUrl": "https://spdx.org/licenses/OLFL-1.3.json",
+      "referenceNumber": 121,
       "name": "Open Logistics Foundation License Version 1.3",
-      "reference": "https://spdx.org/licenses/OLFL-1.3.html",
-      "referenceNumber": 142,
+      "licenseId": "OLFL-1.3",
       "seeAlso": [
         "https://openlogisticsfoundation.org/licenses/",
         "https://opensource.org/license/olfl-1-3/"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OML.json",
+      "reference": "https://spdx.org/licenses/OML.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OML",
+      "detailsUrl": "https://spdx.org/licenses/OML.json",
+      "referenceNumber": 116,
       "name": "Open Market License",
-      "reference": "https://spdx.org/licenses/OML.html",
-      "referenceNumber": 375,
+      "licenseId": "OML",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Open_Market_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OpenPBS-2.3.json",
+      "reference": "https://spdx.org/licenses/OpenPBS-2.3.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OpenPBS-2.3",
+      "detailsUrl": "https://spdx.org/licenses/OpenPBS-2.3.json",
+      "referenceNumber": 2,
       "name": "OpenPBS v2.3 Software License",
-      "reference": "https://spdx.org/licenses/OpenPBS-2.3.html",
-      "referenceNumber": 314,
+      "licenseId": "OpenPBS-2.3",
       "seeAlso": [
         "https://github.com/adaptivecomputing/torque/blob/master/PBS_Lic=
ense.txt",
         "https://www.mcs.anl.gov/research/projects/openpbs/PBS_License.t=
xt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
+      "reference": "https://spdx.org/licenses/OpenSSL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "OpenSSL",
+      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
+      "referenceNumber": 275,
       "name": "OpenSSL License",
-      "reference": "https://spdx.org/licenses/OpenSSL.html",
-      "referenceNumber": 303,
+      "licenseId": "OpenSSL",
       "seeAlso": [
         "http://www.openssl.org/source/license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OpenSSL-standalone.json",
+      "reference": "https://spdx.org/licenses/OpenSSL-standalone.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OpenSSL-standalone",
+      "detailsUrl": "https://spdx.org/licenses/OpenSSL-standalone.json",
+      "referenceNumber": 128,
       "name": "OpenSSL License - standalone",
-      "reference": "https://spdx.org/licenses/OpenSSL-standalone.html",
-      "referenceNumber": 602,
+      "licenseId": "OpenSSL-standalone",
       "seeAlso": [
         "https://library.netapp.com/ecm/ecm_download_file/ECMP1196395",
         "https://hstechdocs.helpsystems.com/manuals/globalscape/archive/=
cuteftp6/open_ssl_license_agreement.htm"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OpenVision.json",
+      "reference": "https://spdx.org/licenses/OpenVision.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OpenVision",
+      "detailsUrl": "https://spdx.org/licenses/OpenVision.json",
+      "referenceNumber": 36,
       "name": "OpenVision License",
-      "reference": "https://spdx.org/licenses/OpenVision.html",
-      "referenceNumber": 588,
+      "licenseId": "OpenVision",
       "seeAlso": [
         "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L66-=
L98",
         "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html",
         "https://fedoraproject.org/wiki/Licensing:MIT#OpenVision_Variant=
"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
+      "reference": "https://spdx.org/licenses/OPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "OPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
+      "referenceNumber": 614,
       "name": "Open Public License v1.0",
-      "reference": "https://spdx.org/licenses/OPL-1.0.html",
-      "referenceNumber": 91,
+      "licenseId": "OPL-1.0",
       "seeAlso": [
         "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
         "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OPL-UK-3.0.json",
+      "reference": "https://spdx.org/licenses/OPL-UK-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OPL-UK-3.0",
+      "detailsUrl": "https://spdx.org/licenses/OPL-UK-3.0.json",
+      "referenceNumber": 285,
       "name": "United    Kingdom Open Parliament Licence v3.0",
-      "reference": "https://spdx.org/licenses/OPL-UK-3.0.html",
-      "referenceNumber": 480,
+      "licenseId": "OPL-UK-3.0",
       "seeAlso": [
         "https://www.parliament.uk/site-information/copyright-parliament=
/open-parliament-licence/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
+      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "OPUBL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
+      "referenceNumber": 414,
       "name": "Open Publication License v1.0",
-      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
-      "referenceNumber": 329,
+      "licenseId": "OPUBL-1.0",
       "seeAlso": [
         "http://opencontent.org/openpub/",
         "https://www.debian.org/opl",
         "https://www.ctan.org/license/opl"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
+      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "OSET-PL-2.1",
+      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
+      "referenceNumber": 183,
       "name": "OSET Public License version 2.1",
-      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
-      "referenceNumber": 517,
+      "licenseId": "OSET-PL-2.1",
       "seeAlso": [
         "http://www.osetfoundation.org/public-license",
         "https://opensource.org/licenses/OPL-2.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OSL-1.0.json",
+      "reference": "https://spdx.org/licenses/OSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "OSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/OSL-1.0.json",
+      "referenceNumber": 651,
       "name": "Open Software License 1.0",
-      "reference": "https://spdx.org/licenses/OSL-1.0.html",
-      "referenceNumber": 162,
+      "licenseId": "OSL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/OSL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OSL-1.1.json",
+      "reference": "https://spdx.org/licenses/OSL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "OSL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/OSL-1.1.json",
+      "referenceNumber": 453,
       "name": "Open Software License 1.1",
-      "reference": "https://spdx.org/licenses/OSL-1.1.html",
-      "referenceNumber": 586,
+      "licenseId": "OSL-1.1",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/OSL1.1"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OSL-2.0.json",
+      "reference": "https://spdx.org/licenses/OSL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "OSL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/OSL-2.0.json",
+      "referenceNumber": 179,
       "name": "Open Software License 2.0",
-      "reference": "https://spdx.org/licenses/OSL-2.0.html",
-      "referenceNumber": 531,
+      "licenseId": "OSL-2.0",
       "seeAlso": [
         "http://web.archive.org/web/20041020171434/http://www.rosenlaw.c=
om/osl2.0.html"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OSL-2.1.json",
+      "reference": "https://spdx.org/licenses/OSL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "OSL-2.1",
+      "detailsUrl": "https://spdx.org/licenses/OSL-2.1.json",
+      "referenceNumber": 29,
       "name": "Open Software License 2.1",
-      "reference": "https://spdx.org/licenses/OSL-2.1.html",
-      "referenceNumber": 138,
+      "licenseId": "OSL-2.1",
       "seeAlso": [
         "http://web.archive.org/web/20050212003940/http://www.rosenlaw.c=
om/osl21.htm",
         "https://opensource.org/licenses/OSL-2.1"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
+      "reference": "https://spdx.org/licenses/OSL-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "OSL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
+      "referenceNumber": 3,
       "name": "Open Software License 3.0",
-      "reference": "https://spdx.org/licenses/OSL-3.0.html",
-      "referenceNumber": 300,
+      "licenseId": "OSL-3.0",
       "seeAlso": [
         "https://web.archive.org/web/20120101081418/http://rosenlaw.com:=
80/OSL3.0.htm",
         "https://opensource.org/licenses/OSL-3.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PADL.json",
+      "reference": "https://spdx.org/licenses/PADL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "PADL",
+      "detailsUrl": "https://spdx.org/licenses/PADL.json",
+      "referenceNumber": 284,
       "name": "PADL License",
-      "reference": "https://spdx.org/licenses/PADL.html",
-      "referenceNumber": 113,
+      "licenseId": "PADL",
       "seeAlso": [
-        "https://git.openldap.org/openldap/openldap/-/blob/master/librar=
ies/libldap/os-local.c?ref_type=3Dheads#L19-23"
-      ]
+        "https://git.openldap.org/openldap/openldap/-/blob/master/librar=
ies/libldap/os-local.c?ref_type\u003dheads#L19-23"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Parity-6.0.0.json",
+      "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Parity-6.0.0",
+      "detailsUrl": "https://spdx.org/licenses/Parity-6.0.0.json",
+      "referenceNumber": 241,
       "name": "The Parity Public License 6.0.0",
-      "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
-      "referenceNumber": 246,
+      "licenseId": "Parity-6.0.0",
       "seeAlso": [
         "https://paritylicense.com/versions/6.0.0.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Parity-7.0.0.json",
+      "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Parity-7.0.0",
+      "detailsUrl": "https://spdx.org/licenses/Parity-7.0.0.json",
+      "referenceNumber": 235,
       "name": "The Parity Public License 7.0.0",
-      "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
-      "referenceNumber": 212,
+      "licenseId": "Parity-7.0.0",
       "seeAlso": [
         "https://paritylicense.com/versions/7.0.0.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PDDL-1.0.json",
+      "reference": "https://spdx.org/licenses/PDDL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
+      "detailsUrl": "https://spdx.org/licenses/PDDL-1.0.json",
+      "referenceNumber": 684,
+      "name": "Open Data Commons Public Domain Dedication \u0026 License=
 1.0",
       "licenseId": "PDDL-1.0",
-      "name": "Open Data Commons Public Domain Dedication & License 1.0"=
,
-      "reference": "https://spdx.org/licenses/PDDL-1.0.html",
-      "referenceNumber": 493,
       "seeAlso": [
         "http://opendatacommons.org/licenses/pddl/1.0/",
         "https://opendatacommons.org/licenses/pddl/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PHP-3.0.json",
+      "reference": "https://spdx.org/licenses/PHP-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "PHP-3.0",
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.0.json",
+      "referenceNumber": 133,
       "name": "PHP License v3.0",
-      "reference": "https://spdx.org/licenses/PHP-3.0.html",
-      "referenceNumber": 584,
+      "licenseId": "PHP-3.0",
       "seeAlso": [
         "http://www.php.net/license/3_0.txt",
         "https://opensource.org/licenses/PHP-3.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
+      "reference": "https://spdx.org/licenses/PHP-3.01.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "PHP-3.01",
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
+      "referenceNumber": 221,
       "name": "PHP License v3.01",
-      "reference": "https://spdx.org/licenses/PHP-3.01.html",
-      "referenceNumber": 538,
+      "licenseId": "PHP-3.01",
       "seeAlso": [
         "http://www.php.net/license/3_01.txt"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Pixar.json",
+      "reference": "https://spdx.org/licenses/Pixar.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Pixar",
+      "detailsUrl": "https://spdx.org/licenses/Pixar.json",
+      "referenceNumber": 435,
       "name": "Pixar License",
-      "reference": "https://spdx.org/licenses/Pixar.html",
-      "referenceNumber": 204,
+      "licenseId": "Pixar",
       "seeAlso": [
         "https://github.com/PixarAnimationStudios/OpenSubdiv/raw/v3_5_0/=
LICENSE.txt",
         "https://graphics.pixar.com/opensubdiv/docs/license.html",
         "https://github.com/PixarAnimationStudios/OpenSubdiv/blob/v3_5_0=
/opensubdiv/version.cpp#L2-L22"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/pkgconf.json",
+      "reference": "https://spdx.org/licenses/pkgconf.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "pkgconf",
+      "detailsUrl": "https://spdx.org/licenses/pkgconf.json",
+      "referenceNumber": 670,
       "name": "pkgconf License",
-      "reference": "https://spdx.org/licenses/pkgconf.html",
-      "referenceNumber": 389,
+      "licenseId": "pkgconf",
       "seeAlso": [
         "https://github.com/pkgconf/pkgconf/blob/master/cli/main.c#L8"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
+      "reference": "https://spdx.org/licenses/Plexus.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Plexus",
+      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
+      "referenceNumber": 181,
       "name": "Plexus Classworlds License",
-      "reference": "https://spdx.org/licenses/Plexus.html",
-      "referenceNumber": 141,
+      "licenseId": "Plexus",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_Lic=
ense"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/pnmstitch.json",
+      "reference": "https://spdx.org/licenses/pnmstitch.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "pnmstitch",
+      "detailsUrl": "https://spdx.org/licenses/pnmstitch.json",
+      "referenceNumber": 691,
       "name": "pnmstitch License",
-      "reference": "https://spdx.org/licenses/pnmstitch.html",
-      "referenceNumber": 158,
+      "licenseId": "pnmstitch",
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/ed=
itor/pnmstitch.c#l2"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.=
0.0.json",
+      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0=
.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "PolyForm-Noncommercial-1.0.0",
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.=
0.0.json",
+      "referenceNumber": 119,
       "name": "PolyForm Noncommercial License 1.0.0",
-      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0=
.0.html",
-      "referenceNumber": 54,
+      "licenseId": "PolyForm-Noncommercial-1.0.0",
       "seeAlso": [
         "https://polyformproject.org/licenses/noncommercial/1.0.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PolyForm-Small-Business-1=
.0.0.json",
+      "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.=
0.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "PolyForm-Small-Business-1.0.0",
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Small-Business-1=
.0.0.json",
+      "referenceNumber": 30,
       "name": "PolyForm Small Business License 1.0.0",
-      "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.=
0.0.html",
-      "referenceNumber": 594,
+      "licenseId": "PolyForm-Small-Business-1.0.0",
       "seeAlso": [
         "https://polyformproject.org/licenses/small-business/1.0.0"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
+      "reference": "https://spdx.org/licenses/PostgreSQL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "PostgreSQL",
+      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
+      "referenceNumber": 697,
       "name": "PostgreSQL License",
-      "reference": "https://spdx.org/licenses/PostgreSQL.html",
-      "referenceNumber": 643,
+      "licenseId": "PostgreSQL",
       "seeAlso": [
         "http://www.postgresql.org/about/licence",
         "https://opensource.org/licenses/PostgreSQL"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PPL.json",
+      "reference": "https://spdx.org/licenses/PPL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "PPL",
+      "detailsUrl": "https://spdx.org/licenses/PPL.json",
+      "referenceNumber": 150,
       "name": "Peer Production License",
-      "reference": "https://spdx.org/licenses/PPL.html",
-      "referenceNumber": 580,
+      "licenseId": "PPL",
       "seeAlso": [
         "https://wiki.p2pfoundation.net/Peer_Production_License",
         "http://www.networkcultures.org/_uploads/%233notebook_telekommun=
ist.pdf"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/PSF-2.0.json",
+      "reference": "https://spdx.org/licenses/PSF-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "PSF-2.0",
+      "detailsUrl": "https://spdx.org/licenses/PSF-2.0.json",
+      "referenceNumber": 211,
       "name": "Python Software Foundation License 2.0",
-      "reference": "https://spdx.org/licenses/PSF-2.0.html",
-      "referenceNumber": 55,
+      "licenseId": "PSF-2.0",
       "seeAlso": [
-        "https://opensource.org/licenses/Python-2.0"
-      ]
+        "https://opensource.org/licenses/Python-2.0",
+        "https://matplotlib.org/stable/project/license.html"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/psfrag.json",
+      "reference": "https://spdx.org/licenses/psfrag.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "psfrag",
+      "detailsUrl": "https://spdx.org/licenses/psfrag.json",
+      "referenceNumber": 423,
       "name": "psfrag License",
-      "reference": "https://spdx.org/licenses/psfrag.html",
-      "referenceNumber": 555,
+      "licenseId": "psfrag",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/psfrag"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/psutils.json",
+      "reference": "https://spdx.org/licenses/psutils.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "psutils",
+      "detailsUrl": "https://spdx.org/licenses/psutils.json",
+      "referenceNumber": 500,
       "name": "psutils License",
-      "reference": "https://spdx.org/licenses/psutils.html",
-      "referenceNumber": 260,
+      "licenseId": "psutils",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/psutils"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Python-2.0.json",
+      "reference": "https://spdx.org/licenses/Python-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Python-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Python-2.0.json",
+      "referenceNumber": 628,
       "name": "Python License 2.0",
-      "reference": "https://spdx.org/licenses/Python-2.0.html",
-      "referenceNumber": 285,
+      "licenseId": "Python-2.0",
       "seeAlso": [
         "https://opensource.org/licenses/Python-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Python-2.0.1.json",
+      "reference": "https://spdx.org/licenses/Python-2.0.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Python-2.0.1",
+      "detailsUrl": "https://spdx.org/licenses/Python-2.0.1.json",
+      "referenceNumber": 586,
       "name": "Python License 2.0.1",
-      "reference": "https://spdx.org/licenses/Python-2.0.1.html",
-      "referenceNumber": 201,
+      "licenseId": "Python-2.0.1",
       "seeAlso": [
         "https://www.python.org/download/releases/2.0.1/license/",
         "https://docs.python.org/3/license.html",
         "https://github.com/python/cpython/blob/main/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/python-ldap.json",
+      "reference": "https://spdx.org/licenses/python-ldap.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "python-ldap",
+      "detailsUrl": "https://spdx.org/licenses/python-ldap.json",
+      "referenceNumber": 630,
       "name": "Python ldap License",
-      "reference": "https://spdx.org/licenses/python-ldap.html",
-      "referenceNumber": 446,
+      "licenseId": "python-ldap",
       "seeAlso": [
         "https://github.com/python-ldap/python-ldap/blob/main/LICENCE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
+      "reference": "https://spdx.org/licenses/Qhull.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Qhull",
+      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
+      "referenceNumber": 590,
       "name": "Qhull License",
-      "reference": "https://spdx.org/licenses/Qhull.html",
-      "referenceNumber": 326,
+      "licenseId": "Qhull",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Qhull"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/QPL-1.0.json",
+      "reference": "https://spdx.org/licenses/QPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "QPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/QPL-1.0.json",
+      "referenceNumber": 693,
       "name": "Q Public License 1.0",
-      "reference": "https://spdx.org/licenses/QPL-1.0.html",
-      "referenceNumber": 413,
+      "licenseId": "QPL-1.0",
       "seeAlso": [
         "http://doc.qt.nokia.com/3.3/license.html",
         "https://opensource.org/licenses/QPL-1.0",
         "https://doc.qt.io/archives/3.3/license.html"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.json",
+      "reference": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "QPL-1.0-INRIA-2004",
+      "detailsUrl": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.json",
+      "referenceNumber": 117,
       "name": "Q Public License 1.0 - INRIA 2004 variant",
-      "reference": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.html",
-      "referenceNumber": 486,
+      "licenseId": "QPL-1.0-INRIA-2004",
       "seeAlso": [
         "https://github.com/maranget/hevea/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/radvd.json",
+      "reference": "https://spdx.org/licenses/radvd.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "radvd",
+      "detailsUrl": "https://spdx.org/licenses/radvd.json",
+      "referenceNumber": 678,
       "name": "radvd License",
-      "reference": "https://spdx.org/licenses/radvd.html",
-      "referenceNumber": 433,
+      "licenseId": "radvd",
       "seeAlso": [
         "https://github.com/radvd-project/radvd/blob/master/COPYRIGHT"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
+      "reference": "https://spdx.org/licenses/Rdisc.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Rdisc",
+      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
+      "referenceNumber": 4,
       "name": "Rdisc License",
-      "reference": "https://spdx.org/licenses/Rdisc.html",
-      "referenceNumber": 50,
+      "licenseId": "Rdisc",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
+      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": false,
-      "licenseId": "RHeCos-1.1",
+      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
+      "referenceNumber": 258,
       "name": "Red Hat eCos Public License v1.1",
-      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
-      "referenceNumber": 99,
+      "licenseId": "RHeCos-1.1",
       "seeAlso": [
         "http://ecos.sourceware.org/old-license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/RPL-1.1.json",
+      "reference": "https://spdx.org/licenses/RPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "RPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/RPL-1.1.json",
+      "referenceNumber": 57,
       "name": "Reciprocal Public License 1.1",
-      "reference": "https://spdx.org/licenses/RPL-1.1.html",
-      "referenceNumber": 205,
+      "licenseId": "RPL-1.1",
       "seeAlso": [
         "https://opensource.org/licenses/RPL-1.1"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/RPL-1.5.json",
+      "reference": "https://spdx.org/licenses/RPL-1.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "RPL-1.5",
+      "detailsUrl": "https://spdx.org/licenses/RPL-1.5.json",
+      "referenceNumber": 413,
       "name": "Reciprocal Public License 1.5",
-      "reference": "https://spdx.org/licenses/RPL-1.5.html",
-      "referenceNumber": 52,
+      "licenseId": "RPL-1.5",
       "seeAlso": [
         "https://opensource.org/licenses/RPL-1.5"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/RPSL-1.0.json",
+      "reference": "https://spdx.org/licenses/RPSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "RPSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/RPSL-1.0.json",
+      "referenceNumber": 104,
       "name": "RealNetworks Public Source License v1.0",
-      "reference": "https://spdx.org/licenses/RPSL-1.0.html",
-      "referenceNumber": 637,
+      "licenseId": "RPSL-1.0",
       "seeAlso": [
         "https://helixcommunity.org/content/rpsl",
         "https://opensource.org/licenses/RPSL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
+      "reference": "https://spdx.org/licenses/RSA-MD.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "RSA-MD",
+      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
+      "referenceNumber": 12,
       "name": "RSA Message-Digest License",
-      "reference": "https://spdx.org/licenses/RSA-MD.html",
-      "referenceNumber": 496,
+      "licenseId": "RSA-MD",
       "seeAlso": [
         "http://www.faqs.org/rfcs/rfc1321.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
+      "reference": "https://spdx.org/licenses/RSCPL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "RSCPL",
+      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
+      "referenceNumber": 166,
       "name": "Ricoh Source Code Public License",
-      "reference": "https://spdx.org/licenses/RSCPL.html",
-      "referenceNumber": 235,
+      "licenseId": "RSCPL",
       "seeAlso": [
         "http://wayback.archive.org/web/20060715140826/http://www.risour=
ce.org/RPL/RPL-1.0A.shtml",
         "https://opensource.org/licenses/RSCPL"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Ruby.json",
+      "reference": "https://spdx.org/licenses/Ruby.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Ruby",
+      "detailsUrl": "https://spdx.org/licenses/Ruby.json",
+      "referenceNumber": 490,
       "name": "Ruby License",
-      "reference": "https://spdx.org/licenses/Ruby.html",
-      "referenceNumber": 223,
+      "licenseId": "Ruby",
       "seeAlso": [
         "https://www.ruby-lang.org/en/about/license.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
+      "reference": "https://spdx.org/licenses/Ruby-pty.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SAX-PD",
+      "detailsUrl": "https://spdx.org/licenses/Ruby-pty.json",
+      "referenceNumber": 509,
+      "name": "Ruby pty extension license",
+      "licenseId": "Ruby-pty",
+      "seeAlso": [
+        "https://github.com/ruby/ruby/blob/9f6deaa6888a423720b4b127b5314=
f0ad26cc2e6/ext/pty/pty.c#L775-L786",
+        "https://github.com/ruby/ruby/commit/0a64817fb80016030c03518fb94=
59f63c11605ea#diff-ef5fa30838d6d0cecad9e675cc50b24628cfe2cb277c346053fafc=
c36c91c204",
+        "https://github.com/ruby/ruby/commit/0a64817fb80016030c03518fb94=
59f63c11605ea#diff-fedf217c1ce44bda01f0a678d3ff8b198bed478754d699c527a698=
ad933979a0"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/SAX-PD.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
+      "referenceNumber": 22,
       "name": "Sax Public Domain Notice",
-      "reference": "https://spdx.org/licenses/SAX-PD.html",
-      "referenceNumber": 301,
+      "licenseId": "SAX-PD",
       "seeAlso": [
         "http://www.saxproject.org/copying.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SAX-PD-2.0.json",
+      "reference": "https://spdx.org/licenses/SAX-PD-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SAX-PD-2.0",
+      "detailsUrl": "https://spdx.org/licenses/SAX-PD-2.0.json",
+      "referenceNumber": 346,
       "name": "Sax Public Domain Notice 2.0",
-      "reference": "https://spdx.org/licenses/SAX-PD-2.0.html",
-      "referenceNumber": 561,
+      "licenseId": "SAX-PD-2.0",
       "seeAlso": [
         "http://www.saxproject.org/copying.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Saxpath.json",
+      "reference": "https://spdx.org/licenses/Saxpath.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Saxpath",
+      "detailsUrl": "https://spdx.org/licenses/Saxpath.json",
+      "referenceNumber": 390,
       "name": "Saxpath License",
-      "reference": "https://spdx.org/licenses/Saxpath.html",
-      "referenceNumber": 109,
+      "licenseId": "Saxpath",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Saxpath_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
+      "reference": "https://spdx.org/licenses/SCEA.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SCEA",
+      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
+      "referenceNumber": 484,
       "name": "SCEA Shared Source License",
-      "reference": "https://spdx.org/licenses/SCEA.html",
-      "referenceNumber": 35,
+      "licenseId": "SCEA",
       "seeAlso": [
         "http://research.scea.com/scea_shared_source_license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SchemeReport.json",
+      "reference": "https://spdx.org/licenses/SchemeReport.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SchemeReport",
+      "detailsUrl": "https://spdx.org/licenses/SchemeReport.json",
+      "referenceNumber": 91,
       "name": "Scheme Language Report License",
-      "reference": "https://spdx.org/licenses/SchemeReport.html",
-      "referenceNumber": 425,
-      "seeAlso": []
+      "licenseId": "SchemeReport",
+      "seeAlso": [],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
+      "reference": "https://spdx.org/licenses/Sendmail.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Sendmail",
+      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
+      "referenceNumber": 266,
       "name": "Sendmail License",
-      "reference": "https://spdx.org/licenses/Sendmail.html",
-      "referenceNumber": 274,
+      "licenseId": "Sendmail",
       "seeAlso": [
         "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
         "https://web.archive.org/web/20160322142305/https://www.sendmail=
.com/pdfs/open_source/sendmail_license.pdf"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Sendmail-8.23.json",
+      "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Sendmail-8.23",
+      "detailsUrl": "https://spdx.org/licenses/Sendmail-8.23.json",
+      "referenceNumber": 55,
       "name": "Sendmail License 8.23",
-      "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
-      "referenceNumber": 247,
+      "licenseId": "Sendmail-8.23",
       "seeAlso": [
         "https://www.proofpoint.com/sites/default/files/sendmail-license=
.pdf",
         "https://web.archive.org/web/20181003101040/https://www.proofpoi=
nt.com/sites/default/files/sendmail-license.pdf"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.0.json",
+      "reference": "https://spdx.org/licenses/Sendmail-Open-Source-1.1.h=
tml",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SGI-B-1.0",
-      "name": "SGI Free Software License B v1.0",
+      "detailsUrl": "https://spdx.org/licenses/Sendmail-Open-Source-1.1.=
json",
+      "referenceNumber": 620,
+      "name": "Sendmail Open Source License v1.1",
+      "licenseId": "Sendmail-Open-Source-1.1",
+      "seeAlso": [
+        "https://github.com/trusteddomainproject/OpenDMARC/blob/master/L=
ICENSE.Sendmail"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/SGI-B-1.0.html",
-      "referenceNumber": 476,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.0.json",
+      "referenceNumber": 56,
+      "name": "SGI Free Software License B v1.0",
+      "licenseId": "SGI-B-1.0",
       "seeAlso": [
         "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.1.0.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.1.json",
+      "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SGI-B-1.1",
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.1.json",
+      "referenceNumber": 296,
       "name": "SGI Free Software License B v1.1",
-      "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
-      "referenceNumber": 456,
+      "licenseId": "SGI-B-1.1",
       "seeAlso": [
         "http://oss.sgi.com/projects/FreeB/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SGI-B-2.0.json",
+      "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "SGI-B-2.0",
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-2.0.json",
+      "referenceNumber": 617,
       "name": "SGI Free Software License B v2.0",
-      "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
-      "referenceNumber": 405,
+      "licenseId": "SGI-B-2.0",
       "seeAlso": [
         "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.2.0.pdf"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SGI-OpenGL.json",
+      "reference": "https://spdx.org/licenses/SGI-OpenGL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SGI-OpenGL",
+      "detailsUrl": "https://spdx.org/licenses/SGI-OpenGL.json",
+      "referenceNumber": 34,
       "name": "SGI OpenGL License",
-      "reference": "https://spdx.org/licenses/SGI-OpenGL.html",
-      "referenceNumber": 629,
+      "licenseId": "SGI-OpenGL",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/mesa/glw/-/blob/master/README?re=
f_type=3Dheads"
-      ]
+        "https://gitlab.freedesktop.org/mesa/glw/-/blob/master/README?re=
f_type\u003dheads"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SGP4.json",
+      "reference": "https://spdx.org/licenses/SGP4.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SGP4",
+      "detailsUrl": "https://spdx.org/licenses/SGP4.json",
+      "referenceNumber": 572,
       "name": "SGP4 Permission Notice",
-      "reference": "https://spdx.org/licenses/SGP4.html",
-      "referenceNumber": 336,
+      "licenseId": "SGP4",
       "seeAlso": [
         "https://celestrak.org/publications/AIAA/2006-6753/faq.php"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SHL-0.5.json",
+      "reference": "https://spdx.org/licenses/SHL-0.5.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SHL-0.5",
+      "detailsUrl": "https://spdx.org/licenses/SHL-0.5.json",
+      "referenceNumber": 267,
       "name": "Solderpad Hardware License v0.5",
-      "reference": "https://spdx.org/licenses/SHL-0.5.html",
-      "referenceNumber": 338,
+      "licenseId": "SHL-0.5",
       "seeAlso": [
         "https://solderpad.org/licenses/SHL-0.5/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SHL-0.51.json",
+      "reference": "https://spdx.org/licenses/SHL-0.51.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SHL-0.51",
+      "detailsUrl": "https://spdx.org/licenses/SHL-0.51.json",
+      "referenceNumber": 582,
       "name": "Solderpad Hardware License, Version 0.51",
-      "reference": "https://spdx.org/licenses/SHL-0.51.html",
-      "referenceNumber": 29,
+      "licenseId": "SHL-0.51",
       "seeAlso": [
         "https://solderpad.org/licenses/SHL-0.51/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SimPL-2.0.json",
+      "reference": "https://spdx.org/licenses/SimPL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "SimPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/SimPL-2.0.json",
+      "referenceNumber": 452,
       "name": "Simple Public License 2.0",
-      "reference": "https://spdx.org/licenses/SimPL-2.0.html",
-      "referenceNumber": 444,
+      "licenseId": "SimPL-2.0",
       "seeAlso": [
         "https://opensource.org/licenses/SimPL-2.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SISSL.json",
+      "reference": "https://spdx.org/licenses/SISSL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "SISSL",
+      "detailsUrl": "https://spdx.org/licenses/SISSL.json",
+      "referenceNumber": 110,
       "name": "Sun Industry Standards Source License v1.1",
-      "reference": "https://spdx.org/licenses/SISSL.html",
-      "referenceNumber": 268,
+      "licenseId": "SISSL",
       "seeAlso": [
         "http://www.openoffice.org/licenses/sissl_license.html",
         "https://opensource.org/licenses/SISSL"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
+      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SISSL-1.2",
+      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
+      "referenceNumber": 253,
       "name": "Sun Industry Standards Source License v1.2",
-      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
-      "referenceNumber": 502,
+      "licenseId": "SISSL-1.2",
       "seeAlso": [
         "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.h=
tml"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SL.json",
+      "reference": "https://spdx.org/licenses/SL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SL",
+      "detailsUrl": "https://spdx.org/licenses/SL.json",
+      "referenceNumber": 83,
       "name": "SL License",
-      "reference": "https://spdx.org/licenses/SL.html",
-      "referenceNumber": 645,
+      "licenseId": "SL",
       "seeAlso": [
         "https://github.com/mtoyoda/sl/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
+      "reference": "https://spdx.org/licenses/Sleepycat.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Sleepycat",
+      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
+      "referenceNumber": 42,
       "name": "Sleepycat License",
-      "reference": "https://spdx.org/licenses/Sleepycat.html",
-      "referenceNumber": 182,
+      "licenseId": "Sleepycat",
       "seeAlso": [
         "https://opensource.org/licenses/Sleepycat"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SMLNJ.json",
+      "reference": "https://spdx.org/licenses/SMAIL-GPL.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "SMLNJ",
-      "name": "Standard ML of New Jersey License",
+      "detailsUrl": "https://spdx.org/licenses/SMAIL-GPL.json",
+      "referenceNumber": 546,
+      "name": "SMAIL General Public License",
+      "licenseId": "SMAIL-GPL",
+      "seeAlso": [
+        "https://sources.debian.org/copyright/license/debianutils/4.11.2=
/"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/SMLNJ.html",
-      "referenceNumber": 148,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/SMLNJ.json",
+      "referenceNumber": 81,
+      "name": "Standard ML of New Jersey License",
+      "licenseId": "SMLNJ",
       "seeAlso": [
         "https://www.smlnj.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
+      "reference": "https://spdx.org/licenses/SMPPL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SMPPL",
+      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
+      "referenceNumber": 579,
       "name": "Secure Messaging Protocol Public License",
-      "reference": "https://spdx.org/licenses/SMPPL.html",
-      "referenceNumber": 250,
+      "licenseId": "SMPPL",
       "seeAlso": [
         "https://github.com/dcblake/SMP/blob/master/Documentation/Licens=
e.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SNIA.json",
+      "reference": "https://spdx.org/licenses/SNIA.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SNIA",
+      "detailsUrl": "https://spdx.org/licenses/SNIA.json",
+      "referenceNumber": 224,
       "name": "SNIA Public License 1.1",
-      "reference": "https://spdx.org/licenses/SNIA.html",
-      "referenceNumber": 518,
+      "licenseId": "SNIA",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/SNIA_Public_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/snprintf.json",
+      "reference": "https://spdx.org/licenses/snprintf.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "snprintf",
+      "detailsUrl": "https://spdx.org/licenses/snprintf.json",
+      "referenceNumber": 594,
       "name": "snprintf License",
-      "reference": "https://spdx.org/licenses/snprintf.html",
-      "referenceNumber": 161,
+      "licenseId": "snprintf",
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/master/openbsd=
-compat/bsd-snprintf.c#L2"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/softSurfer.json",
+      "reference": "https://spdx.org/licenses/SOFA.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "softSurfer",
-      "name": "softSurfer License",
+      "detailsUrl": "https://spdx.org/licenses/SOFA.json",
+      "referenceNumber": 375,
+      "name": "SOFA Software License",
+      "licenseId": "SOFA",
+      "seeAlso": [
+        "http://www.iausofa.org/tandc.html"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/softSurfer.html",
-      "referenceNumber": 523,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/softSurfer.json",
+      "referenceNumber": 593,
+      "name": "softSurfer License",
+      "licenseId": "softSurfer",
       "seeAlso": [
         "https://github.com/mm2/Little-CMS/blob/master/src/cmssm.c#L207"=
,
         "https://fedoraproject.org/wiki/Licensing/softSurfer"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Soundex.json",
+      "reference": "https://spdx.org/licenses/Soundex.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Soundex",
+      "detailsUrl": "https://spdx.org/licenses/Soundex.json",
+      "referenceNumber": 374,
       "name": "Soundex License",
-      "reference": "https://spdx.org/licenses/Soundex.html",
-      "referenceNumber": 368,
+      "licenseId": "Soundex",
       "seeAlso": [
         "https://metacpan.org/release/RJBS/Text-Soundex-3.05/source/Soun=
dex.pm#L3-11"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
+      "reference": "https://spdx.org/licenses/Spencer-86.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Spencer-86",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
+      "referenceNumber": 193,
       "name": "Spencer License 86",
-      "reference": "https://spdx.org/licenses/Spencer-86.html",
-      "referenceNumber": 472,
+      "licenseId": "Spencer-86",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_L=
ibrary_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Spencer-94.json",
+      "reference": "https://spdx.org/licenses/Spencer-94.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Spencer-94",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-94.json",
+      "referenceNumber": 451,
       "name": "Spencer License 94",
-      "reference": "https://spdx.org/licenses/Spencer-94.html",
-      "referenceNumber": 378,
+      "licenseId": "Spencer-94",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_L=
ibrary_License",
         "https://metacpan.org/release/KNOK/File-MMagic-1.30/source/COPYI=
NG#L28"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
+      "reference": "https://spdx.org/licenses/Spencer-99.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Spencer-99",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
+      "referenceNumber": 220,
       "name": "Spencer License 99",
-      "reference": "https://spdx.org/licenses/Spencer-99.html",
-      "referenceNumber": 139,
+      "licenseId": "Spencer-99",
       "seeAlso": [
         "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/re=
gfronts.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SPL-1.0.json",
+      "reference": "https://spdx.org/licenses/SPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "SPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/SPL-1.0.json",
+      "referenceNumber": 342,
       "name": "Sun Public License v1.0",
-      "reference": "https://spdx.org/licenses/SPL-1.0.html",
-      "referenceNumber": 280,
+      "licenseId": "SPL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/SPL-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ssh-keyscan.json",
+      "reference": "https://spdx.org/licenses/ssh-keyscan.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ssh-keyscan",
+      "detailsUrl": "https://spdx.org/licenses/ssh-keyscan.json",
+      "referenceNumber": 537,
       "name": "ssh-keyscan License",
-      "reference": "https://spdx.org/licenses/ssh-keyscan.html",
-      "referenceNumber": 294,
+      "licenseId": "ssh-keyscan",
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/master/LICENCE=
#L82"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
+      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SSH-OpenSSH",
+      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
+      "referenceNumber": 463,
       "name": "SSH OpenSSH license",
-      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
-      "referenceNumber": 506,
+      "licenseId": "SSH-OpenSSH",
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c=
59838b5fa574cd456d6047b2d4/LICENCE#L10"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SSH-short.json",
+      "reference": "https://spdx.org/licenses/SSH-short.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SSH-short",
+      "detailsUrl": "https://spdx.org/licenses/SSH-short.json",
+      "referenceNumber": 573,
       "name": "SSH short notice",
-      "reference": "https://spdx.org/licenses/SSH-short.html",
-      "referenceNumber": 563,
+      "licenseId": "SSH-short",
       "seeAlso": [
         "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c=
59838b5fa574cd456d6047b2d4/pathnames.h",
         "http://web.mit.edu/kolya/.f/root/athena.mit.edu/sipb.mit.edu/pr=
oject/openssh/OldFiles/src/openssh-2.9.9p2/ssh-add.1",
         "https://joinup.ec.europa.eu/svn/lesoll/trunk/italc/lib/src/dsa_=
key.cpp"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SSLeay-standalone.json",
+      "reference": "https://spdx.org/licenses/SSLeay-standalone.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SSLeay-standalone",
+      "detailsUrl": "https://spdx.org/licenses/SSLeay-standalone.json",
+      "referenceNumber": 96,
       "name": "SSLeay License - standalone",
-      "reference": "https://spdx.org/licenses/SSLeay-standalone.html",
-      "referenceNumber": 591,
+      "licenseId": "SSLeay-standalone",
       "seeAlso": [
         "https://www.tq-group.com/filedownloads/files/software-license-c=
onditions/OriginalSSLeay/OriginalSSLeay.pdf"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
+      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SSPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
+      "referenceNumber": 664,
       "name": "Server Side Public License, v 1",
-      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
-      "referenceNumber": 17,
+      "licenseId": "SSPL-1.0",
       "seeAlso": [
         "https://www.mongodb.com/licensing/server-side-public-license"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/StandardML-NJ.json",
+      "reference": "https://spdx.org/licenses/StandardML-NJ.html",
       "isDeprecatedLicenseId": true,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "StandardML-NJ",
+      "detailsUrl": "https://spdx.org/licenses/StandardML-NJ.json",
+      "referenceNumber": 501,
       "name": "Standard ML of New Jersey License",
-      "reference": "https://spdx.org/licenses/StandardML-NJ.html",
-      "referenceNumber": 658,
+      "licenseId": "StandardML-NJ",
       "seeAlso": [
         "https://www.smlnj.org/license.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SugarCRM-1.1.3.json",
+      "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SugarCRM-1.1.3",
+      "detailsUrl": "https://spdx.org/licenses/SugarCRM-1.1.3.json",
+      "referenceNumber": 222,
       "name": "SugarCRM Public License v1.1.3",
-      "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
-      "referenceNumber": 42,
+      "licenseId": "SugarCRM-1.1.3",
       "seeAlso": [
         "http://www.sugarcrm.com/crm/SPL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Sun-PPP.json",
+      "reference": "https://spdx.org/licenses/SUL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Sun-PPP",
-      "name": "Sun PPP License",
+      "detailsUrl": "https://spdx.org/licenses/SUL-1.0.json",
+      "referenceNumber": 557,
+      "name": "Sustainable Use License v1.0",
+      "licenseId": "SUL-1.0",
+      "seeAlso": [
+        "https://github.com/n8n-io/n8n/blob/master/LICENSE.md"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Sun-PPP.html",
-      "referenceNumber": 385,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Sun-PPP.json",
+      "referenceNumber": 39,
+      "name": "Sun PPP License",
+      "licenseId": "Sun-PPP",
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/pppd/eap.c#L7-L1=
6"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Sun-PPP-2000.json",
+      "reference": "https://spdx.org/licenses/Sun-PPP-2000.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Sun-PPP-2000",
+      "detailsUrl": "https://spdx.org/licenses/Sun-PPP-2000.json",
+      "referenceNumber": 70,
       "name": "Sun PPP License (2000)",
-      "reference": "https://spdx.org/licenses/Sun-PPP-2000.html",
-      "referenceNumber": 310,
+      "licenseId": "Sun-PPP-2000",
       "seeAlso": [
         "https://github.com/ppp-project/ppp/blob/master/modules/ppp_ahdl=
c.c#L7-L19"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SunPro.json",
+      "reference": "https://spdx.org/licenses/SunPro.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SunPro",
+      "detailsUrl": "https://spdx.org/licenses/SunPro.json",
+      "referenceNumber": 395,
       "name": "SunPro License",
-      "reference": "https://spdx.org/licenses/SunPro.html",
-      "referenceNumber": 57,
+      "licenseId": "SunPro",
       "seeAlso": [
         "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e=
_acosh.c",
         "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e=
_lgammal.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/SWL.json",
+      "reference": "https://spdx.org/licenses/SWL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "SWL",
+      "detailsUrl": "https://spdx.org/licenses/SWL.json",
+      "referenceNumber": 196,
       "name": "Scheme Widget Library (SWL) Software License Agreement",
-      "reference": "https://spdx.org/licenses/SWL.html",
-      "referenceNumber": 649,
+      "licenseId": "SWL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/SWL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/swrule.json",
+      "reference": "https://spdx.org/licenses/swrule.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "swrule",
+      "detailsUrl": "https://spdx.org/licenses/swrule.json",
+      "referenceNumber": 348,
       "name": "swrule License",
-      "reference": "https://spdx.org/licenses/swrule.html",
-      "referenceNumber": 90,
+      "licenseId": "swrule",
       "seeAlso": [
         "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/misc=
/swrule.sty"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Symlinks.json",
+      "reference": "https://spdx.org/licenses/Symlinks.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Symlinks",
+      "detailsUrl": "https://spdx.org/licenses/Symlinks.json",
+      "referenceNumber": 517,
       "name": "Symlinks License",
-      "reference": "https://spdx.org/licenses/Symlinks.html",
-      "referenceNumber": 414,
+      "licenseId": "Symlinks",
       "seeAlso": [
         "https://www.mail-archive.com/debian-bugs-rc@lists.debian.org/ms=
g11494.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TAPR-OHL-1.0.json",
+      "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TAPR-OHL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/TAPR-OHL-1.0.json",
+      "referenceNumber": 80,
       "name": "TAPR Open Hardware License v1.0",
-      "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
-      "referenceNumber": 242,
+      "licenseId": "TAPR-OHL-1.0",
       "seeAlso": [
         "https://www.tapr.org/OHL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TCL.json",
+      "reference": "https://spdx.org/licenses/TCL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TCL",
+      "detailsUrl": "https://spdx.org/licenses/TCL.json",
+      "referenceNumber": 625,
       "name": "TCL/TK License",
-      "reference": "https://spdx.org/licenses/TCL.html",
-      "referenceNumber": 2,
+      "licenseId": "TCL",
       "seeAlso": [
         "http://www.tcl.tk/software/tcltk/license.html",
         "https://fedoraproject.org/wiki/Licensing/TCL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TCP-wrappers.json",
+      "reference": "https://spdx.org/licenses/TCP-wrappers.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TCP-wrappers",
+      "detailsUrl": "https://spdx.org/licenses/TCP-wrappers.json",
+      "referenceNumber": 278,
       "name": "TCP Wrappers License",
-      "reference": "https://spdx.org/licenses/TCP-wrappers.html",
-      "referenceNumber": 9,
+      "licenseId": "TCP-wrappers",
       "seeAlso": [
         "http://rc.quest.com/topics/openssh/license.php#tcpwrappers"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TermReadKey.json",
+      "reference": "https://spdx.org/licenses/TermReadKey.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TermReadKey",
+      "detailsUrl": "https://spdx.org/licenses/TermReadKey.json",
+      "referenceNumber": 619,
       "name": "TermReadKey License",
-      "reference": "https://spdx.org/licenses/TermReadKey.html",
-      "referenceNumber": 256,
+      "licenseId": "TermReadKey",
       "seeAlso": [
         "https://github.com/jonathanstowe/TermReadKey/blob/master/README=
#L9-L10"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TGPPL-1.0.json",
+      "reference": "https://spdx.org/licenses/TGPPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TGPPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/TGPPL-1.0.json",
+      "referenceNumber": 142,
       "name": "Transitive Grace Period Public Licence 1.0",
-      "reference": "https://spdx.org/licenses/TGPPL-1.0.html",
-      "referenceNumber": 101,
+      "licenseId": "TGPPL-1.0",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TGPPL",
         "https://tahoe-lafs.org/trac/tahoe-lafs/browser/trunk/COPYING.TG=
PPL.rst"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/threeparttable.json",
+      "reference": "https://spdx.org/licenses/ThirdEye.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "threeparttable",
-      "name": "threeparttable License",
+      "detailsUrl": "https://spdx.org/licenses/ThirdEye.json",
+      "referenceNumber": 403,
+      "name": "ThirdEye License",
+      "licenseId": "ThirdEye",
+      "seeAlso": [
+        "https://sourceware.org/cgit/binutils-gdb/tree/include/coff/symc=
onst.h#n11"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/threeparttable.html",
-      "referenceNumber": 398,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/threeparttable.json",
+      "referenceNumber": 14,
+      "name": "threeparttable License",
+      "licenseId": "threeparttable",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Threeparttable"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TMate.json",
+      "reference": "https://spdx.org/licenses/TMate.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TMate",
+      "detailsUrl": "https://spdx.org/licenses/TMate.json",
+      "referenceNumber": 176,
       "name": "TMate Open Source License",
-      "reference": "https://spdx.org/licenses/TMate.html",
-      "referenceNumber": 539,
+      "licenseId": "TMate",
       "seeAlso": [
         "http://svnkit.com/license.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TORQUE-1.1.json",
+      "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TORQUE-1.1",
+      "detailsUrl": "https://spdx.org/licenses/TORQUE-1.1.json",
+      "referenceNumber": 214,
       "name": "TORQUE v2.5+ Software License v1.1",
-      "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
-      "referenceNumber": 61,
+      "licenseId": "TORQUE-1.1",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TORQUEv1.1"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
+      "reference": "https://spdx.org/licenses/TOSL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TOSL",
+      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
+      "referenceNumber": 416,
       "name": "Trusster Open Source License",
-      "reference": "https://spdx.org/licenses/TOSL.html",
-      "referenceNumber": 267,
+      "licenseId": "TOSL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TOSL"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TPDL.json",
+      "reference": "https://spdx.org/licenses/TPDL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TPDL",
+      "detailsUrl": "https://spdx.org/licenses/TPDL.json",
+      "referenceNumber": 666,
       "name": "Time::ParseDate License",
-      "reference": "https://spdx.org/licenses/TPDL.html",
-      "referenceNumber": 75,
+      "licenseId": "TPDL",
       "seeAlso": [
         "https://metacpan.org/pod/Time::ParseDate#LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TPL-1.0.json",
+      "reference": "https://spdx.org/licenses/TPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/TPL-1.0.json",
+      "referenceNumber": 540,
       "name": "THOR Public License 1.0",
-      "reference": "https://spdx.org/licenses/TPL-1.0.html",
-      "referenceNumber": 508,
+      "licenseId": "TPL-1.0",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing:ThorPublicLicense"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TTWL.json",
+      "reference": "https://spdx.org/licenses/TrustedQSL.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TTWL",
+      "detailsUrl": "https://spdx.org/licenses/TrustedQSL.json",
+      "referenceNumber": 37,
+      "name": "TrustedQSL License",
+      "licenseId": "TrustedQSL",
+      "seeAlso": [
+        "https://sourceforge.net/p/trustedqsl/tqsl/ci/master/tree/LICENS=
E.txt"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/TTWL.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/TTWL.json",
+      "referenceNumber": 598,
       "name": "Text-Tabs+Wrap License",
-      "reference": "https://spdx.org/licenses/TTWL.html",
-      "referenceNumber": 87,
+      "licenseId": "TTWL",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/TTWL",
         "https://github.com/ap/Text-Tabs/blob/master/lib.modern/Text/Tab=
s.pm#L148"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TTYP0.json",
+      "reference": "https://spdx.org/licenses/TTYP0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TTYP0",
+      "detailsUrl": "https://spdx.org/licenses/TTYP0.json",
+      "referenceNumber": 236,
       "name": "TTYP0 License",
-      "reference": "https://spdx.org/licenses/TTYP0.html",
-      "referenceNumber": 451,
+      "licenseId": "TTYP0",
       "seeAlso": [
         "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
+      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TU-Berlin-1.0",
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
+      "referenceNumber": 106,
       "name": "Technische Universitaet Berlin License 1.0",
-      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
-      "referenceNumber": 159,
+      "licenseId": "TU-Berlin-1.0",
       "seeAlso": [
         "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9=
f526803d9680/gsm/COPYRIGHT"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
+      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "TU-Berlin-2.0",
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
+      "referenceNumber": 669,
       "name": "Technische Universitaet Berlin License 2.0",
-      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
-      "referenceNumber": 624,
+      "licenseId": "TU-Berlin-2.0",
       "seeAlso": [
         "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39=
e438a015da50035/licences/libgsm.txt"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/UCAR.json",
+      "reference": "https://spdx.org/licenses/Ubuntu-font-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "UCAR",
-      "name": "UCAR License",
+      "detailsUrl": "https://spdx.org/licenses/Ubuntu-font-1.0.json",
+      "referenceNumber": 268,
+      "name": "Ubuntu Font Licence v1.0",
+      "licenseId": "Ubuntu-font-1.0",
+      "seeAlso": [
+        "https://ubuntu.com/legal/font-licence",
+        "https://assets.ubuntu.com/v1/81e5605d-ubuntu-font-licence-1.0.t=
xt"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/UCAR.html",
-      "referenceNumber": 78,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/UCAR.json",
+      "referenceNumber": 353,
+      "name": "UCAR License",
+      "licenseId": "UCAR",
       "seeAlso": [
         "https://github.com/Unidata/UDUNITS-2/blob/master/COPYRIGHT"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/UCL-1.0.json",
+      "reference": "https://spdx.org/licenses/UCL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "UCL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/UCL-1.0.json",
+      "referenceNumber": 611,
       "name": "Upstream Compatibility License v1.0",
-      "reference": "https://spdx.org/licenses/UCL-1.0.html",
-      "referenceNumber": 646,
+      "licenseId": "UCL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/UCL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ulem.json",
+      "reference": "https://spdx.org/licenses/ulem.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ulem",
+      "detailsUrl": "https://spdx.org/licenses/ulem.json",
+      "referenceNumber": 514,
       "name": "ulem License",
-      "reference": "https://spdx.org/licenses/ulem.html",
-      "referenceNumber": 566,
+      "licenseId": "ulem",
       "seeAlso": [
         "https://mirrors.ctan.org/macros/latex/contrib/ulem/README"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/UMich-Merit.json",
+      "reference": "https://spdx.org/licenses/UMich-Merit.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "UMich-Merit",
+      "detailsUrl": "https://spdx.org/licenses/UMich-Merit.json",
+      "referenceNumber": 48,
       "name": "Michigan/Merit Networks License",
-      "reference": "https://spdx.org/licenses/UMich-Merit.html",
-      "referenceNumber": 505,
+      "licenseId": "UMich-Merit",
       "seeAlso": [
         "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L64"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Unicode-3.0.json",
+      "reference": "https://spdx.org/licenses/Unicode-3.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Unicode-3.0",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-3.0.json",
+      "referenceNumber": 308,
       "name": "Unicode License v3",
-      "reference": "https://spdx.org/licenses/Unicode-3.0.html",
-      "referenceNumber": 46,
+      "licenseId": "Unicode-3.0",
       "seeAlso": [
         "https://www.unicode.org/license.txt"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Unicode-DFS-2015",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
+      "referenceNumber": 254,
       "name": "Unicode License Agreement - Data Files and Software (2015=
)",
-      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
-      "referenceNumber": 647,
+      "licenseId": "Unicode-DFS-2015",
       "seeAlso": [
         "https://web.archive.org/web/20151224134844/http://unicode.org/c=
opyright.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2016.json",
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Unicode-DFS-2016",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2016.json",
+      "referenceNumber": 309,
       "name": "Unicode License Agreement - Data Files and Software (2016=
)",
-      "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
-      "referenceNumber": 152,
+      "licenseId": "Unicode-DFS-2016",
       "seeAlso": [
         "https://www.unicode.org/license.txt",
         "http://web.archive.org/web/20160823201924/http://www.unicode.or=
g/copyright.html#License",
         "http://www.unicode.org/copyright.html"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
+      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Unicode-TOU",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
+      "referenceNumber": 115,
       "name": "Unicode Terms of Use",
-      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
-      "referenceNumber": 606,
+      "licenseId": "Unicode-TOU",
       "seeAlso": [
         "http://web.archive.org/web/20140704074106/http://www.unicode.or=
g/copyright.html",
         "http://www.unicode.org/copyright.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/UnixCrypt.json",
+      "reference": "https://spdx.org/licenses/UnixCrypt.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "UnixCrypt",
+      "detailsUrl": "https://spdx.org/licenses/UnixCrypt.json",
+      "referenceNumber": 180,
       "name": "UnixCrypt License",
-      "reference": "https://spdx.org/licenses/UnixCrypt.html",
-      "referenceNumber": 462,
+      "licenseId": "UnixCrypt",
       "seeAlso": [
         "https://foss.heptapod.net/python-libs/passlib/-/blob/branch/sta=
ble/LICENSE#L70",
         "https://opensource.apple.com/source/JBoss/JBoss-737/jboss-all/j=
etty/src/main/org/mortbay/util/UnixCrypt.java.auto.html",
         "https://archive.eclipse.org/jetty/8.0.1.v20110908/xref/org/ecli=
pse/jetty/http/security/UnixCrypt.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Unlicense.json",
+      "reference": "https://spdx.org/licenses/Unlicense.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Unlicense",
+      "detailsUrl": "https://spdx.org/licenses/Unlicense.json",
+      "referenceNumber": 337,
       "name": "The Unlicense",
-      "reference": "https://spdx.org/licenses/Unlicense.html",
-      "referenceNumber": 411,
+      "licenseId": "Unlicense",
       "seeAlso": [
         "https://unlicense.org/"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
+      "reference": "https://spdx.org/licenses/Unlicense-libtelnet.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "UPL-1.0",
-      "name": "Universal Permissive License v1.0",
+      "detailsUrl": "https://spdx.org/licenses/Unlicense-libtelnet.json"=
,
+      "referenceNumber": 113,
+      "name": "Unlicense - libtelnet variant",
+      "licenseId": "Unlicense-libtelnet",
+      "seeAlso": [
+        "https://github.com/seanmiddleditch/libtelnet/blob/develop/COPYI=
NG"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/Unlicense-libwhirlpool.htm=
l",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Unlicense-libwhirlpool.js=
on",
+      "referenceNumber": 565,
+      "name": "Unlicense - libwhirlpool variant",
+      "licenseId": "Unlicense-libwhirlpool",
+      "seeAlso": [
+        "https://github.com/dfateyev/libwhirlpool/blob/master/README#L27=
"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/UPL-1.0.html",
-      "referenceNumber": 511,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
+      "referenceNumber": 88,
+      "name": "Universal Permissive License v1.0",
+      "licenseId": "UPL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/UPL"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/URT-RLE.json",
+      "reference": "https://spdx.org/licenses/URT-RLE.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "URT-RLE",
+      "detailsUrl": "https://spdx.org/licenses/URT-RLE.json",
+      "referenceNumber": 380,
       "name": "Utah Raster Toolkit Run Length Encoded License",
-      "reference": "https://spdx.org/licenses/URT-RLE.html",
-      "referenceNumber": 443,
+      "licenseId": "URT-RLE",
       "seeAlso": [
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/co=
nverter/other/pnmtorle.c",
         "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/co=
nverter/other/rletopnm.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Vim.json",
+      "reference": "https://spdx.org/licenses/Vim.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Vim",
+      "detailsUrl": "https://spdx.org/licenses/Vim.json",
+      "referenceNumber": 327,
       "name": "Vim License",
-      "reference": "https://spdx.org/licenses/Vim.html",
-      "referenceNumber": 371,
+      "licenseId": "Vim",
       "seeAlso": [
         "http://vimdoc.sourceforge.net/htmldoc/uganda.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/VOSTROM.json",
+      "reference": "https://spdx.org/licenses/VOSTROM.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "VOSTROM",
+      "detailsUrl": "https://spdx.org/licenses/VOSTROM.json",
+      "referenceNumber": 575,
       "name": "VOSTROM Public License for Open Source",
-      "reference": "https://spdx.org/licenses/VOSTROM.html",
-      "referenceNumber": 122,
+      "licenseId": "VOSTROM",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/VOSTROM"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/VSL-1.0.json",
+      "reference": "https://spdx.org/licenses/VSL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "VSL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/VSL-1.0.json",
+      "referenceNumber": 562,
       "name": "Vovida Software License v1.0",
-      "reference": "https://spdx.org/licenses/VSL-1.0.html",
-      "referenceNumber": 510,
+      "licenseId": "VSL-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/VSL-1.0"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/W3C.json",
+      "reference": "https://spdx.org/licenses/W3C.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "W3C",
+      "detailsUrl": "https://spdx.org/licenses/W3C.json",
+      "referenceNumber": 479,
       "name": "W3C Software Notice and License (2002-12-31)",
-      "reference": "https://spdx.org/licenses/W3C.html",
-      "referenceNumber": 284,
+      "licenseId": "W3C",
       "seeAlso": [
         "http://www.w3.org/Consortium/Legal/2002/copyright-software-2002=
1231.html",
         "https://opensource.org/licenses/W3C"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/W3C-19980720.json",
+      "reference": "https://spdx.org/licenses/W3C-19980720.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "W3C-19980720",
+      "detailsUrl": "https://spdx.org/licenses/W3C-19980720.json",
+      "referenceNumber": 365,
       "name": "W3C Software Notice and License (1998-07-20)",
-      "reference": "https://spdx.org/licenses/W3C-19980720.html",
-      "referenceNumber": 156,
+      "licenseId": "W3C-19980720",
       "seeAlso": [
         "http://www.w3.org/Consortium/Legal/copyright-software-19980720.=
html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/W3C-20150513.json",
+      "reference": "https://spdx.org/licenses/W3C-20150513.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "W3C-20150513",
+      "detailsUrl": "https://spdx.org/licenses/W3C-20150513.json",
+      "referenceNumber": 295,
       "name": "W3C Software Notice and Document License (2015-05-13)",
-      "reference": "https://spdx.org/licenses/W3C-20150513.html",
-      "referenceNumber": 452,
+      "licenseId": "W3C-20150513",
       "seeAlso": [
         "https://www.w3.org/Consortium/Legal/2015/copyright-software-and=
-document",
         "https://www.w3.org/copyright/software-license-2015/",
         "https://www.w3.org/copyright/software-license-2023/"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/w3m.json",
+      "reference": "https://spdx.org/licenses/w3m.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "w3m",
+      "detailsUrl": "https://spdx.org/licenses/w3m.json",
+      "referenceNumber": 141,
       "name": "w3m License",
-      "reference": "https://spdx.org/licenses/w3m.html",
-      "referenceNumber": 202,
+      "licenseId": "w3m",
       "seeAlso": [
         "https://github.com/tats/w3m/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
+      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": false,
-      "isOsiApproved": true,
-      "licenseId": "Watcom-1.0",
+      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
+      "referenceNumber": 527,
       "name": "Sybase Open Watcom Public License 1.0",
-      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
-      "referenceNumber": 533,
+      "licenseId": "Watcom-1.0",
       "seeAlso": [
         "https://opensource.org/licenses/Watcom-1.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Widget-Workshop.json",
+      "reference": "https://spdx.org/licenses/Widget-Workshop.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Widget-Workshop",
+      "detailsUrl": "https://spdx.org/licenses/Widget-Workshop.json",
+      "referenceNumber": 522,
       "name": "Widget Workshop License",
-      "reference": "https://spdx.org/licenses/Widget-Workshop.html",
-      "referenceNumber": 548,
+      "licenseId": "Widget-Workshop",
       "seeAlso": [
         "https://github.com/novnc/noVNC/blob/master/core/crypto/des.js#L=
24"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
+      "reference": "https://spdx.org/licenses/Wsuipa.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Wsuipa",
+      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
+      "referenceNumber": 564,
       "name": "Wsuipa License",
-      "reference": "https://spdx.org/licenses/Wsuipa.html",
-      "referenceNumber": 305,
+      "licenseId": "Wsuipa",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Wsuipa"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/WTFPL.json",
-      "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "WTFPL",
-      "name": "Do What The F*ck You Want To Public License",
       "reference": "https://spdx.org/licenses/WTFPL.html",
-      "referenceNumber": 176,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/WTFPL.json",
+      "referenceNumber": 418,
+      "name": "Do What The F*ck You Want To Public License",
+      "licenseId": "WTFPL",
       "seeAlso": [
         "http://www.wtfpl.net/about/",
         "http://sam.zoy.org/wtfpl/COPYING"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/wxWindows.json",
+      "reference": "https://spdx.org/licenses/wwl.html",
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/wwl.json",
+      "referenceNumber": 627,
+      "name": "WWL License",
+      "licenseId": "wwl",
+      "seeAlso": [
+        "http://www.db.net/downloads/wwl+db-1.3.tgz"
+      ],
+      "isOsiApproved": false
+    },
+    {
+      "reference": "https://spdx.org/licenses/wxWindows.html",
       "isDeprecatedLicenseId": true,
-      "isOsiApproved": true,
-      "licenseId": "wxWindows",
+      "detailsUrl": "https://spdx.org/licenses/wxWindows.json",
+      "referenceNumber": 431,
       "name": "wxWindows Library License",
-      "reference": "https://spdx.org/licenses/wxWindows.html",
-      "referenceNumber": 258,
+      "licenseId": "wxWindows",
       "seeAlso": [
         "https://opensource.org/licenses/WXwindows"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/X11.json",
+      "reference": "https://spdx.org/licenses/X11.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "X11",
+      "detailsUrl": "https://spdx.org/licenses/X11.json",
+      "referenceNumber": 0,
       "name": "X11 License",
-      "reference": "https://spdx.org/licenses/X11.html",
-      "referenceNumber": 203,
+      "licenseId": "X11",
       "seeAlso": [
         "http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/X11-distribute-modificati=
ons-variant.json",
+      "reference": "https://spdx.org/licenses/X11-distribute-modificatio=
ns-variant.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "X11-distribute-modifications-variant",
+      "detailsUrl": "https://spdx.org/licenses/X11-distribute-modificati=
ons-variant.json",
+      "referenceNumber": 302,
       "name": "X11 License Distribution Modification Variant",
-      "reference": "https://spdx.org/licenses/X11-distribute-modificatio=
ns-variant.html",
-      "referenceNumber": 112,
+      "licenseId": "X11-distribute-modifications-variant",
       "seeAlso": [
         "https://github.com/mirror/ncurses/blob/master/COPYING"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Xdebug-1.03.json",
+      "reference": "https://spdx.org/licenses/X11-swapped.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Xdebug-1.03",
-      "name": "Xdebug License v 1.03",
+      "detailsUrl": "https://spdx.org/licenses/X11-swapped.json",
+      "referenceNumber": 248,
+      "name": "X11 swapped final paragraphs",
+      "licenseId": "X11-swapped",
+      "seeAlso": [
+        "https://github.com/fedeinthemix/chez-srfi/blob/master/srfi/LICE=
NSE"
+      ],
+      "isOsiApproved": false
+    },
+    {
       "reference": "https://spdx.org/licenses/Xdebug-1.03.html",
-      "referenceNumber": 10,
+      "isDeprecatedLicenseId": false,
+      "detailsUrl": "https://spdx.org/licenses/Xdebug-1.03.json",
+      "referenceNumber": 109,
+      "name": "Xdebug License v 1.03",
+      "licenseId": "Xdebug-1.03",
       "seeAlso": [
         "https://github.com/xdebug/xdebug/blob/master/LICENSE"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
+      "reference": "https://spdx.org/licenses/Xerox.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Xerox",
+      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
+      "referenceNumber": 615,
       "name": "Xerox License",
-      "reference": "https://spdx.org/licenses/Xerox.html",
-      "referenceNumber": 595,
+      "licenseId": "Xerox",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Xerox"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Xfig.json",
+      "reference": "https://spdx.org/licenses/Xfig.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Xfig",
+      "detailsUrl": "https://spdx.org/licenses/Xfig.json",
+      "referenceNumber": 125,
       "name": "Xfig License",
-      "reference": "https://spdx.org/licenses/Xfig.html",
-      "referenceNumber": 89,
+      "licenseId": "Xfig",
       "seeAlso": [
         "https://github.com/Distrotech/transfig/blob/master/transfig/tra=
nsfig.c",
         "https://fedoraproject.org/wiki/Licensing:MIT#Xfig_Variant",
         "https://sourceforge.net/p/mcj/xfig/ci/master/tree/src/Makefile.=
am"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/XFree86-1.1.json",
+      "reference": "https://spdx.org/licenses/XFree86-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "XFree86-1.1",
+      "detailsUrl": "https://spdx.org/licenses/XFree86-1.1.json",
+      "referenceNumber": 646,
       "name": "XFree86 License 1.1",
-      "reference": "https://spdx.org/licenses/XFree86-1.1.html",
-      "referenceNumber": 562,
+      "licenseId": "XFree86-1.1",
       "seeAlso": [
         "http://www.xfree86.org/current/LICENSE4.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/xinetd.json",
+      "reference": "https://spdx.org/licenses/xinetd.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "xinetd",
+      "detailsUrl": "https://spdx.org/licenses/xinetd.json",
+      "referenceNumber": 93,
       "name": "xinetd License",
-      "reference": "https://spdx.org/licenses/xinetd.html",
-      "referenceNumber": 465,
+      "licenseId": "xinetd",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Xinetd_License"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/xkeyboard-config-Zinoviev=
.json",
+      "reference": "https://spdx.org/licenses/xkeyboard-config-Zinoviev.=
html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "xkeyboard-config-Zinoviev",
+      "detailsUrl": "https://spdx.org/licenses/xkeyboard-config-Zinoviev=
.json",
+      "referenceNumber": 212,
       "name": "xkeyboard-config Zinoviev License",
-      "reference": "https://spdx.org/licenses/xkeyboard-config-Zinoviev.=
html",
-      "referenceNumber": 140,
+      "licenseId": "xkeyboard-config-Zinoviev",
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-confi=
g/-/blob/master/COPYING?ref_type=3Dheads#L178"
-      ]
+        "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-confi=
g/-/blob/master/COPYING?ref_type\u003dheads#L178"
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/xlock.json",
+      "reference": "https://spdx.org/licenses/xlock.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "xlock",
+      "detailsUrl": "https://spdx.org/licenses/xlock.json",
+      "referenceNumber": 362,
       "name": "xlock License",
-      "reference": "https://spdx.org/licenses/xlock.html",
-      "referenceNumber": 357,
+      "licenseId": "xlock",
       "seeAlso": [
         "https://fossies.org/linux/tiff/contrib/ras/ras2tif.c"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Xnet.json",
+      "reference": "https://spdx.org/licenses/Xnet.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": true,
-      "licenseId": "Xnet",
+      "detailsUrl": "https://spdx.org/licenses/Xnet.json",
+      "referenceNumber": 470,
       "name": "X.Net License",
-      "reference": "https://spdx.org/licenses/Xnet.html",
-      "referenceNumber": 236,
+      "licenseId": "Xnet",
       "seeAlso": [
         "https://opensource.org/licenses/Xnet"
-      ]
+      ],
+      "isOsiApproved": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/xpp.json",
+      "reference": "https://spdx.org/licenses/xpp.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "xpp",
+      "detailsUrl": "https://spdx.org/licenses/xpp.json",
+      "referenceNumber": 290,
       "name": "XPP License",
-      "reference": "https://spdx.org/licenses/xpp.html",
-      "referenceNumber": 312,
+      "licenseId": "xpp",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/xpp"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/XSkat.json",
+      "reference": "https://spdx.org/licenses/XSkat.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "XSkat",
+      "detailsUrl": "https://spdx.org/licenses/XSkat.json",
+      "referenceNumber": 293,
       "name": "XSkat License",
-      "reference": "https://spdx.org/licenses/XSkat.html",
-      "referenceNumber": 544,
+      "licenseId": "XSkat",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/XSkat_License"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/xzoom.json",
+      "reference": "https://spdx.org/licenses/xzoom.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "xzoom",
+      "detailsUrl": "https://spdx.org/licenses/xzoom.json",
+      "referenceNumber": 90,
       "name": "xzoom License",
-      "reference": "https://spdx.org/licenses/xzoom.html",
-      "referenceNumber": 530,
+      "licenseId": "xzoom",
       "seeAlso": [
         "https://metadata.ftp-master.debian.org/changelogs//main/x/xzoom=
/xzoom_0.3-27_copyright"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/YPL-1.0.json",
+      "reference": "https://spdx.org/licenses/YPL-1.0.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "YPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/YPL-1.0.json",
+      "referenceNumber": 294,
       "name": "Yahoo! Public License v1.0",
-      "reference": "https://spdx.org/licenses/YPL-1.0.html",
-      "referenceNumber": 491,
+      "licenseId": "YPL-1.0",
       "seeAlso": [
         "http://www.zimbra.com/license/yahoo_public_license_1.0.html"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/YPL-1.1.json",
+      "reference": "https://spdx.org/licenses/YPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "YPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/YPL-1.1.json",
+      "referenceNumber": 481,
       "name": "Yahoo! Public License v1.1",
-      "reference": "https://spdx.org/licenses/YPL-1.1.html",
-      "referenceNumber": 473,
+      "licenseId": "YPL-1.1",
       "seeAlso": [
         "http://www.zimbra.com/license/yahoo_public_license_1.1.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Zed.json",
+      "reference": "https://spdx.org/licenses/Zed.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Zed",
+      "detailsUrl": "https://spdx.org/licenses/Zed.json",
+      "referenceNumber": 189,
       "name": "Zed License",
-      "reference": "https://spdx.org/licenses/Zed.html",
-      "referenceNumber": 599,
+      "licenseId": "Zed",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/Zed"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Zeeff.json",
+      "reference": "https://spdx.org/licenses/Zeeff.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Zeeff",
+      "detailsUrl": "https://spdx.org/licenses/Zeeff.json",
+      "referenceNumber": 551,
       "name": "Zeeff License",
-      "reference": "https://spdx.org/licenses/Zeeff.html",
-      "referenceNumber": 218,
+      "licenseId": "Zeeff",
       "seeAlso": [
         "ftp://ftp.tin.org/pub/news/utils/newsx/newsx-1.6.tar.gz"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Zend-2.0.json",
+      "reference": "https://spdx.org/licenses/Zend-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Zend-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Zend-2.0.json",
+      "referenceNumber": 444,
       "name": "Zend License v2.0",
-      "reference": "https://spdx.org/licenses/Zend-2.0.html",
-      "referenceNumber": 481,
+      "licenseId": "Zend-2.0",
       "seeAlso": [
         "https://web.archive.org/web/20130517195954/http://www.zend.com/=
license/2_00.txt"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
+      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": false,
-      "licenseId": "Zimbra-1.3",
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
+      "referenceNumber": 26,
       "name": "Zimbra Public License v1.3",
-      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
-      "referenceNumber": 379,
+      "licenseId": "Zimbra-1.3",
       "seeAlso": [
         "http://web.archive.org/web/20100302225219/http://www.zimbra.com=
/license/zimbra-public-license-1-3.html"
-      ]
+      ],
+      "isOsiApproved": false,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
+      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "Zimbra-1.4",
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
+      "referenceNumber": 330,
       "name": "Zimbra Public License v1.4",
-      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
-      "referenceNumber": 304,
+      "licenseId": "Zimbra-1.4",
       "seeAlso": [
         "http://www.zimbra.com/legal/zimbra-public-license-1-4"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/Zlib.json",
+      "reference": "https://spdx.org/licenses/Zlib.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "Zlib",
+      "detailsUrl": "https://spdx.org/licenses/Zlib.json",
+      "referenceNumber": 421,
       "name": "zlib License",
-      "reference": "https://spdx.org/licenses/Zlib.html",
-      "referenceNumber": 209,
+      "licenseId": "Zlib",
       "seeAlso": [
         "http://www.zlib.net/zlib_license.html",
         "https://opensource.org/licenses/Zlib"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/zlib-acknowledgement.json=
",
+      "reference": "https://spdx.org/licenses/zlib-acknowledgement.html"=
,
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "zlib-acknowledgement",
+      "detailsUrl": "https://spdx.org/licenses/zlib-acknowledgement.json=
",
+      "referenceNumber": 188,
       "name": "zlib/libpng License with Acknowledgement",
-      "reference": "https://spdx.org/licenses/zlib-acknowledgement.html"=
,
-      "referenceNumber": 348,
+      "licenseId": "zlib-acknowledgement",
       "seeAlso": [
         "https://fedoraproject.org/wiki/Licensing/ZlibWithAcknowledgemen=
t"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
+      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
       "isDeprecatedLicenseId": false,
-      "isOsiApproved": false,
-      "licenseId": "ZPL-1.1",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
+      "referenceNumber": 597,
       "name": "Zope Public License 1.1",
-      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
-      "referenceNumber": 545,
+      "licenseId": "ZPL-1.1",
       "seeAlso": [
         "http://old.zope.org/Resources/License/ZPL-1.1"
-      ]
+      ],
+      "isOsiApproved": false
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ZPL-2.0.json",
+      "reference": "https://spdx.org/licenses/ZPL-2.0.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "ZPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-2.0.json",
+      "referenceNumber": 555,
       "name": "Zope Public License 2.0",
-      "reference": "https://spdx.org/licenses/ZPL-2.0.html",
-      "referenceNumber": 51,
+      "licenseId": "ZPL-2.0",
       "seeAlso": [
         "http://old.zope.org/Resources/License/ZPL-2.0",
         "https://opensource.org/licenses/ZPL-2.0"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     },
     {
-      "detailsUrl": "https://spdx.org/licenses/ZPL-2.1.json",
+      "reference": "https://spdx.org/licenses/ZPL-2.1.html",
       "isDeprecatedLicenseId": false,
-      "isFsfLibre": true,
-      "isOsiApproved": true,
-      "licenseId": "ZPL-2.1",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-2.1.json",
+      "referenceNumber": 272,
       "name": "Zope Public License 2.1",
-      "reference": "https://spdx.org/licenses/ZPL-2.1.html",
-      "referenceNumber": 352,
+      "licenseId": "ZPL-2.1",
       "seeAlso": [
         "http://old.zope.org/Resources/ZPL/"
-      ]
+      ],
+      "isOsiApproved": true,
+      "isFsfLibre": true
     }
   ],
-  "releaseDate": "2024-05-22"
+  "releaseDate": "2025-07-01T00:00:00Z"
 }
\ No newline at end of file
--=20
2.34.1


