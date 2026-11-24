Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24304.1795540710364989386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=m6HWnypp;
 spf=pass (domain: est.tech, ip: 52.101.72.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVcZu6i80yA15W9JlFbukhw6Rf+M2G8EpMpDekZ6F2x5roCfiscHvVqwbYYomjcXSB+iqAjS9eUn/uDmCNNXuf1WiHJ34EjcrQzQVAIzD8EIefubYB4vRSgHy+unv2Ftl+GvAtvR89AU8+6X65ucrdEjf2TEbe4CYN7L3abP7jBFWTKFk298uSlGyGCWmQKxJxVkSSvSAy6DC+k/KsTpf1agnL+QKTzPhLDVJnAkPCM4tQ9dNBbWE/ArErnDWPs1I9EoCkNFboq52CvkKzY90e0WcnWNNaNIFDkzld/Gby9FckWLC4Ti2ODaNnrNuet/w4FWm6gt5ZrJcFL1AePyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg6fXLJUhkUs4X3SpMY2OHtiSSM2c9NNRb5MwbDYPmo=;
 b=G1w/1yytFStDWbEo84wWt2L+D33Y4nU8Mh9yfNB8zOJYNRnVtcnpCMpD9z9WopwtYnBF0nitqK1qR3gNDvLHQz4a5iqmX+X86VL/uxEiPgj0yy+oC9aa+ls1Q6zngoR/XDdHZeY0mI9vS8gAEgc/lKCqPnWdyaL3rDRnNEy0SV1POvwO1dZvbmz9sTAjSXS1a5bSA/Os84ZEkqDddCLub2R/6p3/AFic8NoxjGF++utIH5uRKjSWPOuRcSefFAzBo6SKzYbMZ3WgEx78d2ci/uSUa+O8stm/JAwLfqcetmjdabwFVgEzzmRWlJadEj12dxQxYfAXgFpfpagH/OQuXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg6fXLJUhkUs4X3SpMY2OHtiSSM2c9NNRb5MwbDYPmo=;
 b=m6HWnypptwJXK/1x+3X60Wn/ni9A6CsceRNPCdo+sSRIXoSSwvgwoUBu/8yHL3mzYmAQWP0hKHSeIQK/BMUzgv0V61fZRBv4Um+Fxz2xb1aibWH5MyE2WKv8+Ja8uT8wepahR0RfXR4S3jiyUgImZg4/ilYN1PzEnJO4yGcnXIC7F9mwGEmM1A32XpOnWKG1RaPOO0QpLhJLFg46PEeq/un6AxJu3kb2xsZ6LIZwg/qgEf10k355IpTJAlpuK6vVWmZSZUAzxOQtugtB7kuj3elLJ3kbsSSC5EY8vi74VcH6D0LyyWjRkZ2/z/s3gniwHqeW7cT3No5vtuM93O6SjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] nfs-utils: upgrade 3.1.1 -> 3.2.1
Date: Tue, 24 Nov 2026 18:18:07 +0100
Message-ID: <20261124171807.74394-12-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0215.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf6e76f-117f-457e-db87-08df4a4ef492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022075727099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: I0B5msCScH3SiEt75ecCWCJiVmRBkIXp84eXm6DU2vntDjDi90JtVIMFtircnDFhynrIl5QWJIDePAy7p8yZ+xRjmKRf87Kn55+SgTPFjWu6LTceFu4hwsVIlsMSBKB9Y0Y4GxcR+c6AM/14ZVeTOo4+eX0qrgpuSiFfB+nl1OQecLYKNrxXw6zOCe7wlRhDN2ttlfBK9j7Cm1AN4NVW7nPy59cU25MNPvkNY+IEaDFCIM1YKN/l+xacxvpHFFqSgVuPv00FfE4GMuVRbRJNZCtIz6UYdyUH2Cz+N32+M3EOUB76bDCDiJROJxabIcptPS6tvZDMOAITmBX3YJ3hFBqs4T5PEGdtb3Cflo7zuj9sxLYHnlV/WqwiZLcPe4KnInL7vtPvhw7/c3hxrCu4pgMtUcuc/dyxX4z+dsbgZ1QQLqbUTWvDyyDPISPzT7ehMoUB6dcqr2OHRhRePACHmX1MLyb97vDjZd1EBU4MBgvkJGtheFjzjVZhkDrM74Z5WRl8UzlefvUkVeHTpi/Qh8nlsKzimes4RNizbtUg+D6M/9g+2NJwUQPoqWqXv0w+nNCukO5d6NkSZGSVmHvYxHxYFuz3z7IpVLp3YFKyI7vXQiWlcX+FEQNzBcURvzmp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uRtnIIS7cCXv71oLM7QfxnJIg6FPBs98cQWofHzDxj97USUeBT+ZVPfyK7nC?=
 =?us-ascii?Q?4lsWr2zlQkvkS0K5onUebz9b/bDrbnlrfHBqx5pFs6Re3ri5qk+F1EeOAWSE?=
 =?us-ascii?Q?9hrCr5+2pI4GQJ5xUgotK3aKdGHKI+jF/680zTyMSfX4HBRqFXqEFprupU/S?=
 =?us-ascii?Q?LoTNJZ8Vt5QG3tv3vSZNP6n3IfGE4rOhsprRmM/DIuMkedUKYqfcIw+xXxg9?=
 =?us-ascii?Q?yvMLRqepR7KGttQQGuZ/Toj8drc8k83rkoy78Mj33DQnkLJULTnQDY4UfCPZ?=
 =?us-ascii?Q?LHpR267/4wvEVrUx4QJfUc3UmsGoYoLCbCy3n6SVTKvRYhJxESqWxCK5OT1v?=
 =?us-ascii?Q?K30zBwsHIjTwJqBBu6eVrzFtlcVVOp0jqtkY1peEV7o0ulJ6lwFYWgAFG1Vv?=
 =?us-ascii?Q?oE85QRF/k2oUM3F2QyrXBe/sW6PFJnmg1R2truJAvwlHxCJozf0feUIpbyad?=
 =?us-ascii?Q?XMj3aH1JJsYsHkhuJGWMPYhTIA/IPvZhjmbeaX4WjKotyATXv4U7PLItTgzK?=
 =?us-ascii?Q?rcy5WHnFm8zhXQdsaCz28V9KCEU7h+X/XxYVXLZX5z6iPvKap7FXfoDFB3no?=
 =?us-ascii?Q?TizWH9Rb49kAZrHVqk5ud9W6j4RNMkjTLI+nT966OsDzuCSPY4Nc60LEbgXc?=
 =?us-ascii?Q?plvPBy8v5+9haoNvkmuyoZKrlcP5tZFNWKVj6Aiw1zj5avWUV3IgF5u9gim8?=
 =?us-ascii?Q?E0E7kCCGpikuLCBfFOefnYJs0utvppK9vrAx7S/fKfcdML/4MjRvFurmlSu8?=
 =?us-ascii?Q?K1bvz4mtCKtKjXSEz4+pQpaRDYjDlhNz/vHINXwpIeXo+d3y0IhrounzFDli?=
 =?us-ascii?Q?xGtBbIJCczJeZvixgySe4CkOx1pjcmZtcWcDTPWrS/PM6V+R1z3aFPq97udj?=
 =?us-ascii?Q?AW+gdDVqAG5mrSvHnUpsO2OG3DAUUZ/ZrtQhS/Xzg20SKPdvZE3x9s2RMhAx?=
 =?us-ascii?Q?GN4lyu4sPBngURyncoDHVWhsX8sCV3uVSb27CYyPa8h56KHInEKEnuvgw4m6?=
 =?us-ascii?Q?pbWO84ZeRy3ksRyU2KM+oDq/ftmNaOi4xfmk8K5JPsnu/AX80xYLdE0ugsZK?=
 =?us-ascii?Q?ZRfwcRVRD6qR5NmvykgVlPaYoqVdWwKsIkYTE46G5PrH0VaOlzNqyTbD+Itt?=
 =?us-ascii?Q?n6gPM3WrPAv3pcaP47auibfg8vY8UcVU7mZmEHYxwtJ0pbC2POf0V6x8nHFk?=
 =?us-ascii?Q?8YkBQPptvsDsmLGQNFyO7e+bzMxX9Kd/bvslbpfUyrVI8xW5o/YYmj72l1Fr?=
 =?us-ascii?Q?OhnTT6RFrcAOZwJYdrY78sL2XehG2A6ECydXZih7/SaqXfbbLQ6n0dMQ9vqj?=
 =?us-ascii?Q?SSV9N26ut26a06F10m2DLxhwwU1Yf6ADCErHwCIUGMOJoCPqR3LBOJjO/fd5?=
 =?us-ascii?Q?zts4Lm4N6OeUMOztTURjAOnoY5FUhGJqOUFqDBQxBph1BEzce0JF7nbTB+1U?=
 =?us-ascii?Q?QMXGRxCa5cXVQfoiLz6OjDG/gBLw/0maQY3fEXq26OPUKjhJOk5lc94UyhFI?=
 =?us-ascii?Q?L3KZYkQIq1gKZGyhfUj0273srluGGV0LL1/1PKk2qOvg9ZPxttkDeVDGFCf2?=
 =?us-ascii?Q?z65WP+BLtUf2WcZrPUotMu72w7neq1Rl3IpDWwYvwCgJXE1cYeKKC9EMByDO?=
 =?us-ascii?Q?w86oh4Ylqy4kGo0JRf28y/HgShHgxDUB/ylp0q9hftLFTM9xSdGU9ZrSYErE?=
 =?us-ascii?Q?nstv2lTu7QOTqcFeD2xn7B+H3Jdq5+av8rEwQzYUBy9NLfPdox1/NHV12kll?=
 =?us-ascii?Q?qXS3tG0VSA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf6e76f-117f-457e-db87-08df4a4ef492
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:28.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXP1oWLaf47d/ly7GQTi0fkBavLS/rvSF057cFTSn8lb6pkJjqE/wRobtF8yGjfjCz/RyLWtQU4vbXIcq5R09NtsnkxC5G7hb0ADCdsIpSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251063
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://www.kernel.org/pub/linux/utils/nfs-utils/3.2.1/3.2.1-Cha=
ngelog

- 3.2.1 ships a new Python script, nfsd-iomode-advisor [1],  Package it sep=
arately
  with a python3-core dependency, like rpcctl, so the main package doesn't =
pull in Python.

[1] https://git.linux-nfs.org/cgit/steved/nfs-utils.git/commit/?id=3D3282da=
1d50c43f14fb765584fd7d1cf649af300e

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../nfs-utils/0004-Use-nogroup-for-nobody-group.patch      | 2 +-
 .../nfs-utils/0005-find-OE-provided-Kerberos.patch         | 2 +-
 .../nfs-utils/{nfs-utils_3.1.1.bb =3D> nfs-utils_3.2.1.bb}   | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_3.1.1.bb =3D> nfs-ut=
ils_3.2.1.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup=
-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
4-Use-nogroup-for-nobody-group.patch
index 1bc3fc832b..4264606ba9 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
@@ -1,4 +1,4 @@
-From f8407c33b26641c08ad76422ba2ff78214364b19 Mon Sep 17 00:00:00 2001
+From 82d21e18c40fc1f7a2869a5224a177eeaf70a887 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-pro=
vided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-f=
ind-OE-provided-Kerberos.patch
index e88608bd37..03ab710804 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
@@ -1,4 +1,4 @@
-From 43a992e7bb491fd6e7e50861c9eaf0c549e98293 Mon Sep 17 00:00:00 2001
+From d763f11e44f2d1b834fbcf3d805915b0a7dba720 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb
index 89a69ca72c..63d68d6376 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${=
PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
=20
-SRC_URI[sha256sum] =3D "7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd861=
6813d1390e84e0"
+SRC_URI[sha256sum] =3D "a54163d8dd589fc87048c6029011bda101a580c27770a37755=
8be2422a976afb"
=20
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nf=
sd module will
 # pull in the remainder of the dependencies.
@@ -67,7 +67,7 @@ PACKAGECONFIG[nfsv4] =3D "--enable-nfsv4 --enable-nfsdclt=
rack,--disable-nfsv4 --di
 PACKAGECONFIG[nfsdctl] =3D "--enable-nfsdctl,--disable-nfsdctl,libnl readl=
ine,"
 PACKAGECONFIG[systemd] =3D "--with-systemd=3D${systemd_unitdir}/system,--w=
ithout-systemd"
=20
-PACKAGES =3D+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
+PACKAGES =3D+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl ${PN}-iom=
ode-advisor"
=20
 CONFFILES:${PN}-client +=3D "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
@@ -111,6 +111,9 @@ RDEPENDS:${PN}-stats =3D "python3-core"
 FILES:${PN}-rpcctl =3D "${sbindir}/rpcctl"
 RDEPENDS:${PN}-rpcctl =3D "python3-core"
=20
+FILES:${PN}-iomode-advisor =3D "${sbindir}/nfsd-iomode-advisor"
+RDEPENDS:${PN}-iomode-advisor =3D "python3-core"
+
 FILES:${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.a"
=20
 FILES:${PN} +=3D "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_libd=
ir}/modprobe.d"
