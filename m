Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380053.outbound.protection.outlook.com [40.107.138.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8487FBCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lBnz2px1P2Aaa544VgsmZGBYJQchhqWcjsiqmz6Bv2TLI7WIREYU3c/HhvD/4WBlfVPAwPuklq0FzgH+7VVYQGg2Vz8gdtDF67oGRj31KsCdZrhu0CNIiQJEU1xlclln1/IiPCC1hEUlp1BwEMaCDZq5yVu5Bi0kokpK4oPF7am6AxRpuQAJh2X5sigobrMOfgWEu3bKVXgCud3TBVy8IS+EFOHtrFB4OX+KxuDcgQ0bTnzs7XaVJI8Ph/JCmlhBbgLQ+a68qTzN75EPq6qLH5jDag/bjE7g1+6/IOLsuCl09gN/Yztcc/pcxN/XH83hpmX52HM5PiFgtyydTnqTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JKrD2JUfQESlBBZxuC0oFYDqfLci7FRe6GNmCfQzXOk=;
	b=fboZ3A6WQ2JtP1thgdhiMRytVgHZXdFk21MchXmocMV+g8ouxqU7Tppw2ict/J3ITBaOpY/4KKVXPQPam2HLkIpp62Kf1+UiAmyzWiftj5BwdT+ucA2ujJYWvPZVCv45MmZ7wVXTMEJXWKD1VzBG0Oo7kn4Q6ZVA8aBKgjUduCoSkCb3pIVUS+ENbyqvNgIicImRYUdiruN/cSPzeIZF40pEe7vMX2us32G2JZziJAfNUN/JD4i2JWax+KdjOg3k+BULT6/qPergOCP/LZoIGGEuEL4HROS6Xm5kiW9ipbB2nzTQ6MM3kNM2HtnKweoZI39TWr5PpaJ/8CvbUgKQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JKrD2JUfQESlBBZxuC0oFYDqfLci7FRe6GNmCfQzXOk=;
	b=FNYdyCwqqprzlF6E9QAISEW3VsiLxd9QRTWo9nHrb1ks4IYs+hsmp1JWCCcc/iVUv0tz7UjFWI4H8NHtIH35ud+MXr8Yiqq/V2BSVW1lEjJnSRNDGr1kjuI4QbZWRwNhw69mWLmhSR84FgEP2qy0+ZTZtywDOj5ohMyYnKrfPCo=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB4061.INDPRD01.PROD.OUTLOOK.COM (52.134.159.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.20; Fri, 17 Jan 2020 12:57:26 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.018;
	Fri, 17 Jan 2020 12:57:26 +0000
Received: from localhost.localdomain (2409:4042:2481:eee6:415c:2da0:91a7:32a7)
	by BM1PR0101CA0070.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:19::32) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
	id 15.20.2644.20 via Frontend Transport;
	Fri, 17 Jan 2020 12:57:25 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][sumo][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVzTWryKv3KvtSs0ySRV206amRdQ==
Date: Fri, 17 Jan 2020 12:57:26 +0000
Message-ID: <1579265836-11637-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2481:eee6:415c:2da0:91a7:32a7]
x-clientproxiedby: BM1PR0101CA0070.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:19::32) To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44f31c92-f93e-4b26-d9cf-08d79b4ccd5e
x-ms-traffictypediagnostic: MAXPR01MB4061:|MAXPR01MB4061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB40615BBD355BB207A464AE2187310@MAXPR01MB4061.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(189003)(199004)(16526019)(107886003)(186003)(2616005)(4326008)(52116002)(36756003)(966005)(478600001)(6506007)(5660300002)(316002)(110136005)(54906003)(66574012)(66446008)(66556008)(8676002)(81166006)(81156014)(2906002)(66476007)(66946007)(6512007)(8936002)(64756008)(6486002)(69590400006)(71200400001)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB4061;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MqFcLDSpY4a2KWnF7+YwBaxv+1XgY15YNRgDgvfvP9Ed5HWpXxjAyi2fqizLdPUBkVfbZMX+NoHn86emYPzIqyC7ePE7jKrISNcLZnXnhqiMeoIiCAfu87ZGX3Z7lGwL2iiFsgkDAMzW4PnCEFTZ0t5EHJqrop+KQ2Mc+jAm/8izLa3q4dMQDBWNdGE7TpxfetOLErCIpL1705j1EpQUUOCsFcWzq3jnF6OA/NWK1SDDogECUtnTnO/djz4GgVB4G+DMrUDjcVN4siAqDxxT+Pl8Xh0XIrWHjAVye0kEoEqwNLm8b7+7ew5++nmZGuVCcW+NczgIAm9VnabYuHydkFjoE21e5dVuWe/WfRIO2IyjYpRS8MESK2LYtTO6FobBqR9yU388ZMJ9nEPdXU6LGfBrhPo5xyigsqhog5JAujk7XxvjgTzecTBcf+x+UInBx+PQdzXcRTjdF03EhEjP2P3MgwqmFvWJ+R7yecJMnPVrgmYcSemuOmqHf+6Qs8w6LIH0YBNk2aTG2/EkNFiBvGWEac7g7vvi+Ubq3DsHX3EKf7/8kB2dqpS8seqBTa38dk8DoG6G5evgLgMi3FCxbA==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f31c92-f93e-4b26-d9cf-08d79b4ccd5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 12:57:26.5207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tO4NhmWNZOgOlSYfDcypnIRnCgBP+K9IuzxluMHgapXDjY64L7fSvhfDkjtoB7CoWoug6oTkma2AYEpH6OIwLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4061
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
X-List-Received-Date: Fri, 17 Jan 2020 12:57:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Sana Kazi <Sana.Kazi@kpit.com>

Added patch for CVE-2019-12900 as backport from upstream.
Fixes out of bound access discovered while fuzzying karchive.

Tested by: Sana.Kazi@kpit.com

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 35 ++++++++++++++++++=
++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.=
patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b=
/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000..94ddd73
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,35 @@
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

