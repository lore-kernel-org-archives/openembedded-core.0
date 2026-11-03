Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=e/nyNbW/;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfvgJj/htTM0iUnjNcZ9Ss+r5hFoGZiRDukk3JG/fQmxbNg7p/MMuz93ALhcNZvH2Yv0nVpG6/dDtvoX8a4XxBS1F9sTd/q85/AlNyq4RNep1pPDPr0d8I/g0OceI7MHUMQ4qSXrjAMy7QoJ+FrpilGEedejrR9iAoW7307lmTpK3g5FuxTZCGKLKF+R0ull8Itkqjqpl/TbKo7CUGPqAYihJMxUbolMm7TYuCJ77ui6gYSdrKFZJmbtTe27PF6B5EMV59zUfd+hHKh4p4HTHBFF/biiDg9LJAmV8e3SvwCkIwWiieMjWafcdcZcZn3uYVC2uzojfAhHpnE/BC+Y/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYel8uVrkpax1Q7543hOFF2a1cifWF8lQi7KicLrlQs=;
 b=ghBgfPRi3wI4XebzFKVBDh89sUjQK2gWB3mCEBYD3f1Qo5vKABdT2q2Cfp+ndwIL9GkCQCI9ICSkfjnX0cp1e4XzE893FkNt4sv3FOdo9kmrwym/RahFfBjyXaOjXNBEbCsDsem2CaNUEhqQtPtMTpDu8H6iv7pcD4myIB4c7O0dyKLXTiZ9w92hu8QcGn+Zvrwr3pjJEgWxb/h1J37lEp0GiIxMMV+JhmOiI7/jcTURBg0aKd3uqgaPl01ljB3x6jfF0VRQgSFJMSVqWzPUVXFfsMZgapYS+zyVodZte3tikzuR5IUet0I1d8L8UQIipU3umivYXesENkFc9kieYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYel8uVrkpax1Q7543hOFF2a1cifWF8lQi7KicLrlQs=;
 b=e/nyNbW/SodrlLnVmsihvQg0f+w7XjdCca25EMS9ZPHbbN7JXKQDd/+M2zCOJJy/S3wsmAe9NHedfVINLr+abaLP/bwm/Uor/w+mrpbH48TkxWm2IQRoQl8fav0JlUhwAe3js4o2guZDiuQS6mBOK30AyByQzmyGPBdliGjtURsCPC6D0FFsC2n1F+7Jk366PR21DIKF47sde5o5yWbFFg4j6kG0RP3bFe6+AZOgxoZBA/8HY4g/dqk3hJUsZzKQYY7PzTnsw/YQRv9Y37X2xYqi3X/tyaKHAQ82BB98ohD/EvWiroZC8bEeBTwi0wZwLl6CIKETqKYTM42PX8Zo0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] librepo: upgrade 1.21.3 -> 1.22.0
Date: Tue,  3 Nov 2026 10:27:50 +0100
Message-ID: <20261103092800.39286-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: b68157cc-3016-4695-dfb6-08df398cc3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: xI+QC8HWLInTafGdvYmFG5g2o4kFDE2qccssdZFodR0Q3QFmdn6sPu0JsGK74c2u2FDLfcwLh4Hm2kmLLl4Phv5lPRPMxb2tGaBZvOvyAQBz8d2au6iCdbwKVM6O4vBnCUtizkkvQ3eK2y3EkroSBAFwrXLKHVyyVRUDc274akR4GdD7+DnK00C9hpbtEv3D4NL4isa1WP2I3vcPlTjwKqbewyHSfXpo6AEcTslasMrCgRZaHV3WJxerVBdPpy01aa2Y4K29uYZDVL488TdBsTfE2ibudoZZgaGaAtv7TFxoCqvd15v6UjW8bBtkavCljICvblyjbWGZFKseAZuIR7avprsascSbGERbaaC93Pv95QsDLy4tO2V/pDBHNNzW7JMiP2t1C3Ug3cmdUZ3NMFGwGOlJEDqELc/PQJmrkEcqAUV/euuR6LbKWqtiIa5y5YSAvY3KbiBLbGZdKOfVGXNJKcGseslGCkvZayzWAcwpizFxuPTZ1cVPLPs+VLJMOclPEpBRfrIPlwavt4dCcFhw1zt6ziv1XNmU7OzPiFRzc5VZPkA6wpbG6gTbWs41PwOykQOz6e90IskyxOH2NQE3C0MAlpk7a5nDJEjZQ68k7cGk+KQJbqUERKAtUY8oSPcPtXF7Dldv+12KyFQxMBaMoYH3/Iz0nQUzgUgYtL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GDVgQDs4JlMFiNzrRcNreD0eGFugNXzEm3M3wxF8HGLPp1wPNL5gW0Fcd988?=
 =?us-ascii?Q?5nY6Lr5WH+mKPPpqNDabexKGE1uAAO466ZTWYfh3WZw3IMMgYKJ+Tfwthyz7?=
 =?us-ascii?Q?ZcISFvLAiBdwaOiNJmb8z3o6HQ0WQX/ImFEW8PRcelFrWwQ9S6tHGbdavus9?=
 =?us-ascii?Q?Fftx/uknYL/lEzmlsi4LfJqF3ubsu2eqdfojMecI33kE71jwgiOODQlWItnh?=
 =?us-ascii?Q?T5rvxB2Lt/n+WqbV/Znki2jjt1rfZ/cXKGv9KfjDHJ8AkM785Nth1fZnUf7e?=
 =?us-ascii?Q?NO5i4zY0VJfOeTkpQ4nSsdCGRBejtRwB8ReckDhprpAmPZnhkNhKZO8PHULZ?=
 =?us-ascii?Q?v7PmW3j3vn3qSoHVE4DDFdCXsHszV7XEm91AKScURCGk4OQn0/Y787SKynhw?=
 =?us-ascii?Q?MbQels3OnW7jgcqqI304S0RJxx9n+o19G3loiHQNLRYs5hjS4+O0TG8PosJJ?=
 =?us-ascii?Q?kJlbExCBDWqLi+IR5BsMtvS9WIQRNanx3NWafd3skRRMkO6ta7ZFAYhGP8mX?=
 =?us-ascii?Q?r4u0p9MmEdfLvF009/jPgGWanH2bmuA0Cf8pG8amZzZX7jKHlYiVb9lORvup?=
 =?us-ascii?Q?RN6T0RtfomwcEM6xYj3gBgDAHjI9jdwmRNaxhP//BdO6YKGFzPftvnpbGJh9?=
 =?us-ascii?Q?5YFf+okbS069LxdAdK+elTj3wu1rwExdGMmTaI2Kx9UNiV0JLQo5KYCpBPZH?=
 =?us-ascii?Q?Q2NSxPv7+ZPyZd7rk+DsTwzoMo3Wa49VC/HhUlw0HQ7TJKySMW+t7LA/pdR+?=
 =?us-ascii?Q?iIt/UFAdJyQUOCe0ghz3SOTUzQZkvV/8Dezgc3Q6JnoRFlzSm0NmEHRRGmkN?=
 =?us-ascii?Q?FNz45xnsXAdcR4ixgHrep9jOYSKlwa4eYAS43au3k59+PwsVmSEEQf6BKlf+?=
 =?us-ascii?Q?kXVHIAbVoqxV8InxkoNWpHRJ+QSN8QCTGRUQaNG9Uo1ZPIzXOS/rFU1kQQJ1?=
 =?us-ascii?Q?Ssd5dzP9dkO3iqQmVL4kWNmEJLcvBgpYgQxlUDVrovy6VgzzUfOI33Do3WdL?=
 =?us-ascii?Q?f7NJ+xcGsEOVXyc5BcFychqKPopL1aBxjl4B1eNczy2f7p4xRteQZs2HSa7T?=
 =?us-ascii?Q?VZM+fhge2q4X1I7VJEj6O50dRNEM0n76xC8ZFxkRWcKgRgmUaXaYSZDOCeVF?=
 =?us-ascii?Q?kTirqJvlp8mokkogG+wNRHrv/XT8+7YQA3+W/ALlr2NJAYOUBujHoQJ9hKCX?=
 =?us-ascii?Q?E9rmw5f1uHGYATDSPa2YvXH5hPQiWCKR8CzdDmv9eGWC5GgFp0P/tvsqrIc0?=
 =?us-ascii?Q?HlZ6ekfq50iAWIKZTLCaPnCeVQt53bXdhbYIrri9/ddtw2kdIw2pOVrBD79m?=
 =?us-ascii?Q?VC2kKlGpY+wHRWnBVhW8Y64LuyxoInhBt5h+r+/WCkM77cUPawyucf9WE8O2?=
 =?us-ascii?Q?Lw+BANirwsXrnIe6vI903naPOSNOI1JdIPtwxGIzMvYROqOqmG48ytKwPS/H?=
 =?us-ascii?Q?Me9UDOKJ9hyBFxXpAKvwtCjhIol3cMDpj2F4qz3CIwlyu7vYlbhq/ggzJJJX?=
 =?us-ascii?Q?J6cG3+9rvOXWleizOYo5LxuarpCfYiQjWOmQpgc3H7refxvXxwaTK62KD9PO?=
 =?us-ascii?Q?/pbbxi0ChT/ftZdDdq0Miw0CDuIZ5FNjtmTnDwYD2G+88+z3OlZ0LVuX57cW?=
 =?us-ascii?Q?tA4PCoT1eDGGIg5qs4JNOwM30kFzq68nH+RCxJIec6xO6Bb1rSKfd7ngmcoC?=
 =?us-ascii?Q?ciG4o6cUBph4AKFe0VfJDaX11aFELEFnj7eAlS2roV+TIDxrHR4XTCPSNBDD?=
 =?us-ascii?Q?nbPa2Jro5Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b68157cc-3016-4695-dfb6-08df398cc3ad
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:05.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPofcycRWIAdOej42Qzv/Xx1LZKKlwmPSrocjbT4YBfuszmGCZB9Wb599HA65FlD2825y2aTUb7rjkGOWV76slZ3ljEcepHbPCWM1Tt9gec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249258
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/rpm-software-management/librepo/releases/tag/1.=
22.0

What's Changed

  Add LR_PACKAGEDOWNLOAD_TRANSIENT to skip persisting checksum cache by @st=
ewartsmith in #412
  python: Fix reference leaks of list items by @prownd in #408
  Update FSF addresses by @evan-goode in #417
  python tests: add missing shebang to run_unittests.sh.in by @fundawang in=
 #418
  yum: Fix memory leaks in lr_yum_download_repos() and lr_yum_download_repo=
() by @prownd in #402
  Add support for excluding domains and locations in metalink parsing by @b=
c-lee in #357
  spec: Remove unsed build dependency on python3-sphinx by @ppisar in #419

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.21.3.bb =3D> librepo_1.22.0.bb}            | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.3.bb =3D> librepo_1.22.=
0.bb} (100%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtai=
n-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/lib=
repo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index c7d23732ab..2b6c1c85b4 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From a6282ddaf4a7143866ef500db3bb334b599fa300 Mon Sep 17 00:00:00 2001
+From 66610d0a0c683ecdd2f39e3936f88624452590c1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python=
.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.3.bb b/meta/recipes=
-devtools/librepo/librepo_1.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/librepo/librepo_1.21.3.bb
rename to meta/recipes-devtools/librepo/librepo_1.22.0.bb
