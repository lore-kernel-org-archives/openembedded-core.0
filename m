Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 89D277D419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:23:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D1ZlT032242 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=yy6YRK/4DzTrtw0q9qMPUnf7UAEBhdLdNpZOnphvxeQ=;
	b=hJtFxIvOXYKKG/YzoznhKVapZxMBlTmOn4O8NyK70BG5Mr3lGYEC6W9Vz6Jesn+rFso2
	rWXSVIr43Cu/yYFSW8Xy1Vr28H1bruZcuT4VTYTwyZJDLL/la50ZUTQ1eUtZw29EV98I
	38t46ysqr28lZ7TqMA5yz3Y8cZB6tdL1+3OYjp0F/EUBbYrMh6ZqjJ7Tuj+dcni2s9Qr
	mUlxX/FnEJrCfAqNIX3BRsBXGxzjgv0YM2QRUCXl0wawwFEYDttDTHyjHuVA2MPqZCwI
	d+tkFxgPm1ABZ1+saICfHIEq/jW5wHgUL3Ra/jhVXaQoTqv1dEXL1F5S5ef/1i7zOpZJ
	ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegn0jgvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F84D100038
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79FEC2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 04/23] cmake: update license
Thread-Index: AQHVfRBUyxLMbFYrCUmIeNtv8dkpkw==
Date: Mon, 7 Oct 2019 13:08:37 +0000
Message-ID: <6234efb696ff8787c2f35ab917a5fc022e0ed5a5.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 04/23] cmake: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:23:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of cmake is BSD-3-Clause

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-devtools/cmake/cmake.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc
index 35d78eea177..957448445e6 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -11,7 +11,7 @@ generation, code generation, and template instantiation."
 HOMEPAGE =3D "http://www.cmake.org/"
 BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
 SECTION =3D "console/utils"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3D622747147b46f22e1953876a7=
cba3323 \
                     file://Source/cmake.h;md5=3D4494dee184212fc89c469c3acd=
555a14;beginline=3D1;endline=3D3 \
                     "
--=20
2.17.1

