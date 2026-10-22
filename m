Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19010.1792661699897180185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bYkoeowS;
 spf=pass (domain: est.tech, ip: 52.101.65.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1fKjb6iH3/jVjiSCMFw9sHZ4mcRDZdrekDeHwvKfmUWMEyxuA1SSyI1MynkNbDYUDQlJLfa5UsIWfZQGSwcocNv+Xo9QE2fye+XttDI37m1e4s3EVKRKXsWsbgX4Xc4VvkDSti6turCOu98rMC2BjXOzGBKRamz8jrWuxTYvhU1qp9zXmmtivxBvFUBTFZueVUnojWhfVMNTzjHUjCNDW2UBOmKrzlCCJjXQ/e6DnB43mQhWcUY6NNNZeaXP5OxgZTNONUXEeeAvmP+UasbfOFJbpggTX75Yqgo1iINSEECjzRjHkaFf1Kfi1iWVmssZ81ZAIKzxVZfgqOoXR0tQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEQKAz6VR5OTPtZRRRYOfj/dFFWgFoJUB2YMSFnyJ+s=;
 b=cpaSg8NBx+eK81iOyS2xymVCLVsBADQOhcRmmf48mSHDVFtSWEeshYUSyoGQBzORrOw3Ln9OLyYolOI1SNUyIK2XmUTCGnNkd6yX5PFMyyUG8AGVlXoRkiwH9QFqHaqACGvS9YrRSbMY/eBOJdFzusV/1cjN5kE/ptH2nNxZpLOqfQdAwyws4endkCjSEcR3pyFmCDcEJi/fwsjhGCFThSjLjpRkdOKXXrq45TT5Kd+0emdT0g5+5PIGU7Kz2MzYu/deSG+dbm1DCrHO+cr4j1AZhTWPqmQDRIcH3TCEGDVVKsEvz0LxKw+Y9hjQOFf1EM+hx9XGyh87Ql3rcskmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEQKAz6VR5OTPtZRRRYOfj/dFFWgFoJUB2YMSFnyJ+s=;
 b=bYkoeowSTH2BkR22SSp/OQcDBTFF4nPZA0ShsubhHeaX8bhTDhoIqIOOKglU5BQ6tYaPpWxiQbwjrVgrzzTrLG0iQ5wFM1VkFgDjyoPQVu01puN9L1SI6cQ1cm279U+7FD/fBjUn1fh8LzkUpDfRa8e3RtWTOMOVqLXE8ie3jZr0pyF3JiMJD4kTWArADIIfE8wQliLaY4UmPdV/ZRTMzSpE8cv+usL5/hsdQccYGEBak45+ac46HTuz/k64x8yPECCP4oI5tHyxxvKPnVSj89k8xKRu3eZg7OgFG3xHwhzSxpXbhHFbEQJ2kRnC8V0cb5kNxEAZgOdL3ZjshXp68A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB0959.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:167::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 09:34:55 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:34:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-zipp: upgrade 4.1.0 -> 4.1.2
Date: Thu, 22 Oct 2026 11:34:45 +0200
Message-ID: <20261022093445.66335-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
References: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0354.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB0959:EE_
X-MS-Office365-Filtering-Correlation-Id: c61645c1-cc89-4ddc-bc88-08df301fbb12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|261021121427099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: GUyzKCgGuBH6y6Qf2lhwzn4i8S38fIXR/maRqnmqav3CdEzNWREERAy47wNL0ShoqkKgzZrEu/3PjMpmyHNvD2d43m20T1S2BvP/en39kIJD1kSUY328ws+fd3KWaZlkAlRJQ8ku4Ptwl/xAQQ9T+5MtWW+EbAvrE8BMahznQB3rnUgMrTKqVP5N0Fa6nA8lrhozCwwNuHrxSyyrJIo6AxlqwIDXRGxAokIj6zqqPJq+YaWg2UUUeZHMGfzMM1/zpV/k6RbMMWmT96AdpPTsJy2vv6ZcEcVNefwiULu9HjXnEYF0sGhuxLXjMy7mfx1yTujbjxGs0RLFBhK2Gl0z9aw1c7OgFJnrDHPqZmEl2g10at993T7YjhcOFcLUwvj927ikjka5iymArIOINR+3JLx2jA+IXBoELCzwxm5u5iYfa+G/zFRbiA+Yw64+luOUGqZjPb6KmvjIB5o3yWF1QI3UTtggIUucQy9fjJ0JEfsvL/pXsuwZAbjVaZn1PBC5/JbIe3aBjor4bfCJhJWc04GsJJhwa6UDiQ4t6RmyowhvtCsem99I1gBgddInSYRD9OO9eQvSfM4vwo+y2WP/bqhKiYsGF856M4/U6JiktFUebqMf8Xkek4B5W9S+u9fetcqKZ2o4RgMDa0DCru7o/IgPveNvwmvHksIWhuvfFo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(261021121427099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6DzVNXIrAgkel3H2qIyFpzzjFUMhLpsXPkY3if7Rsrc1DeXtDk9V8vtS9eOx?=
 =?us-ascii?Q?IORVMA9Znw4XBi6kdg4JCZkm9DowFqXGZaCiBFvgobQMp/NqcDW1uRRCC92l?=
 =?us-ascii?Q?uVm41SC3mkfEKGgxQXX+m2cLbcDSSu+XjuoapLYmnkrSMnTFC/6B0wyEp1ok?=
 =?us-ascii?Q?4x/ZTNs7Kp2DhwmJmva/Su0koK7ie94dqUOjBCEG0YnhGsIhlhyKY/LfqkRd?=
 =?us-ascii?Q?KKvMnFbKb2mDK9GCcHRkf4aq3X3+3P35kCXCOJrsBAxjETMZmmMSNI6qdlT/?=
 =?us-ascii?Q?+tm/y0BHGxXE2EVIYBp74odLAUDGGaC9J7Uaxbv9rUMw6O1x0R6rMkAOOhm8?=
 =?us-ascii?Q?MWqD5NMndfUKEtRcUBSkDm2fxOGmvdsNg/si/8NgtTnLHRoPr8Eh304/iV66?=
 =?us-ascii?Q?jGEK9qcYoIvWrpM27AUxUd1ViQ9XUyMxJORQKka4PrLxFVUCwG3i5Sx9m7XO?=
 =?us-ascii?Q?7L/40uJQDhxI7rIfb/qKkgb+V0OaC1s8wmxC0Rfz54k1ygPjFIArFLCjbxdy?=
 =?us-ascii?Q?Bi4qGCmK5GxLWxrkHl9/6W/722ERigPyEfhJVjsVUdcpByg7TOuEuW7kS++6?=
 =?us-ascii?Q?b5/6X2041hQCyj+DlMJCw648QMwQJCLaWpUlvmXfuZ+dPa+NQn96G9s372D1?=
 =?us-ascii?Q?EthMe3WCviB4f7BH0GOroXzDAug5id7u/lDyUW1NtKiOlow9DGfcySgTpwuq?=
 =?us-ascii?Q?v3hviyfJx3ZLDfK9Dx3Z9NzJrIwCDXPaz457mkH+AwqWQDI51FLjEsul2HPx?=
 =?us-ascii?Q?2cJN47/F/CJecED0c4FY46q85balqRM6mng5uM/cGJ/QndZVGiNxpmwkcONG?=
 =?us-ascii?Q?g6U/0rEAuqUUrBE8uO5bao47GnUy+8Zaa1Yxb91Jeros6B1M38lrlHH5BRGf?=
 =?us-ascii?Q?3y0kMob1LurlEgYXtD3SeVYWNbCha7mkPaIiemo+mK4WOb/a7/x5LCIrVd2f?=
 =?us-ascii?Q?jOhZGpKVuIz0UDJI6D8tVuLA5xOrz/RP1AwPdL/01abLUm57fbU0xx8axDyl?=
 =?us-ascii?Q?UPLdJKwrMtqXFOIJNyC0ozPYWYmHG4KGGyqSX1DUrQeHjkGSNeP0Lk4CFe26?=
 =?us-ascii?Q?JICKWdTA40lBxc1/M2G4VnsxdXr4AXclGB/dgdThP9Pp/qc84Ec13IfRjgjM?=
 =?us-ascii?Q?9J2LkRwJqhaiyBibmzMi8ODDhBjSAT88JQhymQKYtSCyz8CYTE5U1pXWouE6?=
 =?us-ascii?Q?FyKj5MW38qb9E/4Y21+Yu7JdTTt7nRv8rQKzSdEixgi1L2qMeh3P2nZEOfT7?=
 =?us-ascii?Q?iBA0JtfqQiCncpV2M5Kn8MdCTJRxPGdpMIV8GPaKrYpO1V2g/wymPFRsHF8b?=
 =?us-ascii?Q?fbplJjAp8RLCyxGA3vxKsK8kk9rdSaEjyjYndf0d3NspDIyuedx609SWoLs3?=
 =?us-ascii?Q?kBqO+0tEC9qu4msJA0I/3mE/8Vp02eVD4gN6gHvYufYAbwKQlZAdoVwW33ov?=
 =?us-ascii?Q?OOMw7B9dER6pcqTd967PBnyxLZs8vdVAf871x7Jr2xKJ6qtqleqFG0l2kTK8?=
 =?us-ascii?Q?V9OAPEObKgHJLzEc6YiZKe/yDA/8OhiQRIq1iu66Jk2EDVfXUGhYqLKu6seC?=
 =?us-ascii?Q?yh9FRb59SyiFf7zT+ukMwBHFfUA0aTbN+ZnIJNI5uFwQKYeFh5Iikq/Ck7rk?=
 =?us-ascii?Q?pY5LD2kBMi3vaK0sqBlzuTTnFgaetb+rL42naIZyDT4AZIKTkdH4NZ8097uH?=
 =?us-ascii?Q?b3f11ZEi/LquI/X6PDgk06USNVtkLRJwZQzprcROVy2m89h//Pcrgb5ZG+Ns?=
 =?us-ascii?Q?RfP5gvw7nA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c61645c1-cc89-4ddc-bc88-08df301fbb12
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:34:55.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +l1O4b0e7R34l0oxpLgVUYoam378sjKUdvdXH86yfr4mHawnRLYhrNpNFYPzZJCMJu6sNOaVryrJ6NiUBcnVu1cRLRDeKI230exzeRxhCMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 09:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248430
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/jaraco/zipp/blob/v4.1.2/NEWS.rst

v4.1.2
=3D=3D=3D=3D=3D=3D

No significant changes.

v4.1.1
=3D=3D=3D=3D=3D=3D

Bugfixes
--------

- Correct ``!`` negation and literal ``^`` characters in character classes =
in
  ``Path.glob`` and ``Path.rglob``, without matching path separators.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-zipp_4.1.0.bb =3D> python3-zipp_4.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_4.1.0.bb =3D> python3-zi=
pp_4.1.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-zipp_4.1.0.bb b/meta/reci=
pes-devtools/python/python3-zipp_4.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-zipp_4.1.0.bb
rename to meta/recipes-devtools/python/python3-zipp_4.1.2.bb
index ca3f1250c3..1245b555b5 100644
--- a/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_4.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/jaraco/zipp"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e21c3f75eb8d9427c8a611a8e83e9d=
6"
=20
-SRC_URI[sha256sum] =3D "4cb57381f544315db7688e976e922a2b18cdb513d21cc194eb=
42232ba2a3e602"
+SRC_URI[sha256sum] =3D "cf474b90b07ea932637e17c6b9479de2b2882900b0d311bdaf=
4f5c000a15a97f"
=20
 DEPENDS +=3D "python3-setuptools-scm-native python3-coherent-licensed-nati=
ve"
=20
