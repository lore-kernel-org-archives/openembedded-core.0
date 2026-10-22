Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18860.1792661694418675892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AOtUaiLN;
 spf=pass (domain: est.tech, ip: 52.101.72.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUOX3qKtGpfxc7pQ3J93vU1LmJR4QvrM0Ky1Gxr1lfrkynQRD4nfwkmjVq0byc0IayFlMNeDBIoh7eWQfdODbbeB+Oek9eriSyf6xexqitdG7D2274yZg9OijJ4OTJKkPquug+om90FSg5HiQnCmhlgqiQ2TeB6e9uwGQmrvhrsxIOijg7ycdYk9usuwQgikoKFIO3Fk3fasUEVkEk+nxGcPl/LuT1fff+kosxPgzzOmTpoPo7+jEx6hGOY7U74JzGBlKSctIMUdXLbtCBCvDvlaMjS6STx0u8njlQK1pFMJ3ubjqtm+iJsFB59MrMUizBD+eeEFI/UI9uQ1TrOXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI/jAtZAEukhoqTz2nkMGLoD4bDfELB4kBcEFhJOzC0=;
 b=X+d3PhlHC1TvYh1MCPzCi4Hf7RkY0cLNi4PAetF2R8+pHAi+ZuBtH/eyJtj6je1znyIcesljxosKIO7+jNY5iRQCM89IhOynqJ9bLB5R5atvgrNNIj0huqhbm1a407FYW8OQhnCh+Ge82/ETou+br5eSA6hZMyJVAdGARJ5uKLJSsK13xLMnb56SbpuHak3heBqxHfh6nNI3Fi4C0y9v4ZXRh3AnQQuTJpRci/H6qcXRmPHah0bYW/sMyObhKC7NVZAGFWi8H9DwBhDtQo9MdvIQf3DB7UGCSV9yAv9BHXGtmRlQyxaLE6FdYF3zVslol60oZaLrp+j9m8VYn2LH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DI/jAtZAEukhoqTz2nkMGLoD4bDfELB4kBcEFhJOzC0=;
 b=AOtUaiLNLZKlwQ++UpE3AbJufcOrhKb3+wJcUS27XeKJkvRUzq9gExAPW1BcyBe4P/XHHtgDxr86g0PQyrEAyn6adczczGJ8o7pLsu1s6mJvBc+LWWVel2rqt0T4OHdS+9RrqovE8GfcySeXHNE5ojt4WlEuhW5pIbdT3+3hTJBVDf2g79EnljSqxsC65CTN/M7HjgDbFghyPcTn6A7STL+L/pCvhF1RtYuAd9ITrfI2ZIx/Xkcu8tmaleF/oIod2ZOe++Q1JqJizY2W1haFbs7EVE016BK61B4qjPldPbMKM0lupR4z9dFhoBo5fCm9U5fXf7DiU8eHDxZ5nQbaFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB3552.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 09:34:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:34:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libtracefs: upgrade 1.8.3 -> 1.8.4
Date: Thu, 22 Oct 2026 11:34:41 +0200
Message-ID: <20261022093445.66335-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
References: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0248.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB3552:EE_
X-MS-Office365-Filtering-Correlation-Id: dc170dc3-7201-4216-3079-08df301fb75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261021121427099003|11063799006|56012099006|261021123027099003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: /F9uBNRtuY9oLX8kOqCCf3V7RxZtu/YqvtM02NqOM8wp0lbmCKM0FE9AA0DwVqlNjMRCXzNmTEt0j037axzbqg05cQwzZBxuj1sqMqTJWxANKEcK1M4wOczSBxs17cJ803nI7aMVCVoZIlisQ1Mnd9OFd8yTe59StIiuZIrrb6PstCg9JiSKXhZRjdAXX3QRRFlXho/+8ASHak/Ld+hmSw5wh+dTZAWnvlbiMOfX1Aq4RR+nrCj2c3Q5OGnHH9AmOVt+9G9e1KDSh7FJxfQmfVBUbF+GpAxEJthJoTiFK+p/ro4SvhlfcTzdQoJOQKbl23KW7bYI+5UP3DKLuRLYM1ofBCs0qEssv6Az/MNmjFUJ5+Atl0Po9xlyJrq6BG5KZA1fG5Zm91194Vpk1RPdOQ6+6FwZy6lWztfVYRJy8lmYRwcP6VGRQBfaFiqVJU1qdJXKKmQMte8+gz/ekGJNv9arPNNAf2AG/HmdN6AvdANJxn/4x0jHJO+kATJ5wHKR2+3NeFHGyuQ3ambb6dopUirx8U8jN41wb40ebSRxYJhhT6FOvbjnbyl4ltfggRJ/k17ghJ05HqJjifNBAootPtygNNHcq9eSNGGnvE4i5ScXruCuxkoGeM/gs4/SoULl9H/vzlfEpJIFTSt7SPq+QNrRLTPwa8W42PIXu30SmgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ISe4YcSfnUtmZv4L+t7TPn1pvrUsw35KPy63LxOxLDCyNGqfkCiG350Z/Tss?=
 =?us-ascii?Q?DXOosBgPUQMhyuOS9TjtE9mcSOOOeTvkhzMXAxw+IW7DhBCmcw7/vuf0qSvR?=
 =?us-ascii?Q?iD1VgRneLOSAnAhpE7dBiN2isJ4qxOczlCYNJioJqxbctDnNlBZE6XZ6Wlp7?=
 =?us-ascii?Q?4DUDi8af+4mxB9pwzby+FIz1CPuz27yiK2+tmHhukJugmox2QN/So7r1cH5i?=
 =?us-ascii?Q?wODCMc8CSqjTMCQ1p6VsBFbSlFSGMMH9z8f17R9q+EqRKAD0ITJqRiIo1VdL?=
 =?us-ascii?Q?pOh25xgy6ZpmsebHAILTFqEweRtzrlpf4OLCFrL5gKxo39sWzsVmHmfT9Pe9?=
 =?us-ascii?Q?QAioY/1yWoFExPhwIjbhkPwzVdcypGqQAuUE7zKNE1JRMUf00wV+uOf3fSjU?=
 =?us-ascii?Q?VCMzsGnqrO4db8tb6/OcYWiO8WGI9zVgDvQlvT8w9L/trVZowjaNq7jYQkG5?=
 =?us-ascii?Q?8m1PKUWkZR0sWGS/d3q205WP9N8c2JihpIsvHmFx5yjHPLxBY+dQbvHBZflv?=
 =?us-ascii?Q?knebS9d7q5RgOwLgmn1+k0IE8aN/27nwJzPfhjw+hs+L4WAwqJi14yJg190x?=
 =?us-ascii?Q?vtjHjZnaztze7ZfiOrVkGxpN5zZScVAC4EYSoT5YOJTmcPRrwHSqjzfyzC/J?=
 =?us-ascii?Q?hW4Isl/CU2iTq+CB3XKhX93CDl81AluxLJxe4i+SPb7LHHs+T0tpsKTv/upU?=
 =?us-ascii?Q?u3pNpBUVbVGojMb3MhbTCHOJI59s1DtwqscEVYW/NmFN3L5zQm4LxibYUeVm?=
 =?us-ascii?Q?kn6dc8ASYK0MeTTUwPG7b95t8jACFpnHBb9wdqFNZxoZv871jSiIeu6IBM/g?=
 =?us-ascii?Q?MQ+UFESXUeErhBtUvPk3FS2Fy+WPxC360KhBva+4Ju3wMFaRY/abLHkilK2H?=
 =?us-ascii?Q?NWvn7n9sv2cUsy/AsOY67Pi0NMuaiLPOltQJGr7LW8z//tXJbY2TAjN1AkiK?=
 =?us-ascii?Q?jGpZ8kuoxuVjJYeNthaBWRSX9ZzYLYbvIXLKjADWUvoYjv3BhHGbHTgqOU9V?=
 =?us-ascii?Q?62L3OX+bKuz4SJnvcq0JeFEyrRm60UDEvAhMwm9LYH22GTTaSSiBjP40uvhL?=
 =?us-ascii?Q?aEf9oG1frOil9zpCaaDRfk6CrYGfkwou3mk9enVgLJjdd2P23aI8bEYabCAh?=
 =?us-ascii?Q?a6VeUx5GYwAq0+4hd7+W8l1Q3DUaAK63Ea+dYKUcli5DlO5RzW5lQOEdipfH?=
 =?us-ascii?Q?2VhvIa0FW9ICaPUx7LGwDsYgxIv6FZTpTKYY/xTyYObQWOHlrwZL4bYys23w?=
 =?us-ascii?Q?9NNAxlCqWN9QxDxca6qr52BL+vs4kRg4h+yiNyNWMZaDrs3ohA9VUkuFQyyg?=
 =?us-ascii?Q?FfK7T3QwYwv5ZvRSOCJROLQUqyr7QlMQL5H04PRQiWxQEwmWw4Ckimhqaikm?=
 =?us-ascii?Q?J3zEjNN6qAjG4Zbv8pLYyPIywsH9IEI4jtrtv1WsS2dB052mtwoUbXVgZjxj?=
 =?us-ascii?Q?r3OykI58AdeD3CQXOKFYHH6+JlGdY2D3djONKn24NY8yEq5GCCBUMTSBQ0M6?=
 =?us-ascii?Q?9dMh/Pn17kCcJ4LeWwVEX+DMLgCudB4szL+8vdllYt8/MbmJG7/fUPYYZ2C4?=
 =?us-ascii?Q?9Dd5+mjHU/eHeWjaHp1Ls1kwNq/RyDl6Pjx0NpqeNmd8nXFGz2reZDdHe5ge?=
 =?us-ascii?Q?ZQRPjSUJPnue7sK0aZx3kLQdO8isXv7paiNpY+73Y1JeMFgn/zv5EMRYRD0E?=
 =?us-ascii?Q?+sjL42sPpA8CRC5gLzhiWGxrXVWU45zfsyORYZKLMJ0dpR+oSQjQs7ZKg1XG?=
 =?us-ascii?Q?sVgDNPPwhw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dc170dc3-7201-4216-3079-08df301fb75d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:34:48.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IHfKFL3Nb+GLHdo9OAMWoRweQSSFnm0huBmLf6TYA/+dcxbo5wXH5pPBMN6hibvncAEkxRdeqvhoiB8O5VytWiodXWOB6sPP1CIKbBbZDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3552
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248427
Content-Type: text/plain; charset="utf-8"

libtracefs: version 1.8.4
libtracefs: Support EXTRA_LIBS for utest
libtracefs: Use LIBTRACEFS_STATIC for utest
libtracefs utest: Only use online CPUs during tests
libtracefs: Fix memory leak in tracefs_tracing_dir_is_mounted()
libtracefs utest: Update kprobe test to use filename_mkdirat
libtracefs .gitignore: Only ignore patches/ at top level
libtracefs utest: Add tests for clearing kprobes with
tracefs_dynevent_destroy_all()
libtracefs: Fix tracefs_dynevent_destroy_all()

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libtracefs/{libtracefs_1.8.3.bb =3D> libtracefs_1.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtracefs/{libtracefs_1.8.3.bb =3D> libtracefs=
_1.8.4.bb} (93%)

diff --git a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta/reci=
pes-kernel/libtracefs/libtracefs_1.8.4.bb
similarity index 93%
rename from meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
rename to meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb
index e499e975fc..740f5c8bbf 100644
--- a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ b/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a7537=
1ba4d16749254a51215d13f97
 SECTION =3D "libs"
 DEPENDS =3D "libtraceevent bison-native flex-native"
=20
-SRCREV =3D "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
+SRCREV =3D "85030efcf90a775f07453d7eab835681c0ad7187"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;bra=
nch=3D${BPN};protocol=3Dhttps;tag=3D${BPN}-${PV}"
=20
 PACKAGECONFIG ??=3D ""
