Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id D68436C108
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:36:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6VYB020869 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Kk/fRfbxYIYVe7ZnBgJTzIlbJIt+Wawa7bcOZoQptxU=;
	b=0aA1hS6W6Wea7G/Ycuj+jU2GBCMTmQfhsxZPr3SYQu+UpiLhffHlqY9yMuDzy6zTuWg9
	GyOuWKxXwKupOyNUdXbOuLgjXMlmdwKhL8OL+KIhfknwmS5OuKIjCw2cRGUr0b3h+6ig
	k31TH87TRIm1+jm9R/tU76uk+Q82hhexFXOcQrlhY1/9+JWCd+pe+M4mOFnUbtwx1w0Z
	DVjyLYozMGS2czMfRYfH6u963ch3W0zZoeV1YjPeSw4YaVFtuaIGc0Bz5cEAAcluo4Ry
	3sNClucdlk+4AjVDW19BYv8HYK4TCEdbZsx2NcTR3PKt6RXNNOl41SSLeJeAmP3vcmdB
	pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vej2p2fcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F274E10002A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDC902C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Mon, 7 Oct 2019 15:08:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 10/23] libtirpc: update license
Thread-Index: AQHVfRBWbr0IeJoxOEa0xvFqhQ9fvw==
Date: Mon, 7 Oct 2019 13:08:39 +0000
Message-ID: <f938dd9ebff74f871a8b82704d3be4055beae7ce.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 10/23] libtirpc: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:36:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of libtirpc is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.1.4.bb
index 9c480b825f2..e73ffe7b17d 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Indep=
endent RPC library to L
 SECTION =3D "libs/network"
 HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
 BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D183075&atid=3D9=
03784"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df835cce8852481e4b2bbbdd23b5e47f=
3 \
                     file://src/netname.c;beginline=3D1;endline=3D27;md5=3D=
f8a8cd2cb25ac5aa16767364fb0e3c24"
=20
--=20
2.17.1

