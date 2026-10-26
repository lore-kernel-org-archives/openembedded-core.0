Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40072.1793010714082523059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SCvnj5Hz;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HU5jHezeMXecmDqW0Ni8iiTGZ3Kz6F/QDdlNWVIZaeQZtc7/bRKIbiA7TaIU+wsc0pRB2eV/QHXPyI9FC4UVrOqUqF7X3IyXffe5bSASXnP8v54c5iLbH+OsCmWgO7TWqNm8JnrEljjzyTlMeLZ/AcM9c707kAmHSIcZwkmJ8+BBlCfT4wVmxs505YYWUDM1w36hHQFPU7Olpf3JylXAd73HvVYSwLDCJPli27sO3iKEMez2ufTfKvwbh9/Wjqkf8lGb3BHmqwRcFO1GimrQNfFW95rxHGETS0gWLuHPDc2eA5sRp7uP1QesxmXZs5ZRJ1u4JKn05lyyiihlpr0Cvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85uLoxsqdWO2r/X4IeFoIt2QFy/FNCH9ch0TGb7kOfc=;
 b=yh3MzYcKVKiwIuy7ubfzOYTh12bh1s6zIwmy8a8p9kwFS3tFQwejdJGWHCztTZRWiybvkkciw62hBXDnkDEfFUizPMe6i8cGb2C8IUQ5T8DEy+bTqV1v+ld8BF3FzFBF1N5GJgCgeZNkPOtgQu5v4sW6PTqUlSEHIkibdieWmV23BbrPKUBslUadKbO9Pe5pbM8sBXew97lfHQwJS5NO5/7d/3SU1YEpAczZvkvMPnL21gbNMYwyF8w44rDW4flS95NJ2zMqg+BgtrBol0CTRSGiJLXLdyC+6p4OnwXbzkz13oAcCjsH98D1wTpCQTSGbi2uC9PZqWtZjzkwVUC2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85uLoxsqdWO2r/X4IeFoIt2QFy/FNCH9ch0TGb7kOfc=;
 b=SCvnj5HznU8Wmyrj7CqBITI27OIdK1o3HP5KQRkisKjoofj1ihG9vtFr2QxF6rBiq51j3eaO31L6Aqix0fLIbl3o7H0z+8NWRhIOmFAG/xKE5WNHwuT7SEkAjBFsI1ewJyGFhhRa4VbyklJD5NQjNkAxEFLvKn9hi1/7H4TuGK1VCVbH2/72Hf/EfA9KTOH6AoClJkOmjt3wULKXKQLuL+Wj4hnI/JLMXgyUGhYi6InY7ZBUywpf9If8eWUODTC287iBaWEQXMVRPZyDguj8MZkxiGVKjzZTQVjxdmCnLnB74rZUhY1jdG87Yn155nGOcr2Eb3WmmU3u3dnSQIc81Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] librsvg: upgrade 2.63.3 -> 2.63.4
Date: Mon, 26 Oct 2026 11:31:34 +0100
Message-ID: <20261026103138.3137-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 43988d99-6ffe-48ce-c3ae-08df334c5a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009221227099003|261009223027099003|261021130227099003|261021135927099003|261021133027099003|261022113327099003|261022115727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: BEApJ5rmNvZKRNCOPfzVvDL2ulT6OzknIABK9F/R+PKPiMp9/Wmt31+i9Cb9wvAIQQul5tExCZ6txE6WE8qQHNTfvvmeuZG22MHq+E5wx+91Hb7++QOnZA7ohgNITa/VubnUC9qf1ygUFxnawYNCQZw1h0duh1DgB+IYmp/X87HVG8RqVqxaAiTCN9Y6YFvT4EgWwk1qO3Dn0WqvOCIMGD0vjxZFFYETtvao3eajIvgfUGJGpOTyNJRnutaOwnO0vLBRlwv6RIFKWakg1ls8pSBQQaxkR9OY0U5nLC0yUnpJQjPVSS4JZBz+xhv41hNUivgXrvvE924rbpdaqUTp4N/HXa4a7MfuXdLXKoyxZCCHU/BTpNE/51ilpDaZtJ0DjsL85VtGTn937dt9Kmq2jXFpig6rFFbGIEdbqIYckY+Q8cjB3pf+vo7avFA5oI84+ZFG1NywUAVBXeiTfnLkiTIl3n6sPgUs047cp7C98emM0Ipe+1BqhkAzrzFglWYczEkdjyjLG00tLzWHz7wtquzgT28CUUeSaZ5XiVjt0fUhidMKDSQANmGlZcuH5oekHn5jiRG1pLYBKxJuSqLRCJ78/mrAAkc6fyauB3vrExkp6Opzp0ijhuQdyuHhCWcDRQPdX0NI9J8IdqdYPbUL2TCKiFVtBRO2v1+HkA2gNlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009221227099003)(261009223027099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022113327099003)(261022115727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zn0OOgMQ/d1Lb4IHbn0X3mpb1MrpAZkR8L9O/N0pyxmUhvnCtypNjLKtl1NT?=
 =?us-ascii?Q?2WuHrWiEi/YCtT8HwbPfvZjdjiAtLtIVLaTon/B96ONzVLGPKf3V/CV46WjF?=
 =?us-ascii?Q?FcLpaVGnjvYZxz0KPLjLat/SqN/uYivGSSQ3brWyvKnC0hxoJCleXt40Jvds?=
 =?us-ascii?Q?gi78wrgcOq7HVlzu5DLAjdvTszQ7zCwf8WKb/n3yo7O9PAsvMkUe2jOwPBXt?=
 =?us-ascii?Q?ARNTWOgccbY/7w6GSKPNN6Q6T1h04IHCQrHKzH6EXCtjBNRSdqx1zdC0wT72?=
 =?us-ascii?Q?gadFiGbIZy3nPa/aUWGiGd/yyrw5bFnrd8B0+OLDjidaWMlDKI8+KyWWacyl?=
 =?us-ascii?Q?so0NmMJHmNHz4See59ltCXEUKZueWe1K+HyG9mBI0SNBFK+c1FTHzs/roRSd?=
 =?us-ascii?Q?P8nIwBCp6Zuphyvz5BIuzxCWW9LK3xW9qIo4sHxmzxBCWNshpyCc4rCcspgB?=
 =?us-ascii?Q?YuEnOUMjRtQBsr7Bm50dswh9QWgRe5tIqg250JWd8LU6RmC0KBsMP+Ng4W2H?=
 =?us-ascii?Q?/o9KPyNAfUcgRvee97TxM2Us9/QEuNEViueXzEjnR0KsZ3ed+F9V7JCuNRRW?=
 =?us-ascii?Q?CF1U2ZgcpsiPGfmQEp/GQwXQxt51g7fntzGmjb6vZy26v4K4SXuti151YyOz?=
 =?us-ascii?Q?rl03ce+kmoKKAANpCiOxLfXrdtLGiLB6k2VDwt7DVWm0fUWbwU3+SBj9fwut?=
 =?us-ascii?Q?fbevQItfwIX9c/QsfOcjVca5y/9XWOv5aMq5Y96AkemjgQlg2xHOgQT1ewq4?=
 =?us-ascii?Q?5FZMGgBOS+ubxeMJaeM2++A3LdUBU4/SqbpZeV7sXf9mZ8CdyoRodIr1ASL3?=
 =?us-ascii?Q?ryBuiie+LuULtJQRJ3yTpRclrPPu6Q0ewDknwpVcCws8vLcF58pyuol1rQQH?=
 =?us-ascii?Q?czMXDF/U3qKWz2MM6fiQ9LFfh9DlAWzpK/khf/30KTbXxmuy+qcS8WiG5IqG?=
 =?us-ascii?Q?NULH2U66x4sAwaG82cJzASFqu69AcMhfyEUK6bjV4Q3fhzaJKKF3S48KOCZx?=
 =?us-ascii?Q?7GW9CohHwD1roJIElBw44NuuYQQrgcMFUp+qF5Ka3qBy3mA5rCeg36xEAsDt?=
 =?us-ascii?Q?Jme0sXcw11W4kT8oUYa2Y/QpxDR/E8zvGGsfmVvV+O5fc8IhL93WKgzkzznj?=
 =?us-ascii?Q?4r3XWS+Rp8Mx+UxjKwaf2FLYWd/prRAvgwzeU9n1iscUvempqk4LNn1JL+TV?=
 =?us-ascii?Q?fhUdX6baLXEMdMcgg2Z43lqoJ6nZlXprh5DmK+/60vYUXxcw5iHrbTW2yKo1?=
 =?us-ascii?Q?2pL5u90h/258h5S8Oax1eZGis5Vs1wtj1S+uNBtnaDib2OhmbWv0jYiQ6WtF?=
 =?us-ascii?Q?/kGcGBexqtpaj6gHALkSVGhvdfFmqIFu989j06PuSh/HEOQ7+nFP4MaNDJiF?=
 =?us-ascii?Q?0QH3025JwhBjHcegFI8bmKbz/V2AklfsMyZ+X+qjh1HWL7glU5BCBsR0PjsV?=
 =?us-ascii?Q?pXwEdTXEL0ndYhjITQ/OXnNGSYT/MoNYQlClhuShMZSxGFLglGr42YSGWcsX?=
 =?us-ascii?Q?1DVzaLlVR469e2jNAcyzidUZRvKum+KzRAhwzpAsRAOLcpplCxm9xqtuhWUO?=
 =?us-ascii?Q?Js376oah0uahmg+2ZUzlNgJPu6ZQlh/6w8cqvZU8AqiKB0b3Vt7x7F2bz9Ag?=
 =?us-ascii?Q?uvjKa0Z2+6+x0xfEit5d/PZRBIh5sAZDjKD3vlehy3l0RnwRSZ8ocH7ZEUi7?=
 =?us-ascii?Q?Ie+wbEa7ZAKlpMGffEJ3s4NJd64JA3zVDJH46gzmHLWTAgz+vWbXP+JjFxE4?=
 =?us-ascii?Q?EVZWgtwj/g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 43988d99-6ffe-48ce-c3ae-08df334c5a0c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:53.2764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZxU5jqJKUNhC5wKeKkF00xhu4iVp7aNFx18mNi0jTe9EBe/mNMXplVq8bER65ovmk5vYfD4KDSlFrY23eix6IRwwgrQ9CggjoTwFABXeMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248667
Content-Type: text/plain; charset="utf-8"

Version 2.63.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

librsvg crate version 2.63.3
librsvg-rebind crate version 0.3.0

- #1233 - Handle EXIF orientation in images, and handle the
  image-orientation property.  Note that the only values supported
  for this property are 'from-image' (the default) and 'none'.

  Note that this will change the rendering of SVG documents which
  assume the images with EXIF orientation data are not auto-oriented
  correctly.  In this case, please add the following attribute to the
  corresponding image elemnts:

    style=3D"image-orientation: none;"

  Special thanks to Mark de Does for providing the test files for this
  feature.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-gnome/librsvg/librsvg-crates.inc | 76 +++++++++----------
 ...append-RUSTFLAGS-to-rustc-executable.patch |  2 +-
 ...e-care-of-deprecated-assert_cmd-Comm.patch |  2 +-
 .../{librsvg_2.63.3.bb =3D> librsvg_2.63.4.bb}  |  2 +-
 4 files changed, 41 insertions(+), 41 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.63.3.bb =3D> librsvg_2.63.4.b=
b} (98%)

diff --git a/meta/recipes-gnome/librsvg/librsvg-crates.inc b/meta/recipes-g=
nome/librsvg/librsvg-crates.inc
index 8574ab937ce..25e76f020fc 100644
--- a/meta/recipes-gnome/librsvg/librsvg-crates.inc
+++ b/meta/recipes-gnome/librsvg/librsvg-crates.inc
@@ -40,7 +40,7 @@ SRC_URI +=3D " \
     crate://crates.io/cairo-sys-rs/0.22.9 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/cbc/0.2.1 \
-    crate://crates.io/cc/1.8.0 \
+    crate://crates.io/cc/1.10.0 \
     crate://crates.io/cfg-expr/0.20.10 \
     crate://crates.io/cfg-if/1.0.5 \
     crate://crates.io/cfg_aliases/0.2.2 \
@@ -62,7 +62,7 @@ SRC_URI +=3D " \
     crate://crates.io/core_detect/1.0.0 \
     crate://crates.io/cpubits/0.1.1 \
     crate://crates.io/cpufeatures/0.3.1 \
-    crate://crates.io/crc32fast/1.5.2 \
+    crate://crates.io/crc32fast/1.5.3 \
     crate://crates.io/criterion/0.8.2 \
     crate://crates.io/criterion-plot/0.8.2 \
     crate://crates.io/crossbeam-deque/0.8.8 \
@@ -97,7 +97,7 @@ SRC_URI +=3D " \
     crate://crates.io/fallible_collections/0.4.9 \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/fdeflate/0.3.7 \
-    crate://crates.io/find-msvc-tools/0.1.14 \
+    crate://crates.io/find-msvc-tools/0.1.15 \
     crate://crates.io/flate2/1.1.10 \
     crate://crates.io/float-cmp/0.10.0 \
     crate://crates.io/fnv/1.0.7 \
@@ -134,19 +134,19 @@ SRC_URI +=3D " \
     crate://crates.io/hybrid-array/0.4.15 \
     crate://crates.io/iana-time-zone/0.1.65 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_collections/2.3.0 \
-    crate://crates.io/icu_locale_core/2.3.0 \
-    crate://crates.io/icu_normalizer/2.3.0 \
-    crate://crates.io/icu_normalizer_data/2.3.0 \
-    crate://crates.io/icu_properties/2.3.0 \
-    crate://crates.io/icu_properties_data/2.3.0 \
-    crate://crates.io/icu_provider/2.3.1 \
+    crate://crates.io/icu_collections/2.4.0 \
+    crate://crates.io/icu_locale_core/2.4.0 \
+    crate://crates.io/icu_normalizer/2.4.0 \
+    crate://crates.io/icu_normalizer_data/2.4.0 \
+    crate://crates.io/icu_properties/2.4.0 \
+    crate://crates.io/icu_properties_data/2.4.0 \
+    crate://crates.io/icu_provider/2.4.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.2 \
     crate://crates.io/image/0.25.10 \
     crate://crates.io/image-webp/0.2.4 \
     crate://crates.io/indexmap/2.14.2 \
-    crate://crates.io/inout/0.2.4 \
+    crate://crates.io/inout/0.2.5 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.15.0 \
@@ -160,7 +160,7 @@ SRC_URI +=3D " \
     crate://crates.io/js-sys/0.3.106 \
     crate://crates.io/language-tags/0.3.2 \
     crate://crates.io/lazy_static/1.5.1 \
-    crate://crates.io/libc/0.2.190 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/libfuzzer-sys/0.4.13 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -273,7 +273,7 @@ SRC_URI +=3D " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/siphasher/1.0.4 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.3 \
+    crate://crates.io/smallvec/1.16.4 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/string_cache/0.9.0 \
@@ -285,7 +285,7 @@ SRC_URI +=3D " \
     crate://crates.io/syn/3.0.9 \
     crate://crates.io/synstructure/0.14.0 \
     crate://crates.io/system-deps/7.0.8 \
-    crate://crates.io/system-deps/9.0.0 \
+    crate://crates.io/system-deps/9.0.1 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/tendril/0.5.1 \
@@ -295,7 +295,7 @@ SRC_URI +=3D " \
     crate://crates.io/time/0.3.55 \
     crate://crates.io/time-core/0.1.9 \
     crate://crates.io/time-macros/0.2.32 \
-    crate://crates.io/tinystr/0.8.4 \
+    crate://crates.io/tinystr/0.8.5 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.13.3 \
     crate://crates.io/toml/1.1.8+spec-1.1.0 \
@@ -307,7 +307,7 @@ SRC_URI +=3D " \
     crate://crates.io/unarray/0.1.4 \
     crate://crates.io/unicode-bidi/0.3.18 \
     crate://crates.io/unicode-ident/1.0.27 \
-    crate://crates.io/unicode-normalization/0.1.25 \
+    crate://crates.io/unicode-normalization/0.1.26 \
     crate://crates.io/unicode-properties/0.1.4 \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
@@ -341,15 +341,15 @@ SRC_URI +=3D " \
     crate://crates.io/xml5ever/0.39.0 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yeslogic-fontconfig-sys/6.0.1 \
-    crate://crates.io/yoke/0.8.3 \
+    crate://crates.io/yoke/0.8.4 \
     crate://crates.io/yoke-derive/0.8.4 \
     crate://crates.io/zerocopy/0.8.63 \
     crate://crates.io/zerocopy-derive/0.8.63 \
     crate://crates.io/zerofrom/0.1.8 \
     crate://crates.io/zerofrom-derive/0.1.8 \
     crate://crates.io/zerotrie/0.2.5 \
-    crate://crates.io/zerovec/0.11.8 \
-    crate://crates.io/zerovec-derive/0.11.6 \
+    crate://crates.io/zerovec/0.11.9 \
+    crate://crates.io/zerovec-derive/0.11.7 \
     crate://crates.io/zlib-rs/0.6.8 \
     crate://crates.io/zmij/1.0.23 \
     crate://crates.io/zune-core/0.5.3 \
@@ -394,7 +394,7 @@ SRC_URI[cairo-rs-0.22.9.sha256sum] =3D "df683f1d30b4579=
64673a5541a4603208ef95ab687
 SRC_URI[cairo-sys-rs-0.22.9.sha256sum] =3D "ee548131103ad8f698c6725669647b=
9c757b3b66992dd6a026037596417bee21"
 SRC_URI[cast-0.3.0.sha256sum] =3D "37b2a672a2cb129a2e41c10b1224bb368f9f37a=
2b16b612598138befd7b37eb5"
 SRC_URI[cbc-0.2.1.sha256sum] =3D "ce2dc9ee5f88d11e0beb842c88b33c8a5cf0d132=
9c4b19494af42b07dbfe8896"
-SRC_URI[cc-1.8.0.sha256sum] =3D "6651c9ed80effdc7db0ff72512157f901af5e3549=
e341e24b1dd4887d836d838"
+SRC_URI[cc-1.10.0.sha256sum] =3D "86e055fa6e3e40ad6187ba25b6855eeb635d5271=
f8e0f0e1e9a5826b8d75bea0"
 SRC_URI[cfg-expr-0.20.10.sha256sum] =3D "9ba9e9ec16c447027685b1f897b720e18=
e9a8afd00bd7332c483537e38086c9f"
 SRC_URI[cfg-if-1.0.5.sha256sum] =3D "4e7648175b45a9a48536d676f68d918270699=
102aa8dab5496df06904c914600"
 SRC_URI[cfg_aliases-0.2.2.sha256sum] =3D "f079e83a288787bcd14a6aea84cee5c8=
7a67c5a3e660c30f557a3d24761b3527"
@@ -416,7 +416,7 @@ SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "77364=
8b94d0e5d620f64f28077744574
 SRC_URI[core_detect-1.0.0.sha256sum] =3D "7f8f80099a98041a3d1622845c271458=
a2d73e688351bf3cb999266764b81d48"
 SRC_URI[cpubits-0.1.1.sha256sum] =3D "15b85f9c39137c3a891689859392b1bd4981=
2121d0d61c9caf00d46ed5ce06ae"
 SRC_URI[cpufeatures-0.3.1.sha256sum] =3D "5ca28b0ae3115b884660db4118d80379=
1fd6756b6e88f39c0f3f7859060d7566"
-SRC_URI[crc32fast-1.5.2.sha256sum] =3D "01a7799fd6b852db0e61728dde9a204c42=
3b44d689dbd432522543614b490e78"
+SRC_URI[crc32fast-1.5.3.sha256sum] =3D "0ba106e844045ddc02c20768ac4b0b7cb4=
5f2cc2ecbd833ac9f5dacb183c2055"
 SRC_URI[criterion-0.8.2.sha256sum] =3D "950046b2aa2492f9a536f5f4f9a3de7b9e=
2476e575e05bd6c333371add4d98f3"
 SRC_URI[criterion-plot-0.8.2.sha256sum] =3D "d8d80a2f4f5b554395e47b5d8305b=
c3d27813bacb73493eb1001e8f76dae29ea"
 SRC_URI[crossbeam-deque-0.8.8.sha256sum] =3D "622f3fc73690be383c7214310406=
f28a90e6edeadc3cea882f9d71e495b9711a"
@@ -451,7 +451,7 @@ SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f5=
1a36d69f866391735b51691dbda
 SRC_URI[fallible_collections-0.4.9.sha256sum] =3D "a88c69768c0a15262df2189=
9142bc6df9b9b823546d4b4b9a7bc2d6c448ec6fd"
 SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c79=
9f85e97da1ab5b7910be3c1c80223"
 SRC_URI[fdeflate-0.3.7.sha256sum] =3D "1e6853b52649d4ac5c0bd02320cddc5ba95=
6bdb407c4b75a2c6b75bf51500f8c"
-SRC_URI[find-msvc-tools-0.1.14.sha256sum] =3D "aedcfb3409746eddb02b9e19ebd=
a1c3394f759a152e48ee875a0844d1b955484"
+SRC_URI[find-msvc-tools-0.1.15.sha256sum] =3D "1c66915cc5391097de7a2b0b972=
e8505aa33c0df401fd3a6811dbdb32881ba48"
 SRC_URI[flate2-1.1.10.sha256sum] =3D "6e634e2e0ebac1ee034020da1ca582e17ffe=
4e0f5e985823721e168928136dcb"
 SRC_URI[float-cmp-0.10.0.sha256sum] =3D "b09cf3155332e944990140d967ff5eceb=
70df778b34f77d8075db46e4704e6d8"
 SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2da=
24a9afd88aca000531ab82c1"
@@ -488,19 +488,19 @@ SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38=
b55b444b5e3b60a884b5d30c0fca7
 SRC_URI[hybrid-array-0.4.15.sha256sum] =3D "27f864f10dfb56725ce5ce5472bc52=
252c8f93a4ab86327122cebf62c5f59a17"
 SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9ef=
0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590ba=
56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_collections-2.3.0.sha256sum] =3D "fa68d21081c4a05d5a901a1c62ad=
d574c77048b6a1c67be3b50ce0b60d4ca513"
-SRC_URI[icu_locale_core-2.3.0.sha256sum] =3D "d56e28588da92eee5c3201a6eff3=
3fabdd49b62269c8938d4ff050ce4d900deb"
-SRC_URI[icu_normalizer-2.3.0.sha256sum] =3D "12f9cf5f235641ed274641dd81c3f=
28d870e276763d0797aeeab72317b1c646f"
-SRC_URI[icu_normalizer_data-2.3.0.sha256sum] =3D "1563da1ed3e0b3bf3d74c9b8=
5917ac9c56464d2f57242270c09c9e752f8021a0"
-SRC_URI[icu_properties-2.3.0.sha256sum] =3D "7e7ca276ad3145661a65914e6daf1=
31ca5120cd3dcee8f8f3214b8875184a148"
-SRC_URI[icu_properties_data-2.3.0.sha256sum] =3D "e590f038c1464a96894fd6d1=
0127e90a8be4509f56ff7ecef851b15cee0b7caa"
-SRC_URI[icu_provider-2.3.1.sha256sum] =3D "d27bbb9d3abbefac45d55f647c9de1d=
44aafcd1186eb91879afef17c396c3e73"
+SRC_URI[icu_collections-2.4.0.sha256sum] =3D "fe090a42a0d3140fed8c63263ed1=
fecc02422cb2f4bfe55cd8de2de1b8e105dd"
+SRC_URI[icu_locale_core-2.4.0.sha256sum] =3D "25d29b57c17c6528d0dc4c2141cf=
a2d08200465acb537a3909c8b9b8a4a984c0"
+SRC_URI[icu_normalizer-2.4.0.sha256sum] =3D "404a3b8c486f205c87fe7f23ab689=
4d84a4ad76d6e4671ae1981ba7def87c599"
+SRC_URI[icu_normalizer_data-2.4.0.sha256sum] =3D "20f0088bfb7441f7a37fa0c9=
e20cb1e9cba1cac6b9ce8cd2a6dc44294f8e8cbc"
+SRC_URI[icu_properties-2.4.0.sha256sum] =3D "2ea83d991c56158f7cf898bf86436=
c1dfe7c07ee82fe88951f2695c9f37a379f"
+SRC_URI[icu_properties_data-2.4.0.sha256sum] =3D "b98f29af82d02b163fe50161=
388350e743bb3107cc8e8c2f7314cb505faddfcf"
+SRC_URI[icu_provider-2.4.0.sha256sum] =3D "413099315636c588ee8f011190b329b=
971a09a8fae9d157e01dcae8379468514"
 SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994f6ddc501886a45c7d3d=
62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.2.sha256sum] =3D "cb68373c0d6620ef8105e855e7745e1=
8b0d00d3bdb07fb532e434244cdb9a714"
 SRC_URI[image-0.25.10.sha256sum] =3D "85ab80394333c02fe689eaf900ab500fbd0c=
2213da414687ebf995a65d5a6104"
 SRC_URI[image-webp-0.2.4.sha256sum] =3D "525e9ff3e1a4be2fbea1fdf0e98686a6d=
98b4d8f937e1bf7402245af1909e8c3"
 SRC_URI[indexmap-2.14.2.sha256sum] =3D "cc4e190f5d26ca7051642629da2c52fc03=
bde85a03197c99408dcd291734c855"
-SRC_URI[inout-0.2.4.sha256sum] =3D "3ce983bb6fb399067d101fbfc9e74174e07e9f=
29a2bc679efefeb8c645819c3f"
+SRC_URI[inout-0.2.5.sha256sum] =3D "3b5cf4372d022092674a83b8febf5865f7a573=
cc0c5baec5e49c879b6a20978f"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33f2=
d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.15.0.sha256sum] =3D "8b4baf93f58d4425749ca49a51c50ebab=
072c5df6994d08fed93541c331481dc"
@@ -514,7 +514,7 @@ SRC_URI[jobserver-0.1.35.sha256sum] =3D "1c00acbd29eaba=
d4a2392fa0e921c874934dbbf41
 SRC_URI[js-sys-0.3.106.sha256sum] =3D "7883d941dae510fb2d978fc3fe018c71c9e=
2892fd38854de3e8b92c2e5ad9cc5"
 SRC_URI[language-tags-0.3.2.sha256sum] =3D "d4345964bb142484797b161f473a50=
3a434de77149dd8c7427788c6e13379388"
 SRC_URI[lazy_static-1.5.1.sha256sum] =3D "20870f649af7073d53e38067b2a84312=
175d56ea15217e1b15bc83506ec50afb"
-SRC_URI[libc-0.2.190.sha256sum] =3D "ce5d3ddc6d3fa000eb1536d85e147bfe31aac=
aba692ed6a876f95cb7c855be78"
+SRC_URI[libc-0.2.191.sha256sum] =3D "65cd87c9a6d60536580b316ad985726104730=
a5151c99845f2490428ef91240a"
 SRC_URI[libfuzzer-sys-0.4.13.sha256sum] =3D "a9fd2f41a1cba099f79a0b6b6c356=
56cf7c03351a7bae8ff0f28f25270f929d2"
 SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79a6=
ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b251=
670a91556f4144941d37452769c25d58a53"
@@ -627,7 +627,7 @@ SRC_URI[simd-adler32-0.3.10.sha256sum] =3D "3a219298ac1=
1a56ea9a6d2120044824d6f01ae
 SRC_URI[simdutf8-0.1.5.sha256sum] =3D "e3a9fe34e3e7a50316060351f37187a3f54=
6bce95496156754b601a5fa71b76e"
 SRC_URI[siphasher-1.0.4.sha256sum] =3D "33f4fe9184a62d842c9ef383018f3306d8=
ba224fd9d836f56d7288308847c256"
 SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.3.sha256sum] =3D "5b3dc8af474f516a851ff4bd12db780f94=
8b9250ad37211e4eec0bccea54e01b"
+SRC_URI[smallvec-1.16.4.sha256sum] =3D "d0d5d4b1981b8bbbb7aed204cae5726d68=
3d5d6ac7e74ec54122ea28f315e7c8"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be8dc25455e1f91df71bf=
a12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140eb=
1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[string_cache-0.9.0.sha256sum] =3D "a18596f8c785a729f2819c0f6a7eae6=
ebeebdfffbfe4214ae6b087f690e31901"
@@ -639,7 +639,7 @@ SRC_URI[syn-2.0.119.sha256sum] =3D "872831b642d1a07999a=
962a351ed35b955ea2cfc8f3862
 SRC_URI[syn-3.0.9.sha256sum] =3D "d78c8dee4c7bf0e14673097256fed6142ce9d3b8=
5a408189d07482442145823b"
 SRC_URI[synstructure-0.14.0.sha256sum] =3D "901704edd0dfe137f1987838ee4f25=
9e4e063c31371bdb423f7ae38ec6f77f02"
 SRC_URI[system-deps-7.0.8.sha256sum] =3D "396a35feb67335377e0251fcbc1092fc=
85c484bd4e3a7a54319399da127796e7"
-SRC_URI[system-deps-9.0.0.sha256sum] =3D "8a0dae2cbca1f0ff93795713cfe0a4c0=
2f760e3c0b8ae2ab4ec4045808ff429f"
+SRC_URI[system-deps-9.0.1.sha256sum] =3D "db551ad38aac61d5e0343e0eeeb0163b=
e3115c4e23b6a025959570ee0c03c67d"
 SRC_URI[target-lexicon-0.13.5.sha256sum] =3D "adb6935a6f5c20170eeceb1a3835=
a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[tendril-0.5.1.sha256sum] =3D "5fed54709c5b3a53d09bb1c113ea4f5ceafd=
1e772ddcb0030a82e1d56c087b08"
@@ -649,7 +649,7 @@ SRC_URI[thiserror-impl-2.0.21.sha256sum] =3D "fe5197923=
287db20a58125f0bc85c062f7f2
 SRC_URI[time-0.3.55.sha256sum] =3D "cdb87b95ec50ddfa440816d227a17b2ccbdda9=
63a316a727fda0fc4334f7d134"
 SRC_URI[time-core-0.1.9.sha256sum] =3D "9e1c906769ad99c88eaa54e728060edef0=
82f8e358ff32030cb7c7d315e81109"
 SRC_URI[time-macros-0.2.32.sha256sum] =3D "7e689342a48d2ea927c87ea50cabf85=
94854bf940e9310208848d680d668ed85"
-SRC_URI[tinystr-0.8.4.sha256sum] =3D "b1e27c91459209c2986af3dcf603a5a74a43=
68754ce37414f59acc971167f643"
+SRC_URI[tinystr-0.8.5.sha256sum] =3D "abc840c238154d58f9e86b2792261edfde56=
5a17696e1cda1a449de27979801a"
 SRC_URI[tinytemplate-1.2.1.sha256sum] =3D "be4d6b5f19ff7664e8c98d03e2139cb=
510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.13.3.sha256sum] =3D "fd3ca314f692efd6c868f8408f53fe44463=
4a845f96c028b97d35f6a1f79f0ee"
 SRC_URI[toml-1.1.8+spec-1.1.0.sha256sum] =3D "20489e00e4d8741d6be680764cc1=
2e270655e375a20d1011e844a9c3379e678d"
@@ -661,7 +661,7 @@ SRC_URI[typenum-1.20.1.sha256sum] =3D "b6f5e870be6c3b37=
1b77fe0ee0bafb859fa4964b440
 SRC_URI[unarray-0.1.4.sha256sum] =3D "eaea85b334db583fe3274d12b4cd1880032b=
eab409c0d774be044d4480ab9a94"
 SRC_URI[unicode-bidi-0.3.18.sha256sum] =3D "5c1cb5db39152898a79168971543b1=
cb5020dff7fe43c8dc468b0885f5e29df5"
 SRC_URI[unicode-ident-1.0.27.sha256sum] =3D "a2c754d6c33795a1c324727428e5a=
7dedb5b06195f9890bdbcba760d3e246563"
-SRC_URI[unicode-normalization-0.1.25.sha256sum] =3D "5fd4f6878c9cb28d874b0=
09da9e8d183b5abc80117c40bbd187a1fde336be6e8"
+SRC_URI[unicode-normalization-0.1.26.sha256sum] =3D "75cd3fb03d5288b3ba9a1=
ee103ac7e9cbb59f0b03d64f8ddfcc04dd42758a85d"
 SRC_URI[unicode-properties-0.1.4.sha256sum] =3D "7df058c713841ad818f1dc5d3=
fd88063241cc61f49f5fbea4b951e8cf5a8d71d"
 SRC_URI[url-2.5.8.sha256sum] =3D "ff67a8a4397373c3ef660812acab326822203501=
0ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
@@ -695,15 +695,15 @@ SRC_URI[writeable-0.6.4.sha256sum] =3D "3ad82d2a33cdc=
9674dc7465672f271e096168fcdbe
 SRC_URI[xml5ever-0.39.0.sha256sum] =3D "5ab627f34ff61b80d756180d556f9c6880=
1d836d271b3b8c094504ceca69d221"
 SRC_URI[yansi-1.0.1.sha256sum] =3D "cfe53a6657fd280eaa890a3bc59152892ffa3e=
30101319d168b781ed6529b049"
 SRC_URI[yeslogic-fontconfig-sys-6.0.1.sha256sum] =3D "1d8b8abf912b9a29ff11=
2e1671c97c33636903d13a69712037190e6805af4f76"
-SRC_URI[yoke-0.8.3.sha256sum] =3D "709fe23a0424b6a435d82152b1bd3fdfb083348=
7d5fa90d05d42762a9891fef5"
+SRC_URI[yoke-0.8.4.sha256sum] =3D "417ef3fcf6c300b7dbd25c85531a746931c02ad=
536f3cf4786ed1e88223340b3"
 SRC_URI[yoke-derive-0.8.4.sha256sum] =3D "ec8ebde2db3681e8c9980cc27822030e=
68752690ddfa9473e739aeb4dbde6d71"
 SRC_URI[zerocopy-0.8.63.sha256sum] =3D "e5fe1f8f1b06191a00962174c61aa5005e=
0bb391a6d80d07e24d115c01a92ed8"
 SRC_URI[zerocopy-derive-0.8.63.sha256sum] =3D "863ad3ac83293fb4d740aedbfdc=
9240dd8d1a50c1099acd76ce80ce7c7230c7f"
 SRC_URI[zerofrom-0.1.8.sha256sum] =3D "0ec05a11813ea801ff6d75110ad09cd0824=
ddba17dfe17128ea0d5f68e6c5272"
 SRC_URI[zerofrom-derive-0.1.8.sha256sum] =3D "f75b4683f6c7f45248d4d64056a2=
4298c6281e0993356d7d1b4a1a962ef10d4a"
 SRC_URI[zerotrie-0.2.5.sha256sum] =3D "4ea269c3bd32f0a32c321907a2ae912ba6f=
4649bb0fc764a15627e99a7095a3f"
-SRC_URI[zerovec-0.11.8.sha256sum] =3D "bb0464e17806c1d976d5cba29399c7f08e5=
16e279e2ba493f63123b5fca67dd8"
-SRC_URI[zerovec-derive-0.11.6.sha256sum] =3D "34df6fc39dbd26ddc9c10e6a2984=
476e13acce22e64e4487636ef494369225da"
+SRC_URI[zerovec-0.11.9.sha256sum] =3D "f58a2799cfe9a1670c7ea8edbd52ef8edb9=
3cb37a7f83bf31ba9e35d9dae6a40"
+SRC_URI[zerovec-derive-0.11.7.sha256sum] =3D "c3743ddbf47738d929cd1ae2e199=
d40d0162979dfe31aef8ae646d2bf00bf97a"
 SRC_URI[zlib-rs-0.6.8.sha256sum] =3D "b268e58e7c693d7c271f93ffc4ba3b380412=
554231c85bf61ca7af91042a4112"
 SRC_URI[zmij-1.0.23.sha256sum] =3D "29666d0abbfad1e3dc4dcf6144730dd3a3ab22=
5bbbdac83319345b1b44ccfc1b"
 SRC_URI[zune-core-0.5.3.sha256sum] =3D "d56377fd46368984a170bc5aac5567e52c=
a5da874caa60bea39fcbca78fb658b"
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUS=
TFLAGS-to-rustc-executable.patch b/meta/recipes-gnome/librsvg/librsvg/0001-=
query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
index d9a7fbf5145..a0a6d098970 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-=
to-rustc-executable.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-=
to-rustc-executable.patch
@@ -1,4 +1,4 @@
-From faa062c4bbd9f3678997a90c85ec4efa05156c07 Mon Sep 17 00:00:00 2001
+From 31483d73f4a46f18bb18b149532d89c3b9a7ad11 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Sat, 2 Aug 2025 20:57:49 +0200
 Subject: [PATCH] query-rustc: append RUSTFLAGS to rustc executable
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care=
-of-deprecated-assert_cmd-Comm.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
index 35ae9a7cd22..22e0f6c103c 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-dep=
recated-assert_cmd-Comm.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-dep=
recated-assert_cmd-Comm.patch
@@ -1,4 +1,4 @@
-From 5fca1f7d88ce817cb532e6b7e7168d3beb1a86f4 Mon Sep 17 00:00:00 2001
+From fe9e7305af55f4f24fa026cb7d4c3925ab6a75d9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 18:43:20 +0100
 Subject: [PATCH] tests: revert 'Take care of deprecated
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.63.3.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.63.4.bb
similarity index 98%
rename from meta/recipes-gnome/librsvg/librsvg_2.63.3.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
index cdf386ad7ab..6e882700751 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.63.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
@@ -26,7 +26,7 @@ require ${BPN}-crates.inc
 SRC_URI +=3D "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable=
.patch \
             file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Co=
mm.patch \
             file://run-ptest"
-SRC_URI[archive.sha256sum] =3D "55311c2293612e4a2e38cd9bdb6160a1c85c158adc=
7c97e423e1e65949afb6a4"
+SRC_URI[archive.sha256sum] =3D "31f07d9350dad3f8964fd613c31309ac160fdef13d=
fac59df6fd082de78d6e8f"
=20
 UPSTREAM_CHECK_REGEX =3D "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20
