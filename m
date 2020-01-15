Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380072.outbound.protection.outlook.com [40.107.138.72])
	by mail.openembedded.org (Postfix) with ESMTP id 9012A7F8C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 15:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CIbymSxNPBo4fTXkz88cBNPdAuQoAmQTfxAL8V2E2hekAfJyqwguKpiRsWaIx3MglYHJNA46OVD7e63LWgW0xJSCZNZ644r37PbCgbA3PHsPdyLyt+ZEmo7MFCbFX29AIHREQsROkCLT0UazExnWydEMoggpfs3MJmDPEk4T2yVPQJPO9upNNtEjzi/wbADWp55USvO7ugRlp49CCwd3gISQUpIv9PKynfAP/Aoe/AY0o7valy9bEw96oyHZncp0ijbuzg3J+n4FfPnHQzm6xy53rEpcfGmHCz3daxoHgC6blwcGsRRKIY6VjevgqxDKcb3nC0H7wxz8dC8HLbEMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ogKnTiMkocj/NsswAVmBjkUAxjtEfHn+xnYcHFx0C1k=;
	b=PXi3MLNE8ioYmVfFVr9RGjy+pGi5G+En4+nU3Ir7Sr6SvvJ1+I53g2fEa2biRSqOPGPgWWGo5+p3eFOunnNB0/MwcRTaOH23i2x8WOSllFI+8wXTYacCW+8Ycx26WswxD9avZ4WGni47hkcDkm5ccKeoWZKBuD1itXKq9vU4zuyohM0o/lE9Zo9ae8CwX8aoEFhJ5WsEx/6VMOoDQjhhNzf1PPdxPBN6p5ov7PptC+jobrKt5V7lGi66SzfuL89bXQTvlv9PlOSvAcXU7Tx6clYALVHAPJvHTTXacDtDwmu36syoY/s0SwQJ+A4o7kjdSedNnmMaoYONWbPBK+93TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ogKnTiMkocj/NsswAVmBjkUAxjtEfHn+xnYcHFx0C1k=;
	b=HFpPeQ+E3csQQWBFDA0x1jrFpuM7yB8ToXYZo5pKJkPJnG5ZgXzCO8W4VC48ekjFpd/VWlisP3k/TMicjIw2MmnPR3kgpxzDwi+RNV1FSTRjXNWKY9sxmsEbneqNi+bOWfWR1rtpQeML238T1aN+hoUZ383wfVMqMTZKoTu2caQ=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB3405.INDPRD01.PROD.OUTLOOK.COM (10.255.152.212) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.10; Wed, 15 Jan 2020 15:47:40 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.017;
	Wed, 15 Jan 2020 15:47:39 +0000
Received: from localhost.localdomain (2409:4042:2385:977f:51d8:58ac:a1fe:adc5)
	by PN1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:c00:e::28) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2623.10 via Frontend Transport;
	Wed, 15 Jan 2020 15:47:38 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVy7sdXm8YTtiY4EajP3DSBQ/VtA==
Date: Wed, 15 Jan 2020 15:47:39 +0000
Message-ID: <1579103247-31173-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2385:977f:51d8:58ac:a1fe:adc5]
x-clientproxiedby: PN1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:c00:e::28) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 67f3479e-b2d0-4999-ca08-08d799d24013
x-ms-traffictypediagnostic: MAXPR01MB3405:|MAXPR01MB3405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB3405EDCE87F4B07984A8B13387370@MAXPR01MB3405.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(199004)(189003)(4326008)(8676002)(81166006)(186003)(66946007)(81156014)(66446008)(64756008)(66556008)(66476007)(6506007)(16526019)(8936002)(36756003)(86362001)(5660300002)(107886003)(2906002)(966005)(316002)(71200400001)(110136005)(6486002)(54906003)(478600001)(6512007)(2616005)(66574012)(52116002)(69590400006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB3405;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jO9QSWgshfNgJQeZ8D7lvPtnyynYmNf7REvI/WqZYWONBTOV5zsCS/xQQNeEeedHQquRTp2SWQ+oYltSUAkixZ6CrZNhZwZPKvCp/jZ+aMOSxlD3k8N6PtkMs6NWZr6H83swOQ+X4I7u+VhMvSQuMUd6fPfUZ9ZfbCEAvzWDLe9+TSQbLHey+LT9gGkaQtPW2G8R6v1HiIIudEgzl64gHdhtJMO8hnNWW0TuA2NJrD41d1TAZh2DILrkXSlwajve1zJjc5NTGPh/wGgP3QJmLpgP1nW7HCjyo4cXHkJNsevcT4NOKZ9D9ngJmgy9IRWxmgOvkkw5/FYZKTb8ZkvDQ/B+7IY5G/dtKWtvp2i4ybcq9MnyN2jwiYjPWvv80vzQXKNBEQvwIibBxD93GVNAkCDq9WA8e+tBDghpULA1KP5OVLS/DemRELCJHGKOCtHP2VLC6I/5keI10qCLnf/KpxJyeRVF6/3oBGPBkDhfX+BGDDL5+t1MzXauF7M67xC8RmWNKqutmJI4+xJLtZ0L2Ka/dJNi8OBqgXh9Bg785TQ=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f3479e-b2d0-4999-ca08-08d799d24013
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 15:47:39.7003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJf1mNOYe8UelvN3tlc9J3006ISBHp9GAlBC9h+ZuBT8XGMEXA9bQMFBHFUbOCUgmK6GSRUQZd8/pqlUxPluDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3405
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
X-List-Received-Date: Wed, 15 Jan 2020 15:47:42 -0000
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

