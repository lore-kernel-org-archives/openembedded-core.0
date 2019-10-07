Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 930137D41C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:30:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6S7J020846 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=kjxHPOE5zE+AvUPJuOEEy5TZyfxt6qFVqCjbBTkK2l0=;
	b=m0f6CQZ5sSAq5VUdjfxnXinT9xnlJ56ozcVYZkd3LvFMaVw+XhDDRh2NnHATSnJoq61k
	xwSekyE/Q1GwD7BSHgcY/NY90QaaiCh236fNKMQRzBWJ7fWXaHUUDZ+Ia/mc0esoE+5w
	WuKcJ6JQbNOoUhEqnp1MR6WxPaYGPrH1trtSw+ASHizSrWfgu09F45QJXj3R2tdsUxVs
	x0KKHdyEYERajlr9QKnFvB7UWupc2jR+/rK2+S8Vtlfm1XozebG5vXefRjklR83PL532
	g75FrXKw5YQA2J4iA9/xZyznM+25Ea1F64nz7DRnZXpOj+7WawKcQuneK5R8Qtdim+ak
	pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vej2p2fdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91E48100034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D8EC2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:44 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:44 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:44 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 21/23] libwebp: update license
Thread-Index: AQHVfRBYSygJ3sMqNUaKhNRchwigQQ==
Date: Mon, 7 Oct 2019 13:08:44 +0000
Message-ID: <f63a9d82a9b6b1324fa5765e4f49b4135441767b.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 21/23] libwebp: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:30:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of libwebp is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-multimedia/webp/libwebp_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.0.3.bb b/meta/recipes-m=
ultimedia/webp/libwebp_1.0.3.bb
index a4d1ae43d93..5082bf03748 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
@@ -9,7 +9,7 @@ DESCRIPTION =3D "WebP is a method of lossy and lossless com=
pression that can be \
 HOMEPAGE =3D "https://developers.google.com/speed/webp/"
 SECTION =3D "libs"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932c26f2dab503abf70c96d8b=
b \
                     file://PATENTS;md5=3Dc6926d0cb07d296f886ab6e0cc5a85b7"
=20
--=20
2.17.1

