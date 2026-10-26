Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40072.1793010714082523059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=robBcazO;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukmxEemfXfEvW1Aqxvb+aS9KLX4remJFPVStt1NXXrfBjbXjdDd6mLZdZ/Nb82wQOjgnMDjqWuLuiP1K+6xS9ydDfpOeq/S2OOfUr7AitKdEO34azP3foTgK7FYfikKmkFhqszNC5cjWm29DufYOs2UZIW3PCawFiulym73FxHoT5CuEyjYsJHkApI3n57/BymxocjlOt22rgjDjOcPp19FlInHRI1PbYmHs5zWeO1k1AscLOSWKCCcGSSRTGpN54WtzBjprIa0ah1higkBrVX7CWBQSTMQKxQuleDN5jJAlwgQRNzeYfwZgutj+K7lNLjktmi3s9fC21JSwccmuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG0qr7nXe74K8vEjWYcq4TG2G+RmyGgpGGnmX0bBM7k=;
 b=hj27+8Uf7+gv6dyvVhfEAVF3fRsGYYehX/JTEc+LUhzdUlu7HuDd4YxrO00UMnV+kQ/WfLNUdprLhZ1RKfLfvdYiVeJ0ctysFUPYYpYf3960wcLWnxcx5JAnb7GiZggw0sjK929fVgxLUagWnzamxLtD3boGBTQCNeZgRTKja20bSZmajs9Erj4ipmqyJtqIRkGBKWi4A8LsvKx+MJW1ntMv0FzRw9XAWBa2EWGVm8HMurnekEyzJ8pnyIPwxm1tdc264eWY4cQUsn4XFTAbZNtSS7sedu1HEkZXjMCgNCmywBVaBejzoyQ/EpluVRUriN/4PAp5/sdXKTn4vdSxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG0qr7nXe74K8vEjWYcq4TG2G+RmyGgpGGnmX0bBM7k=;
 b=robBcazOUMT+XG3F9GJgyTnP4hG5OcjaxR9XoOhfC61drdwSEgHUzJrLKqxJHWaulqaTLYp+5iKsr9qakw++secyXN/p9YbKtwhhobJKyCklIqOpcgblINDcES/OrhoDntOXywKrHih5gJmXJunXmQrQbzgvFiXi2Fazj2ibknO69DW4BEiFNu2POoIO2UcD28jLzESkj4gHHyRnnLzFMtYGnzuTpknHSh/MNnBBhpQlCZa8qyLd+9bcZgOmlncjUPxDcKM9bM/+VUfpHLEM4LsnRDZWSNtJlsV3XZ0o4LNkeRBRZLsh359esEI93pK7a+lZvssSmQ5WTa0d6yHifQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:56 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] python3-jsonpointer: upgrade 3.4 -> 3.5
Date: Mon, 26 Oct 2026 11:31:36 +0100
Message-ID: <20261026103138.3137-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1a90c9-a37e-4bd7-4035-08df334c5c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: BYv3SIQwO7zzBfzRfUUenLksvv54PzWiZ72t9Gg4VicEJpSykNru2olGJ7EhlxlSmkbaBRjP1KrBL2hhpJlGWbIQdnCzHP7SDDszkK/zzluoBWLu9tSohQRVX6r5IUkUlumZpJkVHXETekJhxuMX/wSRaIiVw+KYv2x90a8zFqJ/vA6qYcLzmjpdkmdLKbLYqNGtkjR3OitH0fPS5FjvattV4qqwVxuYf2iuNQPjWeVqOGTsVaN/RK8QmiSF2CiG0jPBaPmboCk9nFI5A/O8yd+758XL69j32BGqN3oTBlPubjeS1lPSIj2w4vUfjFRWG3XVukxlY0O8OCkIeFH6bJpcmQaDBKPEOJ0E5KFcrcMczyXvaRJ6xqX+31CmzvfxI9ODlYV+rEhFsdvZDVFsVKff9zVQT35ZOkx32BPSv4KL8ggYekrpJeOMc6dSDW0Zo6qdXKhA3L9IGR0Yk+E1A/1Jo3zvJYEj2X5oEV1KpDBE9caFvpL1rhawHKRswuDdZeQ9jw911wLM++X8SiKgnKp7NwNrnqjGmy6MiB46qEr7ibBj6xh4BveDhVickIpx+6yCpuvAzE7Rz1D+WR2P+TGcy25JpYkNXAK6looboDvUdKvxyko303WyAHwDc5JalZSBoBmDm5fD5oyr9rM9OzihSCWuNdRI6VyQ/tG7hms=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KTVNcCEcoz8eRB7PXifYDT1ODlA8y0Y3BPgrRY20L1AS5oZCRt0NqZnBfUcC?=
 =?us-ascii?Q?Dy05t/moF6VoOEsljKafnxib+8mN9CTTukki9UbjNjfi52BFzNCwPpjWVj2k?=
 =?us-ascii?Q?fJDWYk9JJyeOnLjSg3aCF6QlW4KHyAjhxUq7tTzAPbfsjPTXTscyuMEQ0SjX?=
 =?us-ascii?Q?e67o0Ne786ugoStB8wR0xfTOt3k3f44B6yzU8BJqHHvLDE9Tm22FkvWfag2z?=
 =?us-ascii?Q?2mjYK96MMsJObcr3V/V08SFcna3SKx7h20abwaZk2cvpaQlyEmKz6f5hZV6N?=
 =?us-ascii?Q?sqz5Qt5t+7EVuBfbTgZ6Q4746Di67/SbYrqkLqLk1f1VeT4WkiNnxtNOUXdD?=
 =?us-ascii?Q?kkqoW/w+dQ9ny2AyhAX6zX9fBxb5ai2dMsFUxpHSftTZ8/SmWzzMjeC9/Ou+?=
 =?us-ascii?Q?ZpenfHdunP9Mfq0bVoSMmTPWwgQxtATAV6+1PJJJ69sL6VzjS3cKJf85lm/8?=
 =?us-ascii?Q?TeDsY38SMNNKyeofdUKiN82KV/7pwmMa2gppxweInLhkoDRtfgVA9+ztyI88?=
 =?us-ascii?Q?uaLlt8xuRSghXDOHqaIhqIAz3CfH7I2KN/Yp6DEpaiYCjiAnROv6nMrjk3ax?=
 =?us-ascii?Q?9nHFGH/qMSGHhlyiv2QMNuzpgp6W/3Brr8tOeUiaKu4UAVq77UcagpvAqlr1?=
 =?us-ascii?Q?miUxL99rDaJ4HRAcJMKZHEFn3B1gbuBM6AiC2fGbg9x830p+9zpbapKFgRkn?=
 =?us-ascii?Q?Uheox+1CUOL/v8aBhNuey0pAvrl5gNMh3dYmC8bI4kPLIl4u2X0ZhKtzRsn8?=
 =?us-ascii?Q?HoFlwT8/EEUoqAgtxdmpEah5NLPvsuCgVyiOCR7Q3PkDuucXE1khkz2GZy+x?=
 =?us-ascii?Q?Fvqr5o0STQJW1LwC77P11E1pWveTTJhUDvcULf4LPfdzrF07fetfiCgFETfx?=
 =?us-ascii?Q?/pH1FqTbgge7t1vqTqTG4Lwl1l+omwSVi4oYMRpJN10r64WCYzIP6w0W1l8f?=
 =?us-ascii?Q?aGDRCayz+uB7jhC0yg1kd31ods4q1AJhhezsK2SY5e3cF9RraLPp1xZdWwHq?=
 =?us-ascii?Q?v65SdU4JbcW4MqzCyna/MmfVFOLjeTHRZHS8NwDpsIZYKG+5xLmJzwQGfizm?=
 =?us-ascii?Q?PRRN7qlu9j2PIUQKLvL3iCU8aISZFw0Ga7HLL8oDPipJUgYtYf/zfJN3eOuK?=
 =?us-ascii?Q?XtkS4CGXoPnbmeIYUiY02da6eQf5zwOcYS8e88WwQgBnhdtND9HezaMbs3pK?=
 =?us-ascii?Q?7RpY3HsRBa/R2Whw5Iv4DRAQoC8cn5RzuRumozI74lWXCqlqbE3rHT3ZN1B2?=
 =?us-ascii?Q?LRXQCUFjuf+KJXyT3GMfdow60nTJH3CXjiCubJcREt3lusUf9bE5C2vJ4Kui?=
 =?us-ascii?Q?lds3Q8p8weYICIg0oCcWgQtw8jwRdy8FjocNdpGR0Jy9yv1mlCYa7px/4RQz?=
 =?us-ascii?Q?wG/KM6pU4RpgoyN+jz6oPVvb0E8ojJ7RQeb+f1IGUgAPCVjN3AGDtTlKOx19?=
 =?us-ascii?Q?GXQG4jL5VMfmmOk7S5IFcB8Nuq9MoCRDbog8C/3l5t4mU0RKEtDAHs81kYSY?=
 =?us-ascii?Q?ogygIguZdIfC/raE9hcxqOkjO1LxUXQwQmTYw3uWPJXm05zft3/WhmkzxTNW?=
 =?us-ascii?Q?EYXcq3Wlrg3XR2AHcsgcNHPindX/pKBxpWne9kVrrytdMGYukntJACEZrR0F?=
 =?us-ascii?Q?hz8pf2+9LfGSvjIseAG7IKmQ6OtylnixPK+ATFrSGve5tsBe5JZwUS5qLyTq?=
 =?us-ascii?Q?AslL/SkL0cKF6H3VodeZQMl9ogB3B3XxFEAWAVtHd10O1XuZQiWQkRU+UvAV?=
 =?us-ascii?Q?aWZ44RKYig=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1a90c9-a37e-4bd7-4035-08df334c5c01
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:56.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/4ON5OSxhqITyES5lQB6jdWOXwV5xug7wkes4dNyA5wtlgQbA5K6+el8RQR9mC7EAL0aA9osmlLdPDJbMWNle2KEPOAL9pACr4oaYwcmtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248669
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3.4=
...v3.5

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-jsonpointer_3.4.bb =3D> python3-jsonpointer_3.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.4.bb =3D> pytho=
n3-jsonpointer_3.5.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb b/meta=
/recipes-devtools/python/python3-jsonpointer_3.5.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
index 1fa8ce75513..dc39b0ea383 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a=
329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "e57015ae65af3821c6a3976069860789cf326103f38b22b217=
8d41d021adad25"
+SRC_URI[sha256sum] =3D "81f28618a019cf1b011a6cf757439737972de1ccbeca2e1f86=
dfb4d661800792"
=20
 SRC_URI +=3D " \
 	file://run-ptest \
