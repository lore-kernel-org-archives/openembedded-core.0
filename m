Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7219.1793698101544969562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BDX5D6yP;
 spf=pass (domain: est.tech, ip: 52.101.72.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWj65Os0Jl9KjqUGEL/JwikukwYbtsNhyWSc+7GYxCNSBXEPDmIcp3qlMwxSOWRep7Bo1zH/gDpo6lbsS2XXj1bdkDbM8PZdmJSPdPwCz4Yunyy2OmHS46auvFixS2Q38PZaiQ4h0KegZCn2LIvl1z/XW+rd2XZTQdy0F1wQrX0+Yn+g2mVkJLvfa/zgsfOgBRUWTV0pLz2M9tI1Lb2G9Sm0NqhzfATkkHrAw0DG7bin8ejBJkQzhn8mAsn+ueqhKM/O2npKeVsEH4X4yZz07S2qP2w6Qf6Z67GX/81knCTvPcqn2bJJbM42xahaUAUbeeUopuQ5B7o+lGl14daZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CP5DoYjKD+zT8zzFiRP8qO/0PLpzpPv7OqLYHF50kA=;
 b=amc/W9vg4hTvFwn+YlFT+5Az+pEYY9Y3hvv1Cse9HaaoNgkG23H0cj26blxfl7ClAsGUpXNJQFk7Y1JoFt/nBq1WcbdRIBiswpa95wMQWSy8kQD+CiEjNR9aCjM3e4L8q53OFHLEz1uac7M+kwdPhun26YMUiyUO2eChr/J7wv1KAyayEtQjQlFQBVwmdfc1AVIfSnRmhQghKf2pCAFa1L3Gc7X3NebEvxadXsXWIV40uigLYWPw6kIIXxTuSsPX1qBI1lKmOCC2Dk2uKhi8zPkvg2nLJB9LrULWev2OiKyY6hPv/qK8MHYLFdJfcCBf3Kn2aXvdWmlgQ9/zsq1Oww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CP5DoYjKD+zT8zzFiRP8qO/0PLpzpPv7OqLYHF50kA=;
 b=BDX5D6yPKgihfGCdoftePSFUDjEIRorBq5qm0TuEnSYzoM+xEigj6iKHx/rRxX0MTQgDe0Gi2rvRB+1cfkpLfLteaQNvQ+N5kMpiAJAUhJVacOIlfeuwCvZ8dx2ok2e07OLsMRYK4pexQqNopqL84q6YZnOKXiNgalxVyr0IizhhBU/oH+0ftxoKW8Sa5gg0xbxwoVbTmt1dK7OUAXtuWLHIsj6P1JrV2vwiPHXxcr129nqY6vrRhyvQk+09W8lFp6AyrfAeDxekbpPTMFYH/wM15ETYAv/xhhi+6PpkQGRRwgcficg5vq4rhO20iatG5YicIsr+mJZQBZM7trKSZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/12] gtk4: upgrade 4.24.0 -> 4.24.1
Date: Tue,  3 Nov 2026 10:28:00 +0100
Message-ID: <20261103092800.39286-13-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PA7P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: b21413d1-7f91-4959-f1fd-08df398ccd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|261022075727099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022115727099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 3oAHMiT2P5WU/m55Vas83E1S4ySdw1BTsqinq03GJqiBU3e088Bv1PlWoOkdhYdC+KLiCUxsqKvjhRUyVzAWWmFc2veDkaOJTBbe05A+U+DwY5HRO6idkBWhD4ka+9SSpC+xY5tx0W/7guGienqXNkTcDnWPJ4u8PtHlreKTS/CTmRIm3qnEwtGfAXhn6qLun+BrHFegBK/s+GlF6cAD0x342e5bN1QxtWCx/KUpQwjYksRRwLHqxn4NhRICUOCmi0rBheZuwoLv+MBDKRbRd3sKGTGbJlt62XdH5oA//oSefvXY0JYAtsY3IGOh+KI0K1uUzxggaWPRWMnMlypOnhjx+SNgVACcTg5cQ3YAwLtfeiNrjcQQki9E9wA1b8u5QzWsOhq7uAlaNrz4tXjluA6tALQ8kEJaSxXR6VX7h9wyEZxNYYgOlHsMfnBHEyeYGv3HX0115TOd7hb9pCEk0xZKlrJ8mmjifoFPGGd+zvbZzevUvaUumofd9kfHRFsi06qC8K6d5H7IBGatb3Ph1HsnD/KkeStQwBZcZ+qd54wob9cPj2BSclsGHHMhrsP0jSuCnTgbtCXCer6xlzkfjTP3+H/Yo3ranm45zfKeHZGukzOE4MVYZzgcxBj4J9bXQSAygXyVuD5YrrFR58TnoZYTgakdEcXFR7I6+O/LSkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(261022075727099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022115727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WOkwq4iRTYwURByVxp6GieGn7xCzIjq8Zgld+vI51hnKQzGq8SCyYwRux0F0?=
 =?us-ascii?Q?PEOkGzqTa1WyzjpM8hwHI7CekDKoH8EwmI8FDTdoZqb11kqbczMWVrwFDqXb?=
 =?us-ascii?Q?0W65z89bvLjAX3uDb8jqAURRdRd8sf+T8bbt7yiVI5E1kJ7ihLgoylhtvNVN?=
 =?us-ascii?Q?ZYkqZf5rnHu4+U+J5y66KvrJCvIbz7NRM8kPTMobd4B8wUo5NykZ0yJOzlR6?=
 =?us-ascii?Q?YRz1EXI2RqLEGjsNZVuZAjGHMyF0nVfyoV4zelLHNDtEFiBP2ClS6+qg+x+V?=
 =?us-ascii?Q?+SB9hE9ZN00Bz9Kg67G98HzgmYuDJikQPmTc7ZfM07L0fNqor5eEOwr7sqPB?=
 =?us-ascii?Q?Zh9EsvfG9T383K0ZHAvzXJvoGccZpXVo4+1t/Uqw+jv4pUH3WLaiZe+g/1df?=
 =?us-ascii?Q?Rq5PQOL38CPI9Tj60NeTlPpGa4vgC1lJbR9Sqeivyqn+1fNwxjW2jZYViDR3?=
 =?us-ascii?Q?S7eAirifaeLBoH5xZer9w8oEPJFfgEWmGG3XoDwni7miiK5yi7vvk9uvJDQX?=
 =?us-ascii?Q?oaw7Gt35M6jhe/kisPL4UE2KRUxOfoVB5GNLMpX8c1aHnSo/A045P35FfgFG?=
 =?us-ascii?Q?AgUp9lBeWRBGJ51nUFrNR7gZyNl/5wKodXrP8HBwolyNPZJEO8eoenvxB99+?=
 =?us-ascii?Q?sumqhJV8M3v12xTFICnu2zDt72Vi6BKH6/Um+9VHFffkzcmzzUXfT57eubes?=
 =?us-ascii?Q?Dd/QTuUIsgofoptW84XCQNLKednqKIlRUx4sc6OWq/Ij1Ei/c0fR6l50Iyaa?=
 =?us-ascii?Q?RU36uHvOXboaC0r6FS7g2mq5Ser12N5g3MGOylz6U15jZMrP+CNDsTz0w+vA?=
 =?us-ascii?Q?ohNNvqKadAfbHnkj2CQUuhxAiJoGAUmmAmJFNlMtVCWPTd0w7T169pBCrKUB?=
 =?us-ascii?Q?OCnEnHrhnZq1odzWtKbXiCGTw49NKcYTG47j/TKivzZbUTUdNXaPPxxX7rBS?=
 =?us-ascii?Q?wdlj/DkNkTxeO8M9nUbT58xlphNU/y+b82Rh5FC3PKjXe/QXIJ8CBmdL0/sH?=
 =?us-ascii?Q?/xW2B+0Tv/MFf6SDDxc7bvad0jOkdHRwl6Bh3+6PbK7ZCVfSvnDP6VHQco/a?=
 =?us-ascii?Q?MsXlXqYwwUcldShSTfnToWe8+d+EwmySDECjHpnPUcCWd15JBT5gmToJmykQ?=
 =?us-ascii?Q?8YnYhc4VJ7vicCzqjoCyaDUIRZXRARkpnlmmE16kj0LsmvMkw48ReQj/OZe1?=
 =?us-ascii?Q?IQ6BGux22v/vKV8b494oDT0ISsoykGoKb8x24xnxmh08xrT2XzPGe3CSdUNw?=
 =?us-ascii?Q?glXhAt9vjaZC278pkEIZTRDqjqSvDlH/k9jUav2cfCsDAczmukQ2Kfu/WIo6?=
 =?us-ascii?Q?FfIt2MDDIdjqt6MaafE8L/xBgBlArOhKZi6w1AIQl8F/dyBNe8H4xrP3vriq?=
 =?us-ascii?Q?KT9ImkNBkgIhfaHSPlPCUhNcW7mwhuWSYG/I4VkPGaYgTBPT8nQ4kXCHP/qa?=
 =?us-ascii?Q?PLY9s01yAKVy25Ox2vXYz+bDI6RQFnSkxbcg7uxW4CUlP3l6dPMV27f3GQQ5?=
 =?us-ascii?Q?mG67P0EpRZCf4eUess7DHzymosQLW3HHOAnsATs4VxCn1/4e/4qU35MuXHuW?=
 =?us-ascii?Q?FI7z0/4r0JvJxzLA6X77S8qCOaw8LZWK21y+x4OVidzE1q0UiWWyZG51cQuz?=
 =?us-ascii?Q?wbXDT7v5EtD4VHAwM5812qzV6ZasOb7ugd/aUBTUKzXYU3I7p1F6I+oWlwNY?=
 =?us-ascii?Q?sdsOf0HtNI6C+gsOS/5LldJyYZj+gGPhoBRTiWl0W0DsWzLXkQpTuO0ELzrQ?=
 =?us-ascii?Q?FTW6bjvhZQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b21413d1-7f91-4959-f1fd-08df398ccd68
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:21.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2KZUT+5rtG6EvvkUAOp/2lH3Nd7IA/jr6+thfUolLp/aGMW44c1Pdl0tWOVIQIoWjPFMyswV8DECYIreyzbp1UU7TJsHfoMFCBkSguHECY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249265

NEWS: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.1/NEWS

Overview of Changes in 4.24.1, 01-10-2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #8409 search-entry: Needs extra touch to show OSK although it has focus
    (Guido G=C3=BCnther)
  - #8419 text-input: Preedit gets cleared due to text-change-cause(1) (Gui=
do
    G=C3=BCnther)
  - #8433 GtkSvgWidget can't parse '@media' if it is not on a new line (Mat=
thias
    Clasen)
  - !10264 gtkmain: Split out debug code
  - !10367 gtkgstsink: release GL context on disposal (Pierre Berube)
  - !10369 Post-release version bump (Matthias Clasen)
  - !10372 Fix typo in CONTRIBUTING.md (Michael Fohqul)
  - !10385 texthandle: fix transformation issues & relative movement (Flori=
an
    "sp1rit"=E2=80=8B)
  - !10393 Fix typo ('witten' should be 'written') (ReinoutS)
  - !10395 searchbar: Show OSK when search-mode gets enabled (Guido G=C3=BC=
nther)
  - !10396 docs: Correct docs for allocation functions (Benjamin Otte)
  - !10398 textbuffer: Fix tag colors in accessible text attributes (Sean R=
owe)
  - !10403 gtk/inscription: Refresh GtkInscription's PangoLayout when roote=
d
    (Christian Hergert)
  - !10409 text: Protect against invalid offset (Alessandro Astone)
  - !10414 macos: fix cursor keys (Arjan Molenaar)
  - !10421 various fixes (Benjamin Otte)
  - !10422 Norwegian Nynorsk translation. (Roy-Magne Mo)
  - !10423 gl: Create 2 fbos per frame instead of 1 per image (Benjamin Ott=
e)
  - !10425 Update Norwegian nynorsk translation (Roy-Magne Mo)
  - !10429 textview: Make text handles visible after giving them a position
    (Carlos Garnacho)

* Translation updates:
  - Norwegian Nynorsk (Roy-Magne Mo)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-gnome/gtk+/{gtk4_4.24.0.bb =3D> gtk4_4.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.24.0.bb =3D> gtk4_4.24.1.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.24.0.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.24.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
index 08fd2c30b7..5a18c4bdf9 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D " \
     file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d2=
9fb2 \
 "
=20
-SRC_URI[archive.sha256sum] =3D "28ba4ac1c04f86eac09b79a163cb163a4c2b54442d=
9f7eccc04679062a581044"
+SRC_URI[archive.sha256sum] =3D "e98abe720e16129c8c0f50761dee0a2e9ae2478055=
e31018f6cf977fcf6513e9"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
