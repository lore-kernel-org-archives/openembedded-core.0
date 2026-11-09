Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5983.1794231647701584293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SNV3IATt;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAqRdFqtOW5DfKAmwKSaGcARU5VXLuTin8kIQr+59ah4lj46LlhGh4TZ2ZVK7YlHkrmoPbtU8PL1vgDd5oXsmAX/43nXNq5wq5edX69GjtJxTwXegHHHoTcOzhh8mBoLD5MKytiP77V60j5pXDcMoxThM5lwbDnX+h3FESSy9RbBmMnnV3TV3bHEPR7tzNYnM6cm/t4aCc8GjcJpEYSHQUX4qiJU7cpsF8ZdUj9wlhXESB/+Tfux6XmIUNrBZKhlcoVHASWdkAv68KJvp2v6lCkG23EkuViehuVYOvHLWi5v7r9GnNsvzGiDIBw/mb7Xq8DwW6fvAuk6MU6qiKi8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhYElxpOwJMyATLDvJ7WyndrkRdPdOYo2yGx96TlBLQ=;
 b=jC0fVJgrPD3vI27ELS8V5WNR5q88dzUQDqenfOM0mjG0IHg5/48Nd3mhwKGQB8TKDrNeejIbHTGY4pOw1PIGKMvFf4j09hvjrKAIiJjERjx2f4AVhJX4VZb2MtdDkAtLFU3Qz5NaxknsW3w+OA7v7bzbAj9vVin/cdxLgRkNF09+ch3V5n1WiToXRQjnR6Cj0QaWvXVdQVvp6MZyn1iT/MYh1HTS//v0RIKB/Bpkqwn528Lm1gKGuSr/f5W8D5At7wOUwY2GmvLdBngSdE5Y5QTV1NlwkGBApvrKu1Va36jHla8OQgXkDJ1y4oi2dhH/optG6cz/CAVzqcTR77Yu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhYElxpOwJMyATLDvJ7WyndrkRdPdOYo2yGx96TlBLQ=;
 b=SNV3IATtiZVjyL9KxHKnnHwpZ4CRO7GMIOIhbOsGnIORGO+K7qDiwCAVnCnsMZn2d8gV9qXWP+XhzhGVqMybPyRtmrL52G8ZgG0eqzf2reIwWAd/ygxY6wiMxI6Td1ahYkh3q21FqZpFPONMqWHR64BMFN+E4lnOEyem5cQ40HkuBcazgn4dkD2JrVu8JCIkLhoaj8b+bwrM/GPYgjQLbg1Kf5A8Zgh2o1DGU4xh6L2moI+tbmG3tQU+AOBoscpGwIXs1ZZGmxQiBeHtVQWInnAJf55zvgZ8v+R6+hP509A/RDw7uzBj9kcOplp1oleTVh70pr/kVSCvP2cSvMX0RQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/21] gst-devtools: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:18 +0100
Message-ID: <20261109134034.74458-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P194CA0012.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a66ba46-6fb6-40a4-04d7-08df3e670e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: E5gGrOAZoqH80IW/KQfeZyU9iyo7nLPzRYwNUnfMJLQgnykUAlgi6K3RcjQ08oPg9N8cQt1A4ifCTvU8L0w/ntepfpuK/TeuvDlZg9mcDy7QC7XzSfUsRYS/KLe8DpfrSQHuosK//MXygrF92Q3oUx49zKODJWojNpwsdWvHn35lqdjvfCxsJ0hSCX2iVMUjCQXfP6MH6bppaW0vjNlNXux/icJoitRc9tfwNQ1pO0pLtZEERNRS/RhO6Rhh1bR2hYesEWr0DYW2f0AS873goNwRlFV7AWK7qTdHcNxDGsT5A2p1PdyxYEgZtfrvWU9/PYM/hGsaj7n2BEHBIuslJP+du59FXhb7QyMLb2n73pHWxmptzrLwABgxtamSr8gO38amNyhBlAlGLHUqzuR8mt25C7TOij9KCS1gctDSOQl0xQU+fhimfbDDqXJB9m2R8H8SUx/iPIaCtnw6SZ+LwGmaUArq5FFSlNpvn6RwlHc4UD9BShoLqo2h6m3LZ+YLEQuLycOQsFx1peLFFvQitKnwesSsCSeKixhrwY9k9boJ+OEtmaPlssvcfw02kCrUBL1qSTrnRLQPq/X4xvewpKqBNKM5DQKN2PDrZXpRWJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iQJvVJAC55CrMQOw0s56MAI7cDMxMnPRGxW4IUeAyy11a/Kynb5Wdoro6wQ6?=
 =?us-ascii?Q?zsu7ehRr38/oUXxXYZNNULeFu0HDxl0I+WNIZb8HYu5f5Sq9NwX+TZCXayzL?=
 =?us-ascii?Q?rdbSic+hmMRu2/XTktlv6RpKEC5VK9SsfykG23a3QnsNdDxPfwNzsQgS2Z//?=
 =?us-ascii?Q?4MqgAbB0ZneuEUF37yk8l/DvzhkH0J4xZ0MHgHy9Kz7m+H7YVo2yQ9xv+wrw?=
 =?us-ascii?Q?tw777OxhHrG4/47PjUrKOJJo5cS3z/1oOpWYW/Jwlgp9d8xBLfBBEXA9S1Ko?=
 =?us-ascii?Q?GIIFSOCLAh0T7bnujYVKc1lsSoGUV4Ov/lvM4Zkhz8a2d+0JPZ7xLs8mlFUW?=
 =?us-ascii?Q?P0ezqjg0uYsjrpse4UySFceLlIfczODVpPwy37cb5c284lt+lcHHPXbAVbm9?=
 =?us-ascii?Q?kZJpUOEkiTSLlpA6nBWYoa9xnxbtjCeZgcJhWRwh8KC7dwhSI9He2vL9w7De?=
 =?us-ascii?Q?nrQ7rYFtYY7zPynoeDG32FIeLkO18gvRDL7MKagAc2wRFfKEyNLTEDbv7hDz?=
 =?us-ascii?Q?497ZYP6uXjGE5pfd6CuM0OHcx7dFoZdhbhVlyKYrsgqUuDH02zcvxcu1dIJN?=
 =?us-ascii?Q?WMx8uNmv0+FgaohcEh3Mh+tHLmke+o4d4V/dW6/P6mEODnVaOnd8odja/EZK?=
 =?us-ascii?Q?gRseDOgNdlJTCrWNbBJxaxgSEQ74T+rUXUcGD0zMxix6n4BMGKsc/ZFJUGwP?=
 =?us-ascii?Q?zz339FG79dayv++8klSxpdMj1VbrI04gBExYT1fVYyNQLpOlkPAYbHTY5SMi?=
 =?us-ascii?Q?akuviOuGswbv2RTcaOqlcg0jPNPUvChZwGcKSgPpWHDXrz34LxTCjMoJa35s?=
 =?us-ascii?Q?FLVZgSOainG+2Hq/uhbNH3PXWDJ2M9VA6uKdGq2qIG0JNGSf+1U62DwMTfWq?=
 =?us-ascii?Q?E01IgOWDP9MxzZdReB5mRNh82iZLxbENcuPl6vZqDBMJtbIPsyhAPg128eGO?=
 =?us-ascii?Q?3CqaWeJZM/1zBBtUZohP21CHPOhXTt4QOXGuVqoV3r/zseu2/LnmSnKi47hJ?=
 =?us-ascii?Q?hdVIQnVrvlULDFq6MCGbTORLypCdHN1nDxZQGOemsgpg9xF5oxH3hW2ZFTjP?=
 =?us-ascii?Q?xmCxciGH0ezrOzdXKzyFe/tWiX3KxPuQuDY3foZbrI8oqlOE66g5UxGn9vIF?=
 =?us-ascii?Q?Euc2glLAklJDr9GVFzuDtGYlJt0Kml9Y4m+8iSs8FFxTpI5RZgaQP4fzOZlS?=
 =?us-ascii?Q?vSHehyDoy4pRV2Z74Ri6hcK73jvH/CD5QeQJpl2B70uR8NQCvlfdTzvcOSec?=
 =?us-ascii?Q?W7pnUCdxlXA/W/ntLqQkpYZ3OTFxr1xaVRbMG++5CdzAHa7tR1ITsdU9mvZk?=
 =?us-ascii?Q?nuCjMb7QzqPTxHn/gLfGHlZAIYtn1E24wRBjjV5HEUIWT1mX4+o4pu3ky8y/?=
 =?us-ascii?Q?NGQu+b4+gImD8BlIfQUoxP0ECawMbUN3defco2xTrVYhL/SUaJdLYEbFBN4/?=
 =?us-ascii?Q?wNqJSMCRvErP0LCoWlcvgamWt87UjNjHsBlIFF4iiR5/9Acq4uJftPzhPlLX?=
 =?us-ascii?Q?p+TbR8ny6KOptXYbrJDa6YG1Y0fNa8TkDxSdaHvIADlXwvwwrX0rnXv7FFK2?=
 =?us-ascii?Q?/N668/sFNHgg80L5We1M/MVHGBGDeYVWQg/rZCC9P4bHi/eXeyQxFL3MAxvm?=
 =?us-ascii?Q?OI1PAyj9ESkScbCO5r6Hou/Pu0A2RH7+aaqoRGMDSrRtDRnT3qqhu2aie/3g?=
 =?us-ascii?Q?8DWPLPb+d4JYivazsb9dFXZj6NAfCLCblUo0EY3YNIYDyFbrYT3YmWm3VXU+?=
 =?us-ascii?Q?CUc1VOwk/Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a66ba46-6fb6-40a4-04d7-08df3e670e23
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:45.0733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyNuPAaR39MYs4ArpuISQVqv0UDYpGXTE0tDiSUUzudN/lE0hpJT1g0TcoIMNOyizDi3PMYQPWvV5rNunBQ9MAhryP/59h8Z54oMLf2dbf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249810
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.28.8.bb =3D> gst-devtools_1.28.9.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.8.bb =3D> gst-=
devtools_1.28.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-ha=
s-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/g=
st-devtools/0001-connect-has-a-different-signature-on-musl.patch
index f10b0e2e6ae..2b23d0f0ec2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-dif=
ferent-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-dif=
ferent-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From c02d717c6796b797b6da66f022b6a6604d03e510 Mon Sep 17 00:00:00 2001
+From b40b6d73c2ec97a8e6a7ebaa54446be204927b64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb b/met=
a/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
index ac46adc36a1..515afed6bed 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.9.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-de=
vtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
=20
-SRC_URI[sha256sum] =3D "a85275f91e421ae55c8ec08779459a3f93f620d2acc25b6e67=
23ef43573c6ba5"
+SRC_URI[sha256sum] =3D "cfe8ae964fb394e03fd66b831daba08e0b5d1fb7d8bf047ade=
351afcb5855eaf"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-=
plugins-base"
 RRECOMMENDS:${PN} =3D "git"
