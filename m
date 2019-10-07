Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id A6F046BCD6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:34:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6dXr006729 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=uJ4dr9vcZsHxmr16dB1V2qrqENFDurcJppXt8nLg7PE=;
	b=FyZquikjnbi77ktUJiXP7sWH8B5Qv+E+NNTdRnJIes3aYrjjvAU2drSe7fGDyk6sqYhm
	PRuZcvCumgMgCr+o9rlu9MVDRJWscWua/FEfdxNN8xLULmHsZWIDzSv2NKlkEPGD73oC
	fXBg405AhX3q1qWQbEMvjHh+Ww5NUQnOUjNRLwJA2iN3gK0/JIHjV5SA9vQ8PYlcp9ph
	6r4+Qb5MGjawbGQ4d6ZumhoGdjEDjtcXfmMpPUCXLZtmIMRYQ90DZWuRqmMXzpY0GGK5
	K0U50XZoANs8K1hKJQjYTXaMrtJFamKvt4QeYw//5xAKW6dnGJGzTfRWuRSjCCi6lcqj
	EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegxvjeaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25E8E10002A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 219052C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 06/23] flex: update license
Thread-Index: AQHVfRBVDJgGBV4nbUa2KMkdgZyTGA==
Date: Mon, 7 Oct 2019 13:08:37 +0000
Message-ID: <696d802b71856288c2c6d750a7a99c8ba2707e0f.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 06/23] flex: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:34:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of flex is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtoo=
ls/flex/flex_2.6.0.bb
index 12ce0cb461e..9bdd99c59f8 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Flex is a fast lexical analyser generator.=
  Flex is a tool for ge
 lexical patterns in text."
 HOMEPAGE =3D "http://sourceforge.net/projects/flex/"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
=20
 DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex=
-native', '', d)}"
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.17.1

