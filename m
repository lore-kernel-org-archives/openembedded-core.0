Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5584.1795180501618142653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XT7Uzd0A;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfqdgXDiy3SIXYPLyNv95awE6MNh5XXXwFgp+5ykmRIVT/YCYr+2jWp6Wh6iCyiZbhGaVUZqP8V8F9PbBEuXBGkYhB5NCwT9ucqW460k8PTgEDcjnPGs+dbVtsTkjIVFh5lRbKziCJFnqEJGz3BVVC+7mPlNaUeAV8npQxTn8TFaRjFEY9Z6r9Z402LPsjY8EtawL3GNwFko7gV16SKGO2M2MNEZmgBfqVWKwPsZ527LTM+WFd0G9QVGpbsGmw2lOOsJtaZ6DRaYnQEDKPe3m+kw1bPIpVuyjLbtpUdj2kbTs1PSI7iTacQroHKBhSse0twxI+BVEg+bmmOqFJmDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgqxEbPocVXK0ErzgOEfPPpODT8d0KYPQG9QHMm8x1w=;
 b=ttbb3kij7VN/uu/l06pS7r8NUkHdqPbbDsarRq94BPPvcDOy3AY6gXasb0bbo/r9yTIYPGkW0WDyo7LTGLQi1hpq8GDsMwv+kwGLFe2XqlAL4LNVyzmxe+79IwoEN6F6O/FHN7rqC2ROHIy5ZB+PWgSKLICpm9CG15x0WnNtT5KG1meyNsb0uzlBPVTFD7PLIluGiWHVM8FhQ4U5nyq9wMjlmnNJqrn6u9NgjxYnp3zQgONJUqY4GXoyNH5L6/9tqRxBf6kQ0+Ii5dpFK6y9iPmKKJEsLUSXd7kEopb1+ibUX4ptf0fTn9buemn24zTIfjE4sRVOMcnVdHcIObTSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgqxEbPocVXK0ErzgOEfPPpODT8d0KYPQG9QHMm8x1w=;
 b=XT7Uzd0A+Z7ppMLr7R2HqlNSVbaut5Mt4vZC5oeYuhdQPwd+0PiVQ+amkw4BO319yUAr9uQ1b6OvQsMfVAl/XxujTbRKanw+38RTPYcNO76crlW6as5h0LUdSwNDZ486gyOfVlXp82b0QAGml64d+JWZsY+h8JKucZtaYx6dHZpj92+dYAoeWq9K0G06dt1CsRKW8CX4GBCMfIgp8h+nkBco+uLpCN7DhVzlsqtEepH20ikNFgyU7tPG/KRpz1ULABbygqXu8Q+ZeXabnVDsMsmGvKMIPDCm5p1lqNya4DFoMav3HiN603VAj/8WAooYwLe60TglbPoCdtLd65GM3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0815.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:14:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:14:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] harfbuzz: upgrade 15.0.0 -> 15.2.0
Date: Fri, 20 Nov 2026 14:14:52 +0100
Message-ID: <20261120131454.45936-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
References: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0815:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1421a3-ba33-44a9-b126-08df47084764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|261026140227099003|261026130827099003|261026121527099003|261102123227099003|261028144727099003|261022115727099003|261022105027099003|261021123027099003|261022113327099003|261021135927099003|261022075727099003|261009223027099003|261021121427099003|261021130227099003|10067099003;
X-Microsoft-Antispam-Message-Info: DqN/FbxzcffY7dACWhYFThYG0gAyEGoU6tr2mVbprVfO0U2QPCzYHRmgc6JcKYDLdQEp09LHOT1aw4PY7QIOswLch1ZqwtvRCIfXgcQXPc/Q6UkTv9eL/q/Z0dH3tl2xC8P0341r9idvTqJtyLqj2++s1jKdCnZrGC5yvVRSPMAlsRDKJsT2VhqTag4CWnSsKip+iEsdp5HJlIHZ8ADdRy9uLf37PskG9j1x9m5bhuPlf/8tkBi5q1ai9vlgSq5zdw15Ad08iQrEekUuS8r3UOPr9bfMIVa6nYyWtS5wNjQhFrlGJlSP4RHg+6ieTVALuRmIWN++yR1zkdC+WU/L1XIHZNtu4BwtLAfMx0dOOLn83/UU/cFDHAOdxqr93vMQJvsQStUhx6+sRx3ipatK85gb6dmEGif9nTRc15eiKn91DqZe+AMt9pXHj0QR3NauKHDdDq809VK0nPnabpbtYMSGNrvNfGmQy5px/aBWbIvJK6NNNIz4EuXTSH1GOlXJ3ib2ghu/tb3+Eifu3T8Rqz8tM/ahSaiHPpNFJff3j0X3YrG6EYMQvNKL6Re9d5l363S4B0aGZbXDABoynaJ73Velxgq5fp353APP/bQpmSajwLrufGhL/0hrDuN7lIrp0EDYLcLaEKqvKAbK0DNymBbOXKGtuRX9t7CxCTbP8FM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(261026140227099003)(261026130827099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022115727099003)(261022105027099003)(261021123027099003)(261022113327099003)(261021135927099003)(261022075727099003)(261009223027099003)(261021121427099003)(261021130227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i6MR0sqYD8NKjqxBIsVFK09kHMvIyYLCEx/VYewpmV2mWOx5n3CQhh5NcF4v?=
 =?us-ascii?Q?KhDJgkY6d2trk2KEGYnD56+59eY+gleCIftQvwLEQb9nB5tqLjjxlx7PgF0C?=
 =?us-ascii?Q?lYg80bqfOFDEWf/pU46CHuX7r3gHSHgq/HPf+VZYJvgVIeCMIT7wFGqWyfsc?=
 =?us-ascii?Q?uW978btth4kxDITZdtLZ2KX8ry6hJ4CMm9aUh/NFV18Onuz9jAetoZt4ViOs?=
 =?us-ascii?Q?qEDRifm+8RgBBOyQclLahm5a10fLoJAwOe/esFA0yD0Wx9dc8I8pGWU8eSRA?=
 =?us-ascii?Q?xCmMMbHr1txurwpx8D0ZDxS0aU/CWoSWr5WpoaFybjsvxV4uhPsQ+6aW1nvz?=
 =?us-ascii?Q?jONVLiFE9sdKK9m5/DwxS60KWjnDifwHfv0PZTub3c1xAKhjmxZXxeDhaE4d?=
 =?us-ascii?Q?syzFiM7euAYAr+CBqWdVhb28qGBs3K0J+9ZExi/Fz+1U91oSz0ZnpieWxuf7?=
 =?us-ascii?Q?qsPJy9a3vnYfCf/T4yz5EVguwsGmIFk8WwZi8Q/2eJrLADtL0/YI2UhHXY0R?=
 =?us-ascii?Q?GKwLuAPoV3s31bPjSbtO9inNVWM8JzoqfQUZCQVAQqvmhKUDEA8/q/EDx9nb?=
 =?us-ascii?Q?B7XsvdLqfWdcA3VHrkEToklxtzDT9/bDS8nrI9Gs41SeFDODRA8jDFr4uruY?=
 =?us-ascii?Q?134LCO2Ob2LzPZN1NiSPifMW1o2GB/RPU3YrTv48FqZPCKnx6X3jCvTlZwkc?=
 =?us-ascii?Q?vgC7utEBISa9Da6ePTiF2IbXvwJJU46Zz5VCUnOt66ha5txJ+Nmb7D+AmHRJ?=
 =?us-ascii?Q?kvVtr9FuMN56A0xBd+Mx8bCe7RsHSLzi1wZU33JsKhgYgHvoNND2nQCRAQpl?=
 =?us-ascii?Q?psnvbGUH+d5k9OXa4/pCoRSVNE4Hl7cBOjQN8em2HoMHL1C8hg6Qcc7i+927?=
 =?us-ascii?Q?ag1bMP874oW+ZaEkj4LUQ0aDqPkaXp3MJauC5Tc9kxFFH42fL4XC/XLwckXh?=
 =?us-ascii?Q?WvoDGSY3nwMsD1GexJEGnyCXhpYAya9ocdt5UVWxTEWKU0CE7UX6H6CTcZ9E?=
 =?us-ascii?Q?RQi9BQJpJgjyqlYBOz20EeeGucsVSJ71qAHr4lM5nUtow3lDqhoJW9z6B5vC?=
 =?us-ascii?Q?/TgOmD6TT6Nm9zJYothJAle4mgjQt8LoFi1HRK2YokU7H1it2TuZ0darV0z9?=
 =?us-ascii?Q?EdNtIUJR1ipMuCYzjKEI11C/RWHffLYTItccndG7ckEk9INzBnKmJFm+hIdF?=
 =?us-ascii?Q?mkNihfrz2qqJJpIw0o3PXgri2bdB45uZOJYyIt8VyUOAMwfzfXx7V0KKaHAD?=
 =?us-ascii?Q?MyHkrl4cyKT585fQYKQSEEFcm5NRSdUSb2Tv9IoeM5pZihCidS8wUCoOqTqj?=
 =?us-ascii?Q?efFsZCbnFMnI4b4r/nhzYoazS6aYJY4FGoeNU/rNAmRypM1YxnD/5SlfUK6G?=
 =?us-ascii?Q?4+RCZQwsQ6l+EvBTsEsHlBVaUdnXPhTVt8y48lq7gBq42WIrxDbAJLyrJTss?=
 =?us-ascii?Q?3Ugy0pDdTKTxMHEwtkyrsKXLT0EfAOrikt3GE6JTScvC9p3YcUYLHa8yzRvK?=
 =?us-ascii?Q?1uE5WdfgqFoipRkj3VCqPKA2LjCAlkUnXJPIxT49cNSqzk89leJO9KXhuUVg?=
 =?us-ascii?Q?eeh4Pku/iC4p1O3dU5ed8ahez8oIU0jJeRU1nQHP+3LfF+0uxPh8l6MENfac?=
 =?us-ascii?Q?ASTYd8aIWrrasOdSRE99jpGEoKSHtC04SKRK7mkZndpewM9UYm/ezUMOIMC6?=
 =?us-ascii?Q?Cva7SeGEdK2OblXDdVhQpBbAQKVoWmjbyCNQ7WQc/LPXmHMwReUKPt+pLaYo?=
 =?us-ascii?Q?seXflN8LBw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1421a3-ba33-44a9-b126-08df47084764
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:14:59.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1S+Mv9h7Z1MzIgA3iuAafxvl2OR4a0Cyfxmr27oXctDtXks3zc7omPjGAlVF5DOa4qj2aFOMPa4aCevbGFBxxikmkCHAEbmqcDWqOMVCBDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250787
Content-Type: text/plain; charset="utf-8"

Overview of changes leading to 15.2.0
Friday, November 20, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Performance and hardening:

- New features:
- Shaping:
- Script-specific shaping:
- AAT shaping:
- Other shapers and font functions:
- Core library:
- Subsetting:
- Rendering libraries:
- Tools, documentation, and build:

- New API:
  +hb_font_create_without_funcs_or_fail()
  +hb_ot_layout_get_extender_glyphs()

Overview of changes leading to 15.1.0
Wednesday, November 4, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add buffer deserialization APIs that report progress as a byte offset, fo=
r
  use from introspection bindings.
- Fix Indic shaping of the Unicode 18 Devanagari and Bengali additions.
- Fix Arabic fallback shaping: wrong ligatures when a component is missing =
from
  the font, and disappearing marks in legacy fonts.
- Fix `COLR` glyph extents and mark positioning in fonts with empty layers.
- Fix AAT shaping: wrong `kerx` kerning (formats 1 and 2) and mark position=
ing
  (format 4, a 14.3.0 regression), and ignored `kern` and `mort` tables wit=
h a
  non-first initial state.
- Various fixes to the Graphite2 shaper.
- Report HarfRust shaping failures through `hb_buffer_allocation_successful=
()`.
- Fix wrong outlines in `gvar` fonts with intermediate tuples.
- Fix `hb_face_create_or_fail()` rejecting face indices with named-instance
  bits set.
- Fix wrong fallback metrics: the vertical descender in fonts without `vhea=
`,
  and the hanging baseline for some scripts.
- Fix `hb_ot_layout_lookup_collect_glyph_alternates()` collecting garbage f=
rom
  `AlternateSubst` and `SingleSubst` format 1 lookups.
- Speed up shaping on faces with many shape plans, `hb_language_from_string=
()`,
  vertical text with `hb-ft`, and `CBDT` and `sbix` fonts.
- Fix crashes and deadlocks with FreeType, including `hb_ft_font_set_funcs(=
)` on
  immutable fonts and font queries from color paint callbacks.
- Fix crashes with NULL result pointers in
  `hb_ot_metrics_get_position_with_fallback()`,
  `hb_ot_layout_get_font_extents()`, and `hb_ot_layout_get_font_extents2()`=
.
- Fix use-after-free in `hb_map_update()` when updating a map from itself.
- Various fixes for crashes, hangs, and memory use with malformed fonts.
- Faster subsetting of large `GSUB` and `GPOS` tables, and smaller `CFF` ou=
tput.
- Partially instancing or desubroutinizing `CFF2` fonts with nested blends =
now
  fails instead of changing the outlines.
- Subsetting now fails if a glyph mapping assigns another glyph to glyph 0.
- Fix `hb_subset_axis_range_from_string()` reading past the given length.
- Fix subsetting beyond-64k variable fonts losing `HVAR` advance deltas.
- Various subsetting and instancing fixes, mostly for `CFF`, `CFF2`, and `C=
OLR`.
- Fix rotated and skewed rectangle clips hiding their contents in the raste=
r
  library, and out-of-bounds access when extents change during painting.
- Fix the vector library mirroring path clips in SVG, and writing PDFs with
  wrong page bounds and misplaced or clipped `COLR` gradients.
- Fix wrong clipping of `COLR` layers in the GPU library.
- Various Cairo integration fixes, including a memory leak per scaled font.
- Fix `hb-info --list-*` crashes on unusual fonts.
- Various build and CI fixes.

- New API:
  +hb_buffer_deserialize_glyphs2()
  +hb_buffer_deserialize_unicode2()

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../harfbuzz/{harfbuzz_15.0.0.bb =3D> harfbuzz_15.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_15.0.0.bb =3D> harfbuzz_15=
.2.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb b/meta/recip=
es-graphics/harfbuzz/harfbuzz_15.2.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_15.2.0.bb
index ec829e0a249..fac63c9cb33 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_15.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a6=
7cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec=
42d2a3be4a44df"
+SRC_URI[sha256sum] =3D "e2ec49090744383cdbe7df808c1cedaafba06a97be8dc4211f=
e546ba585f12cb"
=20
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-r=
eleases
=20
