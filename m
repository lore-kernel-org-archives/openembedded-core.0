Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18861.1792661696939213977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zuR8oetB;
 spf=pass (domain: est.tech, ip: 52.101.70.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFoOW7rFmTy2kdKy2ZBfQFVFxGq2mUuos7Vwzs9mGWWhdsea/XhE3Oa7f1U6m/IAZ9HuHW4XblaBEqKZooNLe9BH20HTKQnQY95WbCP/5lcXmeEio983jXuumweTlIim4qPF31Nf/9Pp8H28qkCewpiSVQ1k5+Y7rFv7kldsjNc6fp1BVmqEtO/CZxn4dRWI1tWSpJDajKc/tgMUv0y1pqrb7xOc/OGxt2rGq0uzp8Sbv4VACqThnHWEBKRHO16Lx6SbfuljP9T4ris5HdWYtzOtKEH20frrzRWHmlJ43kCho4cWJba/hZ/BPxtbTUhLysOHCQtjbD5YJgvZS//c/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL22IynwmkpwENXOwJjIIkPfNguhIDWes79W3bCP8nI=;
 b=VpRg15ycPqOdHmETxgp6le/9wtQPrTIKUwuym6RuV7UVhYqlIKskRJ/dymPqoE4LIMaUgoT5SO8G/94LYVNnQ8gIiiGCFy1RsXu6cGgJdbmIz/njBhufKv3Kdr1K6LQybIIEz5zu4Ll4rOijsdvsvF3Y+ZF051p4bb2Q7vG/xLAuKiNvG5dxbhJkQMXnajikQ5k2ry4ugycHk11OMJTYxAOBGEFUDqtQAA9Sq+bsP1r96YHitCeiWBAOe63docxDWn8JybLF9YVsBfR1x4kveqxAyQFl+9fkT72kElP3WkFmWv233Zd0bTDo/qHjVKEMRof8GtgnFLZnyKbt/Q/vvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL22IynwmkpwENXOwJjIIkPfNguhIDWes79W3bCP8nI=;
 b=zuR8oetBM3UUcOBbXYvoPh9TYXJQdLjqmT/zO99yPwshZ8FtkZnIaieo6s/RLaDksLdu0ka79IlW/gAzLGjIM/FLnTlaN9a3EbaU+C5VeSASRqndBbzwnoLhgKOFP5mUlOxsL/06QbqCNYntANBuaXMjQ3EiiDqfuc/5YOFQT0GYed8WsLwWrYLFXtm2ejkj2v/IvWhRy3mh4nZEDuEcAYcrvG5JhnpHTOf8oV1rGFRYHREUlrBk2NXrAeLeBpOTU99SBR4HgBg13L8GvFJ+6RE8ac9cXVtvVGyAwpCZYnIwFtHCbGYrIm/ijMIeMiKA55Br3kZ+H0UfYGfmPHa0nQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1249.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:242::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 09:34:52 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:34:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libtraceevent: upgrade 1.9.0 -> 1.9.1
Date: Thu, 22 Oct 2026 11:34:43 +0200
Message-ID: <20261022093445.66335-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
References: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0351.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1249:EE_
X-MS-Office365-Filtering-Correlation-Id: 896b2011-df0d-4d96-41d2-08df301fb92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|56012099006|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 6NMt92Oi/SW6QqSe7rSx+Y/i+Vkb11AohfNlj+wVEddhFZh3Hr6HZCaFH0dnTjQt0yQAK/LXeGH1BnwQ5MFPA9OaL7c2inqVVRxQDCfUg7nGxHG+YYKj3CzhqaP77HX3KxWzCnqUNM1TWCr9+NavkcYV3q2xWomQKkUo2ahTtIjgRPLVTJnUwNZN4EMpSHRio9NccVB4Sqmn3xDvQ3rmMnYGRGCM4ka2a+O2JXjHUqokRTFE7pAjHb0lMSsMZsnPSlMVRJPdZ4L7cT1v4OcBQwMUUYHwuD6B5CBKiI/U0zmSIJWImUI0i4URT5dKuOmODqPA8TjHETLBlvZ6KsZLV24Tlcf0mD6JHZry2WIWGi/NPuSxaRMYzek+BFMvkFVtRGA6WrCcICD151SR6o6tw/5dmX5Y3x4rfQy2/KaaCafrSHDx2Ew1Clmzn2adkZsi1wJGhNP9voXsc2gD+TLI2jIiJTTKL32oNOTs3U0PrJ05H7XTL+hrBdt5wMkm6bnIWO3q2zY6qmC3lXAYDFEGs0qN0MeaVSc+34mtEe3yTJfNdE4dYSREcvsbzHcobjy+4f0vC1tAXa8KdLE0JoJ9QEwK1oxRGuCEWlLUSP5RIHTSdpzgdKgK5NQTdLVUe8f3aIF1rXZP40rj+hw4bxJTcFUg5D0XnCdJZ/Rqqse5cY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IHFT4o5bv6E1FbqDHKi11R47cikehp/VbLrDksSiBLwyBa0PTCIqX2sp9+w1?=
 =?us-ascii?Q?VKGtXZivK5e48uwRKFye2pGyIPqrmG9R5IGlLKGBhm+jhbvGnUecDJ+JmXV5?=
 =?us-ascii?Q?cYzsJidveanE46f9oIN9vNI4p9j22mFhG94ME54R09dML+cVQBCQOJMfG3tJ?=
 =?us-ascii?Q?Xv6xCeBTs51awpdEry3cOiFTw49qBR3qsA5xQbM+1nqizB/AmJODFLzVyX+X?=
 =?us-ascii?Q?x8t10+8u9aNWcc9M6tl6Ec0AaKisCJNXm/45xcNRJU5e8iwkZcW6mulwT6US?=
 =?us-ascii?Q?LcqTC7kfth+6XfEY2iQINiivQQW6rRjhNhRzqkOY+Xco2m2nSsZsFH866fpE?=
 =?us-ascii?Q?h6QI/cEQ8SGlI6RQT5/ZOJOl/tYgQ6/m8gBUEgr9MLBrugC7Yuf5oSjSuqt3?=
 =?us-ascii?Q?wGpG0onJE3reEhoIZpVbyxJkIXMFS1JsKAntStLel4fRKc3SItClv2dEf7rq?=
 =?us-ascii?Q?UAcF7eov+83xZx4SzCmsdLr9/VwcWvb2K7Go3qp5GADK2mIqUry2WFLvw1Vn?=
 =?us-ascii?Q?ZboZV++4pYInvUrSIiZUhd7GUtDRg8iEPeyuAlojnIHKqSZ0CQqV2E3lw0xG?=
 =?us-ascii?Q?BFIRc6Um6VRpTlgUfr42vGkrhcEPiqTbj+Kkz0GcZiKU5l9aqvzh13boJtBM?=
 =?us-ascii?Q?DnE/dmH1q3/0chGM4d8z008a8xO18f8y5r1bI2kmIisywJbOechFS7x9o7Zz?=
 =?us-ascii?Q?7MFzHttZt8MYVoREgNKkwyLUF7QW9Y+K445x6L13KRSSdvMI1Q5VXIEgHPDM?=
 =?us-ascii?Q?6btxdO2RNEw279FICfKC0rKQcXg3m4e5jg3WQdO4mDMigbJ1Vpf9JDdBcQkZ?=
 =?us-ascii?Q?IKax1ZWrAJTl73hpK7D15p3xgIf7tIMSsl0zJ3ri36R9eTqQpdO+ggUR0VS3?=
 =?us-ascii?Q?copYIrkd3MniGLRNmaWx16sVFb4qjIt1desPcbE50fciaQ+mK8LW4RU555aR?=
 =?us-ascii?Q?EkWM0QKgfgYVjHo2hdTcFfhTqOA47P2bgkYjIH3jH4S4FbQB6eteEXm3+lNe?=
 =?us-ascii?Q?fWAeawdu4qwOiEBKlRPZbCnTGJmaE4SSn1CBHf3t7pYyvJmd10iqPo/ga31a?=
 =?us-ascii?Q?y1NazEzGKtTc/eK9I346Kf9sVVWDfCPer46lu7O4sCwk3/BM3mAt1RPT3NXt?=
 =?us-ascii?Q?Qgyp/S6XsfVH6hFjV4IvO7VoHcxuad8H9QiA5ibQfKBN+OdRXkL8PqWd4p97?=
 =?us-ascii?Q?ZXfPqzc0apWivp5yhxl7x4MZY4CAQE+YzPXPteGU7xvLLtnsHCiVitn9cmrl?=
 =?us-ascii?Q?xWPL/RXBedOslsVa6FX6BrlaGIEClyEEf6xOaFA2Sqo8xOKemhAKHJVRLbX/?=
 =?us-ascii?Q?2WJE6/qDMLu/+9Hg87CI/s89IZ05X9arZXr6cG0S8taUAYNjyOnfU0TE1eD4?=
 =?us-ascii?Q?awXclj2ZRBltPqvmC/Irz438lwKAKfZjBn75lwckbJpOs+YNsEJwvnVdDGFY?=
 =?us-ascii?Q?8rSQMOQYZJVB1EmkQ77igcqprIloSIZjv55Bh9xVpqRSQhPy2Z+qU0E5CW2+?=
 =?us-ascii?Q?oqwCZl1O5xfCocHndSyqVIG7waftMSTIbtKyaDIR9CNX64sRrMy27eFPIKOn?=
 =?us-ascii?Q?knYObZrZNq/faFmz78dC9iDmB98RH87/hF94tHzvY5doj7UbBMJ5+DdNwgvl?=
 =?us-ascii?Q?qkywpEP/44yeqvyQ4P+wzSNPs1kysKN6QzRVKo3w28rPY7PgUOwCeXp0nFw3?=
 =?us-ascii?Q?UMZgfGrw7LYdBCzjFFNYO9byzbvGpgNOczP4ameura0ztxRIAToBTfZvwfGP?=
 =?us-ascii?Q?Yki82RvP1Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 896b2011-df0d-4d96-41d2-08df301fb92b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:34:51.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcQUoQIDA1SuGYkz8GFo8GVs6vIsefdJ8iISKthSgL0bbVz6rxjd3palGrsfKZxo/cVfEbLWbO7CJUJ+8mdCK1VdlxyQhB5ex3Lz+PsV8p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248428
Content-Type: text/plain; charset="utf-8"

libtraceevent: 1.9.1
kbuffer: Fix kbuffer_missed_events() when sub-buffer starts with a timestam=
p
libtraceevent: Fix leaks and NULL check in process_int_dynamic_array()
libtraceevent utest: Avoid host-specific getname_flags output
libtraceevent utest: Handle short reads when reading BTF
libtraceevent: Avoid racing recursive builds of both libraries
libtraceevent: Reject non-text symbol arithmetic
libtraceveent: Add printable characters
libtraceevent: Parse %pB and %pa address specifiers
libtraceevent: Pretty print function parameters of enum-type
libtraceevent utest: Fix type of args in test_btf_read
libtraceevent utest: Read btf file in utest if mmap fails

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{libtraceevent_1.9.0.bb =3D> libtraceevent_1.9.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.9.0.bb =3D> libt=
raceevent_1.9.1.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb b/met=
a/recipes-kernel/libtraceevent/libtraceevent_1.9.1.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.9.1.bb
index a44253a567..ca6aead9b6 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a7537=
1ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50=
909238dbd"
 SECTION =3D "libs"
=20
-SRCREV =3D "13701b5532e0c3295bf5670361692b0d0044228d"
+SRCREV =3D "34ee98e346e6c8f6586fa3a67db5ba2380403bc3"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;=
branch=3D${BPN};protocol=3Dhttps;tag=3D${BPN}-${PV} \
           "
=20
