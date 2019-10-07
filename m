Return-Path: <christophe.priouzeau@st.com>
X-Greylist: delayed 810 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Oct 2019 13:22:05 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0AA7D41F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:22:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D1Rmr032190 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=xPvROInm0j3x+gAy1gnVLFPSwOB8hrX41D9pOoQYjxQ=;
	b=hDK6Fmz1X+AQwmgi7hLtDTl5Ek5kOuQ2DrVyPM8wQuFXd7SJQCrWuPxy0pcvs8OdaGG1
	WfTQjzVgBpsF0zzOMWJhG0A/DJ1VZ1+ssVjiwkmrDKPr88ZXseO0XEx7O0+TJpFXDrjx
	X6XiJrdffdtj/w6wU4rF1a4cGXiAWhkEBwbr6prsytLR2jNHAq/VQN2IkyY0T5M21aRe
	Txkx84EKTkaLBGCJ6rhKM9OxFuAnSoew0TuuLl4CzbxJ1qEV6ukQGkLJdCeEnEdWLUxZ
	d5GyhCSCwKL3eiW4+1QuvlBRwU2AXGvKPPodtWxE4MiH23+VoDADC5Ex+mvcFI5FKSVH
	KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegn0jgw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CEE110003A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5881D2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:45 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Mon, 7 Oct 2019 15:08:45 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:45 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 23/23] p11-kit: update license
Thread-Index: AQHVfRBZMeeUux6cDUauheZIVKmuWg==
Date: Mon, 7 Oct 2019 13:08:44 +0000
Message-ID: <0cb20425d3089484ca1dd3b4d76981f426f92b8c.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 23/23] p11-kit: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:22:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of p11-kit is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb b/meta/recip=
es-support/p11-kit/p11-kit_0.23.16.1.bb
index 54455da1bb7..48bf027f479 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Provides a way to load and enumerate PKCS#11 modules"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D02933887f609807fbb57aa4237d14a5=
0"
=20
 inherit autotools gettext pkgconfig gtk-doc
--=20
2.17.1

