Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id A20D17D3CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:57:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6e8e006744 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=csQg3287ilAEyolsW2XCdOsN8tERSVntCxScoDUcE1g=;
	b=lNma7W9Hvh5Zp59+SBhx7IEhZlEItkI3RvBGmEm2jqus1NoWMcNJGn/uj44FpCcVH/Ix
	RO4giOW0vZd3ydkrzXmOcSjM7APGQmhiUdIpbkGcfYZlo7S2ktHnaHfsmBgBM85Q6xNr
	U5SNylV7CeNe6vyK4jxTvfRW3PX7rNCMbPMnmjoyw0RD2vMytKrEdLb6EwA8YCztWkEm
	ON4xcO/w8WbPzsMNNNtdSWiCeXz+BvtD0RFKPQCrkHb17JEaO0kEj4ATy0GnUhlr3gbD
	3VMxdZCZwHdDZqRaCFAWggXAFL4dnAmIc7A3GokCMA31nCtMChichaGjx2WoA65+ux5Z
	0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegxvjeat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B52310002A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 471ED2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:41 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Mon, 7 Oct 2019 15:08:40 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:40 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 13/23] rpcbind: update license
Thread-Index: AQHVfRBWPYzkPlixmUCnXhV1aGsqZA==
Date: Mon, 7 Oct 2019 13:08:40 +0000
Message-ID: <e326c966e794e863fba3f52d5a02492f26524b7b.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 13/23] rpcbind: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:57:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of rpcbind is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb b/meta/recipes-=
extended/rpcbind/rpcbind_1.2.5.bb
index 7c96aca36b7..19d778b6d14 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE =3D "http://sourceforge.net/projects/rpcbind/"
 BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D201237&atid=3D9=
76751"
 DEPENDS =3D "libtirpc quota"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db46486e4c4a416602693a711bb5bfa3=
9 \
                     file://src/rpcinfo.c;beginline=3D1;endline=3D27;md5=3D=
f8a8cd2cb25ac5aa16767364fb0e3c24"
=20
--=20
2.17.1

