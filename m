Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19775.1794927274395655079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 06:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CyyXhIC2;
 spf=pass (domain: est.tech, ip: 40.107.159.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPVhmz+Zhbtb/DwtmdsWemUZQRJN3G3Bw31h/p4LPraMhSG6a9gSNnMEhVasyv0+G4UQrP3QFjhdwygouLjgZilzN9UtIYMLHVkJgBB/TR+NWFTcF7MQVYlNvaF01g6Co24LRtiCv/s1WN6ams2XUqTUSv5yd7jg0BIAsscRfiqcDwPEbH4P98R7FeEdTw4cm70QcM4bsa7x/mrH75eYkonmEXW9lXh5UHfMSiI14/M77lgTby2DpB9W6WhbPWaMcqLBNWxrEwdwOvTaOjdG+klBuQ8IA09IjS+jzzrSlnso1iGI5PbhBV8DfMzV30g9QRtmOsI9Jw3yuV8+YzTEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iw9WM3SnFF3eij7nm/mZ7CGgvOpfIGWHZBRnVI0DZOA=;
 b=ec1yY6Z1NDmnhvnGoOygoDDhyetggTCigbAPZnNFQzVplcplWM2cyW5CFo4YgdDLUpvcIjUydvyIExr0GOHOOLwAjmYgb4x6Abn9JZpHMy0xCFqn6DsZFpYlx3gSr7yr0hSs85FHRzg2LgTdCJgC75RBDgUxgBN1FKSRu9aKcHxV4OusDPuodUOP8lz16Duyg3S7GWg4D4agVTnMTgrovcjc36uDSH+8dHi6QeKrtDblt9kfmqdMyTh6i5vWsI9F03CxV6Y1L8o93yVC6mFZfD/MuOrXQpSmebq/QElhGshwfnl2B/Ldc5AoCRtuIiIq1Iitt5Wqpq2ushJOOXVK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw9WM3SnFF3eij7nm/mZ7CGgvOpfIGWHZBRnVI0DZOA=;
 b=CyyXhIC2bvBCrM23yOgnl0TLxZsBH7welJe0ECzqDVqc3Wfi1BqoihMv6nqn5yf0lWU1gcqpC4Uyb+riRJwmB4lurXgHY83U5FsWzcSU3zcAjgZSm2egqMUuwNGhAjMUtk4YH+IflXJjmoutggEUjcVSppoZvPlGmTodfMkkNCuvAZhp28Cf5DyEBMsjI63mJz0KMp27u3Ew/EIXXc4Toe//q84qknhCXdSX6ahPZ/TKuO5sufzhFJ0OyN+AnZnM6hvIB1PUaHsKUncLZm+HC/rY4OoZepooaPeNUHnV0xNFqeT0YZyl3Z8kmi9o8tv0zBp+pcDScxgEKLIzj0cmJA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3234.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:54:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 14:54:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] makedumpfile: Upgrade 1.7.9 -> 1.8.0
Date: Tue, 17 Nov 2026 15:54:25 +0100
Message-ID: <20261117145426.15711-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3234:EE_
X-MS-Office365-Filtering-Correlation-Id: bea2411c-9bf8-4bd0-b733-08df44baae2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|6133799003|11063799006|56012099006|261026140227099003|261028144727099003|261022075727099003|261009223027099003|10067099003|261021121427099003|261021123027099003|261102123227099003|261102124527099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: elkzOb/X1Sw1CZZua0fz2+L8SudhUlRnkLb4TBsTEEig8ue8EZxIZuO8y7CuV6jPphkD0pO4W9EXV7z1nFv/mQbJG5WPTC6aTZot0/DOD1U6+0jf7bErLvhgEYn+znRT/3owwrF3F7F7g+Njiya1KvihNKrVDgLIz6KQJ5hkspqT96lUh4eMqu/Eqexpea2EylKr6X4H/eDt3jSzjsa+LrWGgVayP6qQO0o1j+6qzITWeaGmxvz1aiXsAyON+SAp2ryi7UQz/3mXm5V0eBpsKSIZ8TjnJpNui4Gkvb5qowM1o5vExJF1S6N3a3hlahIjMqm27off6BDZZ6DDcmyLMMbBAxkjp4uL6GlU1hPspKr7NumSHOc5xlEMyczc1UJ0F2AUvOt7tfDDVoCHMfOs6rOzra3edTPEKPur/oUFMhl+8T8yM6QnQHg3sdPy7PgXKfivh1L0GZrtuf/Gq6Tc8BpwxHv1rTuWFe+mjj1eI5ZNpJNCjn1Qo7pOqYM6XFTzPlv1co0xVlTerf4zoOltKD/FoKm5Ekih89DLpjD3Sjv/B0FfFlRihHMZKYf2HmzkZp1OhA6akUIm4jFHvfzillNsHhN5HlFUQQqTKpAiFz6W8K+KfEj91kJRWNf0dBD9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261009223027099003)(10067099003)(261021121427099003)(261021123027099003)(261102123227099003)(261102124527099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8r0SZwe2+drU1hj/g4jnI5cUHjii6ylDo773TaeXxhWCyOXWdOdy6DbKe+g/?=
 =?us-ascii?Q?s+RYNoBF109R0Qt4hdj6aBjE3uJQu/h4YFJx2FSa1T+K+L5yIAVIdXl6zgrS?=
 =?us-ascii?Q?0QBAhrVuUjy4bZ7aSA7a501FGTI+g2R9IXpFrWM4QIP/mbWVVomf8VV0lqOv?=
 =?us-ascii?Q?+PHxPjiOHEvTzSyLUuDTHdNXHTH0XT4sNsNGQuaaUWzMBYcOqJfEbqIAg0Pr?=
 =?us-ascii?Q?aQmj/4zwbtFCKyBUQhdb83pvzJVM10cTrlz+bs1Rc6/vJ60RgysompVL/z05?=
 =?us-ascii?Q?pi40PHxWTEmcVqVtpEXAhgDWGaI7HBg7PhZKxVEhvZ6HpbkWEEp/v82wGE5M?=
 =?us-ascii?Q?Ll1M8iLUpdl2mPSowe8S9zHyKXIMtLy4Lj1+LDd9YcEyNVx3BG+MYCKvtIqD?=
 =?us-ascii?Q?LybGKAi7Mt5uK1Bb8ZWZX81HMwjYsdQOFHU9Oy68NrMAuprZ9714D+N1PcV5?=
 =?us-ascii?Q?SSRb7sDmfOsSCcx2hncvKAJRNTMAZIGS4Xrv4QJFrNtBbecUaQuCvfKFL+EJ?=
 =?us-ascii?Q?Aq9PFnxbYkMnmJLfCIyjMphbwjdW0U6+eDCVC6eYmXeS1NTCjY6OmP1lUxih?=
 =?us-ascii?Q?fItugb8aJCHXKcYn5h6vJpunCLh6eCqHDuG6iAEWaqO9ao75CeRtt2YOG7Pq?=
 =?us-ascii?Q?jLvTvs78CUi6j6ucvCm6dwoZYZXHD7HmuZWYV1GTQpVCy5Ty63MlNMvB/48s?=
 =?us-ascii?Q?qIsU5l/tOkkE7MmBGXsrrX7fAJ6tgdibJ95C1fHZ3Fa11X7N3y859OEU22VM?=
 =?us-ascii?Q?IcKKX9mdV2jW5tdln7W2s0Zktd2jPdvJ8WDo9oEza/i3+XJ4OxjeKbw9/5at?=
 =?us-ascii?Q?BLZmtdfH9d05Gm6awCAj1ukhqWtasFFtb4y++M9/YXUIO6GiiBTK1ncHJSRZ?=
 =?us-ascii?Q?nMWmJvE7LN4iZ/0YcurtsIlRNUgJ5KyqCPRpwnwuVlXVs8WsuGDdxVzAWe28?=
 =?us-ascii?Q?0FZvsDv59npkr95R+U/LPckOUPJ65PUsiwrUo3E6eoO2kW2cLrjA3cB8dCrf?=
 =?us-ascii?Q?PMCqUVCjyE+U8sbCaFmyeOBL4fJE5tvjX5yxH5Xc2CLTEDvjabAOYMjQswdC?=
 =?us-ascii?Q?aEjhdIvtrDjK0XUsLKhEVl+rNXbuR++8GEm6T+MpYXgaijJ236jdoIzSOuAq?=
 =?us-ascii?Q?787DvYIoZzIGWtgaqKok/SZi96hZSY4pWBJQm1SNshoQLTPN43CvKbkNLfRy?=
 =?us-ascii?Q?5q/oEPmUG5xXe8sIuCohCK/nlKBKj0UlOocDz+TPmYCwkTKQTfWpOtR/lXwi?=
 =?us-ascii?Q?ed3nRVfG0DCbcNIBVC9d6ECBnWBmeeWEAqIJujwhQC2dj3gHD/qz1oFLD0j3?=
 =?us-ascii?Q?FltdfUa/S9g4Sl4HTBVCAmBcnVtNM/WJGxUwWX7JvT2qYsLpDoSlU3hehDXn?=
 =?us-ascii?Q?wDAcMYD4S/nLh/jNCuU/nLBnqNhg/tRCP4T8wU/y7ngk/Sgqi9hvRxUFmVwW?=
 =?us-ascii?Q?ZD0Nz56K+rOLmZ3konDRrQPaUHTyBdLT1ykb+UotZOm2YGICH8/U7UDY6js/?=
 =?us-ascii?Q?ZtDZZ1kSd5VDHkd6B6+k5F8iV1GGkZ4JKCfO3YDNa+4A6IQljNVnvl0YlfYB?=
 =?us-ascii?Q?okvlj98XZqtKFKUJKa5EZRfESN75FHwmaswRNkenvnJ4jiCpxv6JhJbGaV93?=
 =?us-ascii?Q?XukY4yCb4yHa1NBoaJ0bepUOjPM68hU+8GSeMtvt93RKuqRKR4f5G2+4ftZf?=
 =?us-ascii?Q?eur8fvdrRp4+r2Zu/rZLn/SthJK/ONqJ9Saw0aPeSPPIMvZaIkjI9PUL+Loz?=
 =?us-ascii?Q?OiL3eU2S2F2VNwKBcQYEgEYfrrKkU0I=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bea2411c-9bf8-4bd0-b733-08df44baae2d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:54:28.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGTkjX2qfnDOzJn7ZZf44AMVRK/FmA2W6/FYiquQqT8CBdqIpxdV7PvOWHxS1bdkawteIKHqAIixbu8OPUiRqmNVXECRnHm8OikV+0u0Szs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 14:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250457
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://github.com/makedumpfile/makedumpfile/releases/tag/1.8.=
0

[v1.8.0] Update version
[PATCH] Derive the mem_section mem_map mask from SIZE(page)
[PATCH] README: Remove email addresses that will be gone and update informa=
tion
[PATCH v2 7/9] Add PG_INCLUDE_HEAD extension return status
[PATCH v2 6/9] Simplify arguments for page checks
[PATCH v2 5/9] Move page checks into makedumpfile.h
[PATCH v2 4/9] Introduce a stat for pages retained by extension
[PATCH v2 3/9] Share page information with extension callbacks
[PATCH v2 2/9] Honor CFLAGS in extensions/Makefile
[PATCH v2 1/9] Do not call extensions for tail pages
[PATCH 6/6] Ensure e_phentsize does not exceed buf size
[PATCH 5/6] Ensure get_smram_cpu_state() does not read beyond smram
[PATCH 4/6] Add an out-of-bounds check for info->valid_pages[]
[PATCH 3/6] Prevent a multiply overflow in cache_init()
[PATCH 2/6] Add an out-of-bounds check for si->block_table[]
[PATCH 1/6] Ensure page_desc does not exceed page_size
[PATCH] Avoid glibc lazy-unwind machinery in parallel teardown
[PATCH] arm64: Add 5-level page table support for 4K pages with 52-bit VA
[PATCH v6 09/10] Doc: Add --extension option to makedumpfile manual
[PATCH v6 08/10] Add erase_sample extension as an data erase reference
[PATCH v6 07/10] Add sample extension as an example reference
[PATCH v6 06/10] Add makedumpfile extensions support
[PATCH v6 05/10] Implement kernel module's btf resolving
[PATCH v6 04/10] Implement kernel module's kallsyms resolving
[PATCH v6 03/10] Implement kernel btf resolving
[PATCH v6 02/10] Implement kernel kallsyms resolving
[PATCH v6 01/10] Reserve sections for makedumpfile and extenions
[PATCH] Fix error and simplify eppic_scripts/proc_names_3_10_to_4_8.c
[PATCH] Fix wrong exclusion of compound tail pages on Linux 7.1 and later
[PATCH v2 2/2] riscv64: Fix huge page translation in vtop_riscv64()
[PATCH v2 1/2] riscv64: Fix vaddr_to_paddr for vmalloc and vmemmap regions
[PATCH] Mark start of 1.8.0 development phase with version 1.7.9++

- Refresh existing patch for 1.8.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...makedumpfile-replace-hardcode-CFLAGS.patch | 45 +++++++++++--------
 ...umpfile_1.7.9.bb =3D> makedumpfile_1.8.0.bb} |  2 +-
 2 files changed, 27 insertions(+), 20 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.9.bb =3D> makedu=
mpfile_1.8.0.bb} (96%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfil=
e-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedump=
file/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 9b527cfb99..5afdd338ff 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-repla=
ce-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-repla=
ce-hardcode-CFLAGS.patch
@@ -1,6 +1,6 @@
-From 8d200d7cd700f93333353632e7dce48cf4b871fe Mon Sep 17 00:00:00 2001
+From b19405a555473b6045cea94f77ac14388085c960 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Sun, 24 Apr 2022 17:25:33 +0800
+Date: Tue, 17 Nov 2026 12:25:17 +0000
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
=20
 * Create alias for target such as powerpc as powerpc32
@@ -19,15 +19,19 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
=20
 Rebase to 1.7.1
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+[2026-11-17] Rebase to 1.8.0.
+rebase CFLAGS patch to 1.8.0 (keep -llzma, add powerpc32 alias)
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
- Makefile | 40 +++++++++++++++++++++-------------------
- 1 file changed, 21 insertions(+), 19 deletions(-)
+ Makefile | 39 +++++++++++++++++++++------------------
+ 1 file changed, 21 insertions(+), 18 deletions(-)
=20
 diff --git a/Makefile b/Makefile
-index b2ffcec..e416f4e 100644
+index a7b5ec9..a0d86ba 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
+@@ -8,10 +8,6 @@ ifeq ($(strip $CC),)
  CC	=3D gcc
  endif
 =20
@@ -35,12 +39,10 @@ index b2ffcec..e416f4e 100644
 -		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -CFLAGS      :=3D $(CFLAGS_BASE) -DVERSION=3D'"$(VERSION)"' -DRELEASE_DATE=
=3D'"$(DATE)"'
 -CFLAGS_ARCH :=3D $(CFLAGS_BASE)
--# LDFLAGS =3D -L/usr/local/lib -I/usr/local/include
--
+ # LDFLAGS =3D -L/usr/local/lib -I/usr/local/include
+=20
  HOST_ARCH :=3D $(shell uname -m)
- # Use TARGET as the target architecture if specified.
- # Defaults to uname -m
-@@ -24,26 +18,34 @@ endif
+@@ -24,26 +20,33 @@ endif
  ARCH :=3D $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64=
/ \
  			       -e s/arm.*/arm/ -e s/sa110/arm/ \
  			       -e s/s390x/s390/ -e s/parisc64/parisc/ \
@@ -76,12 +78,11 @@ index b2ffcec..e416f4e 100644
 +CFLAGS_COMMON =3D $(CFLAGS_ARCH) \
 +              -DVERSION=3D'"$(VERSION)"' \
 +              -DRELEASE_DATE=3D'"$(DATE)"'
-+
 +
  SRC_BASE =3D makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sa=
dump_info.h
- SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c sadump_inf=
o.c cache.c tools.c printk.c detect_cycle.c
+ SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c sadump_inf=
o.c cache.c tools.c printk.c detect_cycle.c kallsyms.c btf_info.c extension=
.c
  OBJ_PART=3D$(patsubst %.c,%.o,$(SRC_PART))
-@@ -52,12 +54,12 @@ OBJ_ARCH=3D$(patsubst %.c,%.o,$(SRC_ARCH))
+@@ -52,12 +55,12 @@ OBJ_ARCH=3D$(patsubst %.c,%.o,$(SRC_ARCH))
 =20
  LIBS =3D -ldw -lbz2 -ldl -lelf -lz
  ifneq ($(LINKTYPE), dynamic)
@@ -96,7 +97,7 @@ index b2ffcec..e416f4e 100644
  endif
 =20
  ifeq ($(USESNAPPY), on)
-@@ -65,12 +67,12 @@ LIBS :=3D -lsnappy $(LIBS)
+@@ -65,17 +68,17 @@ LIBS :=3D -lsnappy $(LIBS)
  ifneq ($(LINKTYPE), dynamic)
  LIBS :=3D $(LIBS) -lstdc++
  endif
@@ -110,8 +111,14 @@ index b2ffcec..e416f4e 100644
 +CFLAGS_COMMON +=3D -DUSEZSTD
  endif
 =20
+ ifeq ($(EXTENSION), on)
+ LIBS :=3D -lbpf $(LIBS)
+-CFLAGS +=3D -DEXTENSION
++CFLAGS_COMMON +=3D -DEXTENSION
+ endif
+=20
  ifeq ($(DEBUG), on)
-@@ -106,14 +108,14 @@ SBINDIR ?=3D /usr/sbin
+@@ -111,14 +114,14 @@ SBINDIR ?=3D /usr/sbin
  all: makedumpfile
 =20
  $(OBJ_PART): $(SRC_PART)
@@ -123,12 +130,12 @@ index b2ffcec..e416f4e 100644
  	$(CC) $(CFLAGS_ARCH) -c -o ./$@ $(VPATH)$(@:.o=3D.c)
 =20
  makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
--	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(=
LIBS)
-+	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $=
@ $< $(LIBS)
+-	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -Wl,-T,make=
dumpfile.ld -o $@ $< $(LIBS)
++	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -Wl,=
-T,makedumpfile.ld -o $@ $< $(LIBS)
  	@sed -e "s/@DATE@/$(DATE)/" \
  	     -e "s/@VERSION@/$(VERSION)/" \
  	     $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
-@@ -122,7 +124,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+@@ -127,7 +130,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
 =20
  eppic_makedumpfile.so: extension_eppic.c
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb b/meta/=
recipes-kernel/makedumpfile/makedumpfile_1.8.0.bb
similarity index 96%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.8.0.bb
index 62298735ea..f8a952dac3 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.8.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
 LICENSE =3D "GPL-2.0-only"
=20
 SRCBRANCH ?=3D "master"
-SRCREV =3D "eb42d6330b275ba344ca170286480917450d7f73"
+SRCREV =3D "ae6c64cd2693cd7c4b683d1948d4bb1b206636d0"
=20
 DEPENDS =3D "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools =3D "perl ${PN}"
