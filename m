Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38474.1795597599787432426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xF9n3VqD;
 spf=pass (domain: est.tech, ip: 52.101.84.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta9fsoWOfvxwkdz828RLr91JwpdY4ZV/H2pGYppTkahlHNNiIpv90jzELHzlwv4zh8OfZgQH3zvAa9EvBXeJ5cCQJ4DvcT5HOPxvts+i88SDE7JgPO62PUER7fD4e4tnhPdQTR79xVIO81keAjor9TMSISFsKf1vpzwD8bJoiZHoxXBtx7Bx+UTT/5QXPKxDfYwn9JIa6iK04J6zQnQ2xlfTBY5a1DtOo4UzVnsb2ogmTpZvCqvH9oBHSAc4TKTPbFWrcka557gwhmkmc0bxTbPaXQu0AWleQgwV0s5oa+ruUja4jmQ5l/uOO/3ytqQ0UuIRoGNowlIO5eUAR/TG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWYDf46z/GaYM4IIGRNfWeQ0EDs74YeiqDgyV6KAJNA=;
 b=Hr+AQEMGtqKvoVuY+AYAsYSPGz4gSfeTJR/EtunX4NnUGAKX6Y2cLdpHnOBg4UZCN3OQIPO/O0fvn3T2cseie8AZvCTsipWr4JbvFTPDj2mPAZNocBP8/ERLGemkGC6hm0lBJ8mrS3Iy17QwEoQ8vPWkKfR0z38rklUeA9F05LCxz+wTz7UustapZOEDHEL94uTM+qMpssH2IvVhHX+CEJ6XsDKIqKhqfvKeyvvsCD9MoGuo5Jupqa6dAVJhmOeTXDneZVB0tdf7X1UhWXJYBsGDxn4X19xY6KkYMcEemiJbrOJ6GETLseN47MzRpBYWA8NUqpohxiSYDHB5Pl9Pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWYDf46z/GaYM4IIGRNfWeQ0EDs74YeiqDgyV6KAJNA=;
 b=xF9n3VqDyPw7piMNHGCP61FV7FuyMhs6EtUzXWdw58hHzG+DbI92de/NcK1pYPNc3BicCYv0kB6Gq3SHQQazNutOSOVQHsgvNxg/EmzUx8NWBZLgnjvvCNkIZPDULYxVZuthSrHTO2pKuvjAshMWrpFe2xSuYkxty+5cT08iqPhRY6eY6stDhhl+S/mT7QwDN4Rkit1oLifCbX0+P/ggCxMT5DUzkEIljOGzt0YGTRRDqtSZX9OsQfILk/Av3GiJ6AfNmWbVihB97EQWABg38k7W/AjEn+J79gyvDNJtAZXFfmb8LfRbTh4n2awykjUbaZDPmDfRHoP6gFhh4fQSWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2746.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:06:31 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:06:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libpcap: upgrade 1.11.0 -> 1.11.1
Date: Wed, 25 Nov 2026 10:06:25 +0100
Message-ID: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
References: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PAZP264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2746:EE_
X-MS-Office365-Filtering-Correlation-Id: ba205159-3f69-4d7f-5002-08df4ad36568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|12006099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: 1Trq5SgrFubdZhR/ZPKgpk5bRS42+PtSOBRa1qFRWnks5mun36zklAMpHgzy8yiho3NgCVK0e3/T3SC5+sauJBmhtkz0RwJSmQVERn1K+qlJYdaP+ym0stQZ1MnwPY1xmWi8eaODnPnzB3qU8ShkHb/V195McSpJpWBq1K5/B9d2t6woZC1rGJ1/XlR0NyJuVY7+KmOv0A641CgQB9RoRvC9dQKs7XEjjUVOoDXa25kjGeYXgNnN6+DwzbV4iIriD0GO+NRjDGHxUFqw3TlFhfoJCkkzLua2cKdYYdwUHXVosZiYtM/zCW37LKoLG97yPndCSBxp/rX0i3Ocevro8qoLF3ST21FKoyPsBxrIJVOw4uI/NpDNwzXolp/g9IPDMs6Y437+XOKMArZ8ueZF4ewzqanxJTujUbpC4OfEhL4g6K0kbqqgJ+JcHkqlxWOEWqO7LcOyVJJeq480HsUPZMaSqGZpmByRx52EkyXAvEE5RGOZLHz142144LslLaVeqfY8sxBJEk5dr+lpeWuOd2rm0gHNz6cA+cSjLZuvMvWHSFeLGVfaMKvvoo5KUQzeB9qBU20pBpP66BIbRuTCZGoFjja/5OrOk8P7JQNLqXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(12006099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WKORPPsoaGVniaazE7/RRFvc2JOWcFAWgTOZbdedKCOPw9GZcHsHs+ImRaWA?=
 =?us-ascii?Q?GTIMm2mbthJEuia+dSYByVbTv+3QOcKyc6t0rJB4Nw//E98M9zLppRsn5UtU?=
 =?us-ascii?Q?pV4n4FiExAa7b6gNBrKshtkbixKrvkmQYCyf8NMmnmetpf+JqZ52etK6Ef7i?=
 =?us-ascii?Q?lmS9Z7EW91ikoPtFjGSOw3tuCOF7aQjz/U1Os0bNIfxQOImq0XUaDPZI31lC?=
 =?us-ascii?Q?QPoNUHY5W0fudOVMZBNY14cmiIBZ+6UZOKEsdBKbGodiYvoJlAC3EoxrgJaE?=
 =?us-ascii?Q?QiYtzJAi+zgK9AH1mZ4wd92r31EtFQlW82x1hnZaPCNH2oYxVv4MJYpjqEf6?=
 =?us-ascii?Q?nwiUKjZdBKxeU+aY8bQknyLBVGZi8HwhfKUk6oge+1pRbfSDw2noScfBYSh+?=
 =?us-ascii?Q?ndax7y3dggA4c/F+Hgfl2MvnM+Ho1zdK/vuXn4FFKviEgpGTuXxoXb8wvaCU?=
 =?us-ascii?Q?1v9ZaNAB+y3Ur3nuk41+6UCMv9/9VnxRGNOSQo4EkMJ3Cmnun/nMWAPhjbm+?=
 =?us-ascii?Q?Eywv0PxSpcSIYYyXOvHFfA0vY6E0FVNaVTsfQP+oj2I71adnfJygOJZO/+1Z?=
 =?us-ascii?Q?Uke66JV+pbwLHQU39HM6hBbYxZRkprYRFd870ljHjOJbC+j6lPo2JJsBo+UQ?=
 =?us-ascii?Q?KXVj5T6UT/NW54WRggBssh+mrcv68yb9CG7gaE92kT0x+fu+eTk2WdcNOwNJ?=
 =?us-ascii?Q?UoCV5XzDxyWzEuuySP4m/1+x7cr3GL1ICbB93e/zZoiX/FAOPM06KOjzLDqt?=
 =?us-ascii?Q?wjs+6+YeAbRMta7zb0v7Y4Zf6bFFJ3Ff9qYXeZD0PgDkKo5JwxXGH0O6KT4N?=
 =?us-ascii?Q?1ygmRnPOjE6MsHtA79LYCh/QQ30pZyoU4nIoyx9AK7XfgrvSZ1cS161z5gEO?=
 =?us-ascii?Q?J57LAvXrQyhSVKZzBcxGCR0T1Z24ZmZppCDc+TVKavYymvewhqjvK9J4SQSB?=
 =?us-ascii?Q?4c3b4xp7Xc+JJ0K/p73IQwLeODX6NE7bpl9TgTPhUt/8JaSboLo4MrXhpS+f?=
 =?us-ascii?Q?IVmwGmqLJIb21dNVp20EmqevN6kkSHh2Kss9qCJXSxRei9yLyQYwea1W3eU0?=
 =?us-ascii?Q?ChZj/cZDEz0VloHQekDcZx2Eqp8dfOrALfDNqwDQ/A+3hs8/anCXXByMS6rI?=
 =?us-ascii?Q?GocQQjJHP0SNaA13V+YpLk5ISu8ipjh0wGoHFh5ODELL36jLTL243Tt4YJ4c?=
 =?us-ascii?Q?9mUUaczvXLe5qYFRmE2Uqm+CLsVGUoUGJON5KsVh4aXuBflulz6OQs/7fjR9?=
 =?us-ascii?Q?hzXfw71YfXZ9/MULrVNNeqNQHrCwcBWkVfV27HRrdTN7Gh2jgMDHB7991K/b?=
 =?us-ascii?Q?fg+guIj3ne9wZxQFjo3X6S1jBF0ZKEUIlyuGaS0ksvO/8kqrwihnv4jJYN5M?=
 =?us-ascii?Q?xroTMI/FBo5iwrVO4dBcoP9Ou15d83U32QjftA9zFeCCwQ4XsKTcxn/DIaV+?=
 =?us-ascii?Q?YhivTIHxYfhNcxA3R1BgsDnFTuTW+QD3bkarhPZ/wSQcrBP1fv1sB/wiseBA?=
 =?us-ascii?Q?KjIqXXt1h/2GAINpFaI7CmL/zXXoCXI0Jt0H/QZptQiIc6s1nSOjp/C1izhV?=
 =?us-ascii?Q?rAsxjd41cXzDX4nn4nQucWzWh1/vzkvqmmmeXH+SZoFi1pmUHFMT8pmsz17m?=
 =?us-ascii?Q?LIHhJjKVFhYWz2C3pGl18aQs60mH6ra36QSpBSCv8XwhCI9K6vxe937uf37J?=
 =?us-ascii?Q?9kbfZMJM/CIDlDtZaJs9O7vZ1R4AUbVkalBYRbv3AFKn9zmB3sUSSk64wV2E?=
 =?us-ascii?Q?RRVWvW7VEi8fu3gkjjjsG6hb4X2ILkg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ba205159-3f69-4d7f-5002-08df4ad36568
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:06:31.0833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJ22rTeaskT0JwD+77v4COSKOhYg66gD8iFBw50b3ulM7IbWqT4xh8N9j5qY1aXzB5PhLqgpe6wJuzFIX51gZsqgR7HNxk+3vgtsIVsh5SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251167
Content-Type: text/plain; charset="utf-8"

Tuesday, November 24, 2026 / The Tcpdump Group
  Summary for 1.11.1 libpcap release
    Source code:
      Fix function names in two error messages.
      Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
        is invalid, as the return value isn't a general error.
      Indicate no-capture and no-inject devices.
      Require libpcap [internal-only] config.h in [internal-only] pcap-int.=
h.
      Use more parentheses in BPF_STMT() and BPF_JUMP().
    General:
      Set all the file descriptors/HANDLEs to an invalid value in
        pcap_open_dead().
    Building and testing:
      At the build time require atexit(3) not to crash.
      Require config.h to be from the libpcap build.
      Test for <sysexits.h> instead of specific OSes.
      mkdep: Use mktemp(1) if it is available.
      mkdep: Propagate compiler errors.
      Enable out-of-tree invocation of autogen.sh.
      testprogs: Factor fcodetest out of filtertest.
      Avoid some compiler builtins in Clang < 9.0.0.
    Packet filtering:
      Fix validation of "/", "%", "<<" and ">>" 2nd operand.
      Fix a dangling register index in "proto[expr]".
      Fix a register index leak in "protochain".
      Fix the skipping of AH in "protochain".
    Haiku:
      Fix a compiler warning. (Issue #1738)
    rpcap:
      Properly check for a network error in one case. (Pull request
        #1793)
    Documentation:
      Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
        the descriptors returned by those routines must not be
        closed. (Issue #1722)
      Update a few OS-specific README files.
    Linux:
      Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
    QNX:
      Fix DLT_PFSYNC definition on QNX 8.0.
    Link-layer types:
      Add LINKTYPE_ETW2/DLT_ETW2.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/{libpcap_1.11.0.bb =3D> libpcap_1.11.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.11.0.bb =3D> libpcap_1=
.11.1.bb} (96%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.11.1.bb
similarity index 96%
rename from meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
index ef1ff0fff8d..2d5064df3fa 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
@@ -13,7 +13,7 @@ DEPENDS =3D "flex-native bison-native"
 SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] =3D "9237f5bae9dcf3a91823d9963ec43b7c0e2e3374ef2ad57d92=
c8cd39530f4723"
+SRC_URI[sha256sum] =3D "ac3b1ee6c6b3a52f77d530b4b54d08f8adcb9929c2c47ac5bf=
d3db70e73df6da"
=20
 inherit autotools binconfig-disabled pkgconfig ptest
=20
