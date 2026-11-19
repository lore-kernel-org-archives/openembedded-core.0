Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15190.1795097628944981389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=u89AT7Hc;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd5jp3mWH6TAUY3yILy1atkAXMECQLb4Wc2FQFH781ObiOkRbzrUVk7Iw75OkP6DEIL2760aq/mzZ6GPuLl/D1iaIpUMwXwHYE3mFjEcgaGHlV4Hky0J5JnsZu+s4/g64GovyE2gMHU8OOoJQy0/F5+LwnCLEIFmfWpICcTzTHfHCbAFmaRkU5ptPRg9h9LrNZJCST7diFJYGIPjn+fPJ10Z1sDXiSV9OfbCEMdtnQGDs1R9v7fig6MIPFfFRJvJ3FDYi3UQGz9Cbq5SdrDtarkre05xpar/3+ahhhmq4QouAkf7NIYoPwloDMZjFYFRjt0bsfNwbGP8gFwdYawHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R11jfStEOBhwkKynvKsAIRXW0uMjtc6K9pD8X6eKASI=;
 b=kqzgDpKHbTh8x1cW27TfinlUAQHRoSqrEzMPjz+GLPzXmcwhN4YTT4AC7lvw+dTlcenSrEu2L0/QATYTZ8Tlhz151pSROqVPW4WcHjz5eJNKnjAGfZqqxL+ssHfGJtqgMlAQWhd9aZKle4SpgPi5sG87uXxR2UcJ+/jrQBjGvq9oiLSAYS1ZpJ7S2R7L/lgiDmFSduv5QGN4IUO1MDNo4vTlz4sATgAR08ldSv3ppA0w9lCeKFLSfdFNuz7Sp46kNeZry9OoDvJgoIbgP/dGeDZOlJsutMnu8YGQtIzr0Kgx2xOyBRBLnmo199wR1yILfoU5DuWBrFPldUXmRpwv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R11jfStEOBhwkKynvKsAIRXW0uMjtc6K9pD8X6eKASI=;
 b=u89AT7HcTp+z41qd8B29zCKTe0V3AOV4BaB+dLq3RdWxKErp9UTP92jZjnkZZ6AKLBAERSm2j7D6IPBFGtk1r+SADenyc53bzltKvkVlOW+XHuVU86wnPOF4wKKb/CcmhxFh7qP6VqxdgnP8KGjEbqaHLYqib6IhyHceGUrnyBPo7wyBqtcnnlYKpYwQkVYh8xXAkgYPSDkRkCVJUGPZeEkRtv+VKvSdylA3r4ZdevnQc8+VCb1qBAqWazcVvwYQkoqkLkHQno6injmT0WeczunBgoOuRbGsl8YnDfQm4qi7emTem8WY50N7XW0ud7QWvVFZRbXrxjTUpFFDljERdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] webkitgtk: Drop cairo from depends
Date: Thu, 19 Nov 2026 15:13:32 +0100
Message-ID: <20261119141333.34492-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8e7e53-e274-429c-32fc-08df464752ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|11063799006|56012099006|261026140227099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 4m4Kjt8P0bzcpqeY8Jow3WW8kdlEzoq8QSKhBUsuEmWaxwwHtLetFoJhnU/O0Vcd+L0EC7iEtmVKnrGgkDUY/rM98zs0cLB6ZQKG7ajsNC+LqcsHQqBcwOHPAQ/MxK17gqhArkto0sCOixUFzTXZFtF7sPOmEOv2iBo2Q7o1NR8V1mA0GDf49/Jx1TnYJegSfq0u9O1v86QKiUw7U2peid2XdUOmZYYXC1hRl6k/f1ZBrAtREqi9fN3puNAMkl725SZccvUU4Wx/gZwC6WJNmAjcTRD6grvDNjdlZhW9CFRfja/ouXfhHrBUnSHdjVxg+j7/70iJ3XsA/wDumLBUJu2laxjmRm2dEuX8g+tTQ04Ie+E2QawrzQRhZPcFS4162Mb29U2ITyqCnTCqqJyM3lOgy0gPyopjbNM3Du0fvPvJblquF6vtKWWwfslYuuGtsCnE7GcpZEutWH+CUgvcAJple9R7yRiJqf7QPFTVt3RysTuuMzTnHMi1/M0v+uonVQNt5bkZozXd4CwV8tTyWsiG3SHzNfHRBzcD8ViD99INCbb/em20z7481WNFxSEYQypnaskLXYYKoXiauDlQEcQHLjja6Bu5MdERwc1B4qc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XIijcuv1lBu2fI9ptNnjoXuUgSkG0P5x0TLxYqym8dx7mBOwmoFl/zI1MQN5?=
 =?us-ascii?Q?3bNkx67ODEMGU1CzNi/iEXXo+L4EFBl4FtbUGj+hzdfl6C7PKCsEOHHRduly?=
 =?us-ascii?Q?urucCjrnjnQn8zCDPg7adHF4EPJ6yMLBRv3AKE000LU7HZrwG4e8jU67vmHR?=
 =?us-ascii?Q?YQ6FGiXAEIB41bM7WmnY2kTCNCOg3oDyAHUqiVUQsgffFClrNCRuWPt8xjf0?=
 =?us-ascii?Q?7ahCeYyQrifXWEz+iQ5zLLgSaZ79gITUd09jQVAHCy0n+JEvlM64U+c+kY1F?=
 =?us-ascii?Q?fCpMqLQuqLUDx+5SGujcSU/x4e8h/dPe+43A4NDfPlof46FxBoVZodpTEQXs?=
 =?us-ascii?Q?Pe9TdR3kaPKnc3WgK8OqZoV88hP2v7g3Rpx+ixpftcIvLe3306/WhfKNduKG?=
 =?us-ascii?Q?y+AWJeS0U1K8smNIX8q2ZOXMBtnWnn2NQK9AG/IBs4I/4DtpvBJ7n910esip?=
 =?us-ascii?Q?mxNj2wCpPYTAHoZrpIWG8pxg+IjV+pefLRpqWgY0KZWypwvjJwWrH8CH41pD?=
 =?us-ascii?Q?dnzoEUFwofhMsR5xMMuk2zN0Zq1KH2bAXIV1+eai18sLf9jAH7sCou7KXl//?=
 =?us-ascii?Q?4UoIi2wBDFk3iqmReeVe0ENYHfi1S407vatoBmnc4RNqBeTYXI712SbgwA9I?=
 =?us-ascii?Q?f1CPjvEgRpShr6lv4HAnJ6D0TDZOVjXvbrUJqt0io208Wn14sqY3gd6riNWb?=
 =?us-ascii?Q?LSzQCI7DAmRUCiYKbQAHtBRP6DOH14T5t5gtaj++T9Oicsfg1DZT7iX0F8wK?=
 =?us-ascii?Q?6uuuic2OkoFtZDdlXcU0+Yme/d/GnH5AlxqVQBq9K2yrNG9FTSNdv+N0VSI6?=
 =?us-ascii?Q?iNjS7gq5oL1Os+RzBIHJ33o3ZLn4WHikbs1mi7DKeS4FFWaQlzgrdbjpjdet?=
 =?us-ascii?Q?Oby16nhQmAwMw9XP/vokjzj78N6e73ZHdGvMlbeSHmJP5g98WkTe2u3EiD9u?=
 =?us-ascii?Q?zRkX581g6MbHrnXPuMr0N4cJjYrCDCosJtkIpX0CcnkDx24gZByW8cpg20/1?=
 =?us-ascii?Q?IntIA0kmjfHohOxYrZNKoosRLHhde5k88qLQjoPbuB7GfkFVK3PWolmZkn5K?=
 =?us-ascii?Q?n6+cnhY9gXiexSbAVfso0HFDBs4b8qf/m5az/AXVm3CGWDH9oAPhpoR0jMMW?=
 =?us-ascii?Q?3Hdfz9GCqhjw6O/j584ZvIA6G+bsmwJN9nuy4/Hc35NplBazLLr4BSa5UI/K?=
 =?us-ascii?Q?650vILAn1/LnzFZZthJROvM3mDK/B3PCkI0ArxVkzIiadjB+1rp66KAva6eH?=
 =?us-ascii?Q?ZpD2bQre+MMoR6rHap20yO8dwBOCNQKebBHsXquKSutN3ceC83YND9S3rXoi?=
 =?us-ascii?Q?KaksQaFCmLHlk1T/drdmSxBZWoFLjqej03a6DyEWpL2hFSFS5QrvCV/3QHZl?=
 =?us-ascii?Q?3D/y0D1XZcQocKnBPjS7xx/yPO1YdVyQ0Sl5u37QQn6KzUAEBkSShOqORvgT?=
 =?us-ascii?Q?Z4FIViroAd7eXgj339hvOOklxObKR5nz6I3tl6wVWlkl3CS/sxyPtbbclXeD?=
 =?us-ascii?Q?CUuNd8yl0/bFX916LQ20v8cFsaz4WNK63h+f+bNkJh+qrTgm9cIbJq8tJxsp?=
 =?us-ascii?Q?uC8aBPYz3wOIgO+qPSfHvQJNunt9iUwBLQ3+2acBvT47pbXW5GeVGKQwUG27?=
 =?us-ascii?Q?hqhauhnTg7PZH/xVPycCgQUk6UW8Nx8rdsuwpP9bBmpY0BQRVo//GNDt3iKW?=
 =?us-ascii?Q?QOhFOprMCR/6bKtKQfMD5mQJP1+fuDqvsKs9vtZudG/glCGaqnufXd08qpK5?=
 =?us-ascii?Q?Md0Fv56HcA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8e7e53-e274-429c-32fc-08df464752ac
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:45.4848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qp6IMlCRQouxLhPoBjx1mVLjt9O3Pty/9Jw2mmIPdgJef4/fCnIeZkM9XXHAcWGnWNa1j4lgOCtBmO0Jp+EjYWjCihCPrpczKlBfLjTOe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250678
Content-Type: text/plain; charset="utf-8"

Upstream removed option to use cairo [1]

[1] https://www.webkitgtk.org/2026/09/16/webkitgtk2.54.0-released.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-sato/webkit/webkitgtk_2.54.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.54.3.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.54.3.bb
index 3270eaf3874..59f864a44ff 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.54.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.54.3.bb
@@ -32,7 +32,6 @@ DEPENDS +=3D " \
           ruby-native \
           gperf-native \
           unifdef-native \
-          cairo \
           harfbuzz \
           jpeg \
           atk \
