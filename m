Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7399.1793699139004605694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=lMUHpv2Y;
 spf=pass (domain: est.tech, ip: 40.107.130.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbJZvg3sIeXRAPYjl1oOdKJ8zqlgzssVHIhC3rtRtMyK0jTH10TgotDU9SzgG/s/ovec7/jzZbGVL6oaGWnuOQVPDPcANIIc81OOtP2RNE1djjTH1y7+MG1ZztT6n7s7+96DSI/+GeZZg7zP8Ru/f7wURlqALNus3QIruFjeEIo72+f6bj23rgT5ne63ANVRydgUrY1hI0we1+EXSL67XaqoAhHYU6cuz6Wqizfp7b+6O4RopM8SXOUOENPEE+Xioq/hzu+nNrFy69qIgdMyg4VJj797FwOaVPC5jljhQEdA3/IljVAAG170Wb1dYOYztcnM9wwJUgOrxFOa5jVjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rfskW/mE9pw0puqlBxHFSpg12GQWCZ8xhm56G+dOws=;
 b=eov31MnX6UtInoVy15lN617Onsp4yFbbtcrT7Aac066srE2j8qjDIHic1rVPnKI1M5CATttFJtnDlst40guTXMk12YYTd1GE/t9fp2gQxKLHGQdp2V2O5mMRdY9NZBnLe6N8J3/JQwuY5B87aDSQmx4UMMZknNcJfQjvN2zt8Jh9BlOXnrIaRrS741KkLf5ZNnwlB79VnsbAk9teps1/5cTUMykpp4NmtEMENBN9N87Lzuf4IZIjd2QRjZgQImrfQHa3zPpWKJcchMbQzkuAeDOExKQ0uo8R6hsiowOnLSXApbY1nq1lWYGji4bW70PCZjsex6OZqRyQFa3vALGCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rfskW/mE9pw0puqlBxHFSpg12GQWCZ8xhm56G+dOws=;
 b=lMUHpv2YB0Nav+dFPvj0+Gg1rJVepvNWWbeVvz+OcWvZ/E5ooW8d8HipLfoH4DuI8f5autkr+rn1LaNak1h6HvKdiQpbPKiUyPxSoFfv1UHOlI18GvPslHxKCABHiZWF2EdZ5b+NXeGcQqzkYFeFXEL75gSZz9KWIlZciSZsqZy1gcAQrnHcmIVmN6lC+N1Zj8T6tTTZzfYCDQFZTmvAjkjIgLxBHtCO1F2qFlqahkv4HwS1LV5BP7GbP0VBIZw3hjoJ6s78xF1DM6KpEVb2/KMIuD4hd/gNyyHDph9tc3qP2H2HCCeP3VVnTTy8xmglAgDSZTTwc4kOIupSRdONIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:45:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:45:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] lttng: Extend recipe for nativesdk variant
Date: Tue,  3 Nov 2026 10:45:28 +0100
Message-ID: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a8c98b-c373-43b7-6838-08df398f3453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|261009223027099003|261102123227099003|261022105027099003|261021121427099003|261028144727099003|261026140227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: eWmEy0jE7ps2m9nepu5cK9y/AtFn+CqJgG/9iLRGf2pfEvilY23x0+3Sn95eAUpzIDdSLKkUOolHspf8QWuALFdca/cxym45Mo2xLCss0R1ttuZBq1SYBHcKondvTLyaVq4Ca1Gri84tjNACW8ozEIS05rd9v1jOQu4JEjjdOWa7KU+yVb55cCk9pkOF2NjAM5d+rh4VBDIgOeawm/KJgxRfsv2DCIPDOLfU36cWOtVlcrc7OZkV7qQn92UYZ+WMJ/hpgHcsLRQ2TU7omZf2NsTFy+kkHeUOWYiCP5+32V9u4R3GOU1rDgo/5yqWVQWAuwTNQc10uv8aQikh4vIDAF13iQKlgBhmBh+f1ynh8q2E417mic1wrEUl4Z40QRg9maFa1r+ngKGBUb6mNu5RxWDAuvaJ8RjsZ7FyuQV/ndlvCGdOVHbbVrne6ixOJjbBfTcpWSJLjY2hmMeg91cU+0v32fryp4C4KbRWKiVgbamMQSNXvwhHs86gilsmLVCTZD7KfqzJeT9QfGpYn1500n5LiRSaCEkljVmKKIiKX87v8fP7ocxIW4I6m/5F4oUWGV83K3TkuVhX4pqMQ8ZhmFkpXql3oHqE+J3Xh026VSEMMD8Kc30cvxPSvvXdcPgHFdv3WP9/M2AshoKZDlcCt7ji1Kc9B1HBtShEK3MoOzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxeHe5cwEELfdSA47HWXOGXRs8v+UzkyCkLv2EwEveSoHzpW5vp9FAP7qJ3h?=
 =?us-ascii?Q?XbrT8g8tXEP5qTJcWrQR0eFjQtOY1q6epl0xIruAaV9xrMTiKIPnRXLUhSMT?=
 =?us-ascii?Q?8kyk3TDj9/3thDsHaDP/hpyDj26SelxfUixW/hOzv8GGvpHytr1LKyEjJnqk?=
 =?us-ascii?Q?bgkarZWnvz1QhOssW1CrMPwl8GML1Rs691Ey8KKFTmDmoKbbNkdY1PzHeP2B?=
 =?us-ascii?Q?xSlBHSgQThGQAkoGbqP1ZffkR2tUasMBKVFwFoB3E0dANpBwiY5QNKNLMY3y?=
 =?us-ascii?Q?Q3rq3IvNnJVflGMC9ojHqbZCGAb+6nQ/86i/+8N5cM0MYFnf6qZ7Q9GVBDzT?=
 =?us-ascii?Q?/rY66vY5Dlud3u574lz5CBseuCan9ZStLgxWAYc8qzmN9aMbf3741IbDqva2?=
 =?us-ascii?Q?w/tXoqGGSIAscX+RQrYYNX0QiPIndfSJbK2/q5F1TOnEnS4r7zFAduWjcpnj?=
 =?us-ascii?Q?LmEGsPgAVylea5RgFwBmU5ChJs7bdYu1s0t3t+IPR5PDglveVpjugqHqSeu0?=
 =?us-ascii?Q?FqdcD+sbE7rtF0ECgO2J+5cBxQmnfxttvIYcw7J6lIMEZS/bflhZ02I4LcIx?=
 =?us-ascii?Q?g+KszaTsR4ng0ollxWBBvquL5nM0S6RZTYJuF7/gOAtWx9lfou1wrbqL5isH?=
 =?us-ascii?Q?vx6Ckh8o8NWys7IWRNv1EtYWOwrAP4XCHgi2GAJabDZmIL1gI8VG48WcdLTD?=
 =?us-ascii?Q?Wv7LpLcv1BwS5ic5+i2o9/5tyWgybEIEBlj+oc0fmaN/Knd7084q1GUvSmm+?=
 =?us-ascii?Q?Bydc7nCLRKH463iONXOlhJHprGIROSIbQroMRlH4FUBdynmjxyEb8vC3H36/?=
 =?us-ascii?Q?Z9lECyFzxxPQ+859KFnymzqFnCyJ5WZKNASsWSkVb+66W4snOnakxy8vx998?=
 =?us-ascii?Q?RsV6xwPoVRKnrs5Cb+wvWNer6KZmAkSqZH088KWL7801pZevQYn5v3YfgkA6?=
 =?us-ascii?Q?LJfIgCGsZgcQzCqatOIOS/fZ9jr8raUHp+4yxgjiF8CinDCKgD2UKYfaU226?=
 =?us-ascii?Q?e9AQDUU4VTKewPC1xD2AUE5ijwBUJdxNMs/gJy66hiBethfZ2gqQl6NfBkm0?=
 =?us-ascii?Q?5fGOl+bxtiSHyj28etUHyzuScx9pweidm2r4NXbWdSh+FQojD5IVTbg3jIuD?=
 =?us-ascii?Q?9ePkGXxuH6YZhXidq5G0GBPObjuGHNPQlgJCwmFOkz8dOcbNGIX14gyzyTcE?=
 =?us-ascii?Q?DAmhy0jHenbS3fxy0TE1uSTCu1TNZfIHNrjPa2URJEr0dyHRE/M7mdgnaVvi?=
 =?us-ascii?Q?iY3btrvSM7PoVvMIniE/VPH9PlbXH2pwMiKrVYmqUSyPZBPBPhPhCdYctfpJ?=
 =?us-ascii?Q?qfITAxOkWoAk/tw7Zp0OdjjnMH5qZhKpjSSMtVKRl8NeGkQU/MrDn19nOTy2?=
 =?us-ascii?Q?BUkSn4T9VdozoQovpupkZsyj7VK3EuwXDfaftt+cCM7UwWnJ8Yk9Dcp3+DEI?=
 =?us-ascii?Q?sbWcD8E3qXk1a/pILN36MvOQJcz/tjJXfu7+5BzKC9xAKl+CscF1LXzHn7vW?=
 =?us-ascii?Q?LGvIjG9D+L8eiFe3HCY31OGdjkWHYoZvrcOylcRwC0kWukaWPDNdBg678ugm?=
 =?us-ascii?Q?5CwROy3Io+ZTiW3Vt5wXKQdC4hKJUFPnz4xKaGNuaKWBapl+R7EcOeNrupcF?=
 =?us-ascii?Q?ilb1PtMuqi83kB02LNw3IierMlOm9nU4vJtkeO8b/l0krxhPWs79pGE/Fp1T?=
 =?us-ascii?Q?VZ8Pp5Fo0ZmjMrK+82JsHmHQF/Ecy1q9W8DNHhzj7tffJHqFIha667nUnUpm?=
 =?us-ascii?Q?gj83fQLdYw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a8c98b-c373-43b7-6838-08df398f3453
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:45:33.2141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8H7M1Us0/LZOT7y23ICPpTo7OdvnBkSp1/7YwSLAwdXDONmRaiCvM7PqwljgeNH/uc4PXPN0teeSEE8wicViPZMihY4iZ6F9KK5LVJP4d/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249269
Content-Type: text/plain; charset="utf-8"

Same changes will cherry-pick to all applicable branches

Jaipaul Cheernam (3):
  lttng-tools: Extend recipe for nativesdk variant
  lttng-ust: Extend recipe for nativesdk variant
  liburcu: Extend recipe for nativesdk variant

 meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb | 2 ++
 meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb   | 2 ++
 meta/recipes-support/liburcu/liburcu_0.15.7.bb  | 2 ++
 3 files changed, 6 insertions(+)

