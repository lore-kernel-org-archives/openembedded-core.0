Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8437.1792578628632303065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0G09SKtA;
 spf=pass (domain: est.tech, ip: 52.101.84.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMJjTcZhp5bMnTSTwUqDI3SWDTn3w7jJSVeFdWw9vFWkqjQEIwqsB8JpzlcUOx1PEa1K42Upv9fga4mBU3ezSPURIKzSHYtxQ2OrhPAeH4ikF2dcYJ9lCyypG/nUvRk9E/1v44Q9ofaetqGBv6jGtGaJ0B2McFpIFTmxqCWENtsdhaWapDpsjMCdOcWKKOlD3REvAOlVVvhfA9FVSk2vurnetWxXyjJjVX4OX8GYSbluG/DTghEbsGTGrlmoySM9xHtSd5q2Xq5Fgr64HKaak69d5ZnKB8sGYVKpzbzEnpRLcwpF2K1zNt1bruGY4ln3/V7FkFYp3lWmU0SbAjM6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSCgCRzNfXwYxUN2GAob9n3u6jOvVaaox3drUnQ/3gg=;
 b=Cf+I46UFOS0Bc7OqOYZJxMGW3LhBXYY4JeTIPJ6n/V8IezISsuhUodwu3D9KSjIS4moQxHXDhe157WJ4UIE4HB5QJtz9YU3e6R7XH5+ZSx6YZgoiHAPFhmX6240rO+1Xvt8Mij/Flzpg/A0eHfKNGvxVCottWQ2Jj7COrj2AcxflRMvbtZg0E+C1XSoHPw7AqMQ0neLsZLAeuvOqbzq59tJpjNcME4SRCLfp6fdvzjN1Fed+2P7xhk7N6S5MYmeEpX7LHKdzQ1rK1ZDD2hMIno+3mVLXVQcvyIoFeGCA/GtdvaXOqQ5Db3kPBtUyqJTcXefWWl2xNz433fX1/mzsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSCgCRzNfXwYxUN2GAob9n3u6jOvVaaox3drUnQ/3gg=;
 b=0G09SKtATs9jnyEC+6PorNoEEI0Eh0vN+ZDUPL2/azCHM+JFHeRYetxUJvnI6oYaTsBZVvnrMrWqY3qmfFtYp2dmHumXpyzv5inwoifpjOBlhtA0V8+0Bg01fiTA73P1lslvFVLDHliUwacvaUukSJ2qeUhP8FAvHggihh0Iva4JKbSnMzI5TA1xNlZSQBeOSFvDLB+Y6EK5BHYRdBW7hzBf4R/in7wPYQpZ32PGfrrmCJpn2Rgcp3BQ40Qi3+lPMUrmQK50jF4qpwR9gz7y4qXu0qfp9EWm2otIA+5PBOJeH9zWSVtBvFZ6sVtZYjnYrj9etzNXoSja+C81fKkjag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB3131.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:291::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:30:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 10:30:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] iproute2: upgrade 7.2.0 -> 7.3.0
Date: Wed, 21 Oct 2026 12:30:16 +0200
Message-ID: <20261021103018.2594-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
References: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB3131:EE_
X-MS-Office365-Filtering-Correlation-Id: d843f6ca-9023-427f-635c-08df2f5e4fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|10067099003|3023799007|261009221727099003|261009223027099003|261009223327099003|11063799006|261009220027099003|56012099006|261009221227099003;
X-Microsoft-Antispam-Message-Info: H+Xhnib9wUHAQKNsnSPzONLF6g8uUlZBcNvWUpfDKqIe5XCgXJPIo1Q0rzabVAcA2mq2taiNrolNYPXNW20j5+t0kTYja9VQ+FBy6+o1coGuU6kjvh3orzOwhP2hIjNs9MPwn6y+059VDT39cJNwtxGrpu2smXSMSg4/tgnoFrrQwIYa16xlM+jnCOzIWUAQ5Q7wPrxAJRdVCZWg8DtUonzs5MHxaWzIMUReKSegMCtqWeUNUYvO7PU3b7uZnuHQkhmvEB24AWzP3ZkUL8lYk09Smsnn5mmfboZCb6Z0ANMubVnSTS0VAOo2M4VA958rrT3dKHbbH4Z8aE9I1BKtBAywyAWFkt2lP5QVPUYNf5RthIQQ/6A9vX0Jne7O97GlLcpqj/EQRnkxPdVL6fyceN5xETGAKZoWzkdgs0Nrqo/hQFblGx4R34kgo+BTVclmXIK3LdgmDytDCbTEAnqC+32N61VbtM+COkujYEiERQCjYTEFM4utB1fHhCoObKirSw7EeNoANRcKlaJDoHrhbeeCa/zbCYx/VwJOeZQPCFJ1FyMoACIjBjGW4ZN1is74GjfOXqaejh/bfgwPWCb0oH1h4CN7PbuZsBSn3YptOesJMTS2/vbEjwKXOAjS76WfKXSwG212Sdbx3A7Qb6gjAzLao/1RuT4LfgcVRdHy2p8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(3023799007)(261009221727099003)(261009223027099003)(261009223327099003)(11063799006)(261009220027099003)(56012099006)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EZgzhzgQPui+Bc6+n749qpLZlzpeyeGbycT0sku5Wz/JrubxODBggDkO+I3a?=
 =?us-ascii?Q?YGgw5T5DCy5Nk2H0x8lk0j40khB3zm12NhDyqceIm/phXvxnal0FkXWXiAxb?=
 =?us-ascii?Q?sjvwTGc2XLUmZG52c6AYGFqaX/rQellif1lbaUW+O6z6y6SjYgDb87UCEGn9?=
 =?us-ascii?Q?zQtqJJ/jnmBwPtOL7ItVmFF6Gpx0Ipm0VcXc5WoIL1mRWmzk1b17mPcoAlQ1?=
 =?us-ascii?Q?5mF2aAqb4celkDCbQrOAG1IH5xgqO4ci2H3v1rjQ3oNhS2jpOTTxAHceEPG9?=
 =?us-ascii?Q?rvhvQtp1ZVBSz/LnTdpASFxRJtlvf7BfPcJSSv5IlABQPTtNHYmQKVCF4nz7?=
 =?us-ascii?Q?aGaH2CgWr8LZjBtjw8WW584lemIMCYAViqCYRwsB8K3JDNT1/q4IsGTZgY9p?=
 =?us-ascii?Q?4uLp1BIQ8wYW7v4BgKlFnZzGO9b5H4JrVFb1beenswNDIXbymE6V6S27AdwC?=
 =?us-ascii?Q?VPPbpID8IcCNl4tuuIc3BRIV02lscblUnF7N94fgIymm6f6mrKbKkHJe4OIC?=
 =?us-ascii?Q?R6g1CycexjriwfUo9Fe8rXAqoUp8dARk3NBb/DrdkKbzKW9YDVjM22BcS0wN?=
 =?us-ascii?Q?ATW+k88D8c2NmmifNzFED9y9JL26bGZ/63/gHT2y6aHhppoaVOPgtZtCcHpf?=
 =?us-ascii?Q?JzIVfFlryPfUAYpZI7FUuKecuCFsQQgl3HrMYMn0mIhaH0BbYjd4i8OhuMWi?=
 =?us-ascii?Q?TkSWkJOhbGKRXGzYoibmvIShji0p3cGhLlyuaATufcgLu2K0ZUdJZp3hOUrL?=
 =?us-ascii?Q?0+ISPGNz8xPFFPadyrSvQBjTo0aZviJcgH98w2mosniXBcw0KEG7/FGPOGeM?=
 =?us-ascii?Q?jmcX8D+XFxFkOhNVbs1jmrSn28PdK6uRB378TVYMN6uMXraVdPFe38x4Q/4Z?=
 =?us-ascii?Q?Jne56+jTEC3M92uDSFxgTZSTLidUM0pC1qo4a9Ysaq6yxU2E/c0HbOYfi9Ou?=
 =?us-ascii?Q?6nnjBrUNJ+/Q00QYlLqFg7MqI7sYVHXap9u4Urvm+uDURrbrikdKZv7s4jpC?=
 =?us-ascii?Q?laN38ThS/NUzGHk+Ef/hX/RBTi/xDSYCD9jP86GJDEiaup+4euhdMkp/sUfK?=
 =?us-ascii?Q?qidPlg9x7cFo0zyLL62eilPIm4oSRRxvdZ70TVzArMMsI4hn4aRxRH7fjitX?=
 =?us-ascii?Q?/88i6ZP1Rn3nHw1gmQT5+yrVa2i+E6Z+Y/+az6kLU6dxhv19ILiNvXl7DcTI?=
 =?us-ascii?Q?gJS62GFRPobUaLYZT6nuXkPuB01UTG/FcYUtAb9aWWbCifws2I4+NgaFcUhv?=
 =?us-ascii?Q?tM/elcIOcgsAO6ZY/+ZtCl6cPE4kqcf5SFPA7PkUILz4Wea8y3pg+DYtHSw3?=
 =?us-ascii?Q?wCr0M28uMwWHU/SYjuMjU9RRDUAwPxxJcIJfqdk+m8hed/xp8FIXFPAzW+XM?=
 =?us-ascii?Q?gqcsP415RT14/sbYIhuOJkaD30+pZ2Co72fKjdcJDokx/WoT/yVaBAqhbHyb?=
 =?us-ascii?Q?eAukzc1BOiEuuVJLHtmIMC0CafClmKNu6bOrY96Lp4VnzZ5MHJvvCKU4/bWN?=
 =?us-ascii?Q?lIcYJfqURsiTacinkP7TIToRxup2mgw9WRHRUb71UlefFrPRHn5lY2D6su8R?=
 =?us-ascii?Q?nDkt7xfwyxUXfCw/ddgJWlyP/jtLFMyuYI+xr7cCyWtoCUpGJT2n5tB0d6wx?=
 =?us-ascii?Q?/gMnuzZNVED47A9V4Rcv6II3W7vyZa8ZyIdO3lj8BjsH7azhCK23fG0NPKon?=
 =?us-ascii?Q?n5ijsG3wEZ6vsX9EA3WTQQfJ5t3oQXhqiy6gNtmapGKJEl4t7iO8c5c03cvk?=
 =?us-ascii?Q?WmCu0DJetA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d843f6ca-9023-427f-635c-08df2f5e4fd2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:30:22.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDoMt0RwR4qAOpBbC1XQT/7MJN+hqRtdSVdPEF4jl2dRbk7wkJzwb7VqLZW3t2JZ3xdPEtTDA8c2RlTatwmVZLg+bMj/VA72UO/MGI0tIRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248388
Content-Type: text/plain; charset="utf-8"

git log --oneline v7.2.0..v7.3.0
19d1276f (HEAD -> main, tag: v7.3.0, origin/main, origin/HEAD) v7.3.0
4f49441d testsuite: add bond slave LACP port state test
075f1b6f testsuite: fix test_on_not on multi-line output
0067cbc8 iplink_bond_slave: read ad_partner_oper_port_state as u16
e11870d5 lib: fix leak on realloc() failure
fde561a2 lib: fix memory leak in getcmdline()
a954ab5a ip: remove redundant human-readable option match
ac0b6729 uapi: update magic.h
e6471d77 man: ip-route: document uid parameter for route get
37921dc5 man: ip-route: document tcp_usec_ts route feature
873daf67 u32: fix IPv6 port match pretty printing
8016d5a1 ss: fix vsock port filter
e82aa16e ss: widen sockstat lport/rport to long
4766edf1 iplink/can: fix format string warnings
21a61425 tc/f_u32: fix const strchr() warning
5faf18f6 lib: fix warning from ll_addr_a2n
9361f61a json_print: fix Gcc-17 warnings
c5551426 uapi: update from 7.3 merge
fce739fa Merge remote-tracking branch 'main' into next
30365d09 ip/bond: add lacp_strict support
9204c0f6 Merge remote-tracking branch 'main' into next
ad2b2d95 ip nexthop: support fdb destination port
68f2b2cc Update kernel headers
b8cdda55 ipmaddr: use RTM_GETMULTICAST to list multicast addresses
ce0464ea seg6: man: document the lookup attribute for SRv6 encap routes
144c45b6 seg6: add support for lookup attribute in SRv6 encap routes
9b464a11 Update kernel headers
35a23709 rdma: display resource limits in curr/max format
39eb3a40 rdma: update uapi headers
20e860c6 ip: display DPLL pin information in link details
37c491d8 devlink: support u64-array values in devlink param show/set
32e2a883 devlink: use DEVLINK_VAR_ATTR_TYPE_* in param show/set
41b13849 Update kernel headers
3c0b939e ss: stop displaying dccp sockets
92f89d0e ip: add OVPN device mode support

- Refresh exsiting patch
- Drop 0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
  Upstream change was been part of release since v6.13.0 but in different
  line

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...nk.h-add-missing-include-for-htobe64.patch | 24 -------------------
 .../{iproute2_7.2.0.bb =3D> iproute2_7.3.0.bb}  |  3 +--
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-includ=
e-libnetlink.h-add-missing-include-for-htobe64.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_7.2.0.bb =3D> iproute2=
_7.3.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libne=
tlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/i=
proute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.=
patch
deleted file mode 100644
index ececd00539a..00000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h=
-add-missing-include-for-htobe64.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 61a0f63cd424b2e521b8b2e190c98271ced98de6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sat, 24 Aug 2024 15:32:25 +0200
-Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
- definitions
-
-Upstream-Status: Submitted [by email to stephen@networkplumber.org netdev@=
vger.kernel.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- include/libnetlink.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/libnetlink.h b/include/libnetlink.h
-index e91505d..938bb40 100644
---- a/include/libnetlink.h
-+++ b/include/libnetlink.h
-@@ -13,6 +13,7 @@
- #include <linux/neighbour.h>
- #include <linux/netconf.h>
- #include <arpa/inet.h>
-+#include <endian.h>
-=20
- struct rtnl_handle {
- 	int			fd;
diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb b/meta/re=
cipes-connectivity/iproute2/iproute2_7.3.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb
index aef70579468..63bdd78a7d7 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539f=
eef013de476e68b5c50a \
 DEPENDS =3D "flex-native bison-native libcap"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://0001-include-libnetlink.h-add-missing-include-for-htobe6=
4.patch \
            file://0002-include-color.h-add-missing-include-for-types.patch=
 \
            "
=20
-SRC_URI[sha256sum] =3D "4c2fa124c2cf0afd7ca34d1eeacba6ba048a56f6374e2aab93=
dafbdbd4eea9c0"
+SRC_URI[sha256sum] =3D "5c1789d290bba048a6135ed1ab81b0402dd0fb528d1f142176=
5c42b1fc3d6289"
=20
 inherit update-alternatives bash-completion pkgconfig
=20
