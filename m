Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380050.outbound.protection.outlook.com [40.107.138.50])
	by mail.openembedded.org (Postfix) with ESMTP id 18FA67FD4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=V2POwmECYX6YT6M3DGBhm+SBYVIiehhxM6RjZFppw7Ku8RKWr7ackvfa9hUJkmuYZEB25G38ZjJ7uTKMznDYq6iU6zcqIenD88DHx9NX42bX4mlQfZmVjFpNz0SP1eXoPeEEJTF5dYtqiAK3YbARFQhY1ERB72ljFiuSc8zBpYjZEoWtG+AS4UBKpoF2TZhtOIiDJaQlbTIzfP1UOBOtK1e2ldujfh8UpyvdVhyhBaAf19dyQa618lXUuH3/99ATS8k/SSX0YRDbRpw8j7yql97zOm8/z33Mk7QQifgOiw9yphLXPdXJOw5Lt/cexSQMmJfOgjr50ezFk6XjJcg1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D+UVY4QU/l+Xs0A1Vb/YYvaTLOoTpVjlqRR4gtart5E=;
	b=P7vsUyypdGLBGZbGvIhYCHmQmJKyuoI5AYs1ad7bCl6rj8bt/ghN15OoF4273J/iCIN1KcZDeICLAcL7pqrUEXznqNBvNlsPF0fFT/DgZyplt+X7XvArS0wPafMG98IBsQq4BFeAsk4WuR7v+y6dGZO0OuNnhP22ssUyclpNiDqTnSz7XLGvoZu5eVSklyDDGsZN5IoZuRLDJhaOq6kq3mTS77cuBDrPyfw1NvCAIM/k0iJoZ7sUdcow6HAeAGdRuYIHVhdzxqR/cC/Q7gK3Zz6dww4n/zFjDW+PfhPdMwd53tUlxjyoLzaVIh8UOFR+aJcRR3/dmsJ6FhSJuDSB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D+UVY4QU/l+Xs0A1Vb/YYvaTLOoTpVjlqRR4gtart5E=;
	b=qkifWQvTXeeh9rR1vOsbEiLBuJQZ5J65wuseNr/sK7wRO0gt5A9DTsgyvwFFtcToYckrtLWbyBEdAij3yQTC0gg5tq2dkS8LGdicO2005fy4UAnjYlXd6/gs23plIPdBMN2Vfw1nIvvLwjRKhCAlZ4FFFRi5sqWfHjXrhcw9ypA=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB2672.INDPRD01.PROD.OUTLOOK.COM (52.134.155.80) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.24; Tue, 21 Jan 2020 06:24:27 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2644.027;
	Tue, 21 Jan 2020 06:24:27 +0000
Received: from localhost.localdomain (2409:4042:2100:f27a:415c:2da0:91a7:32a7)
	by BMXPR01CA0021.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::31) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2644.19 via Frontend Transport;
	Tue, 21 Jan 2020 06:24:26 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHV0CNuV04cIyuMdkuv2UtOC8D+9Q==
Date: Tue, 21 Jan 2020 06:24:27 +0000
Message-ID: <1579587857-19291-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2100:f27a:415c:2da0:91a7:32a7]
x-clientproxiedby: BMXPR01CA0021.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::31) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a0457c36-2bb5-4346-8959-08d79e3a90aa
x-ms-traffictypediagnostic: MAXPR01MB2672:|MAXPR01MB2672:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB2672BFBEBCDBF3408EFEB0FF870D0@MAXPR01MB2672.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39850400004)(396003)(189003)(199004)(6512007)(6506007)(54906003)(86362001)(52116002)(110136005)(66556008)(4326008)(107886003)(66946007)(66446008)(64756008)(66476007)(6486002)(316002)(16526019)(81166006)(2616005)(186003)(71200400001)(8936002)(81156014)(66574012)(8676002)(966005)(5660300002)(36756003)(69590400006)(478600001)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB2672;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2POsUpclDw3WbL7FQv904vRhgPJOa4mg9X/DjHgEFwrIbLwhoGNJgfy9VjrYko3DqOxCMbzNR8fwEUEAU3ZnxCknKiUZf8l1JgrDgu7LShiAHS2gyyAi5EbpSN8s10aDPgv4iyr7pfTcvfk9AGNn/DNa59pr2nJK9jfe8jE7xKgFWKf8R6wdjVRqf4PLEMmkRWOEv0DXMQ3KinxUJqoHm67Km9uU09TnJOGuQJGP2dZKoQmj1YQgn4jVlXcjRuakVmnByQIn7YQbi2KeKFT0nk0yY38ySaXJkJZ78QFmMXdZ+dtenZthG5b3YIboXFEUdCxxxQ5kTdwGaQaz1aIK+aqHr3zREVcZ3NFDeFp06kpkB3pJ29Xl2HtBOFt8eKkwd4DWwgH2QjGTda1f3zoWPV/olY5Bnxrmx7OMmRejeN1vYUF+z9SVLHTJUL974V/NqKlFtPbzoLOpN04Dad1qvh9+kNrWdVopL+2AunSG1Og4A6cnZTPt/97KrUTjhUgQ7vfuJrP61BhrNXyW6FznkND8kGi2nq1f/PiY+GfXZmtikElukyQzc9NTEda/z+y14v0863devG6u1q220ibvVA==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0457c36-2bb5-4346-8959-08d79e3a90aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 06:24:27.2489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzAJag+LU4oE+ifMZFKNQk208FZ7krwNBQ/RzvJM2F3t7qC686cFRookrONTdUhbBA6qJnNHu0Y+3K7zb+msRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2672
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Tue, 21 Jan 2020 06:24:29 -0000
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

