Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390047.outbound.protection.outlook.com [40.107.139.47])
	by mail.openembedded.org (Postfix) with ESMTP id 69FA97F2B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RIRLSSjYaaIPfiFZiA/50M2C/PMVYZXaCR0t0IlYWi0hsN+NNhscQTT/CiAOkN3Chlkhou2yyHpFFvsPuA6QKqiZ1Kg5DglREm4WooZZPG38Wf+b/aO2IxYBApigVH9gyvdVU3hktROzRWtk6IyUy5cC/sCYvv3oyf2u+NQTB1WKNd7PNQM51WA0vnWSK86J7WwwwQ/1A9GPNyoXYhgsHjRBzJnMBbWXAUJt3knaUW/RjvJxcEulUfIwiNOFvcJ5KMHQfE6sMQOduLoJkxgMtsEbsSmahBRJAKVXhKuyc5w63G0Ox8Upig0aem3OBrad0Gq1QxQ6uPvpqAFTQMIESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=11HENdH+0lGy/3s01z1CGWl15K5AS6+oBCX31Xv7uUA=;
	b=BR6P4dOyjWNgfr/Htm6ofEZajy8uqV4sMOyiOfK9rQPxkjExJBPWAVpozkt77+bh8+ZAaaYfgfSb4dd5FHBc+f7wlMsT2jmKc3YiKSt32KGwQca6NCH/N9nhDxy6mcsdSdIZ7uGeXMtPxsQh+MEKY05Z/oXPGzbrlNe+U84fLweBojqfUE5WIs3VbwKtEetj8vAr00xXUmRdzSiH8+cDlZ2FpMXosdJiHFuSAghLdBJWDwcN5N+vWjjAtQT2SWivKyNnEeuEgtO9ue/nTI9GAZqaYLm1MgkQA4BD3AFRAE0ieKbYHrw4aGCfK3bi3tCiR7Fgi4QSVHydkHOWvRXZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=11HENdH+0lGy/3s01z1CGWl15K5AS6+oBCX31Xv7uUA=;
	b=uh4UwEvwSV7X2syWE5zMzpQMyZaioNyN/Rmg2w1h35GWpv75kX3jw6OAOSQRLl4pkFjRGcttBsHjIGVNpDIc5RBOy9GJ9NK6a9X4eTVqi9bRIwxDGh3xuGQiAdTa+RtAsMBFqF+VE2ysTkCE1GuWZvCHIlWCwjixDY7f3RkmBD4=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB3981.INDPRD01.PROD.OUTLOOK.COM (52.134.159.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.23; Tue, 21 Jan 2020 06:14:32 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2644.027;
	Tue, 21 Jan 2020 06:14:32 +0000
Received: from localhost.localdomain (2409:4042:2100:f27a:415c:2da0:91a7:32a7)
	by BMXPR01CA0011.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::21) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2644.20 via Frontend Transport;
	Tue, 21 Jan 2020 06:14:31 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][master][PATCH] Added patch for CVE-2019-12900 as backport
	from upstream.
Thread-Index: AQHV0CIL/xQ3jDQ+70qQ/qxzW8LosQ==
Date: Tue, 21 Jan 2020 06:14:32 +0000
Message-ID: <1579587259-18617-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2100:f27a:415c:2da0:91a7:32a7]
x-clientproxiedby: BMXPR01CA0011.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::21) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9aec97e2-3b27-4a1d-6a6e-08d79e392df4
x-ms-traffictypediagnostic: MAXPR01MB3981:|MAXPR01MB3981:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB39818FBAE68E94571F72E7F3870D0@MAXPR01MB3981.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:200;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(189003)(199004)(81166006)(81156014)(8676002)(16526019)(54906003)(6512007)(66946007)(64756008)(4326008)(66574012)(66446008)(66556008)(66476007)(8936002)(186003)(36756003)(478600001)(2616005)(6506007)(86362001)(2906002)(107886003)(71200400001)(52116002)(69590400006)(6486002)(966005)(5660300002)(316002)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB3981;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KyBy41oSE2VDp0egmu7DG+lCt0nOwGnRqMxpATf43u/j3ApCMiRI83CpZBylgSADdZ4n84Dpm/cd8AlPxvRjqEqhSca60+5QEElVeHQy/CKl8hp9AXOLI3qFACRBxmhw3ev6c1mNncVcN3n5CF0vyUaI6QrWpyf9VjgZxFLg+v/NNF9NwN4xYhW+11LeMvHnmelM1PQYEd4+eaEgaw3vzkRJj0/8gKVG/PWiUjZ2+mOcrjCl6nRWNb/xSzr21Py1gWtP1W3rFaroI67hUKUl6JhCGs8fpvULxmf6PXXrBaQxTumJIfINKHzo9t48WQuGbZHkqYXusnQ6TBVnBIp0+JVK1POCaAceOhNoGoB6dvLYE3r0EMNNqubRSsTLFXAQQNKT5YXj+462ovcTgCkKKFNifT51Dr4ehB5xU9cQE7RBZxUwfJLl2dXaVALPKfZK6cDx22crBcve3pcJMsebAC3lbelYv7pcgyd5Sx89PuiHrkSFZEiQPkOCCXsK8ds1kobtLkDpKyNZJ4YHBK829m3xlIfgm+9PIo9pk/qEHBK9HIiGwnCOF/OtuxTTNNqYbCeKq7uW2ikJ1y/rgvfwQ==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aec97e2-3b27-4a1d-6a6e-08d79e392df4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 06:14:32.0849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJvcK9sy7z1lIuOOTQSO2D3cLkfHMXhoXgZy1XyPFEwGkNj50DRy4s4bLon0/D6d2vQ6/I3W0S3n7DbjdJT5Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3981
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][master][PATCH] Added patch for CVE-2019-12900 as backport from upstream.
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
X-List-Received-Date: Tue, 21 Jan 2020 06:14:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Sana Kazi <Sana.Kazi@kpit.com>

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

