Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 763306011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:53:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6dlE006736 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Wtu0JoKyukg1SbhXyu87suT0fFjQ30iUoMV4+5jXp5k=;
	b=jUt8fc1Nx97CAIpS1g8SIpmCBABY+yu5gNdBgIn0n9A/wMBJA1EkHnLUWEqxIxIyJSCV
	36D9Y+TGUypJedj5ONtL/0KO02lgp9AVp2UM3tDz/nrDbjhvDJuXKjEoBCA+K+F/mKUc
	UaYw+HxoBh4c3kMohfkt/VfwSkZa+pNYZG1XRPwOqLKRrvJryJvabzG0KU2FPY8eNua/
	gcggo4n1nGEkC3plNrIz9JUUatESgUFRIZ5t/t0X2VwBvm1paonsUQIKSjT6I2iLj4ja
	AbZXjFzNYkXCUkHEkptjIhit8lo2wGPj3bcelyxlJnoGKAYW0W5SskNu/B3sH7w4A/fW
	UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegxvjea9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3742100038
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EF582C9DF6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:36 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:36 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 02/23] wpa-supplicant: update license
Thread-Index: AQHVfRBUb/X26qgZNUibs3E2BFZo8w==
Date: Mon, 7 Oct 2019 13:08:36 +0000
Message-ID: <62fb06a7c2cef2f9b78c5909b4820f817e873c6b.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 02/23] wpa-supplicant: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:53:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of wpa-supplicant is BSD-3-Clause

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb=
 b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index c16978cfe82..ad9e6ea4be1 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Client for Wi-Fi Protected Access (WPA)"
 HOMEPAGE =3D "http://w1.fi/wpa_supplicant/"
 BUGTRACKER =3D "http://w1.fi/security/"
 SECTION =3D "network"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D279b4f5abb9c153c285221855ddb78c=
c \
                     file://README;beginline=3D1;endline=3D56;md5=3De7d3dbb=
01f75f0b9799e192731d1e1ff \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=3D1;e=
ndline=3D12;md5=3D0a8b56d3543498b742b9c0e94cc2d18b"
--=20
2.17.1

