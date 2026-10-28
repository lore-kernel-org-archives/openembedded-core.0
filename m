Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37402.1793171046344595740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cSrap54q;
 spf=pass (domain: est.tech, ip: 40.107.162.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8m0NEZNK3sTCXHnueSDX6nXMZcFgAHOa+R8sKN7MSSJ2CYvJ99gB50DlFPf3wrK+B1WgK/pcaE6gQOfw00CODD6NT4pi4NfySQJFz53wnOZpIfMiqaFGqszIBfpfBoeLWRWPTRa8LTR8sJVbBpqrAV6ovBh03XvzpoJPBf81CB/T7OZyUTSWTOQCKFkQ9kb9tZZGcNynizBkVOtpUtcymzuuBIOJ/0H5+yGNChoJ7byJhJ9tIyOju5xsiNUhWrbuyXR1tkSjoK6Con8iiYeCf3jCKi+Zc8kLThQlCbht9uj9S2Jz0FecWe0FikxJEvg+NuVSektbCytefEtkmqkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIhwILhLd/DDAsylJ0oAe4tRuea5F80Gmy+Txe4UE7Q=;
 b=tQ6QILAm5KRoQk8VAIPzgOri0KUKdysf8sEtNvzc17mG0qXMFvAb9E/1CLnsjaSj8w/2cl/E6tXA7YteJapIQKVu2E7Ivy1HhBE/mJDxvclJuG1x2FF/nKOtjFX6yk8+NWaxbUohukIJk2/WfAGe4fqMdChUjDyHXv43ypOQmgnLwkYDphC6ODnvBBNRT65ah75Rb5BuQJHacDgKgFEusIAuVHiWYNRg1wVn12Ps4OtK5WXn178A1/8fcbGOh+CiR/LRYzFRQ7m1gYIDPW2joR/mbg8AScxsI1ro6Oi7D9X0CnIZhPoVDX4GUPFJuQAu5D5ZUql37Cn52GqCcG1xcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIhwILhLd/DDAsylJ0oAe4tRuea5F80Gmy+Txe4UE7Q=;
 b=cSrap54qratBp5YhK109ZQ8vp4S6RudXgMldL0V5rBXCP0IVlKIo32wKF7XpErvFb94pUJrsn1m/61qgLypCWXIn2vnXJe+R8A8u7eiXYJA6/fAsYYmIPM0/nnVw1wdtssxOQKxKuk7WzMVNgIE+Ue21YYa6mrvHntdnqVD3F8bd+kzS7KqB3OETOH/6R8vQd717Kt7aiDy7MHvEQgLiBkbbUd2l+qoeMUm1Wccc1yXH/AtD8w7P6UL3V6QzUvnf/iVKfN8pjs4tHnn8IlgxCjdqBzLRPg+AVaEY7sECoPETDrzhh73m1PIW9CfEadivsOUeEiW+AXszG22RM2+5JQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2318.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 07:04:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:04:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] repo: upgrade 2.69 -> 2.71
Date: Wed, 28 Oct 2026 08:03:48 +0100
Message-ID: <20261028070350.13243-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab30c8e-0557-43e6-d8c7-08df34c1a61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|261009223027099003|261022105027099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Htco71lksyuyKhmd9yFa/lexZoR8DYyEc2wUoXFDitnt+JUNsPOrpGFBYg4FHc+uOeYQ5l1Q48XCPg+5ShK+tp8kWmGAsvGPWwIJMuwEDYJ3S4EFwUyI6zoSMd4gDcBgkkG6yUWY1FAAdGVjy6o8uugpTlbzy8JBXwkd5cDAXo/j+ZRyR4BYoJIwYNqBc4+PHQAxUtZypWaiiVIqkptWBfM9oKu22lhAVdSDp2Hj9GZD+PhuC/ALVvI5zqKJ+R2QsgBpZ3dMUMr24+1X0S+K3O0Ysh9793wVHwa0ilU3FZwx+v0uqNzxi+0FXCxiRH7uhy6OiRzTv5Xs4/ULeoq1uLJWk9L4Jp9WQcUGLV8YlX6ch3RlwDJCUVwo7vSj5KwesG7BO/9/Ikj5Cuk3qTtVuV/5RUEHmiQ33d6b4DJ6xmPwe3OM6IoYA+PkapSdvKJKA0RIkt6RxTv/0PPad1UKGC0RU0q+/eqMLjsglw/O5kwLPKhcn/0zOgQIMGGv2Q+MtH0eElliKMuH9BV9+FwE4vaB6+4JqYPYUe3Co3+SpQCEQM55R3DvAo/7yJD5RUxl7cgdQ4QhSaJFJrdhJT664bR+IHNHnRt93k7K2X+4kEfGHdKz+kCr5T02eJTU41MH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wKr9wV2py/OQkOU5EchfqV30+CRfRyySkvi8vxaNkxtAhJGSOPd+xYm/bjGr?=
 =?us-ascii?Q?QunEoYU9nezhlLXxEOqPmFUvcjrWsW/Gev/FN5YEjHMQysoojc3/yKTWVtKP?=
 =?us-ascii?Q?Cu8D88zPiEQIvf51pxo29hQQqW03qRCZM7LWppMy1pekcRO50O3ZWn2tAX/b?=
 =?us-ascii?Q?DhaeJAa9UPBRaZjCXTkAmks6e64qN2xXctyBnj+jO3NuR5PP+fWa/2phhHJN?=
 =?us-ascii?Q?paHUdwSSFDWId8MhYC8nZYJxbdcZp4DCaKLblgwE5OdkqOV/+pz3FsKur8wt?=
 =?us-ascii?Q?7cgkHZpfaCROSy3B09mMhwFZmtU5AuwEY4FXxIZaWwkVYlzaxOtAa0OCazV4?=
 =?us-ascii?Q?kg2fAZh0OOD2jWlzYehaxJBQK0vqL/2E2EYX43EzBxQcXajtRsQgjvfutx+y?=
 =?us-ascii?Q?XI4eDwJ0/2UQbMu5da1pucoma043mVYP/8mUwhN7CEt5JgZ3VjBVcYMv3SQ7?=
 =?us-ascii?Q?hWUTvosFF4+gCD4pNFSe+2o14+SjI/LohMQv8LmhpDnfjo3qh7L8BAr0cgdi?=
 =?us-ascii?Q?fFbuoMlJbuKLFwzIzAt49cK9Toi0EmXs62SJqVdhe9JTWHzzPvamio1as0UM?=
 =?us-ascii?Q?+gsfAZ8MyZeX1w3UlyRkFFoOnHiKiZNeX7C4mTJDmsnk31c8CIrq7JxyiAfN?=
 =?us-ascii?Q?PpbfajaFywjYh0g5EuJfmZrVjGwqw2ZEPKvstQIccLf/8qaaBEVjNNu5acSE?=
 =?us-ascii?Q?BzE81riv9JQJdWnCIt35Oc4YubzC5RoXqkVVEdlkS0IXWhELGuEEsMpaAFYi?=
 =?us-ascii?Q?7ay0PeX6IdXk3iI4xM1OcMAXnTq0FbVWubxklKerq8buJTanjSpLLPNxkOro?=
 =?us-ascii?Q?k44T+6uzApwMIIc+3Boc+ezNKzm44m1RPG5XRYaeFs0Qby5JMTNBK883MOPD?=
 =?us-ascii?Q?c62FdjiQLlsLUgf6kJRhCFUL6uUFgka3GzG4Rt43w9/hm8piYBZRA32uePZ7?=
 =?us-ascii?Q?UYmuO/U/DcSk4JQnB/qsAzc62U07lB31mcK+OdU4spnduO0p+489sbrfUzc8?=
 =?us-ascii?Q?OYKzIDyrPg7tJtRc8NoI9L3Xp17ikUrEpYJb/H5Nkama0Zm7vischDrO9+xw?=
 =?us-ascii?Q?mR7gcWOjxDXaoQuqlY3hwVgpltk0SKTAjME8bteA7+TTDX8xhas/QGvOP80o?=
 =?us-ascii?Q?GJCRtKj8nDT9HYRrvC/LLnyoJctemXNxA9OrKkEuLHzVtcOwE08V9vJP72Hv?=
 =?us-ascii?Q?uI6y1uOZ97WpJbGHhamV9mIN+knPHwiRUPYOVsW42jAAigU3EwifrilYW91X?=
 =?us-ascii?Q?ZyHw9Hv9wj6OSgZeEjXjQTUMKWjbxR23YenLvnuk8TtTsP6/1nUK+K6IF317?=
 =?us-ascii?Q?bjFHsK3gA/vUKhxz6kgN9/CcMPVzCW6YQ9FROIISQXp5qPFwiBHd3Bi5wA2n?=
 =?us-ascii?Q?aV6sGxSpo+y2yCjjRQ+i2uONlTxdtdBzLXjcteNYV7TYHQna0afL8P4qW/Wp?=
 =?us-ascii?Q?iz8tJ5Qqdf6zTC96QhpWijVjbeSbTE+kiCQZa0mvMnT8RkbsIXjI53oI94Vt?=
 =?us-ascii?Q?xX2X9zKYLd9bJIOQgv1tKgnynTU1TOArMUCcFGS3i8ZTAjOgTtWPa79VDJUm?=
 =?us-ascii?Q?FCQKsJGErOnRJyEUd4AudnuktQ2v0wrnEVT0WVG3md3doE4SI1LbAkxgqFLv?=
 =?us-ascii?Q?wHpcw4LAxWlXFn9fmYuTBlVm9OK4qGabi4lLQJPJRultH3/BySPsy90qBtSC?=
 =?us-ascii?Q?w7USTvF8krzIxcUZQe6rTFdpsmBEG71Jv24aeOwWvXESvOwtAWhQP93v3kkE?=
 =?us-ascii?Q?YnSKqu7r3A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab30c8e-0557-43e6-d8c7-08df34c1a61a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:04:03.4414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCBNZbj8eW24cEw8XGeYoukSOdsMG5VLwtI3Ks2wq4gsnDhdRZ6mGjkVF218uUUsONp3dkXgJy7Bmqejr9KtNIId9VGmfceFPRvCv3dafu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248790
Content-Type: text/plain; charset="utf-8"

CompareLog: https://gerrit.googlesource.com/git-repo/+log/refs/tags/v2.69..=
refs/tags/v2.71

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/repo/{repo_2.69.bb =3D> repo_2.71.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.69.bb =3D> repo_2.71.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.69.bb b/meta/recipes-devtool=
s/repo/repo_2.71.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.69.bb
rename to meta/recipes-devtools/repo/repo_2.71.bb
index c98534ca44..9d9dceb32c 100644
--- a/meta/recipes-devtools/repo/repo_2.69.bb
+++ b/meta/recipes-devtools/repo/repo_2.71.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "a0bc2b14a30bef631b91a2ca37c5254d9af44718"
+SRCREV =3D "338ddb7d83ea35d5aef94d3c5d95c74fa3845780"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.com/=
GerritCodeReview/git-repo.git"
=20
