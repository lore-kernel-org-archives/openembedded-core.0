Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14984.1795015268219202501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UHva1C6j;
 spf=pass (domain: est.tech, ip: 40.107.159.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWn8wtHYuUA2v/Cb+RP46DNm/Po7enFcfJ2gs2JVWY/pK16DT/Hz4z1smJp7kDheYPs0DIavKF/CLgpynri0getMWvy8DY1KuYEXD3PFFO7S2qM4hDrujxUUY/StmLlkA0arvtw9xkF16LauhiKWAqLa9ZfnPG/Xd6P3Tz07HdwuklmsrCOvReDEr1ARdPwUZhQtrXyx1MJUplvcxSxWlOGrxPvP4rxwmaVhmwIcaLn1EnRPUxHPxTrewbQC4DYBo+frtimugIHCzbCel5h5drEgacxQ0e77P3bvl4PkOCht0FUa0JW3mMexp4fHQS0qaukLFUxMSQY9CiZWkspaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exJ+/cULSEDhglSMl+jdVmjylS1MK5KQiKzMg56Qo5Y=;
 b=uwM1aMlpJl2eVfdumOODaabiPiYHSdkRK2tVNvi2/QQE6DfUxm009gkoSoRfbzUgRmZM/4bo6WzJ/kvj/mWTepufrnMmEWggiti0QmF+uXKkfTc+uhBbS7ssYziExngooLbmCMrupwbwMjpJP465MzJQh0nPa2SUm5jxDJhq9qeE2LFU1QgLMk3EMeNT2qvX1EAdYtUUlKopYzyMMeBZZJL0jJIIDBmPXYgGcy2lH6Se4jfJJYkzfbgIe/oI9Nv+TbTWTqR9VJOFEDeWCVGB5g7GqAzj9EkTCUvahnCaThIk9f5gHuG9fokqgYW9p4vrf8R/X7rhebvIQxQ9OjIYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exJ+/cULSEDhglSMl+jdVmjylS1MK5KQiKzMg56Qo5Y=;
 b=UHva1C6jj/ES0lr3xLPwpNeaGF5QpjOtH0YaIaUJgzjM76FL/yJtrKhd8n+OEGizDTZwNJt3CWRYUaqP2cG4NuxD/59oeMuf3I9ZZwd1boNj1GtuY4TkMY/DRKa2Ss1TuOSRVcqN2ZlRnlVeqspvvHw6LMuF7uUyv1OAZJaK1b8QpUWWWQe9L2bgRkvhv/Efcf3yb6AWH8epD8hMHz0X0JayZRfHap/PUpB0hgeJIqX1QBXlyybhWcIy06EkTe686hOSFpqKtKqBkpHuV+AIM2YMnUbv/1fu1Zme9vmCTDbDTzKwOt0pD2PDOpIFMnHqFrJepUKBTIjFgLHNuREvPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:21:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:21:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 3/3] binutils: Patch for CVE-2026-91782
Date: Wed, 18 Nov 2026 16:20:58 +0100
Message-ID: <20261118152058.24250-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
References: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bc8831-bab9-4378-c045-08df45879016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|260925021311599003|260925022911599003|260925021911599003|22082099003|3023799007|13003099007|261026130827099003|261026121527099003|261022075727099003|261026135527099003|261021133027099003|261021123027099003|261021135927099003|261021121427099003|261021130227099003|261028144727099003|261022115727099003|261022113327099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: hM5PcFd+eYhf0uBCWI20o3WO4KfoMy0Zh4hg9JPAYu+/Tfn9P469bziEW3/HrXg7re+DZChKELtyMKa8HveY5ehXgvCJv4OtS2O8VCFxq/1SW+cWm9psI+9OBhKANy+gtsZ2x3/IWBgTMHqyJg1OoM5E1Y8JCtftp84cH6rtxCY3nSv+E8Dsq3c43jQbl0u9QIIV+zV6wnZ92evITLtMaR6tkZmPEMe3ZzVHTzN97RVqJ0jAI38tI1IZm55Zmr/E0fkNWiDwAq5Sq2cQbGWqwK/6iHmS+Mjiiov/3Qp44pDU4Vf0ZcoRYZu9gpCQqJ670uzLF4zOZLbtKstui5X0vu9aH7+MQDbfPEtDUkIJN/xqHU/gkpotLoPTLDhI7OmKdMO2aLE77MuwsfUArb777i7fCdMHO0fhER1i+gp0+vggSS+W7pdyaoOGG3HGyGZLJGJbYhvFIA++Opv27n1Yc3Nn40eYCA5+D+sdKocxw/K9waV2XVoQCud4ypnm12nmehClPpcdBMJlNRtkt3SrKSSDBK6HxmtmF//Wf1pmwnnSXIbdCLaE1il4X8VQxvL+lpJeHGYX828IqGR6GyRvJkZkr3IAcYuHBxwBC/H3jr/vl3EufwCNZGayv+LJJy2u
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(22082099003)(3023799007)(13003099007)(261026130827099003)(261026121527099003)(261022075727099003)(261026135527099003)(261021133027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261028144727099003)(261022115727099003)(261022113327099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?10etmkIf/DL37qo1Qy490asTwMjebOdX7wnqZqUYpDFt4KiGnfAGcCRtgWsm?=
 =?us-ascii?Q?hgyRDpQfKJh8fn1YLa3jRPr/2Orxdyo8xXZEr3x3deQkcoOzFEBsF71y0RcE?=
 =?us-ascii?Q?U4Vk3j+ZxB4Ke/WuBrgTljZRAMw+eW8pq3w8F+VOjM6B80TnmCNgR7CKV5Pu?=
 =?us-ascii?Q?7DaL/VxdHo/lEBc25ITUGzRlKZFqoG1OHxNlJqcKkZ7Wvk6SDFboXQxRomZO?=
 =?us-ascii?Q?cYj3arVCzmtQulQ6lHoxZtbV8HO2Olyu1+2GJ0j634E4zdZg6ZoN3FVx/W+c?=
 =?us-ascii?Q?P1Yg1eoAruA6OxXQJHjKrnN7PuRO7tTkjcMd9Z+eAssJxDo2iU87ZmS+5J51?=
 =?us-ascii?Q?dlbhCeimUXiQDFDG0PFv2UeV+RhT5KDVWJiyip8+O0NgApe8h6RWIZkIiZc/?=
 =?us-ascii?Q?GpKe0ltnFS/AQ9GphdQadb+DkyYkKep2ewPBpaGBnTbnnY2Fcql8JgNOQEXG?=
 =?us-ascii?Q?FwNw55L3TDP76COhL9U4W37g1I9B2Nk3FnJmU83rzbbWMFQNWozsn0za4MJg?=
 =?us-ascii?Q?IqEgchxlA92E0+180wTyX8/Hhlo6ZVjjhlzqAIyR4wHVviVo7PkZkoFpY4cG?=
 =?us-ascii?Q?DGUMkAa9gxyJFplIyipTHWlEvp0m9DQKhYPnng+uWEr8mE9VGNKoyT7byN6g?=
 =?us-ascii?Q?LT7Zsqod5dutB+41YH1/JG41VzUS5syZ0QCAVnw/NPMxJ1q4BZwO9NYwY2bc?=
 =?us-ascii?Q?7ugRNrWxSW33la4H9v/mr4QFEHe1xxEM2sKfd0EvV8Jvvq4qjWfwvPjKNGGo?=
 =?us-ascii?Q?x3KBJ/CVv3t742zAzUEPp7GkqGd9DU5nZMiRZyCX0yyIVsJzOA3nSL54pbIT?=
 =?us-ascii?Q?SIS/oZYkmNwt/lePMjlZujNSQ4s83ASx3qmsYsNi7YtPtyrK/FvITvr54+jz?=
 =?us-ascii?Q?USD/mq7l1xNfoHQOBpV23lsy6GwI1b+5Lp83rB4yV7o68nler4zRwQGO3PZ7?=
 =?us-ascii?Q?OSACaUHyRSPH+F6SfxFqfifNvIUls3NuR8j/r/DPBniBmY0AKMoFY1TQun6O?=
 =?us-ascii?Q?dPGdZN34RpURPPgw0Kuj+5NDatGYGvz/plYKp4Yo+DBudRlEl9NCKaf0Y16o?=
 =?us-ascii?Q?z4Ge2vQgZ4QO957c53XTID72CIH60TXykYSU5d9UtM+Y8lzdWzYzCmRFZtIC?=
 =?us-ascii?Q?7q9Aq2vAwqWTtXeqXuNuaaXTxJxYakZu1eZOJXxC6TBN6ux1mn0ABJcUxPS8?=
 =?us-ascii?Q?yHM/nsU98E1inAbWZjskNIV0xyReZG7AViGIe3XJZntVsXgDirJBpWOrDJAp?=
 =?us-ascii?Q?lW46uz3K3D/veDAhXI6Vori9mRm5+f0vV2LQy0HrAoPB5CIeXyoFjLA2zsVn?=
 =?us-ascii?Q?KajwSoyiDUvH4em7/LODwMsHq38MNDE8Z8dK8Y5ZyCuswoXlVFDNCiVaVsie?=
 =?us-ascii?Q?CCvtR9bD9XU4h7SNqzzRYgnw4Uc/bkvbwzbvqlV4FMrlNpEXi8xs/5SlopCq?=
 =?us-ascii?Q?ip4L/0cTEv7otKVMyxEbDmWwkyYEZgcu8gJzmSkhlJX3JEFsSRDHDNgEWb6X?=
 =?us-ascii?Q?6z5+rTyHF6zsnos4y3gb/PUYkCzk9L/WRym/65r5H23WHfvEi7L3J+4NRupy?=
 =?us-ascii?Q?o7Ww7HUmC3JwvNyjfVLZSwtknQj30dEl4n5KauQQjuTgtJ1nxD8pbOiE1O0b?=
 =?us-ascii?Q?t9Mb5b8zOHWHYH6/pMIUruL4686a2tkQxeTT8zKUVxFzuQJsBtIwSGnZlFGA?=
 =?us-ascii?Q?Y17H28NQaam0/B8/C6/J77aZPuLfOVq42udJWPGrzmhGJqbpVqCsmtevZYJ4?=
 =?us-ascii?Q?em+UB7JJ5A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bc8831-bab9-4378-c045-08df45879016
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:21:05.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6HYhxuWQ/J0M9XfKY9Q+LCpIfs0qdVTs+WnFwsOOEhAAwrQOkISgx6KUbGO+BwfA01nC5EuNJSZ01xUbsiXxQJgLW2wYK8D0vGkdu8dtMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250564
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
---
 .../binutils/binutils-2.46.inc                |   5 +
 .../binutils/binutils/CVE-2026-91782-1.patch  |  79 ++++
 .../binutils/binutils/CVE-2026-91782-2.patch  | 423 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-91782-3.patch  | 129 ++++++
 .../binutils/binutils/CVE-2026-91782-4.patch  |  49 ++
 .../binutils/binutils/CVE-2026-91782-5.patch  |  67 +++
 6 files changed, 752 insertions(+)
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

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index 2f63c8d8a5..ab93b5bdd9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -45,4 +45,9 @@ SRC_URI =3D "\
      file://CVE-2026-3441_CVE-2026-3442.patch \
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
index 0000000000..2bd4d91029
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-1.patch
@@ -0,0 +1,79 @@
+From cfd5cedd8d988f4ef9cb5514f030c85f3c877d29 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ ld/ldlang.c | 39 +++++++++++++++++++++------------------
+ 1 file changed, 21 insertions(+), 18 deletions(-)
+
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 18aae3a2cad..a9724e4496f 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -7114,28 +7114,31 @@ lang_init_start_stop (void)
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
index 0000000000..b6286e8c29
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-2.patch
@@ -0,0 +1,423 @@
+From 90da228c1af5e2695a0dea095d58785304e22710 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   | 50 ++++++++++++++++++++++++++++++++++++++-----
+ bfd/elf64-x86-64.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
+ bfd/elfxx-x86.c    | 53 ++++++++++++++++++++++++++++++++++++++--------
+ bfd/elfxx-x86.h    | 11 ++++++++--
+ 4 files changed, 146 insertions(+), 21 deletions(-)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index c2b3c7dd165..e23690dc8a4 100644
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
+@@ -1744,11 +1744,15 @@ elf_i386_scan_relocs (bfd *abfd,
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
+@@ -2581,6 +2585,18 @@ elf_i386_relocate_section (bfd *output_bfd,
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
+@@ -2713,6 +2729,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_GOTOFF:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is relative to the start of the global offset
+ 	     table.  */
+=20
+@@ -2777,6 +2796,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_GOTPC:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Use global offset table as symbol value.  */
+ 	  relocation =3D htab->elf.sgotplt->output_section->vma
+ 		       + htab->elf.sgotplt->output_offset;
+@@ -2784,6 +2806,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_PLT32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is to the entry for this symbol in the
+ 	     procedure linkage table.  */
+=20
+@@ -2911,6 +2936,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_TLS_IE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info))
+ 	    {
+ 	      Elf_Internal_Rela outrel;
+@@ -2938,6 +2966,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	case R_386_TLS_DESC_CALL:
+ 	case R_386_TLS_IE_32:
+ 	case R_386_TLS_GOTIE:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  tls_type =3D GOT_UNKNOWN;
+ 	  if (h =3D=3D NULL && local_got_offsets)
+ 	    tls_type =3D elf_x86_local_got_tls_type (input_bfd) [r_symndx];
+@@ -3431,6 +3462,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_TLS_LDM:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (! elf_i386_tls_transition (info, input_bfd,
+ 					 input_section, contents,
+ 					 symtab_hdr, sym_hashes,
+@@ -3503,6 +3537,9 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_386_TLS_LDO_32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info)
+ 	      || (input_section->flags & SEC_CODE) =3D=3D 0)
+ 	    relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+@@ -3513,6 +3550,9 @@ elf_i386_relocate_section (bfd *output_bfd,
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
+index 55102f83365..b007ab70e5d 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1631,8 +1631,8 @@ elf_x86_64_tls_transition (struct bfd_link_info *inf=
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
+@@ -2770,11 +2770,15 @@ need_got:
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
+@@ -3603,6 +3607,18 @@ elf_x86_64_relocate_section (bfd *output_bfd,
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
+@@ -3741,6 +3757,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_GOTOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is relative to the start of the global offset
+ 	     table.  */
+=20
+@@ -3807,6 +3826,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+=20
+ 	case R_X86_64_GOTPC32:
+ 	case R_X86_64_GOTPC64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Use global offset table as symbol value.  */
+ 	  relocation =3D htab->elf.sgotplt->output_section->vma
+ 		       + htab->elf.sgotplt->output_offset;
+@@ -3814,6 +3836,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_PLTOFF64:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is PLT entry relative to GOT.  For local
+ 	     symbols it's the symbol itself relative to GOT.  */
+ 	  if (h !=3D NULL
+@@ -3850,6 +3875,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_PLT32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  /* Relocation is to the entry for this symbol in the
+ 	     procedure linkage table.  */
+=20
+@@ -4158,6 +4186,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	case R_X86_64_CODE_4_GOTTPOFF:
+ 	case R_X86_64_CODE_5_GOTTPOFF:
+ 	case R_X86_64_CODE_6_GOTTPOFF:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  tls_type =3D GOT_UNKNOWN;
+ 	  if (h =3D=3D NULL && local_got_offsets)
+ 	    tls_type =3D elf_x86_local_got_tls_type (input_bfd) [r_symndx];
+@@ -4882,6 +4913,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_TLSLD:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (! elf_x86_64_tls_transition (info, input_bfd,
+ 					   input_section, contents,
+ 					   symtab_hdr, sym_hashes,
+@@ -5010,6 +5044,9 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 	  break;
+=20
+ 	case R_X86_64_DTPOFF32:
++	  if ((input_section->flags & (SEC_ALLOC | SEC_DEBUGGING)) =3D=3D 0)
++	    goto non_alloc_error;
++
+ 	  if (!bfd_link_executable (info)
+ 	      || (input_section->flags & SEC_CODE) =3D=3D 0)
+ 	    relocation -=3D _bfd_x86_elf_dtpoff_base (info);
+@@ -5019,11 +5056,17 @@ elf_x86_64_relocate_section (bfd *output_bfd,
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
+index bae9464921f..837cde52776 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3370,23 +3370,58 @@ _bfd_x86_elf_link_report_tls_transition_error
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
+index 69c348ee42b..92e9672f763 100644
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
index 0000000000..73913355ad
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-3.patch
@@ -0,0 +1,129 @@
+From 9b448741511a486df9e5fa59bfadb7f214300bed Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-i386.c   |  9 ++++-----
+ bfd/elf64-x86-64.c |  9 ++++-----
+ bfd/elfxx-x86.c    | 31 +++++++++++++++++++++++++++++++
+ bfd/elfxx-x86.h    |  4 ++++
+ 4 files changed, 43 insertions(+), 10 deletions(-)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index e23690dc8a4..b19427ac927 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -3639,11 +3639,10 @@ elf_i386_relocate_section (bfd *output_bfd,
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
+index b007ab70e5d..5a9b6760778 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5150,11 +5150,10 @@ elf_x86_64_relocate_section (bfd *output_bfd,
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
+index 837cde52776..b3983b120f5 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3425,6 +3425,37 @@ _bfd_x86_elf_link_report_error
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
+index 92e9672f763..415382391b1 100644
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
index 0000000000..914753a3c6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-4.patch
@@ -0,0 +1,49 @@
+From b811e9ef1bc6c7d825a42d0761e10a77bb170036 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elfxx-x86.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index b3983b120f5..f2c86ffe5d5 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2331,6 +2331,19 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
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
index 0000000000..9954b053fe
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91782-5.patch
@@ -0,0 +1,67 @@
+From d3e35b62391cdcd8b33678a9c1925c0033ec4db6 Mon Sep 17 00:00:00 2001
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
+Note: 2.46 uses bed as the local variable name for elf_backend_data, where=
as the upstream version uses obed.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elflink.c | 3 ++-
+ ld/ldlang.c   | 5 +++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 29b89d4ab9e..726d6b740c2 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14783,7 +14783,8 @@ bfd_elf_gc_sections (bfd *abfd, struct bfd_link_in=
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
+index a9724e4496f..fc72fbeea54 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -7996,8 +7996,9 @@ lang_gc_sections (void)
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
