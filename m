Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.68])
 by mx.groups.io with SMTP id smtpd.web10.788.1611268670284944472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LBlg7vcx;
 spf=pass (domain: windriver.com, ip: 40.107.244.68, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUv81u+6cNOySohsd79nUP/EPvIK838xHm1nilUmVbKrOk2JHRNlGTQrcKFRYvAdzgxiOb48KEiNkiVKs64uWnpMac4P1BfNnx0pxF4HpJfkUXR3+z3StIpsEiZM8JhfZmRMnFx+wcmPsWxKEAfcc+nkv2NxnVLNJE6bHW80Eo4ENDIm3tuaGGWyuksHe8iaiwfMsogZlTmQj8ZRbnuVSwbVPh+pMfLnogX37521jFRh30dECtGCFXBSpuQczm3do1QGiU4Vaoejmt5MMmc8AsI8GJpIggPPBhitvj4v+TKmzEWH4m4ofe72u3Ga8NmMmtZpgJFCAvLFFKL+bySPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3w251pZjTuFIgWPrp4DivX8c7rSoZN2P3xUB5K79LQ=;
 b=Y6DXzC7ngRVpIGXIK1AHGgAXT8nvf5svd1T7iyIq2P3B4aOotrBbIQGLpXJsjWsEN39JoY/rtDzU/oZxlQ0V5AVIGIoQ5XcMbu/I+eFdbRyhMK2Tiw+Oxmf0bm+bLxY7mmGSESjlnJueJgfyYxSzuw+N7eL29W7RC09J0Po+nWWlM2DSw3HXhALUYvhVSkM3Ps9KCJiUzEZPjQX9mO1xGTPhBi/kBT2wxqk1BVynI2z4vLtBWsvK1+mN+eqzXShPlBfLWE54bCubliGCrC6qNo9xq5O0LrfH4kR1jMsJLY87X/frcHxTwOE+2zx4qaXj4dOc9rvnrxrM6ZJxPSyxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3w251pZjTuFIgWPrp4DivX8c7rSoZN2P3xUB5K79LQ=;
 b=LBlg7vcxZqxUuXwQVXDECGD8UCOToeCmfZiy+THzUCfO/clh5LzZE8pqsl1vFmcbewG9sAW0+C0C/42pAZJlJaByVNj5sbZukYR/PqEptitscBTexBDJ+Bn5XlzS8eczjH2Vxt91gn7473n85G58rddjzxM9Pe+pGKihW0sPzQI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 21 Jan
 2021 22:37:48 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 22:37:48 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] oeqa/selftest/cases/tinfoil.py: increase timeout 10->60s test_wait_event
Date: Thu, 21 Jan 2021 17:36:39 -0500
Message-ID: <20210121223639.36010-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 22:37:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef90877e-8542-4b8c-82b2-08d8be5d2dad
X-MS-TrafficTypeDiagnostic: SA0PR11MB4671:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB46715CC63F16C10C9950D2AC80A19@SA0PR11MB4671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5IBzdZWnWt6wkPBC/JqGxjoIhROVWMamYUpSAgFLZIDxbwFTt44cOEoUbCL9h+eRY8cGqXGm7kpQdSBYCHJIa7FGpfmTxatQV7xc1eOvA396Z2XWL2ISc1maTXFRE2VEWpckN+x2e5i+OsVA7tKMbUsYYpMsIn4/VrXQ8BbY39SGGcaoJTle36byP2rAdT9kqpUABYUs6RXAtbF7tnEw7zndBUxwLAAZgBJMTtqujbxiJSaQj+n5c/UlvaUTb5XAmxoZkDmS0Cd9LJ2v4TYJ2XCzaiy5hNdrCBd6eXP9Xn+CF+j2FcMA9HnOItit7WF5tux0uNqz9P7vPvp0HRR1WCeA7VqNn4aUTTwCf2q32V6sM3Z7S3wi9CwUtXLu9UfNERGDTQbJ7linO3GBAXYCTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(396003)(136003)(376002)(316002)(8676002)(36756003)(66476007)(6666004)(5660300002)(66946007)(52116002)(66556008)(6916009)(2906002)(86362001)(6506007)(186003)(8936002)(6512007)(83380400001)(16526019)(2616005)(26005)(956004)(6486002)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3wkvJp15n2Vebm4p6we9TN9zkXq7nJjlC4Fygbrl2ckuFfjiK9bUMJumStkd?=
 =?us-ascii?Q?vyi7TgF4nllqeuUbR4u/NOqzaWh6QNyOEZ3scMjK2rAEDC2u2YDZWRFjXlF1?=
 =?us-ascii?Q?icKenLsRKTWQ9qk6WvAsTbS9kkYFp/07HnTCnvCO0p4jxDDx1tbb1oNj8Q9K?=
 =?us-ascii?Q?kAidgVxPvS1j+QfbPw27fElmMfNOKbZ6k3zQEmseUtJhLWrMxQYJas5bW7K0?=
 =?us-ascii?Q?wibLDpn+5AY2BUOV0kvix1YhpvFiEg3J86ROx96uDqSfVt5tvGYCvS8tl/YI?=
 =?us-ascii?Q?k60tX1pIYXBjTSUHJWElkOMnZoA/rT/c0pvGv+gsHgQ5b2Swy/6lvskjK5Bt?=
 =?us-ascii?Q?cdV20L96cRVzcoxxBi0gXdENbAaXxOPNOtUB0Bcn5lW8s67QrKNQn3cRf1eC?=
 =?us-ascii?Q?W2UBWn4S5axw7sDHTB4BoY10MSNjul7A7WaSIYGWKiJRzPINO7/CXCn4Lh8/?=
 =?us-ascii?Q?pZyGtJjHEJEEC/5Hos0LYea2Zzw8zyOO3quwzQUVrhBhOWRiV+oPUC53bQRZ?=
 =?us-ascii?Q?AMahZnew1RL7/8IYqcWf0ywlqUereRNjZYeiD4HAXOLM79dijmwBlk9J3QTV?=
 =?us-ascii?Q?JwMpI+ZRlJYU6fIi5+Z53ywNItSUrIK3w82oZxTnlo67gnzl1/eG5zFmxwkU?=
 =?us-ascii?Q?HY0FalNer9hiH+t3wNKxOJVxUYIVzOdCiSo5q5sFxHT7eOGlsvu4tKsGgDuj?=
 =?us-ascii?Q?e36bBE4DCpOSIqTeaUIXTFANicqGH91F55dojR5BEwdglyz2tFy2qttQjEgX?=
 =?us-ascii?Q?Wo5kT5Tj2i2/FhrUhrt6aRwUqIp2R7I/XBECdY06SXadWT2jUvGO6nm3aDeq?=
 =?us-ascii?Q?ntPpWRO9cSjHMpL27e3Qkl4AXAcmjlTJco7gOaE4sVkZitMfDd02ubyOnHc0?=
 =?us-ascii?Q?0VfkrLwzsKnWPgTMwpBhQb6cObKzfs64OWpJuHWO4TuE4RaTV7svKqkuTOs5?=
 =?us-ascii?Q?QlT7amKhmDg1Eq34TOozzIyt+M1buZfOnKaeLeVHpCl73/TR4stCK3XkNrjQ?=
 =?us-ascii?Q?AFUI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef90877e-8542-4b8c-82b2-08d8be5d2dad
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 22:37:48.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkEPULJmma2cOMYxMK7Mgz34WB8h7jS3Gt4dfuljfgWcrOah4y+eLnak1ZQMy0Tpk49nZW11GeVLa6s9E0ZvGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The test would timeout on autobuilders. This patch increases the
timeout to 60s

The test will now also exit as soon as we receive the 2 expected events
Expected runtime is around 1s if successful

Bug 14158

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selfte=
st/cases/tinfoil.py
index 206168ed00..a51c6048d3 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -100,9 +100,11 @@ class TinfoilTests(OESelftestTestCase):
             eventreceived =3D False
             commandcomplete =3D False
             start =3D time.time()
-            # Wait for 10s in total so we'd detect spurious heartbeat even=
ts for example
+            # Wait for maximum 60s in total so we'd detect spurious heartb=
eat events for example
             # The test is IO load sensitive too
-            while time.time() - start < 10:
+            while (not (eventreceived =3D=3D True and commandcomplete =3D=
=3D True)=20
+                    and (time.time() - start < 60)):
+                # if we received both events (on let's say a good day), we=
 are done =20
                 event =3D tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
--=20
2.29.2

