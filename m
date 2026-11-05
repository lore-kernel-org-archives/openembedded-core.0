Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31626.1793876992219552122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=M2hEGXsw;
 spf=pass (domain: est.tech, ip: 52.101.83.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDERTvo2wLVbwK8bj51AD8mEFTaRBLtW2ek8F166PvaG1v2wQ8Bbd1X7GbhSaVehsQ7w4hygk3fboN1FZwy5vqCbepr6IoEQD0kuFQO7zgJq8voaH4wupsjQUC+g+ENE1/FZ/VbPxjwNBTRylqxSgABl6MH3OOX52DIXo3vvX4Wcv1mIH5JRtomPYoNHHB6a1l1Tbk3O33sjSpuJ83UELJlp10UuyqqS1SotcM9rAIOqLT2l+09vFELzYfQnhxngJ6X1mHi6V4gXrGJ6Qmf8CJbtqIf/JDv461qtHWPuJgqxp4ZQbRECacncEJV4F/jhhlQzKeMNzwxZiJJBwt5zsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/wThOpm9CYY72DNiq75UNFyGhDV4NOQcFOzhgUTadY=;
 b=fsk0yZQEQer7E6XpokSoSYiydIHDyzWx/yRpaW04u4nvn5x8lRoIC002Ji5JmELxiMINey6mssVSzuuuNnSugQlXiq1+JpCbExPmtE+ATkvHB1MiHLiHBbSfj+zusGOSef53RNeWX4kB1TJRyCllCFZ6FsQPqxNr1LECvuPN9EuGXmjPAU7XCPAE/m1ncs9OcptI6Ji6IafGMrXLYsfyUODUoWkj07xd29D8VmFnJNZs2hqsmzwU8u/KcfKKO8WFNTQ5JxUvlHBjHjV+ae/AcMTux52Uie9jm4DBZTT9LTD1kArjOeNgSXkBEJN2o4WLegiq8E9xyhRFAkvYpFUDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/wThOpm9CYY72DNiq75UNFyGhDV4NOQcFOzhgUTadY=;
 b=M2hEGXswiLv7K9QrR4rTnos3Vts/ZYU/SoLgmpqMnH+uOtHEENEnXbGrSoVMycAMc2OmcQQRGwDSjI8Bg/4Z1hmEzbMlC8QnTYIcJlVgC6YVoBF7POPxMWkOLOLoHUeuMkvZ8SOXM8z5/QKt3itcffDY3tGaZsBmWjK86/mL7bRhvllfTy/t0NGoCf1yOxCygrrNM+aDFeZx6RBeS7JmixmWE+tiBvScfznDSQNWRKSHrby4hQLR0w9vaV/A8byeZ4HXJPH52EmSbJhxqFwZ6h/Vh4GYt+fQyUISBH8shxgPm7oClnwjjsPsOK4QevB+EVuhQ+/NvDta7ofTO3H4Cw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF0806ED8F1.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::185) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:50 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 10/10] systemd: Upgrade 259.5 -> 259.10
Date: Thu,  5 Nov 2026 12:09:30 +0100
Message-ID: <20261105110930.52643-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0355.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::34) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF0806ED8F1:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa49c9f-6a22-4db7-a233-08df3b2d4f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|260925021311599003|260925022911599003|260925021911599003|261026140227099003|4143699003|5023799004|11063799006|56012099006|261022075727099003|261021121427099003|261021135927099003|261009223027099003|261022105027099003|261102123227099003|261021123027099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: lwMeV0tiFuSLKezqwFExnPZ8PsvfmGN2QbggPksVYXnXpPzZckdOnQidpN8SDU5EocRl/D8O2nXW6uSSoQqWb31W5CU7Nfe+exkg7jjo2v8jqAZNz+F0ZTghgVCiDfqNPlsEU06X36m24XL/onU6DytZrZDdbm3MyRTDlz/zekcsQld6UxB7HaGPFW7rN4x6oXf8hVxK5MZoqT7cTEXxT6UAZLAhYQF3GsO4CFk6KPYxoI2k/2GEA7HsOUTLbs/Cu3zwKjfAJgh6OWrz7dhGQXg+XNjwCke+o4eEOat8wENDgFJF0qMmL1b1BFIqkoo1G2PnSCXUyE/V7mFfNSzn1Exgoz1qyt6HzngY0p8qWouqSQhYaBvpScHTQjB+3inDK9ARIinoFjLZQaYE4CUbQARWz21LLIToy3YyFkFo7SFwJP8EcV9zTkl5ApGv+40anVRmCjLfw57N+vSxmocxGowAzfq9nsRn/j9wpk/p4ZpFB0AJwH9sgzVfV+i9lEyu9LHo7a/Pxxr1A+suYll0G1IDQCRFv7ULk0ur5ckxyPIT0dWtXXCt33H6CAuUlWgJbKsA4wvINKLLuy/VhhoL6MRipnDk2BwXAXKyNTXcgmb+k1atqHbHpMDjwNbyuhcL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(261026140227099003)(4143699003)(5023799004)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021135927099003)(261009223027099003)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y1dRcaNeYxcGLXjv57ETC/ztU51aWU3ZU+xJ32FDyqJkaHvkYuZoM7sMFKup?=
 =?us-ascii?Q?BxvDgUI6d08u3xo6raPWVXKDmAktxgj7yRFFoJveIQLxvkSsWmLxLyBhwVKq?=
 =?us-ascii?Q?MizpUoVEfQZhP/MQMGQHZjfWZy5C4mH5q0g9r6emxMY1fV8uZlPr7vOjSlbR?=
 =?us-ascii?Q?gCPzzAB6vVSDC5ViN6LyVZ+MhaoMfs9zTtdR1IHXiIz0s5eiy2+8QmiVYKNc?=
 =?us-ascii?Q?aV7vAwslb2o5hn4aNQg53oDJxbyG8aeKfPnBUpazM39UEt9sqaJ7LiFlTqGT?=
 =?us-ascii?Q?/ya4WHhXbnsImOCf/0abdJMOQ2bA9EE5G3ksPABm9uE34QDXEPTzHOu893Bo?=
 =?us-ascii?Q?8WLduTeMS+uxtmaMOsaMaAr3M0Gm5nP2fUn1WFMLFsd0BJ2J7Tnufw5kHlxh?=
 =?us-ascii?Q?GNkWuj1Cba6Qt85ES7iJeP743b0MsEv2RILJGxMSD6KDZqdya5pwnoLsTV5c?=
 =?us-ascii?Q?Zi04AW5bAtU634oIJ8V972KXAEE56SraREMd8Q4befj/O7MkxmPQDl9k+sDH?=
 =?us-ascii?Q?cKo6y4Ni00WCbsKzxJULuP8Yjd8YtHu3Sq2A/yZjtlk59zl0AaBbYknxrpDd?=
 =?us-ascii?Q?kga23n5EHPdN02vLfbBD5DVwQZNoPzEjW4MA9ffjIFXJ/WsOQ3OKm6ufVrpi?=
 =?us-ascii?Q?um4OhRCDYgQJVLFVUTpf4y2SGkhynmR9KNPmvZYH8UEbgh+kQUW2jYYNqrVh?=
 =?us-ascii?Q?HvSVRx9o3JNG6RF+IPckggnJPg6obMmeCtrPmN7jXKd+NEDcbnalEU5aOa7d?=
 =?us-ascii?Q?Z3DXfsC1jF6inojrN4bW+TrGaJkqws17SnfJzdr6G7st7GC5BgeolY9kEGHi?=
 =?us-ascii?Q?+LXvKb0bYB7E+pWeQUZwtFtNbKG0BFx+mV3ylmCzrbSq9/nL/46ldtBX/nre?=
 =?us-ascii?Q?qZNyU7uCFQb8tXg5e+yFDKsIuiVdr8MgMJIfDagEkZLkrmf/eVoN2LBQ/NOK?=
 =?us-ascii?Q?giopnyGIGybHb5m1iRBR+g4sLMw4a54NBPySiAY9dNxl0To7qBTKIp5YvIBz?=
 =?us-ascii?Q?Pbz1qHyBPYDi3b38/BvAih86ZzYYDWJRXJ1OcpET7HLXCpM0hLKhvcoHdK8E?=
 =?us-ascii?Q?NpAFBk3mK33TT8IO63YtjDTbdfeyp0JOk4fbQarI2lgRYEe+OAu3jVL1oxCW?=
 =?us-ascii?Q?JOUbxFs7nxe+kXUPXoyP7VmmBo97nLLg9Sv9arSSOQFSSb/qANiH9X1YMI5O?=
 =?us-ascii?Q?7r74ZjWeacfQO2/UIAo42blUIZ1vEe32VDtEf0/CItGlQKMBD/hAHpGTOjfu?=
 =?us-ascii?Q?/Q2CWucyBS3g+oWx3bVaLSQpj25zTEsdkXanEILaUY4rCsml09LiQF8+Cn5s?=
 =?us-ascii?Q?U5/xB9fEJ8cl0KVr3Qe2HvHxS0nRtKr9VJZwy14+HGTqnASC/OD3LvlqM2Rs?=
 =?us-ascii?Q?W1Oa/p8NDGnfblrAJbgbtfeq7RWO1Zmo0txgP0JDvOASLf65uj/odG9GxQuH?=
 =?us-ascii?Q?sY/ce5uOCrrayaXzHqBfQwuR2H8KnFZDL/KiUMkP9XBwIXF8aNQ+uG+aLIyZ?=
 =?us-ascii?Q?u+rcUz9vQ8coXRHlyCjTqYhnk7AvoxYtMvyl9/Y0NDz4vLZYGDRarS56NnRU?=
 =?us-ascii?Q?tXP5Syw8rsN6bxp5kMePh/UO/qopsYBjerXmzBtUf6v02MUWLus7xdc6Ju2R?=
 =?us-ascii?Q?vsovpdZrk1MeMaMF2VCagPckiJ7S3A2WQ2jlbUs8lAU0piNgWWI5QLlsPACi?=
 =?us-ascii?Q?udViPs3uVX/NEzwKTyA4YRDJylT868p3NfZof3rYFYYzksaUb7lvLh0RMIRk?=
 =?us-ascii?Q?tTcATs1JhQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa49c9f-6a22-4db7-a233-08df3b2d4f65
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:50.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 853gEuR2C7DIbBEbdqkb04dhwh6Zll9HROCnfQ691qNvrC6NuQfSj7emV/FQ89AfimrK6MSkLJKXFzGVe5nhXkuKX/y8nEJ4lx1aW46qulw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF0806ED8F1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249537
Content-Type: text/plain; charset="utf-8"

* Stable v259 release uplift
* CompareLog: https://github.com/systemd/systemd/compare/v259.5...v259.10
* Drop below patches which are part of upstream
  0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
  0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch
* Also drop 0001-hwdb-strip-the-root-from-filenames-when-generating-h.patch=
:
  it was added for systemd-tools-native on 259.5, but the upstream fix
  (a9397de9d2) is already part of v259.8+, so it is redundant on 259.10.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...259.5.bb =3D> systemd-boot-native_259.10.bb} |  0
 ...d-boot_259.5.bb =3D> systemd-boot_259.10.bb} |  0
 ...59.5.bb =3D> systemd-tools-native_259.10.bb} |  2 -
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...use-traffic-from-the-local-host-only.patch | 61 ------------------
 ...oot-from-filenames-when-generating-h.patch | 40 ------------
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 -------------------
 .../{systemd_259.5.bb =3D> systemd_259.10.bb}   |  2 -
 8 files changed, 1 insertion(+), 168 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_259.10.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
259.10.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_259.5.bb =3D> syste=
md-tools-native_259.10.bb} (95%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-r=
efuse-traffic-from-the-local-host-only.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-r=
oot-from-filenames-when-generating-h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_259.10.bb}=
 (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_259.5.bb b/meta/=
recipes-core/systemd/systemd-boot-native_259.10.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-boot-native_259.10.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes=
-core/systemd/systemd-boot_259.10.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_259.5.bb
rename to meta/recipes-core/systemd/systemd-boot_259.10.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb b/meta=
/recipes-core/systemd/systemd-tools-native_259.10.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd-tools-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-tools-native_259.10.bb
index d8d0eae009..81d37c5b75 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.10.bb
@@ -4,8 +4,6 @@ require systemd.inc
=20
 SUMMARY =3D "native tools from systemd"
=20
-SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-generati=
ng-h.patch"
-
 # We don't actually need jinja to generate code, but it's checked for at c=
onfigure time
 DEPENDS =3D "gperf-native python3-jinja2-native"
=20
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index bbcacf9deb..ae3a034ef3 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
+SRCREV =3D "cc6062f23cb595c172d9a007ed99d925852bfd60"
 SRCBRANCH =3D "v259-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-t=
raffic-from-the-local-host-only.patch b/meta/recipes-core/systemd/systemd/0=
001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
deleted file mode 100644
index efdc2852f9..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-=
from-the-local-host-only.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 658e5ac06f80ee2078b034f7cc483204d7f91c5e Mon Sep 17 00:00:00 2001
-From: Bret Comnes <bret@comnes.org>
-Date: Thu, 26 Mar 2026 05:59:09 +0000
-Subject: [PATCH] Revert "resolve: refuse traffic from the local host only =
for
- queries"
-
-This reverts commit 526f1594daec073269c3e70ee7914f6dd8740d5c.
-
-This revert is necessary because the change breaks mDNS hostname stability
-whenever a DNS-SD service calls UnregisterService. When a service
-unregisters (e.g. on process restart), manager_refresh_rrs() clears and
-re-adds all RRs in PROBING state, which sends a multicast announcement
-(QR=3D1). The kernel reflects this back to resolved's own socket. Because
-the local-address check was moved inside the query-only branch by the
-reverted commit, the reply path in on_mdns_packet() is now unguarded.
-The looped-back announcement matches the pending probe transaction and
-completes it with DNS_TRANSACTION_SUCCESS. Since the zone item is still
-in PROBING state (not ESTABLISHED), dns_zone_item_notify() sets
-we_lost=3Dtrue and calls dns_zone_item_conflict(), which invokes
-manager_next_hostname() and renames the hostname (e.g. foo.local to
-foo4.local). This happens reliably on every restart of any service using
-RegisterService/UnregisterService (homebridge, avahi-compat wrappers,
-etc.).
-
-The top-level local-address check in on_mdns_packet() suppresses all
-looped-back multicast traffic before the reply/query split. Restoring it
-there is consistent with the overall design: dns_scope_check_conflicts()
-already has its own manager_packet_from_local_address() guard and is
-unaffected.
-
-A more targeted long-term fix (e.g. guarding dns_transaction_process_reply=
()
-for mDNS, or avoiding unnecessary re-probing of already-established record=
s
-in manager_refresh_rrs()) can be pursued separately.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/658e5=
ac06f80ee2078b034f7cc483204d7f91c5e]
-Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
----
- src/resolve/resolved-mdns.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/resolve/resolved-mdns.c b/src/resolve/resolved-mdns.c
---- a/src/resolve/resolved-mdns.c
-+++ b/src/resolve/resolved-mdns.c
-@@ -415,0 +416,8 @@
-+        /* Refuse traffic from the local host, to avoid query loops. Howe=
ver, allow legacy mDNS
-+         * unicast queries through anyway (we never send those ourselves,=
 hence no risk).
-+         * i.e. check for the source port nr. */
-+        if (p->sender_port =3D=3D MDNS_PORT && manager_packet_from_local_=
address(m, p)) {
-+                log_debug("Got mDNS UDP packet from local host, ignoring.=
");
-+                return 0;
-+        }
-+
-@@ -532,8 +539,0 @@
--                /* Refuse traffic from the local host, to avoid query loo=
ps. However, allow legacy mDNS
--                 * unicast queries through anyway (we never send those ou=
rselves, hence no risk).
--                 * i.e. check for the source port nr. */
--                if (p->sender_port =3D=3D MDNS_PORT && manager_packet_fro=
m_local_address(m, p)) {
--                        log_debug("Got mDNS UDP packet from local host, i=
gnoring.");
--                        return 0;
--                }
--
diff --git a/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-fro=
m-filenames-when-generating-h.patch b/meta/recipes-core/systemd/systemd/000=
1-hwdb-strip-the-root-from-filenames-when-generating-h.patch
deleted file mode 100644
index f11199c553..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-from-filen=
ames-when-generating-h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0031715c560e8138cc320f017a0a2c7160b1f7fe Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 17 Jul 2026 17:25:31 +0100
-Subject: [PATCH] hwdb: strip the root from filenames when generating hwdb.=
bin
-
-The modern hwdb.bin format contains the filenames of the input data that
-makes up the database.  This is useful but in offline builds where
---root is used, the filenames are the full build paths including the
-specified root.  This introduces build paths and thus information
-leakage and non-reproducible data.
-
-Solve this by stripping the root prefix off the original path when
-passing to import_file.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43062]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/shared/hwdb-util.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
-index b42681a289..5386b4e9f4 100644
---- a/src/shared/hwdb-util.c
-+++ b/src/shared/hwdb-util.c
-@@ -632,9 +632,11 @@ int hwdb_update(const char *root, const char *hwdb_bi=
n_dir, bool strict, bool co
-=20
-         FOREACH_ARRAY(i, files, n_files) {
-                 ConfFile *c =3D *i;
-+                char *path_in_root;
-=20
-                 log_debug("Reading file \"%s\" -> \"%s\"", c->original_pa=
th, c->resolved_path);
--                RET_GATHER(ret, import_file(trie, c->fd, c->original_path=
, file_priority++, compat));
-+                path_in_root =3D path_startswith_full(c->original_path, e=
mpty_to_root(root), PATH_STARTSWITH_RETURN_LEADING_SLASH);
-+                RET_GATHER(ret, import_file(trie, c->fd, path_in_root, fi=
le_priority++, compat));
-         }
-=20
-         strbuf_complete(trie->strings);
---=20
-2.43.0
-
diff --git a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-=
guessing-without-EFI.patch b/meta/recipes-core/systemd/systemd/0004-tpm2-ut=
il-fix-PCR-bank-guessing-without-EFI.patch
deleted file mode 100644
index c590b01cd3..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessin=
g-without-EFI.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3cef11c710e95bb5f891181e9b2a6d8f174712c3 Mon Sep 17 00:00:00 2001
-From: Patrick Wicki <patrick.wicki@subset.ch>
-Date: Fri, 20 Mar 2026 15:56:56 +0100
-Subject: [PATCH] tpm2-util: fix PCR bank guessing without EFI
-
-Since 7643e4a89 efi_get_active_pcr_banks() is used to determine the
-active PCR banks. Without EFI support, this returns -EOPNOTSUPP. This in
-turns leads to cryptenroll and cryptsetup attach failures unless the PCR
-bank is explicitly set, i.e.
-
-$ systemd-cryptenroll $LUKS_PART --tpm2-device=3Dauto --tpm2-pcrs=3D'7'
-[...]
-Could not read pcr values: Operation not supported
-
-But it works fine with --tpm2-pcrs=3D'7:sha256'.
-
-Similarly, unsealing during cryptsetup attach also fails if the bank
-needs to be determined:
-
-Failed to unseal secret using TPM2: Operation not supported
-
-Catch the -EOPNOTSUPP and fallback to the guessing strategy.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41231]
-
-Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
----
- src/shared/tpm2-util.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/shared/tpm2-util.c b/src/shared/tpm2-util.c
-index cf11b50695..c0590fe575 100644
---- a/src/shared/tpm2-util.c
-+++ b/src/shared/tpm2-util.c
-@@ -2702,11 +2702,11 @@ int tpm2_get_best_pcr_bank(
-         uint32_t efi_banks;
-         r =3D efi_get_active_pcr_banks(&efi_banks);
-         if (r < 0) {
--                if (r !=3D -ENOENT)
-+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
-                         return r;
-=20
-                 /* If variable is not set use guesswork below */
--                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable, we have to guess the used PCR banks.");
-+                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable or EFI support is unavailable, we have to guess the used=
 PCR banks.");
-         } else if (efi_banks =3D=3D UINT32_MAX)
-                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks E=
FI variable to indicate that the GetActivePcrBanks() API is not available i=
n the firmware. We have to guess the used PCR banks.");
-         else {
-@@ -2811,11 +2811,11 @@ int tpm2_get_good_pcr_banks(
-         uint32_t efi_banks;
-         r =3D efi_get_active_pcr_banks(&efi_banks);
-         if (r < 0) {
--                if (r !=3D -ENOENT)
-+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
-                         return r;
-=20
-                 /* If the variable is not set we have to guess via the co=
de below */
--                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable, we have to guess the used PCR banks.");
-+                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable or EFI support is unavailable, we have to guess the used=
 PCR banks.");
-         } else if (efi_banks =3D=3D UINT32_MAX)
-                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks E=
FI variable to indicate that the GetActivePcrBanks() API is not available i=
n the firmware. We have to guess the used PCR banks.");
-         else {
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.10.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_259.5.bb
rename to meta/recipes-core/systemd/systemd_259.10.bb
index 32fc04352f..95032bf13f 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.10.bb
@@ -38,8 +38,6 @@ SRC_URI +=3D " \
            file://0003-Do-not-create-var-log-README.patch \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
-           file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
-           file://0001-Revert-resolve-refuse-traffic-from-the-local-host-o=
nly.patch \
            "
=20
 PAM_PLUGINS =3D " \
