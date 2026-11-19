Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15436.1795097621061115589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bD5wlA5j;
 spf=pass (domain: est.tech, ip: 52.101.65.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBmd/WW571WWcv+HS2X5NYWczXp0/RlQP4L8d5NJiaTZL6lhoCU3EW03rOjNy/i+swo+P8UaJjQXGsOPDW5oTOfWENA/GftwziqCJCQQhicngfEmxrK20UtXEu9GZisFZ/tebTQ+fvBW85h5I5qJbYtzaNvruwTYnuMewlKHjuo8M7c5Q2IiSSN9t/NVpR3ac+wsusekswsSCy5trWD6OXUlxAoqtPpwt5No8QnmrHvG8pY5fj0ZwQk8tILE9s2kFRXQvo+BKxPMbZL4hh1YO9/CdWO1OksPfOx9eG6Y/ujllcWdN5i4vcL9HmgSYHPqC2KcKnl/keuPGSyPl5FWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p57h5i/Gr8u0lLtMfr59bPLqv1UHr0arFt/1Q4xp8yw=;
 b=w/Lpar44wBHAKh/pWubLwdywSA9h2+FngXUs8dhjHLN7FMOugJl1A+nKAOnZND+q0V62stWwrcPcbBesz3EPSGwKjdjXNQKEHR6A53rYm4aF2eAF2+IPFMW+la75WsvmOeuXjhR+XUMhDsKbWt+FHBistdzmxlJcu0Beyw7EWszON8+Paf3IjoT8adc6AVDRyDLrnLFA6+lUpp7Am8bJON5OS7e9MWQJ3Q5SvQWTzrxKu9QOcerM2LwARnaYfYgvtdATTI/wGQGWkfxEzRIwuyD/rXjL1Yt+42KX0PgdHGJQliHk1vU/i29/W0AuTLs1KhVHzh4rTLdzpLaE58ZPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p57h5i/Gr8u0lLtMfr59bPLqv1UHr0arFt/1Q4xp8yw=;
 b=bD5wlA5jPxjTPl5sj6TnmXew506tvpLtLVo6qkPhRkgtCDDSY8uCC+3MEUD7Mw5GnJH1pl/Q1+RXZxcfEYR29MuVTDPDaPG4G8XSeRSVZ2ZG5Nb08HmeXzSRld2QQ1mDqbQufiQ3QBTWsLGqWvPj88t2cieihSMznaUpJapwwVWOTCgAl2YEkMbi3Iy1lyST7kf7DDni+TbvouCJNg61dS3kMD+NSYkeVkd/9NKcFvafJiL0aY0g3LcbRPZi4+HDL/SG+rybL3VDdaXwv4c30SRyWKUcNBrOFrYo9EeBaWGzdRpoMTEzFAXkCLoMt745glnDWMVd/QGdFnkn7MOAuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:35 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] Upgrades on 19th Nov and fixes
Date: Thu, 19 Nov 2026 15:13:26 +0100
Message-ID: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: b21372f6-22b0-49bd-bfb5-08df46474ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|261009221227099003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: Kc5FD838XOzsI7HGINRI97Z7cFpDiediZJh1o0qLl26SV90Hkbr8+3EW1REWQCGP4FAO6LS68uFUJNQdLs4VsVO+QY8D5/KdB6NvwapaoVP++mc0vtwHFRAR7Fb0NzxAAapIn6w2qZ+Bqjc3LtZXHWUQGZqlZUgOXzoMrwhtvfH5i8r6UBpRMzhELZjjlk6uVBkGiUQ6rFreoxI7vhGeFFomO4l9HMGg5vlB7jOWB6bA/HJkird9F8KldMhE0rAoTytqn1VC7c7S1tDyVC3U/+w9jGz0BPZ290DzaUEit3HseGOsnDMyssxCJ5vLw2OlU1O6fB7lIc2yrzqDza1LyTF6McApzIvU8nuZQVNyi5Jd7MtmHLE0Wy7imlyYANugc8D7wX2oZVFZ3Oq/zOXYj3lGtXS7OlGv7/pba+aunnGJjN09PkM9njg0y4RlDaYKw2vsqa2ubWasfcbOiTjcguj+Jq8DZJBUlsXajetBxrvcXNSRqQPB4YPZW/dVzRVpWE/oxXq5dvjleuiJa8zAYN+G1Fc9NGuMpF+jVXKXLsLl96O2sjBQ2Y/0Z6yHnq/7EEWEP1Z3ob3XO39Z30IDs/gmE8p/0+2lFGIHo//WktA9XLFnEKWzH5yFor75o9BiR6PtdxEnOtUEewzPVn3sPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009221227099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cxj50aIklM0qw6gRjdTOX3Mnqui+GrxmQ3N3s/Xo2BycPgwY9/+3Q15flKGe?=
 =?us-ascii?Q?gOHySD7jNCA6ViXVStnKKFv5jPb8kAn6BN5lYBuHntc7NfO78GI6csKzs/Nq?=
 =?us-ascii?Q?dVHpJNcGwtOQG1o5IMwtNS0B7g92Wo49sEYY8MfBcBdYv8bzjSGvere931Jp?=
 =?us-ascii?Q?iJ4/DXmYg/0bUGbkkSqksfKbN8cMMgB4MlECsUZXxh0r1np1ZBXaEqAyrXNI?=
 =?us-ascii?Q?ozBYvqVJuSR/7UOOrby1uzsN0HvWMTgiJ2qNlT7UQDt8DITh9o6rTx/gCk32?=
 =?us-ascii?Q?gaamauMQoP+eYOK07F7EkYzsuX5Snt3MC/7Qwpvnb4f1xag1ypXC6te5rWmm?=
 =?us-ascii?Q?hGUYjlJvg2KJZyk80VSaJZBckoxg+/cFGA4vYP0L27yk86866lFL+xL6SMjw?=
 =?us-ascii?Q?barSMmPqh+fDn9R4jBoaTBaZd41idAFoHQGqhyryPXFkM25lXAOcsQeCa4/y?=
 =?us-ascii?Q?UN7xs2mTLMIixo4L/ooV2xssAoKy9e9oyZkv83I8N32Co1SiJd5kfv7KNIGB?=
 =?us-ascii?Q?lLl06qcVuRED2S8HEfFCpT2O4R5cYuJ3GvuowLwy3HlBoasLNMArJRRaftAu?=
 =?us-ascii?Q?+mhST+07Do1ySly2+m6dhb0HZFV6kqu9WfKhd85aD1G/moanmusDa0sjGse+?=
 =?us-ascii?Q?eF10557sa4kwb/dQtSKXXyP2Ii79LeYvNrZKEqc4/xmyotbf0ZJIvtcMjqhQ?=
 =?us-ascii?Q?MSewdIHrrPA9ku6Cli0nalDFfdqCKppThAOtX5L2yztNQeAaGXGvZ2pYcDrf?=
 =?us-ascii?Q?3eWpdt86EHXxsB7TlDfpZrEA1AK3HQjZvPpnERHSxh8yniFBPzs1Z6drZDBs?=
 =?us-ascii?Q?zv9Ba+pMlaR/MkTcjy/TYdBbnOr+XWjHswlhKzWH2QBXFjjlCat/J7lb8s7n?=
 =?us-ascii?Q?qiZEZr05BTaGRXVA/JGP55HOu2RSb4qIy3zNd/TF+IoUyl4PNjPrF21UUAYA?=
 =?us-ascii?Q?VUULqZpKp+uWrkRMYT47nrI+GskezAUjr3Wrm8z1ELFJ2kFhVeuu8YJFAJO8?=
 =?us-ascii?Q?lj9MEq6bNQ9YSjyR+J4RgvlGZlP6m2HBFFWkviihph5dIJkyXgGyB8lew9SL?=
 =?us-ascii?Q?UNzIZeXQzoZqbysGEAgYVq0143Ve0vRZm/L6b3SamK7bjDyyQu4i2YSm5ePB?=
 =?us-ascii?Q?gfH0ZyKiw4l7dm8r/CL4GwJozToHTOtpeS8yA6xI1Avjg2ntDd6aSW0hlEXW?=
 =?us-ascii?Q?bENiH3wf+1yK8MUcrPXvZXJ9hyvmDaFyXLWIJri+AUd+Mx5R0JNYILTj9dle?=
 =?us-ascii?Q?6gFdf6+sHzNXEo3/i2iInCZX08eSSltcTarbW5WcW1LBXDknA5RZjYtBEqU7?=
 =?us-ascii?Q?vxtyEj+HRAzYMF5scRUJKvcdB6dSblQBe0lMuItl6KzrRauQhI8asU4qgMsN?=
 =?us-ascii?Q?Y3O3atBOYQk+CZF7ZE00uPdI+Ud7aIvhmQpQm8UVsdkBENduUTZq0bkHmiaU?=
 =?us-ascii?Q?pbbh2CYkzft87eV/96JaZmyTCZ+S0gmVPzO100NW+r5wKZT5oFpB75Psv1la?=
 =?us-ascii?Q?sfIwvEwZYvyBbw+MESMk3FaZ8qA4YG+Ll3vUatNYJa9OA2RJzVzW98GeIsOb?=
 =?us-ascii?Q?Gd3QA+w0/wrKfG+0Zk8GgGQ7TvwPHXwLjfc6FXfSXpP8e+lnlnbGmQLlq8aq?=
 =?us-ascii?Q?HFu9XDF0DMeCmkx91aumuBmrzmy01AspV0EIXTWNElaYnq5KJ7deVMBGYrCz?=
 =?us-ascii?Q?5DU/xGAXXozA/kaeGTX5aEgYYvkE5Kp7NXEYVR9zFUMOkveKKTNi7aTy9nk7?=
 =?us-ascii?Q?EaSLLs4jxg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b21372f6-22b0-49bd-bfb5-08df46474ca9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:35.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDRHcfFmKJMC1SruzmX5xQ9g/dxYTU4YEG796Ek8NCzzsIR6Mbxe2HQHgQV+jbK5boXPFyxsixPN7EDyC97kxNZoMFC3n+s1Hg6x555++aQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250672
Content-Type: text/plain; charset="utf-8"

Contains upgrades and fixes for dnf and webkitgtk

Jaipaul Cheernam (7):
  libfontenc: upgrade 1.1.9 -> 1.1.10
  libxfont2: upgrade 2.0.9 -> 2.0.10
  bind: upgrade 9.20.30 -> 9.20.31
  gnutls: Upgrade 3.8.13 -> 3.18.14
  webkitgtk: Upgrade 2.54.2 -> 2.54.3
  webkitgtk: Drop cairo from depends
  dnf: Do not hardcode /etc bash completion directory

 ...1-avoid-start-failure-with-bind-user.patch |  2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...d-V-and-start-log-hide-build-options.patch |  4 +--
 ...ching-for-json-headers-searches-sysr.patch |  4 +--
 .../recipes-connectivity/bind/bind/conf.patch |  2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |  2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  2 +-
 .../bind/{bind_9.20.30.bb =3D> bind_9.20.31.bb} |  2 +-
 ...rdcode-etc-bash-completion-directory.patch | 27 ++++++++++++++++
 meta/recipes-devtools/dnf/dnf_5.4.8.0.bb      |  1 +
 ...bfontenc_1.1.9.bb =3D> libfontenc_1.1.10.bb} |  2 +-
 ...libxfont2_2.0.9.bb =3D> libxfont2_2.0.10.bb} |  4 +--
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  2 +-
 ...spection.cmake-prefix-variables-obta.patch |  4 +--
 ...dGLib.cmake-do-not-set-include-dirs-.patch |  2 +-
 ...clude-stdatomic.h-from-C-translation.patch |  8 ++---
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |  2 +-
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/sys_futex.patch          |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |  2 +-
 ...ebkitgtk_2.54.2.bb =3D> webkitgtk_2.54.3.bb} |  3 +-
 ...ile-should-be-excuted-in-target-envi.patch |  6 ++--
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 ---------------
 ...ust-list-fault-fix-issues-in-linking.patch | 31 -------------------
 .../gnutls/gnutls/Add-ptest-support.patch     | 18 +++++------
 .../gnutls/gnutls/arm_eabi.patch              |  2 +-
 .../{gnutls_3.8.13.bb =3D> gnutls_3.8.14.bb}    | 16 +++++-----
 27 files changed, 75 insertions(+), 104 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.30.bb =3D> bind_9.20.31.b=
b} (97%)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-=
bash-completion-directory.patch
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.9.bb =3D> libfontenc=
_1.1.10.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.9.bb =3D> libxfont2_2=
.0.10.bb} (81%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.54.2.bb =3D> webkitgtk_2.54.3=
.bb} (98%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls=
-framents-link-to-gnulib.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-tr=
ust-list-fault-fix-issues-in-linking.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.13.bb =3D> gnutls_3.8.14.bb=
} (88%)

