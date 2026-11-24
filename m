Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16223.1795520674441760923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 03:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tU5f4fb/;
 spf=pass (domain: est.tech, ip: 52.101.70.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgaKlUZjMB4QFDNnQd6QnDlJSqIWjp3uZyu5whHeQ2TDfnoKUmkySbtTJYN6MhY1DNCX4Eyn7x4dFzBMnTJn/0iCP6mj2rQGmrdPaQQxSxNgJM662rZZQD55hC3XLzbMGTtEV6xO9rTLsujiP3iqCPRmU26JEgEe8+C9FeXYSU7Rz/sns8mNrEt4owsOe3zs1zVYMJzDirzvEASSpVpzNtg0TGOM25V0e5u4w1HBnCvr51AtrP4U6iPdqBzaiz5hM/n1FXfg9XTVCpjUyCdVGz1vtkQPFh2L0ryuJcPepv75F58ADdRc2yr2bKCgjHKfSKNsS8Zw0sSong5iUHN2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9+iemIBOWV/q+YkNf81Jvg5NltTuaznsxgS4dzyong=;
 b=h98wvNWdm+bMZMGln8z2GlNwfiUjruEy1aUEUxsc2hLtsPQHLzg0ylJRbF/KJMigEyZ4ZxerNwzxjp6A8/exZ+puPAXqd53COAZWjPAXKEObf73Lz+qRZFV5yN9pYDhQsOiYs4UoAMuSw9RqAUlrKt5sL/n026eskxxOYzSgyw+CSHhZA6gj9LHVgUYq53lQejLPqSuvvWqNvu7y6tMavB1ofJShDdNTOay/ytKNq6n8dh/vKT5CRsfqis98PjuHlSkSHLcTPVLTpZH28FBWZgDww7gW1suyjbVvHzvTtvhXp6fQzoTlt8Y1l78aOTEzpz/QdJ+VXKpV4gIv+I+kXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9+iemIBOWV/q+YkNf81Jvg5NltTuaznsxgS4dzyong=;
 b=tU5f4fb/V6OlCkzNKNVOlxfibMHdiVEiqAPCD+bhePHl2dhwDwAVfC/tLD8jwS0jbiy+8mjIpn5AhDK4SZBv7lbvNsFDJ+JYZrXk4erJVfV5JNc38P3UmnzEBZXiKFqw2y+gwsIB8MfuBtLYRibiwjMmdL8ff//2yBXSUOtdHVaOOYGLIpbNmrwE4MUTh0kwdWiTRuQI+346Ufc9m6ia0+Zfj72mBMODnGF4aRrkGLlteZFiXfyaDsiLDGZpG+MW/TKdKeQwXR0sZ/ghXsALRbbQX2EZJQ32YydNVGqRyDNgCznG8Ta8QvBOGdkUyqbUeNq8rOu+RvEKnVpBdwc8IA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by ZRWP189MB886491.EURP189.PROD.OUTLOOK.COM (2603:10a6:910:400::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 11:44:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:44:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/3] gstreamer1.0-plugins-rs recipe fixes and upgrade
Date: Tue, 24 Nov 2026 12:44:24 +0100
Message-ID: <20261124114427.70379-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|ZRWP189MB886491:EE_
X-MS-Office365-Filtering-Correlation-Id: b50746d5-c8c8-4f64-4fd9-08df4a204cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|261021121427099003|261026121527099003|11063799006|56012099006|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: I/gi6tcqQrW1KcEAzjfwJBWY2pTm97fq/GFF1JsQQf9BGd6d95NkZQ0aornV9H0uHNywGZQCw/RWzLcpK3wNGbsqtqY8D9bHHD1rPqfc1eMhbt633wawcke/Ypv8Ht6PJqX9KkL1KrpGfI4NISvI2ZOAWipkYHAC8JkFN710zPuyxPGBPBVQKBRCLkWtMLpZvNSZcSJ4YelxoRhko31MGA9qTOGNxk3y2H/7pwXPNCP6dfD91wEt9qobvd4PpeMfs75cVGYRs4D2uHR4X/xfikFrYDcecbeNHX4q9JawhnB6WZRxPxUgF1w5sbuIyofm5vMoo2Axk4yKybXSsgppv72Yc3973mlkWSwZr/oCrvjI6HU/fVw0L9IuYySrjHRNpqH+mZaiI3q/S91TGXJYJOKIDffTPf/lrbQe39s6xYP6DkNulqirNvxROTPut5aek3rubr3ipy1TXEHQgCOBbVDj0jwzCqlHXduJ/8IIV/xp7o8V70rWMl8pELUaC1kbUoQXoIeTcPw5jdlLG6CW+WyenM6s5lVVVlR5FKpu6TgxwF/OBe7RPTb+7nhUg77N8r6/nu10gGiZFUki8sfd+/Hl4IL7hoA9KI/ZBRQpbQLA1GZITqp+cjYJF8IDAkCp56zyPXsQUfJu5i7aHQJc5iF7KUUaxnGxNCdtauEEVGs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(261021121427099003)(261026121527099003)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AgTp1RQMJKt7PuKZEl7AO7ziYeA7mK1W4gYQKxPWpfZVC1Hf5qp+zNg59oUK?=
 =?us-ascii?Q?y4oFVw1T00nyClpl5vHVgc2USzjwEuvlw3gxlTH5waSkEvNuGcwkTRQCctCX?=
 =?us-ascii?Q?JwnPtfA0L0s/zIqje5fLtkqsMrVpu2euSbC+kzIh2nv6dgSbCXmPbBLBWp4P?=
 =?us-ascii?Q?pljyakbQa6D5eKQ+k7Zxe0jceHbsiTxcIhIuJmjOqIACkvxkQpXwN57ezunb?=
 =?us-ascii?Q?kum3IHz4zAXDJNoA6wBL2CvfB6scc5VhpnW5/5rpaRdxFS71FZVTYqtZAkHH?=
 =?us-ascii?Q?jatuRhAlsek7bkqJ/PrhxZd4lrsnGh+SVNYegClCfGMz5K+fGrot93Fflmgu?=
 =?us-ascii?Q?iKZB/MB8IYh4kUjrD5UE+QnMKGvNQKi/pVTtpXfdpUzcp6uJU+l5uFVbfDPY?=
 =?us-ascii?Q?LwahAUGbRtHaEXKwNLGkk/z+f70yPMFghLHtOZpuqko0y/kJ4ibctUK6///h?=
 =?us-ascii?Q?5P63L6oxFZJcYR9dtrifTc34ip7Xcrsa1q4XHcj+HF0RdXzweAN+gQ5z6apv?=
 =?us-ascii?Q?RvG9+GXO5yLprIgWWICFlk3vFn3IUJk/iUVhdUtv9F2NMashcylBgV5cC6Gm?=
 =?us-ascii?Q?l+Xyz+xQLq7L7m9YqLa+sdn16A3bZW87KwRmsoLQrY8wJpJI5Ax4pmaNUWL8?=
 =?us-ascii?Q?SKhczHf+O7Gn+D1/+1aGHL9/XTt2R0P8eVwKgeH/r3yIBmfxzpFNuaUXtcd+?=
 =?us-ascii?Q?79K/hrz/hj95qgNaMHIp6RLYscrWiOKnpvx/lZ0moRFRkIrNn87/zJ+pQu34?=
 =?us-ascii?Q?bTdWw5pK6fHtQ/NVrDh6yy0j2fR+U4Rha05jQa253fbqZCVpna/E/yYJDUMZ?=
 =?us-ascii?Q?ufsOlcZoNWvXlFm803787rT9eiBv1eKWcXObtywyxrKtB/RCx69Jf96f8juC?=
 =?us-ascii?Q?ihj83IJTiNPC+WhWj8spj4Flcd/41V1GbktObQ5ksBCwMuBINW3Sfi3NJTEL?=
 =?us-ascii?Q?ua+tRmgfJZf5ptP+Delk8qMwK6fO/ZYeHMd9GtXlVIjtPwdT+5ocDMvcjOqn?=
 =?us-ascii?Q?+o8yuNuC9dUZYyWmzH0dUOb7VTLgSbVe//8v0ewSvrb4ZvRw6br4V4qoXxQf?=
 =?us-ascii?Q?OZqinMRZKakSczB2zRzXVxY7FztwsmtN2+h8/1bqUjyIKpaXvJqrAY2W4Hf9?=
 =?us-ascii?Q?32uObR57RVdC4cmWVL2tJ18M4lXmDX0LWbLzY++jeGfYy7hYjrJ4FVQjayzN?=
 =?us-ascii?Q?ElBfRfQBx//eD7ymmlDxH7qjXQJZAZ4vM9hCHNFJ4iYT9wxaeFQJ5ySVBsc9?=
 =?us-ascii?Q?Jf256G5e+99UaFN8XEf9k35b0vs+e75XsKJq2yyANydXalS75OLd4rEBnBaz?=
 =?us-ascii?Q?Zuz1WJzKc+eR9s5ZvBWm2xcvyrri1rbND1DLMLoXDqbrAL/pTs2D8jt7d7pa?=
 =?us-ascii?Q?WL2Yn+e0EXhRtOc5A6mFRW4IXNIYBlYvTBE2m0ApExSU9+wF8b9OkYwMNfCM?=
 =?us-ascii?Q?fEjX1rp9pkO88wk1lrHPAY9qQ2/ps3e5tpMeyipX7R+s4YzE3T/AxRW81wlq?=
 =?us-ascii?Q?67mPLLJVk88+dki35VYVEwp/qzlKbyVRRiA2qbTVHlojvViagERIkCR90qNU?=
 =?us-ascii?Q?35yVFenN83ykYNhyky56MaKgl8DR66AWGdjEe/jcjVwXaiaNDVSoFLTR/hLm?=
 =?us-ascii?Q?GxYDFl6uWnBa16ZdZPH/aiUFh/oWl3r1PH+aXDEcCeR+VeliiHaLevJTCRv3?=
 =?us-ascii?Q?hs7xP/9R3cD6D5b+x41WlKkJ+Ig3PADsmZiPLdmOvntXtLyL2HZ8X26LvV6b?=
 =?us-ascii?Q?a9iab+rWTg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b50746d5-c8c8-4f64-4fd9-08df4a204cbe
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:44:29.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92/2Den8XCwumE68XFGV6cjgySSGaBKppJWkJi3k2ZF03q8V//0Ro9zzr9r4TUTvWhlaoHRHRI18p4UkJr3ZnaIhLJmc8Z++3J+cXF5PADE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRWP189MB886491
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251025
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (3):
  gstreamer1.0-plugins-rs: fix annotated tag match
  gstreamer1.0-plugins-rs: drop S override and fix LIC_FILES_CHKSUM
    paths
  gstreamer1.0-plugins-rs: Upgrade 0.15.3 -> 0.15.4

 .../gstreamer1.0-plugins-rs-crates.inc        | 1262 +++++++++--------
 ...-Cargo.lock-for-non-git-dependencies.patch |  888 ++++++++++++
 ...3.bb =3D> gstreamer1.0-plugins-rs_0.15.4.bb} |   12 +-
 3 files changed, 1542 insertions(+), 620 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
rs/0001-Update-Cargo.lock-for-non-git-dependencies.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-rs_0.15.3.b=
b =3D> gstreamer1.0-plugins-rs_0.15.4.bb} (95%)

