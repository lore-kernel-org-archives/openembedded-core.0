Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14003.1795777374160616251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AN7UxjwO;
 spf=pass (domain: est.tech, ip: 52.101.72.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIpnjXqxPHsgzHpIuctZtn6HNFoh7hppvIcypF8CHn0/FaC05p+AjcLowULZeNhoSgKFL7XCjYJocIlq290X6yjVPsaEQb1FdFDsCe1OidrI9PSgFf1uC4V2kniKc7Bt5d1MbQXEZ7UHIJF5Dya1raTpEO9pnDt/r6VdWu+GAwHw9YTCw2H9jVlG9VUFu8fUpTQ7vSbm1QsNdLH67vgv1cauhVs0R9QBH66JN0osFwuiA8esD2ynCVPFPEUdnHxHg+UzLO6o+x4ard2wjAZv5NKHfaBtbqVzlne7ESVmg99EuRFMy86419uF2MCU01GoZKCVNTbSwgePWlxn88XTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17uM0xG4kdnzOvrl+StY5WWloEkBS3ZGUEgdIBbdRWQ=;
 b=GlZ3q+Kn0HRHWJ9jMrHlizUq4i/8j81mutuXGxlG2V/OeC65cPdyuPFBM9c2dbar/oxOZeGtOBwGdzVXgGHQckpQ1umM6xfgyGdHM4niL3XSIz+FwvvNsWFiCI2H95ymKwRIjJkvvTrM88PS4KUqJtsjXoYpucxESmE9Wc84Zu3AkmN5cjF0JUFnmtLTXK1CREQrNVR3UWXS5MPpQN8btysesY3D7U0sF2oxfzgCWNZaGJLoASv0GDG66xT1d73WXI6gV7Tc3zvk1jFMwOZ4x5waU8iG/ahf4hEDnonAPJVtCX9yBWaQKcnWOu8J6DnBDDvz5FuzmUboBG2v7qX/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17uM0xG4kdnzOvrl+StY5WWloEkBS3ZGUEgdIBbdRWQ=;
 b=AN7UxjwOu+FgA3SZVWIHtJL6YSmahMlZuhrUwErQFeKzOhr6LtlB/9aqS5B6vEeCU4GNAciy2KaYEpEfshSRSvQkHOjZmrDRvtBHDC2fFFCh3cC/CFv1+Da/scHF1pxqBEbNOWwKdL+PtryN4gefTv1QFKkWedpd3ynxcpBVWc8ZBEqwkqyO6qw7FjtE//ELCnlUfohQra2zOVKKIMY8ShL5ZHRZmArr33SLvgU7lMMhcz4gm5567PqSMIdVgvSOp2ge3gmUyYezNdp74qrBH2C/VKyG2edQr2SBJrTBc1UNQrCQ+8JIYnWc2CYy2l3/J1vYxErqSdApw/zpcWfpUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2539.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:643::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:02:50 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 11:02:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] librepo: upgrade 1.22.0 -> 1.22.1
Date: Fri, 27 Nov 2026 12:02:45 +0100
Message-ID: <20261127110246.512-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261127110246.512-1-jaipaul.cheernam@est.tech>
References: <20261127110246.512-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0002.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fe8ada-21da-48b8-5250-08df4c75fa2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|6133799003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261022115727099003|261102123227099003|261028144727099003|261026130827099003|261026140227099003|261026121527099003|261026135527099003|261021121427099003|261021130227099003|261021135927099003|261021133027099003|261021123027099003|261022113327099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: bxPrIRZ1bRFtWrmsRTo7P364YObDwXyk3Yt7kM08yJWafwlPCQNXVcn74qAxCj33iN6stys/q3foTq4LrjUXy+/pKDKG8Erzz/GVFc5Qwerr0NHuc8S96LTxmzXhP87BHro3TTtY3gzRrWQNBw2CJ4V692SFDIHEUrUmCELU/c3dzfeI8EbzitLcJWXMmKXxFN6vrVdEuOGnxvH0ZDegyBgypTYtk380vX3DekuHrkpMVk12lBcQmFPLzq8/y21GY8CKcbe0Bf3vIqJbmdgX+x3HITwQFZvwbHA7vmaGvfajDKfLKUACNr0WqW3nWjUqKplkvozk0ez7LjBlFR0yQwQZFdMT8UOGszrQ2f8xH3SVm80IqOA4BypYTMCNPDdnfgcO9qNrGmKXCFTcomoxNQ8+dbR3C6gs2l7Re5fQHOotkfvqZRkVtPWZnVmVb5WPEaXlLbwMExLoN8nKgdL9Ap1qMD1OsmNl8wb3PDi1buf59h+Bw7IBxyNdGvQ2829A2qOb1ZtxzpD9s09Ky023nwNZ/x9Bcd2eNnqjE/tXheSEue7Nn8r/XMJpwUa5hDfK0j2QR/pju8aNFGXGNsg8yVxyU/HlB4DziCAoWBRSHlbw8bH3pH3IYAB6DDl9Bo4HsdKi7WxwwrSd6Y87MAuJXHqgGfyiCmT+Vw/qhTtjN3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261022115727099003)(261102123227099003)(261028144727099003)(261026130827099003)(261026140227099003)(261026121527099003)(261026135527099003)(261021121427099003)(261021130227099003)(261021135927099003)(261021133027099003)(261021123027099003)(261022113327099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JbTBGbDD0bpXVwpwlbf+/XboqmNxu5UMMCxLfRe5+ZfNuEAGNFLaD2bkfJdR?=
 =?us-ascii?Q?6QwqVg9kkA6bJ0A+1arqsMDsb/6zrJWjsZX2LAxgw/aJRtKztrUDgzWJyv33?=
 =?us-ascii?Q?hjcSDz2iIguZrygQ/+fbFx1zvhaOwEzOGKGOrFBQR2ExshrlvTvDR/kMX8lC?=
 =?us-ascii?Q?tGR4kRdzxPZsf5PYLSjINIbwLOpCt7WetzsuauiIOLndRVeoFiNOHSCz/AbP?=
 =?us-ascii?Q?GspPBgt0SNZBkJfwWnHn7gxOQ0pAnSdxHjJjdMdF2No4PmH3eSQPyQYxpEvc?=
 =?us-ascii?Q?WWbqBpfXQn/wOUvu343SnZrALT7lad2MUz8XkunMepkm3ne2jpZpMUSnT9gd?=
 =?us-ascii?Q?2NNRXvmac0stpx6kqUkpThZ7/W7d48JIlEwfBbujcrGhQHUI0XwftJoL2DJ0?=
 =?us-ascii?Q?kV/Mm7/1iYTkAgaBD9xxWeu6B4C+6A3neE1GkZB1qkun+ynDAv6gUFuFoehe?=
 =?us-ascii?Q?N1wDoliYFjFZwNU8pA2jVwrHgEVuUMmA/5GxkqaLEC7H+aubLs4RJJjKpHU6?=
 =?us-ascii?Q?3tSQGpqVwIrgIiqCQS1ALKKsrB0luy3pLamIng0WkPluYbJryJeqYZSc+A94?=
 =?us-ascii?Q?p6FWzfVByIps+JPFum6/4RfjDAq5ddbJQpAuTloBMo9dA+TldUXeb1HIgf4g?=
 =?us-ascii?Q?rtInnnQ86gTLgIcZKy4Yb6FhP5VrMMzdDjnxWdo6LNLxZ3ICSxlZHkRieZ8Z?=
 =?us-ascii?Q?Z3oc+jSPSppJmTZm8h5EaF/8NGIo+l0WL/vW8K2iDu5YwI3ZX0SlFGiFaHGI?=
 =?us-ascii?Q?WGIBTt/DBNDraFOp0MEiiJb5Uc9EsfJVtacP3yaCgRZlY9paaF8EvuMMrFMI?=
 =?us-ascii?Q?L/sCwMWbRdyFA/dLidgcdZM8HZq+iKLlwbU9HmDelnNQFwA7lU7dkzq1wFnq?=
 =?us-ascii?Q?3ZR1QqAP2O1QOBVPXVWgQ9LLg+Q++JhluUWxA1SqpcDBScnQzljz/rltC5yk?=
 =?us-ascii?Q?flV6BjdiK4EWLN8cs5xdxupdaCaTkzHvUO9tlaZ7+slgo+gy5CMYu/JxS+qu?=
 =?us-ascii?Q?6rbBYZ47gEAtRwcJDsLISPTKqqDPWK5WNnbiWFPeI6H3wYod9bK5UrNySomT?=
 =?us-ascii?Q?Bfc8+Rttul9SiXkXYH0hmCKTULafGEKqeKoJV82TMQPvWrB5a1l5WeTI7PlJ?=
 =?us-ascii?Q?UnZTdPMDcntlM2U/q7l8Y9bl/iBX1D1Cyx7srKCGh22B/JuNbsWqF1i93ink?=
 =?us-ascii?Q?7ZoMWeXy7C3npBLIRYYYi63xzHmRdWb5PycmjKDOjSsC1BB6tzxaU3Pb5uzU?=
 =?us-ascii?Q?oj2aDE76nSLxVzVdlKAnrTeMyDd4bjhVJwFdcb7KMw7e0dKbt/kDuCyf8x2A?=
 =?us-ascii?Q?ZmmjRxDnwK8/9kNFhwfW3DNG9Txuf0dNd4caVBtarS9vH9iWiECdAeinxqO0?=
 =?us-ascii?Q?PhR+2gDqDmb36/fdaV5KaI1uH+qzQWrJtS74T0YdlqDattUwqUvpczXA1rYY?=
 =?us-ascii?Q?kJlHfCm0903GuaugDLRkXDhpOJO0FlaqvJqCNwnWIO9yjdUaIDCgFQON8P2D?=
 =?us-ascii?Q?PpI/COkDBdAqqz2SfxPTrOWfss0TnRPHeazFYhd9pI7aa8pEFiYaTvcSSc9e?=
 =?us-ascii?Q?xA30UcEAi0x2DhvOuGuiIbXCnPssJtokdMWOUKHtAVZr8rMlcopTQxqLkglK?=
 =?us-ascii?Q?14xqDLDFriXtoQkQJR/ThJtxkyUU05T1Cfi0n3L/wpUDJFdkAl6qsnslycUL?=
 =?us-ascii?Q?oW73/mX/H8Lmypa2o4y2uMvOOVfgtvGLR+0HBOYxuAVxn+w76c4n/InXoB5w?=
 =?us-ascii?Q?VyWufeOl6w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fe8ada-21da-48b8-5250-08df4c75fa2b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:02:50.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrqfQmPEeFeA8w/mLbXOGSk5SUCrJxXV7i8qPZAWQ0YgU30cDS0yRCEABdmh0zE1al+misjiG/xmu8en+4jUaAC7nrY6lVx/SOvvYqCJRuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251373
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://github.com/rpm-software-management/librepo/releases/ta=
g/1.22.1

1.22.1      2026-11-24

Fixes:
- Make downloading a repository signature uncached, the same as we already
  download the repository metadata file. This should decrease a probability
  that the signature won't match the metadata file.
- Fix compiler warnings with libxml2-2.14.0.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.22.0.bb =3D> librepo_1.22.1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.22.0.bb =3D> librepo_1.22.=
1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtai=
n-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/lib=
repo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 2b6c1c85b4b..02c64ecb992 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From 66610d0a0c683ecdd2f39e3936f88624452590c1 Mon Sep 17 00:00:00 2001
+From 018909b0f28dca97edeaadde8a3a13ca786dd295 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python=
.
diff --git a/meta/recipes-devtools/librepo/librepo_1.22.0.bb b/meta/recipes=
-devtools/librepo/librepo_1.22.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.22.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.22.1.bb
index 2d9b1db16b6..8f392de0128 100644
--- a/meta/recipes-devtools/librepo/librepo_1.22.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.22.1.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/libre=
po.git;branch=3Dmaster;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-=
p.patch \
            "
=20
-SRCREV =3D "d665398754be6fe270d0a70c3db2ea5c3b917e68"
+SRCREV =3D "dc24c108114e660284ce9938104c5491502d8941"
=20
 DEPENDS =3D "curl glib-2.0 openssl attr gpgme libxml2"
=20
