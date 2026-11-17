Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16008.1794916312290085460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=y9USmQyw;
 spf=pass (domain: est.tech, ip: 52.101.72.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pp7X/kkaQ39HwUFYQQyR1QAcHDgZltflm4ZagtwP+sp1Pq4QYjMoMgau1S/AyJsMM8vlMYQA6HguDYqXarkJAgeKPEkDbC91rhrXW+ogdUfFjiDhZraw8GeGZz/5HHE92nfX8llBzu5sttIlT/0FEfT/CJvZVDLiP6JBBA1E3ktsFLHl9m3TUDsC0IksXcDDpNZ/RQ8FuwLnvs1q8QNO06iy1Zit4gY0WeHlW8xlZFu+PohKzaSBVwUhxhHtBCwq9WCNRRuNto4VfDi3vkYSpCMr+49QkgLVmcFrjx6Le1b3fVXBuIEwF7nTj1eyqdax74SebQ/7uiR/hActrFz/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OJScWyy5aZ9MLJXkjlL2ARmqSHrADYOecL15xWbDp0=;
 b=fHgrpwWJXjqq/G+kxYPzC+pzMqnlEui3blgkvVn5OdUEC1GkFqg3IHQ8AmEJPpN3dRiLYz+UUDrUiFBsB/vj5TT4xFIA8uKRDDhRB9/n3NfuUwKjpc0kt1rFlf2AjT4h+bYrxGj/pR6L2ib6zJ1g6wFYQJGJ3aPoubteuM0arUCRQFuP2gE3CAfv4pDRg3PO1y3f5PIqvl2/X1jtARISEA8gF6Icfoz40+653XBE0bqX2rcPlgNgXR/v9z1HnXxqcjv8cVTe9A5WHOhLeCjbx/UNJ/m1FLK8UA0E3N7lBhp7XMcjcAXIA3AYYhGAJpc06WXLkUv1LeSyIMYV3OBh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OJScWyy5aZ9MLJXkjlL2ARmqSHrADYOecL15xWbDp0=;
 b=y9USmQywe09X1rsTzg/8YDbcT7zIRVg1rptUU6L4VedXBMwTUUdnbA5Mh4ducCt/PyWVfyAsYqWR2laaAWDFzUqIv0HfbJWOwDP+xdrEEQhNCF42ruYJuK/S+BnKlQsB7jz3H++cMsFtYeWsYMcZVvVOhrRIXboGH+EY3ssxrqnUfvIj5miewYhWe0Ss5gvRq2FdD/cEonv+jIJPLC5gNEMS6/R+tq1oqqad9wIn7GUkepWLPuJgD13s3umMnD5KVlcK80s28oYPviyQB/JU99xWocmqh6Es1IGEqkh0XuwzpOPAmkiLuqFIPv50rU6bNe+IRNxE4CIU0HTjuJz9fA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 8/8] systemd: Upgrade 259.5 -> 259.10
Date: Tue, 17 Nov 2026 12:51:26 +0100
Message-ID: <20261117115126.14374-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8585da-b7db-4ce3-0628-08df44a124e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|3023799007|5023799004|260925022911599003|11063799006|260925021911599003|56012099006|260925021311599003|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: Wg2BrZ+BWdBL5CL/nygdiljIxiLa3x9UdCPv91Gz7mS2xLnbRHheEsE32IgXqlSN00WcMs/TnYuZ44uXuuio+7MfkzdujcNMFFMQhezLW8oaVlLCtDqZOQuOxQrcr45LxJnP5TaiuMazJ1LFRNTR9JgfqVqJGmFQRUpbumqWXyua9HXewWM5jAr3HGsEY/HeFTlnkMU66VUM+CfdM67X37doV4Pk5r9KqiuzNcMJ8qRdnPTdGf7WFynr8khr5tIlLoqckU+Bn2+QKz1qRAQFnOaMLFv5xJGWXJIBtwPQ2aOfDVm8jawsJz3c/1+mPspiN5S/YgJhFdU2lY2eALCwC1klyNc6vEqymAH7a/Vc+OkQpJgL0xMLqtgzmIsMCbUEW8dWZvY/5Aac6LVhvYunMK8LbBGqo6XRFgYqVEWin65BqvoBPyhGMcNuXal7BclEzS3b1N045S4n4brbfy1phfei5vlFFlsINNAMbMQQKlANVvw+zZl8tixNLcMethsfcke0gxLB9OXLyxEz5sGdZucS33m90EmY5/deABHw9cAj26+lprZsvZozore9v5E9y3uxVPvKLy/lNqE2NCQUWLoqkuQCotl8lV5OxQaxQMrrjavydRQ5RPK7/oPO1b+l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(3023799007)(5023799004)(260925022911599003)(11063799006)(260925021911599003)(56012099006)(260925021311599003)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021135927099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bt0o1Kb4YL4r/5B/Uie45BSGq+nhpvCR3sr3aenCTpEkKb7xQsyx3UAM6X11?=
 =?us-ascii?Q?JWwBXaoMggAdwZzVb3u3nhWaiuBOwxxAFPuZJ8pkT8Qmng/CSZKAHIQGfXEo?=
 =?us-ascii?Q?3Kbb9LhKYL8X+jNMYnb7I1hcEERW/I6cZMDGVvDVyN15d6f0eDQSkp/tHpSU?=
 =?us-ascii?Q?Q6ixJTJHwXIfQvkQOcAtWXlMF18SHed4A0JHgngoEBeEoJBxo+TIa2ZEQj+6?=
 =?us-ascii?Q?46RZ7JA0bKMV219Wdf/Pv7V2Qas9I20zdoaFWltE6wCJgCPPSlKqgJjUjbdJ?=
 =?us-ascii?Q?RDviXxq2/Hu7IC9gk1vP1OGMKAmjlDZU2L7z7jaFHw5O8ygKGlG8wi+SCtyf?=
 =?us-ascii?Q?eYdqYP9wN/CZdCZsg7Lgw6MdaGLeb5Xm28F6zmwSLpmNXXDYfPHXPidF9TvY?=
 =?us-ascii?Q?lKqS+m6ejKvqKW8aPvDG8BGjfnU8sM6sjOOpFOW0QyeK9+gJjwNn8xzePBAp?=
 =?us-ascii?Q?zY2gZczgG0AUr4I9CPrabpFS2V1NV+05q01dPZySIPDxo6g9Qe80U2F72tQ+?=
 =?us-ascii?Q?NirO0Gax3b2RSUoUHHQQSHnWbjEdqW+hAfoq67wQn/0xoA61B7y2fagQmhbW?=
 =?us-ascii?Q?kVM1kdzp4RwDezXkte/tOAR0jkGMUEB6Fec5/ofYnDd7/rv0d5nhmCB1yTIY?=
 =?us-ascii?Q?+uomnXp8cvUQR3P9jYD6oKqsdl8Cs//e6eNq/O5baU/rtAxasQg/FNfhBVp1?=
 =?us-ascii?Q?wzunaWwVSwICQQjQefwy5Z+QTrwPIfXh/owSeiNsiFi5HLeYr0CJf5tM0zJE?=
 =?us-ascii?Q?TL/qKU5CxJhNq2ODB3x0UzRRtdnCFh//hW94RlDiW/2Q2mKKikEXKeDRZAQo?=
 =?us-ascii?Q?DoRWEk19tPVtHhhueGYpjFQDSZJfyNrhpQsrZozZDTsO1lKjxTPBJ6p5eJHN?=
 =?us-ascii?Q?ouU+oLfcZ/YEJ8iTC5ZDNHmFgfs/MgKQgTLpCBJXSsr1XDL3zsf4YQAUFCJG?=
 =?us-ascii?Q?OCJdgCr6Ghw9Ggyy8uwJctzVBxpyu5hjtngLKJCXJXFS1irJIx/bn/jDusYp?=
 =?us-ascii?Q?1NbHWBYX4dsk3W0VCwEPLTNHke7BWkzK18aSa294qKHt7PeJF0jpUDGkwMY8?=
 =?us-ascii?Q?LfuVIytLgsgvKLeKktch4q2Lb0rE0r8jM5lel5mxYJ9RehrjWVH1ciPtbrtY?=
 =?us-ascii?Q?WXEnmnEVsPwwZb9zdT4MhUHDKVg+T08K9K1S4u+fPovl5DZdnVGfO9ObfSdx?=
 =?us-ascii?Q?48uxcmFk2jC3Y/JNdI2OVtQmUCL0z0lpLwNrribwEriT5GQZqWP7G+M4Weja?=
 =?us-ascii?Q?rBTn2zm21C0suWhI3QFmBQU+lvhzAAC1shLhFjMbibpViJmLi4W4LAijkfCY?=
 =?us-ascii?Q?jTB/obRuS3H3eYsnUSJIFk6gP+DOy4tdeAJCUo4xSWZ9eSd7isaiklypH3zg?=
 =?us-ascii?Q?GK/25DKrUgvmVTEFHx6k/VjoQ68CReRtYNeGKMtPNrz7Uj3wXPhpg9ilZ80U?=
 =?us-ascii?Q?PZkk77Fztl9m+NCPj4+fwcChWxpgfBtmJsew4SMER6w3T2RUOIYm7lRKQzc6?=
 =?us-ascii?Q?D/jKuIVdj3YdC/NahxXAVKaURmcNhZiu57uB8+RRGm/GTGQMwPCmX+lK4cw3?=
 =?us-ascii?Q?XpD7HfxG+29YwHP9OBsLghl+oDRhRGQRBxJ1LR+eUURlUTT/lE7PgrWOgwns?=
 =?us-ascii?Q?8tesbXGnnU5sXMoHDJ66W4pQzcNcBnuXmQJbDFcHdPFwZx7wi9dZDUltp1Zd?=
 =?us-ascii?Q?Ny/r139cOHG5KjL1IyvP19wzfWAwFVWSVYG5UHuKSr7qaD71KoXneVywQybv?=
 =?us-ascii?Q?lmbFVwId5Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8585da-b7db-4ce3-0628-08df44a124e8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:41.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7XFEyR2HXrhqA1UR8AO2/wXlJF9I9nya8uPfK+V4TqJiC6QziEnTNP54oRBYmVvcEBWKAxhF/64dn1+qwMk+Jxd3u1ME5dKl87hs7WZYoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250432
Content-Type: text/plain; charset="utf-8"

* Stable v259 release uplift
* CompareLog: https://github.com/systemd/systemd/compare/v259.5...v259.10
* Drop below patches which are part of upstream
  0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
  0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch
* Also drop 0001-hwdb-strip-the-root-from-filenames-when-generating-h.patch=
:
  it was added for systemd-systemctl-native on 259.5, but the upstream fix
  (a9397de9d2) is already part of v259.8+, so it is redundant on 259.10.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...259.5.bb =3D> systemd-boot-native_259.10.bb} |  0
 ...d-boot_259.5.bb =3D> systemd-boot_259.10.bb} |  0
 ....bb =3D> systemd-systemctl-native_259.10.bb} |  2 -
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
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D> s=
ystemd-systemctl-native_259.10.bb} (95%)
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
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_259.10.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_259.10.bb
index 34f64e2eb9..e348966230 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.10.bb
@@ -4,8 +4,6 @@ SUMMARY =3D "Systemctl executable from systemd"
=20
 require systemd.inc
=20
-SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-generati=
ng-h.patch"
-
 DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
=20
 inherit pkgconfig meson native
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
index 8080377cf5..a6a86a5b81 100644
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
