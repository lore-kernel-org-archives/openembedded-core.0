Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6114.1794231641841910133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PCT6QgTK;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ76Y68gOI3Ocfg1pxwJStzanT92j0ZGpsUmN57iXHEFxuD4BTjiTBE/9bxYb/6VtlN2FEyBg39Cyy7Oaz4dEWKOjtUbbUjKuOE5giaIvii196n3jlHqfJe9q+lI21t5+RN8SYPrnBzlJC5VreOAlNoxEZLrl3/usqoxlPVFCQ5rCYUIuPO0WkPjWixo+O2wBQzgiMhLlY64irbe+TH+RPXYGNfkL8CAz2p8vGXPLWnpqTmORuUYUCqOUz8b+BpjqlzQFrJMwYFoh17CvxZP7pGAU05AF0Rltvzx4HEj2ORwy/xmOX1OXtZ7H+yViXtxdq4TINtcjdXUrmO42nNsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpDXqv4mpGoEeLXRNUmZVbBxi/5m/9WQWeYoNBBGFyM=;
 b=fClqwsS0VzEBvYmuWgM6UWEqR3WNkXFnv2mMZENlHloGuKEri7mmoV5GBfuygGfe71RRa/L2iCVEDDGT13U6zKaPT5G9B0f1icjsf8WTUSSNp6Vji6j53wETJQm1CMaQ8mZkYI4tOZKf/5b+MpLGVO4XlMGDwXSEZrBwKbfpdAX+mJhmG/OCTbq1sbwa17FHxf6uyH6q+5o+OYXrbryyBbRt2CUvhnbhdxzw2fhupEAaINGNEZRkI2cDwt/1k8Vp2kKlh3Hb70/BGEfdujNIs7jlmRVINtTqem//mBl9+JDtaIIpe5M4byVTKBBwHZ/GqNkVF8i6zoT3xPcWW986fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpDXqv4mpGoEeLXRNUmZVbBxi/5m/9WQWeYoNBBGFyM=;
 b=PCT6QgTK/CzbWe/oX3sZZefUoOKszy1Br15xXkzxYaPAqpjp1sRRMceAafM3Per47H6+pzkfFins1Ab6Hb5xMT02uG0D1b7dLFPKcCzPmVi2kn0JWCp/tuv6sdPKCDuF/n7jPlP1Hje5tz56jXbkCvcVvFNZSmqwaw2vZBXgahN9VZf5etFIVSUAkPV1IRlDapeqBd4BjZ8f2B53rUSKi/6IePiwKrF9f4A7NRmpcxbL0MEnBrWzYIjUqnuSd/+a1YBZTdiljpPeEF3K3Et13V98/BGFx50y7aHDZgOxiKRsd/YIPtXAwaxr/eOL9GPppuPCzGImY/rsMqFNU2RwjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:43 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/21] xwayland: upgrade 24.1.13 -> 24.1.14
Date: Mon,  9 Nov 2026 14:40:17 +0100
Message-ID: <20261109134034.74458-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: a9526cd8-ae1c-47f2-5dbe-08df3e670d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022115727099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9gJzwqKx93cTxFAq+nDhkqsZLDZwaG/FZZxtPvZBiq1ug41IdnoncmMBQzpr8xHLMSyDmlqOKTIG7ISbbHg6kHYXtIvArQR+P5iw2O6T2NE/V/UaXcCqVjQOT3fHXDnqF4vV7AxfAtN+48MlfSQSEiKBrly/kXxwH+HNusuSUBB4JpRy03odbhlScLmM1qXCg+d5RlFoUT2E1Z8O0XauGAInzkrZ6jGD7FDYWKWSIEkc2ftLh/9vf9H5YVVaQagN7zfHWCp3O0DbdkX03PLhFs7H1+kuqEmdYmlrygmFGX500aVDZf4GVXQGRy1Kz+Rys3jS3v3qcoxRCYQTSb/aGLDfqf9jjty6RsXEAMmbNIeZ+klx38qrtVjb5Eo+jD0Qh70JdXX8JQRNLz+LvmL/dVv8n5V2eGF4hTMaCFDZnMi7I/QWg+uFCnBmUW/xKvyaFpdp4Mb/fTYH0VJe+EvJq5v8O/6C1ulj/2FgYeXicvowVeTchxoTZDjacGYoEK89vSD75DcwJKKhwXoAh/gkaHEWIPPA9P0vNfWngiTvKQ9WX/tntTmFF2xzJj1VodQMoDy0rh3LDvqUcn/UYxCDcnkpMOq1ARR0eXwRsvnjCMfU+W71vS6Dt+2Pkg4eurC+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022115727099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?baK5NU+k95kE7E8hHVP43iRm/2Ktsna/S+TF8sLB5vBaHLQzTiivTDWX00OG?=
 =?us-ascii?Q?R3Veqf4fFKBZXmjDoo8o8iRBP3XBDkN9fDoaa2ISWEEXJ0u0iizrUFGjqPZM?=
 =?us-ascii?Q?t2Sn7JbX9veBq+gxfJe2JybCMNDOCnQa7k2LzD3Mx5rJXAMwMYjGaghSE2cM?=
 =?us-ascii?Q?am16qkNVhbNjpZKdsaLaJuwwie9WDAFMFLeQLaMOqhCUhtWzsm+Y9Nlbwoop?=
 =?us-ascii?Q?Gnq7fgDJXjMIjDHnSinowNiLVKnfj8aZI49PBEeBEK0DAPG53CdeJ1Dysviv?=
 =?us-ascii?Q?sLhuYC7RUFbI/wB7RsDnPREjiFhdPSay+NwxIrdFwrmIWvGn4eUaYbrQhAh4?=
 =?us-ascii?Q?UeLO/nj4T8mbMhwRC0KB84XFI8C89LQoTefzd0KJef01l65xWmthHQV1OajT?=
 =?us-ascii?Q?XP5A3ZKATPESh+dOITlBRsUhjulfrjI9LPyROf+oGLT5k2IkjgZdlKA9UGoe?=
 =?us-ascii?Q?HeZyuIbIBXQ3Sz1Asx3maBhv1E+bnjq9l6JZRZ1wWE64m8fQaRvBhZ/FXmpQ?=
 =?us-ascii?Q?Fc9Ysq79YpqGVvUUwHGSJwgj3FDSqXORg0e6ATxV3yku1IlMtOVB0lD5bzCr?=
 =?us-ascii?Q?u68/XFfzg30BhGECBznaugtGheAoRbrBbAKGkeDixiS5rAi8R0KNN+weZ+3b?=
 =?us-ascii?Q?xiDJFq1Z+fl6H9h3Ii8tUlSi7Zbe4wXco5URujtfj33xccjEm0fBMEaRHHI4?=
 =?us-ascii?Q?z5fxVU1rnNsQgAA0KpJARHaF4M+2n3V1YUXP04sAcaMCsQPl+2eA5Entmw88?=
 =?us-ascii?Q?EHqwyC30o0bMhcQ1rbh2Tpk/bNKlsypjbK5spXvO3LHczuwyrnX4vqqUs2rK?=
 =?us-ascii?Q?g288c72UJUQHZgL2SOLAV5rwMERAErQq5yG4GKJRlfUXNn0SIQqG6gfHqqQ6?=
 =?us-ascii?Q?euqCf+BLYf/Rb6Hx6Jxxh4irtAlGJ1oGFmq3jg7k1CkcwzHLAbSrnPwIgSwC?=
 =?us-ascii?Q?94HJXHxDChXKcB7x4v+zAk9zARIpP68zknZLJ5Q7s06rC3GtgG8rTX+uqct4?=
 =?us-ascii?Q?7samkObSWdlSTQl0lz8NMMmWDUd1Nx5O6JHmHNCPDDT95pCLv0vX02LtOD7D?=
 =?us-ascii?Q?VO3GIGcKZD0IW5WQy3EFn13fSu0VDdwnhwxoMpAp7XKku/rLUveLtKC8C9/H?=
 =?us-ascii?Q?UkHSCcx61f6aWvlnpy3/zqUhExd7uaLKyR8DHzgegc86KbjoP8AnuoTAIs+X?=
 =?us-ascii?Q?TkwWA0hTQMB/GKjz1+zQGGZ0x5xVbmTtap/3wchTZDkjjzLjvuDgsdlJYDwu?=
 =?us-ascii?Q?+ZW7ZY1VUtbcUqCfGrRatk9fNgsODOqcc04evPmg3XZAFqjrdOmdwXHfnmgX?=
 =?us-ascii?Q?Il91qEmYHBtwbCmCiKE3Si+iiRCAP9/1/w+LneSYaEDkwTuSVeq0lON9Ifz3?=
 =?us-ascii?Q?VFKXk7wPnAqo35pyhUcGYNyGNzZIut86HEWT3+l9ulYrjFdFqfiZg8y/QEjb?=
 =?us-ascii?Q?XSXVny4uVIIr91qmvH6c4WTF+i3u0zT2L3CIyseQAUIr9YvHIMYd5xAIkZyH?=
 =?us-ascii?Q?j6m2rzGvp+iI2Tatnastf+uiFvaftkBiEn9E0b9u6llK0Y5cCi+1KFd0pN81?=
 =?us-ascii?Q?2R5c0Oui51sbr8M1cMhe1kOuUJcMofdGokMWSnpu75B3cRp4eHpMKl4qIEr2?=
 =?us-ascii?Q?Z2p7AZJcdlvUf6uDjMNqKRj6ZgMVdBKmwGOM9sVoxv28+9rSp9QDoOarK8FP?=
 =?us-ascii?Q?TC4pHJ35DSqvonIGX19E9nvHZU1AvZW4YruSMYexu8hKYS0AkWkcKY8bqIJu?=
 =?us-ascii?Q?XdhV2f7o9w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a9526cd8-ae1c-47f2-5dbe-08df3e670d26
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:43.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tnJ4aoISb7XO02QMwhBuAHQ6uy1Phf92zanHGll+pbyfuVeo8SL2yfmpubSuBX3nuZAiG67HO60UHEdcfdbR0TtRrGOZGK3Qtxpi3KOAcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249809

ReleaseInfo: https://lists.x.org/archives/xorg-announce/2026-October/003749=
.html

This release contains the fixes for the issues reported in today's
security advisory:
https://lists.x.org/archives/xorg-announce/2026-October/003747.html

* CVE-2026-88812: XKB SetGeometry TextDoodad Double Free
* CVE-2026-93515: Present Extension Cross-Window Notify Use-After-Free
* CVE-2026-93516: XInput Passive Grab modifierDevice Use-After-Free
* CVE-2026-93517: GLX RenderLarge Heap Buffer Overflow
* CVE-2026-93518: XKB ResizeKeyType Numeric Truncation
* CVE-2026-93519: XFixes Pointer Barrier Event List Buffer Overflow
* CVE-2026-93520: XKB ChangeKeycodeRange Heap Out-of-Bounds Write
* CVE-2026-93521: RandR ChangeProviderProperty Heap Buffer Overflow
* CVE-2026-93522: Glamor CopyArea CPU-FBO Heap Buffer Overflow
* CVE-2026-93523: XInput2 PassiveUngrabDevice Modifier Out-of-Bounds Write
* CVE-2026-93524: XKB SetMap Key Width/Action Count Desync Out-Of-Bounds Re=
ad
* CVE-2026-93536: GestureBuildSprite Use-After-Free

In addition we have a variety of fixes outlined by the shortlog below.

Alan Coopersmith (3):
      xkb: Fix -Wcalloc-transposed-args warning in _XkbCopyGeom()
      test: silence -Wanalyzer-null-argument warnings in strndup tests
      Handle -Wimplicit-fallthrough warnings from gcc 16.1

Jeremy Huddleston Sequoia (6):
      RegionValidate: Fix double free of badreg->data on the error path
      damage: Unlink a damage from the list it was actually inserted on
      xkb: Guard XkbAdjustGroup() against a keymap with no groups
      xkb: Default to one group whenever a keymap reports none
      xkb: Never recompute a keymap's group count down to zero
      xkb: Keep the group counts of a loaded keymap in range

Leon M. Busch-George (1):
      xwayland/glamor/gbm: get_render_node_path without enumeration

Luk=C3=A1=C5=A1 Lipinsk=C3=BD (2):
      Xi: byte-swap DeviceChanged valuator and scroll data
      Xi: byte-swap XIQueryDevice ScrollClass flags

Michel D=C3=A4nzer (1):
      xwayland/present: Only flip if the window pixmap dimensions match

Octavia Togami (1):
      Fix use-after-free caused by duplicate glyphs in one glyphset

Olivier Fourdan (5):
      xwayland: Skip xwl_cursor_warped_to() without an xwl_seat
      xwayland: Handle libxcvt_gen_mode_info() failure
      xwayland: Skip optional RR modes if CVT generation fails
      xwayland: Do not fail if cannot add the native or logical mode
      xwayland: Update RR modes only if valid

Pavel Ondra=C4=8Dka (1):
      xwayland: let glamor initialize SHM fences

Peter Hutterer (13):
      xkb: NULL text pointer after free in _CheckSetDoodad error path
      xkb: allocate names->keys to MAP_LENGTH in XkbAllocNames
      xkb: widen size_syms, num_syms, size_acts, num_acts to unsigned int
      xkb: fix CheckKeySyms overwriting request-range symsPerKey entries
      randr: fix size and offset in RRChangeProviderProperty PrependMode
      Xi: validate modifier values in ProcXIPassiveUngrabDevice
      glx: validate dataBytes against cmdlen in RenderLarge first request
      present: unlink notifies from window list in present_clear_window_not=
ifies
      dix: remove passive grabs referencing a device on removal
      Xi: add bounds check for barrier events in input_constrain_cursor
      Xi: clean up gesture sprite traces in WindowGone
      glamor: size tmp_bits buffer for source coordinate range in upload_bo=
xes
      Bump version to 24.1.24

dongshengyuan (1):
      enhance: popen-fdopen-error-handling

stefan11111 (1):
      glamor: Set `need_free_region` immediately after pixman region alloca=
tion

git tag: xwayland-24.1.14

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../xwayland/{xwayland_24.1.13.bb =3D> xwayland_24.1.14.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.13.bb =3D> xwayland_2=
4.1.14.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb b/meta/reci=
pes-graphics/xwayland/xwayland_24.1.14.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.14.bb
index 1f32177ec5b..41c51447837 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.14.bb
@@ -10,7 +10,7 @@ LICENSE =3D "Adobe-Display-PostScript AND BSD-3-Clause AN=
D DEC-3-Clause AND HPND A
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df8778cfcd90ece0e4b225f30182227c=
a"
=20
 SRC_URI =3D "https://www.x.org/archive/individual/xserver/xwayland-${PV}.t=
ar.xz"
-SRC_URI[sha256sum] =3D "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad=
4667297d727fb6"
+SRC_URI[sha256sum] =3D "4eb6b98d678299a4b96138d886345b294130695760345ef845=
96225a8224078a"
=20
 UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
=20
