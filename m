Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7214.1793698089554979957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qHsz4cqK;
 spf=pass (domain: est.tech, ip: 52.101.83.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFgqEwbsEVS8+gFrWklUU27ltL/15zr7csGzswCoMUa2LzTidTRSecYraT1REuD/Ou3Wmm7uRFDJ/vrbP6sDfC/ZRj5lRv0+P5J/2SQmTIFgOATlTX/zQDHzkRmhczzlkMvqrV0BXzA61ot0VMXjpuuCO6sjJnJHFiBGx5dCv4JE9BwHqTGHo4qhXstfwubIzGJPkwvN+v9amJSaV6WwN3gTjIpO3/eYlcYTXkw5Jty/kwmsxOE6SAkpifzy8ZdtqRqkvhbYeWqP9I/XaBFeELe2q7nTBEGeX8bNMQg/+BJmHNS9pVNNYDvVRwKAPqieK9RtyYzzqMewZqKptnQkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUO+IZf+tGTb9bu04C941YIugck26+S3vlnt1p41djg=;
 b=PsNAQ4L+VUrcf2TqPrJQh4mwTMvaXMStjSQFG2+8A1VzAPsh0zluejf9xI92QBwZoVah7W8Bw9dK37/1KAZ5GPU+j6RV4tw7qNxAnut3EduMU/XkTW74nAdBbq9QNL16CLATgy6A2ibG0LNi03PoPVWflLgnuxDOBbOw1PODUBkRYyW7zvcOHtqWMkt7rxNGazVKe3TwfUysIgYf0XG8vJIFo4AZcYPzJW3LS8MwAl/g3+JX77PIVuDNj18Wi7ShqHFZ/K0TmKElpiCA38dt+OHadVM6xDoQolylYJNPFpeAfXoD4KRvv7Uydj9aLRqQyYwbpZPWRQ+8LxlxrqxaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUO+IZf+tGTb9bu04C941YIugck26+S3vlnt1p41djg=;
 b=qHsz4cqKfr41qufO318ghbUHsLNDnjkE+Dyd/Psm1T2dcDdbkjTSNsXu6y+KPqs2aQsVSaFZrYKMgwljN4attoh8qiBGwryQc6Lw7Nsvh1ycm8JuYfjxZqY4HM57ehuwcEe2KhNB7L/LhoKPpme41hu9AhNuV689byhV+urTrJN2EMv5XAlA3cd1VhFpkRogxT+1eVWvcuXVVgJCyIsjBgp45WNCQ1twIrwb/opv7tUbnxo0/AoPGJzSqEWEfQBY1VZnCcgffahopuYGqf6juLYGtY9G2uRmhtmpXDmtO2HrGIM3BL+6mhn8wjvZl29dxQpbdJG2E99Gm+KB6v1y6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:02 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/12] Upgrades on 3rd Nov
Date: Tue,  3 Nov 2026 10:27:48 +0100
Message-ID: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 27bca961-7115-4c60-42b6-08df398cc1d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026140227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: DKCn8orxBt1TUNZQVIuRdR6hkgzPqwDaBGm0GKhrZ2hfm1N2Bn+ZGxW7Rzk9ipdwTLwidE6BP6nlKoANVWP3M0DUr+H+gR52UtDNKVRJN4xtJtPLCsy//1GVlx8TvfqikIv5TX3rk5w8OxcTELCNweHbTSjGaIOnfzB8unpWy6XF6LeoRuq6uPFdP2L4B64iJzvrMDKqXeagfhRPioXpQYvkYc83CYTncaYKVsnrUrV0nLgTclNWYHWMRYGs/BoPU6ufnTjw+j0nGsAxZk///rvZW93nqKfvSHK+Ouq+SYhaCetP6Mrvs6S2GIwTwFfewyuOTpYwrh/0W2JyzOVhHvo7SK7IQusHzyWQOHKFViktkXfNKHm0Ix0uvTezqALQdP6c/nAhSaLTnYxAkxYIKX2crPFMl+JmVphj6iZj5f9ZGEmxHnmnqSBh2OrI9TvynNC4nrGM60p5/+Y/Iws3/jPj2vBdw6hRKYPHFz0pZMmA0JFWg45F9LnSBt2zf7vnQlAnoeK9EQlbrSkebpf0V3QR7HHarDXxqPOS4BMUgEG74l2IndB1T6mx+/VZe+qyi02+iOP7O9g83t0NW323uH7I78I5IcnR5X6wzEIWqngQdtXjXbhnEM0dSv/z/PX+ZS2wIME/aTZNEhFaLKLjkSrUd9DOHF1KBeLLGveVIdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8R4I/tKQbm5aRekLhyGQihwnPdvIaDv94twuwjt6e9+CRqxfF0wH3IJgtkAX?=
 =?us-ascii?Q?z1AUNdN8wtxMNcoaPMfs26UbBCRLp3kqnzrCxhoxmgYxHdfvlYf+Zqy6A6GK?=
 =?us-ascii?Q?66NxzjCRH1/zr8fm4T2/xcrbqXrQADhJtJflT/EiajxQgcyKtnF+FVZeiLHp?=
 =?us-ascii?Q?z2GEWzngYk7Lye+51JGTEOO7l4565LvWpB9ifliRMxyKG6BvoWVOP5vfXt6w?=
 =?us-ascii?Q?zUMt2Kz4Dg57ycewItfp+XzfMFix4bWiVb5zE4BW2MwExD/M2KUSrPtSko7m?=
 =?us-ascii?Q?uD+Dm+YsVSWp2Cxq/8ZVg3KJ5mREGEH5dVzgM2vhHzCA79csL/4eepr9Y2B8?=
 =?us-ascii?Q?qjwXdubH6Z5IbkNaZHAdKDNP6xyZ+l3Ay+eFnta3l2Yq2TxQr3bN7KrvVtU0?=
 =?us-ascii?Q?CGjlQ7cc0YzaqOyaz1ARGTi2UfNAuPGnbjMzcBmcNkEOLQ4+ASvwSqJIK0Mg?=
 =?us-ascii?Q?RTWMUGDdeVg/5Y5dCrTuhJ2VB1EEY9YyrpjT+ghTtJa0Nm36n85ElNNe/x68?=
 =?us-ascii?Q?MVZ4fZfX+Rmsh/8smdBqxsdQtYAnMkj4nI+UGnfNwcTmg2pk6yHqY/JOltgU?=
 =?us-ascii?Q?gB9Ei7CYfjQ155UKo4T4oDcf2ivmI7MQ0VyrCRSt8t5wbbk/AVhmfSd9vILC?=
 =?us-ascii?Q?8cwRMYX6cBbm/14A5Mazwpjm6gp5+XSYrGUDCr4MAMKwYwgWGk+oo1Dpxrws?=
 =?us-ascii?Q?0XCSmIgKDWPsxAfv+50zPenaF2X2tEmP9cVtrVn5pDwERNyYG9y18tPOwEfB?=
 =?us-ascii?Q?nGFvNZhtUhpDAJfnuAEogLFiHIG57q3KgM8ej7zqQDnmVZuKyFkI5C6jmvrX?=
 =?us-ascii?Q?esXiqUw7LTHOPwnnhYNekovPgLLBTwAb7aNA5NVUdNIEJHbk2g8+1vqcMl7L?=
 =?us-ascii?Q?+nvx/iMYyc1bEPZjFzYrmfG3wKiiHYu1lOpHldBQ1Eqelw41kzFKjYH6NBgC?=
 =?us-ascii?Q?PuVEbzmA++BRltVRb707tqkjLuBQ8wC/hWzBm5paJgFFqHmLMYsIW5k3b1qP?=
 =?us-ascii?Q?jz93fvM3mj6wtrbGkX923w71JDtNH2BCBHYDRShmoo64+Mmu6vZWgk+plM+u?=
 =?us-ascii?Q?x9mYUd3pSRmnMNGBUW1V/5XSonzURO5h2wlVMjC7pntLbBAelizy4Wzl17Ti?=
 =?us-ascii?Q?AVs5UibrYjh/fINNjIO6vqGnDeGKhdznQnmMTOEbjc1qY5xGfcgH1KtRSo+V?=
 =?us-ascii?Q?tcBacsVMfVyJPO1BknirAB7hV5cXkA+EcN6vUhO9rm3Q+y+qf4mirGwW1GJZ?=
 =?us-ascii?Q?rEbAD3djG1DJ2o/M/aBpQIzi8Q5L6ZgcaAVg5mx/Uev+vk5OlQRBUCCBE7zZ?=
 =?us-ascii?Q?LhoaUMAsgZ3WGKfuD1rIn79uVC4txc1hFr4EVdYCu4bTkeuFf8Yzn09KidE2?=
 =?us-ascii?Q?40EBBFeZjr0hkyjlKqsn5pmFriUVtRDRiamAsrnkS5nRCPTAIX+CO/EVSu3R?=
 =?us-ascii?Q?romdy12Wgt0d96wUYK01wdwgh4SN3gzdU9KnnGsgyk3K8fMJ0mKf/JFAB/zb?=
 =?us-ascii?Q?1uREj9k2drMGOQDRhEyzT4kh/13aR9HPtutRqFr9P8QLM4XGvWdSpaamIAFe?=
 =?us-ascii?Q?+q0jjaPihsp2EYhOoz5jsO/b+QucOqpyFgjIUnI624eObf6Hc4rwuJ9VOHMt?=
 =?us-ascii?Q?l7XXMgwJF4Jx7fzxVIB6B956xTrkqoU6zqKSYk09uxohoigLFCYEuUZT7KQO?=
 =?us-ascii?Q?meJqKsRBSGoCOlE1yl9gYDtr6dwxbwbn/aypXT6dVgUiFXzXumm8VoA7Owwt?=
 =?us-ascii?Q?WsOOf2D+EQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bca961-7115-4c60-42b6-08df398cc1d8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:02.1559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcJtOUy0IeITQUOQ07CyCHhycLTlsln3BkuEkdh0s5n8WRNCvLEW68hR1zqJ7GZmY9jw8hREbA1LVHZ3Y2mjklcf96aJhKc+kihYO8wOXCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249253

Jaipaul Cheernam (12):
  expat: upgrade 2.9.0 -> 2.10.0
  librepo: upgrade 1.21.3 -> 1.22.0
  nghttp2: upgrade 1.70.0 -> 1.71.0
  apr-util: upgrade 1.6.5 -> 1.6.6
  python3-jsonpointer: upgrade 3.5 -> 3.8
  python3-markupsafe: upgrade 3.0.3 -> 3.0.4
  python3-uv-build: upgrade 0.13.5 -> 0.13.7
  python3-pip: upgrade 26.2.2 -> 26.3
  mesa-demos: upgrade to latest revision
  hwdata: upgrade 0.411 -> 0.412
  hwdata: upgrade 0.412 -> 0.413
  gtk4: upgrade 4.24.0 -> 4.24.1

 .../expat/{expat_2.9.0.bb =3D> expat_2.10.0.bb} |  2 +-
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch |  2 +-
 .../{librepo_1.21.3.bb =3D> librepo_1.22.0.bb}  |  0
 ...nter_3.5.bb =3D> python3-jsonpointer_3.8.bb} |  2 +-
 ...e_3.0.3.bb =3D> python3-markupsafe_3.0.4.bb} |  2 +-
 .../python3-pip/no_shebang_mangling.patch     |  6 +--
 ...hon3-pip_26.2.2.bb =3D> python3-pip_26.3.bb} |  2 +-
 .../python/python3-uv-build-crates.inc        | 42 ++++++++++---------
 ...d_0.13.5.bb =3D> python3-uv-build_0.13.7.bb} |  2 +-
 .../gtk+/{gtk4_4.24.0.bb =3D> gtk4_4.24.1.bb}   |  2 +-
 .../recipes-graphics/mesa/mesa-demos_9.0.0.bb |  2 +-
 .../apr/apr-util/configfix.patch              | 16 +++++--
 .../{apr-util_1.6.5.bb =3D> apr-util_1.6.6.bb}  |  2 +-
 .../{hwdata_0.411.bb =3D> hwdata_0.413.bb}      |  2 +-
 .../{nghttp2_1.70.0.bb =3D> nghttp2_1.71.0.bb}  |  2 +-
 15 files changed, 48 insertions(+), 38 deletions(-)
 rename meta/recipes-core/expat/{expat_2.9.0.bb =3D> expat_2.10.0.bb} (92%)
 rename meta/recipes-devtools/librepo/{librepo_1.21.3.bb =3D> librepo_1.22.=
0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.5.bb =3D> pytho=
n3-jsonpointer_3.8.bb} (87%)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.3.bb =3D> pyth=
on3-markupsafe_3.0.4.bb} (81%)
 rename meta/recipes-devtools/python/{python3-pip_26.2.2.bb =3D> python3-pi=
p_26.3.bb} (97%)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.5.bb =3D> pytho=
n3-uv-build_0.13.7.bb} (92%)
 rename meta/recipes-gnome/gtk+/{gtk4_4.24.0.bb =3D> gtk4_4.24.1.bb} (98%)
 rename meta/recipes-support/apr/{apr-util_1.6.5.bb =3D> apr-util_1.6.6.bb}=
 (97%)
 rename meta/recipes-support/hwdata/{hwdata_0.411.bb =3D> hwdata_0.413.bb} =
(93%)
 rename meta/recipes-support/nghttp2/{nghttp2_1.70.0.bb =3D> nghttp2_1.71.0=
.bb} (84%)

