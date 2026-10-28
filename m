Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37402.1793171046344595740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IZLr3mkB;
 spf=pass (domain: est.tech, ip: 40.107.162.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItlSZwx+9vP6uHLXNzrwd1X91mt5fDiD9SxGhXfXQsl5fEMVLpHYeWaM8NfukBZnEBAK/LNhnuAggPyNyk70bUUDWT9Fc9lBgw1JZrQ47ddC50sa8/rbJsc0REWwHTcB8UFC2Twd+TJOQKkx5WGFjjiXisnXrvf5UWzlWgHZDnhDxoEMyJZsLzTnBIqTkrOF8cNgG2v/vpB04AaVY+K+UPxMP3wmngZ2ScQQRlF2TqhjAS05+sRQC2hZ586JDOsCFZnFc/ku66ubuqGz2Sf+ZXS4f93uCxaNmP1uD+INt6MBHxjuOcpvN8OqZvptHzYgZb3uv46RWCrKukOvTi+S6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57LTsc5il7ZIr8Wf0eQzwNjS2S1ZYEk9pblqQGGo3SI=;
 b=b2WvMlJVLvnDIygKPYpKtJ0vJrMeDo8rr03yAR6Ogw06p9m6Nr8gemoztCfBTtE+082W8ZZ5tdToQg+ezbYoCjuxfhZWOKP9Mt9oFyaGFasls+OOVhZpSng8CEo/yH1dsHnCtgsMIPar8NEnvurpcbDaT3GEe7kuWHBujYgeaeTPugjTgdugaio5dBXB5+zSOABo4UKEF/xJmZs8/c73Br+FyF6yzRyPSeU6nL2Sx+bSwyrP3Sb8jcrSwDhtqAOV+O9g7DymuVHd0u0PKYtxsawbpJLfws0RNYOBaWkYUXKhkpNvW2gl6D0iLvKp/vd5/0S/WmRp2cY3PngkhzwcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57LTsc5il7ZIr8Wf0eQzwNjS2S1ZYEk9pblqQGGo3SI=;
 b=IZLr3mkBQEeO9Q4cO9gQpQOsQJqSDMBTzVgpA3kXFUuiNqy/S53uMZpNmpg6WJo1m6D+Qy4XP80ovbcO5d00yYxYpXno8hIs60xJRosd7a/U8zCdogcFqeL31tWqZhHfcuX3MViD+authxm0v/Q3M4pZsKVwcxf7BUxAx5PSPQ9/gYztyNG+4QEO7fQiHq3ZVA8rqJWcT9yaOEELQ5BllsUXbY863KVL4u28vrMKBCkBr00JgJLJZBVFuYGgsCmRagb7Z5URqiUsxbvWSl9eN4jDCxFOTam6ZuFabV3awQNVPmGdEfbdfrfDxnSWQYzM5yy8Hplfwbk0q8kEBfBgUw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2318.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 07:04:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:04:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] python3-hypothesis: upgrade 6.170.8 -> 6.170.12
Date: Wed, 28 Oct 2026 08:03:49 +0100
Message-ID: <20261028070350.13243-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2318:EE_
X-MS-Office365-Filtering-Correlation-Id: a654ad0c-4b4a-41b4-e97d-08df34c1a730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: nWz++Fmfnak/QByEwgRtS5KAWpF13Zijn4u30Vj5ePeSKMMymjv0KWwdgQtmNMFvoC/hUeunqj6KALyfflg1WEED9Qz0Rfqt8KK8PoGTTY7AFNWzlCzhJz9nUcGlTxKe26vdMYh405sedkKHAYqT/pA+6ipEcPcdMvvsWrOOS8xiu5xwtNAxCcYAM1tc9iCLVdW8zERQlfVw8wdZthC5QzT+IzOIGWxjetexSRCGs/Yec2MJ0aVMJvYwU3MBc6SbqKrtXyr3pE2g+uw4uv9ZnQTy5mjnPFgBzU3J/EjVHNwMIGsniT17d85epA7Venau0wiYcY/LCsU0MB6Agp/kMds0m4GwbDlfdhwPPM+iqYcGj/xWQ58qGGnPc1iwepTMrljKWuWvxnZEi5YdtGL5IJKrmZF1+wKWqJqrUTLf4JqjNHzFegf/9duSthIiCNdPzw6qV5wr6U1oJXATyNfhMCVqoBUb8UYO//ovdNY+ArkZYYt9jhc901++c0fGQX3zHommQOJpGvqwe4d+OQBf7xy/Hn4LL0TMh/+O4MH/ekYW5hE9TuQHh0U5ighInxe60WOMNJPE6t1g3m1MlGsbyFLjdf3jKhS+X3AeXa1pV/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxaYABYksXcPa9p3B5yirSL4ZT9A+9nX7aDpH/MMhNXeXSTrcS8DnIcGfYVZ?=
 =?us-ascii?Q?N1mZ6KANIMJ4OJe6LJ03A62uiz8YB0d+cJ3I4JHZy+O3QKIMSqqEqerrs3p6?=
 =?us-ascii?Q?QIA/CwlbiC97v+tgH2SJTEPTdm/ljwERKuHajUlRdjE9DS8vkeIL81tgJZYU?=
 =?us-ascii?Q?uCyXQ5QH6DbldjspbN+pZ7hl+DO6GBme7dYQebndwyyxgVmMdb3cdp6TNirL?=
 =?us-ascii?Q?leyCyYZtbOzABMLHZlHlAya8u9S81uU5/EBAMI/gHDrC+GtWCadQxcsXU++1?=
 =?us-ascii?Q?Y5ZOSfT0KUh+IvPteZUYomGAcBRRtxkpt47P9H9gPVDBaNe6I5TLBVCGM12Z?=
 =?us-ascii?Q?T896mIqOCc2szW5oy4iYYNTQ9G17iMcBhGxx1ilRsBm0PshLuVUEzN+15RND?=
 =?us-ascii?Q?Z7W/iXMDJZ93m+12+yTqLqKMGrqGxrijExizPEEYdK9nzAnTibqVdNI+s4ph?=
 =?us-ascii?Q?bU5kV6dBqrO9YBs8Q8f4eIx9behdgRWvNWlYTqauWvBx48c+mgn+t3mQXLoC?=
 =?us-ascii?Q?eJ1Di1UtEQPSVjccBpyL6EU4FQ4RvpecGca4EX1KjujKp68WI8rMMQHlLpBk?=
 =?us-ascii?Q?h0PppNlqK9+nvyPmLroCA2lipasQISgR6ygswpdTlukfXzNFBfThM2wWxsP7?=
 =?us-ascii?Q?jCT/OBCsSaRzwn3OjMBGkhsWR3DmpoKzU8PnmKbke6e9/zZxZOJXxhKapEe6?=
 =?us-ascii?Q?GeR1fQ9wnOu6lnNwOf3gbRIzaHEd0kTMO/78CzcN2bzJql0jHinQi5SKUnGK?=
 =?us-ascii?Q?dEO4KqJtTgU9HoCkPgVPcBKSUoCJ98NnAJWMs15p6wcwkKbp4Kvunt3LGwb7?=
 =?us-ascii?Q?NkLZYnT7WqxOg26g6nKL/ArAFxs7cZvOOXnohZGp+mbqP7+szmENsqnxkXqK?=
 =?us-ascii?Q?o7RKdudvpWitiglVVpVIzuJHU1+PPo49t37ogGdBY8fRN2rBEdINiuJDzM9l?=
 =?us-ascii?Q?MZbl0bWMa0vHb1sHnaNogPBkou3N0TfzwrPSLsU3ojNj4CDRXCakLXzGXUXe?=
 =?us-ascii?Q?E4JoUbpBEwpvzcCmgLja3VyVQfm2JJ8kOeish/kJUeiY85kXsWo93LNurkDY?=
 =?us-ascii?Q?EU7d3rahHP/8PNgUz+/LhSnYIHN8nwTggdsjF4TuiLy8W9OZMQ57ECXfTuXs?=
 =?us-ascii?Q?gbM+NFCeVEKeA7VkvAlOU5Vg69O9Vj+/s6uD02BeYypFgcIyk0XvuJcVUn6Z?=
 =?us-ascii?Q?+dCgkXNoOyq24vXZzr1kGv9XytrMIspmA75QIuwTWG2HaPw+FP1x4bdd32XT?=
 =?us-ascii?Q?Ds937HjrnD+eGjVODT3tu7+IiQo4uJ6x/sRoRGSvTfnzjjhSzGJehpeCKhhf?=
 =?us-ascii?Q?uThTLwO1dKBJ944mKnlE8XDKE+81ycBFEMVsshYJLZxIK99WXdEUwQmQrekI?=
 =?us-ascii?Q?l1MQSaie57dPFzwB/vPBBVHDjPRqVrsG8udMi3FhqocNSytXRT6Edz/jsv+F?=
 =?us-ascii?Q?fY/l4vILRp7HEjphn3awl+ou21Wiy+2+PF/SMDq0yY4VvxI8OQDdT3aGeu9L?=
 =?us-ascii?Q?oF9ecWVTRskvxzL/5bRjqwQpQ34k73f0TR6nofuy2nDWRE6tVPkpWAtH101U?=
 =?us-ascii?Q?knAy4FRLltV4hVdAecVMEtrNc17ZlAC/tDitavqRwStdCjKaqgLQlUi6b33r?=
 =?us-ascii?Q?79/D4oAYMEAU8EJMReajBXByhx3HKHZmNOGIFWJIpS66Ymu7bFJkfFwtNRNm?=
 =?us-ascii?Q?wbTObUM4K7bnfG2XflOzx0kb42bbihpa5ePwPO1CIxOceUIc0qgLUhdZGUuq?=
 =?us-ascii?Q?L+7YYGLNeg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a654ad0c-4b4a-41b4-e97d-08df34c1a730
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:04:04.9617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuBVPnM8blvxWXMAaOmWaZrCoNYPABcf/wExCywtMZPd78mn3qYH5t5G0D1AmN42laDGJYgtaxg81Fef04wvYovwS9lSFYaD/+7PTpSK2jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248791
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-17=
0-12

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...on3-hypothesis_6.170.8.bb =3D> python3-hypothesis_6.170.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.170.8.bb =3D> py=
thon3-hypothesis_6.170.12.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
index e40ed0d9dd..564b1d1845 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.12.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "dfc56ceac35d825fb6a85fa3ac36a598fee3101d264a39895a=
62f78c1cc95521"
+SRC_URI[sha256sum] =3D "92b353d21a010b50b638c730ce67cb631ca78a369b146bcc28=
b3488f83136e35"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \
