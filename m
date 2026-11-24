Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19054.1795531218039474643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 06:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KxLs8UOt;
 spf=pass (domain: est.tech, ip: 52.101.84.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slcb0JLAXbGPydhJHDOIrFfuFZNaPs+teqoyJLea7OSFifjzcJliawxJS6XFIEMh79yu5pNzEFNBV3fVlIXFjX8Xxeu3UPZdjHTdXMpYzCfj/LlI2ESDdN85XJBnzmP6lrQTTYZaSVco1STZkv/k4yf1RnblS7V9XCW2qGtjnDfy3W4DZ3iwotbi7lD6omXiiyYBJUQCm6rGbclMG2mL65EMZQobwGkBPwb8NFZJRUEiQuT6uhbCxlYd+y9Y8uOGnSbnXibfCr930IZ17zp6ghwMgtuibmFn9X8Qlkd8olM3uHuhCD8n6Y13fTAmKhkc7SFGOonv5sd9wMlDl8MzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEOqt4GFtYzyhq+/40Tj5gdUvV6/7iaWxzaO5u2mEYQ=;
 b=RYPLytZ9U/e9oLthcqM8Kzd8PpojJBjYNqGUZcVbVoLSvR+kCjEc/H7YBXOGLaiJkYXGOR23A2Z9tkybkU9BTXye7/8nWHVtPMOBk7NxWiXsmScm3fTIjrU6pwVFsyjbj3/W/LqH4dzNBFRhbXTP7slXjHnkcCXl+8m7nJ4Rpp/uNXffOMOaLtN3bptMNuQ02hqeXVva+HRJgwqjA/3gULkOHX1XcocFqak5Mlmn2gNnYdc9G8Xlqa1lJR6m3EbYUWHvAtOTZ1GZSG/kROhcPnf8VF9JEgH1/PFFWHKILoD/C8GtR5XK2tfigM55WXSA3k/q88grPtpfVv+yz2EKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEOqt4GFtYzyhq+/40Tj5gdUvV6/7iaWxzaO5u2mEYQ=;
 b=KxLs8UOtz7yEQ96QjIBaaPQw8zqMFLGk6fexjh5AuoxagO+4XNXNTuUoIf1G2I0RddyrYxG1O8stO90HbyDijPLl7FtZsFFkYaYkYqSsCCdzQ7XJkB8FygQLal118ZJtv9DVCS1g2G2wTMwq4AIND3OVxhfsdQiNdgvZiMBeMYrORkhp+GvkXBvCi93FIswT6M7gBVTvUjDZv5RT4ssqBvSnHn3SPfby7dY+//BNOREr7gypQrAdkjNVBKug4JqFMlN3vF4rZf2RGqkX2YA8vkQ/XGrdQbOdJx9OyuF9qquBUwYFhcm8wD7pFk3BRDrAzuVRH9a/b1M8UWH/YApxlw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB2651.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:24c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:40:18 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:40:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [blacksail][PATCH 3/3] binutils: Patch for CVE-2026-91782
Date: Tue, 24 Nov 2026 15:40:10 +0100
Message-ID: <20261124144010.72865-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
References: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0423.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB2651:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d548cc-75ce-4001-3e25-08df4a38dbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|10067099003|261021123027099003|261026130827099003|261009223027099003|260925021911599003|11063799006|5023799004|56012099006|260925021311599003|260925022911599003|261026135527099003|261021130227099003|261021135927099003|261021133027099003|261022113327099003|261021121427099003|261022075727099003|261022115727099003|261028144727099003|261102123227099003|261022105027099003|261026121527099003|261026140227099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: FY2gF6h2iYHj5dtH/J3qll/20ioep95d37Ve+os8AY3GZa/5/YCUSelD2ttw2KKU2UaUJwqvc1ZEatH1fTUAOVP3S3L2MeLJEQOBcDuu9X4n5HyP91e3Xj/eaDBtji4KzoOhi4b/c4vSfKkmPF/caE004rVmQ6y5S9/pM/Zl3NBaEKpLpiyrSlJDdDaNmGUdwV48MQAwE3wgf+sU5g0Y4r9mo7eUxR3nMYClBZgH9opuTMx6EFiVXKrk3ze7AI8GYFq6UCSjy8dJBsCAisbdMI6J/+FX0A4btNnHJiloH/pQHPVejwccy/oBXZJqRQHvsmEWFoLI0ZdsodWcfMdgx62kzEh4BWyKPXlgT30eTlOD/8vjPljXoF9KolZbhiaBjYMXbUQWovCVcNT+6nTzK8mkoej/BI0PZBcmRNoQeW45zOoY3Y6fwTs18AkT98E3TKN0/vPKDChe0urKVUAGQvIh0+FkC9xyIovaEYd/v6YSUHXujS1JyIu5+WGaSARgI/eo3nRH8tCOD5BkR8FCQ8ehTbaCoZPI82XGmykjrqe8TnDvEQR860X42gRSJJWGaNnI6a1O0YhSjS1LH6FFbkC6yaOrnqMYfGh3o7Wk0C0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(261021123027099003)(261026130827099003)(261009223027099003)(260925021911599003)(11063799006)(5023799004)(56012099006)(260925021311599003)(260925022911599003)(261026135527099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022113327099003)(261021121427099003)(261022075727099003)(261022115727099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ffto8/8Ax27W1RIiS/oWUJcHqomnX5P09Z2NMHMnPJ+1hxvgOf51vpOcqRpx?=
 =?us-ascii?Q?92ipyqI8hvBPUAALfzaQK2dQK6qlfNl3DicpsXS1Wuml8IywHz5UbikeFtg5?=
 =?us-ascii?Q?zA8bz4SOpLB6LmXWl41/f5lQVVi9K8phPswVuh0Rm4GIYtK8EnI/qRQq+tMC?=
 =?us-ascii?Q?MOWiDI21zTj/nY0wIq0Ny4HYuGDzIYVZyGlYUkdcAd6NtGjnVzLlVxY7UVho?=
 =?us-ascii?Q?HGoYFcDIOfaR5jbb8csgax6DMVmDu8jol4OKNP/oWtTZdW1mCUumObPoiqre?=
 =?us-ascii?Q?FY+JWwPABy5bOXszQXw60/bx8YjGkLYk1LCK9vqz+Es0rOMwZ8yoMEyP9KgW?=
 =?us-ascii?Q?fL/p/c3at+G+dXmMYhYDY6IC2zed38kysQguamdKaO4GeEHwocUPudjsPv+D?=
 =?us-ascii?Q?W15ob3jWLDXTwRz016cPJyKdPAMH4qm36sfKhAzpjIKcWk5VepwOlY8A6Bki?=
 =?us-ascii?Q?Nj7Cwr1LSpHgX/5RQ8i4TcjEst6wgUZ4x52zR2250jcyqo/3/SL8hwrQNrq4?=
 =?us-ascii?Q?cdo65mAjkyVIMGswqosJMS/cjZKfmtcwxZysTRxj+SxETuu1W5wi/NodTBqN?=
 =?us-ascii?Q?+Do5ES2WMyKuyj/eHBBrSMdtgpfY0OO1DvbU6c/wjx12OCMAD9Vr3R27D1Td?=
 =?us-ascii?Q?C10e0zkFeJDIaNXRw9HJmqB8mQVoFvU6ySH1bFDxB455AhVwHFcT+Mbhj0ka?=
 =?us-ascii?Q?ZrkppCXO8EMb5xm41qSB4iqw1SF58wwVWet2KbwMyx2uGUhdjEhRhcpXfJ8+?=
 =?us-ascii?Q?NlEFeaXDE6+cUFZqfce0mxyXuRyLbnBUWGaB//WThr8Pgruo9hWRkpREpgyO?=
 =?us-ascii?Q?oHrGz01h2faBu4PUe+3GrqQ2Wz3LYXOXiFH5h93plFTNvN8RGeIOYZRoww0w?=
 =?us-ascii?Q?9+zHervXj1/byNv7aXE8GbaktFrsD16K8RSP29CFsZxtm3deRMSk6rpbKwHU?=
 =?us-ascii?Q?eNpn/bVzMPrUXoTkTPd2w2/t7AYQ2JsmOzHPkua9JZGRVSSUxYMv3o/NHLkb?=
 =?us-ascii?Q?tcjkcJUtyXwdi6YeoYjQmZcr130KPEuBfaRA0rPW1mvEnABsajyGKIHnik9b?=
 =?us-ascii?Q?+wcT/K6mYK3Qy8kypcN/vI3UmY99cBlfogk8VZpfIBd/ffgyXag4fZhy6+Sq?=
 =?us-ascii?Q?mA8xEdQhrHuFsaAzZ67Lc4XUfbbYy1gbE6OMYwYkDoELc+5iXklFzsLu/B3M?=
 =?us-ascii?Q?B51Ocnw2iR5fdv4LAi3Xw/C6uea2NnRopkxUPRCEcvTlzn6XK80c7A3D1lhk?=
 =?us-ascii?Q?BgwZgvFPtgWQCDHVnjXsxHFyub2ikqpc0+1LrUd3b20jaXZRtM3SkMmZBp/R?=
 =?us-ascii?Q?ppmKvmPTD3kVXi8Qt1iONZNoZlefzGCeCe3iYKcUu51N8B3RTC6UQVFVF1k8?=
 =?us-ascii?Q?cF7zRBzC8qC+ZZrYGWw43LACFQqb5uPzpr3Kx2Dwh4y6byE7ttMwTlOrISPH?=
 =?us-ascii?Q?fhEuazEBDBQF9nRixIIZeaVmqCXR7HkAnWUo77PF+ygY4FEZeLsRYweOgVM/?=
 =?us-ascii?Q?few2dYUAtQtETADdorbJUDqlsR7HrFWSnRDJIPLHAiDNl29Iu6DB0lELTJcI?=
 =?us-ascii?Q?1CtQwF4tnJ2BIJrb6L+4OVzQTUEaBpRMa2rgmtuOyOlVH3n4SPkZu4epWTsF?=
 =?us-ascii?Q?Wm5eC1irFIwv5DugVrwOnwIrRrV+IDZq6jQ60eYdBF0xUsfozU/d4W6Yddjd?=
 =?us-ascii?Q?JDtVq+BABiUOXsOGkjK2wFXvv0YFYCeMSeYW/m90f5CekqXi4fMA/ymlk88i?=
 =?us-ascii?Q?pEBnpf1SzA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d548cc-75ce-4001-3e25-08df4a38dbc9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:40:17.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phgsf/Z7smKtwCVfFdC4WtOxtRc+tm/MmAbyICjPat2+FFrdT6IL1dM0Ocau3W+ZBM/YiEefEhhKLLkhb7hOfh4iXxkA/V1uxJjXu4VhNDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251038
Content-Type: text/plain; charset="utf-8"

NVD [1] points 5 commits (mentioned below from [2] to [6]) as fix for this =
CVE

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

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e09eeaf32832c1c9dbe3599a793ba2da28eba6b5)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.47.inc                |   5 +
 .../binutils/binutils/CVE-2026-91782-1.patch  |  80 ++++
 .../binutils/binutils/CVE-2026-91782-2.patch  | 424 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-91782-3.patch  | 130 ++++++
 .../binutils/binutils/CVE-2026-91782-4.patch  |  50 +++
 .../binutils/binutils/CVE-2026-91782-5.patch  |  65 +++
 6 files changed, 754 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
5.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipe=
s-devtools/binutils/binutils-2.47.inc
index 2807ab84e8..9b91680cbd 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -40,4 +40,9 @@ SRC_URI =3D "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
      file://CVE-2026-91781.patch \
      file://CVE-2026-90828.patch \
+     file://CVE-2026-91782-1.patch \
+     file://CVE-2026-91782-2.patch \
+     file://CVE-2026-91782-3.patch \
+     file://CVE-2026-91782-4.patch \
+     file://CVE-2026-91782-5.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch
new file mode 100644
index 0000000000..0572c727a1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch
@@ -0,0 +1,80 @@
+From 1ae6ab7e4bea886349adda9972d73e123279e206 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 30 Jul 2026 15:10:36 +0800
+Subject: [PATCH 1/5] ld: Don't define section symbols for excluded section=
s
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
+index b04ba113aaa..886c49a1861 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -7283,28 +7283,31 @@ lang_init_start_stop (void)
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
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch
new file mode 100644
index 0000000000..9a4dda6da6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch
@@ -0,0 +1,424 @@
+From 768f1c1e85bd8e9fc621914a9f5fdddf2eb6fb07 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 30 Jul 2026 13:43:56 +0800
+Subject: [PATCH 2/5] x86: Check invalid GOT/PLT/TLS relocations
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   | 50 ++++++++++++++++++++++++++++++++++++++-----
+ bfd/elf64-x86-64.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
+ bfd/elfxx-x86.c    | 53 ++++++++++++++++++++++++++++++++++++++--------
+ bfd/elfxx-x86.h    | 11 ++++++++--
+ 4 files changed, 146 insertions(+), 21 deletions(-)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 954803fcc3f..e9192ede6ac 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -1171,8 +1171,8 @@ elf_i386_tls_transition (struct bfd_link_info *info,=
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
+@@ -1745,11 +1745,15 @@ elf_i386_scan_relocs (bfd *abfd,
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
+-		_bfd_x86_elf_link_report_tls_invalid_section_error
+-		  (abfd, sec, symtab_hdr, h, isym, howto);
++		_bfd_x86_elf_link_report_error (abfd, sec, symtab_hdr,
++						h, isym, howto,
++						elf_x86_error_tls);
+ 		goto error_return;
+ 	      }
+=20
+@@ -2581,6 +2585,18 @@ elf_i386_relocate_section (struct bfd_link_info *in=
fo,
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
+@@ -2713,6 +2729,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	  break;
+=20
+ 	case R_386_GOTOFF:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is relative to the start of the global offset
+ 	     table.  */
+=20
+@@ -2777,6 +2796,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	  break;
+=20
+ 	case R_386_GOTPC:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Use global offset table as symbol value.  */
+ 	  relocation =3D htab->elf.sgotplt->output_section->vma
+ 		       + htab->elf.sgotplt->output_offset;
+@@ -2784,6 +2806,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	  break;
+=20
+ 	case R_386_PLT32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is to the entry for this symbol in the
+ 	     procedure linkage table.  */
+=20
+@@ -2911,6 +2936,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	  break;
+=20
+ 	case R_386_TLS_IE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info))
+ 	    {
+ 	      Elf_Internal_Rela outrel;
+@@ -2938,6 +2966,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	case R_386_TLS_DESC_CALL:
+ 	case R_386_TLS_IE_32:
+ 	case R_386_TLS_GOTIE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  tls_type =3D GOT_UNKNOWN;
+ 	  if (h =3D=3D NULL && local_got_offsets)
+ 	    tls_type =3D elf_x86_local_got_tls_type (input_bfd) [r_symndx];
+@@ -3436,6 +3467,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	  break;
+=20
+ 	case R_386_TLS_LDM:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (! elf_i386_tls_transition (info, input_bfd,
+ 					 input_section, contents,
+ 					 symtab_hdr, sym_hashes,
+@@ -3508,6 +3542,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
+ 	  break;
+=20
+ 	case R_386_TLS_LDO_32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info)
+ 	      || (input_section->flags & SEC_CODE) =3D=3D 0)
+ 	    relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+@@ -3518,6 +3555,9 @@ elf_i386_relocate_section (struct bfd_link_info *inf=
o,
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
+index 575995d4957..97661b9fc1e 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1632,8 +1632,8 @@ elf_x86_64_tls_transition (struct bfd_link_info *inf=
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
+@@ -2771,11 +2771,15 @@ need_got:
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
+-		_bfd_x86_elf_link_report_tls_invalid_section_error
+-		  (abfd, sec, symtab_hdr, h, isym, howto);
++		_bfd_x86_elf_link_report_error (abfd, sec, symtab_hdr,
++						h, isym, howto,
++						elf_x86_error_tls);
+ 		goto error_return;
+ 	      }
+=20
+@@ -3601,6 +3605,18 @@ elf_x86_64_relocate_section (struct bfd_link_info *=
info,
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
+@@ -3739,6 +3755,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+ 	  break;
+=20
+ 	case R_X86_64_GOTOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is relative to the start of the global offset
+ 	     table.  */
+=20
+@@ -3805,6 +3824,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+=20
+ 	case R_X86_64_GOTPC32:
+ 	case R_X86_64_GOTPC64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Use global offset table as symbol value.  */
+ 	  relocation =3D htab->elf.sgotplt->output_section->vma
+ 		       + htab->elf.sgotplt->output_offset;
+@@ -3812,6 +3834,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+ 	  break;
+=20
+ 	case R_X86_64_PLTOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is PLT entry relative to GOT.  For local
+ 	     symbols it's the symbol itself relative to GOT.  */
+ 	  if (h !=3D NULL
+@@ -3848,6 +3873,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+ 	  break;
+=20
+ 	case R_X86_64_PLT32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is to the entry for this symbol in the
+ 	     procedure linkage table.  */
+=20
+@@ -4156,6 +4184,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+ 	case R_X86_64_CODE_4_GOTTPOFF:
+ 	case R_X86_64_CODE_5_GOTTPOFF:
+ 	case R_X86_64_CODE_6_GOTTPOFF:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  tls_type =3D GOT_UNKNOWN;
+ 	  if (h =3D=3D NULL && local_got_offsets)
+ 	    tls_type =3D elf_x86_local_got_tls_type (input_bfd) [r_symndx];
+@@ -4882,6 +4913,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+ 	  break;
+=20
+ 	case R_X86_64_TLSLD:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (! elf_x86_64_tls_transition (info, input_bfd,
+ 					   input_section, contents,
+ 					   symtab_hdr, sym_hashes,
+@@ -5011,6 +5045,9 @@ elf_x86_64_relocate_section (struct bfd_link_info *i=
nfo,
+ 	  break;
+=20
+ 	case R_X86_64_DTPOFF32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info)
+ 	      || (input_section->flags & SEC_CODE) =3D=3D 0)
+ 	    relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+@@ -5020,11 +5057,17 @@ elf_x86_64_relocate_section (struct bfd_link_info =
*info,
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
+index b531a261fd4..1de8135c977 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3369,23 +3369,58 @@ _bfd_x86_elf_link_report_tls_transition_error
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
+index 4932b2e43c5..430d61d3097 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -794,6 +794,12 @@ enum elf_x86_tls_error_type
+   elf_x86_tls_error_yes
+ };
+=20
++enum elf_x86_error_type
++{
++  elf_x86_error_tls,
++  elf_x86_error_non_alloc
++};
++
+ /* Set if a relocation is converted from a GOTPCREL relocation.  */
+ #define R_X86_64_converted_reloc_bit (1 << 7)
+=20
+@@ -951,9 +957,10 @@ extern void _bfd_x86_elf_link_report_tls_transition_e=
rror
+    const Elf_Internal_Rela *, const char *, const char *,
+    enum elf_x86_tls_error_type) ATTRIBUTE_HIDDEN;
+=20
+-extern void _bfd_x86_elf_link_report_tls_invalid_section_error
++extern void _bfd_x86_elf_link_report_error
+   (bfd *, asection *, Elf_Internal_Shdr *, struct elf_link_hash_entry *,
+-   Elf_Internal_Sym *, reloc_howto_type *) ATTRIBUTE_HIDDEN;
++   Elf_Internal_Sym *, reloc_howto_type *,
++   enum elf_x86_error_type) ATTRIBUTE_HIDDEN;
+=20
+ extern bool
+ _bfd_elf_x86_copy_special_section_fields
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch
new file mode 100644
index 0000000000..ffe27798b4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch
@@ -0,0 +1,130 @@
+From b7fff15e0fe5494490ea2d222b996f8495b15ad2 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Fri, 31 Jul 2026 05:47:15 +0800
+Subject: [PATCH 3/5] x86: Improve relocation error reporting
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   |  9 ++++-----
+ bfd/elf64-x86-64.c |  9 ++++-----
+ bfd/elfxx-x86.c    | 31 +++++++++++++++++++++++++++++++
+ bfd/elfxx-x86.h    |  4 ++++
+ 4 files changed, 43 insertions(+), 10 deletions(-)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index e9192ede6ac..adc641f5347 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -3644,11 +3644,10 @@ elf_i386_relocate_section (struct bfd_link_info *i=
nfo,
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
+index 97661b9fc1e..dbabcf97d9b 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5151,11 +5151,10 @@ elf_x86_64_relocate_section (struct bfd_link_info =
*info,
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
+index 1de8135c977..12af0e8ec7b 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3424,6 +3424,37 @@ _bfd_x86_elf_link_report_error
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
+index 430d61d3097..48e8ab4ad73 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -962,6 +962,10 @@ extern void _bfd_x86_elf_link_report_error
+    Elf_Internal_Sym *, reloc_howto_type *,
+    enum elf_x86_error_type) ATTRIBUTE_HIDDEN;
+=20
++extern void _bfd_x86_elf_link_report_relocation_error
++  (bfd *, asection *, const char *, Elf_Internal_Rela *,
++   reloc_howto_type *, bfd_reloc_status_type) ATTRIBUTE_HIDDEN;
++
+ extern bool
+ _bfd_elf_x86_copy_special_section_fields
+   (const bfd *, bfd *, const Elf_Internal_Shdr *,
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch
new file mode 100644
index 0000000000..dac9b3ba52
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch
@@ -0,0 +1,50 @@
+From bde043c2c54d0c0fe230bd7e6e045b884178563d Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 1 Aug 2026 11:23:39 +0800
+Subject: [PATCH 4/5] x86: Check if needed dynamic relocation section is
+ created
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
+index 12af0e8ec7b..79fb4b1535f 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2331,6 +2331,19 @@ _bfd_x86_elf_late_size_sections (struct bfd_link_in=
fo *info)
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
index 0000000000..0a67d586da
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-5.patch
@@ -0,0 +1,65 @@
+From a153109ece5591bc4f7eede453168dc76b301d56 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Wed, 5 Aug 2026 16:43:05 +0800
+Subject: [PATCH 5/5] ld: Check input section garbage collection error
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elflink.c | 3 ++-
+ ld/ldlang.c   | 5 +++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 0af9837a28c..7f354520fc2 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14753,7 +14753,8 @@ bfd_elf_gc_sections (bfd *obfd, struct bfd_link_in=
fo *info)
+     }
+=20
+   /* Allow the backend to mark additional target specific sections.  */
+-  obed->gc_mark_extra_sections (info, gc_mark_hook);
++  if (!obed->gc_mark_extra_sections (info, gc_mark_hook))
++    return false;
+=20
+   /* ... and mark SEC_EXCLUDE for those that go.  */
+   return elf_gc_sweep (obfd, info);
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 886c49a1861..65494acca00 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -8165,8 +8165,9 @@ lang_gc_sections (void)
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
