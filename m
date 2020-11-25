Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.61])
 by mx.groups.io with SMTP id smtpd.web11.600.1606330727280025735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 10:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b7C/L7a1;
 spf=pass (domain: windriver.com, ip: 40.107.220.61, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI+QZxpWiPn1xAHtyvpuC84GJTJjILQLqYPIizDMmEN8ZHQFeLWsEmPMVvOPOVqs7N2dVseU2rXkFkrAm7A2iUlE1FUbptOoqzPuSoMTGMaBRX2hqfCEAj7KzwRXAoRigtiOKLIGhB5z7jUR6/MvQTlbpVSgWVINt5k5S8MOw//oxUE6kRm/NpeHHEhVld4YAW2kK8ZA/KPEahYGq1LWFOO9hTxHV78ft/qlrUvRPe4XzlMLhVMUgx6jnKJ8vTepJI/z2eufNrmBOU2rAvdjpXZ87UbK+sse8PuIhkGUElB3yJTd/oxyTuR0H6N7a1sksdp+eaOjx3gh7zfuBmM5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KlU0ttI0jJE3OHeTPFEc4Kxu/atSQqIQh2TApvjg5s=;
 b=ZXcQFW1qtkeQoVQ55111N+62FwwWkH38qu+w4LoNgxRkj8uRflkGp2ysmbY/HpUc0bYIatAah1i0y3BvJGr6799SsVtOSCwpB/V8/qNDChZHyQbVhL7G3hOT8GVjwRtEyR+OVHuHKlKIjxmSZ6gZIv/ykJP2QP4t0VFHHFsBDSrc0r4hanM+xL399Y3KAvbjQX9XhsVXCqtkR3fk5yqtBCWLvf4Xb8GAwl3fr6LNirA7P0EN+i6olWjjazKP8l/+50zQJebKZkP3d8uHCflIHeIFJQNgkQMt7v65/sB56Aca6kZtfMSkAnwmAFHL4lPoqPFiDvTXYsl1Swt34WOBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KlU0ttI0jJE3OHeTPFEc4Kxu/atSQqIQh2TApvjg5s=;
 b=b7C/L7a1PyONasH42FygJiqxzWGbkcRExjBu/2gY06BQ76amVVypHl6q+4Mn10JQkJYlpZHpghX/9DXgcSrfoVNjyXB9SHPbADVfZVXLZDfJpS7Az/k01IcR5af6jhiZj+fqUbAk96Q1jokdrLfAL/e59JGMlZAMkRjfldu1wXk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB1884.namprd11.prod.outlook.com (2603:10b6:3:112::19)
 by DM6PR11MB4137.namprd11.prod.outlook.com (2603:10b6:5:199::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 25 Nov
 2020 18:58:45 +0000
Received: from DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::a1f2:8db6:916b:2985]) by DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::a1f2:8db6:916b:2985%11]) with mapi id 15.20.3589.022; Wed, 25 Nov
 2020 18:58:45 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/buildhistory: record LICENSE
Date: Wed, 25 Nov 2020 10:58:30 -0800
Message-ID: <20201125185830.3688293-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125185830.3688293-1-saul.wold@windriver.com>
References: <20201125185830.3688293-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR19CA0079.namprd19.prod.outlook.com
 (2603:10b6:320:1f::17) To DM5PR11MB1884.namprd11.prod.outlook.com
 (2603:10b6:3:112::19)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MWHPR19CA0079.namprd19.prod.outlook.com (2603:10b6:320:1f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend Transport; Wed, 25 Nov 2020 18:58:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0ab3c4-9e1d-4abf-b2f9-08d891742269
X-MS-TrafficTypeDiagnostic: DM6PR11MB4137:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB41371FB836E578C47BC1642AEEFA0@DM6PR11MB4137.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2P9BOXDTN3keFhQUqPoYm3ahYmNSDfnYC4uyhsYTx0h0C8InRSu11JR0pNzns4kaxEOzvMOF3g7F6gBMmodKwlK65gNmSxrhQ1zvGMqPt4PFl/mOX/ebBEQrEVagVMyzR+u9S9JkOjT5n+GLetoS7i+qDAwShSS1DoHMQc3ZiR+7MwuuVo4fcjCeaX8UHXgUEK4p5yRo3KnXhjKy0XxBTr0EOQ4aSz3inSXqPHD6tCLzWkvlaHMlhWAfkZf1NHVF5lZ41OeY3CRt30DTHT6h9+py5kEumAubC5H1IkpwF7nLWmjkvEluiIkl5+8z1BSI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1884.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(186003)(16526019)(2906002)(26005)(6666004)(316002)(956004)(66946007)(66476007)(6506007)(66556008)(8676002)(6916009)(1076003)(5660300002)(2616005)(44832011)(86362001)(6512007)(6486002)(52116002)(478600001)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gcRksJhuF5OEAa1ccicGRqtDNXfx3iKSIrd9qYF2xiXWU+AHXZds9rq0DxbI?=
 =?us-ascii?Q?gCyS9Og4RL7KJrnn938UHU1gQ21fsAPwJzjKSug6nL4WbaikWURJvmMzyP+z?=
 =?us-ascii?Q?XanPBcv0iYANbt6n78ggi7gFLuxEEsQ33H4B/C17lJvs9Oz2RtYiZ0Pvz7O6?=
 =?us-ascii?Q?s4ENzPgKsg63dEE3+/UqSkd/XGVhlDz9eB3Zwe/dgn9MaqtG9ncT4XUn4TKd?=
 =?us-ascii?Q?iA0EmXrS3dQlSkGZd0c+WxXoBehOIBtMKdUE5c8yOriFVz+cH1uBvkZdV16z?=
 =?us-ascii?Q?TNI2AAbUHYKpuyFzTcqVzBMIOIplWyK3YvLLxEqo/GSkru4RYXoh7NKt3fuq?=
 =?us-ascii?Q?YuAfDFwlKrj985deswR91JjVBxcWOMdKL0Zpz0fBH1hNAJXcIspF5TpjNw/V?=
 =?us-ascii?Q?ZagS0bAkOjezh3aBzMjjk93Z4L9+fiieZRyoxyZ6yBVq2jPfgCQfBjWw0/uT?=
 =?us-ascii?Q?m0t0gf65KWHDRBDKu7FdS8S664CTRQhQmrIv9qbw46+evVJ5bFkMMaLQd5dt?=
 =?us-ascii?Q?ycs93rUPLkRdolGYM8t442y6exp+jjep41ZwNrr4NDp5lHlNanA5HoTmqUDJ?=
 =?us-ascii?Q?9YpAhgjpmYsYeOGqjp6/kGW6yuaNgVZA+Ol5gdB4IGr7y8E9dJ7M0VrEE4fk?=
 =?us-ascii?Q?scqjFXJr223fZnkLk4x4bJi66O6u+/8acIx0qTPt2A+J4th2VB42ahZGdLdD?=
 =?us-ascii?Q?o2H2vgGxyJIVq2CRvV3AKPH+sDtfBPxG+kbc+WLl9o7H1jjKiol07PKk9POG?=
 =?us-ascii?Q?WwKPEbxcVZ9ykNPAlOAlmZjoYfWQEsg4OpykaJlTTTvOHqDcpz7BCAALpB6V?=
 =?us-ascii?Q?CzAiKUzOkbSxS3SVzqaQfGNCAbHI4bSQvikllJs3vBf5ErEmrih9Ib0cZ/ks?=
 =?us-ascii?Q?bO0XLCA7FQ9HAl0VKOwLiuQ1gCZ6ylqnOEQ9IseA7jW0HgPnmGjjnyWp/7UN?=
 =?us-ascii?Q?tCx41lPbkSP9zhrrsyB6Jsf3G+gCytptqDU4nNubz+5VAnXsCjfqSrASKDbt?=
 =?us-ascii?Q?upVL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0ab3c4-9e1d-4abf-b2f9-08d891742269
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1884.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 18:58:45.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnhLN9q922+NztNm/JjzhCDNvxBS58f2r10fZxKTGYs38Xu6b8XvoJnoT3FMzXqMrciY/sijfNhY8j+hNnMxmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4137
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Buildhistory stores various bits of information at both recipe
and package level, while there is an associated license manifest
directory tree it would require additional scripting to extract
that information.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/buildhistory.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 7d5e3eb8fd..daae056144 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -115,6 +115,7 @@ python buildhistory_emit_pkghistory() {
             self.packages =3D ""
             self.srcrev =3D ""
             self.layer =3D ""
+            self.license =3D ""
             self.config =3D ""
             self.src_uri =3D ""
=20
@@ -218,6 +219,7 @@ python buildhistory_emit_pkghistory() {
     pv =3D d.getVar('PV')
     pr =3D d.getVar('PR')
     layer =3D bb.utils.get_file_layer(d.getVar('FILE'), d)
+    license =3D d.getVar('LICENSE')
=20
     pkgdata_dir =3D d.getVar('PKGDATA_DIR')
     packages =3D ""
@@ -258,6 +260,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS')=
 or ""))
     rcpinfo.packages =3D packages
     rcpinfo.layer =3D layer
+    rcpinfo.license =3D license
     rcpinfo.config =3D sortlist(oe.utils.squashspaces(d.getVar('PACKAGECON=
FIG') or ""))
     rcpinfo.src_uri =3D oe.utils.squashspaces(d.getVar('SRC_URI') or "")
     write_recipehistory(rcpinfo, d)
@@ -369,6 +372,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"DEPENDS =3D %s\n" %  rcpinfo.depends)
         f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)
         f.write(u"LAYER =3D %s\n" %  rcpinfo.layer)
+        f.write(u"LICENSE =3D %s\n" %  rcpinfo.license)
         f.write(u"CONFIG =3D %s\n" %  rcpinfo.config)
         f.write(u"SRC_URI =3D %s\n" %  rcpinfo.src_uri)
=20
--=20
2.25.1

