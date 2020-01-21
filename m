Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380040.outbound.protection.outlook.com [40.107.138.40])
	by mail.openembedded.org (Postfix) with ESMTP id C31F77FD6F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cB0YyLhXWx1tO230fSHSNpbhXPOQpNxSSJkW9JUbzNcHHnRPXwqvoR7jSPjv50kLP+mUEOJqlujYxgCl72DRDJxpKqOjuA3yONDlIjGVC3b2Ebiv1QPlB86LLmMSQ3zQtWkhw764rPpxERHi0qJf9M5zeKupZdYGwrkqclR9v4p8h//biT8Q98bb87s2i5BUnyzFhIj4SA4V6/CX5q/Eq8tiv4f37ITIzw1aZTcnVDi82zwyBqML+fLiOCemc4li2zjjXN34gNOq9PBLwlFAOFa2RkEFXi9z4eBtHb8N+r2H+yhZu+AynN2bARkbN5F63J6ynWyVRaGiYzFBynOcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D+UVY4QU/l+Xs0A1Vb/YYvaTLOoTpVjlqRR4gtart5E=;
	b=VvSaq3OqmHMJHD25+5IMvfiqjaokLLqwc2s3FNuO4hSMVgJLdj0wwwGiKWxzdPiF8t6Sgax9B1KaJx1v/tgj81hPk9OgISZoIG9nU8Lhw0X0VtbjIu6LGt1jKlsNjGcom87+6PEpVvhzJjoTwogJkc4hNa/eF8ASwlHnmC9vCvTEha4hVdLzRO1yAvUF2tey9g65fgAAYEHUc/pHnVW6sNiTX4NMzfEVCGUo568ZKF3/ZG41lbPa5+692iHggGhM7V2yY29nDWdKn46cbnUcYedFYHrW1FsgSocUBPIyPU0ray9IYvxk0zWTftla4liv7n8txtpTjIQks0KsPrAVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D+UVY4QU/l+Xs0A1Vb/YYvaTLOoTpVjlqRR4gtart5E=;
	b=EoZpZEbXnp64W6kdurHMK2VEaS09FpIDy1R3riWrQ7PHpGuIkvOqZU5Q5rGNmLi/aFiroevMTbDnuZVE33mshqoYwr9X/jek/X3fEVVMfP8GnLyWTcV0hZvQAlURa2JeSw9VC0Pbv2Hq3PgVfWoz4LO+dIsfBXmtZRK22li3w9Q=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM (52.134.158.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.18; Tue, 21 Jan 2020 06:35:33 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2644.027;
	Tue, 21 Jan 2020 06:35:33 +0000
Received: from localhost.localdomain (2409:4042:2100:f27a:415c:2da0:91a7:32a7)
	by PN1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2644.19
	via Frontend Transport; Tue, 21 Jan 2020 06:35:31 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHV0CT75SpBsK3Em0+zUFWZfP9stg==
Date: Tue, 21 Jan 2020 06:35:32 +0000
Message-ID: <1579588522-20056-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2100:f27a:415c:2da0:91a7:32a7]
x-clientproxiedby: PN1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::29)
	To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2bf36dd5-6021-4085-d433-08d79e3c1d6d
x-ms-traffictypediagnostic: MAXPR01MB3230:|MAXPR01MB3230:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB3230C1C9FF30F50B554E120D870D0@MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(189003)(199004)(966005)(2616005)(2906002)(54906003)(69590400006)(6512007)(71200400001)(52116002)(186003)(478600001)(6506007)(110136005)(316002)(16526019)(86362001)(66446008)(66556008)(81156014)(8676002)(66946007)(8936002)(4326008)(81166006)(64756008)(66476007)(107886003)(6486002)(66574012)(5660300002)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB3230;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q9M59o7MnaMdcAaKPuUWx0qpi/fXV3c3uUrbSw8GpSc2dEDez/6ymjp0zL1rB7OIKDTK/6KCySA+d2p1JxEWkbp4EKsyKDHDQ+KRYQGOyukXRnwJIDoR8eW1ozmmakI9lgix0cD/KWifRMBOB5Yol/AdtBsd8141oskZ6JSVlE4KGdcq0M+YkymxTqNcxOPWhf0ilwme8OxPjYOjBVjfplU9AmRI+nAOKUXL9qybkbk/GD5rbCokb6ziN+Uyc/zVpVZXZCzxVSXva+d4zGZqY1OOKBZ0M2Ah2WmPDt/SHxfRRAceA29eXoJ9lEwWIyw/NJgMJqjuipiDTFQVQz/Madsse0lerthkItuz87psiVsIUuSMRFTfwfcEXTzSONDZj3Sc2XgRYfolW6bmC4Xd3PNrRbLXk2097qsqe4pw5n5IIxKK7RZXred8tlXPFP3xWRanIbBIr4rYmhe3LHB7Tt4mhhdG6obg5Rst4BGFJ2WB4QSMjrzoH/UMnaQAqBAR/zLbyDvJ0Vl5HgRrghSGA66iRs0ZdrrorPOFHmNUPZIrKEe5LJDf4tZLbR0whlpqx5jKWFXhx9iIEtCyozbzdg==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf36dd5-6021-4085-d433-08d79e3c1d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 06:35:32.9595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwPJRR44XV3I7R080ScNm6LXnyUA0p9z8dwaHG6gvburJ07Kh6E2hYpN6pjsKISozrJqaGy4M97RV3aGDc+AhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3230
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
X-List-Received-Date: Tue, 21 Jan 2020 06:35:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Sana Kazi <Sana.Kazi@kpit.com>

Added patch for CVE-2019-12900 as backport from upstream.
Fixes out of bound access discovered while fuzzying karchive.

Tested by: Sana.Kazi@kpit.com

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 36 ++++++++++++++++++=
++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.=
patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b=
/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000..c2eb82a
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,36 @@
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
+CVE: CVE-2019-12900.patch
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
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

