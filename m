Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8358.1792578633682195030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yfodoIcQ;
 spf=pass (domain: est.tech, ip: 52.101.83.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSzefFbi8iMmPwzf+FqK7yiXYxWlFM2jmaySs7JkqS62ih1XxCy/RIXiWPew5Kap6aZexfpS38HUxHLgZ+PX+PKLd9/ll2JoU8wKYh76DAkq6+fGgI9EbILQrzGNgAH5Niy9KD2u4eGpnBiaGEyc1Ms917HhLPxU4M7ocv0IojEcOaEyonBP44AvRmL+TTjnzu1dMlJVHuqYGgdNP/mkmblubcNv8JbPfQsWkQmInWBTGNtuUx5CN0TBQ9gxh4zMdK37UBWx5FlYSLZYAjqlaxVTzXa4t0rNeM5L5ayhmS3oFKQKIiJ1vgms7Ka95ram1be7AIUfrnOcKLxbNix6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrVTUuMxpi6e9/B/3kO2+vdupVpnUHkdFx399W9XHGQ=;
 b=VQX7oQPFWlD5F6/2/EI3A7XKCUldBPrB9JQOv2rxDXppur0S2z0STzcQxUSEA3WPWloeav6qQ06ButU2aEeMaqdYpB+UsncyJJD6+08NY9HttZ2xy070nJqGsepsH7DbtCiOne53ljITWSqtfAokm9JuLoJmqq6z3dvGpKniFMX1HWqCsG8Ij+YXEMon/VDY2vJsGGoFUfL7yYKdaigVSCg8ALw50kNUp9NtdYs4UhIioTX1nNqWSjQluT24K+v+NAMUSy2tRoihhoAgJvics/h8lFu7RUW07IGTQViAqm76yDr8mm25eRilGFK3tWZYHYFdlPgn8g7aV3DeG/iMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrVTUuMxpi6e9/B/3kO2+vdupVpnUHkdFx399W9XHGQ=;
 b=yfodoIcQDD4wF+HOVnfhJIHaKM5T3U0IMZzP0/cOnwspq3rD0A2gtfbq3oKdSEwHGbh9RnLQS8Zgft39YHBWS3QxCuWyvYxOS5rfFUnC96Klc3tJwU5EKs6WU7i7gChRjsKgfw30gUGyRlQkip9MzE1dPvqzuvViKZ6e5TXJ1qu9fsI1hicFAydi6lIAGaXX4Txtzqw6mKenB+D0vNpfo9EJQGN7YxpGRnxRuPijJvcarKNv+8RlM45GnylW3vTyqp1lPHMuKuvjuzEe0cqIDeCA8KNltogwHCIK5uqqsaI6N9jq9gSN/t5nCfQ+2cifFXMiGZ7dqvAO3vLTovUbDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB3131.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:291::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:30:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 10:30:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] iproute2: drop color.h musl patch
Date: Wed, 21 Oct 2026 12:30:17 +0200
Message-ID: <20261021103018.2594-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
References: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB3131:EE_
X-MS-Office365-Filtering-Correlation-Id: 121383de-79c4-4d8a-d9a5-08df2f5e50c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|10067099003|5023799004|261009221727099003|261009223027099003|261009223327099003|11063799006|261009220027099003|56012099006|261009221227099003;
X-Microsoft-Antispam-Message-Info: 1MXKKJAKfgwpUuyQMRozv6cHVCiNDDSFsb0s+kuPEgtQfJWItce+cNIT8DO0L0ieR7nji9cHgI5IPQRsvFfGGqKpLjF2DOXNmv62xk27k3q7kYzlnMdJXGDH3bPcovQG4gaNw/ko/U6MFzi+b5VZUVHK2+WRlJ/jhApTDeWf1zFDsu/Nzs8+CzwqrYVm78ZG1vDznit2fXEERelIAz3pLMp0mOd1zFFgruI1RiEHr8Q+ZbYVWqCU/ZCpW2rwUHRN3nCTM5RutKle1h8FkBqj5rCA3k3UioffLq8uiKUiT3DShPkhkTV04/4+MDJgTnRnYZfYxSeZEyfErlqcIdNPt3E41xqHGlRHlWr+0xGWAbp/9TwyRb5nYGz42mBy8NZaFY1yOrKGykb5Nmubq5nVgIfyd1veTDwCnnv8MjwBTdV8NoBMMFZX2L+ZLnmlYzDS3Zz+zDKPJN5AuR2PIa397k+yo0psKdvf/C3p3s5s2jsWcxgSeHY4KTKkzaHHhaedGZ4ImC4CguWXY5/YrSIcazrG18Te32R39Hh2fjLcPhmmhMXXthNVxqYNUvL0GSHWtius33XJ/wlRpqjezBDZZVbXABfsf3xaew0ICSEuWUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(5023799004)(261009221727099003)(261009223027099003)(261009223327099003)(11063799006)(261009220027099003)(56012099006)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BC/6/HQ6LYBW3pVl+Xj8XFjYog8puj9ZZx5/2oHHCC35NvyZfCJdh5YTukcL?=
 =?us-ascii?Q?a0Ab+gDw4arfTj8C+vK6kHZkgYugjyIj7J1ybB9wc9gJSfIPqR+L8icRwWLU?=
 =?us-ascii?Q?Kq0QXXwKsrQYbN6tzzYnPHerjlsoOnhDhV97icRxLE2iNvxc4PHrchbGNCNV?=
 =?us-ascii?Q?oMFcuMIi04uKQc252TaiizkxqGERRnweQZzl/Z7GK57faYqPItB1ty+GY96X?=
 =?us-ascii?Q?KyZOXCY8j9/Bx/1vRTIYRnCHdZvYkeRZzyZqFnlkuIhnMcxN96eIR3YAC1f1?=
 =?us-ascii?Q?Gfma+trLZA28nH3wlkibq2/6aGLTU0R68PcDoStN4/nxkLWpxXYpUgXqUGrV?=
 =?us-ascii?Q?E0rBmXWls6tk1zlbeeBLafedujTRiVxlDKQ4cGjzEEzeZOAGgF6gAT4nwZN8?=
 =?us-ascii?Q?rp/cJe3AS+Ovg+Cx5CX1gVSdnKRDWR6bUy5fIrGYt09q05UZszvov2KoUQcg?=
 =?us-ascii?Q?VGa90t3d7cuI0cr220meVDajypjxS+b3cwpTe2kG5ag3+6QhEAYXlBWE4l/E?=
 =?us-ascii?Q?ewag2SKb1AfG6so4uoH16ptB5qxUZGQ3W0v5SqG6xHCmGrELEpPsch219y2h?=
 =?us-ascii?Q?cQkGU42tUpK3vJEhRJugVAzvBK+J66L/HEzXpErz9FOYWL+OaSkI/wlpv+V0?=
 =?us-ascii?Q?dLZGUebbyTQOGWtu/44AF/1+svBQnw8dBXNAEc+xTOL8WG/wp5YHbrVLouFe?=
 =?us-ascii?Q?eXOWTiY5MC9S4SuElYI2WaO50Scmzzo1rVBsiABIKzbHmHZ8VzZhhDtL8QC/?=
 =?us-ascii?Q?ZloiRsszKWGMZIZMoXd8e9oBJa7qNv4q0g9ce8knIi3Aj8MXAOl0qoe8zp3O?=
 =?us-ascii?Q?PhuLY1xPlMxvr1D33G9fgulxwz8TAAmFonTJ4Kp1BZyV0OAbIfQXUA6uuiMk?=
 =?us-ascii?Q?pS+zSQVZVHG5H82Q2013guQAT4KYFFuEt/IbOvftbIflDBeuNUTYj/V2BDQL?=
 =?us-ascii?Q?q/b+1sTivTWbTsEoY9bnpMh6e8EFRLcKPgRz82pLN49Wq4m+eZmYaQcfOe+T?=
 =?us-ascii?Q?fWL7aSWxW9VCxOwkMWREHA2kp/Dmasny4diDXguOFyNKJMQaKL/CdL1/dhDa?=
 =?us-ascii?Q?LydKNrkFQe4g4284c1dEv83roQP7w99ReZe3lX3OTWOzlHz6ne30ND1xTuEE?=
 =?us-ascii?Q?0WQqcSdvGbgDPUBRyzImjcZZkxY3yqAtt7EUvUFeiDPFACrhe9UqKW5ev4Cn?=
 =?us-ascii?Q?PbGSb12+rvp8yFDBVBEaPFJE7lgXlovnKEF+8a2tv4Y3xZCdaYSLLbSH9Y50?=
 =?us-ascii?Q?mYRLQiOqcfgM2wMh6TVYAyyFdYWxLenhCwHe3oQa146ERe6OVewebxjGPgie?=
 =?us-ascii?Q?IS5eRal7uXWAwZVejjo93plG9aEp5sV/KOOkITDzsh2qd7+gg7fje3ZWl3aP?=
 =?us-ascii?Q?VPPoRPMWJEryPA56euyfrXGp6MOiSGrrsPrcQ5ATvOSKIORZyShQdqL1z5XS?=
 =?us-ascii?Q?XjsiKG659HgFuX18l10/5vys0RsKHqvNTVxYkwXufhEq/UnjQHw0jP3cVGsE?=
 =?us-ascii?Q?vthQ3uqNFr5uaPMSoCeO7FbRwxFeWcRZx5QVfNRIAWVdl8PgW5065ZBFj00I?=
 =?us-ascii?Q?HnPVHKNbG8SuiLBKMZdyG/wqzsPdndIi9wJK6V5VzjHIrqszL9EpGKca8qNO?=
 =?us-ascii?Q?i4iZrfD8wVss4J4XTFx6PMh0+kWEKD3gzl9oKRfp+BTmA4JEgxwvHD0Aa/cI?=
 =?us-ascii?Q?viHJ3hMzVila+uLSNqhpffnBuD4YwBS2Mc2iin/cLCpEBfb26TIukiAUbVqw?=
 =?us-ascii?Q?opnget4G2Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 121383de-79c4-4d8a-d9a5-08df2f5e50c8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:30:24.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErOpkvhCM/6+iMNTbYdGMp8P3v2kKf7nZJuFY15GK4HAc67wFLOOw35gCwzU4ovXUNcbtIB81zyhrAhA1YA2TCtLy8t3341rtfixdRrLP/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248390
Content-Type: text/plain; charset="utf-8"

- The patch added <linux/types.h> to color.h so __u8 would resolve
  under musl. In 7.3.0 everything that includes color.h already pulls
  in a header that defines __u8 first, so it builds fine without the
  patch now.
  It was only submitted upstream, never merged, so nothing was lost by
  dropping it

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...olor.h-add-missing-include-for-types.patch | 25 -------------------
 .../iproute2/iproute2_7.3.0.bb                |  1 -
 2 files changed, 26 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-includ=
e-color.h-add-missing-include-for-types.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color=
.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2=
/iproute2/0002-include-color.h-add-missing-include-for-types.patch
deleted file mode 100644
index 5ed8335be7e..00000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-=
missing-include-for-types.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7dc5b9726cdf214835c62967f7dcb8ceb660ece7 Mon Sep 17 00:00:00 2001
-From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
-Date: Thu, 5 Mar 2026 08:06:54 +0100
-Subject: [PATCH] include/color.h: add missing include for types
-
-Fix `musl` build error
-
-Upstream-Status: Submitted [https://lore.kernel.org/netdev/20260305082507.=
896700-1-andrej.kozemcak@siemens.com/T/#u]
-Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
----
- include/color.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/color.h b/include/color.h
-index b543c26..3794a2a 100644
---- a/include/color.h
-+++ b/include/color.h
-@@ -3,6 +3,7 @@
- #define __COLOR_H__ 1
-=20
- #include <stdbool.h>
-+#include <linux/types.h>
-=20
- enum color_attr {
- 	COLOR_IFNAME,
diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb b/meta/re=
cipes-connectivity/iproute2/iproute2_7.3.0.bb
index 63bdd78a7d7..685fb3ce9aa 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539fee=
f013de476e68b5c50a \
 DEPENDS =3D "flex-native bison-native libcap"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://0002-include-color.h-add-missing-include-for-types.patch=
 \
            "
=20
 SRC_URI[sha256sum] =3D "5c1789d290bba048a6135ed1ab81b0402dd0fb528d1f142176=
5c42b1fc3d6289"
