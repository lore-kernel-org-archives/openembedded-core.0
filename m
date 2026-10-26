Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40072.1793010714082523059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VY71sKog;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh/N6GCM0xmlBCcVY4YxTZTPtLpVk3MTBbghkjYD1ftAcwHqMCfvAG6fK3t/l/K82xUv1X4o0Va5sj+/sECZd/4ryXn3craeazMTPqnlGNVU+uNRjnLYb7coC1d1Lo8NsXF0g5j/1OxmzDLGdoCguWsPa1PV5ffvVdn9MNNhA9SUZeOk97PT7KJvfkKR1GYU6sB0sSzUlAoR0CON75fPVPFLxW05lON9xRGP55U4gjnbEVlZ8HMomedsVzSHW9bHKuLWcrEpy1wAsTpoyjqfPj+akldRgxZgv5iuAgY7fj3YRDJxsdSGY8WYsbxcM6ojEQdv6XAYmc1yoIpxZyo6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAsNsE7VxG/0eY9qjQa3OKa7bu6NxdxbwIIxKbuJdJA=;
 b=Wws5uQ6EWAcxKWR8uDVTwHSGv9KVo673aCxB9EGAE5kmzQtXvEhAm99aM6hPeCbp1bZdQv4s+SYUU4SoO3Y5Ry7qR+AVGhRUO74HXUN/hcQ076myAgiSulrsQfuHB1uq2BUchF+UnhX7Kzx8WkAxxGCA3GyKDDpP0NNT4SN+LulrYLrpp/LTjbwdDIeffDYvjVXV91TEpGWPTk5siS8UHn8c9yv3zPszrE73deef3jJ8KqjKD33X5VrEyfVAIJe/RX9vVDotuqwr6wmEYcEGdH54t1MfD8NUtec+9CdHq5CuTEkLEmuWiBoLTAa+0NunnHIWSGLrx1Upsg05HqdpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAsNsE7VxG/0eY9qjQa3OKa7bu6NxdxbwIIxKbuJdJA=;
 b=VY71sKogzsdTuS2niHWv+8+FW/hpNSDEyIXjxdI4MOtYK83UWosbos7U4B6YA+DuE6EpupwFOKWQxhILU5eJuO/2YkdyMySw9kNbmFzxOfslLXwGwBVc2i7+R1AZBjz2LskEH0GfdXDbJr/KrXhcXU5t1zL3QaCHqon8vPlQIMx1vUuIwqbf8u11zLnhtd0UE/9prkkbPyVHLGmnnNklmBdagYCdr12T0SvAGk2D5OrVEJl62MDfAgnmi//6i54Z2sCH6s74DYV1yRjEJVSNUk7kuXudDdDxA46wjzd1oZvma6T981AfeLn8AK+V4AbTKRPJ/c8dFjA5IsO1Um9crA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:50 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] python3-hypothesis: upgrade 6.169.0 -> 6.170.9
Date: Mon, 26 Oct 2026 11:31:32 +0100
Message-ID: <20261026103138.3137-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a9fa96-89c4-474e-b404-08df334c5808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261021135927099003|261021121427099003|261021123027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 4m6k8RZRF96pbyoMtL3jrY6Phxw0T0iRsGwY7wvo+z5sG3T7vl0v79OvyOOMZBpXJ+YlmGDLTFeE9n7lptmACNmevEUofosReakI7OsFnDX+gdCbVNkpAQ/u1QjDRd9pyskmayoTCuURKJjMxqcssd0GHYw//qGVUM9yIu/86eRKRPGxalJR1ZwzIB3xx4XmRqh3AVW+0TWMwITqXKKYwv1ysfo9pIEYgyWBF9OpJdBDGNH3GgBq+oCSwQFICLJWPJWNe16CAxxG1mY+gV4yO0Uj2a4/DV9kY6oICa3R1af+1ge1rgK9kGdEHj4vZ9KfiOJkna/3075QTr8Bi7sh3+G9mIiyEgE5+y6wAqbKuZMYx3WfXAi+L4FpRD8PhbKmXiQkpiXijaFlgXoaVNsAwEBTYUNQ+dJvOMKF5uhJLDDQ25qkeRP92Nta9mmbs4wcGEtvnmHuK32D/U+cTEevCuid2PCTyy0qLyrZIUFqUATwIpz047CbiWmJKsnK1JSNDZxBuw2qxk/tI66s3vF6xvlVXiyNkB31xh3UNninFRxNfHm1LAxbs+i7+TyRidgYGM88gwEFxC+8Npub0tt5L2wgq28RCbyRRm4nZYlP48c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261021135927099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZhpPSh3ahGSfipv0M9PEdSaSLwDMqw76THkpjPEm/BKHECUxmXvG3CFUuwG?=
 =?us-ascii?Q?tAiBTDLpzb2Oo99/Fpl+VCT/mnCh00/o90AbK3ZArb8eprstZg8TjeBR+/m+?=
 =?us-ascii?Q?dZK4mmtSDaX/0vc+AkuJK4rLNk6CqYGX1iZbg8jOFw4FAIJ9SyfS67mV2WBv?=
 =?us-ascii?Q?qt1ALsbr1VZOXZpOlkP0zSc/JKkAbzxputa89WjWFiEcXeKgABsy/rDiZLP8?=
 =?us-ascii?Q?YkAZCJLLwu9bVdaLRK5ZdO4sqaFDOiNr9ioMTOQ+eXjmg3ciPasKcpQ+aiu4?=
 =?us-ascii?Q?XDlCot1rBOc7KvIOf9d+zLZl09w+fVo3Am2wRirSbzhyYWJrKe7v4hWnCiV/?=
 =?us-ascii?Q?NRrnGkzFmOi6NxZUfPQyaIavL4tCmJ9nS2YVp5V/FXjxFwBPEAtsrFvXxJ/o?=
 =?us-ascii?Q?YpJKhRrnXH8ggAeOyvYrWqZ0SDyFlp6GOSU55cXGx/9+RyG2WPulTsj1Q81V?=
 =?us-ascii?Q?we+REefCl8wEzyhv8F17K6EoVUo7+OanaC99lepvgqJsPwke14beyc45Y39T?=
 =?us-ascii?Q?Qdr+QDpmdqozwpRS6IiPy2TrIMsCNWX7FNpGTp9rK/U1imf7WXUCesaY9Grf?=
 =?us-ascii?Q?A27XsuXou8iPoNSf3u5h6c2LcyLsbsnKMhDITI4saRqUPFnNjvhm1xJgeimQ?=
 =?us-ascii?Q?Ms+bb9YHgtcIe8XnRcu5zI//d/a0F6+60XaZZjgjOXrqmJ/fyy3K/Opq7jVO?=
 =?us-ascii?Q?SczKD63f1tE9SxUGjbkFUSyWw6hCUyRrP/OmapS6VyITioB7YXYpB75p+2r5?=
 =?us-ascii?Q?0H1A60VA3ZQUHrxXM12YPaojD2T//I+fZl9ACYekAOYC5DNyxGOcZW5EuI/2?=
 =?us-ascii?Q?2RKq4D7oQjH470SAiGqHwYM/gA4tEArgIl+ISSoRRyX2+nSSBDupBSLGzcu2?=
 =?us-ascii?Q?8azD6HjtevjQEkFFgZ6rp03aq0WWnszeBSdpaI8Yx/xkVtiwDUKgLH9EWdSF?=
 =?us-ascii?Q?B07HYEkVmbLPUdmf3dlOD6GK5coSGT6d+d29qzYG/TsToIlULh1FM2FXBjio?=
 =?us-ascii?Q?3PcWIBEsc/n9rjyZulLPBZ/ruJyC5IcNZvpkm3NialQd3OFz1fqu3BgYePQl?=
 =?us-ascii?Q?3oXvB4TLgQUFcU82dpUCIludM4O6zOzh8HJHHn4dcYibEg+7QV4iWxnj5LZG?=
 =?us-ascii?Q?p+ks6k0ewCfJ+TKrU+52ZGAGTQmSOSAEpBMLiCC/vFpcKhWpYhlNOldcrq5u?=
 =?us-ascii?Q?3cxV1F4xkqdx1xJAFS8XNlLcc1zUHyOyx5Q1C1jxlyH++jDN8liIchUPKXH3?=
 =?us-ascii?Q?CrqdsqIzVbOuKSE9wuimYoVakTSFea027CXhqTE/3cH6kPwwT69MoB/WysYe?=
 =?us-ascii?Q?tiXpxaV2NUp2HOJSJeqlAWxYXa0UD/vm+02uWjVeEs9tveamSk/8zSNv1nzf?=
 =?us-ascii?Q?OSVDNt/xpoOQliPR4/X22MxczR4Q1J1HwQ0DuXu5O0y/fXyna4oIHSKqBc9B?=
 =?us-ascii?Q?BTrbWFfthXQ1aWYoToInISAPrk+SY6eVcBa+we9wKa1BdT8isCyg3Cw7f5aR?=
 =?us-ascii?Q?TTgJccZkSPlrCMAZqXWXBGH8sBzeFkCgJU+kH2vGu71hqzgyAqzGcf2Wqb9g?=
 =?us-ascii?Q?rHLI+v+JpaCacm3k8a5pJsW6pdqGgdw4lWQuRqnYT05aJUjpGaI6Z7qFeZrf?=
 =?us-ascii?Q?4M6TInr4VL0//Jzg8Ju3plo15oGfvucRuK12Ez6RSiDoxED1wA00FTkgJrS3?=
 =?us-ascii?Q?zOJMxD/CdNn+OjRq56n40AN760s9/iCytiYJua+v5Xul5yxafTfhX1zzQ+5x?=
 =?us-ascii?Q?0H/prohdGg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a9fa96-89c4-474e-b404-08df334c5808
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:49.9321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Colib0cFip7v68xemGizMhXGPTLDcGt+Jbay98mD5X8ZLcBQXcO61fiQnRxMWSK+xAFcxWmr8lyw+zcJ9dxe7kXlMGf13XkoYJQrIbhZMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248664
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-17=
0-9

6.170.9 - 2026-10-23
This release fixes a DeprecationWarning when importing hypothesis.extra.dat=
eutil with dateutil 3.0 or higher (issue #4934).

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-hypothesis-crates.inc      | 22 ++++++++++---------
 ...169.0.bb =3D> python3-hypothesis_6.170.9.bb} |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.169.0.bb =3D> py=
thon3-hypothesis_6.170.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/m=
eta/recipes-devtools/python/python3-hypothesis-crates.inc
index 57a1c2c29ef..8df55363010 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,17 +12,18 @@ SRC_URI +=3D " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.3 \
-    crate://crates.io/pyo3-build-config/0.29.3 \
-    crate://crates.io/pyo3-ffi/0.29.3 \
-    crate://crates.io/pyo3-macros/0.29.3 \
-    crate://crates.io/pyo3-macros-backend/0.29.3 \
+    crate://crates.io/pyo3/0.30.1 \
+    crate://crates.io/pyo3-build-config/0.30.1 \
+    crate://crates.io/pyo3-ffi/0.30.1 \
+    crate://crates.io/pyo3-macros/0.30.1 \
+    crate://crates.io/pyo3-macros-backend/0.30.1 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
     crate://crates.io/rand_chacha/0.9.0 \
     crate://crates.io/rand_core/0.9.5 \
     crate://crates.io/syn/2.0.118 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
@@ -41,17 +42,18 @@ SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f8=
5d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.3.sha256sum] =3D "700d18fa267b73b9b521fd7e13580e2f446916=
f176cacee1ab63fcc8191f1655"
-SRC_URI[pyo3-build-config-0.29.3.sha256sum] =3D "7b3fc0c4d08f6bb10e71fe39d=
fb9e2f59c6eb6854e22ec8092f50c69a4499adb"
-SRC_URI[pyo3-ffi-0.29.3.sha256sum] =3D "dfc0b8e19df29aad7086cf977bb0c2a2f1=
43e30567eb113e9cf72b62ca698330"
-SRC_URI[pyo3-macros-0.29.3.sha256sum] =3D "6100e8a4b5eba53afaa5ed078364851=
a0b2499c553a44c31026b929049b49dc6"
-SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] =3D "6143877a16e82b5a727b712=
7ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
+SRC_URI[pyo3-0.30.1.sha256sum] =3D "229ca13b8a15bb0d1487b81ab975bfcd975134=
16499a8312011b6036e42e0de4"
+SRC_URI[pyo3-build-config-0.30.1.sha256sum] =3D "70130e2b6dd1ee589a8788026=
a429561ca5c40fa7a2fa7914c2282eddae24700"
+SRC_URI[pyo3-ffi-0.30.1.sha256sum] =3D "5e7ff73c555c286d212d4ce7e5fbda845a=
973c4f61bd5f160f5f2c3c2a04d1c4"
+SRC_URI[pyo3-macros-0.30.1.sha256sum] =3D "c46d2e5862c7bb8207e3b639f713dda=
3c499933444784154c11d013c5a691b60"
+SRC_URI[pyo3-macros-backend-0.30.1.sha256sum] =3D "38b89f066f2ae72a2aef52d=
1537ca2fcd104440ebfadee06e97aa90738a25b9b"
 SRC_URI[quote-1.0.46.sha256sum] =3D "dfbc457d0c7a0759a614551b11a6409e5951f=
6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
 SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8aa1=
5de382ae63b3a0c1bfc0e4d3e3f325cb"
 SRC_URI[rand_core-0.9.5.sha256sum] =3D "76afc826de14238e6e8c374ddcc1fa19e3=
74fd8dd986b0d2af0d02377261d83c"
 SRC_URI[syn-2.0.118.sha256sum] =3D "1b9ae57f904213ebb649ce6895b8a66c66f020=
3b9319718f69a5612a065b1422"
+SRC_URI[syn-3.0.9.sha256sum] =3D "d78c8dee4c7bf0e14673097256fed6142ce9d3b8=
5a408189d07482442145823b"
 SRC_URI[target-lexicon-0.13.5.sha256sum] =3D "adb6935a6f5c20170eeceb1a3835=
a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] =3D "b67efb37e106e55ce722a510d=
6b5f9c17f083e5fc79afc2badeb12cc313d9487"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.170.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.9.bb
index 0e7d97705cd..294a95618de 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.9.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "b65749d7f7a2fddfb106bb57c9902db4ab25ce8724c821f4af=
50cc58891a6b7b"
+SRC_URI[sha256sum] =3D "72fd7e6571aaf47439bda2292156a8b86c9afc83aa59b47e88=
57557576fa8be2"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \
