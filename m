Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 59F947D67C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:23:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D1Rmq032190 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Oq2Dzma39rZ4ZNh0QKrf4iaK0TkiIrpiRqyAfa6ybz4=;
	b=KUxRgiADXVi3OUNcB5yXiS5lfIx8kgW4pHLNSOpBYejXEbbZzJ+hNJE/wWhnaNgtTKlT
	S8CcnEQWkuKus91b9P7o+OlBUVfmazN9z0r2p7pFN4+6cJo8S9KNIckpG1Y7Aiihe2zI
	W7Pg/ixVVFhrRo547SWEIIlOMDhDD30qZYBjMMIbTC70tdeELIhpQPa1I5Mrf+ymuYl4
	tiqya2pJeGwfvDsgEggAhsdbIV6lL1hPiBXvLyC8x4wNTHTh9RNLQDxrIyeb+t/cKF0V
	cYAuxHE9PgI4HAZoDPcoBoOGxJK5RzL16b3M6DzpR/zae9feDaH2P12fMLPVZ38K8K2e
	TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegn0jgw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66BA2100034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 623872C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:43 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:42 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:43 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 18/23] libvorbis: update license
Thread-Index: AQHVfRBYama6Vg+uekqWcsmFW/AAUA==
Date: Mon, 7 Oct 2019 13:08:42 +0000
Message-ID: <63fcb1a1d25407e51f7f13dd984b656474010a65.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 18/23] libvorbis: update license
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

The license of libvorbis is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb b/meta/re=
cipes-multimedia/libvorbis/libvorbis_1.3.6.bb
index cbda6dc2fc0..1a3cdc22696 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
@@ -5,7 +5,7 @@ is the main vorbis codec library."
 HOMEPAGE =3D "http://www.vorbis.com/"
 BUGTRACKER =3D "https://trac.xiph.org"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D70c7063491d2d9f76a098d62ed5134f=
1 \
                     file://include/vorbis/vorbisenc.h;beginline=3D1;endlin=
e=3D11;md5=3Dd1c1d138863d6315131193d4046d81cb"
 DEPENDS =3D "libogg"
--=20
2.17.1

