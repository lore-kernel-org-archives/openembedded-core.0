Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37396.1793171037963472767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wTD0v3vE;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAb2jvJ8/gn4ytpma2EEoiXMhU1rRUm0LTndFh1o0BmqCxYKsXc6aagTXw4RAH3fMWjH8JmHFYz8Wahekcl9QyUGDi3vc3HE2Srl56TABDJ4dBpN0G2GiQiB9Lrp1dmvDpFF6o3yUNx1eF/PNQJCFKMC8JCET7iEotRBZrqf1hglRsXQdarm01EI8OFaGXMkJ2mW6f/YknvrQFz65rYws/aHj4LJDatno5yYZSqLAyTH+mNT62XiltIVRLaUTBhZX8mKODQDIBURa2I1BJ/SaAEl/7tzioRCJgh7qjNtl4pJdyv5YFM7DzVbOm7c2J1fgOOPLi+i1nhxGr4fqKzwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRH/Jq4uvvfsIX7ZFh1zeEcYst4vIQBc8099v1NFUIk=;
 b=pZ2lt5KgkRKR4MVQkNYS9EwgV6LdCfiTvoN9I+nVlqsVQpxXP7hHvrZMH8k+R88GKMPiQwbKgsQqoTlgDsejnP3vGHe/dRKjCKujKNQrRhWR2FN2Jz43SMp4aZ7D86VUxzk4DW3SmdbNC6ihN/N3ki4wFk/gWKos8WQCu+k+dBAmmPvFVcoYG0wWRPznA4OPiZ2eNPBmLG9YfsIxHxVmoRXFMNN41GIkL5sVf+r6gfrH2lWhCodV/6dCeJqhC1xqFP87VE0F7WQNXIP/cP3RTUml6eCpu/7c97cj8qzNica3TRE406Reb7z+DWI4OUfs1nEYDib2Hj45usjYehkQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRH/Jq4uvvfsIX7ZFh1zeEcYst4vIQBc8099v1NFUIk=;
 b=wTD0v3vE4DPCbrbCf7Pv++2SuHk3eVS5M3LLQQUE3YUmPEWyOEL2lbeEF1kKl16jPzfhNFZzt2bqUMpfSTqwtMYYPrZC6m3vMPqRi2F9AMHLrmPwFj+lT6hVExOOKeZHP8j0OerV9LZMthRfOQU3EsIhs2OQk66Mpi4/5FDE92DUsv0m8CH0OdtLS6hRtHoKme+pTcGRP51Oghjz+SfEJG/u8GK0GQZeQjO1T4o25J0vrw7Qh/0ffs9a3gd+KyFv5rQCadQJognwVE+sGeU+BmH997W9S3UK8IPFrCxGilL7Y2MmN9LXh0Y19slGm2lbUr+66n1NJiOJpUaSS7SrIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB3470.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:03:57 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:03:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] python3-pyasn1: upgrade 0.6.4 -> 0.6.5
Date: Wed, 28 Oct 2026 08:03:45 +0100
Message-ID: <20261028070350.13243-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce9c6de-8242-486b-d0ed-08df34c1a2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006|261026140227099003|3023799007|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: qNTTLyfqpvdZjVO85J4gjILmrJyRReOmcY8iZRmv7rR7YdZTPr38+RBVc2WaodK64wq5P8JMXwguOVvj6jzEYxBdJFcJWqr6UDEdAvhoThJCR/HPHzBO95h8sKrTwOQ+oaPe2eKW5yYZZfVmtyd/R0XEddmY2pQ/TwSNN1mfZ9InjGJXjlq0tNB1ixJYGyjdSYKsa7Yd2KbrVu0SPkKq7PleKvyCpLAikHFEC2V67N6P0bYDDoyVQhL97p2WJ//JRs1n0D1FIl8Y8I5N0CMBc4fKGDIOa8HYxG/v53ihpZeiDMkY8cawq5s1Fc6x8OZPrpUec1Rh2goblwxyE1ZlKaMAUNXh8DTJt8ddeZm08qn/Ol2cYQEHRc++c1bGkSfZPOVA0ijRjFogcCT18wI4SwMuBht0LQcla/+PrpTRs4/uXcaTwoU0R7IqtcRoM2Vkdla7hU5YWheUOQAmj6N3ytia8jzyzuubB7Qf2HGCgEz4vS//kg9sI1v0stLvMX/jniE8J9cdI6eaOo/CZdD/b+B6MsMe/2t49w3pmtHlIV6nMRMRouMRIBbeTclzYsByGsaANh/vFvakJU3fJU22oUsq2vXYu/GbhW4hTK8RCS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIYUj1zql0NqvdCfdUChGhVAtAgricZjHqy4y747nZ5xDZIlWzxePOp7KJMz?=
 =?us-ascii?Q?q2E3679C98niqU3C0SY44c5UPjTI1CurNe3F9sDdrAVG/YH7+ddYbHr5uYqo?=
 =?us-ascii?Q?RtulHHFFU6QnwDNOGZMxFCvIrvCguX5aW4OLC3atsxuwq4nYe5jdkuEkzuks?=
 =?us-ascii?Q?aHlfoJjA8vQKSGSR5mJjx15yq5YcykoAJUb8vYz+oIj7s0eu0HQS1+3K1svl?=
 =?us-ascii?Q?Yn0jsHy8YLp2Gu/I5lH/i04n451rJ7fxS1NNdqlfXb28oZQpKj/B3piG0WNw?=
 =?us-ascii?Q?yK6yoKIx8g6LkgMmIJG01PFwsg7BK4YiKsifQodulPZwZJN5HpssFwGXWnnR?=
 =?us-ascii?Q?7x4CMnrDFi1Z3UR3OJCh6vKVZDjVMK62LfR1E1vpxGRilP4f67+LSjEDYcgn?=
 =?us-ascii?Q?dpqwvzG6Vjs+gejoVDfaT3BulHOKi32STma9Of8RxzEPmqxsJCOG+8lkUUmM?=
 =?us-ascii?Q?KHh1ZQqWMS0Dh1lGifEo5y8j02CN+XL5ZHK4dxSjRETexOqg8Lb3v41Xku+S?=
 =?us-ascii?Q?7RLWUPleL/ty+uy3JQmTJsUnnJJ90yn5LZj1XZfPwjHEtwE70qPp6hnZyk7B?=
 =?us-ascii?Q?dYh0CX4u/nSTfnYMlzUOnisL6lGqqCVfngryNDijmxmPpdIie1bTUdcPCylq?=
 =?us-ascii?Q?A+NggH44KpBRgXsNfsD7XeGqDpPHuU0DB9pfozMhtuYzXDzMhQHc6e6A3Ax3?=
 =?us-ascii?Q?u7WoP9m1vZB/aGDGMwXVVWESzVUSewyOuo71BkTK9UJg5m6+zjBNcD63Xl8q?=
 =?us-ascii?Q?cL4plQn5/Y0JFR2aQ4379urTkP76ypt0t5TcEw0qZ/XA8oq8LWdKXEgF9G76?=
 =?us-ascii?Q?SBtvkp0eihn8c0aVIqczTMqoApA7rLhaMWO1vWq8QpkxuNF6GTX+AZXnnvGd?=
 =?us-ascii?Q?FaRXwl2hUscT1Zs5HnSjEhzry7ciXtP5VIAkw4Q7JbZYmhwMxNiX6bcDGaZP?=
 =?us-ascii?Q?z5mRW2cfUz+NmSc+BsDQXx11QYqku5k1E0M8QRLdl7gJQ67WDhD1hdjfpcbq?=
 =?us-ascii?Q?f9GHzEFbpekHokHlonk793pp1s1RgDTwt8JArM1hkOOEJl5t5n00L0WVKGFs?=
 =?us-ascii?Q?wgCcs/Igrjv2S5Tqkt53jUc2JWGcEUic061Wdg59wIf3yfq2n3xo+qN7gNjH?=
 =?us-ascii?Q?/snjYZtCxKEewg4mk0RgrYEW3o4VGgWIQC2P3U7Tj2rmOzAYN+Z4Gug9LaTF?=
 =?us-ascii?Q?+qHz1uXKPxjjv5gCa/K+Tfb8QkRXdTtORaMA0Fb1Mm4Vo4gdQN3to924YbEV?=
 =?us-ascii?Q?4OEjbQZtYCW84fBnWGYcN2jfIh/LRFfx1yYwS1J3XkGohfXvyub4VLBI+zGm?=
 =?us-ascii?Q?WIYckYJD1nsULQ0AERMyccJVBdAdj6yguFFdrbmpZzB4IBO2xzjyxKGk+M/i?=
 =?us-ascii?Q?95yWgDLSpwHXvKVrjM8dJeLUB22hNVGH1Tbexb4PitM39J2qIpsPndVT1joR?=
 =?us-ascii?Q?NAC1E0OaoTVhVFx21ztK4s3OuUu6WGn5mYjlQ8cOD9CqiuevcSgUpwxfyyUu?=
 =?us-ascii?Q?nTZaweFVIQkFhJyfZc6WMKnVkugnKtxm7c4VDwDQeV4s7He6wIIfamBP0qc3?=
 =?us-ascii?Q?bjIFJnyvZQQ12PhX8j17MgrL5sTS/G8iTe0zyaFg1/ysoPmA3WDPjPq87OI7?=
 =?us-ascii?Q?JHpNwmH0rs4WvYz5dGc5Il7fya2qSzlQTp+JhXn63wCj6g7VtZBUegrwIL0+?=
 =?us-ascii?Q?coHIVoUXYlsAZjnyNLWQxCPKDy85qFs7oJiylFHYc8cqkt5Wmd6iQkCS5300?=
 =?us-ascii?Q?KyG4eeJABQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce9c6de-8242-486b-d0ed-08df34c1a2b6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:03:57.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SFE3lHAvZ2VJ4XG8QLLUeGsZA0FQkfhQZ0zkXamAF/pBvzGEViECIj8+MdBAkDr84c8i6PAoWoVt3cOTShO10eelqnyT1GQHNOjYS/l13A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248787
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://github.com/pyasn1/pyasn1/blob/v0.6/CHANGES.rst#revision-=
065-released-26-10-2026

Revision 0.6.5, released 26-10-2026
---------------------------------------

- GHSA-mm57-4v3p-rchx: Decoded binary REAL mantissas in linear time
  instead of repeatedly shifting a growing integer and slicing the
  remaining bytes (thanks for reporting, manus-use, manus-pi, ucsurf,
  adriank31)
- GHSA-2qm8-x737-gmw5: Reassembled constructed BIT STRING fragments
  in linear time while preserving their decoded bit values, including
  intermediate fragment padding (thanks for reporting, manus-use)
- GHSA-9m75-vc3g-4x39: Reassembled constructed OCTET STRING and
  character-string fragments and indefinite-length ANY content in
  linear time. Nested constructed OCTET STRING fragments now contribute
  their decoded octets (thanks for reporting, alimony, manus-pi, adriank31)
- GHSA-fm9c-5rcf-2q5p: Bounded schemaless container type tracking
  after two distinct tag sets to prevent quadratic CPU use from
  colliding long tag IDs (thanks for reporting, droideck)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-pyasn1_0.6.4.bb =3D> python3-pyasn1_0.6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.4.bb =3D> python3-=
pyasn1_0.6.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb b/meta/re=
cipes-devtools/python/python3-pyasn1_0.6.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
index 086a21ffe8..08b8255a8f 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://pyasn1.sourceforge.net/"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D190f79253908c986e6cacf380c3=
a5f6d"
=20
-SRC_URI[sha256sum] =3D "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b6=
7025bd9fb8ce81"
+SRC_URI[sha256sum] =3D "6b11616a6bcf3a40e635f082bb232fa57b5e0dd7f517bd7ddd=
69ec3794508a47"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
