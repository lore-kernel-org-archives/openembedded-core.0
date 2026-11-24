Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24294.1795540699948741764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=IBdza/vE;
 spf=pass (domain: est.tech, ip: 40.107.162.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTDytkqqC4aOHFQoj1k9duEaHQQmTLmPZjezlUbuIad0j3w/Yec3L6xDfBwThgzGpY+9uZmAs4CuwL01rSg8ikoKheDnsj5Q9F3pYrF80BbPte3wusZJpITU7B17SAsWYEnaOHK40dh7VENRdfG2ljFaP83M73CbZSRRL5SUVClZRzdcCK/hVnuTcHmRTuZf0efIYZxhRiRkMgjK0lA566t4c4hyVt9xbOw6lGPVSfDDRQv98anAOe+6kNrGfS1l+u1drxgtGifPLhIVcNTUDphoVVBP4e1QUALTAg90oOxlEiQjhR+yGO4w0lUp0kOM7n+zKBa+HA6Nz3iShPE2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHP32NGiihY2DbrBBP3dGVzDRS6IAPq1g6I2w9q6lBo=;
 b=hr42A3HRNIlRIWc9R5x8lvVo3hvtGQbtDavYoQewvDhQrrK5mbZEqjCt3OXuzmYsK4ufyzDMXdPIr5NsNtGGyBwMh5yBmBDz0q0mQWvIEWVy3kgEnkqXS6NblKajuJKvnDv+RmfhY49/xWzcX7xIT1bENh3Eq15Ye4lv+5tD7SqKGhaThg3D9Bn7n6RbA/L2X3mWpqmrSHtJ4GNRRqnKvdXeFwOGtW61vvqSpSUnpVf+aeRz6JiPhEZBYbHE/+ycRyqgCjpUIEH3sllj7fUO74btmT3p77BOw/Typ3CG/o23fbqvixkL9YNWID5yKIna1rsROnq8Kg92eosaiBr9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHP32NGiihY2DbrBBP3dGVzDRS6IAPq1g6I2w9q6lBo=;
 b=IBdza/vEJGcbR2uISuEuUPnBkDGGefNtwfeFvqPhKrjIW7qwkTKqDQKQl4TR1hMmoFsxz2zW14TiXlXDIIDpUzFftrOyA55FzOfxa+xpDMcj2RWoBDQXVMNVNvB9I0TnXBSEkFUMpsxBkGtHqY/yK3wA0h6xFyXhGp9V3p1sBZk4VZ+39iZLvUnQpWL8n2pu0OpU/7R5h1WoYLIBcZe4H4t3qTS+RNQLXIOamyGAueZa2CRFVHqDgZUtlg7Ghehk3a/QfsuBfskqf7VU7v08E4gpxu/3k2eaRRPrbcphacN9KhA/azI3Hihy1R4tuiHIdqju8yCathG9KC/hKoBagQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:20 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] ovmf: upgrade edk2-stable202605 -> edk2-stable202611
Date: Tue, 24 Nov 2026 18:18:02 +0100
Message-Id: <20261124171807.74394-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: e2225bb2-496c-4e42-f13f-08df4a4eef9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|13003099007|56012099006|260925022911599003|11063799006|260925021911599003|260925021311599003|261021133027099003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022115727099003|261022075727099003|261026121527099003|261022105027099003|261021130227099003|261021135927099003|261026135527099003|261026130827099003|261028144727099003|261022113327099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: D6a1XjZ8eSEYJkqP93EgpE/QpnUj35KwAQrbgV1Kj+5dmyeyM6TqQTPEJatMKxQMj4z4iIcZrk5PvW2l4SN1fuKDs1v929Sx2pQoW4yS+goYs9EsODxGZSDAdS9GBkTCpiZSPU1tzdICbVLbUSbhKIlvCLAUiqzHF1LR60k7Ui5LuSFOdwPhln3hREf87YVV4M5KgdSBbwQs5P69BP7w4R/h4CtgvJCKaQhWzEA24v3Ub4rVpBbr1w3GAvO9bxEoqdSREgwWZC+nDk8W+DfZg0ktF4q5rBod70Ex5pLBD8Cfq5srjNdvfIhOUN+XU76COFAUaUPFGc7ZbifrOUNDbuahUhFe3yng/plJq4Tvv2QC+IS7QVbapAchGApxzef2WZJiwnSrdzpEnSWF4QlXUGQnHr0R1ns+nH8hiTZZYVlVTqOo0RMFCkkzcAuhzbVd4BlleVAa3SVPhR4CKjoVYJ8lXZUWYsa8B1o8WZBqEmZS4Y7vW0mKXJbf+jY6XNzpNj40cXyAokljUVkWqHXKLcWuid91xowOawUDb0V/JCNhe2M3BVWWzngOUgxXgb6xHAGkRR94LOm9sa3cI5T+NikMZAklkQaEi06zxeGIu728wiaYltFPQUmgEbA4AcEuk/mM1ynm7TEFifraPg1iTA9/5Kl1BdE8VmfmrZL8W2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007)(56012099006)(260925022911599003)(11063799006)(260925021911599003)(260925021311599003)(261021133027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022115727099003)(261022075727099003)(261026121527099003)(261022105027099003)(261021130227099003)(261021135927099003)(261026135527099003)(261026130827099003)(261028144727099003)(261022113327099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJ9W7PGdIKFHzM4OLe0CLHe5B3/SZ5BXED2y9ij81khtcixL0RhHtX1ebVU1?=
 =?us-ascii?Q?k4lnD11ESBDdt+66aOWenIAp3m3E7KJbfQR7urroJF7MDs2X3V8TIn9gKdv9?=
 =?us-ascii?Q?7d43nNnM8lS0dHZ33uSEfuUgnoMVSRCVEtJAZ3wGWt0+eAia3+2uwHtuTOSJ?=
 =?us-ascii?Q?6ZVb/85hqhGvTVWz4ZS2+pZ5InvH/LLNPhHEi/7Ls1mmsbcsFfkWHmgnOuLl?=
 =?us-ascii?Q?45IHYHu2YCU1jWxc5Ss1Kf+rM3yvZamTlEddmQ6I7jbWReDO0jcWPggv3K+b?=
 =?us-ascii?Q?SGhKfBYO1mHqH1iXTD0gtMWuCF/hAw9G8oadj/cQgcFtSgYqH59WdmH2Fenf?=
 =?us-ascii?Q?+HYQo/09yRxW7Ih349wohn5UFx3GrOieYZgSlxZ3gmkHNENJd/ZiTTCfmEpJ?=
 =?us-ascii?Q?JMylRWLtSM6e2gwiZY0QgmW0Ea0XDM+r8vd5MgeTjdeOQOZqGhhKjz68DrvK?=
 =?us-ascii?Q?AM69txQyPfX25Tufx8GwE1oIRF3rFjpLnB47XkNpnUWfAgKQITiKQa4tO4tg?=
 =?us-ascii?Q?bMhzfBdueYQnj14g14Ym9rnnm+t09+SwYS0uliQFyxIj8ASjNshH2brzjta8?=
 =?us-ascii?Q?DmSqPFD3t15IoGTXgtVRzvyPo+2FOI7Cx4lRLYIsy8BQtB2lwgKkB4RdgVUe?=
 =?us-ascii?Q?RLHyt5evEPiDOeeadvnPU/jXV+Puhw18VeQ9HGg7tDe2/Ci5xHuacLQcdOt3?=
 =?us-ascii?Q?eP2vUA5IdWYLdWV1LB7UuxQDB58JeyoB91y1v5ZA6iz5dp9ElnK7PnEUSgEc?=
 =?us-ascii?Q?drp88Nj8tTMrY2Xz5CD7u13e/BxY6TKelcRYyZL+kZO/R7sWc/E1BNO2yfku?=
 =?us-ascii?Q?8Lxl0tb9Y0Um+hBJBUCv4+faVZtyHl08XUlotA0oFRvjGLKgnZ/j1Kxj5Jid?=
 =?us-ascii?Q?h1siVTzHdL4nfCvdVb9bbwXro0woCfq1Mh/Va3zu10M+a0WeOkbhtd7y/zSB?=
 =?us-ascii?Q?hKk+ApUJDC4crrkBKofLc6uyqqDu2G7Vtwxg+UthHf1wsMaD4VpIbDa91m3e?=
 =?us-ascii?Q?AL5Ou9vwfhjVN9lIF9nBgm1wv7QzT7Kibn9kCLlKXfIdHO3fTYCzcQvFfkD2?=
 =?us-ascii?Q?TB/LTGv5EaOUW4n8A9y0hoEl/zPkMvLA4IvJWNHc8cIFo59TV9iHD5FkvNxn?=
 =?us-ascii?Q?SGy9phkf5b2uQrWDzzde0HwnFA8ErhzDtBRs6h9MHgF4Zb9GmESnjAu0dmNN?=
 =?us-ascii?Q?dNKGPoos3NM7Jr4DNhxG9hR8gQtRjqqz8cI93HLN5dHQ1B1M7O2+kdt0w4if?=
 =?us-ascii?Q?3Cc54O+mVLv5/TNu41OPBwCPtezQWj06WfjQ9UERvY0uaRX3BVUMhF3KMqNO?=
 =?us-ascii?Q?2KMQCU73Mq3H/q54IlItSf+MEOLfNQ3bF+NMcsCt8KsWBRxxc+yiQbuOs9TX?=
 =?us-ascii?Q?9XArRj87fBSVqwpBZE0BhUoQWcreCpDzBzzZf2QDbwNLPpOlMn3BXVBuxfp8?=
 =?us-ascii?Q?SEfrAz4FLruQzKi81DliSOitKPXsDuRNb6sdRtqsrE5q3pErsAuswHwULRYF?=
 =?us-ascii?Q?s4k+/ppz3nsaElWTJLD4vPnCbnBiw0a8kgyF7iUZCLoQ6Dow2EIvuJHs1y/2?=
 =?us-ascii?Q?hCnCfveqII8NgIEKBm6Dlcsk0ddoHcRR99ATyGsMIm5Pvi+3VUEV01Nw1+ls?=
 =?us-ascii?Q?NIdkxsCdGzcBCE1wK8uWeuVrbmAuKy7fGqJ/o9U6W898PjlsFpksYDLyN9MD?=
 =?us-ascii?Q?x//vEyWZz4IXvcjJS8qMs8IdbqsKaoWOm19c8oKj8+fwUeaIxv7X0Zx19WEe?=
 =?us-ascii?Q?BBK+9bMHsg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e2225bb2-496c-4e42-f13f-08df4a4eef9e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:19.9680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys3LWtUWsDuBI3tAl6ZaOYiMaREBfDm4mTDx+iDf2A7S0nkj8dp5AgwoGGVMhqCcI0mxWNvE1obHza1uQDnVPeDNikz6k7M76T7Lp1tt5YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251058
Content-Type: text/plain; charset="utf-8"

Release information: [1]

* remove patches included in this release: [2] and [3]
  0005-CryptoPkg-IntrinsicLib-fix-memcpy-alias-prototype-fo.patch
  CVE-2026-111497_p1.patch
  CVE-2026-111497_p2.patch
* refresh remaining patches

Tested with oe-selftest on qemux86-64 (kvm):
efibootpartition.GenericEFITest.test_boot_efi: PASSED
wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_x86: PASSED
wic.Wic2.test_qemu_efi: PASSED

[1] https://github.com/tianocore/edk2/releases/tag/edk2-stable202611
[2] https://github.com/tianocore/edk2/commit/a4610f9cfe
[3] https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62=
c30aa78b6

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ovmf-update-path-to-native-BaseTools.patch |   2 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |   2 +-
 .../ovmf/ovmf/0003-debug-prefix-map.patch     |  14 +-
 .../ovmf/ovmf/0004-reproducible.patch         |  10 +-
 ...sicLib-fix-memcpy-alias-prototype-fo.patch |  35 ---
 .../ovmf/ovmf/CVE-2026-111497_p1.patch        | 239 ------------------
 .../ovmf/ovmf/CVE-2026-111497_p2.patch        | 239 ------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |   7 +-
 8 files changed, 16 insertions(+), 532 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib=
-fix-memcpy-alias-prototype-fo.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 7590c7b2bd..7db401bca3 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,4 +1,4 @@
-From 7a517d144ead6a50baab6eaf7d6d763620243440 Mon Sep 17 00:00:00 2001
+From a024827c18c4b0fe66cf300be74796716d8fe302 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
 Subject: [PATCH] ovmf: update path to native BaseTools
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index b8f4feae5f..5affbbd1c7 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,4 +1,4 @@
-From 5f9cc244e566bd28a2a9c46454d206d795a02847 Mon Sep 17 00:00:00 2001
+From ee8967f7d89d327b5d982068b34eaec83b7c43c6 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
 Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 0f07aa1924..e9e8a05b95 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,4 +1,4 @@
-From ce5cd61548663f85845b8c645f21185fc7419b1b Mon Sep 17 00:00:00 2001
+From cea9efb2161bd519dba02d0536d090ae59a8231a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
 Subject: [PATCH] debug prefix map
@@ -22,19 +22,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index eca4cb82d0..7ccbb9c763 100644
+index 4d51737bbe..4a2098851d 100644
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -925,7 +925,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
+@@ -587,7 +587,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
- # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
+ # Because LOONGARCH64 supports global stack protector guard by default, i=
t does not support the parameter -mstack-protector-guard=3Dglobal, and this=
 parameter will be supported in GCC17. So set that on every thing except LO=
ONGARCH64.=0D
 -DEFINE GCC_ALL_CC_COMMON               =3D -g -Os -fshort-wchar -fno-buil=
tin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h=
 -fno-common -fstack-protector=0D
-+DEFINE GCC_ALL_CC_COMMON               =3D -g -Os -fshort-wchar -fno-buil=
tin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h=
 -fno-common -fstack-protector ENV(GCC_PREFIX_MAP)=0D
++DEFINE GCC_ALL_CC_COMMON               =3D -g -Os -fshort-wchar -fno-buil=
tin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h=
 -fno-common -fstack-protector ENV(GCC_PREFIX_MAP)
  DEFINE GCC_IA32_X64_CC_FLAGS           =3D -mstack-protector-guard=3Dglob=
al=0D
- DEFINE GCC_LOONGARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_COMMON) -mabi=
=3Dlp64d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsi=
gned-char -ffunction-sections -fdata-sections -march=3Dloongarch64 -mno-mem=
cpy -Werror -Wno-maybe-uninitialized -Wno-stringop-overflow -Wno-pointer-to=
-int-cast -no-pie -fno-stack-protector -mno-explicit-relocs -mno-relax=0D
+ DEFINE GCC_LOONGARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_COMMON) -mabi=
=3Dlp64d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsi=
gned-char -ffunction-sections -fdata-sections -march=3Dloongarch64 -mno-mem=
cpy -Werror -Wno-maybe-uninitialized -Wno-stringop-overflow -Wno-pointer-to=
-int-cast -no-pie -mno-explicit-relocs -mno-relax=0D
  DEFINE GCC_AARCH64_CC_COMMON           =3D DEF(GCC_ALL_CC_COMMON) -mlittl=
e-endian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-section=
s -fdata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-=
tables -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
-@@ -936,8 +936,8 @@ DEFINE GCC_AARCH64_DLINK_COMMON        =3D -Wl,--emit-=
relocs -nostdlib -Wl,--gc-se
+@@ -598,8 +598,8 @@ DEFINE GCC_AARCH64_DLINK_COMMON        =3D -Wl,--emit-=
relocs -nostdlib -Wl,--gc-se
  DEFINE GCC_LOONGARCH64_DLINK_COMMON    =3D -Wl,--emit-relocs -nostdlib -W=
l,--gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(=
DEST_DIR_DEBUG)/$(BASE_NAME).map -z common-page-size=3D0x20=0D
  DEFINE GCC_AARCH64_ASLDLINK_COMMON     =3D DEF(GCC_AARCH64_DLINK_COMMON) =
-Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=3DPECOF=
F_HEADER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=3D0x20=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_COMMON =3D DEF(GCC_LOONGARCH64_DLINK_COMM=
ON) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index 68a49d90d5..b9274c7db7 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,4 +1,4 @@
-From 8ae6441f19c71347acab1e789517035ee458449e Mon Sep 17 00:00:00 2001
+From 8455a4bbfb0edc49a99108efc08f412b2f4d912a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
 Subject: [PATCH] reproducible
@@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index bf4baf05d7..295f3f6efb 100644
+index 4b8afb0683..4ebe2885ba 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
 @@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
@@ -47,7 +47,7 @@ index bf4baf05d7..295f3f6efb 100644
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -996,7 +998,7 @@ ScanSections64 (
+@@ -1016,7 +1018,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
@@ -56,7 +56,7 @@ index bf4baf05d7..295f3f6efb 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2330,7 +2332,7 @@ WriteDebug64 (
+@@ -2449,7 +2451,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +65,7 @@ index bf4baf05d7..295f3f6efb 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2363,7 +2365,7 @@ WriteDebug64 (
+@@ -2482,7 +2484,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib-fix-me=
mcpy-alias-prototype-fo.patch b/meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-=
IntrinsicLib-fix-memcpy-alias-prototype-fo.patch
deleted file mode 100644
index 0921f21347..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib-fix-memcpy-al=
ias-prototype-fo.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Wed, 20 Aug 2026 10:45:00 +0530
-Subject: [PATCH] CryptoPkg/IntrinsicLib: fix memcpy alias prototype for cl=
ang
-
-The clang-only memcpy alias declares its size parameter as unsigned int
-while the __memcpy aliasee uses size_t (UINTN, unsigned long long on
-X64). clang 23 diagnoses mismatched alias/aliasee types via the new
--Wattribute-alias warning, which the CLANGDWARF build's -Werror turns
-into a hard error:
-
-  CopyMem.c:29:17: error: alias and aliasee have different types
-  'void *(void *, const void *, unsigned int)' and
-  'void *(void *, const void *, size_t)' [-Werror,-Wattribute-alias]
-
-Declare the alias with size_t, matching the aliasee on every
-architecture (UINTN is unsigned int on IA32, unsigned long long on X64).
-
-Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/13038]
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
---- a/CryptoPkg/Library/IntrinsicLib/CopyMem.c
-+++ b/CryptoPkg/Library/IntrinsicLib/CopyMem.c
-@@ -29,9 +29,9 @@
- __attribute__ ((__alias__ ("__memcpy")))=0D
- void *=0D
- memcpy (=0D
--  void          *dest,=0D
--  const void    *src,=0D
--  unsigned int  count=0D
-+  void        *dest,=0D
-+  const void  *src,=0D
-+  size_t      count=0D
-   );=0D
- =0D
- #else=0D
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch b/meta/re=
cipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
deleted file mode 100644
index 624515cacb..0000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 3949252908321a51c536961b05faba022cc129d6 Mon Sep 17 00:00:00 2001
-From: Evgenii Kliuchnikov <eustas@google.com>
-Date: Fri, 27 Feb 2026 05:10:32 -0800
-Subject: [PATCH] Detect and report invalid stream earlier.
-
-PiperOrigin-RevId: 876198329
-
-CVE: CVE-2026-111497
-Upstream-Status: Backport [https://github.com/google/brotli/commit/b418fa8=
1c48262a86a95332b0bc6d62c30aa78b6]
-
-(cherry picked from commit 0ed4268a4401abcb4472096340477cf4af7d1a2b)
-Signed-off-by: Devansh Patel <devanshp@cisco.com>
----
- c/dec/decode.c            | 89 ++++++++++++++++++++++++++-------------
- c/include/brotli/decode.h |  4 +-
- 2 files changed, 60 insertions(+), 33 deletions(-)
-
-diff --git a/c/dec/decode.c b/c/dec/decode.c
-index e87e7f5..74db1a2 100644
---- a/c/dec/decode.c
-+++ b/c/dec/decode.c
-@@ -1176,7 +1176,7 @@ static BrotliDecoderErrorCode DecodeContextMap(brotl=
i_reg_t context_map_size,
-=20
- /* Decodes a command or literal and updates block type ring-buffer.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeBlockTypeAndLength(
-     int safe, BrotliDecoderState* s, int tree_type) {
-   brotli_reg_t max_block_type =3D s->num_block_types[tree_type];
-   const HuffmanCode* type_tree =3D &s->block_type_trees[
-@@ -1187,7 +1187,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndL=
ength(
-   brotli_reg_t* ringbuffer =3D &s->block_type_rb[tree_type * 2];
-   brotli_reg_t block_type;
-   if (max_block_type <=3D 1) {
--    return BROTLI_FALSE;
-+    return BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH;
-   }
-=20
-   /* Read 0..15 + 3..39 bits. */
-@@ -1197,11 +1197,13 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAn=
dLength(
-   } else {
-     BrotliBitReaderState memento;
-     BrotliBitReaderSaveState(br, &memento);
--    if (!SafeReadSymbol(type_tree, br, &block_type)) return BROTLI_FALSE;
-+    if (!SafeReadSymbol(type_tree, br, &block_type)) {
-+      return BROTLI_DECODER_NEEDS_MORE_INPUT;
-+    }
-     if (!SafeReadBlockLength(s, &s->block_length[tree_type], len_tree, br=
)) {
-       s->substate_read_block_length =3D BROTLI_STATE_READ_BLOCK_LENGTH_NO=
NE;
-       BrotliBitReaderRestoreState(br, &memento);
--      return BROTLI_FALSE;
-+      return BROTLI_DECODER_NEEDS_MORE_INPUT;
-     }
-   }
-=20
-@@ -1217,7 +1219,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndL=
ength(
-   }
-   ringbuffer[0] =3D ringbuffer[1];
-   ringbuffer[1] =3D block_type;
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
- static BROTLI_INLINE void DetectTrivialLiteralBlockTypes(
-@@ -1254,62 +1256,68 @@ static BROTLI_INLINE void PrepareLiteralDecoding(B=
rotliDecoderState* s) {
-=20
- /* Decodes the block type and updates the state for literal context.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeLiteralBlockSwitchInternal(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeLiteralBlockSwitchInter=
nal(
-     int safe, BrotliDecoderState* s) {
--  if (!DecodeBlockTypeAndLength(safe, s, 0)) {
--    return BROTLI_FALSE;
-+  BrotliDecoderErrorCode result =3D DecodeBlockTypeAndLength(safe, s, 0);
-+  if (result !=3D BROTLI_DECODER_SUCCESS) {
-+    return result;
-   }
-   PrepareLiteralDecoding(s);
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
--static void BROTLI_NOINLINE DecodeLiteralBlockSwitch(BrotliDecoderState* =
s) {
--  DecodeLiteralBlockSwitchInternal(0, s);
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+DecodeLiteralBlockSwitch(BrotliDecoderState* s) {
-+  return DecodeLiteralBlockSwitchInternal(0, s);
- }
-=20
--static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeLiteralBlockSwitch(
-+static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeLiteralBlockSwitc=
h(
-     BrotliDecoderState* s) {
-   return DecodeLiteralBlockSwitchInternal(1, s);
- }
-=20
- /* Block switch for insert/copy length.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeCommandBlockSwitchInternal(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeCommandBlockSwitchInter=
nal(
-     int safe, BrotliDecoderState* s) {
--  if (!DecodeBlockTypeAndLength(safe, s, 1)) {
--    return BROTLI_FALSE;
-+  BrotliDecoderErrorCode result =3D DecodeBlockTypeAndLength(safe, s, 1);
-+  if (result !=3D BROTLI_DECODER_SUCCESS) {
-+    return result;
-   }
-   s->htree_command =3D s->insert_copy_hgroup.htrees[s->block_type_rb[3]];
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
--static void BROTLI_NOINLINE DecodeCommandBlockSwitch(BrotliDecoderState* =
s) {
--  DecodeCommandBlockSwitchInternal(0, s);
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+DecodeCommandBlockSwitch(BrotliDecoderState* s) {
-+  return DecodeCommandBlockSwitchInternal(0, s);
- }
-=20
--static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeCommandBlockSwitch(
--    BrotliDecoderState* s) {
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+SafeDecodeCommandBlockSwitch(BrotliDecoderState* s) {
-   return DecodeCommandBlockSwitchInternal(1, s);
- }
-=20
- /* Block switch for distance codes.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeDistanceBlockSwitchInternal(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeDistanceBlockSwitchInte=
rnal(
-     int safe, BrotliDecoderState* s) {
--  if (!DecodeBlockTypeAndLength(safe, s, 2)) {
--    return BROTLI_FALSE;
-+  BrotliDecoderErrorCode result =3D DecodeBlockTypeAndLength(safe, s, 2);
-+  if (result !=3D BROTLI_DECODER_SUCCESS) {
-+    return result;
-   }
-   s->dist_context_map_slice =3D s->dist_context_map +
-       (s->block_type_rb[5] << BROTLI_DISTANCE_CONTEXT_BITS);
-   s->dist_htree_index =3D s->dist_context_map_slice[s->distance_context];
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
--static void BROTLI_NOINLINE DecodeDistanceBlockSwitch(BrotliDecoderState*=
 s) {
--  DecodeDistanceBlockSwitchInternal(0, s);
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+DecodeDistanceBlockSwitch(BrotliDecoderState* s) {
-+  return DecodeDistanceBlockSwitchInternal(0, s);
- }
-=20
--static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeDistanceBlockSwitch(
-+static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeDistanceBlockSwit=
ch(
-     BrotliDecoderState* s) {
-   return DecodeDistanceBlockSwitchInternal(1, s);
- }
-@@ -1940,6 +1948,9 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
-   return BrotliCheckInputAmount(br);
- }
-=20
-+/* NB: METHOD should return BROTLI_FALSE only in case there is not enough=
 input;
-+       in case of "unsafe" execution, when input is guaranteed to be suff=
icient,
-+       result is ignored. */
- #define BROTLI_SAFE(METHOD)                       \
-   {                                               \
-     if (safe) {                                   \
-@@ -1952,6 +1963,22 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
-     }                                             \
-   }
-=20
-+/* NB: METHOD should return BROTLI_DECODER_SUCCESS, BROTLI_DECODER_ERROR_=
*, or
-+   BROTLI_DECODER_NEEDS_MORE_INPUT; the later two break the processing. */
-+#define BROTLI_SAFE_WITH_STATUS(METHOD)         \
-+  {                                             \
-+    BrotliDecoderErrorCode status;              \
-+    if (safe) {                                 \
-+      status =3D Safe##METHOD;                    \
-+    } else {                                    \
-+      status =3D METHOD;                          \
-+    }                                           \
-+    if (status !=3D BROTLI_DECODER_SUCCESS) {     \
-+      result =3D status;                          \
-+      goto saveStateAndReturn;                  \
-+    }                                           \
-+  }
-+
- static BROTLI_INLINE BrotliDecoderErrorCode ProcessCommandsInternal(
-     int safe, BrotliDecoderState* s) {
-   int pos =3D s->pos;
-@@ -1991,7 +2018,7 @@ CommandBegin:
-     goto saveStateAndReturn;
-   }
-   if (BROTLI_PREDICT_FALSE(s->block_length[1] =3D=3D 0)) {
--    BROTLI_SAFE(DecodeCommandBlockSwitch(s));
-+    BROTLI_SAFE_WITH_STATUS(DecodeCommandBlockSwitch(s));
-     goto CommandBegin;
-   }
-   /* Read the insert/copy length in the command. */
-@@ -2136,7 +2163,7 @@ CommandPostDecodeLiterals:
-   } else {
-     /* Read distance code in the command, unless it was implicitly zero. =
*/
-     if (BROTLI_PREDICT_FALSE(s->block_length[2] =3D=3D 0)) {
--      BROTLI_SAFE(DecodeDistanceBlockSwitch(s));
-+      BROTLI_SAFE_WITH_STATUS(DecodeDistanceBlockSwitch(s));
-     }
-     BROTLI_SAFE(ReadDistance(s, br));
-   }
-@@ -2330,7 +2357,7 @@ CommandPostWrapCopy:
-   }
-=20
- NextLiteralBlock:
--  BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
-+  BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
-   goto CommandInner;
-=20
- saveStateAndReturn:
-@@ -2552,6 +2579,8 @@ BrotliDecoderResult BrotliDecoderDecompressStream(
-         if (result !=3D BROTLI_DECODER_SUCCESS) {
-           break;
-         }
-+        BROTLI_DCHECK(s->meta_block_remaining_len <=3D
-+                      (int)BROTLI_BLOCK_SIZE_CAP);
-         BROTLI_LOG_UINT(s->is_last_metablock);
-         BROTLI_LOG_UINT(s->meta_block_remaining_len);
-         BROTLI_LOG_UINT(s->is_metadata);
-diff --git a/c/include/brotli/decode.h b/c/include/brotli/decode.h
-index 8d436db..10d01e3 100644
---- a/c/include/brotli/decode.h
-+++ b/c/include/brotli/decode.h
-@@ -85,9 +85,7 @@ typedef enum {
-   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR            =
  \
-   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR            =
  \
-   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR             =
  \
--                                                                         =
  \
--  /* -17 code is reserved */                                             =
  \
--                                                                         =
  \
-+  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR         =
  \
-   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR         =
  \
-   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR          =
  \
-   BROTLI_ERROR_CODE(_ERROR_, INVALID_ARGUMENTS, -20) SEPARATOR           =
  \
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch b/meta/re=
cipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
deleted file mode 100644
index 624515cacb..0000000000
--- a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 3949252908321a51c536961b05faba022cc129d6 Mon Sep 17 00:00:00 2001
-From: Evgenii Kliuchnikov <eustas@google.com>
-Date: Fri, 27 Feb 2026 05:10:32 -0800
-Subject: [PATCH] Detect and report invalid stream earlier.
-
-PiperOrigin-RevId: 876198329
-
-CVE: CVE-2026-111497
-Upstream-Status: Backport [https://github.com/google/brotli/commit/b418fa8=
1c48262a86a95332b0bc6d62c30aa78b6]
-
-(cherry picked from commit 0ed4268a4401abcb4472096340477cf4af7d1a2b)
-Signed-off-by: Devansh Patel <devanshp@cisco.com>
----
- c/dec/decode.c            | 89 ++++++++++++++++++++++++++-------------
- c/include/brotli/decode.h |  4 +-
- 2 files changed, 60 insertions(+), 33 deletions(-)
-
-diff --git a/c/dec/decode.c b/c/dec/decode.c
-index e87e7f5..74db1a2 100644
---- a/c/dec/decode.c
-+++ b/c/dec/decode.c
-@@ -1176,7 +1176,7 @@ static BrotliDecoderErrorCode DecodeContextMap(brotl=
i_reg_t context_map_size,
-=20
- /* Decodes a command or literal and updates block type ring-buffer.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeBlockTypeAndLength(
-     int safe, BrotliDecoderState* s, int tree_type) {
-   brotli_reg_t max_block_type =3D s->num_block_types[tree_type];
-   const HuffmanCode* type_tree =3D &s->block_type_trees[
-@@ -1187,7 +1187,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndL=
ength(
-   brotli_reg_t* ringbuffer =3D &s->block_type_rb[tree_type * 2];
-   brotli_reg_t block_type;
-   if (max_block_type <=3D 1) {
--    return BROTLI_FALSE;
-+    return BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH;
-   }
-=20
-   /* Read 0..15 + 3..39 bits. */
-@@ -1197,11 +1197,13 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAn=
dLength(
-   } else {
-     BrotliBitReaderState memento;
-     BrotliBitReaderSaveState(br, &memento);
--    if (!SafeReadSymbol(type_tree, br, &block_type)) return BROTLI_FALSE;
-+    if (!SafeReadSymbol(type_tree, br, &block_type)) {
-+      return BROTLI_DECODER_NEEDS_MORE_INPUT;
-+    }
-     if (!SafeReadBlockLength(s, &s->block_length[tree_type], len_tree, br=
)) {
-       s->substate_read_block_length =3D BROTLI_STATE_READ_BLOCK_LENGTH_NO=
NE;
-       BrotliBitReaderRestoreState(br, &memento);
--      return BROTLI_FALSE;
-+      return BROTLI_DECODER_NEEDS_MORE_INPUT;
-     }
-   }
-=20
-@@ -1217,7 +1219,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndL=
ength(
-   }
-   ringbuffer[0] =3D ringbuffer[1];
-   ringbuffer[1] =3D block_type;
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
- static BROTLI_INLINE void DetectTrivialLiteralBlockTypes(
-@@ -1254,62 +1256,68 @@ static BROTLI_INLINE void PrepareLiteralDecoding(B=
rotliDecoderState* s) {
-=20
- /* Decodes the block type and updates the state for literal context.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeLiteralBlockSwitchInternal(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeLiteralBlockSwitchInter=
nal(
-     int safe, BrotliDecoderState* s) {
--  if (!DecodeBlockTypeAndLength(safe, s, 0)) {
--    return BROTLI_FALSE;
-+  BrotliDecoderErrorCode result =3D DecodeBlockTypeAndLength(safe, s, 0);
-+  if (result !=3D BROTLI_DECODER_SUCCESS) {
-+    return result;
-   }
-   PrepareLiteralDecoding(s);
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
--static void BROTLI_NOINLINE DecodeLiteralBlockSwitch(BrotliDecoderState* =
s) {
--  DecodeLiteralBlockSwitchInternal(0, s);
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+DecodeLiteralBlockSwitch(BrotliDecoderState* s) {
-+  return DecodeLiteralBlockSwitchInternal(0, s);
- }
-=20
--static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeLiteralBlockSwitch(
-+static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeLiteralBlockSwitc=
h(
-     BrotliDecoderState* s) {
-   return DecodeLiteralBlockSwitchInternal(1, s);
- }
-=20
- /* Block switch for insert/copy length.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeCommandBlockSwitchInternal(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeCommandBlockSwitchInter=
nal(
-     int safe, BrotliDecoderState* s) {
--  if (!DecodeBlockTypeAndLength(safe, s, 1)) {
--    return BROTLI_FALSE;
-+  BrotliDecoderErrorCode result =3D DecodeBlockTypeAndLength(safe, s, 1);
-+  if (result !=3D BROTLI_DECODER_SUCCESS) {
-+    return result;
-   }
-   s->htree_command =3D s->insert_copy_hgroup.htrees[s->block_type_rb[3]];
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
--static void BROTLI_NOINLINE DecodeCommandBlockSwitch(BrotliDecoderState* =
s) {
--  DecodeCommandBlockSwitchInternal(0, s);
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+DecodeCommandBlockSwitch(BrotliDecoderState* s) {
-+  return DecodeCommandBlockSwitchInternal(0, s);
- }
-=20
--static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeCommandBlockSwitch(
--    BrotliDecoderState* s) {
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+SafeDecodeCommandBlockSwitch(BrotliDecoderState* s) {
-   return DecodeCommandBlockSwitchInternal(1, s);
- }
-=20
- /* Block switch for distance codes.
-    Reads 3..54 bits. */
--static BROTLI_INLINE BROTLI_BOOL DecodeDistanceBlockSwitchInternal(
-+static BROTLI_INLINE BrotliDecoderErrorCode DecodeDistanceBlockSwitchInte=
rnal(
-     int safe, BrotliDecoderState* s) {
--  if (!DecodeBlockTypeAndLength(safe, s, 2)) {
--    return BROTLI_FALSE;
-+  BrotliDecoderErrorCode result =3D DecodeBlockTypeAndLength(safe, s, 2);
-+  if (result !=3D BROTLI_DECODER_SUCCESS) {
-+    return result;
-   }
-   s->dist_context_map_slice =3D s->dist_context_map +
-       (s->block_type_rb[5] << BROTLI_DISTANCE_CONTEXT_BITS);
-   s->dist_htree_index =3D s->dist_context_map_slice[s->distance_context];
--  return BROTLI_TRUE;
-+  return BROTLI_DECODER_SUCCESS;
- }
-=20
--static void BROTLI_NOINLINE DecodeDistanceBlockSwitch(BrotliDecoderState*=
 s) {
--  DecodeDistanceBlockSwitchInternal(0, s);
-+static BROTLI_NOINLINE BrotliDecoderErrorCode
-+DecodeDistanceBlockSwitch(BrotliDecoderState* s) {
-+  return DecodeDistanceBlockSwitchInternal(0, s);
- }
-=20
--static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeDistanceBlockSwitch(
-+static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeDistanceBlockSwit=
ch(
-     BrotliDecoderState* s) {
-   return DecodeDistanceBlockSwitchInternal(1, s);
- }
-@@ -1940,6 +1948,9 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
-   return BrotliCheckInputAmount(br);
- }
-=20
-+/* NB: METHOD should return BROTLI_FALSE only in case there is not enough=
 input;
-+       in case of "unsafe" execution, when input is guaranteed to be suff=
icient,
-+       result is ignored. */
- #define BROTLI_SAFE(METHOD)                       \
-   {                                               \
-     if (safe) {                                   \
-@@ -1952,6 +1963,22 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
-     }                                             \
-   }
-=20
-+/* NB: METHOD should return BROTLI_DECODER_SUCCESS, BROTLI_DECODER_ERROR_=
*, or
-+   BROTLI_DECODER_NEEDS_MORE_INPUT; the later two break the processing. */
-+#define BROTLI_SAFE_WITH_STATUS(METHOD)         \
-+  {                                             \
-+    BrotliDecoderErrorCode status;              \
-+    if (safe) {                                 \
-+      status =3D Safe##METHOD;                    \
-+    } else {                                    \
-+      status =3D METHOD;                          \
-+    }                                           \
-+    if (status !=3D BROTLI_DECODER_SUCCESS) {     \
-+      result =3D status;                          \
-+      goto saveStateAndReturn;                  \
-+    }                                           \
-+  }
-+
- static BROTLI_INLINE BrotliDecoderErrorCode ProcessCommandsInternal(
-     int safe, BrotliDecoderState* s) {
-   int pos =3D s->pos;
-@@ -1991,7 +2018,7 @@ CommandBegin:
-     goto saveStateAndReturn;
-   }
-   if (BROTLI_PREDICT_FALSE(s->block_length[1] =3D=3D 0)) {
--    BROTLI_SAFE(DecodeCommandBlockSwitch(s));
-+    BROTLI_SAFE_WITH_STATUS(DecodeCommandBlockSwitch(s));
-     goto CommandBegin;
-   }
-   /* Read the insert/copy length in the command. */
-@@ -2136,7 +2163,7 @@ CommandPostDecodeLiterals:
-   } else {
-     /* Read distance code in the command, unless it was implicitly zero. =
*/
-     if (BROTLI_PREDICT_FALSE(s->block_length[2] =3D=3D 0)) {
--      BROTLI_SAFE(DecodeDistanceBlockSwitch(s));
-+      BROTLI_SAFE_WITH_STATUS(DecodeDistanceBlockSwitch(s));
-     }
-     BROTLI_SAFE(ReadDistance(s, br));
-   }
-@@ -2330,7 +2357,7 @@ CommandPostWrapCopy:
-   }
-=20
- NextLiteralBlock:
--  BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
-+  BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
-   goto CommandInner;
-=20
- saveStateAndReturn:
-@@ -2552,6 +2579,8 @@ BrotliDecoderResult BrotliDecoderDecompressStream(
-         if (result !=3D BROTLI_DECODER_SUCCESS) {
-           break;
-         }
-+        BROTLI_DCHECK(s->meta_block_remaining_len <=3D
-+                      (int)BROTLI_BLOCK_SIZE_CAP);
-         BROTLI_LOG_UINT(s->is_last_metablock);
-         BROTLI_LOG_UINT(s->meta_block_remaining_len);
-         BROTLI_LOG_UINT(s->is_metadata);
-diff --git a/c/include/brotli/decode.h b/c/include/brotli/decode.h
-index 8d436db..10d01e3 100644
---- a/c/include/brotli/decode.h
-+++ b/c/include/brotli/decode.h
-@@ -85,9 +85,7 @@ typedef enum {
-   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR            =
  \
-   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR            =
  \
-   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR             =
  \
--                                                                         =
  \
--  /* -17 code is reserved */                                             =
  \
--                                                                         =
  \
-+  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR         =
  \
-   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR         =
  \
-   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR          =
  \
-   BROTLI_ERROR_CODE(_ERROR_, INVALID_ARGUMENTS, -20) SEPARATOR           =
  \
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index af43fafbd4..cf36a63ed8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,13 +19,10 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps;ta
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
-           file://0005-CryptoPkg-IntrinsicLib-fix-memcpy-alias-prototype-f=
o.patch \
-           file://CVE-2026-111497_p1.patch;patchdir=3DBaseTools/Source/C/B=
rotliCompress/brotli \
-           file://CVE-2026-111497_p2.patch;patchdir=3DMdeModulePkg/Library=
/BrotliCustomDecompressLib/brotli \
            "
=20
-PV =3D "edk2-stable202605"
-SRCREV =3D "b03a21a63e3bd001f52c527e5a57feddb53a690b"
+PV =3D "edk2-stable202611"
+SRCREV =3D "556dcfb466e9f05affeaff881d738807f8156d3c"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
