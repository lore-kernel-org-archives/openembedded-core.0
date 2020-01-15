Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390071.outbound.protection.outlook.com [40.107.139.71])
	by mail.openembedded.org (Postfix) with ESMTP id 758BD7F9A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 15:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Dsyq7l6R8nkjeVfa4jXDvs9Rd3Hb7ZcsPUEi2zXT/uIbMgR0U0bR2abXWOgpDqgWJC5WnmBuWB0mz+t0vb8xOEiLv4wahPlWUYuKjBjNbLkRqTqgN8ePawuEkgsyu9MzYlmi48RYmFgpMKZYEsOI6cBi0ZGUvi9DLa9NSZ8PQ3rY5jgj06LE/6QGv711Qz2g76vf5B3l7TMLOk22+appTnh6sOa+wJ3p8UpTy5k9mNlv00O7i+z/hHABBweYJOHqhpYCC6xm+LNaKmDnfjQy+0lRayubcj0sEueGTs3AP7+LWpylksyIq7FQ6L+/eXixRLqcxmw3/e8XUlHoDKqk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hbWqS5v38EQh4j6CxE10xNEf7iuMlXb4VnNLTcGdl80=;
	b=SvNTOFZ/k+/cNWGOYcTM7BO+NCsqEbOxaHQlBt2q92qvv0bZyMLP5g6yFwnjZkmjz2hoZ8I2qlrc6m0wDQiq+rTbr44gpL7ZsYzwNsk9P61bhZXi6hFMz0Mxsc78VKXFFouia/Ln0qZ35F6t1NReWLzg+ey3V0+uSwNOOTjc79FdKaSOaHVBM/Dnj7+Pco4LkgvywxCJp2MbMARu+80rv29l3sjnA2AJF7Hx43ZhT2UadGNEaqBVhyt2E6kYaslX63z7a464fSLJheGIJjlHzM5bHTww6FrOSPvMnHaXdZ+yUdP3MiIhxhZZue+ks0e8/Gd6Eo788EJAjM8/fMvU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hbWqS5v38EQh4j6CxE10xNEf7iuMlXb4VnNLTcGdl80=;
	b=xSV7P9YnB+pGWrarVZ0lwC3gGbbZTQCD6C1XTFT4AluBveoIe6m4gu/9m7bDxqL0rBhPISXd4md0vVQlUmUsEIHRgDWx9rZwYiwBeiMUufFeYWIgc7v/2FdKrmTTul1DgCrr96V4tDDpmtnNOYp8mbj1R8qt7YHaaZRe1OErfy8=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB2222.INDPRD01.PROD.OUTLOOK.COM (52.134.155.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.9; Wed, 15 Jan 2020 15:49:47 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.017;
	Wed, 15 Jan 2020 15:49:47 +0000
Received: from localhost.localdomain (2409:4042:2385:977f:51d8:58ac:a1fe:adc5)
	by PN1PR0101CA0010.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:c00:e::20) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2644.18 via Frontend Transport;
	Wed, 15 Jan 2020 15:49:46 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][sumo][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVy7tpptgrcZtIR0aXP7lopE/U5w==
Date: Wed, 15 Jan 2020 15:49:47 +0000
Message-ID: <1579103359-31455-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2385:977f:51d8:58ac:a1fe:adc5]
x-clientproxiedby: PN1PR0101CA0010.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:c00:e::20) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b686870e-6a93-480b-a9d5-08d799d28c2f
x-ms-traffictypediagnostic: MAXPR01MB2222:|MAXPR01MB2222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB222245D909B111178588561487370@MAXPR01MB2222.INDPRD01.PROD.OUTLOOK.COM>
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
x-microsoft-antispam-message-info: HISwUwPgQ0BBwkyC6T+e/DkYsjY+odkhP5jpCBek2zfwSkG5Ev9kA8kIGz5l/S5jIW24EEiI/FuX0Tjl5j4giJc8Bz5W8+iAxNXg3cUO92ltJCag1tGw5hhR0+ZDWkbdh8cBNj4RdlS79zTQ3Cwxab/nENnLw6zNUBoWtgietnN03eVwSJkXEgi7PdSxkt+Jpem3cVYgKVQzkqTro2zGL7yPI2ID4qDQ3FRPfPK/U02+Md8TSphmjrRQH9AZJProLmDbEaSPZOTj8BUo1eLr5F8UxB9ppdL2eqdYk/eiMSb7c90GVphjSJPUqHTpo1be05SD/PBqLWtLWeAKpd6+IUJdoYY66Jz/gjzkmGqxFb04Jih70+yBp+5RTraEuGlc4spFuiyJ4S62KP9cN2WP38m1ZeT2Iq100KgNmgW7ssxhUhmzMNobjlm2FT2bdGlrXjaZoxGEtWb2DcfXDX7uhZ7QH9P4TV5q1jPMRqQ99/d5R7uu0mUwoO/2e46jTileHmaMKjPQjfEjKNfipZVMPqa2ZVaoKsa7fcUyFEmtzTM=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b686870e-6a93-480b-a9d5-08d799d28c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 15:49:47.3728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FxIj8jdaC31f2KMGz8U4xzfCUNJAbYc+QNc+k9VgK0PKH5nupIE6WW7Ai0x6jWqeaAmO9nsQMpYK1v8d4zejzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2222
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
X-List-Received-Date: Wed, 15 Jan 2020 15:49:50 -0000
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
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  2 ++
 2 files changed, 36 insertions(+)
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

