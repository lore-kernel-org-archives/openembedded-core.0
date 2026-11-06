Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6041.1793972351455111660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 05:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vwLPv4+V;
 spf=pass (domain: est.tech, ip: 52.101.70.54, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHk0dOTDeWbJI7M//iHZASUdBvg1WsLSMSBFuO2W/s+WyB9Hv2fFYvovdLsDKIZ170BS6CHVhy2CGt22CiuGyL+HFW90T2RkeUxIEL87TJfL9dX3HuOd3gAw/mV0koUzuOeLCaYKFnkENPuHfbeiFpF8ZCjdTl6Ydow48evwyQEPVSyv++QGZc5vcoFhT4kNmNDFaydwPiyZWfKLO9vTAjjez2jruJytfDqKDYpfxadsxY1RNEl19pDxgGXp5h96t1Hnx1be+YAV8BNFsy9OpSi15CxKvDco6VlIA41Y3HKH4PfLREyFkvhyfnjUyYy3r+pTtPiurCXn57Wt/Hp+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vPl04q7wlOC3dyPU7tsBG8OPIH3jMYpMmPAChOOC9Q=;
 b=Z5qEU0Y1/R30Huas2WyGzbtMXwL7Lpeu0LkXYDIBXnyvGcWjqXD0cwjQCNrZfvr3oyfTQQiaBHcxVKZENHytwE5pVe3z5fPTUyEmKY1eG3JxDMys2OJcz++QhgYzuxz/2Yiaobm1U4+Kmm73SntVnzkV5uqxrGpjA7cg/00haYtiG33DXmjMmGwqxdf5sDaPNx3jPBgMLnPpTFdgMRxgZswszA4N+3adeG5g6enVA3ocbA/LefdLQIMWNNNJPYGDCUoQTLVj+rjrRpbJoRjZrP+mUP80hJEwQgAwnGo/iJoOw3qlebFw9C9hiSf96XsBh2ekdixp2Tz5NKH07OtyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vPl04q7wlOC3dyPU7tsBG8OPIH3jMYpMmPAChOOC9Q=;
 b=vwLPv4+VSTdQi/hGQ5ERMQ6p5kzibzANNYabHCIvKtD7d/wQ8NsVWlUqlM1tKJ0dPnQFOcR5tIo6k7nDjrUXlsgQ9NqELq3t90E3ci6N0o1wtOSQXAJe33K6prUNaDLO6Vnrd3zflq4sIkhoiY4WN8U2/WCqIqfSBkvavgmW6ZgC1gscn/5kr+gwbxEWUn92imo63pV06Aziut5H/RWb7v6V4E/vuscN5W3Kqffe0lY2kkbQ/bLj1FPDt3j1AXd97IRgMqek00n/synLiRN5APYCWjYD433J0KXbt5NISNBQIgllmdAQMXp0OHzeNz4nnOJFYaDvgQjMBRgCKdO8Qw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:138::10)
 by DB8P189MB1109.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:39:07 +0000
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7]) by PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 13:39:07 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: tim.orling@konsulko.com,
	Anders Heimer <anders.heimer@est.tech>,
	Henrik Nilsson <henrik.b.nilsson@est.tech>
Subject: [PATCH] python3-certifi: correct license to MPL-2.0
Date: Fri,  6 Nov 2026 14:38:57 +0100
Message-ID: <20261106133857.1418751-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0473.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::12) To PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:138::10)
Return-Path: anders.heimer@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP189MB1776:EE_|DB8P189MB1109:EE_
X-MS-Office365-Filtering-Correlation-Id: af6f90d0-d16a-4c47-6656-08df3c0b5482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|261021135927099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: L2czIaR1cu1UG1qjp3RmqS5ih4mjQAeEFjPEaQQprYMgNBgunEuR0eANmLGZr8Tx3qV1DMnMSLtXGS10sx8V7E9456QOop3Up/yGLxs9EXrbARhiStzx2yju5tdX95dm5YVW0P0MP3Uy9PMYp/4RPTeVHAZj3rpQocqRLiV5G9T5CAx+zeYJX9S3NFsQAjavdOKfbBvwqJsn/8K6A8pZcQ2s9bIf2IDsEYetKQWEYdsklUvMwThSsXgcVbZeEKQ5LFhTdNDAMznKbd4cchSKMWvnYPjqCiDpTFRZc2af4HhWgBnA6tCRe8m2wrthR+Jx5o2gvaRQ/X7eDZADVxjsqCrTXPNYhMX41jhZ2uSeqLuIS5CvBxheyXyk7wNB0Hk1JssXgEmWaYgcvK3XuFRN1olZOJ6p4GqH2aGN5Qmsu67WjHHDs/+93ioI3rwFJH+65UVlkwPyxj3sgK47Bw/0ovE1aqsMcx154ShHCj9FQSgwot2nHxlSkJs7M9EpsgajDSeBFaA6Q6AveBeWjJbRiV9dKsbnsVjsOu+kPWRVczq9uz4OK7RQ7/nTrce7xuweY6yKGeqvA3MVeqbuw/2csKQrHuBYx3TS4Cno3aAv0Gg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP189MB1776.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CVl7iuNMgOghjNpwgwvwCuo/ZFG03sZvO9bzYSbzdHRgVITYEsbc0hT1l3oN?=
 =?us-ascii?Q?Q3uvBFJsmdslGdddPGc7JdFSKphfGtRXCJnw/v2ADDK1Ls537lsYocQZKhsP?=
 =?us-ascii?Q?DeJgWZaHS3gsTPYKAhTv/6yyWUA6NOBWhMBAgpu9oZOvBu7fJPPNiEhvMajU?=
 =?us-ascii?Q?XO2h+K1H+0F+Rq5gbmM1i9orogAusVM8dJ/nFKe+f88JOkjWr3FtH/7LyLQ0?=
 =?us-ascii?Q?72ilwdNct2L3yjO1EcSIV6HAd055VXjpDpuieF0da1bl4xp3ujj+pfY5JKkI?=
 =?us-ascii?Q?2prQaNa/LLz9bjcQlMlyvYU8A9DZgGYDAF+TzLCN6FANP8xDRSSt2ffHIBvf?=
 =?us-ascii?Q?FzuTxpyxs3Ns0UpBDCREVA4m/bGCJe0HFXdNCx7RkanZGIREQ2VzrQVi24vV?=
 =?us-ascii?Q?qETuCjWJNisIE55f/3zGlYKF3Cxi+OpD9RPtSb5HoW4Ud7vbVsxq63zrd2zM?=
 =?us-ascii?Q?mD4PZ++JXs1hZX6zGL8NnjeBjPVFjrwUTuGCcFYwwBfhsQApbtTYAPQAMFY2?=
 =?us-ascii?Q?BRy2dHw+JbpLrc9pZ8Rp8nHKk58pbpzDYskewn2o3XKzECaZ6M0723Z2tOsq?=
 =?us-ascii?Q?bN+Eh4ynlHl5q1WJmKUaxFvU5P5g5bXAQy5/kHjlm9sPrkGglbCbPGc4k01/?=
 =?us-ascii?Q?v59vabItW2cOl/2J3s5FplNJEF5nyKiMxmbPD8oQpBWnnThaJjCy/goNQ9My?=
 =?us-ascii?Q?PYB19WizWfZvUsDLES98FmXXbNWRmJsiQElZzkjBSeG0HMHoYO/29ZgqBkvn?=
 =?us-ascii?Q?pQ32iS8XszcNQztxnxQrypaYmYq7hZmYLGPuIf67puYuvwNmoi1mqg2qIU4t?=
 =?us-ascii?Q?NITWLdY5k7G0oF0KoEfJpQVe5eo8/w5S/ETUOu8ANLOYgCe/UnfXVjID5XZJ?=
 =?us-ascii?Q?o7fw0GX63YXGaZYkgpG0golnLYpUCSIFxC3NmX5D+QWPybZVFtnXBIGpElrA?=
 =?us-ascii?Q?97W0A4zrK44Ur50SMSL5mRtx8epedfdwP/j/1yBADlzpbOjbB21JjgBVVitk?=
 =?us-ascii?Q?qg4lmXApmJv3nm/r+j0OQ/Y2H49vM75+NAh00hQxrmkrfmyhX72wSJDyFItM?=
 =?us-ascii?Q?lA/LNUOEFTNNmDQnpikBYWmwMjIiD8CCsxV3WCPKcrtr3c8rOYZWtYCZXwih?=
 =?us-ascii?Q?KQSkuehkS1Z53OpUfePcVk/HVFWXPb5+5AqOD0Vfj83GSda8WkfRRq7KQ6Yx?=
 =?us-ascii?Q?VXf+GG3xdSqyZml5OIyXSiWPpvX+WgYJE1L1xPCP7y9XuRmaAqi5duWds0S3?=
 =?us-ascii?Q?RDcz7Q7d6u0Qf5EoId2oJITsgBfcSwDMNBdCgMq9q+eLpAJ7bEThy4/let6V?=
 =?us-ascii?Q?2YFhpZF5kYocXi8GhhpEXTfx948NRFjFEC4fmaRWHAkrwFusWNflUlVtYEAI?=
 =?us-ascii?Q?P0J97k98Mr0PkNDdW6msWPSJnMZz/kv4ZbP5DCXuA7+ZtpEMFbw6RuLOMKIT?=
 =?us-ascii?Q?t0/UtZwvjF4dLxvAxzim5ORsbitPp96rGP6o1Cw/oYs/NerGR1OFFDEBd7Gi?=
 =?us-ascii?Q?44RGLAFcbxggnTb4nB5x0Yru3ptFKCPkXoNAMAIM9sVwHFFazXcbXXrObydC?=
 =?us-ascii?Q?swyRN1ei7uGF8rv/Zo6XMzydWyFQQOlSURYsd0cLjYaiaONTaT3uFi/mSSpy?=
 =?us-ascii?Q?j4ewnhEDU5ZtGnhhzzkF5txfU0SY/48taRjmZMh7G1C+e5gT6bwUmTLq/bC5?=
 =?us-ascii?Q?IMf83ewZ67293ewgkn1jiT+SAvKEZ4TNzOhT//U3saoZ5Srezii3ZR8IULNX?=
 =?us-ascii?Q?0FIdEOffKw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: af6f90d0-d16a-4c47-6656-08df3c0b5482
X-MS-Exchange-CrossTenant-AuthSource: PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:39:07.0678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqIxGb4CKbwT2y3JdX93fzEcr/fmWDuYRRMJw3Jhxh9zcADxXR1ItVGZuv03ZD77VVJmNf9dUz0yw/KP6kfvyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249649
Content-Type: text/plain; charset="utf-8"

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/recipes-devtools/python/python3-certifi_2026.10.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb b/m=
eta/recipes-devtools/python/python3-certifi_2026.10.23.bb
index 670b96b006..29e213ef22 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, fo=
r example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefo=
x's canonical set."
 HOMEPAGE =3D "http://certifi.io/"
=20
-LICENSE =3D "ISC"
+LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd573=
c"
=20
 SRC_URI[sha256sum] =3D "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a93=
6dfb16aaaf36cd"
