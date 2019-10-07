Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 550F46011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:29:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6gOF005447 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=v2fpzJdWcPl0jay+Oo34cF+ZmxfaA5teQ1UB3WHY6og=;
	b=t8kPakbqSQ70SzZRC+rAaHIENodm+H5P1q96mBiut5YT9wwz/OQAlq6lfZ9KFHctt0Sx
	mnQpJal9tsg03KaLq4ebWlV8fGHldZb1s19tVDXPbdCK31cu3+jx33uMxLbaOGyuRugE
	gD7B2TcEA10WtzdKtcBy4F00x4Ek9ObfOmWxeiIwLCGXebypxvXM8xx3wRL+jOfs34Kl
	BtdAdYYJ2vF/JzYOtiAYuaaCqtW8C1sY4y2G8hA6WpPZZ8MuAWHsGIwcYH/oFdo4KsLm
	aPK4eGf9PvhuDt8i0Da1xjfOgNc//HWm/tUDpQTe4LgOCXuoOzDpGYKJ0SW85moB3oJW
	hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vegagtujg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A65AB100034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A250A2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:41 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:41 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:41 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 14/23] tcp-wrappers: update license
Thread-Index: AQHVfRBXd7faI96u+UelsOvlQHWa3g==
Date: Mon, 7 Oct 2019 13:08:41 +0000
Message-ID: <9447e44a8408a7c9593ffe83b3feea0cb5056b23.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 14/23] tcp-wrappers: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:29:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of tcp-wrappers is BSD-1-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/=
recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index dd945c970f1..bd0c84c242a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "Tools for monitoring and filtering incomin=
g requests for tcp \
                services."
 SECTION =3D "console/network"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-1-Clause"
 LIC_FILES_CHKSUM =3D "file://DISCLAIMER;md5=3D071bd69cb78b18888ea5e3da5c31=
27fa"
 PR =3D"r10"
=20
--=20
2.17.1

