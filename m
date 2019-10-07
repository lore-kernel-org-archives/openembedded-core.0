Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id BDAED7D419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:30:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D1Rhv032193 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=goSmQtkBygepzL9gLp/CaOJ90yZXK1CX9qzx7ge4bxA=;
	b=T8hSiNgdCgALaRxF9yT5XFNvYsx1DJ5lXoIv3fnesnroA+aTLVToRkU/yg/rrDKhB/RC
	KnRrd2sLeqwAckZM6mYk1+MZtiJ1wvb259Hd+pLlZh1e+oy702DZqJOoZmntUpiSYi77
	9yL70KVJ9JXthUQWKhdSy2x6tL4vxE5avGZR2JRYbEB22q81neqpvrDj7bIx2z/uTuFM
	dm9EAuteJflvHWpX5OfgPQkFakY0soRiyYMuASWQjJvR4vyoQQhxl9Ko1lRNfKXVZl0q
	QKMxBXIiQ3cAZIJoEzVucDsBSes8DJ89l83Z+BE+pNCg6dm0QZRIj1Z7KF6q4onqacd+
	pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegn0jgw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE28D100038
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C99712C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:43 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:43 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:43 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 19/23] speex: update license
Thread-Index: AQHVfRBYbYeFQMSuOk+cdbklH7Dh3A==
Date: Mon, 7 Oct 2019 13:08:43 +0000
Message-ID: <930fc554fcae5671a58a0755192a65c425450347.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 19/23] speex: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:30:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of speex is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-multimedia/speex/speex_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-mu=
ltimedia/speex/speex_1.2.0.bb
index 19636bb202e..3a0911d6f83 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Speech Audio Codec"
 DESCRIPTION =3D "Speex is an Open Source/Free Software patent-free audio c=
ompression format designed for speech."
 HOMEPAGE =3D "http://www.speex.org"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D314649d8ba9dd7045dfb6683f298d0a=
8 \
                     file://include/speex/speex.h;beginline=3D1;endline=3D3=
4;md5=3Def8c8ea4f7198d71cf3509c6ed05ea50"
 DEPENDS =3D "libogg speexdsp"
--=20
2.17.1

