Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 1F57E7D419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:23:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D1ZlV032242 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=6F8CQNOQxCDgbMme0Z2ndLagt/LtBUrnApTbE52/Vzw=;
	b=u96IhEbWfdgHnqZwu3ZdOkYrMouqzE9aNqr8CdqALwY3mhOEQlRYWSDwua6IP84jeLMg
	x8IE5C0oxxiDkobxu03asyEFuVkxLK9VBpzSvx7FxX1hDe7rShbXLUBwKeh9s26hNYzw
	g9ZXL6annGqnZ6cSMN7q+1gMKLm+sVRoBcDarbtvKdlCRh+NRDKNHiNrOfYd4BzKMs+1
	yaHXvWaI85QKul0Wr4Yrv7Tkr6HHz6SpgDDLP74dpI3LK3vqXvWqDVdLZenBPR+Lw5aI
	PxTNYZ/LUvg0ukN8CP5ef2Xbk04GWreae3w5QLGBaLvlZ9U3NSLFo1jm8CpjGLUdeqHc
	Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegn0jgw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65C59100038
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 616C42C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:42 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:41 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:42 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 16/23] libogg: update license
Thread-Index: AQHVfRBXvJRxxAhh2EqzXYoHex8L7Q==
Date: Mon, 7 Oct 2019 13:08:42 +0000
Message-ID: <c92f9ff34cf97239dcd2c59913970018ce753f6a.1570452710.git.christophe.priouzeau@st.com>
References: <cover.1570452710.git.christophe.priouzeau@st.com>
In-Reply-To: <cover.1570452710.git.christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [PATCH 16/23] libogg: update license
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Oct 2019 13:23:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of libogg is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-multimedia/libogg/libogg_1.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.4.bb b/meta/recipes-=
multimedia/libogg/libogg_1.3.4.bb
index 8ca001079db..c4004619b93 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
@@ -5,7 +5,7 @@ necessary to codec libraries like libvorbis."
 HOMEPAGE =3D "http://xiph.org/"
 BUGTRACKER =3D "https://trac.xiph.org/newticket"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddb1b7a668b2a6f47b2af88fb008ad55=
5 \
                     file://include/ogg/ogg.h;beginline=3D1;endline=3D11;md=
5=3Deda812856f13a3b1326eb8f020cc3b0b"
=20
--=20
2.17.1

