Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4357D3B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:54:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6hD4006755 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=o3IdRGS1kmNJcR9H7iZNRrs1aVdsm48jOfkI25Ff5TU=;
	b=OeaLsUmx3J5/yHZZ/1wxCWPDlwPDAovvGmNXMhAvLpZ7oF4fJB1sFhfSQCAkrJJIN8Dp
	RG9aXDdRZmnL4+3n0CdMYPy8fH0nzZiIgQxkVzdZAAmf0YMNR2A2l7KOJ4Rc1uTkxRAF
	Y4+ZBKSo6JmaVz4x/wTa3hs3Y3P1TUgL4BqSmE/OdGJhsccFqdKawk9OFQxotWWyDfYp
	KVnZna+dTpKzGVRYSM0pc3Oh37iYx8B9bjaDGEv5CZuGhn+Shjxnx1xG3LoTdiDOfYM3
	XPx+1lZ5FTrX57d9SkXUOm+YbDyf4PYjqeEh8I2EwnEcdh8PS/PGfL9pXnIcS3OsRO+L
	JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegxvjea7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18E0B10002A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13BE12C9DF6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:36 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:35 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:35 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 01/23] libpcap: update license
Thread-Index: AQHVfRBTxdv7g8zL2ky6mWYiKt3n4A==
Date: Mon, 7 Oct 2019 13:08:35 +0000
Message-ID: <08b1065e6d086efb7252d082fc40eee39f8aa6fb.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 01/23] libpcap: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:54:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libpcap is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/reci=
pes-connectivity/libpcap/libpcap_1.9.0.bb
index 77bc31af7e2..d74895cc1b0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
@@ -5,7 +5,7 @@ security monitoring and network debugging."
 HOMEPAGE =3D "http://www.tcpdump.org/"
 BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D53067&atid=3D46=
9577"
 SECTION =3D "libs/network"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c160e2920d2e35bddc3645=
3 \
                     file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af351=
0e011f34b8872f120b1dc31d2"
 DEPENDS =3D "flex-native bison-native"
--=20
2.17.1

