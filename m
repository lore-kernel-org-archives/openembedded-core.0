Return-Path: <prvs=7080153b6f=joerg.hofrichter@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F2DC47E6D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 08:35:54 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5Q8ZYpN027840 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 03:35:55 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
	by mx0a-00010702.pphosted.com with ESMTP id 2tbga5md80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 03:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qgB9BLkyruq7vTvfV3uY+Pi++K0M6jVvB73D9NuQEgY=;
	b=PsVmca+W9OjH5xHe/T9ehH111hIUMcAqhqJscBlKAZGkD1EqrIZqk39kgNJBzjI8n/nafgB0/bPde2JdkdKA6quzd/sHiWPrS5uV8N86U6ryVZsvVo3tx27DKrXwgbsiuG34+0kXme3xNVnjnLQXDjirAF2XdYpHczvJw3KRRV8=
Received: from BL0PR04MB4659.namprd04.prod.outlook.com (10.167.181.76) by
	BL0PR04MB5009.namprd04.prod.outlook.com (52.132.14.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.17; Wed, 26 Jun 2019 08:35:52 +0000
Received: from BL0PR04MB4659.namprd04.prod.outlook.com
	([fe80::70e1:9133:5bf6:644f]) by
	BL0PR04MB4659.namprd04.prod.outlook.com
	([fe80::70e1:9133:5bf6:644f%6]) with mapi id 15.20.2008.014;
	Wed, 26 Jun 2019 08:35:52 +0000
From: =?iso-8859-1?Q?J=F6rg_Hofrichter?= <Joerg.Hofrichter@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] systemd: fix build with resolved enabled
Thread-Index: AQHVK/nCVUF3Jy9dG0KVaSstyCyb5w==
Date: Wed, 26 Jun 2019 08:35:52 +0000
Message-ID: <BL0PR04MB46592E859DE13D9E3EB43234FBE20@BL0PR04MB4659.namprd04.prod.outlook.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [178.15.87.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83ca1428-0fee-4c30-2217-08d6fa114c83
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:BL0PR04MB5009; 
x-ms-traffictypediagnostic: BL0PR04MB5009:
x-microsoft-antispam-prvs: <BL0PR04MB5009101CDFE93DF67EB7F9ADFBE20@BL0PR04MB5009.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(39860400002)(136003)(366004)(199004)(189003)(52536014)(66946007)(76116006)(91956017)(2906002)(73956011)(256004)(6436002)(14444005)(72206003)(5024004)(66476007)(33656002)(45776006)(6116002)(2351001)(66446008)(3846002)(66556008)(64756008)(66066001)(2501003)(53936002)(14454004)(9686003)(86362001)(8936002)(486006)(5660300002)(81166006)(81156014)(478600001)(7696005)(25786009)(71190400001)(71200400001)(316002)(55016002)(6916009)(99286004)(26005)(74316002)(476003)(186003)(102836004)(7736002)(305945005)(8676002)(68736007)(66574012)(5640700003)(6506007)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR04MB5009;
	H:BL0PR04MB4659.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Evdy/NpC889HBsuHKVtR9qUyOImwiVS2fMD8bWz79zjVqMzdXEo38q1jwxyqhe2T7LiBYdWMISQdfI/YYKKl+7GPgqdhmuqylmBn9cZaFQsqOuWic1OFEPOGDtVKiItNiPBZ0nNipIEYj3EmJx1jZPa7cfGL71q2wYPfSFTO1s1/CMuXNZQgcM51O/xVVrEq1hnXbDDfBG8XSajWBJ3TAnWAhr8g2LqFZAk6dHCoXPjVUrXrHvh/LoyUi+mR72s/Ux52MlDREEoGB4y5lf9qnNBnX8EuMhyY5+TnOhDSs/1GOcSfHolVUNIai99LHYqhby+X7/HSDyHgb7+jdK+KP6IHILFwWYIYApbSPvVl0eI1RmtN86WuKvvCyd22ljEqeLYfrLXPPXTANbKXiUgS400470RS7E7KOK7QZSMz+E=
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ca1428-0fee-4c30-2217-08d6fa114c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 08:35:52.2765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joerg.hofrichter@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB5009
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906260105
Subject: [PATCH] systemd: fix build with resolved enabled
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
X-List-Received-Date: Wed, 26 Jun 2019 08:35:55 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Joerg Hofrichter <joerg.hofrichter@ni.com>
Date: Wed, 26 Jun 2019 10:30:34 +0200
Subject: [PATCH] systemd: fix build with resolved enabled

Signed-off-by: Joerg Hofrichter <joerg.hofrichter@ni.com>
---
 ...e-also-add-missing.h-needed-for-musl.patch | 25 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_242.bb      |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0026-resolve-also-add=
-missing.h-needed-for-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0026-resolve-also-add-missin=
g.h-needed-for-musl.patch b/meta/recipes-core/systemd/systemd/0026-resolve-=
also-add-missing.h-needed-for-musl.patch
new file mode 100644
index 0000000000..9c29944511
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0026-resolve-also-add-missing.h-nee=
ded-for-musl.patch
@@ -0,0 +1,25 @@
+From afddcc9f6686b85380f2c4ac15f901012b725b1e Mon Sep 17 00:00:00 2001
+From: Joerg Hofrichter <joerg.hofrichter@ni.com>
+Date: Wed, 26 Jun 2019 08:04:50 +0000
+Subject: [PATCH] resolve: also add missing.h (needed for musl)
+
+Signed-off-by: Joerg Hofrichter <joerg.hofrichter@ni.com>
+---
+ src/resolve/resolvectl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index 1d2fc71309..b12c80f125 100644
+--- a/src/resolve/resolvectl.c
++++ b/src/resolve/resolvectl.c
+@@ -30,6 +30,7 @@
+ #include "strv.h"
+ #include "terminal-util.h"
+ #include "verbs.h"
++#include "missing.h"
+
+ static int arg_family =3D AF_UNSPEC;
+ static int arg_ifindex =3D 0;
+--
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/s=
ystemd/systemd_242.bb
index 29f64b995a..4c72890d28 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -53,6 +53,7 @@ SRC_URI_MUSL =3D "file://0001-Use-getenv-when-secure-vers=
ions-are-not-available.pa
                file://0024-test-json.c-define-M_PIl.patch \
                file://0025-fs-utilh-add-missing-sys-stat-include.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
+               file://0026-resolve-also-add-missing.h-needed-for-musl.patc=
h \
                "

 PAM_PLUGINS =3D " \
@@ -102,7 +103,6 @@ PACKAGECONFIG_remove_libc-musl =3D " \
     nss \
     nss-mymachines \
     nss-resolve \
-    resolved \
     smack \
     sysusers \
     utmp \
--
2.17.1
National Instruments Dresden GmbH; Gesch=E4ftsf=FChrer (Managing Director):=
 Dr. Thorsten Dr=E4ger; Sitz (Registered Office): Dresden; HRB (Commercial =
Register No.): 22081; Registergericht (Registration Court): Dresden

This email and any attachments are intended only for the person to whom thi=
s email is addressed and may contain confidential and/or privileged informa=
tion. If you received this email in error, please do not disclose the conte=
nts to anyone, but notify the sender by return email and delete this email =
(and any attachments) from your system.

