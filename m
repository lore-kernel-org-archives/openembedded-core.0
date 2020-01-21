Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390053.outbound.protection.outlook.com [40.107.139.53])
	by mail.openembedded.org (Postfix) with ESMTP id A5D657E09D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UPnrSTcGw4a43+IvamlMOuPD32DL5XemwqBbmr7nIDlAnPoj24fOfNH/JXPkljvYcV/Zfggtm0mBydlw+XG0aMFYC27W4nAcEIX40YHIjB29tLCAm1mvx5mIvPCKNcEmVwxODB3V4w688WyFPVrJav4GCsxf03OyEAJsiGTtUWsQ/KkwP1nNw7tf/6LF8miA65SK8oGfbWHov9V23+kgf+IHd2XkRzA4HGk+e+IWgKHDWVSxMFCobIGRdYhYO7Yta4qchC0/AmdIbx4/cWjtsEdA/LcfRkCdBiJsAAzYwjkI8VadqSD06dCCIY0bfa0RFFkb7YjAh8KduOhSFasR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kioURcwpG0gVL4wsp/vIRaDP41KIk8BMGT4LXTO1Gh8=;
	b=FTgpFdzMFzbn6jZEwog4iSRS0IWuxZrHHfjk4w/k6aRw02EfuTgz1vh/96O5KSFuhXal+ceEyVF+HHm2acGRiLRwW8LFWYaGdQKPGJuhF67MTaydELIYSVPbhq4b7qXGiPAEs5Yr5lB5oZpQ1OGaIED8FCzVaOyOgq3/OoATGCsPlzHLZSaLhUzqeO4cIHleKhvSR110D0XU5h60rYeHvLGEYwc6BbhEOFu2dltth1CgdxwHtOnhjlXS3n1hSM5KdkVgum4fJrRGSUzgpYsM1n1VEj8zBMMsVCG7cO+l4YAVtcfheFe/lsE/sen0vjkCcM+1RWNONPAUcQ625i7wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kioURcwpG0gVL4wsp/vIRaDP41KIk8BMGT4LXTO1Gh8=;
	b=o/Ty+kyoPlzU47SVgtOtCJ8uRBrAdehbqsAfeXWaTwrd8iadTELDvqgojL7ZpLjVF8gf8+GLgzdtDAuqkvEaRnHSQLnWZV+M4tlzw7ZVO2Hkgiz6cnuBN6f0acjRVafCse4jiS1OVKBUCD7PL3lOZozrrYlLH3CNAYpHbbCePuA=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB3055.INDPRD01.PROD.OUTLOOK.COM (52.134.153.75) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.18; Tue, 21 Jan 2020 06:40:13 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2644.027;
	Tue, 21 Jan 2020 06:40:12 +0000
Received: from localhost.localdomain (2409:4042:2100:f27a:415c:2da0:91a7:32a7)
	by BMXPR01CA0009.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::19) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2644.20 via Frontend Transport;
	Tue, 21 Jan 2020 06:40:10 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][sumo][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHV0CWhCkBDqmN7eEWxjB9D/hKhYg==
Date: Tue, 21 Jan 2020 06:40:12 +0000
Message-ID: <1579588802-20345-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2100:f27a:415c:2da0:91a7:32a7]
x-clientproxiedby: BMXPR01CA0009.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:d::19) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4a8647c-48dc-45ff-f8c0-08d79e3cc3b5
x-ms-traffictypediagnostic: MAXPR01MB3055:|MAXPR01MB3055:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB3055B5638B9E31ADE5F30CF2870D0@MAXPR01MB3055.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(189003)(199004)(2906002)(69590400006)(8936002)(6486002)(54906003)(2616005)(66556008)(66446008)(66476007)(64756008)(6512007)(110136005)(71200400001)(81166006)(66946007)(4326008)(107886003)(66574012)(86362001)(81156014)(36756003)(966005)(52116002)(16526019)(6506007)(186003)(8676002)(5660300002)(498600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB3055;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vciLrEhyEQnZn5F9O3PbRIi/dcBioorsIe6sMP8hK/Hqs8bc+OGRZvgDzjVxwVffr3BPT5Zrbolivuopq9DL/Qeg1Obr5x1J/m3lHGS+Zmj3Io9k0wFJaPLAGJoFfu59BYkk+gyY/8nq9rqSYMjVDjA82dm4WbGaLA/Vac5mzOTBB7/GrzLFz77LUUZ5u5wBWpCvClZbA6jmrn5CCMiC6b4N8OWtUYRS0t5afJ8v+6x0hIagIajSWL7Diug2hOn7v3sr61QFNm/I//L6KLNQLGLe6rri0SnAUDFvZkSxjHO8jvXVaGwPb9oAx0T7lNuVHPBW2W9SAGFkc/DZYJ0aDyWLhr5hFZymF2T4x43B4Gk8rU8FBNjtYGp8FN6levPHlhbgKwy39PzknO5ezR3W7KwgieKud/iBe+84RlhPYHOFG+xNUrEj3A88yjlxKWVUqdUnwdBtpbemcNDdTgHX+Tf4mi8v3Qat8lCxW4gQNi1kr34MrZr4ZA+GcigBqlwZu3fP7jOjb2SZN/yZ315qR1R/O8AZPlbJSBQYOuYWtg/F2LFjMjQO0eWMib9u4soXdVZT9NO+9j5a6ePlluuAOw==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a8647c-48dc-45ff-f8c0-08d79e3cc3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 06:40:12.4748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEN9r5TWIHZZWQRjQt5e3KQbD/nLQrU8egR5eExFxmQQGPIKtWRdnURKZFbtdYOhtVi//zXuMKkg6sYwUM4Xjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3055
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][sumo][PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Tue, 21 Jan 2020 06:40:16 -0000
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
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  2 ++
 2 files changed, 38 insertions(+)
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
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.6.bb
index acbf80a..688e177 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -8,12 +8,14 @@ LICENSE =3D "bzip2"
 LIC_FILES_CHKSUM =3D "file://LICENSE;beginline=3D8;endline=3D37;md5=3D40d9=
d1eb05736d1bfc86cfdd9106e6b2"
 PR =3D "r5"

+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/bzip2-1.0.6:"
 SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz=
 \
            file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
            file://configure.ac;subdir=3D${BP} \
            file://Makefile.am;subdir=3D${BP} \
            file://run-ptest \
            file://CVE-2016-3189.patch \
+           file://CVE-2019-12900.patch \
            "

 SRC_URI[md5sum] =3D "00b516f4704d4a7cb50a1d97e6e8e15b"
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

