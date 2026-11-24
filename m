Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24291.1795540694721029803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0u1iZRCD;
 spf=pass (domain: est.tech, ip: 52.101.72.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM+VlGuDLXneAsWzs4uUFOT4U9xNuYlbHJPSkhEiO3Qg+Dt240kChxAmHgY6C5psASRsGl1Tc9FqmSA5JdSyErQxqzeWq4nCgekcsgC4Ztu14v4Dy/iZAB1E25FSWBzgVL9VyT/D0AL2gmdaV5QvSfNFE1Lh7y1lCDKMMwuFGVBbc4KH3uh+m6XROnUfx0XhctXBOyVgOk9/YauA99UrCeeA8BQ28NiuFMMMT3QMgzKmg9DZVE+MZFFYHjcjsf0JH4/ZQV582ac7b1vkZK/VAm9GN734WiVU6PM2Q19JcZODEbBQXXuTfCq84h1Vf4nLbj1zuSLsLscadp7OYutBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+J0es7taJag9xToe8pfSgVS3qNJxJveblR6Lb74tGqI=;
 b=wOmqLMKD15IpBmJ/hu/UpTVOqtV/lX3Yc76afCr+2xHy7fFz3rW2OJoUwrV+GBvGpKzU0gi6TtIAeZv1HP42dZv1ll1UDX1d8GlrffBldH/hHCmM7JkIwp3SgsI4TmoREmgeMbyZNKZnb/KLUR/mV/pX9LW4p1hzLOgkgdnueBkYvTkeC133pBuln2No5cx6vasqlXEo7FGcQyLrYP/Tq/JMFKC5a48Jd4Jz0b9CrJ2+GraYG3i1SDIDdWHrsOtR1EGTjX+X5bvNl6Gr4CBxQfB3fEWfmLVIFhCjp+/e+lBZpmgzOULddsOyAkkLVsYJKwXELqanDJhXpfs+Y0Q52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+J0es7taJag9xToe8pfSgVS3qNJxJveblR6Lb74tGqI=;
 b=0u1iZRCDUweZdLBXvcCRH+VOGwuy5bedXMwvciX7LCXj0ZEuBCSbsTnaXQHv1X5R9ok+sfAGDoZQXe2i+vpHw0XTJudXDz0V+CnDVVBfI+PMnx5k/QgznWB6b1nVENw4g2Oa0WLkxryGC+XhnkgmGl5jU+RS5IR1ijsGnK+F0avk5y22uD1jEU+5qPyA3Tg8KdMQJi59ic6VNslvPT/aVdylDGjRXkvDlezAsCPSc6qlG6q+rn28UpPZS2Wfcy8GgNLihQSaIK0EfWVE/O5hTrt7YhA88aOflXep+2fMdiw3HwP+4Fx1nS1Fss5sz0x0VA7wrFC6ReZWOS9P5FXMug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:15 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] gtk4: upgrade 4.24.1 -> 4.24.2
Date: Tue, 24 Nov 2026 18:17:59 +0100
Message-ID: <20261124171807.74394-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0671.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5e69cb-b761-40d5-5c4f-08df4a4eecba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022115727099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: PrZ5jduj/6xL7Iui8zQoMrScffXLYI6gStvaFJpqEWc48kZSlJQkLsS7M5EFFROfkGgp/zp8ShWHImnSHCq9s8X8jWLXwhGLw7U+ZJtaT8dBnoceQmzivYjbr0g6qN2TByHL99jWZ4v+dEoQq78T+xylsliMRJbYbtHyE5DwOU8BpQXMZ6By55xaDSwB1EB/vaxV5h/0NB1OnghbITDzaWz+R0P1bckPT/GOlLWOIq6KuXqIrC1AnuC17t10PzHGwMZchRgho8NuyMadF3N54ZJemB2r/hZ6Uc5E1HFZDNkUwePd1Z5dSbZ9CR/F4gylnjipsEcRKoBbpLB4Q8M5Pkbx0oiTxFmX1irL9BfzUMq+oMkv0xBaITvijCDfwFFQVL8jmW/lZlUBCWUohyVWeoI5pPS+pYkTFAWYD7UUb0atXpzj76ynVvONMPXo4kySHk91/sCBqqTIUjhKh+ur5qwHFeaWiz+SHMt1YPrUPf7WDc552Hb5w0UL0ZB36gaMC/sjqiO7ARcORIWkDmwTeV+K6hEJhKJw4Q4yJqmz4uKWCZTfMZbNIl47OtkHcFD+oSFu8gBxSdFr5V6cnHsQHvidQWxO4wdTlU5g4ibz0i/ug3DWoqWCRYLOMA7pI3Cj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022115727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lIrC93S4meVs7zw9hvG7OFegGff2OxZ+t1qLbyuttjSye8GHSRwrYkz3cHNh?=
 =?us-ascii?Q?gx965kNo8JO6wjPFlEgAxb7jlvcIGq+5XvCaiE7lLExZ0ws8KyeWqjYV+O3C?=
 =?us-ascii?Q?ZGI+SkneorHtnu1CPjWTN+e4D3MSBp0vT/aAAuCS0UKapCiBFbQnPTsp6gcQ?=
 =?us-ascii?Q?o+IZ61Ln9C7zpoZcLZ9uAddcqfydg6vmMvoYZsQJzYAPKKy6NMBBugHdWyjo?=
 =?us-ascii?Q?1cpxDf1e2QEo62Q+pSJ/Dj/eRsoArLFZITFxRir/h9SThCwy9cTEO9qo1oP/?=
 =?us-ascii?Q?FdihphURoIiHNR4WlPmygXN82kO9hkshhXqBXnGIgmKWaZMr0VDODFkFDpLn?=
 =?us-ascii?Q?lntBOiVvSR2DGc2q8XROmdPfjMk44rRoZK8Us4uOoFtg1YlDJ3Kte/Js1xg/?=
 =?us-ascii?Q?jYlOEBB8fUi0OY3W1hUkrHjEO8w6liQZm0c8zPMLlbyOYO/2MIFg/QxO3Z4y?=
 =?us-ascii?Q?74rPqR2951RLrl+125bXO/JyNdHeV7iTf4RcJJQOGIHqf2+3jKYJcu2IycJE?=
 =?us-ascii?Q?lsv1+O0pVhowZM07xfE7yVHWCbUZcM50Ga2Xyui96EDHODPVKO5GPW6ffh31?=
 =?us-ascii?Q?5DAbgczC7CkuMGSXIxo+svF/ZTaErBJJef0d+97dau0F/80jQKjTp/0TliaJ?=
 =?us-ascii?Q?hx4K7zG+y8YC3a3UK6uvPdwTusYyrWO2FS2xJexWGFNaX86JEseTjp8JhYT7?=
 =?us-ascii?Q?XBrEWGzXsMFgH8A1ReVTizJgJSUwLqp1MySD3JXVJ6enN4q8xgy+OKYdexkk?=
 =?us-ascii?Q?7iRyp1cUqqeNEVmuDJL7//Vq8IiY1MMLnuWjzCyPcxlDNHeezfqT43zhy9z+?=
 =?us-ascii?Q?9VNxkUdHG4X8VfYNZ24lCmEYX4BlTntiphl+K2WsCsGnC3IH1alHOtThnmea?=
 =?us-ascii?Q?307f0d0F0T/iaoKuS1EqAXyviU9/tiL9U7dVj6ntRyXa3zn82klcWDNBLpZ0?=
 =?us-ascii?Q?LpTBAS29gHPczM8I+F3CLpWud2LUcnUo7tqEPE7QmO7Hxpi8PFfUKPWeN3ji?=
 =?us-ascii?Q?l17Vy/4iSnMdd9Alk3/gegATf8c+53c91GBhPnJTAWNW6xI7IFJCSAo0iPNT?=
 =?us-ascii?Q?wka2DJSmk8EdoilLZUPKsYbtC2kDrC5+DJEohNh2zTrVOilCvXiv/1Svr0HY?=
 =?us-ascii?Q?cZ/qwqW5zQ0cJuVwTgvFT25RDItrBtfMJHlQOwQkEVb9GAGBFHpgVctE3i3s?=
 =?us-ascii?Q?4skB/1FWFD38yFIOrkiMYDDzu7RqTnOgYMVcT86b/BoFgUYWi8eRJG9f/5yI?=
 =?us-ascii?Q?Jk1BQMNg4/tgqg+cwldFMJGDCekb2G1ZftX+2SVUWwiFT0xSy2wqt57F4whX?=
 =?us-ascii?Q?KFv9J8gT7bpf4dOD/XtaP2dSHlx0DvO5QbnKEYr+YWrR3+ddaBhwvqGnjdHS?=
 =?us-ascii?Q?vZArwUK+zU/BzwpIaOifB8su2s5BpsiW8N45CPKu6OzevMyq7D75VcjTvqFq?=
 =?us-ascii?Q?VQS+LDso3S5Kg2EiA+pAkwRGgp71WUaONhQK2kU73jbQ48FWQ5E5mL+fWM8H?=
 =?us-ascii?Q?VIv6wUVchJId1hmccOV7lv4ovVWXr2d+oJrCihF9TTdIzhmglN0vaua3pEEO?=
 =?us-ascii?Q?3oF9y6/eNSnZHyWnZp28t8QysV/CFpo4ldtUXjQbhEubu+UtoxbmloGfGhzA?=
 =?us-ascii?Q?Cvj4+MGtBk1mG4MffQ5Uo5heajfJEbXZt84hyXv0CFP0Sd35nc6IgBncZ9Ru?=
 =?us-ascii?Q?h4ZgemOuZd7MPNWbXOFIXH/mh/fC97O3ZO1BnHoZmLNU4kAWisxyAtVjOhq2?=
 =?us-ascii?Q?TZxmwmAljg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5e69cb-b761-40d5-5c4f-08df4a4eecba
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:15.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3Gxg1JLFMoWhPsAi9PbcXW3bPmQ78cvtLq6Z4Wlx6cb6NrHnhGRM1d5YpgmfYss5b01d19yzPGqCthUsJWQgX48Ntucx0tJ29ImA78mgzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251055

NEWS: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.2/NEWS

Changes in 4.24.2, 22-11-2026
-----------------------------

* Bugs fixed:
  - GNOME/gtksourceview#433 macOS: Number key in the press-and-hold accent =
menu
    inserts the digit instead of selecting the accent (Jo=C3=A3o Sacramento=
)
  - GNOME/nautilus#3614 Double clicking a file that's slightly off screen
    doesn't open it (Jing Wang)
  - #6719 segfaults when using wintab (Alexia Death)
  - #8455 GTK crashes on launch with floating point exception when wl_outpu=
t
    with refresh=3D0 is encountered (Matthias Clasen)
  - #8456 Wayland: freeing a GtkMediaFile makes GStreamer eglTerminate() GD=
K's
    EGLDisplay (4.24.1 regression) (Benjamin Otte)
  - #8463 Critical when loading SVG (Matthias Clasen)
  - #8537 macOS: Press-and-hold accent menu inserts the accented letter wit=
hout
    replacing the original one (Jo=C3=A3o Sacramento)
  - #8563 CSS parsing: use-after-free in gtk_css_parser_end_block_prelude()=
 and
    three more memory-safety bugs (Matthias Clasen)
  - !10432 Fix the testsuite and stroke bounds (Benjamin Otte)
  - !10433 Fix the testsuite and stroke bounds (Benjamin Otte)
  - !10444 Update Slovenian translation
  - !10445 Fix various issues (Benjamin Otte)
  - !10446 Fix various issues (Benjamin Otte)
  - !10447 Update Chinese (China) translation
  - !10448 Update Chinese (China) translation
  - !10459 Update Serbian translation
  - !10460 Update Serbian (Latin) translation
  - !10462 Update Georgian translation
  - !10464 Update Persian translation (Danial Behzadi)
  - !10466 Update Ukrainian translation
  - !10469 Update Czech translation (Daniel Rusek)
  - !10474 Update Belarusian translation (Vasil Pupkin)
  - !10475 Update Catalan translation (Xavi Ivars)
  - !10477 Update Norwegian Bokm=C3=A5l translation (Kjartan Maraas)
  - !10478 Update Norwegian Nynorsk translation (Roy-Magne Mo)
  - !10484 Update Turkish translation (Emin Tufan =C3=87etin)
  - !10486 Update Lithuanian translation (Aurimas =C4=8Cernius)
  - !10487 Declare sysprof counters as G_GNUC_UNUSED (Benjamin Otte)
  - !10500 nodeparser: Don't crash when someone puts text inside a fill/str=
oke
    (Benjamin Otte)
  - !10502 Update Portuguese translation
  - !10503 Update Portuguese translation
  - !10505 nodeparser: Don't crash when someone puts text inside a fill/str=
oke
    (Benjamin Otte)
  - !10524 Update French translation
  - !10525 Update French translation
  - !10529 Update Bulgarian translation
  - !10572 Update Russian translation
  - !10582 Assorted backports for 4.24 (Zeth (wearing a Fedora), Jing Wang,
    Felix H=C3=A4cker, Alexander Davydzik, Martin Fischer, Alexia Death, Se=
rgey
    Bugaev, Eugenio Depalo, Luk=C3=A1=C5=A1 Tyrychtr, Dimitriy Ryazantcev, =
Benjamin Otte,
    Matthias Clasen, Ignacio Casal Quinteiro)
  - !10650 Update Kazakh translation
  - !10680 Update Basque translation
  - !10683 Update Hebrew translation
  - !10700 backport gsk(opacity): use original value if opaque region hasn'=
t
    changed (Arjan Molenaar)
  - !10707 Update Indonesian translation
  - !10719 Update Azerbaijani translation
  - !10721 Update Brazilian Portuguese translation
  - !10736 backport store-callback-4-24 (Merlijn Sebrechts)
  - !10743 Update Swedish translation
  - !10745 Update Galician translation
  - !10746 macos: Backport input method fixes to gtk-4-24 (Jo=C3=A3o Sacram=
ento)
  - !10751 gsk: skip unnecessary copy/paste replay (Christian Hergert)
  - !10758 testsuite: Drop the repeat-snap compare test (Matthias Clasen)
  - !10760 Backports of assorted css memeory fixes (Matthias Clasen)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-gnome/gtk+/{gtk4_4.24.1.bb =3D> gtk4_4.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.24.1.bb =3D> gtk4_4.24.2.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.24.2.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
index 5a18c4bdf9..17e1633b4f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D " \
     file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d2=
9fb2 \
 "
=20
-SRC_URI[archive.sha256sum] =3D "e98abe720e16129c8c0f50761dee0a2e9ae2478055=
e31018f6cf977fcf6513e9"
+SRC_URI[archive.sha256sum] =3D "05561abc25d1b1400136bf79ab68830cb4b053d192=
2ae97e551b3f19755bf3cb"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
