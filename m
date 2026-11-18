Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14963.1795015219320867461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DqFqWcl1;
 spf=pass (domain: est.tech, ip: 40.107.159.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhC+QesXnS46LBAOF8iuBdpo05ca01UxItaod/5HaXrAKk/4y3O4ma6xO47rbb4eZBoUSpudW1dd4YL8c5idi7gOYZJWrBk8yAOKzpWnU0VeI9LKNUbAwkVvGTwjI/LLtYb4N7tC8tmnwdiim/rdNZ8wWZKNGe5KzgMCiRU2o97lflIozTFIHu/kY4Sf/d6G/dxglkqVExcRc2H4xGfbTStuveji+MqnMruyfjN4P2Eqa+3fEbp5UcaTkV/JUKCOVPzUjOXP9aFurBqP5xqR+/7HhSfSvW559T6+C6t/yRx6oSAtvNdBE+A06aT8qjcDEObBWMj3IrYgDPOcglJDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euGraZPUlidT9v56Oo7YhMD3FCOOuQDwZ5Qj3CxwN5s=;
 b=S18bA4osxSHwvXT2/KpIYxvCtxL3uiXjzDxKaO6nk+YTVxK8xHFx2sAKQUDP6eosyp1cpbHDlVrE82N5QC9k+ds0Yzl1tO37cHjN0N5rJSIBIhlXZMjM+FyfF9jD5Gp9xq4zjdFB9crpB6DU1cm1ws14ob4L1CIS99j/6YoF1Xai2B/6hRGJ4osNThK2x9gJpAYC5eTzy9Xvs2NtKj/jtiMtYNYMeh/uH45NZrxzHjmW3DlpD2DW3oG95PzVO47RFVsaQDjdNcfifCpQawGhYplYTDyn1UDDSnOcCu21FQEDXhbzNmKWlh9wrOx4qanufjUvs8/T0PZ2AYJXM1YFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euGraZPUlidT9v56Oo7YhMD3FCOOuQDwZ5Qj3CxwN5s=;
 b=DqFqWcl1rGgiS0psT+/Wkurm5nNu8C4TPa202GFer0gccKqVtODGx8xRoESN2pfqgwp6Ghg3YjYWghZByAQL97GVM2q167AQyAA4ckmSZyRpnRU0pGQMkXsRxU/Gz5U98pgGUEC2TIc3E4UdVoVEFXwcKxwNozTpH/SNMfNbZ7BYr/vsv+og3zDSWZrhWxe4XHnLzxL3KER/WnrmZR6suFdlCBWJUuWIkMd1+Fnk/Ip/l7z3S/pK2nIELFRJRNNapuYBtkUjd7ajYsU8DaL2lLGCcgGhI91x/jYFu06eBDx8Vbe9xv6Ui3PywXlmbK4P8WJM/NuaAMCG66K6skNM/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:20:16 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:20:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] binutils: Patch for CVE-2026-90828
Date: Wed, 18 Nov 2026 16:20:10 +0100
Message-ID: <20261118152011.24213-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118152011.24213-1-jaipaul.cheernam@est.tech>
References: <20261118152011.24213-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3b8668-44c1-4e14-c706-08df45877341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|22082099003|3023799007|13003099007|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: DOjYe2BgXyAHDyGncWfqAZJ5LNyRIsmn84IcfHCKg28QKzcfPTM3fdWQaDY9SIOiW9e2cDwjfJ3NlHcUhCf/GiXZ82nqTTOem1OEmfcINVzMilTmnqLAFuqPwWxxCQVHnzq1C1oii8f+vmLr/l8RgLhSl1jnYDpUnYp+tqBSBriC8vGSAiKKlAuAgVJhJn4aB7z0fOvOxCUjB8BfdDZzGtlMWfT/8+UR1FEf43GIRrKCOu+kjXwbURHOUjMg4OyEBPdpS9elwdOZnrU0Fg7AIiCumVj6BTE8bjD0loecRoUmBoADRgdoIsFVmBztLS/N3XnnCP62DhngYyeVPzBN6GUH1t2wbNXAIkdCqC/DDwQJEcGxxL3jN+XG02CKfWlvilzxfhxP6mkC3udiRWJv5gTqOeFQQ77YvzRA9azWgxVlW7Il68iYdFZD5LBsQ5EMT0KhwizcS2r/bJjAmOMf3Ayi8KEnodBtdZCqBzpDVRUXPTnYO/6jWUVcoexbfcsGnh5DsofvDIOWU67lF8a88rPLLp64P7Wr0fw95zj33JDumjWfg4+ja45MkPafPRBa9y2vMZFNZSr+oYKoQ4SvRUNe0BlIJLvO7hbOk+9dWpfq3bFMMHj+WaM/ktsNTQdz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(13003099007)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Jec9G20Z98MDZuaSmq8cJiGcsyMFjhxmsyscyAIGZNDw2TCndeR9qicDhNp?=
 =?us-ascii?Q?2uA8TascVQRTuZr73ZxETu2w48QnyDrEhD5c3o/oGSc78+0JfsgSDUIoek1i?=
 =?us-ascii?Q?hdA1XRht44AOkMS+8Yrm5Axtjmjwuq53GHGIE6BZKaiqT27QlXWjiQ+Q1odr?=
 =?us-ascii?Q?BZgabSRS1ma/30aNOlpPJKFnctbP40l/Lq2cX2QICeNmj1c+RbiEEY40qfZa?=
 =?us-ascii?Q?JMw/0v3N/wxXVoHcnp2gGdFPDMvBjvUck6I3+JosnoRjATep96ld8HIqBuRd?=
 =?us-ascii?Q?SGourVJLl560x43PDkjneVOQuqeVfgCQ4gBfwsC1lwqzuzetyXciF7uMloRx?=
 =?us-ascii?Q?XNj8BOQsPyiPKpRbH1DaweU/Z54CPLJrR5eKw2SNf4cL3laKlYHlaM15eThc?=
 =?us-ascii?Q?qEFUCfzrBNKtCIpktWgSkE+ChIxc6JPYuxAgNXLlfPcGWtAo2+/0yxHD75Fl?=
 =?us-ascii?Q?ybmRg9fIRatG5zC02Io8zBzfWH8yilCx/vATnm8UDkIuDbUPr8fyJBqz0mC0?=
 =?us-ascii?Q?l/Pzefhs9cMrf79IvwEJ/hI+YK95Eda9aFb3deUJno8r9N/uerM35Tf//9O+?=
 =?us-ascii?Q?iFpBEAPdALfMfZdj7vQEv3XW9fIM2NcNbnPhYwAls0UQIvPVcQnfiAJgiMSe?=
 =?us-ascii?Q?VTJADZvOP7+NbbsTYsPKL15hpLYSGr6b8sAQ8t9YYnT5j82CQHUlXny1+SmJ?=
 =?us-ascii?Q?bhGY+1JZbwfxYJSdkc/PAbtkHMkjpUGFJw7tFL/rQ541HbGE+iFb4hWQKi8Q?=
 =?us-ascii?Q?vlfchEQIfHw5E1a1rPJB3Fc3zjJJ4p9RRH/kdyxSkpz9s3UCTaVLSp1Zodf0?=
 =?us-ascii?Q?WcJa8C0s566axhy9tdnfgI38+zSMUrxSiB5Q90qT5TOKn3pqN0oZPU7aljzD?=
 =?us-ascii?Q?GwbqIlC/wvOh9QYIDqJxUkZbxukCLZGWmaOpOnuyWvnxfdN3QBMbls9rq4PT?=
 =?us-ascii?Q?PTcTQ6B9q3jKN4QEFIfSY9NFV/XShXtSQE05g5ybuPc+68EgyFbR57slE7i7?=
 =?us-ascii?Q?dGQXUmaP0I8o5g40R5phHpkNMxaQJ+FG1ScOvICE9lTrd94/68SHECr+lgeA?=
 =?us-ascii?Q?qB1zDPNiwMu+76FOiIwkXNbwOfyLPWWV1PSC/44o1XF+jDWNorXIwxxgNN2r?=
 =?us-ascii?Q?IVu8XJfQFF34MmqZhiq9OvOnGHfVopdrbTfMj8ls7ewzZlzA7pH9lqmXgS68?=
 =?us-ascii?Q?G8/1Ko/B9yf7OJweljWzek/GF3Dc+Z3cz3D+hJwiir+veQpQXOIJwGv53WWf?=
 =?us-ascii?Q?wjnn0Jf1xmlWrwDQhnvcQM/nUF0tKwhi8kAStDSfCmmtd7h4ylVDKoQayCVC?=
 =?us-ascii?Q?LATaXMN+u75iEXVezc7Y7ulQ0cownu69Td1h6BklyLtEJ4IPdRyqHCImF4Nn?=
 =?us-ascii?Q?i9kaEl9YCS3BoBs+IhYcJFN9WeEmCO46RBb2x7CKm9kbOq3/z5+xc2AIq8q8?=
 =?us-ascii?Q?3oYMPWgEfUbp7hLMoLTtPlSR3sDgn3Io7UV+iH6pxhr3/KsQJbG9vWDZwQQk?=
 =?us-ascii?Q?CSN1vX6pvnu46NVhvDbStD3KM2Tobx5LzOwXrsefzpSm7s9vkiBO07z8hrC7?=
 =?us-ascii?Q?tviDk+j+mtwO+C8uMjRY75K9x2jRaMHmtUgNF41NCxWqYN9MuZgWEsEKSyBf?=
 =?us-ascii?Q?ZJMUbcv8oFV1qJ4P6AOPu1sFyjX5BwNpH6i053L0LtP0rXwA8wefqiD3INiK?=
 =?us-ascii?Q?06qGQKrggtcX3aAYAKdaGcQ8YUMkvZKCLvpLSz4BuXJu/txBz4O1XUQoxXlZ?=
 =?us-ascii?Q?Sgqil2oYOQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3b8668-44c1-4e14-c706-08df45877341
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:20:16.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbKG7ogIETEpwf7ZFi2JrmXlXVNTOzl23C5jIBdvC1k9dkw2F1TQzAqoiP7QzUldLaxwUMd8neTwqtSDEjptlYzjatFNRZhYzHUB0c4+jAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250559
Content-Type: text/plain; charset="utf-8"

backport [3] fix mentioned in [2] for CVE [1]

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-90828
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34450
[3] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D123e4a5e=
ab2db300b44288dcc1a29c903f9622f9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.47.inc                |  1 +
 .../binutils/binutils/CVE-2026-90828.patch    | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipe=
s-devtools/binutils/binutils-2.47.inc
index 5b57380a48a..2807ab84e8b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -39,4 +39,5 @@ SRC_URI =3D "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patc=
h \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
      file://CVE-2026-91781.patch \
+     file://CVE-2026-90828.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
new file mode 100644
index 00000000000..a84e1fb8472
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
@@ -0,0 +1,29 @@
+From a8d25ed8b1ac9d8e47fcce90cb901bacf863074c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 22 Sep 2026 21:27:03 +0930
+Subject: [PATCH] PR 34450 SEGV in elf_orphan_compatible
+
+Don't trust that SHF_LINK_ORDER set means linked_to is non-NULL.
+
+	* ldelf.c (elf_orphan_compatible): Sanity check linked_to before
+	dereferencing.
+
+CVE: CVE-2026-90828
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D123e4a5eab2db300b44288dcc1a29c903f9622f9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ ld/ldelf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index 3d36e033b0c..50eb8d18799 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -2087,6 +2087,7 @@ elf_orphan_compatible (asection *in, asection *out)
+ 	  || ((elf_section_flags (in) & SHF_LINK_ORDER) !=3D 0
+ 	      && (elf_section_flags (out) & SHF_LINK_ORDER) !=3D 0
+ 	      && elf_linked_to_section (in) !=3D NULL
++	      && elf_linked_to_section (out) !=3D NULL
+ 	      && (elf_linked_to_section (in)->output_section
+ 		  !=3D elf_linked_to_section (out)->output_section))
+ 	  || ((elf_section_flags (out) ^ elf_section_flags (in))
