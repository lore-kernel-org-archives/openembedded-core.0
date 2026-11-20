Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5584.1795180501618142653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hD5qEOX+;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvHjtD4i+s/sB1YCDaAZS7wIWzF61VvXykGKnugoawe9IpP0uVpOLCn4x5dAkSog3be9Z1DrlZAtiW/NozShdrfi5WQtbaEJH+cZ6/ZJa1QGet0l2bo3mnR9CHknerYZwYw2Msk0MVnYlervLQ6Obgw8tPJROeeDwfrSCn7CvWGPW0zsdzOqOoxq4/Kx6c0B/VyQzeGzI2LwKjDVlViyaOCK2DAaGge8i8uXsup41jZ7AYTW7bvuQOefNATre7Md1oi/6LWyAxj0Dt9p+sx44xt0ifB4pmN1Yi71SlTqvsQXSTuTvXtdEugd4gQk3arWX16IHxcdYR6cy3yIo9Exlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYXdlwyoKnlEY9oZqvEX6KEomqiFfEFoYqEqhfIRA5A=;
 b=JXNYLgCall43cmOw97y0tAJf2nSFGRTflQlJ1CxJgz91YqhnFG3l3wzk3hivnkg4DMZZW+2O7khGtvdNVmv1obvtOBN6LUmHhzimYfE8fno+OM4si47SQBxoh77jlk1tzQVbUcWlR+kHBpKoLcguPzVM4zhm2Y7w6k9xaba1J6u+fgOsx5qqtrpgnZXT0Jviv2p6xmHx+Gi0JLHWSO0ebQ5y9pxyqyQZjMZCmyXddMJU8dsC0bsGaTnaPY/aH94/OpHs9kfedBbqloz/i/420OfeDGW8DNBWSbpdR0WiR2hfmvxXZr7UvxV8h+8fCyrIuVsNP7jQ2GiqcOb/5zHzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYXdlwyoKnlEY9oZqvEX6KEomqiFfEFoYqEqhfIRA5A=;
 b=hD5qEOX+LGu/TPpfeVwzZ9zJNCMV1P1yCW8Z4tlmsaWIF7G6oWYyxDpFjCHamqaadaP4vdEDTaVwnxv/YURgYxCzHbxvMM5xEVn8mHgBqqHrnWPWqcHOZGczCxLDBth7+m04dlHYHQq0OxIkEqbjF/JO5SZqufIwV6iYahrzlSnRISbIV/mg0NeRTqoHvjCdEkKjP0E+Zrur2Y+vaTaX37Ngukk5M8a4oUQjSAeTKlOi+DrccnJAK/qM93xvZ5q4On7WpM4kSpRNUUzOQQaHzFGuZ2LoCw5LEybilzI7/ar2/0PzLLAogfVafnX0ksO4PGxFBhABHp231tM3/mMHqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0815.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:14:58 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:14:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] epiphany: upgrade 51.2 -> 51.3
Date: Fri, 20 Nov 2026 14:14:51 +0100
Message-ID: <20261120131454.45936-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
References: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0815:EE_
X-MS-Office365-Filtering-Correlation-Id: c228daca-c4ae-413e-12f9-08df4708467d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|56012099006|261026140227099003|261026135527099003|261026130827099003|261102130727099003|261026121527099003|261102123227099003|261028144727099003|261022115727099003|261022105027099003|261021133027099003|261021123027099003|261022113327099003|261021135927099003|261022075727099003|261009223027099003|261021121427099003|261021130227099003|10067099003;
X-Microsoft-Antispam-Message-Info: /dd5ZDjuYuZGsp90ecnxG+xAOC+whZb00xnkOnaE+DRCecPzd1vBKbQw7Cz4730wepsxQzZNSlKSEq1Cc+FzEr3LunpahuzwPrW9oJ2lK3fNHtcM/Aux6cmXZZkJ8JZWVRHrNc4u845tYCS5UZMZByNZUQ/zyZEXOBXY54WwBcAx1EIxBeGxpyBuYpalN3H85ypwMs8OZYPXN8Zii1rz6S/Qd4D9oCwXyXVoOmGxqL5I+HnMjCL11fjubUswxgmcxJERkDV59o3O5rT7uoRIMe0j9QIbJJCFTU8F+APd6LCK/pCZOFIs64BtY+aAiAcspWKbZFmTEESPs9BaUsNPbuss4t09wa4P/WNTspMc+MSZhM/8pm0DD4gpkddDjpbKKxeDKk0xmUygCISBJNvb6R+MFyFSGPgVG+N9MbrFZBDohSF2FmX7fBHA/HL5wCFwf82B2eUTXDAkLPxT8IB2MZUI0YMTSjHpkNM+b7hA6HSha5xZRfdEkg7OpAqlJyZUP3/7gymFWBD3XbW/8j5qFFvJOpu76CsaqR0xs9237hTViY2QXs7y03EbpahMHmOwBMfWLobb4Si81Zg5ux8FVBCBcK44zCcFPdp2UG7d+Pmx55TOwMerhMLPcIbSpP/NGvIfHRiZS7XPz/09hCMl2atBJ5zjtmn/Ur3mYI/FpyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(261026140227099003)(261026135527099003)(261026130827099003)(261102130727099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022115727099003)(261022105027099003)(261021133027099003)(261021123027099003)(261022113327099003)(261021135927099003)(261022075727099003)(261009223027099003)(261021121427099003)(261021130227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BuBuQXGQDlhjwfgKgwG1qbTHunw5uk4j9OGySdopc/JS5wraT2Jv+l4E94N/?=
 =?us-ascii?Q?clKdhIHAYwEpYFHbx91tWfocAahNzbzhV8GL1iViuScC1zPHzYzR81UBqnXp?=
 =?us-ascii?Q?OjcEmdgSrIVo3Tw6fwW/0BihSqXq5olptfU90CMI1DDTEIj03IyM+3YV+M1Q?=
 =?us-ascii?Q?Vol4abQDPvOu5+5kpGHDcROCLH95ddTZXyFoz5cgfAlInaDtw1N+LpVMa0Tg?=
 =?us-ascii?Q?mL0rN0smcxroBMkcDUwWIkKhvI8n8hb6tfxs7HntiByirIb2FJiflAvcaim0?=
 =?us-ascii?Q?FHz88fo6vLXcvZ0MVawFGrUzmaUaMl2VbzztC0GYv00SY/R6mnuQPNCqzp5v?=
 =?us-ascii?Q?fCd+6rNHrv2+VTiH20ixpGQShtUZfN6FZJveD8Zcq1CEldWaPlEWEsWUudrV?=
 =?us-ascii?Q?HjnPCBteIyXV3Xlkec37DoCoH4bhfVdJxbE7TXvlqoPq//eGky77Y0pFSO/u?=
 =?us-ascii?Q?LbTZMFCDnpC4LLYEVR7xs9mJqBGtvkgcPsBtVEP6jOsW7TggLUqX2+lFbxUG?=
 =?us-ascii?Q?bj+ywFqgi1Xlqw6M3w4A9dJe6l5CsPbTeRQokK3runGlaNzEKAJFiGKhh52K?=
 =?us-ascii?Q?1LNZXcZNU2cEDnftz+KhNmXeUxUk4YPB1Y4SaookJMKVQPtse/uOwzEE/9Bd?=
 =?us-ascii?Q?tuffxC8bzuq3Nil0jTP/IAzZLPIAT2ehxtYU+N0GXNOb/TMzLdoVvKVWRQE5?=
 =?us-ascii?Q?eYoo69jRcXP9GKapE2I1Aq/FfgSTIQahwSBVeJmEVu3vrMUwuYl6Dlmy9ny4?=
 =?us-ascii?Q?XZAFttc0JcL1d0bbhkZkWRUSb8l41K2AYs7ZwH/ZNdHiXeiQEcgNTMB8WO55?=
 =?us-ascii?Q?8wovhLXaghepJihb6b/1NJ3kTAviO5ItiBju0pVvMsBBUhiiD11kp1lbV3d1?=
 =?us-ascii?Q?DWcSilcNjcMHGEC35Ij7NXnfWEIhDgIosbevHbh7um995FTEyemwJgNNFXpK?=
 =?us-ascii?Q?Vehk5of24GW7TIE2s+C6n5tmLKS9e56S8Y2XcHyHCMDAMKQhCaZnlC05648E?=
 =?us-ascii?Q?BRrqO1k1qYBIaf73plzHB6/vegXgIqJOEONFohJgV7BpygiyBOqesH7T9cxK?=
 =?us-ascii?Q?2GRfJ4bqnCeCzsxa9fz1QOA9F+WcTkj3BaxJr6Z2kLG9Uumsjo1mcboE8A5p?=
 =?us-ascii?Q?GqE9DlYbVAKBHL12nj7UQ2zkpg6WVltF9K+It4ZgefgZsUU1MQGAL8NFE3d9?=
 =?us-ascii?Q?lmYvJ63p4TqzjqxV2nF9SUHWcx+qykvaTfH2HZZsB9eBlHuEU/XVfJ/73lr/?=
 =?us-ascii?Q?ddEPSLFZ+cvXzASjYqLvY1pMT8rzCRySMlCrlcfa2CKYWJSI5KYkk8ij9oA+?=
 =?us-ascii?Q?6JimptM9+q2J7p9EjCR3MJL8c7odo1/irGXezn8pUtsu98h+j7bxDVXOHHHD?=
 =?us-ascii?Q?Zc+af1boTLlzVPM0yeo2KEhLT87YFQTZQXd1L6IsRJIQlftXfLb7GtEjLEeL?=
 =?us-ascii?Q?l85mdZihHUp76t3UgherjUM+17cXFuDcw4+6QA+NKw9ZhGNzDZkTJ3RLfVVU?=
 =?us-ascii?Q?Z1dVrKlH3hp/GwQXyoF5mxGjVQaOr5tbI5B9KAvxK9+qqoYQUi5XfQUA0bGt?=
 =?us-ascii?Q?OezJi+5soSABRNqFBCK3qPZW9aHg0inTx4cGsPXPXAG3HJDzI6qqRRsk3PqH?=
 =?us-ascii?Q?S9Y6naON//UeAdUfKkjS9o3n7/Frcxnrm5b7/htG/mGQQib13y4ef3KVUF3T?=
 =?us-ascii?Q?6KovCZtEjs4ZPEQJSuK8sZ5oxPLA/HBDaW0L33hQek+lR+g/zMpF0DUxCMwq?=
 =?us-ascii?Q?7dehgPPUHw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c228daca-c4ae-413e-12f9-08df4708467d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:14:57.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFL8UDZwmQn9uuQDgHq/M8N0BWlYyPQJoComSW2tTXeyR5BVbQ02bu5Rlt+lFAfMTS49J3z/n06D/dUlZO9SNQZE2EdmdP/9s9k+YlRt0+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250786
Content-Type: text/plain; charset="utf-8"

NEWS: https://gitlab.gnome.org/GNOME/epiphany/-/blob/51.3/NEWS

51.3 - November 19, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Bugs fixed:
  - #1812 Application mode strips escape characters in urls (depuc8)
  - #2993 Trying to autofill a field without autofill data crashes (Arak)
  - #2996 Client certificate login fails with PIV smart cards: private key =
is
    looked up by the certificate's label, not CKA_ID (Robert Burckner)
  - !2257 Fix crash when loading languages (Aron L.)
  - !2267 bookmarks-dialog: Fix sorting in bookmark list box (Arak)

* Translation updates:
  - Azerbaijani (Nicat Xalid)
  - Basque (Asier Saratsua Garmendia)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../epiphany/{epiphany_51.2.bb =3D> epiphany_51.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.2.bb =3D> epiphany_51.3.bb=
} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.2.bb b/meta/recipes-gn=
ome/epiphany/epiphany_51.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_51.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.3.bb
index 1b79d7a4a54..8b53054568a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.3.bb
@@ -32,7 +32,7 @@ SRC_URI +=3D "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "e45d93483d62beeb26b36b39fe2f8cb5511ffe6ddc=
cc7fedff55b1e3cc0a5c30"
+SRC_URI[archive.sha256sum] =3D "8b8f4603f051c0cbebba3f394e5410d2c9011f80c9=
cda156da40d8029e030964"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disabl=
e-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson=
.build-disable-the-use-of-yelp.patch
index 480d0ac0c03..eb2fc0f9436 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
@@ -1,4 +1,4 @@
-From fe7d60b87a1d42f130047701d55bf4e20715e6dd Mon Sep 17 00:00:00 2001
+From 8936b57b489a0781c4d082239c2757a8f712bbf5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/rec=
ipes-gnome/epiphany/files/distributor.patch
index 0d858fa6376..bbabb91bf02 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From de382c002231a61cb140cdd3e29d6190c853e54f Mon Sep 17 00:00:00 2001
+From 606e8bb97d686f069e722f603f6c5212607cfc85 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
=20
 diff --git a/meson.build b/meson.build
-index 767a34b..d4dccf6 100644
+index 7ad753d..601cfe1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() =3D=3D 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipe=
s-gnome/epiphany/files/migrator.patch
index 22f8755e7ff..908a2dd0c9f 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 3dd7ad6d9540b722716064740d055bd2eb4dce1f Mon Sep 17 00:00:00 2001
+From b65873ff618634fda8701f04e4d74bf35aa70b8b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
