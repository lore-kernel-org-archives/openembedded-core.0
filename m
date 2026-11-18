Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.447.1795018919893809780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 08:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lDNtlhqa;
 spf=pass (domain: est.tech, ip: 52.101.66.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OB4sfdQtejMibggtWINWGuSl/OJ/ZKbkA53zlr9R3IEd1/9weeZX9UbQlCLIpY5On3OrvUUU+3kXaYiUEQZG7kl5CRja8XBhQIYUO/LS6sFbbmTN+ZvD05GoWS4qKMTALnXWVh5kbrhvPmvlpLErfzY4XZNmosW0Jh6tqPtUqYRPySqHDswxTVILwEKhxV7ImUZ93pVoLxQm1FxyBh4l1cGUyZQQ2H4SSWQG2rOmOGSdbrDG0RGCAF9ndXvhNUslx7SJbrOys8tROz5eq1e2jgnensAV6jWB/l39E5r8jbqJ4GU5OOB53uoOoM3zenC1Tdgc8PxuMvnqrzRulLg+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls4lVwM5eiSNDE2c8s6nhuu/c5xiuM8vfR89N/B0EoM=;
 b=Ego1HbZh/kYtZ3FAHkIxE1R7gBve38tF8Esf2TpQbnjnHLKv9Ny8K0BKxX6bSbk3igQaaggbdRZqDbsqt5f8zvBUJD9GJjuXX44cFcJOW9hi6Bj0nucgX+bnakicJO4bYsmqL2KDKZO53Ec2nd1j8Ll30i5pdPdMA618RrU0zoVrZyUvxTbz6VUja9rIjKMRwOZmlhFTXov89rJp2Fh9dF+5FmdmOscvIr5+QPT5v5bLZ7lYeKRXMveL3AzhQSGBewdBbfud8InDnFQEsKhaSPE17olPsTyVImoWTnZA6+eO4jyO5Ki1uTnVkAThOQ5FY/CjF7O+vW6l84zKuiOK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls4lVwM5eiSNDE2c8s6nhuu/c5xiuM8vfR89N/B0EoM=;
 b=lDNtlhqaqC3mbptfXLQ1pHKu3483zK/jtw5opHrBbHdMmLjyMtCwbk02JNcf/f2gp3tzlV122uWmvQwk6FB95DSmLwFt/OMS06YoEJq22zlch9iliLJLz4oCjXBwyoh2zhcKG3+eIxvszvRrqzkypN85rKQSnP/aq8lyuXu43/eKJvztuec2V/Dhic6DJR1fNDXMPlewQKB9NE6brSfGOTIwedRx3EAe0T3qrQ5Eig1E3Zeo4cWZ1MyAL/+wZ78GnF23EZRxELUvpoNSqmu3bV6E3avRk3J6ZKQjFt+54hvhYDNRvrVRVU0UMzVJvCayYGGQFgj6X65GbjFi6CsqJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0935.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:165::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:21:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:21:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 3/3] binutils: Patch for CVE-2026-91782
Date: Wed, 18 Nov 2026 17:21:53 +0100
Message-ID: <20261118162153.25025-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
References: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0935:EE_
X-MS-Office365-Filtering-Correlation-Id: de3fa0fa-0c90-4867-043f-08df45901238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|13003099007|5023799004|260925022911599003|11063799006|260925021911599003|56012099006|10067099003|260925021311599003|261026121527099003|261102123227099003|261026140227099003|261028144727099003|261026135527099003|261026130827099003|261021130227099003|261022075727099003|261021135927099003|261021121427099003|261022115727099003|261022105027099003|261021133027099003|261021123027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: L+Hp0OUawFDPsnG4uxDK39B5/DXHVD5mgq1jKXR2x5bskjWbSZWbykgqmghy+d9cAaw+gcfWkhbCND3FaLef4w/U3fqIaOJgO3qD2TdAo5R/8BA1h/KLXkFx8LZMNCgTx2HAYaKdaa8zwFSDBdZTPLm7R5ZdsQC4zs26A5CxUMqi+d+GatSP5MzEzyRy3mppFkJHmav4rAp0EW3EuYgEzjW+vs7Xw6r2nUlegohpKtEr3zufguMy/uDSdapYQUbQXIMEpq8VqPQqkMtVzwxoeTylmpfcy5ezBic+c+MYIE3gpfSQapVuZkPWAsqpUisQ6nNCNGHteQSF49nMTchtz/6NhAvOozsM4PzOz2d0gi3hGsMlNMLG/iiVqDjZybL462PkVwoh5Mfj/MokIdS5QC4nvM1iIdW9mgqNX6n+OptPZDrnY+LvqYzzx8E2R6qeOGpMr3AAUANZ6VgmmPOgTvPWzt0BHQFA9gild/sPaPNWhuhvO/TuyHyA0Et3Eep8HIrcoe0Ll1C7zGJL4fd/Dnqjvrv5wYqSqW1TYTPFAPL0ATiGvJ4GfCgh4cfjU7Uph+s/rXQ5jFLaKxo5j6nNrEmYXD+ldgmCnt47Drw/Oa7oWbCDSNeaziZJyeV+9fMw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(5023799004)(260925022911599003)(11063799006)(260925021911599003)(56012099006)(10067099003)(260925021311599003)(261026121527099003)(261102123227099003)(261026140227099003)(261028144727099003)(261026135527099003)(261026130827099003)(261021130227099003)(261022075727099003)(261021135927099003)(261021121427099003)(261022115727099003)(261022105027099003)(261021133027099003)(261021123027099003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rGgL9RwsP/DpH1QAWeD7ZvcIRgWdQdsax2Q9mA6CROOoDvT7Lm0A6h5DHijM?=
 =?us-ascii?Q?b9SAmqMcHeELskln/R9S7vKKEI0BbbP89V+6300X6AiVk2iKQvOLLoQcSyx0?=
 =?us-ascii?Q?LytMw0BLdfyH291ZvCzBZRFPge01KOBsZEoBxAvLW3guN4S+hnC2I+tcIbGK?=
 =?us-ascii?Q?9DGN50BS887492YbYgvRzAlEkHnwz7C2sn8AqzLdJkKd7MYvM5qICNOJ37/W?=
 =?us-ascii?Q?3i4FqLPdgB3GyjZ2TteF1NlLVCMsIubxCupgcaMUBv6B66qwZEoiTdVQy25A?=
 =?us-ascii?Q?czqoya+IB4B/Xo05C5tlHyEPvUM45r33AgAlKSf+OANy+ECpXqZjmM1+rCHR?=
 =?us-ascii?Q?cNbiDqd6fDEqRI7BQ4XVbPFHupQsFZdV/LE68/nl2D5E/5XJ2P4OWVSHlJ4s?=
 =?us-ascii?Q?eZKMmSr004QopRAZaCH55R+fQwGUq2AtckQMLf3xh4Ejtc0NDg0Z37TnbFjL?=
 =?us-ascii?Q?wDaRHmf5uQEmcejOLfvr1yI75a7dqeO0abqOfz2hr+S7i74yQCPczqglc1cD?=
 =?us-ascii?Q?/sxQPI2KHaP+SLM+Eu7rkwJ62U7LT5hxQ/LRGrCb1f1mY2LGPXcNhIJH97zJ?=
 =?us-ascii?Q?TRJcx4cxMeJsgycBSbiLoxPuO11EJ4QqQUnDi3CPBfesY4d/tmCGx6vDamtN?=
 =?us-ascii?Q?6xXJDca8z/tVoh8aQow3r0UFvq/uHdWzchorB09u8TqBHSJhLVdlugMPfjtG?=
 =?us-ascii?Q?8muoAY/NSSAqAnPjmNFqkj28GavonT9GplKHAusIfvs3J7JmHFV5/IR8SwY+?=
 =?us-ascii?Q?b62ll2p8qL0oZJA4n7/TwL+gVKSOCzpSqG2ML/thDilTbVBXFCLqe9ZYUo8R?=
 =?us-ascii?Q?A6tvssjGX8fDr25XX58I+PbaKc9F4avXG5abdvu32lseNTz+74hq/vmFOJxW?=
 =?us-ascii?Q?Z9oUS+K7w59DlGWeSj0v3ZtQKFnRpk6Bfp2jUzfKVLuGP2wacIAx+TnTtq0Y?=
 =?us-ascii?Q?yxmU//nWqB7OGnYOhAPjTf/A4/z82sO85LOfthSlb/fQAYzc49CVzyyX2u2/?=
 =?us-ascii?Q?Sh3v4nirb64kGZwMf4moMRRDGqXajYwekXMo0UlMmnFT8SWILOfJ7Xo5Wsv0?=
 =?us-ascii?Q?DPYOeOXLE8RKDW75hnsvXsjr6YorkqahiUc8Q9nBXun6K6MlFYbA9/6bgoSI?=
 =?us-ascii?Q?oRqM84fdYBttqoqB90Hoc4s15SJmEjmhP+80U8yq6Q4RFLeoa7piWR5fJPFB?=
 =?us-ascii?Q?+G2Bg52iJJwZ1G4jlce0VGFh7ZLCFkUK9dGILn/asynNFLiufF/hNfjitIvD?=
 =?us-ascii?Q?TllDWNizrvpHYwf5DSnj+EH1puEgKbeBnO+FRIw4zpC26wjXp7vGkBVG2NES?=
 =?us-ascii?Q?mZMa/3fhzUa62O6VOa9rvoRAaD5uuqopLwR728wqZA9gXX/6YLfGoiJ4ys7q?=
 =?us-ascii?Q?bYeJQ6z6uxt7PF6ossf1idkXMmgvcOuHlcLxRKEjz9uqGjGeqkbEYnHRRGCK?=
 =?us-ascii?Q?sAs40/K3Z4Tec5ByNmO7zZWiGemffs+SGQYPwmPzJgapxYnKltj2PYDU+hZ5?=
 =?us-ascii?Q?XralARw4dB214EiNjgd6fbl8KpehB4m0PphlYxaW4tt4KXLwmI4+tPvQIF4C?=
 =?us-ascii?Q?2m4ZVQGLAmZkHOgMiPp5XaczvDt+o7Pg4CJlnjI3gnYAX2rL5ss2UZ0ifvF2?=
 =?us-ascii?Q?jHFLKE4FE9hV3g9pkENVGffzZZACMMVIu7d/nFWzgCi/rc5EFUTGnwUe2rhR?=
 =?us-ascii?Q?ObM4BxLrIHvhEy8g9/RzAd/iOKYwafLHcKWy2BHePXYgfnh1Mvinc5EBG2yv?=
 =?us-ascii?Q?YDT56wLF2w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de3fa0fa-0c90-4867-043f-08df45901238
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:21:59.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkXtaRWm5rhYFKHVQutDxm/jy9/UJRjXhNIDJQATJ8ejdx3MYt0vnQdSkr8qAvsMxkPO6ccUdxxahxWOvfFLClsOoTesBgSKv2yUO+i0WW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 16:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250573
Content-Type: text/plain; charset="utf-8"

NVD [1] points 5 commits (mentioned below from [2] to [6]) as fix for this =
CVE
[7] is prerequisite for [3]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-91782
[2] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3Dd1268210=
b6f6eddd267a4ebe4b7d36b802af628d
[3] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D471130b3=
9c03623ec6d78ece377ff4da3f6bfe7b
[4] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D283d3198=
beda5110a8417fd09b336a34bbd2705c
[5] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D0a84e560=
2163e9f95a6f137ced28aff0507ce790
[6] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3Da692a633=
d407995a5ce87e84a0b1032e9ac51360
[7] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D6b21c8b2=
ecfef5c95142cbc2c32f185cb1c26ab0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |   6 +
 .../binutils/binutils/CVE-2026-91782-1.patch  |  80 ++++
 .../binutils/CVE-2026-91782-2-pre.patch       | 161 +++++++
 .../binutils/binutils/CVE-2026-91782-2.patch  | 430 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-91782-3.patch  | 132 ++++++
 .../binutils/binutils/CVE-2026-91782-4.patch  |  49 ++
 .../binutils/binutils/CVE-2026-91782-5.patch  |  67 +++
 7 files changed, 925 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
2-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
5.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 93576817f5..65b6964c8d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -87,5 +87,11 @@ SRC_URI =3D "\
      file://CVE-2026-91781.patch \
      file://CVE-2026-90828-pre.patch \
      file://CVE-2026-90828.patch \
+     file://CVE-2026-91782-1.patch \
+     file://CVE-2026-91782-2-pre.patch \
+     file://CVE-2026-91782-2.patch \
+     file://CVE-2026-91782-3.patch \
+     file://CVE-2026-91782-4.patch \
+     file://CVE-2026-91782-5.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch
new file mode 100644
index 0000000000..f325949e81
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch
@@ -0,0 +1,80 @@
+From 07a121a9042c3834e843f2e254178c6f226517bc Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 30 Jul 2026 15:10:36 +0800
+Subject: [PATCH] ld: Don't define section symbols for excluded sections
+
+When the SEC_EXCLUDE bit is set on a section, for example, sections with
+the SHF_EXCLUDE flag bit set in ELF input, the contents of the section
+are excluded by the linker for non-relocatable output.  Define  __start,
+__stop, .startof. and .sizeof. symbols for relocatable link or if the
+SEC_EXCLUDE bit on the section is cleared.
+
+	PR ld/34448
+	* ldlang.c (lang_init_start_stop): Call lang_define_start_stop
+	for relocatable link or if the SEC_EXCLUDE bit on the section
+	is cleared.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91782
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3Dd1268210b6f6eddd267a4ebe4b7d36b802af628d]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ ld/ldlang.c | 39 +++++++++++++++++++++------------------
+ 1 file changed, 21 insertions(+), 18 deletions(-)
+
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 57d9a7772d8..811643284b2 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -6884,28 +6884,31 @@ lang_init_start_stop (void)
+=20
+   for (abfd =3D link_info.input_bfds; abfd !=3D NULL; abfd =3D abfd->link=
.next)
+     for (s =3D abfd->sections; s !=3D NULL; s =3D s->next)
+-      {
+-	const char *ps;
+-	const char *secname =3D s->name;
++      if (bfd_link_relocatable (&link_info)
++	  || (s->flags & SEC_EXCLUDE) =3D=3D 0)
++	{
++	  const char *ps;
++	  const char *secname =3D s->name;
+=20
+-	for (ps =3D secname; *ps !=3D '\0'; ps++)
+-	  if (!ISALNUM ((unsigned char) *ps) && *ps !=3D '_')
+-	    break;
+-	if (*ps =3D=3D '\0')
+-	  {
+-	    char *symbol =3D (char *) xmalloc (10 + strlen (secname));
++	  for (ps =3D secname; *ps !=3D '\0'; ps++)
++	    if (!ISALNUM ((unsigned char) *ps) && *ps !=3D '_')
++	      break;
++	  if (*ps =3D=3D '\0')
++	    {
++	      char *symbol =3D (char *) xmalloc (10 + strlen (secname));
+=20
+-	    symbol[0] =3D leading_char;
+-	    sprintf (symbol + (leading_char !=3D 0), "__start_%s", secname);
+-	    lang_define_start_stop (symbol, s);
++	      symbol[0] =3D leading_char;
++	      sprintf (symbol + (leading_char !=3D 0), "__start_%s",
++		       secname);
++	      lang_define_start_stop (symbol, s);
+=20
+-	    symbol[1] =3D leading_char;
+-	    memcpy (symbol + 1 + (leading_char !=3D 0), "__stop", 6);
+-	    lang_define_start_stop (symbol + 1, s);
++	      symbol[1] =3D leading_char;
++	      memcpy (symbol + 1 + (leading_char !=3D 0), "__stop", 6);
++	      lang_define_start_stop (symbol + 1, s);
+=20
+-	    free (symbol);
+-	  }
+-      }
++	      free (symbol);
++	    }
++	}
+ }
+=20
+ /* Iterate over start_stop_syms.  */
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2-pre.p=
atch b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2-pre.patch
new file mode 100644
index 0000000000..009e2000d7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2-pre.patch
@@ -0,0 +1,161 @@
+From b346d401693c20585ad7c3f11d171ef81040535e Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:18:29 +0800
+Subject: [PATCH] x86: Disallow TLS relocation in non executable section
+
+Since TLS relocations are applied to executable machine instructions,
+disallow TLS relocation in non-SHT_PROGBITS, non-SHF_EXECINSTR section.
+
+	PR ld/33451
+	PR ld/33502
+	* elf32-i386.c (elf_i386_tls_transition): Disallow TLS relocation
+	in non-SHT_PROGBITS, non-SHF_EXECINSTR section.
+	(elf_i386_scan_relocs): Likewise.
+	* elf64-x86-64.c (elf_x86_64_tls_transition): Likewise.
+	(elf_x86_64_scan_relocs): Likewise.
+	* elfxx-x86.c (_bfd_x86_elf_link_report_tls_invalid_section_error):
+	New.
+	* elfxx-x86.h (_bfd_x86_elf_link_report_tls_invalid_section_error):
+	Likewise.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91782
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D6b21c8b2ecfef5c95142cbc2c32f185cb1c26ab0]
+
+Note: Adapted for 2.42: scan_relocs() has no 'howto' local
+(d4d66eb19fd, not in 2.42), compute it from r_type.
+Prerequisite for 471130b39c0.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   | 21 +++++++++++++++++++++
+ bfd/elf64-x86-64.c | 22 ++++++++++++++++++++++
+ bfd/elfxx-x86.c    | 20 ++++++++++++++++++++
+ bfd/elfxx-x86.h    |  3 +++
+ 4 files changed, 66 insertions(+)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index c29b5a18a8c..01218b2c22e 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -1166,6 +1166,15 @@ elf_i386_tls_transition (struct bfd_link_info *info=
, bfd *abfd,
+       return true;
+     }
+=20
++  if ((elf_section_type (sec) !=3D SHT_PROGBITS
++       || (sec->flags & SEC_CODE) =3D=3D 0))
++    {
++      reloc_howto_type *howto =3D elf_i386_rtype_to_howto (from_type);
++      _bfd_x86_elf_link_report_tls_invalid_section_error
++	(abfd, sec, symtab_hdr, h, sym, howto);
++      return false;
++    }
++
+   /* Return TRUE if there is no transition.  */
+   if (from_type =3D=3D to_type)
+     return true;
+@@ -1694,6 +1703,18 @@ elf_i386_scan_relocs (bfd *abfd,
+ 		tls_type =3D GOT_TLS_IE_POS; break;
+ 	      }
+=20
++	    if (tls_type >=3D GOT_TLS_GD
++		&& tls_type <=3D GOT_TLS_GDESC
++		&& (elf_section_type (sec) !=3D SHT_PROGBITS
++		    || (sec->flags & SEC_CODE) =3D=3D 0))
++	      {
++		reloc_howto_type *howto =3D elf_i386_rtype_to_howto (r_type);
++		if (howto !=3D NULL)
++		  _bfd_x86_elf_link_report_tls_invalid_section_error
++		    (abfd, sec, symtab_hdr, h, isym, howto);
++		goto error_return;
++	      }
++
+ 	    if (h !=3D NULL)
+ 	      {
+ 		h->got.refcount =3D 1;
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index b6053450efb..45185cfd8ca 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1541,6 +1541,16 @@ elf_x86_64_tls_transition (struct bfd_link_info *in=
fo, bfd *abfd,
+       return true;
+     }
+=20
++  if ((elf_section_type (sec) !=3D SHT_PROGBITS
++       || (sec->flags & SEC_CODE) =3D=3D 0))
++    {
++      reloc_howto_type *howto =3D elf_x86_64_rtype_to_howto (abfd,
++							   from_type);
++      _bfd_x86_elf_link_report_tls_invalid_section_error
++	(abfd, sec, symtab_hdr, h, sym, howto);
++      return false;
++    }
++
+   /* Return TRUE if there is no transition.  */
+   if (from_type =3D=3D to_type
+       || (from_type =3D=3D R_X86_64_CODE_4_GOTTPOFF
+@@ -2300,6 +2310,18 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_=
info *info,
+ 		break;
+ 	      }
+=20
++	    if (tls_type >=3D GOT_TLS_GD
++		&& tls_type <=3D GOT_TLS_GDESC
++		&& (elf_section_type (sec) !=3D SHT_PROGBITS
++		    || (sec->flags & SEC_CODE) =3D=3D 0))
++	      {
++		reloc_howto_type *howto =3D elf_x86_64_rtype_to_howto (abfd, r_type);
++		if (howto !=3D NULL)
++		  _bfd_x86_elf_link_report_tls_invalid_section_error
++		    (abfd, sec, symtab_hdr, h, isym, howto);
++		goto error_return;
++	      }
++
+ 	    if (h !=3D NULL)
+ 	      {
+ 		h->got.refcount =3D 1;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 8668fd20892..19e5f17b613 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3287,6 +3287,26 @@ _bfd_x86_elf_link_report_tls_transition_error
+   bfd_set_error (bfd_error_bad_value);
+ }
+=20
++/* Report TLS invalid section error.  */
++
++void
++_bfd_x86_elf_link_report_tls_invalid_section_error
++  (bfd *abfd, asection *sec, Elf_Internal_Shdr *symtab_hdr,
++   struct elf_link_hash_entry *h, Elf_Internal_Sym *sym,
++   reloc_howto_type *howto)
++{
++  const char *name;
++  if (h)
++    name =3D h->root.root.string;
++  else
++    name =3D bfd_elf_sym_name (abfd, symtab_hdr, sym, NULL);
++  _bfd_error_handler
++    /* xgettext:c-format */
++    (_("%pB: relocation %s against thread local symbol `%s' in "
++       "invalid section `%pA'"), abfd, howto->name, name, sec);
++  bfd_set_error (bfd_error_bad_value);
++}
++
+ /* Return TRUE if symbol should be hashed in the `.gnu.hash' section.  */
+=20
+ bool
+diff --git a/bfd/elfxx-x86.h b/bfd/elfxx-x86.h
+index 02e2efa6c56..645a87c73d3 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -926,6 +926,9 @@ extern void _bfd_x86_elf_link_report_tls_transition_er=
ror
+    const Elf_Internal_Rela *, const char *, const char *,
+    enum elf_x86_tls_error_type);
+=20
++extern void _bfd_x86_elf_link_report_tls_invalid_section_error
++  (bfd *, asection *, Elf_Internal_Shdr *, struct elf_link_hash_entry *,
++   Elf_Internal_Sym *, reloc_howto_type *);
+=20
+ #define bfd_elf64_mkobject \
+   _bfd_x86_elf_mkobject
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch
new file mode 100644
index 0000000000..f4d3f56dbd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch
@@ -0,0 +1,430 @@
+From 714f3e00556582ca3c4e1c4c09d1d162b8041983 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 30 Jul 2026 13:43:56 +0800
+Subject: [PATCH] x86: Check invalid GOT/PLT/TLS relocations
+
+1. Since non-alloc sections aren't checked for TLS, GOT and PLT usages,
+relocate_section should issue error for TLS, GOT and PLT relocations in
+non-alloc and non-debugging sections.
+2. Since TLS relocations must be against thread local symbols, scan_relocs
+should issue an error for TLS relocation against non-thread local symbol.
+
+	PR ld/34444
+	PR ld/34448
+	* elf32-i386.c (elf_i386_tls_transition): Replace
+	_bfd_x86_elf_link_report_tls_invalid_section_error with
+	_bfd_x86_elf_link_report_error.
+	(elf_i386_scan_relocs): Issue an error for TLS relocation against
+	non-thread local symbol.
+	(elf_i386_relocate_section): Issue error for TLS, GOT and PLT
+	relocations in non-alloc and non-debugging sections.
+	* elf64-x86-64.c (elf_x86_64_tls_transition): Replace
+	_bfd_x86_elf_link_report_tls_invalid_section_error with
+	_bfd_x86_elf_link_report_error.
+	(elf_x86_64_scan_relocs): Issue an error for TLS relocation
+	against non-thread local symbol.
+	* elfxx-x86.c (_bfd_x86_elf_link_report_tls_invalid_section_error):
+	Renamed to ...
+	(_bfd_x86_elf_link_report_error): This.  Add an argument for
+	link error type and handle it.
+	* elfxx-x86.h (elf_x86_error_type): New enum.
+	(_bfd_x86_elf_link_report_tls_invalid_section_error): Renamed
+	to ...
+	(_bfd_x86_elf_link_report_error): This.  Add an argument of
+	enum elf_x86_error_type.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91782
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D471130b39c03623ec6d78ece377ff4da3f6bfe7b]
+
+Note: Adapted for 2.42: no 'howto' local in scan_relocs(), see
+previous patch. Drop ATTRIBUTE_HIDDEN (603bc397919, not in 2.42).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   | 50 ++++++++++++++++++++++++++++++++++++++-----
+ bfd/elf64-x86-64.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
+ bfd/elfxx-x86.c    | 53 ++++++++++++++++++++++++++++++++++++++--------
+ bfd/elfxx-x86.h    | 10 +++++++--
+ 4 files changed, 145 insertions(+), 21 deletions(-)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 01218b2c22e..36554e16e4e 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -1170,8 +1170,8 @@ elf_i386_tls_transition (struct bfd_link_info *info,=
 bfd *abfd,
+        || (sec->flags & SEC_CODE) =3D=3D 0))
+     {
+       reloc_howto_type *howto =3D elf_i386_rtype_to_howto (from_type);
+-      _bfd_x86_elf_link_report_tls_invalid_section_error
+-	(abfd, sec, symtab_hdr, h, sym, howto);
++      _bfd_x86_elf_link_report_error (abfd, sec, symtab_hdr, h, sym,
++				      howto, elf_x86_error_tls);
+       return false;
+     }
+=20
+@@ -1705,13 +1705,17 @@ elf_i386_scan_relocs (bfd *abfd,
+=20
+ 	    if (tls_type >=3D GOT_TLS_GD
+ 		&& tls_type <=3D GOT_TLS_GDESC
+-		&& (elf_section_type (sec) !=3D SHT_PROGBITS
++		&& ((h !=3D NULL
++		     ? h->type !=3D STT_TLS
++		     : ELF_ST_TYPE (isym->st_info) !=3D STT_TLS)
++		    || elf_section_type (sec) !=3D SHT_PROGBITS
+ 		    || (sec->flags & SEC_CODE) =3D=3D 0))
+ 	      {
+ 		reloc_howto_type *howto =3D elf_i386_rtype_to_howto (r_type);
+ 		if (howto !=3D NULL)
+-		  _bfd_x86_elf_link_report_tls_invalid_section_error
+-		    (abfd, sec, symtab_hdr, h, isym, howto);
++		  _bfd_x86_elf_link_report_error
++		    (abfd, sec, symtab_hdr, h, isym, howto,
++		     elf_x86_error_tls);
+ 		goto error_return;
+ 	      }
+=20
+@@ -2545,6 +2549,18 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	{
+ 	case R_386_GOT32X:
+ 	case R_386_GOT32:
++	  /* Since we don't allow non-alloced sections to create GOT/PLT
++	     entries, issue an error if a non-alloced section references
++	     GOT.  */
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    {
++  non_alloc_error:
++	      _bfd_x86_elf_link_report_error (input_bfd, input_section,
++					      symtab_hdr, h, sym, howto,
++					      elf_x86_error_non_alloc);
++	      return false;
++	    }
++
+ 	  /* Relocation is to the entry for this symbol in the global
+ 	     offset table.  */
+ 	  if (htab->elf.sgot =3D=3D NULL)
+@@ -2677,6 +2693,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_GOTOFF:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is relative to the start of the global offset
+ 	     table.  */
+=20
+@@ -2741,6 +2760,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_GOTPC:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Use global offset table as symbol value.  */
+ 	  relocation =3D htab->elf.sgotplt->output_section->vma
+ 		       + htab->elf.sgotplt->output_offset;
+@@ -2748,6 +2770,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_PLT32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is to the entry for this symbol in the
+ 	     procedure linkage table.  */
+=20
+@@ -2875,6 +2900,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_TLS_IE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info))
+ 	    {
+ 	      Elf_Internal_Rela outrel;
+@@ -2902,6 +2930,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	case R_386_TLS_DESC_CALL:
+ 	case R_386_TLS_IE_32:
+ 	case R_386_TLS_GOTIE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  tls_type =3D GOT_UNKNOWN;
+ 	  if (h =3D=3D NULL && local_got_offsets)
+ 	    tls_type =3D elf_x86_local_got_tls_type (input_bfd) [r_symndx];
+@@ -3401,6 +3432,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_TLS_LDM:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (! elf_i386_tls_transition (info, input_bfd,
+ 					 input_section, contents,
+ 					 symtab_hdr, sym_hashes,
+@@ -3473,6 +3507,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_TLS_LDO_32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info)
+ 	      || (input_section->flags & SEC_CODE) =3D=3D 0)
+ 	    relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+@@ -3483,6 +3520,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+=20
+ 	case R_386_TLS_LE_32:
+ 	case R_386_TLS_LE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info))
+ 	    {
+ 	      Elf_Internal_Rela outrel;
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 45185cfd8ca..b691db23540 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1546,8 +1546,8 @@ elf_x86_64_tls_transition (struct bfd_link_info *inf=
o, bfd *abfd,
+     {
+       reloc_howto_type *howto =3D elf_x86_64_rtype_to_howto (abfd,
+ 							   from_type);
+-      _bfd_x86_elf_link_report_tls_invalid_section_error
+-	(abfd, sec, symtab_hdr, h, sym, howto);
++      _bfd_x86_elf_link_report_error (abfd, sec, symtab_hdr, h,
++				      sym, howto, elf_x86_error_tls);
+       return false;
+     }
+=20
+@@ -2312,13 +2312,17 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link=
_info *info,
+=20
+ 	    if (tls_type >=3D GOT_TLS_GD
+ 		&& tls_type <=3D GOT_TLS_GDESC
+-		&& (elf_section_type (sec) !=3D SHT_PROGBITS
++		&& ((h !=3D NULL
++		     ? h->type !=3D STT_TLS
++		     : ELF_ST_TYPE (isym->st_info) !=3D STT_TLS)
++		    || elf_section_type (sec) !=3D SHT_PROGBITS
+ 		    || (sec->flags & SEC_CODE) =3D=3D 0))
+ 	      {
+ 		reloc_howto_type *howto =3D elf_x86_64_rtype_to_howto (abfd, r_type);
+ 		if (howto !=3D NULL)
+-		  _bfd_x86_elf_link_report_tls_invalid_section_error
+-		    (abfd, sec, symtab_hdr, h, isym, howto);
++		  _bfd_x86_elf_link_report_error
++		    (abfd, sec, symtab_hdr, h, isym, howto,
++		     elf_x86_error_tls);
+ 		goto error_return;
+ 	      }
+=20
+@@ -3140,6 +3144,18 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	case R_X86_64_GOTPCREL64:
+ 	  /* Use global offset table entry as symbol value.  */
+ 	case R_X86_64_GOTPLT64:
++	  /* Since we don't allow non-alloced sections to create GOT/PLT
++	     entries, issue an error if a non-alloced section references
++	     GOT.  */
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    {
++  non_alloc_error:
++	      _bfd_x86_elf_link_report_error (input_bfd, input_section,
++					      symtab_hdr, h, sym, howto,
++					      elf_x86_error_non_alloc);
++	      return false;
++	    }
++
+ 	  /* This is obsolete and treated the same as GOT64.  */
+ 	  base_got =3D htab->elf.sgot;
+=20
+@@ -3274,6 +3290,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_GOTOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is relative to the start of the global offset
+ 	     table.  */
+=20
+@@ -3340,6 +3359,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+=20
+ 	case R_X86_64_GOTPC32:
+ 	case R_X86_64_GOTPC64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Use global offset table as symbol value.  */
+ 	  relocation =3D htab->elf.sgotplt->output_section->vma
+ 		       + htab->elf.sgotplt->output_offset;
+@@ -3347,6 +3369,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_PLTOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is PLT entry relative to GOT.  For local
+ 	     symbols it's the symbol itself relative to GOT.  */
+ 	  if (h !=3D NULL
+@@ -3383,6 +3408,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_PLT32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is to the entry for this symbol in the
+ 	     procedure linkage table.  */
+=20
+@@ -3690,6 +3718,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	case R_X86_64_GOTTPOFF:
+ 	case R_X86_64_CODE_4_GOTTPOFF:
+ 	case R_X86_64_CODE_6_GOTTPOFF:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  tls_type =3D GOT_UNKNOWN;
+ 	  if (h =3D=3D NULL && local_got_offsets)
+ 	    tls_type =3D elf_x86_local_got_tls_type (input_bfd) [r_symndx];
+@@ -4357,6 +4388,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_TLSLD:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (! elf_x86_64_tls_transition (info, input_bfd,
+ 					   input_section, contents,
+ 					   symtab_hdr, sym_hashes,
+@@ -4486,6 +4520,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_DTPOFF32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info)
+ 	      || (input_section->flags & SEC_CODE) =3D=3D 0)
+ 	    relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+@@ -4495,11 +4532,17 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+=20
+ 	case R_X86_64_TPOFF32:
+ 	case R_X86_64_TPOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  BFD_ASSERT (bfd_link_executable (info));
+ 	  relocation =3D elf_x86_64_tpoff (info, relocation);
+ 	  break;
+=20
+ 	case R_X86_64_DTPOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  BFD_ASSERT ((input_section->flags & SEC_CODE) =3D=3D 0);
+ 	  relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+ 	  break;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 19e5f17b613..204806c7566 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3287,23 +3287,58 @@ _bfd_x86_elf_link_report_tls_transition_error
+   bfd_set_error (bfd_error_bad_value);
+ }
+=20
+-/* Report TLS invalid section error.  */
++/* Report link error.  */
+=20
+ void
+-_bfd_x86_elf_link_report_tls_invalid_section_error
++_bfd_x86_elf_link_report_error
+   (bfd *abfd, asection *sec, Elf_Internal_Shdr *symtab_hdr,
+    struct elf_link_hash_entry *h, Elf_Internal_Sym *sym,
+-   reloc_howto_type *howto)
++   reloc_howto_type *howto, enum elf_x86_error_type type)
+ {
+   const char *name;
++  bool non_thread_local;
+   if (h)
+-    name =3D h->root.root.string;
++    {
++      non_thread_local =3D h->type !=3D STT_TLS;
++      name =3D h->root.root.string;
++    }
+   else
+-    name =3D bfd_elf_sym_name (abfd, symtab_hdr, sym, NULL);
+-  _bfd_error_handler
+-    /* xgettext:c-format */
+-    (_("%pB: relocation %s against thread local symbol `%s' in "
+-       "invalid section `%pA'"), abfd, howto->name, name, sec);
++    {
++      non_thread_local =3D ELF_ST_TYPE (sym->st_info) !=3D STT_TLS;
++      name =3D bfd_elf_sym_name (abfd, symtab_hdr, sym, NULL);
++      if (name[0] =3D=3D '\0')
++	name =3D "*unknown*";
++    }
++
++  switch (type)
++    {
++    case elf_x86_error_tls:
++      if (non_thread_local)
++	_bfd_error_handler
++	  /* xgettext:c-format */
++	  (_("%pB: relocation %s against non-thread local symbol "
++	     "`%s' in section `%pA'"),
++	   abfd, howto->name, name, sec);
++      else
++	_bfd_error_handler
++	  /* xgettext:c-format */
++	  (_("%pB: relocation %s against thread local symbol `%s' in "
++	     "invalid section `%pA'"), abfd, howto->name, name, sec);
++      break;
++
++    case elf_x86_error_non_alloc:
++      _bfd_error_handler
++	/* xgettext:c-format */
++	(_("%pB: relocation %s against symbol `%s' in non-alloc "
++	   "section `%pA'"),
++	 abfd, howto->name, name, sec);
++      break;
++
++    default:
++      abort ();
++      break;
++    }
++
+   bfd_set_error (bfd_error_bad_value);
+ }
+=20
+diff --git a/bfd/elfxx-x86.h b/bfd/elfxx-x86.h
+index 645a87c73d3..3d063699dda 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -778,6 +778,11 @@ enum elf_x86_tls_error_type
+   elf_x86_tls_error_yes
+ };
+=20
++enum elf_x86_error_type
++{
++  elf_x86_error_tls,
++  elf_x86_error_non_alloc
++};
+=20
+ /* Set if a relocation is converted from a GOTPCREL relocation.  */
+ #define R_X86_64_converted_reloc_bit (1 << 7)
+@@ -926,9 +931,10 @@ extern void _bfd_x86_elf_link_report_tls_transition_e=
rror
+    const Elf_Internal_Rela *, const char *, const char *,
+    enum elf_x86_tls_error_type);
+=20
+-extern void _bfd_x86_elf_link_report_tls_invalid_section_error
++extern void _bfd_x86_elf_link_report_error
+   (bfd *, asection *, Elf_Internal_Shdr *, struct elf_link_hash_entry *,
+-   Elf_Internal_Sym *, reloc_howto_type *);
++   Elf_Internal_Sym *, reloc_howto_type *,
++   enum elf_x86_error_type);
+=20
+ #define bfd_elf64_mkobject \
+   _bfd_x86_elf_mkobject
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch
new file mode 100644
index 0000000000..11329850ec
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch
@@ -0,0 +1,132 @@
+From 43345fbe3a861d75a33f087582506b10f6f5d672 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Fri, 31 Jul 2026 05:47:15 +0800
+Subject: [PATCH] x86: Improve relocation error reporting
+
+For bfd_reloc_outofrange relocation error, instead of
+
+ld: pr34448-bug_4.o(.debug_addr+0x7f000008): reloc against `.text.get_tls'=
: error 4
+
+linker now reports:
+
+ld: pr34448-bug_4.o(.debug_addr+0x7f000008): relocation `R_X86_64_64' agai=
nst `.text.get_tls': out of section range
+
+	PR ld/34448
+	* elf32-i386.c (elf_i386_relocate_section): Call
+	_bfd_x86_elf_link_report_relocation_error for relocation error.
+	* elf64-x86-64.c (elf_x86_64_relocate_section): Likewise.
+	* elfxx-x86.c (_bfd_x86_elf_link_report_relocation_error): New.
+	* elfxx-x86.h (_bfd_x86_elf_link_report_relocation_error): New.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91782
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D283d3198beda5110a8417fd09b336a34bbd2705c]
+
+Note: Adapted for 2.42: drop ATTRIBUTE_HIDDEN (801977ce479, not in 2.42).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   |  9 ++++-----
+ bfd/elf64-x86-64.c |  9 ++++-----
+ bfd/elfxx-x86.c    | 31 +++++++++++++++++++++++++++++++
+ bfd/elfxx-x86.h    |  4 ++++
+ 4 files changed, 43 insertions(+), 10 deletions(-)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 36554e16e4e..99769141685 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -3609,11 +3609,10 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	       (bfd_vma) 0, input_bfd, input_section, rel->r_offset);
+ 	  else
+ 	    {
+-	      _bfd_error_handler
+-		/* xgettext:c-format */
+-		(_("%pB(%pA+%#" PRIx64 "): reloc against `%s': error %d"),
+-		 input_bfd, input_section,
+-		 (uint64_t) rel->r_offset, name, (int) r);
++	      _bfd_x86_elf_link_report_relocation_error (input_bfd,
++							 input_section,
++							 name, rel,
++							 howto, r);
+ 	      return false;
+ 	    }
+ 	}
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index b691db23540..66d0b3c80b2 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -4626,11 +4626,10 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	    }
+ 	  else
+ 	    {
+-	      _bfd_error_handler
+-		/* xgettext:c-format */
+-		(_("%pB(%pA+%#" PRIx64 "): reloc against `%s': error %d"),
+-		 input_bfd, input_section,
+-		 (uint64_t) rel->r_offset, name, (int) r);
++	      _bfd_x86_elf_link_report_relocation_error (input_bfd,
++							 input_section,
++							 name, rel,
++							 howto, r);
+ 	      return false;
+ 	    }
+ 	}
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 204806c7566..5267f62f043 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3342,6 +3342,37 @@ _bfd_x86_elf_link_report_error
+   bfd_set_error (bfd_error_bad_value);
+ }
+=20
++/* Report link relocation error.  */
++
++void
++_bfd_x86_elf_link_report_relocation_error (bfd *abfd, asection *sec,
++					   const char *name,
++					   Elf_Internal_Rela *rel,
++					   reloc_howto_type *howto,
++					   bfd_reloc_status_type status)
++{
++  const char *error_msg;
++
++  switch (status)
++    {
++    case bfd_reloc_outofrange:
++      error_msg =3D _("out of section range");
++      break;
++
++    case bfd_reloc_notsupported:
++      error_msg =3D _("not supported");
++      break;
++
++    default:
++      abort ();
++    }
++
++  _bfd_error_handler
++    /* xgettext:c-format */
++    (_("%pB(%pA+%#" PRIx64 "): relocation `%s' against `%s': %s"),
++     abfd, sec, (uint64_t) rel->r_offset, howto->name, name, error_msg);
++}
++
+ /* Return TRUE if symbol should be hashed in the `.gnu.hash' section.  */
+=20
+ bool
+diff --git a/bfd/elfxx-x86.h b/bfd/elfxx-x86.h
+index 3d063699dda..015d9082dec 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -936,6 +936,10 @@ extern void _bfd_x86_elf_link_report_error
+    Elf_Internal_Sym *, reloc_howto_type *,
+    enum elf_x86_error_type);
+=20
++extern void _bfd_x86_elf_link_report_relocation_error
++  (bfd *, asection *, const char *, Elf_Internal_Rela *,
++   reloc_howto_type *, bfd_reloc_status_type);
++
+ #define bfd_elf64_mkobject \
+   _bfd_x86_elf_mkobject
+ #define bfd_elf32_mkobject \
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch
new file mode 100644
index 0000000000..e00eed5b19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch
@@ -0,0 +1,49 @@
+From 464538ceded7928364d57fbd08548ced37ce39f2 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 1 Aug 2026 11:23:39 +0800
+Subject: [PATCH] x86: Check if needed dynamic relocation section is create=
d
+
+Since elf_link_read_relocs_from_section aborts for bad relocation,
+further relocations won't be processed and needed dynamic relocation
+section won't be created.  Skip dynamic relocation count if needed
+dynamic relocation section hasn't been created.
+
+	PR ld/34448
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Skip dynamic
+	relocation count if needed dynamic relocation section hasn't been
+	created.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91782
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D0a84e5602163e9f95a6f137ced28aff0507ce790]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elfxx-x86.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 5267f62f043..fed0629c00c 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2295,6 +2295,19 @@ _bfd_x86_elf_size_dynamic_sections (bfd *output_bfd=
,
+ 	      else if (p->count !=3D 0)
+ 		{
+ 		  srel =3D elf_section_data (p->sec)->sreloc;
++		  if (!srel)
++		    {
++		      /* NB: Since elf_link_read_relocs_from_section
++			 aborts for bad relocation, further relocations
++			 won't be processed and needed dynamic relocation
++			 section won't be created afterwards.  */
++		      _bfd_error_handler
++			/* xgettext:c-format */
++			(_("%pB: dynamic relocation section is needed "
++			   "for section `%pA'"),
++			 p->sec->owner, p->sec);
++		      continue;
++		    }
+ 		  srel->size +=3D p->count * htab->sizeof_reloc;
+ 		  if ((p->sec->output_section->flags & SEC_READONLY) !=3D 0
+ 		      && (info->flags & DF_TEXTREL) =3D=3D 0)
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-5.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-5.patch
new file mode 100644
index 0000000000..cc6dc8e156
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-5.patch
@@ -0,0 +1,67 @@
+From ca494443ce0a4844f3acb18fba9623dda34a516e Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Wed, 5 Aug 2026 16:43:05 +0800
+Subject: [PATCH] ld: Check input section garbage collection error
+
+The ELF backend gc_mark_extra_sections function may return false for
+error and bfd_gc_sections may return false on invalid input:
+
+ld: pr34448-bug_18.o: bad reloc symbol index (0xf2000005 >=3D 0x13) for of=
fset 0x4 in section `.text.get_tls[get_tls]'
+
+Change bfd_elf_gc_sections to return false if gc_mark_extra_sections
+return false.  Change lang_gc_sections to check bfd_gc_sections return
+and report the fatal error.
+
+bfd/
+	PR ld/34448
+	* elflink.c (bfd_elf_gc_sections): Return false if
+	gc_mark_extra_sections return false.
+
+ld/
+	PR ld/34448
+	* ldlang.c (lang_gc_sections): Check bfd_gc_sections return and
+	report the fatal error.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91782
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3Da692a633d407995a5ce87e84a0b1032e9ac51360]
+
+Note: Adapted for 2.42: bed instead of obed (51211b2bfbe, not in 2.42).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elflink.c | 3 ++-
+ ld/ldlang.c   | 5 +++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index d393821b772..f25b7f9a98d 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14540,7 +14540,8 @@ bfd_elf_gc_sections (bfd *abfd, struct bfd_link_in=
fo *info)
+     }
+=20
+   /* Allow the backend to mark additional target specific sections.  */
+-  bed->gc_mark_extra_sections (info, gc_mark_hook);
++  if (!bed->gc_mark_extra_sections (info, gc_mark_hook))
++    return false;
+=20
+   /* ... and mark SEC_EXCLUDE for those that go.  */
+   return elf_gc_sweep (abfd, info);
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 811643284b2..8a35ff3e446 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -7751,8 +7751,9 @@ lang_gc_sections (void)
+ 	}
+     }
+=20
+-  if (link_info.gc_sections)
+-    bfd_gc_sections (link_info.output_bfd, &link_info);
++  if (link_info.gc_sections
++      && !bfd_gc_sections (link_info.output_bfd, &link_info))
++    fatal (_("%P: --gc-sections failed: %E\n"));
+ }
+=20
+ /* Worker for lang_find_relro_sections_1.  */
