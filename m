Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16425.1793098893793491476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jCt8FO4s;
 spf=pass (domain: est.tech, ip: 40.107.130.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsGK7x5YEinQkKYqr7rIGPmEg3rONzGfOHolSeGWY455uAdQSKg2GYEfnp1pMW1MDfKGGaC7hBu/jZU5hfGo1ZTfJ3DgAqJ0uPgzWFic7es68cPKQGERNx1UFmazQjI5otuT0qjpWswaon8W9EWYXWN3EGGNatGH0aDGJb5E9LH22A8YV0Mitlyw0IGiH80YhJ87QS6hr+K6wFZAQbd+Wh7dgFhJ1mRIeaQtG0BNNb5LIOuyHJMpsX0DSZmbYQSfKpDOv0piRYVgzPU93qSWCfSlQsZO5hOq943AmH3pTZVgsJlYAEHmB+fkuKOVQyVbRjKiI2D34lp3ARJhWhSnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ezx2mgme7TJ8kJjB6BAJL8/vukm9GLaKPYVjh7R4SQ=;
 b=lEOGCTg58A4jKaenTcQnhbQLnipEqh3V33OTuA0UjdDDMQzA1GbvkXuvmU0AqnzGQccivp9Kfml6Q1dq/Hip6wsXzpNswSJIqTZ0/qyj9U9ufOhwjLd7qRrGz6F2tD3zIPCKyZ03CiAGGZEbfoodQRWhadCLyYxwySnyamZNjt9uMKUB1Aqh6A5zuPA2pcGrAjqeipdkY6FoEdH+Hf5fifRYbZDKnI7SHONcz194JViMJUtE0WG+WpN3lQhLWJCLqe7K0YJvR4dMmM6f+RXm3JJwPMz8EzYB9qERTX81QOtZraT17nO/Tps96nXAxenAZfCzXyABxvGXH/jtGjPWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ezx2mgme7TJ8kJjB6BAJL8/vukm9GLaKPYVjh7R4SQ=;
 b=jCt8FO4sWkUxSd5xVs99FW4Al1hM8snp4fT0phkEjIeV4Lu1jFPMZOlRLSgrLLQ+WP279qVzVzDRGwsgAecmnI7F66AFwBT6WUR7wOhO4Ya10OPpc0xdOBnXG7w6vV35UCjZSMTiRecWmIU4dzxVFNgf3l0GCFPxcbeT/ZVdfAwKv4umfpOtGIYi6/yung9kIHds/BztLkJ5NG1oyq8Te3/7UmBIlmMZc5lHpSRbxaR+afgQqYrQfRPXsQpb/ei0Vqcu5scpKKNvr/zPVtj+ljAKix4cBNnhR3V0qunL75ukyh1F+zkiWVLMGevaPxG+PNzEw2awy8dDIi507LSY4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB1189.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:28a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 11:01:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 11:01:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] systemd: Upgrade 259.5 -> 259.10
Date: Tue, 27 Oct 2026 12:01:26 +0100
Message-ID: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PAZP264CA0179.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::27) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB1189:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f35f8f3-8917-4fd4-4fcf-08df3419a692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|11063799006|5023799004|56012099006|261026121527099003|261021123027099003|261021121427099003|261021135927099003|261022075727099003|261009223027099003|261022105027099003|260925022911599003|10067099003|260925021911599003|260925021311599003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: ULVacVQbGKgM4hzbPXu8CjkQ8MirqL7JXkZ1vuGfYd2CovSxydQViD4aZIMJv+0cg+YOxV3w4uNzMhGkrMMgmq8orQwnxyMyZT41ZOp03Tz0+hf5eV3Kjb3uPoRAD8ZW8KceLPh+nXj2hq9CmiCztAzmP+r/4HtJ2nJjugMh8K/pB8g82DtM+6HpsroJhyV7PnGveNDBb+xDO8DyMREB/+3/1DOAog8XUY0sOZCG3I/AQWM/t6wH5woPYZJSLWibs9Rs7RY7op5w5sMtSv/BRy+suKHGZayQ7eEtLtfWRcOkBSM3etAj+No54Yg20/JQEnCc3li5V1jDb/Y4JJ08Pvd6CzULgYZkRD+68X3R0dJLcKVNtVA7ekH0zcLbo7nVtI+rYRSrz6T0+xndYO4eA1DKYJ4cd17n0DDyLbYR7kvSqHO1NW5Rsly1MlKGjsnrzk3XpAwmhmznolbk7GDswCbxa+vvLOxZ3MmtVGaxtA8FAvOjSUUJEpX+nDnTWI9EM38MkbRXAdJGbCgubSQ54ve0gWMtQyFRUp1yFw09UNWHbIo02VJz43Yx9UKub3MbOEodgxVpxkg0Vdd5a804hevSlz1ZU1UO7SujiMi4isRW88ADRkwjVDnCulNB6qxF3voRfgaywt8egGnsD3zDP4HKwpz/EPz1qnZ2A1zaVDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022075727099003)(261009223027099003)(261022105027099003)(260925022911599003)(10067099003)(260925021911599003)(260925021311599003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F/eAHKFU7J9G8HfW8So2YhfvuuG2JEnWv/Qz1rGWUyXlQbcKxpLERZ530jLc?=
 =?us-ascii?Q?wUBUtCBop+2QPfQSrpDuOv9JePwDcmDAuuH4cs5pd/R5t796FNLw/fh4Zg3k?=
 =?us-ascii?Q?C8uDe21HIUo5HEbvoqFFjONEtvrGwpk8DyxBBgoJGqodkD/NqUTWF30gdg8h?=
 =?us-ascii?Q?eYhvN7uS9Tfucxy/MHRAu9mX8ubSEip7F/L5ooF9ifYt9rOshNDwXDFYshhP?=
 =?us-ascii?Q?P0g0frd50cgPuGqNtdwad4PfFs8VPpmIeeGXvZI+nsnmUinHEDJDurm2m2KS?=
 =?us-ascii?Q?l5thgQmQvL8sKHhRgQEZMb6uSDpd2QhJuONZGVRdBynaEsOpEYb4NC/2njb4?=
 =?us-ascii?Q?9aCjnhC06yZNCm1SIag3nDtbz54cpNPFmRL1iS2Vbm8KMX8W7Amt9q7hC/32?=
 =?us-ascii?Q?wBGhZqFhXKQVux8ljBo2PhJJwgGxJ9XnEcfYrXIb+7+7dC+Sfsr4UHqYn9VT?=
 =?us-ascii?Q?UPC7gHZhQ7hSUxQFiZ/1w3VQfVC+cNFgVdlZpjv1NIO1jzSQdvFkKCUhXouo?=
 =?us-ascii?Q?yRKXE7zFMqINxJnBPHFy8wwf4J+yhH8o2PNEZ9WT3Red+hrnTg6zeXpkb1C3?=
 =?us-ascii?Q?xOeLCABNXzaWKuq1UbF3Kef6QjsKTWlXcvOwJ4GjQjKOtd6MNjc1XX+GIAZB?=
 =?us-ascii?Q?U6VI9pZGkhuisCGZ/bKUes18j0JKVQ/xJu1M3UeGgIT5AOhJ2eyxpv9x6hh0?=
 =?us-ascii?Q?kvyU+PcPoTdOyUb3AC/81YC0Ou8Z0kn1qpFmpj/k/+9IgufUv3SqTMtglRD0?=
 =?us-ascii?Q?GY3+WGlUHVxt/KX+Ct7J5r1JQuYkS/D/Is8lRHWu0dmA4/vswiP5fMPYfCiR?=
 =?us-ascii?Q?eCDweuwyU7dS0rs2H6XF8cDZzC/cdk3zTdDj8waQgi8a4pR0rzGthAqbQJXm?=
 =?us-ascii?Q?UGsHlbtTaNXsrteW6jQNZdDeFmgQUFo3++p7Txo79ABpYYvm3cSmvmiNYpTn?=
 =?us-ascii?Q?x9XpRI47fuuOb9Wn2KyOzn+TX/S4+cLtrp6Ur1LM1itjaKVPSek/ithLqI6z?=
 =?us-ascii?Q?vp0AdCQgE/3wzub7o78N93mR7BtWSsSYJMkUdKnbITdDUWuDN4bEDNYnIzev?=
 =?us-ascii?Q?Q9vFeFmpX1oIG00iDzcQA0gfzZhS1VisaisJh4rsSiF/zZ9xZnMvkV9XXfqm?=
 =?us-ascii?Q?5/ZlWcJJFXDzncTa6SbSFgyOBZxwPsIvHHMHqOukjhDUwlD6ecNUiSntMWq7?=
 =?us-ascii?Q?+qw5gM+N0984Kqf0/S4EkeMozy7wL+Z3e5Mx+mfHCq7PGiTaJTM4IgUORoNj?=
 =?us-ascii?Q?fJnXS8iOAJQFzld7ol0zO2gy5Swo/2G3Mc2INgMItvdO2uc1MVrvx4MrzhJe?=
 =?us-ascii?Q?P25mR09XT3CqDnCTmWKqbGWBCKSxKPpyf2ih37/+OgSKG6EiXWNedhm1CMqW?=
 =?us-ascii?Q?O55kavr7n1s8JeTAwZNxuH6iiqaaIUE5O9B7fK+Vf2kiggCM8scucgyPt06e?=
 =?us-ascii?Q?W6TjY6iv2LxqsH80EVdvEo9BJ0fqya1WaiTr+OwV+EqxA8yHaFoBweHXLQvG?=
 =?us-ascii?Q?uKJRHTiADrv3QgUNWMDR/XCZV5xBQkWcgw8VRG8mjJs5iESUjv7fGOtLLZwo?=
 =?us-ascii?Q?IujykhIK3XwG++4rugWUu0lzpEH8MNvt5dh78FSPvQtIsd6mCAz7SUk7xIcp?=
 =?us-ascii?Q?s6THnPYZ7qfOsCQQUM4559AvL25mQGmB9SjX/OyVTpmmdvxeOWZB9nX4R5Iw?=
 =?us-ascii?Q?+hDFiJdP8X/E8mg4Jx9KetK9BQ0oJ5J3spjZUrV4pOi10MArtotrp7SLy4V7?=
 =?us-ascii?Q?Yu5Wxv4eHQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f35f8f3-8917-4fd4-4fcf-08df3419a692
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 11:01:28.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8XgP2CJw02ocDfkeSPrKkqYs3uBwNPVO8sfegO7NuwoGa+ukvRv5pguYmIrYSWZX4nHmM53c20gszy10gJuznTXRxWXmge4KcLXjrubdUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248726
Content-Type: text/plain; charset="utf-8"

* Stable v259 release uplift
* CompareLog: https://github.com/systemd/systemd/compare/v259.5...v259.10
* Drop below patches which are part of upstream
  0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch, 0004-t=
pm2-util-fix-PCR-bank-guessing-without-EFI.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...259.5.bb =3D> systemd-boot-native_259.10.bb} |  0
 ...d-boot_259.5.bb =3D> systemd-boot_259.10.bb} |  0
 ....bb =3D> systemd-systemctl-native_259.10.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...use-traffic-from-the-local-host-only.patch | 61 ------------------
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 -------------------
 .../{systemd_259.5.bb =3D> systemd_259.10.bb}   |  2 -
 7 files changed, 1 insertion(+), 126 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_259.10.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
259.10.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D> s=
ystemd-systemctl-native_259.10.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-r=
efuse-traffic-from-the-local-host-only.patch
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
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_259.10.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_259.10.bb
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
index e924884bf9..f7c16a045d 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.10.bb
@@ -34,8 +34,6 @@ SRC_URI +=3D " \
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
