Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14971.1795015264024505490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q0sfDVXs;
 spf=pass (domain: est.tech, ip: 40.107.159.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvtE0xERMSugfbprwhIr+2piSpczBcmKa7ufv12EBqiAKZ3Xl4t6bB6jW2r89CUrhI+ZYZQlcwsvQtLbX6v4fTVVNYQquu1HvwKV0vHEMu6sARiMbk0mQrogh60Ipu9Tqdeoz1c8UX/CvB58U8iIGyWXOHO1erzuGUgaIEDkr1jXsjH/f9+CVEDiqJ/kO0i205JSVaIa7ocFKbbFayPjGyJG6Anvpc8I+qBTSgR1244A72LQ9LZhEv7Z+XiZ6xil2divWbLJG/Zx3dZtI+Cl9j7b/stCU3IRYKwqsL0kuomTBVh1LjGXnwaQuU7s53HBufkoNOPwbyVbOWjJfLxgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVLcTXJdfispZmsazMhnLdHPypL0KC33sm6XmUxe/7s=;
 b=XYVQMwabskhYHcJnDLi5SKx0PUz87R7EPri3QF8ZFobQfncWt6NQV0bEkguYUl0v6xca8FPuWG6uOMbJ0H14AZPJEk/Ebj9w/WXJrF6WuPGBCzjh1qCPbUyRa2UG3C5FzDhguPXil7/D/L2LZ9A/BK8jrXVMqPwkx+Hxs72CrNRtmlUzM9pSVYpcx/qew5cvQHmhHbOu9BMcm0sQiZrk8EadfidBTvpX3Z3SLixqzVp4UVWlOxoz469BRDeqXNbzLmhMqCPETRaKcG1TXCV5qYyLBWBs6xKR9qG/lJ/nWhnoe+V0QCerx9dLx3DgKWzrFIZb+4r4GJfme/NLUvdnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVLcTXJdfispZmsazMhnLdHPypL0KC33sm6XmUxe/7s=;
 b=Q0sfDVXsRlIEQ/xLDiblgU9f+IsBItE+sHnucmb7q1SutWvHspRVgZ7Dt8rlqjA6KVVtqfHvkpCw5k7ZaUpDM0le+cI4ToyRI14FMKTcq14r39WMnN40qQsNVjQXw1quKkyxeSckh77PGEEe3yu9cE3ZOWTIwnrfwYingriKJLaTJMAYrSWMDEDMO229nFREaJ7R7ESzhNC61j8NHvhdJ1kv2p+ikvB54otYzMwMl9tzkiEdN964FTYQyqor/Ncp5H6IWfaeSLC6Z4zJqWUcpLqCC63oFVThsjve6qahFRmbdf4pDEGRiswI1gdaQ32+nWGaPqCb5Oy/RQYpYT3kZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:21:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:21:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/3] binutils: Patch CVE-2026-91781
Date: Wed, 18 Nov 2026 16:20:56 +0100
Message-ID: <20261118152058.24250-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
References: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b27f788-5e78-44cc-5a16-08df45878e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|260925021311599003|260925022911599003|260925021911599003|22082099003|13003099007|261022075727099003|261021123027099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: iSFt//KlmO11hdA0wdPczJf8gHX02ZHULbJBW1JCaN2CIBzKUdNSacaSjTa7tMJ8Pe6SVBY4Jwq/JySy8pOBoEWVt/dnHVWt8wrRMZe2UnNwoo6pPL1mNUfJzIldOQqGiGTI07H/xrIUoQAFGBH9bGOOccZRs5tUeIAYIjn84hXviSw9iQtgd0g6SxLQAIcicyqcfokce+eZi8+TDgZd4od+KsquDrh+4Go0rd/C2o0ZEfUfx+dUitbiQB+8X86Rcu1+xeAIdSUJAIIBaxhX9zZFWRwIbg8PusMdSDOZkRvGiDUCjcW2f+TJDYtruQPdBP57nn0mvLAs9f6FRRmf+XmED7ppmkvxUAEzTunHAwRXeAdXD+WWmgOlTN8m6yFFoZSaXmQgN/C7OuhPM8SIA/zX91ys78r5Ms49NeO4LAjrHU6CDE5pCxtcazmXEi2w3H2MIP9iB+AmD04gKddUnOtBpCIR+pWRjEoe4i+kwY4u0G/Pmcnol+KryCW5xAuAkkaJOKrFIE+VR12/zeceyPqdl8E3urVwT2EePyQvoacHfqmjH+M0v+XtP+KcgmE5pajSJUzbqS2aFZv31Yz1fRZTTzDzS7tspF0HWKDw5Wr/YftEoeTFmIc+7b3CthvJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(22082099003)(13003099007)(261022075727099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NiJNMJOKkc3o3rfx0WGoP+FHUCKUktUvrdxgbFsTc0tdwvbiBCi9sJYtyMXX?=
 =?us-ascii?Q?UokHGx9vydCmTYrz6I/IQoCX2E1f0D/rUHPB261vS9PUvzgxq+QkgQT3fDKF?=
 =?us-ascii?Q?6Ys8UQn0LmZITBMm4rTfGwds8HnsbtO7eIj5D3A1u5M7J5V9tWXAY0HyPDuX?=
 =?us-ascii?Q?DMrAyHkxR6lwdoNQbtwLd/OvuCDIDSLe1KEVV781zStPM7NOS03BS2Vr7CxF?=
 =?us-ascii?Q?CUs0myvhrK6SB9WWfi5NSUxlb1QSYL9qOqFi2W9NnysEHq2n3IDo4KXyPmTd?=
 =?us-ascii?Q?/sNYbWdvkajozQ86DFUgxG3GbWpgh5EVFTYlUMT9WyBTnD32kj+Q4pzdzYhi?=
 =?us-ascii?Q?c+WVogsvJwAVNwzbdrij+H2sbdUNF0ZINP5ze5SD2a4sH4EJL/DLEOxRg08K?=
 =?us-ascii?Q?DAQO6L2l5X+rGTurEfP3xXO+Oh89JpRjzMZAgGbKiGmGIGdp/AVZ61zB7n6j?=
 =?us-ascii?Q?HGve3E8yZ6HSQvUVaNccw/O0WDIVjHCDVCNbkjwLTleo4WIermW5jywqVIC3?=
 =?us-ascii?Q?eqRqmWMtLcWSLs9C8wab/9NDx8vU0diBc8Ylwrgi6xBrlgYLhOfriOIVdK9R?=
 =?us-ascii?Q?MrrplJyNhj+lkYTh8ONkM81lStWsyr6/Owng+9ZAO6hqLMTrgMFyFMtKB5oY?=
 =?us-ascii?Q?2TgG82EUT8JfnxDqs9Ah05UuYYFCO7/e6xdrSFOe7NTIVQp8MzWW37ZCOmz5?=
 =?us-ascii?Q?5/mjFPZ1JOr7awknIYqx+P5aZZSirRcIsuk2RnXZ09yrRVZt1CaLAxeZ3EN+?=
 =?us-ascii?Q?I+HcPlEtEx3sgdNLb5aS+QxEgpbMIQCqELiqZk2WHikgPyayjZeETepYPbX5?=
 =?us-ascii?Q?JTfYnpv84yEDs9XNHf4h4bbPJZARnUc60H3BykglseGoMyGkSpxpn+Pfdxks?=
 =?us-ascii?Q?e7K1HntFwhjwBZRPfrWRe6udSjcZhsuihqtdVHQkT81EKVwNGhojzObcEXdZ?=
 =?us-ascii?Q?wyhTzUW1oMpX+IQZ7wtyY2KCNNFca7BpW8nUKcZBXlcBEudNLkffTrpiMoh7?=
 =?us-ascii?Q?eqO1aThmbCWvAJFs3L6H4tqpQsTXWKjxP5NXIX2I74zwrRBJd62B2cU1H+bJ?=
 =?us-ascii?Q?8WYPjJ0gUCh/Snud9nih2E1W4iSdn738MC4pjpzXmlLmvItXvV7d6VOzCoyr?=
 =?us-ascii?Q?p4bo7A/L+i1UM8n1fPtGiiV8W++DGqnFKYe0I3n8QGwkXxUxdbBhMbO6TCYG?=
 =?us-ascii?Q?+YKhh7c+nxQw7eFzLfkr4RVox/0lsIGLOA9Ar1OtMaZ+Z8FFGrrc/aPefCe9?=
 =?us-ascii?Q?Jso0KewFZ2SJtu1j8d6bBLyp9Wnh1LBJ8xVKMLr34rdXVNyPerf2wGvht8dj?=
 =?us-ascii?Q?xzWh0NluHN1i6AXBJ3tWz8psbb3w28iDZTzM0JCebU+1vZXGZ8VqUJNInaTF?=
 =?us-ascii?Q?eRmrdW/rx1fr4UduGyOXt08qz28Cqyp+0FYeuMCdiiQ0VMpcNqPkXgy3MK9o?=
 =?us-ascii?Q?TdD9zyXGDZcCGTyjmKLX/gxOKi34vMGKCq3ibQIDhGJJ/8i/ra9pwPmsrq43?=
 =?us-ascii?Q?W7MPNLSq62w93ZzNoeQazBkM3RAZQf5aPts9n4HDUE6QGNR7r25LYuV2VybW?=
 =?us-ascii?Q?IDZ8s1xH8GRNTXOTDSfIp7ze4X9xFuLWLB8Dvy5YCzxIZsG5sKdAv8MiU1TN?=
 =?us-ascii?Q?etaa5bHbyMaIUtIgRtpO4//TBiEHxrUbr7+ecnj0/wbBlTvsJ0FOkS6ww17U?=
 =?us-ascii?Q?VE6+H3LRLkURw5iqgFRFDCE/avLhBA09YfedmaRRFYako2s/qBalPRVYxcV+?=
 =?us-ascii?Q?QBHbBVYj9g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b27f788-5e78-44cc-5a16-08df45878e0e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:21:01.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+GpliGA/I3bwR4E+Zy0UP6XfbPYjPp9q/F9tKV6xXPPu+hQfupNi7MqY3LEVkZZw8D9Su6kJXUqobKuG5bBVNZOurDAoq/tPuWFgGyRpMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250562
Content-Type: text/plain; charset="utf-8"

NVD[1] lists only 2.47, but PoC ([3], attachment 16881) reproduces the SEGV=
 on 2.42 and 2.46 too.
So, backported fix from [2] to 2.46

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-91781
[2] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7322e9bc=
30cb282575a701c307851fd3d66fee68
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34449

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../binutils/binutils/CVE-2026-91781.patch    | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91781.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index f798d6f1a0..10a15f564a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -43,4 +43,5 @@ SRC_URI =3D "\
      file://CVE-2026-15003.patch \
      file://CVE-2026-18220.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
+     file://CVE-2026-91781.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch
new file mode 100644
index 0000000000..ff14147097
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-91781.patch
@@ -0,0 +1,36 @@
+From 03e5dab2f6f1b3ccc151722f189642614fa09f13 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 30 Jul 2026 15:47:05 +0800
+Subject: [PATCH] x86-64: Return SHN_COMMON on non-ELF input
+
+elf_x86_64_common_definition segfaults on PE/x86-64 input.  Return
+SHN_COMMON on non-ELF input.  Linker now gets assertion fail at
+bfd/coffgen.c:575, instead of getting segfault.
+
+	PR ld/34449
+	* elf64-x86-64.c (elf_x86_64_common_definition): Return
+	SHN_COMMON on non-ELF input.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-91781
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D7322e9bc30cb282575a701c307851fd3d66fee68]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf64-x86-64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index abf97b2dde5..0d1ef1d38bc 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5518,7 +5518,8 @@ elf_x86_64_common_definition (Elf_Internal_Sym *sym)
+ static unsigned int
+ elf_x86_64_common_section_index (asection *sec)
+ {
+-  if ((elf_section_flags (sec) & SHF_X86_64_LARGE) =3D=3D 0)
++  if (bfd_get_flavour (sec->owner) !=3D bfd_target_elf_flavour
++      || (elf_section_flags (sec) & SHF_X86_64_LARGE) =3D=3D 0)
+     return SHN_COMMON;
+   else
+     return SHN_X86_64_LCOMMON;
