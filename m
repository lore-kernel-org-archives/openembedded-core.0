Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Tx4EzEwJ;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbmjtMR6xmGkZQfTSsMHgfR4WvT02IlvtBJNhxiNo0r+Dl1Quh+t8PEbWyEwxCd3rk6twemg3PwfrBMbhVPId3v20VmSxMcs4OI4Xs9MiZ8ygTDSaVdEk6R6jBP3Up3W/lIrihA1wp8MuGfDOt23Ic1tvm4XAM6TXxcOVBfovaVjkGBJPLbs2mN33fnSlbwni4JXtUapSamRi8nokpTu+Y0cCe2xrwvq801igkOnhT4jTGMoNn/Vfz86C12xMNUFl/vKLbHRymM/N8FCJZwMlQsRBpRXwS0/3AdrIl+8liz+Y7YCRUB4oC7Ojy7+l5tXn6w2nAq1dd6zHRWAyBc0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSLUVu4ENpp+RPQXB4kldWyXwieYEYs7Kc6JjQV1HDY=;
 b=gpFoC4lUNBbyAVzgvF/OzKi0xpjOqSDcnyDt3OD3+P7EH9F4M7J+uZd4TLgGcTyFqsvTSUN5MHIoAI+D0IxxPGwJdFEePLgtjE8GRyMjOP0dq5Kanr4PKZc/GT6S7hTj+yDhOX8p0bLUGakephuvw+L2gWfN5Dhlh1zT0By8LgOJKrSuJ3QWnk/2docSr+h33Rtzk4t3in/jFZzNrnP5IxUHxufKk1/CtrBFDAJq1RrSbZJlCzkzIlXoIolI6qzECLpTa2nEeMW21oRpzCOTsbWYYfT3Nw+DUbo7Rs1uNoMMagxkETt6fdQ6IFDarbo9aRgqo1L498uHofcyBXYUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSLUVu4ENpp+RPQXB4kldWyXwieYEYs7Kc6JjQV1HDY=;
 b=Tx4EzEwJogS/G+4JMVo268utLZ0xfSDwlDSF5cOKVos17s6ezRjDKFO6SdBNaRAKewSUYLawFPI0IQaKrTZxHmM3KOO5wZi2KsndHFIDJZamvGw3YkkfLBMvzMCJhWbaNoMU2fv8iMRIl3wTk2XIuFJ9heAGPXQ1S/b6Iqs8qWE2W/UiWQ+/BPAZXZsnv0mzUn6uJuVO7p7v/EHfV+8w45j7N1UY3Q57Tyj+EdP5eClKQM/aaU33GLlTxd41jEe1UVDN0BkonwzpMvxUGhKLnNhBBposy9s8zxwHlz9Q7weTsXNGU1bK6a6IoDmgH4y2WDWtYeO44jAXPUWtjfWm/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:09 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] python3-numpy: upgrade 2.5.4 -> 2.5.5
Date: Mon, 16 Nov 2026 12:16:53 +0100
Message-ID: <20261116111658.7745-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: fe734cf4-21cb-40c6-f65d-08df43d32768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: xXQDLZNIQRcIGwxrGi1pbbe64eHYjkh5SN9aELJwzky7vF6XiEeGFSgJzXDRMiH8Y/xQZsZvMfBATBopB91Rj0dZuQdU6WcdwnUA9XZ/vhdbhL6uxGAZfIyNl/NBf4scz+TwPTDkvf8FNkmzAVryUzQBA+6tY/G0sgiz3WrUqfuvkDDKMu5CgaK8vm6/vZFoMvKEGo8IlheMA2QBtMmvp1nnENIiEmPK0W7XQGAWQxlD1JAJpyTFVLqueR2gzQRSMGvEss0p8QeCzPTFKhSAbfu+3SrWFdtT9MNr9HH1OqGWZ13ZFgOi7FdGuz+DSWj0xySz83fvELeoaBp1bjSEzcaoX7WPviyW52NG0FiQYMT9AtYZtpHmZn+MjANNpxVXUQQ8w9K0tgewGxgOke8sIEJ3DUdEu1IijXIkGq/IwCWhujsxxL0auUtwlAKohO5DKZclqUrsc/c1bVqECJV3RbAo1q5ZobpyeE5c8g/LJRLCpYfRzCKUL9ymmSrd9fLk4VqSiiF8GFHMbR/DES09GRIFVKRkvkS5zKy+eF+db4AdF6UTY8Rw+sGabG7zY8pJOp5bqYumdi1yc/F/ByVAQNEMGPJpCGMAZCuKvqR+Kl9ngKGpChyi0W4sjyLW6jMUNyPHbh7a6sf9KDIcb8zRxFo3FqYNSr/4zfOEwJfnAjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D33DwVootJUjPHQG2VFyUWSfsCBbbUVSnLm2t7SwvOOQZ4HrlBwiAFAbqFIp?=
 =?us-ascii?Q?5KZQSSfltinE3K1U4Urvm2IEIWFJ3ZY1FhzQow4gR0Sx81FMhxF32NzhAyqd?=
 =?us-ascii?Q?kneD0PRsVe9SwGjsB8QWe2i7Yhvk44PEOauZ1JcJ3Yps1VJhsyDyNE7+Dfmf?=
 =?us-ascii?Q?0GeRBVXiTL1SFnPqM8iH+nmXbElPY4yAEIVLoFd3G1/GW9OBLn7ZbEUhmOq/?=
 =?us-ascii?Q?0Mz8l4S2FHVAHAwsEQyAkuivV1A3+QYl0xawZmQlsuMiGJRhm4QXb57Ddrjh?=
 =?us-ascii?Q?sl0BgafEc1L8xCIRO/WgPQWk3dBUQJGYVoVE2I+w37ebW6cLijeel1bzHBa4?=
 =?us-ascii?Q?9eyIWpMRsBgWuVXYTOuEdAUzReLn0dw9ckMGnR0NvdwFeKBp3TfSPa3JgIRD?=
 =?us-ascii?Q?v81dFLTKbTTDADVcJlZrkd5qW571nVTLXBRd/3Xlp6IxUWHg+G/vtYCIgOle?=
 =?us-ascii?Q?vImYQ+DglkwXSOwuoyFP30t9WgMRi596dXB4coRirarukeJPFG5hxuYbvs+O?=
 =?us-ascii?Q?pIqC9d4FYEqh2Sq+ccI8Z296jAejZ6j0IGq7ve3OtokhIigag4WEJQr8b5vY?=
 =?us-ascii?Q?oOq70rYC9kgBhOnz6pOrJwpKQkyVxSuBAZDJUGL98sCHHYOZZER4I2Da1I9Q?=
 =?us-ascii?Q?59peQEjFlgZwZpDP1jK+0fhRKTR65Q33XpJP5Me3cWNidKJFQJMJ9CGkOwtq?=
 =?us-ascii?Q?LUaaZNIntHQ2ZcWu3zeUyamwohurHS+lYNSyCpSPZqvewvv29x7lpkIunBVu?=
 =?us-ascii?Q?MIOnRrnhVB0YB6w72JUeUG6aWcO4iUVzxjqb9J7GCUBkTtX93NZYLaRMkQtK?=
 =?us-ascii?Q?KSD4urvT7oP1WnT6bXxZn5MBL66V8Yr1kKoMioi+QT5d5ca2EcS5sb1a+pw+?=
 =?us-ascii?Q?IxiosxDTLqOXNG37D1YMF5y1feoSTUg6LRAByflO4NLhyElenjNWx6jYdqI1?=
 =?us-ascii?Q?ejrMHo4XGzUIdDePgyBASM+jz6pMENhH0AOBvTPEgnYkQwcmPIjuGKq2Kss1?=
 =?us-ascii?Q?3RBoLISMzhQ6G4Lg4qJXTlfTAQ6IlS+KyrNZgAInRoD7G5o/dXx7Ue1kZhfO?=
 =?us-ascii?Q?Bji1u5HPsKQARMd/o803PGJsUfbFKCVozEds9rA5BxRVui/mx4noC2RkeMqG?=
 =?us-ascii?Q?ctrsyFQE3v0L5w0ITkfggu+b247CF4l3eKO+4GIyOX/x2jQA4MHfg+3zWNoW?=
 =?us-ascii?Q?BuCoHLkbDYdRvfufMma7NX6TA7OKPvDeIJuPjA9lEArH3gx8NEvEeeEBkLwT?=
 =?us-ascii?Q?uOESB6RXJI2MxSFv6NS53fy2paW/a/TE3HIi8Z6n3YsyKVfOVZLqEHvWG14M?=
 =?us-ascii?Q?9+u9UCmK+Homm0+RvsabRdqa8tHUkADfyt5w//TFzzkr/U4SLvO/fmiQJtgp?=
 =?us-ascii?Q?kGXQXrcvpX4KXAQgjOdGlNgqiLTEqUPN+iGM8H0r9K9S4ZCm6TVTh7p/A3ab?=
 =?us-ascii?Q?vDh6cLHcxqgkvZlEJs+/WwQMeRNQMRqw2Z6+emvgYivwe0YOy2i8Ft8GHUmi?=
 =?us-ascii?Q?F/pveZj+k4QvpItwtqfU2W20R19jhmucgBAeGCifUCi85Ir194sFN+1mORmq?=
 =?us-ascii?Q?aDtK9q9wV6CSR7gxgHnqTSx7bY9bpQAVGIn8Zyhh9HvJpSqVvBf2TfvIHrzP?=
 =?us-ascii?Q?7GhmwbM3Z5Cplru1R1P/oQSXGi7+F6ChMz4e2ux+/QtZxsL0f5YMf2rkf9ad?=
 =?us-ascii?Q?80ouUWhyqkVrMyJ4kbRHYcG2paaeat7krkPcXGyWJIghSmx2HAVer40nIhsx?=
 =?us-ascii?Q?o8Y77X1Jww=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fe734cf4-21cb-40c6-f65d-08df43d32768
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:08.9464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEZ9plMWxlTCh0uEuWaX3Oi8vPjMrR71GXQmBoirOLwMkLO+wYjxbqw75NpT9vRLJ6CdFetdb5lRhTsxQ7db5oB26WWtdgHvN/vd1K/Xz4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250333
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/numpy/numpy/releases/tag/v2.5.5

Ptest results:
Testsuite summary
 TOTAL: 48743
 PASS: 47548
 SKIP: 1162
 XFAIL: 31
 FAIL: 0
 XPASS: 2
 ERROR: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-numpy_2.5.4.bb =3D> python3-numpy_2.5.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.4.bb =3D> python3-n=
umpy_2.5.5.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb b/meta/rec=
ipes-devtools/python/python3-numpy_2.5.5.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.5.bb
index 275c49690b..e2004e8e0b 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.5.bb
@@ -10,7 +10,7 @@ SRCNAME =3D "numpy"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] =3D "9a94cf751c9ad8ebaa835bcd3d40dacf8534ad086b88c38029=
b65123c7999d2a"
+SRC_URI[sha256sum] =3D "5cddc243c75114ba845f01b1f87aca1572dbf7b6c2d88636ed=
3e1d2bccd7f1bf"
=20
 GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
