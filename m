Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5983.1794231647701584293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=a83FxHz9;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcTOcRR3n3X+hH5i3dORumjFLLKz1B9y68V3c68t2RiPDtbGKfeUbNzO5H4fjVUPf9oX0lOndE5FewPjM1T9CgejvXksPsRTHuP6t/mjiCuedHjwsoC2minv3JeylM+gh4OeyQ6PXzC+VqKjl4hAdH+HRu4Dph2tkWVl+7u03Yh1ZE0sCIO4IQQHy8jRSSWfGJ1T9NcB+9bhgBkW1Wvt8K6oFxoo4JNzncV7vlpYu2b7NL4D7r8PJWGknTvdDzecvr2rWLWW0ZohnUWFF/Q99uIlI0idsPMeLHGVfPg0wuAhma5Roa7x2Nhid40ne310XRjEW0OchrJExYEk5tERcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlsdFhw/gtQRpDKHzHcGHUGRaXo+RrksCmbcmz1lbdE=;
 b=sPxon7UBlv/XYawUylQceBuY2rs7XHMlNc2xj7NqZDMMpmMZe5snIfJzpJO45jvHUSBFdEK24lkhTtQwwrLi4zyEVTOVg6fzYpp2VGU4C8DGcweTV4VharXNna/dVXJ/ee7QSKT95LOiy6kL8ZZKS3z8/0krrtEjPrJIvBsGVs3a6EWH2wW9Tnu3CxzNLMRHhsc7C/I7P0HpBvPZCXEI0+Xw4N68f1Cu7fXwTcmEzQJpAR8vjUVz0hz5X1kH42zNZrwoGUV95DusCK0j64408N63vlxNGpkOca8Y+RJ444akf3CpRXRfVMTBuZhy+gJT4dF7LgfnsBXNpMYDyjHCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlsdFhw/gtQRpDKHzHcGHUGRaXo+RrksCmbcmz1lbdE=;
 b=a83FxHz9rTteaqHBvZM28Je30W89KKz8o9hPmwTirFp6LKwMHUCoIlxCVM/oXxIfy1WqDn6sh5pjSN5ROY3nNKow6KudTsG3YeWrh0WqxrkDTV/kQZHfemXKHxTaQzBXqMX7gLblTrJUa3/DeTPRKBQNDVUH0THwrZHdY1GHUA9kO6VWZy0bTe8KeHRSkc+w0W2WphAk1uS4KSmNLk2WkCtAn+YmjbSxizHRqc1vNVbdXjSHhz0EcyHje0M1TzmdBPK12g4EZiKv3P7VgWL5u5HVgmYCcPQ88wTjmJw5XldSQ063WoFPj6ouKULEmsVXqUOm2HifXYDpgZlJhTjV1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/21] gstreamer1.0: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:19 +0100
Message-ID: <20261109134034.74458-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c995f6-5ba3-4a85-56b0-08df3e670f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AZE4yJdXvsIXjBbZ6ynl/slsI6DgojkIna71ifuXcSTjdUg7vzGlJ4RkUJgE2cVfAZOlDYJnPzZhnSB5GERvq7nOBFd+5U/2W1OjkzAjEXB+K6l6GCRcEnskF7b4cumFl3L4f9FzNFxp7BllxnP3E1PK6zTa6fbbIeoRNXIfmctNlxRl7VjKLuB43Asu5/lMKdy3cFyMJAMBg2nqfghHYdJRaPLATon4oGs1c445PgThQ9SiZ4u8Oqmp/UieUpP5J7Yr9lt99ybrqUz3q0FTwzoU4FaUjCNGAAYzg0vACFvxoDr5YtXHVKAAq49nVgiPaL4lKTQRBALyL5um1XinT/AtZzsjwHVBa4gfQpYYdPTcioVUaPuOQsl1+pc5XukFpaEzBAOxji9w01tUQUCUvtlAux52fhxF3rsY+gK8LrqjxTCIKuK5XlwxR9CyyXVP1IFWibf8IMA5/AolFNtxen00I4JFpwlKBss979ZIFlA3y2bop5nzN8w7+VThePKSY7zKZmNOxXLjmpI8sJ2gdGGjuwD6knFoWsgal9qbsUbUpceVDMwafVyZhXC12fmOHuIt3cpxuAj8ttzzWtHlOMFKR7VPtHAfbZR/ULVybLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/clOI3Pep4eShmZVwlED0R/lZcBhJ9hFcPv3K5udLgthrZww8qI8Ltix04XI?=
 =?us-ascii?Q?6YIl2PaJ58Ny9L6K+jAikgXN3bh3tFhPxNkd329btY+cEw1WVNFvjvir+QVx?=
 =?us-ascii?Q?IzfC4NIORhrG4VlsWoXFMumDctTuZPzXaDTCwYuZORCnkTwhtPXbQdyTFMQr?=
 =?us-ascii?Q?r1+8A8nv/8C8MUBl6H5acUznOuslRghGcxyfAIV180nGiVHhZ18PpA2N20KH?=
 =?us-ascii?Q?2tz0eWcdF/YQdF37A3R7s/H9NgJ0mVsWm5nh2u+X3EjfNbIdu3PmA2Qh3OAz?=
 =?us-ascii?Q?uTVVRV+x4MrnZTtaqjhU+EYXzgGajXMwpLoIO3DngvIsaMozY4Ssx1gaIAOe?=
 =?us-ascii?Q?NaJUOu1IHD8mqaIM/FT+E70zS1SAA7ChmBKvatDqWDLijmbKPMq6vOixRIdl?=
 =?us-ascii?Q?929PtOmA15He2kHm1+bh113vktjfseKuqoy+Cv5bdsk6fCsYIEqeVALm2DmS?=
 =?us-ascii?Q?iQynLYCsC+RWkVKnM3Qeoxgtaa8g+jOgbo08thBpBARBkoOxvq2qZpxBkqmE?=
 =?us-ascii?Q?OP1kMZ5QcqE2hGiqaYKUHkBP6+PMLZt8hT4E4DGvRYgjbzemcfQE31wi4cpr?=
 =?us-ascii?Q?c35Ky/51ttLdsN8XF4QWStqTuWA0OEATIfXW0Yh1qcVCO76tyTwQkOjwciMV?=
 =?us-ascii?Q?UrUtgB7d9ZluKKImZMh/nAo6QS9bydGfSfno04lRPbPSWekvfbIfE2Mt6k8L?=
 =?us-ascii?Q?cu7aZz5+Y9cfCkzwkjZyrK8JjUI0FOjxe0+ABJXzhZ8fQQIydR8qZg3yvaB2?=
 =?us-ascii?Q?WSS7lh7x/UoXEE2VRw7R+d/SryKDa64RgVcrAVQEOW8KTHQy7mwfUat5Z4Jc?=
 =?us-ascii?Q?3nKbKGGcdn5HKlh+aevwAx7X8eX3PGQVmqjZD+20jK3mJkPL8ln72fmVLdYt?=
 =?us-ascii?Q?KMi5083iO7y6L4CY2CJyKl0GQZsJbjVDe8pw+/c3ZjEbiazq78z46ynmP3jf?=
 =?us-ascii?Q?OI0Eik+4aB8Tgptx6urpfj4iCKBSgPyqC5W7+bNOtxBlSlEi2PsBRA+f+1Cj?=
 =?us-ascii?Q?4sx/z1dAFDeqEXvW/qn12wdncATDSsaEggk/n9y1HL3+LgQeNTLwLPeLV4zZ?=
 =?us-ascii?Q?uS/re27A0AYMV0CG7IqIcGZna0VFKvYq18v47k5nXO/krYT8ZVes1AfrUe/T?=
 =?us-ascii?Q?hAG+719rwvRYuy6W5ooOyvEH9XLFif81bN5H0MgNq8Gh6JAN3jl4oUupi58q?=
 =?us-ascii?Q?RI10h+BOy6L064VVo+8BcGp+PJjAH56sIWqQqIVfiV8rSY5buztS0MzeEyrZ?=
 =?us-ascii?Q?QwMOzhHU3d6JmOh9DzW4F73bFAzN1gCXQ3eorGF3nZ0wSs2+tGrVdDZBeggG?=
 =?us-ascii?Q?6O6fZhWD/3EbYA3LjUELqcVDXd7E/XCVhY/WPnD7d5miM7lkbn6m6FNdQEcm?=
 =?us-ascii?Q?Ct8yA6URhs2tNTUU9N9Kg+YLlzeBeg15LG9xL4ArZAAfmR+YVwc4NCc0l7rJ?=
 =?us-ascii?Q?L4LFQmz6+TTRWWtxK+FDiXmE5TaO/4t/E3g63LnYgdJzi8RDfNlXlEdA9K7k?=
 =?us-ascii?Q?Cr7IQOny5qyr7iyMW/Kzu2qLB9cQkB1Q15cQKy+ouPe4wINyTCEmQU7c2Yo0?=
 =?us-ascii?Q?2xFNoWWE7kI/HZ/mr0vqKQpSIrC2OCFoxAuZZwFDEMvESKJmytQiiccQuviW?=
 =?us-ascii?Q?DEz4vmVuGTIsVmbpr+u8idMy8Mq85Kjw4+65Df62sGMdCYa5AATPoSV580/2?=
 =?us-ascii?Q?S4x5yhQptg77tDftcztOiEpmv/V+baIhTX5dVylUcSnvga2CZ+/7wSoZA1T7?=
 =?us-ascii?Q?HAvMXO+QiA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c995f6-5ba3-4a85-56b0-08df3e670f06
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:46.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Pefqe9oPuGFE19wR5hAUwMOJraQyf+GHQtS7bSF8aYx0vfdhbRNqihF+IM2NJvpwQOPPYAkedMSA8zrXR+03MXcE8T/et/u6/SN4NKFl84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249811
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.8.bb =3D> gstreamer1.0_1.28.9.bb}        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.8.bb =3D> gstr=
eamer1.0_1.28.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index aa5db132375..211dcdc5057 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From a4d5aef324bc7e66d293cb500d077b18fdd7545c Mon Sep 17 00:00:00 2001
+From 3866886ce146491529ca290477c3edb9eab0add2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 7b555352c99..af5adbd7337 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 59403a0c5d2bbd3e00cdf4855f0a2d9761395e1e Mon Sep 17 00:00:00 2001
+From 633e0fdf280427c03df201df92d845e4046f4f9e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
=20
 diff --git a/meson.build b/meson.build
-index 4abaad7..b08d43e 100644
+index ab64da1..1edc3da 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -665,6 +665,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 246292332b9..600eeac108e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 9e728516ce60c128cb6666820e5449efc7bcfb64 Mon Sep 17 00:00:00 2001
+From 6dc17915211d1d30ec118de118582df4a1f72d90 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_test=
s.patch
index bb08b116f2c..0b2f6b2ca36 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 42225b4709aefdd3250be30d79b5646b2c0da926 Mon Sep 17 00:00:00 2001
+From b2427856fe10265ac71699020730306c1075ef0e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
index 01829ad7783..3a97ee009ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstrea=
mer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.=
patch \
            "
-SRC_URI[sha256sum] =3D "baa8e86985ad6417cc0ad6e7b79ff2884c6779c8b1c7a6240e=
7121822c86e524"
+SRC_URI[sha256sum] =3D "6dbf744f583131a34845cc641e803843766a9ba80ce00378a9=
043fd6d8d5fb38"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)} \
                    check \
