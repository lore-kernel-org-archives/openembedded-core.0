Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 99B5E6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:36:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6lWh005499 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=1uAiAdUQHtNFTyoC/PstJdI/bTKtvLvi3qRkkgfFrdk=;
	b=euoIzytrLS6fww/w2ChrV0D15Uf87V2gtZ0cUOnFGTmwqacNsAjvf3XQ57SUWYO1ASdB
	xYBPh6BI+Mbo/OjTGNirh8vmIUs02k7b8HNtp2v2Q2lXptRtLoD6PoqeIhaogHTBGZwc
	LYAW4aEK90+juXT9NlxKT1kNVk1pUKgyjRZHs6IAdzmh9tP//SfHOh9pvjcAatYVeXxF
	JvrBx6jIvY9712R9+TLnmfyo6Qjp9LhC/9AFfIimPTgoiTlF84gsQR6mhuf4TfRsg4cX
	4bFu4hp2n9REl2NCBXfL+LRHVL1dLOKd/f9BWSg0awDm9rEP9Qe9eWadOBVA1ohYNNHF
	Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vegagtujs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBE6610002A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5A7E2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:42 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:42 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:42 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 17/23] libtheora: update license
Thread-Index: AQHVfRBXjltVFfQsnUuWyK7FqGBx5g==
Date: Mon, 7 Oct 2019 13:08:42 +0000
Message-ID: <3072a76841e467670a1104d816c0c44559f0742a.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 17/23] libtheora: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:36:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of libtheora is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/re=
cipes-multimedia/libtheora/libtheora_1.1.1.bb
index 664d8480a22..178e1a9240f 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "The libtheora reference implementation pro=
vides the standard enco
 HOMEPAGE =3D "http://xiph.org/"
 BUGTRACKER =3D "https://trac.xiph.org/newticket"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf91718f59eb6a83d06dc7bcaf41113=
2"
 DEPENDS =3D "libogg"
=20
--=20
2.17.1

