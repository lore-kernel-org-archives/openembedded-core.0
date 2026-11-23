Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52933.1795437271543899270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uMQnfKDu;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4Es9lkvNh03v9kd1ZzGvzlqVa1O58q2htilKXqnRvZhk6rkhlNbY4IoFlilL32q0cahr3tj78z4O8uxgn8X47pl4a22kfSyg0IdrrSC9zeMR3O20Dr8aJBI25Nd20oHE3XYkFH+GJnjrWWSB0V7ImTYnp7mZ8mBERZZ84eVnqZ5fmvyL1lDdk6Xg5f7/ORz+R5pfjkBm2oO5aswvoc8VDe34BDrRbWnLNmTz9MrQqg/6LA1nPIu5hkLH1rAngsrqO/pmVcnyNeOieaT2Gdfalea7hDbNfzfoDF0r6rmY1LzJd+QFSARF+4gc54T9/dBCnQr1S9zHm6UbpHEPaR8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFNOesnnl+HariBVbeT5niQ0EMW2M+DUp5/nCcqUbnk=;
 b=bjEgWc8oiLvQ2xHY7g2Tmwxv4J4X1hroN0KcwmCmrbRqk9DeBGVMEH5aW+GY/BCdo49v9lLlr2apPeszCSoaxBCStrOUsStwTxAdrNrUOFu9H4UM9LAQOAD0PHOUO3lL5F6o92SiYlUAgZLRIrXiYxb+0S6Moiq7wr2e3rIp4VidgF6OP61zG5OL+yDhJakVaC/nR05yNx54lkeSvjWxDBdYfinNuwaq32z4X58d/hvZO7Q9hiWjj2rCTJ2YJwcDWK1koZ6t7ZZZCgcKiSYWNbljX3ixMKBYrqfn0pl4L/VwqtAL/WTlJjhG7Z4X5hvytVrJaG0t9y5yZWdFoCt6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFNOesnnl+HariBVbeT5niQ0EMW2M+DUp5/nCcqUbnk=;
 b=uMQnfKDuaPFiLBRJgpFAaG+PmIronGFyRkMAPMXv7E5aKGgDygk1qY3DsGbrYS28P74PvShIRcxahoJdM7dtjlGg2ohBFSjwl0JQFXcvF67ih6ZWDyo1c5OK+VsfWQ8VLMeYtzvr9xYWvqJXABgvgg0RDdIbxohyRMb/VW/+/HpRHma3j/0gfWK2exWKcprLz/q2mPzcLjtxiDss0QphbRf7F/SV1HqZERA7y/MhNJegSqmx9IQT24RR+ORQegsF9wDpW7ZU9dkHCdFmI/RHZTaBLPsIRn73sbwTyVmB1LluLJvZUj63zXz8/xPRkR2o8yWst7ZJso4To2YKCR8vZw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1129.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:34:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:34:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm-sequoia: skip flaky policy::tests::signature ptest
Date: Mon, 23 Nov 2026 13:34:24 +0100
Message-ID: <20261123123424.61533-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0594.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::30) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1129:EE_
X-MS-Office365-Filtering-Correlation-Id: cc69c0f4-adf9-49a6-0019-08df495e1c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261022105027099003|261021121427099003|261009223027099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: GxpTZgMUsA0zEor5gLDK5oblFZ9DuUMx8uc4Mv9PB94DVuPP/xHIGjwWpgVPG6tbuzugX8y6788PPt+yfj2IwqRcBuL7Bdx5N1E5eci8GJ0HrYGLEC9HURR4KVqTV3S7DQBxCFfK9ZQLk+cxEDIVrD6aVNkzZCur3UJ6W+vOatzGKGw2m576GJtlgSEpTVH7dAog86/x44pJrEcSjGAJ6V6FFaU3QLeP5XomMl9ySjy3fIWLOsxOiUCKwIQYKRUVDPaY/jdQX8nEaUsdxS1oMSKp+/ibp7UL9V/sVXhFkjBCU4PZNLl4bOCO7Qpn12YTg7ZsGyfSAkURjoUddM5BTnQzipBqLRRpQQozrQS8jtExcW80559S15qr9edeZWnrkI+Ff2pnldgK2cKWWZ0K+NtM8ZDnjk3496Yh1MleKXOQVqSwZxa8/cs0evY7bjQrakW5dDDP9Ou6AGNts3WET6UvLNX7RwsL/YhBJsT6LaRc4/G/T1T3N+42YlTH+72cvdnD3dJAmKuuCbDP+DnDexYXIsF6OsjxtUKs94JEJEncB5RejRuU13I1VQPqla/9BM43ak4eFYmBUK0gGg6VoJ2V22TffAhfJOsn+27Gtwb4NQfZUoNSKCVQ63XBUyex6BIvRCT51qm84BmlbMvd20Ar6hJ6RxI5+w3K2Y4/aWw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261009223027099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Q8eLPL0ZfCNlxNyvG6qNlLnKlC+BSfqjtRqvYcnvX9M9EdlDT0da0Mq6TnV?=
 =?us-ascii?Q?dP5Ijkrr62W8huHiVqwiff1xa0vIi/Ck2vD2hAxVYEaB2Tl3rcBdNTKv9kvx?=
 =?us-ascii?Q?3VZLkjZ1dCEs4jaBOZ9GH6wtUhk8FesZqkIafvqpF/R1+tI71XKBAAA/Sbok?=
 =?us-ascii?Q?5YArVpUhQAYkvNN4gEB+DuNhWGO+rKk7JVzy0lU5gkkWjwLH/666w593lWya?=
 =?us-ascii?Q?8qImxcoW6obJfYGPHPJURQwbmKfUXMLFj4ywhO8E4kjIQquieIcYHxD5iYOv?=
 =?us-ascii?Q?7bDXEK081AXjZXtMz2TFCDdcxrk4OB0vJ+I76fD/mc1Tol71eAdm+HJw6ueB?=
 =?us-ascii?Q?adj7QHvEWDbJzeMxqx6Qm/20dqWKEFSla5repcf4DY/i+/L1oNFHm8e34NXa?=
 =?us-ascii?Q?xwAf1JOgsUhoCbnS3i2hoJL1QuTF4MfzpEUfXvXhx1XXocYYNtAyNYMecZC7?=
 =?us-ascii?Q?F66/CGiGuBcqB18uYuXYvyMYGsX/MvYXHHhMUHPH9DZRXbs+wBDzPM/wThhq?=
 =?us-ascii?Q?njHjL494lQu6NkDXWVN2mMshLia/AUFXGW47SZRrFPS30LMDTqAUpUVr5vPs?=
 =?us-ascii?Q?7sk8KUc840ZIYwlAtBtVi5399Oml8ICXAP5+R1O0tD85jBkFlJK36qoH0dy5?=
 =?us-ascii?Q?1uJVxmGeE9rzOofJ8zU/mQMamzuHIlJmckU9WEO3rp0RgmEdz1lauLxmed2J?=
 =?us-ascii?Q?veQJbA4H+ChP0/+moFbwdbGA+LfT4WjVkqMxVuBTUbm9RUoqukiLI4Drd52E?=
 =?us-ascii?Q?Ga2EWkOJTlUthBLJxQmNoJkEisJttlMIcU1pBZgvajWdjnK8gPDbycv/kQTE?=
 =?us-ascii?Q?eAE9v91dWVNDOeLsXwiXvKGqNGvbpmmp4vZNQ7l/2oL1TNqM7wvKyK1RjOSr?=
 =?us-ascii?Q?sB/DIhXfJX6KzN+kmFKGGwVTcMxnSk2UGGM/ALc7TbJLat1GPuGXwT/pZ8/e?=
 =?us-ascii?Q?XHs3vUUU+90KvIxBJkAh8favctowGxnfRFM8yYFlVEBHFAl6U9odNCPr9Tqu?=
 =?us-ascii?Q?3mmanV7Iqr0oB9F56xS67hl52fYd3D4qspG5Zda3pmW5xPgdVnLrWc5eaEco?=
 =?us-ascii?Q?dLOWFfUeTYRV5iGWre7jvukjGIm52z5iRFkA2dKU99Bvd1hk7FOhDx/SGuWL?=
 =?us-ascii?Q?fxWVHRan1hVK6gTfmuxsuR5tBEVwnfTbte8IpucZi36VN9Am5xJUpGdvhz9X?=
 =?us-ascii?Q?WdsbgjEEnXFloWnkAE5Jg1E2L3wccTd1+x/D+3AWOVa5NfVwFbqJWrfHbAj1?=
 =?us-ascii?Q?Gc3vzo4wKHOdU6V/iHbbyxyMQspLTJ3qTB3aeQWBhOzZcvsQiuz8QZ/QPCPF?=
 =?us-ascii?Q?IkcChOeOup4x+IqQ/RzEsu/cnzypZsltwHzs6rlDQsnrf3ZTr7yLCfu1j/MI?=
 =?us-ascii?Q?4ZSNSllgMuA0On8xKTjMlazLvqCUsYD/Hu8txgxDJiWcIunVhAO5ZpumcW/z?=
 =?us-ascii?Q?gF7963waWZtN7vctae4jU9JHII7hf+fkW3CJ60SI9D8oI+0GFsJBN1819F6r?=
 =?us-ascii?Q?2Leya9dhoG9EvZoISdKh/pyEJkpFQ6o3+zpGtIWJ1HtChhVyaTjawmtfD9p0?=
 =?us-ascii?Q?1iCGCvm0g9mQe0v2m+Fuv5ISvPYz5Z+zTa8CjuAHb12MNIU9vdekZbH3DmRi?=
 =?us-ascii?Q?EQbKrkhpTwhE6ZfkkfEcNv2WglG6Eg3XnrkKQjBQyF5oxk/bpb+zHTIpT1YH?=
 =?us-ascii?Q?uov6C9g0UuxF6xd7HE2Q6rj48fSPvq1pAZcIc+hxrNJPYhRwt/HbpUqNypXg?=
 =?us-ascii?Q?3yz/PX7/Pg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cc69c0f4-adf9-49a6-0019-08df495e1c86
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:34:26.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGGZfgz8bNQckHM0DlpLeIdrqj9FHmW9TrL/8c5xB+DYs4QBy5BjnMzw2EhyaVCR/zOdzolSyCdu8KuDlFHklT8wWRIV4SyBFR8ieLw6QPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250910
Content-Type: text/plain; charset="utf-8"

policy::tests::signature fails randomly and reported
upstream as rpm-sequoia issue #119. [1] and updated Yocto test logs

[1] https://github.com/rpm-software-management/rpm-sequoia/issues/119

ptest logs after skip:
  ## starting to run rust tests ##

  running 1 test
  test symbols ... ok

  test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered ou=
t; finished in 0.01s

  PASS: /usr/lib/rpm-sequoia/ptest/symbols-478593ba8da2eb3f

  running 2 tests
  test tests::merge_certs_mismatch ... ok
  test tests::merge_certs ... ok

  test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 1 filtered ou=
t; finished in 0.01s

[YOCTO #16532]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb b/meta=
/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
index a91a952f261..f63a5a04027 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
@@ -23,6 +23,10 @@ SRCREV =3D "8e0b76e1e75c83d7d8e6f38976b0c83b52ebe7ee"
=20
 require ${BPN}-crates.inc
=20
+# policy::tests::signature is flaky in 1.10.3
+# https://github.com/rpm-software-management/rpm-sequoia/issues/119
+RUST_TEST_ARGS =3D "--skip policy::tests::signature"
+
 CARGO_BUILD_FLAGS +=3D "--no-default-features --features crypto-openssl"
 CARGO_INSTALL_LIBRARIES =3D "1"
=20
