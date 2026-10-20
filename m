Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1792488579382617804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bH1IUBEi;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpmkDAR+Pu3zWj0BCbrb0AmcoRe/6SzdBWAlEQEK7gd2E3ywkS1a9l5le1/54Ew1SOr3BJt9Z3wk7utPsl3hQVfB8v7nJN8IzZAQSOI0PMhz9dOW8mlpBatqk79lcEUoBK88g9R+L8+mzca7l+Pd7OQ0KGbi8Tfq0KsXQEucwUdp7Y/Lu79DCZ7uJhdJHFySPZ6JilHRaf/4YTfHEKzhyGnHQysMSlHZ89r1dAvpNm1Cocz/APecn4ZWRp99nF+4fCYSEBPr621iIZmlXIOxgemcik6xC47hcobx41r1NmTSLcTg1lr/KHpx5doWv58EgfBVMtTGhFdOfmqSGqlrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVMRq9iFZbXgBfKxDihadNTuVxCk+2ok2oEadl67HyE=;
 b=DCLBAUV3bBJ92FlC5BJxV3+bBDjzUnhZQuqRrzA93rvbx9jD29B+9OHefu5nPJFic+ngTTFRIJGAn5XsdtQfUoD64O4CZct4OOfFas1PKMk1ZDwnh/KQoStUZmETghzBk10tDtiJTqG2x7RkNBwUYmaLSie+eHeQHBHgu+vROmDKrHvys45xAJvjMelTAlikpHNkt6bocTxqd8JXRb0MhIVq1LXCejzmBNt7ulfT+H/zixxv0wcwoTAh16Ue8tkb2gvH6ss9Fsm0jzkogifLM2twomXd6dik9E0QTfSOwF8dBW/3pJSPyPhh2MDkHrd4onCaF2ymsgjaAgKfFfgftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVMRq9iFZbXgBfKxDihadNTuVxCk+2ok2oEadl67HyE=;
 b=bH1IUBEijSh8elq5NcFwtvi+Br7DM3d7kxcQpVIddtA50gHrhOyuXap6mm7+/1yJKUgqlrucOFPQpDhNtlOiGaWdpweSi4llmDHdbsdDCWJ3K4xmMOLDsiMbmD3iBuTyO0VcKsGoeNGj/0fbvfHKk8/unvPXoVd/193hqk1dhOlYShd5OMjee4cqkpZ10t3rxiZVzlRRgJ7sjDX4UaaeDnOoDJ1zrkcxFTxivZ6MgwBw99DaodX7Ig9cECV6GXzAdR6XqkLy5asQX19YLaSaEwnA7mVA9pYglEcjohXXLw4HZpusnUBXAxrkv/ALYEXnGoQQH0dj677Kr8gYlHI98A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] Upgrades on 20th October
Date: Tue, 20 Oct 2026 11:29:24 +0200
Message-ID: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MR1P264CA0072.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: a872e804-04e6-4aa4-ea95-08df2e8ca677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: UBzkKZDYzc3X50Kn0tZ93QJBkIj3/mMnRVq3pe0SwIVKJX0ZqJRtShJXjW1xnw2mhL5HBj6QyeI3NW7vwzUOryUIrRdRnAnH0H/iSaXuT8lhCgJYVayLAmr+mfBSF4GZc29wNk4HP4b8VGyC7TzZPKuFC9136RYTynaa9b3N61X7jhCSGp2UvLNElxbbqOX/lMLyu9bI45OGjACA3H1fK6zwTozoO0LkpLiOKQAdrl+bT4j3XGO7NNbLpWl8iZZ+CZaMAQzQYIhSTb0Ve83Wfl5Y4NRusWm3GFLh7kDV0TV++BfqHJW7zq+7eNJp3DlgKw6KHebi1k+MkmDQk9azt0tq8P2oAtd4c9RcAAjueAmaliWHaDvDgXoIrfkQMuP+Kbxi7IjY+pMg9/d6cwxO5esVkF97Fl6vnY/e28mpGtXTxCuPSQNZCujMKeRZuHX1cJJNwSUfW9YPcpnqklhUQehmBo3soYI6O7GdgnD5qql2BhEBSZAVQOEnVmeH5GLpQnAZXhop0sr3hmpr5Tsv7UaG9emuTXqhpB+c6KaNM11RXgxq6MRs9VOQCPjsAx0Q9/idJnyWzq9CIQP8ib+BeyfnkS0IfrS7Wf80x3ULb0ZA93N5WVVn7jbtNFlTBvN511YVDCZjsoaetX1+QxhJRretaoMpY/MTOv28Q8M26PI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+aBJ75tZ8uu0ZTse530u6gcbJn4X8nNEkRcd5m6pXRU7i1LKwL1jlPXEikI?=
 =?us-ascii?Q?lNAytbxFsH7F8RKXSYmD0GrWiPTlQH/rg4kbX3kxfZGQjylO1gMHezBFVK4R?=
 =?us-ascii?Q?ANSnxWqr6T5AQEwQRbI1TK0YOqu+sUFm17iNb0Jg6qKMm/ISbZdv7Pjw3h6m?=
 =?us-ascii?Q?Pd5sXJj8U7zFGaj1s1yT0hzMyvA1X9XVj3rlBz8OHDTB6dT9QrHP2Ueol9Rp?=
 =?us-ascii?Q?ND1J6WA1BpFDPHwJMDamD5qU9WTJqrIG4xaXN+K6Nk6Y5dTEYHqrowlTz215?=
 =?us-ascii?Q?aYEkKMr4bDRUMIrpZEYn6a3F4o6nMURFZbYN4sMTyde16S9S+cg20EDkFdlO?=
 =?us-ascii?Q?tO7ikzcadE4VBbXM+Xw2b266rHj6h/NzZueBF7uKPRi+j7082Pfe9r8GoOnr?=
 =?us-ascii?Q?cEu9kjvZlFVrwdmq8s+PIYBJXKOTB3aWA5KfzTF19QuJ+cUaQz6CHh0wHaOa?=
 =?us-ascii?Q?QawKteUH/NG++eHvJC7K7ER6hgAXFTPcgU9stLWxGyRyy5A08RkmlFXy1ofn?=
 =?us-ascii?Q?n1ehRXhzSBHNe0+4aZtOjCXuv1MVyVMP+p+gi1c4IQwvIqLorozAabVHbUFH?=
 =?us-ascii?Q?xNFWgqj1Lz5dBKtgiJFpG6eTwTSBQU4ouMi8xvAe5AltT+oBeX8gMnxZiTIz?=
 =?us-ascii?Q?sFFYqh2oKITjl+gpFwS4qmQhaqyDQlLalv00mIG22QOUMA6Or8ayPUDaZ+ae?=
 =?us-ascii?Q?lY5AZX3kM0TLLdthkeOVw5hP02pkH0t+t8fSIOnqEt+4Ov3c1jxwtQCaNAzP?=
 =?us-ascii?Q?oF74HS1aGKKI9QyJEwLgixbMgoGKjNn3olPcC9E0cbO2zUtp2ISmyb4nJdDq?=
 =?us-ascii?Q?y6K4nQYlWxDD5vjWV+Ep68d8f4lGbp9mrm08Iv0GxkmKxTfnQlteqWtDgve7?=
 =?us-ascii?Q?ztqOEw044Ofdr2zm58ElufKEfjSslUtSB3YMu5L60iLVTWoDe0QTuwQRM0cu?=
 =?us-ascii?Q?l2yt+AApJRQF0Gj3XqHH3GyVUDf+rIK0ioS4O/DzdKJCKXv8NyRFjAohr+k/?=
 =?us-ascii?Q?fwJ9QHzVK5iv2GrRnCfG40pTD2q+/M3NHR6IZqkQ5QUz4DuVHv7ucq4SkeoD?=
 =?us-ascii?Q?nzr9AjwQc+8L6ncowK4op31AYUMvLvALeFZlgUadAaU1LzJlsQd0RP8IbqA8?=
 =?us-ascii?Q?Dwvfg/8NS+tORR3Vcs8ZQBiqytLoeMpRWahxQdQ0KIs8vBIQs6IT42q05mek?=
 =?us-ascii?Q?Tse7Y0blwYLKjJDNljAoBThf36hxO0pR7Aspd4N4UiGZ2IwwyZORnYRQ1SNp?=
 =?us-ascii?Q?KbwROo+AunpxbPzPL24tG2IVbpSDKPhPhMLAien5ebZixTea2tIk/svdCCDm?=
 =?us-ascii?Q?9+18+UXfWFulqEoH3i5Mm0xKk6n4gkmLVCBSGdEl6gs6+r4xbPwRH7L/eo+v?=
 =?us-ascii?Q?RbDfd2BK+XR6hcLMwsMgQ6gnCd1K8qcUWy7z/99wUuzzwbDreRZQbfewh7fR?=
 =?us-ascii?Q?TK6+2obX3LoUq/beOumfcQE3DLLCa47iUlWaTYlnOpXP258HP1bsJ6UPRJx6?=
 =?us-ascii?Q?tq4gvmbO7CStVy5KUGjSApdFheLkdYPEFyqLIEuUjr/iwE5COX+6mOQZ3Hi4?=
 =?us-ascii?Q?4v1p9aDdEKDnIEE57MOFqNt3/viRSG9XjnnjJ7nPmhRqmpmqEPO0bv1Fpq0m?=
 =?us-ascii?Q?IRM5dgezNUjl/k/WGxXs1RIEmbgcV2MWnnL3Q9dyB/YEj6zYQRlA57Q4IQzj?=
 =?us-ascii?Q?8WBeH6K3p5qw8sRzA+NKkgC9Wg2p9pipttEoXWfccUYb0jGSvPwyoU9t7PoY?=
 =?us-ascii?Q?f7GFjE3qbQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a872e804-04e6-4aa4-ea95-08df2e8ca677
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:33.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZndogRrjJrJ66qdrftBdUKYiFycU0LOMlr4KyAJzSR5IFT8rJXu1RytZySRq/p9ACcss5SdIdLUcapchXAIxn6kJalAOLlx4aZpODk4JSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248257
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (7):
  elfutils: upgrade 0.196 -> 0.197
  ethtool: upgrade 7.1 -> 7.2
  repo: upgrade 2.68.1 -> 2.69
  libzip: upgrade 1.12 -> 1.12.1
  libunistring: upgrade 1.4.2 -> 1.5
  log4cplus: upgrade 2.2.0.1 -> 2.2.1
  python3-jsonpointer: upgrade 3.2.1 -> 3.4

 .../{elfutils_0.196.bb =3D> elfutils_0.197.bb}  |  4 +-
 ...s-uio.h-instead-of-linux-uio.h-for-s.patch | 74 -------------------
 ...001-config-eu.am-do-not-force-Werror.patch |  2 +-
 ...-check-data_list.data.d.d_buf-before.patch |  2 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...m-compile-test_nlist-with-standard-C.patch |  4 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      |  4 +-
 .../elfutils/files/ptest.patch                |  8 +-
 .../elfutils/files/srcfiles.patch             | 65 ----------------
 ...og4cplus_2.2.0.1.bb =3D> log4cplus_2.2.1.bb} |  2 +-
 ...er_3.2.1.bb =3D> python3-jsonpointer_3.4.bb} |  2 +-
 .../repo/{repo_2.68.1.bb =3D> repo_2.69.bb}     |  2 +-
 .../ethtool/avoid_parallel_tests.patch        |  6 +-
 .../{ethtool_7.1.bb =3D> ethtool_7.2.bb}        |  2 +-
 .../{libzip_1.12.bb =3D> libzip_1.12.1.bb}      |  2 +-
 ...unistring_1.4.2.bb =3D> libunistring_1.5.bb} |  4 +-
 18 files changed, 24 insertions(+), 165 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.196.bb =3D> elfutils_0.1=
97.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-backends-use-=
sys-uio.h-instead-of-linux-uio.h-for-s.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.2.0.1.bb =3D> log4cplu=
s_2.2.1.bb} (91%)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.2.1.bb =3D> pyt=
hon3-jsonpointer_3.4.bb} (87%)
 rename meta/recipes-devtools/repo/{repo_2.68.1.bb =3D> repo_2.69.bb} (94%)
 rename meta/recipes-extended/ethtool/{ethtool_7.1.bb =3D> ethtool_7.2.bb} =
(94%)
 rename meta/recipes-extended/libzip/{libzip_1.12.bb =3D> libzip_1.12.1.bb}=
 (93%)
 rename meta/recipes-support/libunistring/{libunistring_1.4.2.bb =3D> libun=
istring_1.5.bb} (87%)

