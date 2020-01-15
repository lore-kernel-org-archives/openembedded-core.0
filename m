Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390081.outbound.protection.outlook.com [40.107.139.81])
	by mail.openembedded.org (Postfix) with ESMTP id 58DB97F9A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 15:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Qm9NLiomDydlkeF+xvkcDARMhoeJiMB9dsEswNqKOxQ2h3TV5Y6irEP6tNIa2Vf1/v9cMKn822ZaSQ2wMOuYJ7qp/vUgUSUlyTH52gsvWZdlIfZ316Il0K6XeTJDelglApXEb2z3xiJi3FtoPxfaLRgT/24FOnFkNwhC0b3TQCNhbJmzEnxWMISUsaZzH86115IuO32XeyQYAMewMeXUMPysTN3j9JcYd8hKpaj8n1l0CzamrrbzwT9lKBY2Lie7i/TNXgOuYwK+f4uLawXX0KJW+y0Kx1XGb8yu9jYfNwaefFbGELsTWFbh5tVTOD8g1ek7YeClDQOevUOxONi/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ogKnTiMkocj/NsswAVmBjkUAxjtEfHn+xnYcHFx0C1k=;
	b=LHWb7ckq+b26X5EYDGhNOQ6OSkX2niZ2t1eA43F3o9mbZIwQu7k7tNEQX14OgfleUu5bbVDuKAhXW+rW3+ESszUWUzwNwRVAa0ualYCLqCkN6Zmk/ItbgHvRgaj6k5IAUKGS9Ufd/hBuvIfEGmbzrOOV+v6aSK9XXRtheAItx/lLmcFIctN6TmLzKa1MQElJQ8vzDp8WAJ4KEKyc7OBr9pWC9KiGWIJl0knvLQxFWSWGUlGuW7gdIW6s9+bHhMqu6TkofUkK1YwacBb9rZO/wY2kWGOtLUP98p/FLEndaI6GLao81V7sWpDbZoyI89pfI87y52YGSpwraB9f7t/7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ogKnTiMkocj/NsswAVmBjkUAxjtEfHn+xnYcHFx0C1k=;
	b=Q4mtB4pBwPiZMNgsqNYffu4M2o184OfM5xX/V5NjbGCoE00+PaA8USb3u5C0LB5myr8wgtMNwoCDlD8qWS3uEsS6mI45rvuswnmxoAgiMZhThDxnEo/8U2st15GaH3DPFhSXzacWTMs5tO7PnHOOkX6qQj+uNIqeKTsajZUQLE8=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB2222.INDPRD01.PROD.OUTLOOK.COM (52.134.155.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.9; Wed, 15 Jan 2020 15:51:06 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.017;
	Wed, 15 Jan 2020 15:51:05 +0000
Received: from localhost.localdomain (2409:4042:2385:977f:51d8:58ac:a1fe:adc5)
	by BM1PR0101CA0059.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:19::21) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2644.18 via Frontend Transport;
	Wed, 15 Jan 2020 15:51:04 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVy7uYUABs8BjSnk2eRQVIZ92eSw==
Date: Wed, 15 Jan 2020 15:51:05 +0000
Message-ID: <1579103456-31723-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2385:977f:51d8:58ac:a1fe:adc5]
x-clientproxiedby: BM1PR0101CA0059.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:19::21) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 134bdf1f-cfc6-44df-14a0-08d799d2bade
x-ms-traffictypediagnostic: MAXPR01MB2222:|MAXPR01MB2222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB2222AF0F23163D82B42E2ED987370@MAXPR01MB2222.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(199004)(189003)(54906003)(110136005)(478600001)(2906002)(6512007)(966005)(2616005)(66946007)(4326008)(316002)(71200400001)(8936002)(8676002)(6486002)(5660300002)(66446008)(64756008)(66556008)(16526019)(107886003)(81166006)(81156014)(186003)(69590400006)(66574012)(6506007)(66476007)(36756003)(52116002)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB2222;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bF2d0su1lk0XgrqwDZmRACrNSzAjTSPwjB0UI49QsPDmHLdz6c9gkqRVARbzeDZnjvqfo/u3BFLuq33Us9zqUVIZ6AsVsE7Y33sT8JyRRNPOKKSlNuHYWw0ySZ7F8hJupx6xEqAb3tiqDsahOIA773zqFagPQ0moYDWEh6NxvH5ywcrjTAHQB/7z/EanWu14/3KAckpfIp0pPUE9kQQSeNt/vuROJwXUsv1sWE6yrOCTShfi/FLosp4cN57GOeLaf7Gu3Bluqyz9yJN61v8WiM1PoBmccDWYqAbBWLdofnd15T9wKH2KpoJxbKoieFH0cv6Ya8WoBMdChJXVa2oAaG7oy6jwSAlD+wxj+TDF553CkQQW7LnhZLBNVpasA0U3nJ9vYUCO4hyJcWl9wOrLvMJ9RHtiyicxRHxU30Wn4zQ5+SHIyvOu8XiwA0gEu3F8q1zE6d/XjcIX3gSKp2qRq5ZeNUDhovrBBkt5peC/27Oyz951t1Zbhw3Uj6ZBO9mBur3uxLrlZIQl9zi2qr6MaKxMetlW4XLaliBhO3oASuE=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134bdf1f-cfc6-44df-14a0-08d799d2bade
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 15:51:05.6910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +To6TNW2/OTvjDFIPFS4u0GOhl3F5xvTKjLi843litqhmkqZrLr7yWtxIKtrsc8LrjsjzJa06K9tzRElexqqxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2222
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Wed, 15 Jan 2020 15:51:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Sana Kazi <Sana.Kazi@kpit.com>

Added patch for CVE-2019-12900 as backport from upstream.
Fixes out of bound access discovered while fuzzying karchive.

Tested by: Sana.Kazi@kpit.com

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 34 ++++++++++++++++++=
++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.=
patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b=
/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000..cab41e0
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,34 @@
+From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Tue, 28 May 2019 19:35:18 +0200
+Subject: [PATCH] Make sure nSelectors is not out of range
+
+nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
+which is
+UChar    selectorMtf[BZ_MAX_SELECTORS];
+so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memor=
y
+access
+Fixes out of bounds access discovered while fuzzying karchive
+
+Link: https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d5=
1ef9824db71a8ffee5962cdbc.patch
+
+Upstream-Status: Backport
+---
+ decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/decompress.c b/decompress.c
+index ab6a624..f3db91d 100644
+--- a/decompress.c
++++ b/decompress.c
+@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
+       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
+       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
+       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
+-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA=
_ERROR);
+       for (i =3D 0; i < nSelectors; i++) {
+          j =3D 0;
+          while (True) {
+--
+2.22.0
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

