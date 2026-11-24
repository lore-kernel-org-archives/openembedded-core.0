Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16223.1795520674441760923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 03:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jr3nZKOG;
 spf=pass (domain: est.tech, ip: 52.101.70.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4qpeplmdEXuw99Zdrhyyc+Q1wNSf411INZUEebNJpxxLJSW4V5Jv+rBZnLewUBj3xWZxO7D6o0Hi8YnN19hfKbmmqLID8sBAwK1WusC6hP+WjF2LawPPQH86oZrXbRMpIM2lfNVth19uMZdyuSfzXOFpA8OmIi8H+YTpQpOZ41wL7jYYOxhDha2px4utNvoCDXGFtUrqPfSWeKrjOw+5J/W5CwMmdB9R8BTE+iXIYU9KZJyyTda7AFP2U3Cj3EIhn7LjMdq+DH7qbmBDyTTfcmut7+SUU8OZ64X0pZ6507cQnTIEXzDUbOrlKo5pXCDQx5tFGF5zYwyJQXiietu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JusY5akUAMAL1hA2ge8So6riy7b2Z0ohzKy2IAjlQlc=;
 b=lCWtYuXeZ4bO7jCsTk9XgktA8Frv+6ZzGGhtjV4XrWnvCugcY/ae+A/wUqqJ0g6L0g4k2V+HjRxSKUT3bnR7YrLAQSf+zCjlkrXvLchYIpzdioZXF55Wn7HTP8hNE86UFFrMaljmmtyu37lpqFxoflAIYtcKH0YjLyc0ifOZRiPlySjrXtCetwZUhrUTGRoE0AwH8t8KTY6ZNPBXMx7xpjV/r6M0LfMhpeiV+Ocp4yjwpMXudDYqs4ExAoqMHafEvBxRZXMfeTKWXc659+Ij/xDTzCR/WwkzW2XIC0ZFj8sr+nqM8163LsRuMFNfu0QkIF2n/e1WCx9gbdeGBllJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JusY5akUAMAL1hA2ge8So6riy7b2Z0ohzKy2IAjlQlc=;
 b=jr3nZKOGZIQGj1UUlscdRV5UNJ6r8fpF4db+mEuNKSIBEYF87Z1uvsjSj4UqyQI30WNsoKVEvfgPGOC4E2WGJ9Q/j0r/yPsmcovTvTYTL0Ru3xDQ6RAQ+RNCFzNjmyPyFObKEdIm5YFL6g3aaSxGsLZTVnrkicsnT3NpsZMaKotuA2YUPuOYDRocpo1+38AFTwBaUpfaeLuiHjum2k6RQB54RPZHLNme5dgpvSVQ69H/oCegdCZnyqhMN5XHg9E3xOv5kgN24Zp9x9e8Jcxy673yXdf4TDUcdtoWcWZJsLqZRsC4SDUfkK3HIX23kjMD7D02JQeNlYmvoKgKQXgXMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by ZRWP189MB886491.EURP189.PROD.OUTLOOK.COM (2603:10a6:910:400::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 11:44:31 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:44:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/3] gstreamer1.0-plugins-rs: fix annotated tag match
Date: Tue, 24 Nov 2026 12:44:25 +0100
Message-ID: <20261124114427.70379-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124114427.70379-1-jaipaul.cheernam@est.tech>
References: <20261124114427.70379-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|ZRWP189MB886491:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8e9922-c028-480a-896b-08df4a204db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|261021121427099003|261026121527099003|261009220027099003|11063799006|56012099006|261021123027099003|261022105027099003|261009223327099003|261009221727099003|261009221227099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Ly3IlPvQ/iIAR8G8xb5mDZsEYmDjIm956IaxpiJ2Qccfz+jN3fObcHwb5sVmmMGz0zX4sV9kthKmqxZtRT74/FtBggdyIkIhvTGrmDSLvjR4SezEKbNP/37a3lBv65HhYtzedjbkDs87WaEdt6sloyjpGblbgRWIdGZa2ES8ToGZ9qBgVEnaGdeFGwBcI68gTvm41dpjgc3ilt21XpIr9hfQRo/oDVnEpHryxgdhIZE7G2qZUhEcsUjERuPIl4GIqzfYC9IfkKBG1lronv77Jfe85NlHFExijw78mo5cK0R0wh5S0timdlWOmuBcMbF7AVH0Xay9CVu3Nql+zbbOUzFfHlwIeclAW3e/AQ9Xd6C8cbX9rzAL+CvDRLwjKfWyGs9ijCUVHu3cpvWLc/GAzjwvaB17Ub0XTFAf0tNtZl8rxwlL7l2qtzMy4uHhzR9VS2qpMhR4JyKIrJz+tPa2nmQumb4cx2hCmusHw6YuU1oV8P00R+noIoUp3ueZeWxjiCdqKP4KaHx1j4BYFaxhaL6hehp+A85PvVwkIH+E/PFmles9NRLwnzP3SVv/XTSob8/iRJqVcYxBM17Md/E4GQBW7hRG4d11c26FHY4Vx0d36rDQKGBQSht5Qg9132GHpQIZugobiMdaQAy1c0otac74ZXK0wPfNfDTgIe5BGKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(261021121427099003)(261026121527099003)(261009220027099003)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261009223327099003)(261009221727099003)(261009221227099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8F7M+pi0lKQqTqlJwCuu470Z8yjPj+ofdMV5PUphMAZOlamd6BhWFzQ9ET1F?=
 =?us-ascii?Q?N1+ANlNmKjD4hmUhG7qdpSbTKBqb/KqRUhU5mZHkoYjtT5oTF7FOWPABWbla?=
 =?us-ascii?Q?puHulYqz9BXSuR/i6nvFVaVyDO/H7pYXGYusmRuc/ep6BbcM3QEhOG+C/ZhO?=
 =?us-ascii?Q?w7fgAvuu2yePmvipzQoItE/JtQTd2h+pr5kXksXOupChzLaKSq6ieUEtA+ES?=
 =?us-ascii?Q?r1FZHWmBZPUBn8VWUhnFU0LGFY83Ya6JCXTtwdS6tB9FHbTwfURmJU6x53kA?=
 =?us-ascii?Q?1KFv3zTfoJEhcTYiKb86nKsY5fiznx4y844zdAjx0aq0W0bhg4qJdNWTNL7g?=
 =?us-ascii?Q?zKrS7o+Kd+y3edRLxrxBE4y82D3VoQDK76uQrviI+bk0FSl9jfdJUArPQPgn?=
 =?us-ascii?Q?t+pkUWbqfktI8SbK0z4KDWIWORRHmgY4gHpiexgof5RnOnEB53AfM4o+WhMx?=
 =?us-ascii?Q?fNjCAwwQpYp4bsa9EVft1pKAPT/nQs4/07IjWJipQUgZUB8KQRK3eUOB63nX?=
 =?us-ascii?Q?zNbYjop7+vxd71UH89nhNm68VpfL8ZK9rWiOi8WXG+HvGrVUZnqQZBGFc8QI?=
 =?us-ascii?Q?ts2yq0cIylCFl8KU9JOZag0/d4ccQTcDvWNfnwtI0FJybz7nIwNw6hiC3nSN?=
 =?us-ascii?Q?CljWYN7+5alkNtDkB2QswiPZD49ExMln7buOnLPaEfk8vpfvUaEjAT3GIc4h?=
 =?us-ascii?Q?VSB+FgWl0fLz9N6yEjZh/KPQrEf25PeLpVD6XAt2upi6CSvL0I5yVDuVRf8p?=
 =?us-ascii?Q?Mh7/26WJkFzOmx4AnLZt/8YXVzyOjjtKIKhsXrbmjz7SswXGCVE/8sp5e8Bh?=
 =?us-ascii?Q?vTcSjeVjqHxGMAn957iwDDDSCEtJB3wtCTwWClST0JaXrzbOZiz4kCcykF8H?=
 =?us-ascii?Q?oeqlsrcrPXiAI885UQHlRDe+9Seq95+qVHSDlIsPQL8KvAww6KAojCV6+GBa?=
 =?us-ascii?Q?M3th2tCiKRbrqpvvDTfonkzWtGzLjGKNg3P9J01cghgE2nf0nKa/9mXRvOWN?=
 =?us-ascii?Q?dFJJMK2LgHLl6kVXS8UUWZnuaU9sMdaNQekgaEllvZgai0RV3A/nLZ8l9hRD?=
 =?us-ascii?Q?t/+UD1cs0jOjNldw1DOQLj4iTlNcAlShp4/KFzsy4GCyp7MVqmKYtc6m9+bE?=
 =?us-ascii?Q?8Ihd+KCM2gSn1I7k8GiY7mYXM77FsCCmWbRnfF66Y6n7eRIaAdZb9Y9Yblez?=
 =?us-ascii?Q?z00sUJ5CI+9a1ovfQ7kO3EEyKOlL4wzQz0Z2RXTarjn0zknSEV0nDIWIAzNQ?=
 =?us-ascii?Q?GD2qc8y4Mgy//NxTkX248Hfzql9eiZvESmRNMuCEjyeihV0u5RZWRoQBNTdd?=
 =?us-ascii?Q?ldfehG8uE1NX7fDdDAvSgLFfYyzqxljIYK0QHvLjapEzncp8Bnup1tGBSMPj?=
 =?us-ascii?Q?8FxAD5AlZZ9puGbPirX8hHFrUVSAxYOuS7427JIZslKPoA62rDP5xhYc1KS/?=
 =?us-ascii?Q?Ng/EdGzl/u8DW5dbUOOiJQaExzTgb9cbJtoquq37HeZsCwlH5XWVZHtSv18T?=
 =?us-ascii?Q?g+QRpc0uuSwLR9BJx+DZBZBCrB7gGRtrfaUNVHfiRT1a1uY4Sbxj2ikhTB4l?=
 =?us-ascii?Q?4ECOA9HZd/DL2Yae33SYg504gMCrkfcCBzNyfGnMYAdNE3KV8GlXX1g/DCoS?=
 =?us-ascii?Q?4lmBE/9PZnz0mtJ8JE0PXfXemzRs0NrDJyNRfTIP0DswY1V/A+OV2tmEjhfj?=
 =?us-ascii?Q?c8byESkyFrYHcWhaUXR98gvFzlzwBkOW88k2QekSVBHm6jX2x1avkaCqYPQe?=
 =?us-ascii?Q?OluGjdSF+w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8e9922-c028-480a-896b-08df4a204db4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:44:31.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gk/iB0VVd02ezOIy02xP7nrvhcv0ehgwuHCeM3ufUvee5dQ5Gve+v2pjzn7jSwkVZud/2JKV8onDrbDlImZfk0OX1gZvY/qa/DlVoOyX5uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRWP189MB886491
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251026
Content-Type: text/plain; charset="utf-8"

Upstream release tags are annotated, so `git ls-remote` returns both tag ob=
jects and peeled commits.

Allow `^{}` before the regex anchor to match peeled commits while ignoring =
`+fixup` tags.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15=
.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
index 5f4db41c136..294e3373437 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
@@ -7,7 +7,7 @@ SRC_URI +=3D "\
 git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;protocol=3Dhttps;tag=
=3D${PV};nobranch=3D1;name=3Ddefault \
 "
 SRCREV =3D "6302bea23b53e6461c104f9543df887a63b2d6ec"
-UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)(\^\{\})?$"
=20
 LIC_FILES_CHKSUM =3D  " \
     file://${BPN}-${PV}/LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab12=
3dad \
