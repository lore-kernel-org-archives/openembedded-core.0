Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37396.1793171037963472767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wo7XzAXB;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0+NE1VSTNuFqDyJlGfzciV8iHzzN4WXVDE1TzyiVYwWHNyIvFWSKOknGX0zVxLuA4NlHl0s5Kt9o2eb5vJ1VMaWeYd/dS9r8FXHzmlc7rWmC2SM22K9Ks135MR7YNZGo/h7zi2Y0rf8TmPQf9CyQZ3k9CCeOWF50YTOXAJkeYnkSYscoHHUR4TjmGJJKW/xsbc4ZoxKGNaARYG65B9UTzDDs5b6+pL1IG1bncPZdPaxMTjUaKpvGj0LULw7AT77OBLigp6ck3A+z4/kzAJI5eq0kHc2Ef8mcA7DUwwvLVmZ9oihYTGzMLiNoYHvF7F8LS4qmFzPL/TME9eKzC3jUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+CsFLPhIUCLTtkoxVt3A0WB/l/Rm/WoAFES8cwJSdI=;
 b=zB0NQZOzatD8Fn+PbFO5G2OHHg6nZz+e8/shCt8+FVkBacHpKfJKF9Muly6I6Ij7fXuHLc1s6+WHSeD9L+Ck4INi9THbGG4qaFrr39kYvqko3QMrRwld8xDkuKO+X26g+RmyNh/Hj61jaSXyZ0QIxi8KPWCO7B3QRdExwNoi9ai+sDnOqPK07SOPj704VlShikAyYSNk7ljZn6t8kyBEZ6u0Y6MOW8IZBKfX5wziTvjE/wcFpaA28GrxaAWlhppq7TFcA5qqyhfrWkQ9d1BoZExkXlSmueBUESDFCbu7HADy2gvT3HjXj9WafzXAGMDgXoDz0KQRjZR0SorJlif7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+CsFLPhIUCLTtkoxVt3A0WB/l/Rm/WoAFES8cwJSdI=;
 b=wo7XzAXBqXUCfqVtFOMvdHpsaiB3OhI3/TPGSrlckAere4KpHZJgrujbcXV+gbYVY8YyvG+3D8BZ86acXHwuHyp1kBy+XFdUJvQ5tKL+QPO6NzlnfXdBHF/zFeL5QK3LSPaOIRmckETQhO+iu9howDYl3si/o3J6Hd9Q0BPo2NB3J73DmaVuwKv3Ssxc6F9CZdN2uYshvCgjsbczSX+KJd1BBs/tU5Ibj2uct8CSnHSs8W2YEbPgBqMtVQBx8JmUP1nTVG9CswYZaJWnsHcKKGANGmuPD3+gpTXG7vb7a0KYCYnNZpS1HDgsuXoQocq+f3mUqECTDEE2FHS+rXme9Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB3470.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:03:56 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:03:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] createrepo-c: upgrade 1.2.5 -> 1.2.6
Date: Wed, 28 Oct 2026 08:03:44 +0100
Message-ID: <20261028070350.13243-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0232.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::27) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: ef980a36-dad9-4d56-32ca-08df34c1a1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021133027099003|261021123027099003|261021135927099003|261021121427099003|261021130227099003|261022113327099003|261022115727099003|261022075727099003|10067099003|56012099006|261026135527099003|261026140227099003|6133799003|261026130827099003|18002099003|22082099003|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info: 9VWpNPw+VIUIU5w08kfuuKtedAPxG7SJ9ui2xcvUBJSoWXSKavt9PnX8hIKsaexIcC7athRe66XjWrumnaEzbByWpTL8oZO7/38SQ9HptElU1t7prO6UgOdjnwpr97BQajSSIErf0xpIX6T4HMOvM9UspzvNujEdCUqSRCqPxeEekzDvhiLfTti05PsIFS+BzO7vgIwJaMOfvB4MhZV+mvMqcq1OSeiq37DVDNtaXZCRdWcd8Uc8YCv9k4s0aLuJFnexAVt8dITqlOV5BYY/5r7OmVqa+9nEmR7u/p40uF09lm3tYxlbCBl5MnXLGukQLuyHs5et/tjN18h7/W32KZOgKQgYpBGSfb/JO9t3DQRPrFLwhj3G2BSDIRNWA8KRi/XfInL2MCrjlMXbV2Az1iYxV+hlevnsXveAZ9KOhX7+X+vDJAoMF3+r8GZy4l5Wnx/uLOX+H1z5Wl4+PBflK6t5LH5IbYHRk9UHTnxU3p74hdw9v/GB4aCeOK2r8qa/9I9lUw0NeqyuW8P/eYzk7jeXseBxTHPHLsOZwaV9yZHz+K+L+DnIC050PmaeSDyxRBS6dEqY2mF6PnGegF2+dRv1lz9AK8Wf7NQeDv/9Zek8zVgul5eLBiq5oD2Ge3hlf0h5y3q0gYh4o01QIr1WfIlKpd0NY5FiI8FPHkQnc4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021133027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261022113327099003)(261022115727099003)(261022075727099003)(10067099003)(56012099006)(261026135527099003)(261026140227099003)(6133799003)(261026130827099003)(18002099003)(22082099003)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zQMWKFWvm4nA9ZiN1+nEVEw2s8DoGLb2Y+ldCHW5UzEQRwCyVArG0iWRw0yW?=
 =?us-ascii?Q?K0CdYSBThpzQcLcwVkLOzmDuwBZ97uyRwv8LJiiykXKwxCRAz00rH0eTNycL?=
 =?us-ascii?Q?mkK2/z78Si7jEsrAo9vowiQnTBAHR7OyjOGzq3dXxWJQLsyqLKs+K72iJmcC?=
 =?us-ascii?Q?w54id1hdhOiRDNY44hWNJlNFWhb9kVu/6PAcANqdssYALLKfRZnKfg/47rNh?=
 =?us-ascii?Q?g58ejh+yAJyVVb039NGBXWlTRHW4et7L1m1WIY/NjbA+EN/Ow3pgj4hDgv20?=
 =?us-ascii?Q?klUG2yBPmWRsffp/LA7K/fAGok94ButkPGZQ+HLDkhl+OICbpmgx1gwBWVXa?=
 =?us-ascii?Q?d3JBduaFADoxPOVBYnA9+DTF02aT+7GBYWY4HzQd8Qi50OU1ipTfEq5IZ06O?=
 =?us-ascii?Q?jC4bu1kstl30sC4/WLSg3nJX93K/EgB1prKPtDHo9Z7l9dZIEQ76hR4TPB58?=
 =?us-ascii?Q?f4osy2XonElSrS6AfruHK34OMe6zm7zgnsTfygSoqrLZNoA9zgXS6uWs/Zd2?=
 =?us-ascii?Q?9o1liybwRr6VQJnwdotwwKsxQurhvMwrQtPoeK78bYkiXOGnLolatDqpl+OJ?=
 =?us-ascii?Q?CP1qLOFqAiJku7I8eNW4Xm78TUiRRWQhPnFU2n039To56P+pYleNv2HGx817?=
 =?us-ascii?Q?KKJQLDyKQyOWH+LhPcw9EyyIfekxF+yYzftf77gBAxFKet4ldiI7QkBLzp1b?=
 =?us-ascii?Q?Vr+qM61mQGkfihZbOKcJ2M3ZLtP0UBlyAxDQovSYWss4FjCLsiTJRlF6qY8B?=
 =?us-ascii?Q?F8Cyw/3Z3ijRnKzNVzV6XZsFlblnkHvQca5EIfCjIDSWX2AulL87mYYS0Ube?=
 =?us-ascii?Q?pt4qyO3ws7VtiyDFDsauQBywDql4ZwutgjErNy4uahClOSytHcsZHixsayz1?=
 =?us-ascii?Q?vqW9G5zd3Lspu1CIdQtWDGw7UwS5Rx/we60sQZvLZTlpq36Phz3w31RDH02e?=
 =?us-ascii?Q?E0LtAiU+ZIziKyEmN7kZwt+MUtotiES09PcwxGHrh7db8/4pgSump4JPJER1?=
 =?us-ascii?Q?XfO0R0/ojTf354yosQIXWRVNhFy8IUBpnRQGHCyy7OZCXRy6MU0Z55QDFSZL?=
 =?us-ascii?Q?M2wCL5xhZP74TyltDdWi473etatai+rjboJHDIE/f3vU/4RY+2s+4qqvpX+m?=
 =?us-ascii?Q?4p9MVT43LS+dzPxfNmtQS1ifxhT17JiSF7y7u1sVwyhbEmNkyHGMA03VJte4?=
 =?us-ascii?Q?XZfdhziKxxGP5/HbRy5Hvx/hcwSq0xKeqUbT4w1uLnAcLFjFJj7N4Yq3YEIT?=
 =?us-ascii?Q?Ysd681oJpl9t73uON/QFji5LOMSbAZeF6VIEIsVZUFC6YuCMStTgYMFt+dBJ?=
 =?us-ascii?Q?1/Cqg0fUxkhlNR62ojCNMHr+TKsoXvhFYp5mJIo9HTQO6bQ2fTVfzVewcvKJ?=
 =?us-ascii?Q?OE+nCvlcxUAqQ5MHKRDJaKxym/xdwST1lmmrGLu89oMOlg3qPn36unsEnFXc?=
 =?us-ascii?Q?LP2cIHLS+HJZ4yaLYCNeOPL9M4fzhf2fUHuy4Eo5iy4D6Pir1BQMNkP9LZKw?=
 =?us-ascii?Q?zHgiddu/oQxNQTnsWa/KsIvBE33LrtIJwfg2Vk5o+M7fOVEWMHqCGb/ti9eu?=
 =?us-ascii?Q?/SNHb4Hyy5Nhcuv6xjhOAOg4ez7TkdMzIJ7BJSquhyEEW3fMGcPCUTr7yB8m?=
 =?us-ascii?Q?V+mxzuwH6eepEYQRH8WWzFyL4xyOjefse7DalUgsUEuvWSmY5BgOdQghjfPl?=
 =?us-ascii?Q?9oBs7dGgKZZmrzUY74TLhy61fXIjssDiYseHfnc2FghEHGI0AQTvsVS1LOz+?=
 =?us-ascii?Q?/wckP/a4Eg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ef980a36-dad9-4d56-32ca-08df34c1a1c5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:03:55.8427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nglMIQEAwRND0THiuASZLUR6S72zpD4C71tzQN7XZEVQNEn+6QXQBl4tOfpRaRl7IWiwkaJbXiXCura3SSAZ5PTKbGfAcMl8odRFx3SWlDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248786
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/rpm-software-management/createrepo_c/compare=
/1.2.5...1.2.6

Release 1.2.6
spec: Stop building Python documentation
python tests: add missing shebang to run_unittests.sh.in
Make default compression method configurable at build time
doc: Omit modularity-related texts if built without modularity support
Test structured control character validation
Reject illegal characters in un-modifiable fields
1.x specific compatibility code for backporting errors
Strip control characters on package header parse
Fix archive size value for v6 packages
Update Python package build config on 1.x.x-maint

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 4 ++--
 .../{createrepo-c_1.2.5.bb =3D> createrepo-c_1.2.6.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.5.bb =3D> crea=
terepo-c_1.2.6.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-se=
t-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/create=
repo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.pa=
tch
index e2f90644c2..88eb22d253 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHO=
N_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHO=
N_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 71df5a5471081cf2338f9f046cdc51d064534297 Mon Sep 17 00:00:00 2001
+From 5684a44dd48f82e00c356383137f0aad9d796466 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -13,7 +13,7 @@ Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 05ac89f9f491f93367283974ea38b5e314f0c5b6..44e38b386abc1c8eb135721d89=
509c649fdc6297 100644
+index 05ac89f..44e38b3 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -48,7 +48,7 @@ IF (SKBUILD)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb b/met=
a/recipes-devtools/createrepo-c/createrepo-c_1.2.6.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.6.bb
index 7ffb7bce66..cb604c7884 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.6.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/creat=
erepo_c;branch=3D1.x.x-ma
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.pat=
ch \
            "
=20
-SRCREV =3D "6a48c5f599d30a20d15ea13b1dea82a86734d3d2"
+SRCREV =3D "7ab2c171f9aeab908f5fa19c3680deb4848e0649"
=20
 DEPENDS =3D "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 x=
z rpm"
 DEPENDS:append:class-native =3D " file-replacement-native"
