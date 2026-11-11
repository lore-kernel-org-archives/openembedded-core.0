Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7335.1794396272438301399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=c0HeXOxu;
 spf=pass (domain: est.tech, ip: 40.107.162.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaItzd/q5IVtbFoBVWrLSES0a1sYTo3HwALUxETG0IkXKtwc7ihC28DLzo6dW7w0LUWQ3e5ol/6xK1FrVCFL21mmbl4S2cUdWK75PBmNb11Gqzo/jr1OuHHtkYjqq+WI1msn6sD9zDqHwinoBU8z2df5xkoiJ9mAwctq18VPRYPBweX8LZAsOE5iOwxLV6NDUr/xcGMUPbpix2pXWeUHCiyYNSRmrP1K51SOmkcxY67dpOXm6bKquYnDdajpZAuZiEBuxzN+87a0VuEWWdjFpy7mO85474xrzC/1K2ARp8vuPygImVlqMuJBPwBaP+wUreMSQL+zF2HaeBbWoKQS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8V8fhgLdZ+48n3Ok9iBAlnqknFQrucAS4+5OW0jI8I=;
 b=XumHEDxOSyitEXgnYY1VWH8lT8n9Myc2iONYHJhVre5atI4bMX2fnAqbd85dLHE6BdP2LTDH4t3qFiNn8GMt76KsbY9AQzPQTLXtOoLqA/eyWRWP4cZZKJNOAsJVlu/G7062COdJL6NVdcPfialx6aaSKTRZ0/+yHHz+HxaqGQaGXs39vHo7wUm9vteRhjRdxu3Xrrn5X1Rzv0vWFnW/oohGcYaGgwZQh2uLKz7EJDo7GchgjbWWNBqn+YGW/khlFtbPcfzXnUrgM6qsJ/rye9+JRLjr6PliTs2WwdimGnTtW9vLkJf/NDhiGf88xCqe3J34G+qyq5nTjOn8uEurKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8V8fhgLdZ+48n3Ok9iBAlnqknFQrucAS4+5OW0jI8I=;
 b=c0HeXOxuxB8WF5PWYE0vcvXBkydFOCE5kWV1iYrQyIeIbmdPsV3rbMgUuD9lbvby/bOBNSFU8W6liCizvoDdw8CBhFEPHyKqKBqGSLlQ3j6sSj9ZchTTxm99xFhdT+9TQrnt40OU+HCyiSe89FRu6OE+8R/nzrcWw7UiZBgrHiRBLKdTvUm9eMdUk3KFOmL1lBydc9XpXkurf75G7t85AlMXj0BXPqcDd7HaDDhyFi8UpPb2jvLXpjezUdQRyhwwnvUn/BDwed+/UBCCCldwLa4IgqXIJwhl3DYvU1gkbxwO2C8cL+S4uRO2Gubg/E7ZVZHkcKdEnphDuiP9qdEkhg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3204.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:24:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:24:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] git: upgrade 2.56.0 -> 2.56.1
Date: Wed, 11 Nov 2026 12:24:24 +0100
Message-ID: <20261111112426.85977-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
References: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3204:EE_
X-MS-Office365-Filtering-Correlation-Id: d45fbce7-24e5-4d8f-8e9d-08df3fe65c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261102123227099003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261022075727099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261102130727099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 5Ni40H0fw7AqoO/2CfSEg+RxI4sxtmewx4QGf6PK0/wWkK9Zhoq6i3AMXTAMW2+c6SylwQuFRcSJAn4lJrvSoLij1SPB8HqdeX9U24PRg1gkKFLYwuXVEM/N9mtuKlzuPO2NNWn93vnDJ83XbDlW2XTp8AKM6IXAMul5vZgI1vRtTWESjWCJOPDKspNQ0hXFDVGxXiFM5NdzB8f+GT1NeVOfG3aLGKX9h9wNEbne4CjEef1DLX0vFznBpOnv2TaUQ54CmYHDYKiNWij8wrrYJBbvw6DyFIOUmhhKOpQ9wq7NTMOJTHyJmhUp+YkWrobOSVdSW4/19ba3o0SrojXCg+9WxxEfgP0GsME9DVUVBlXnsnRT1JrAdV5WueLpzIKu+0erCXSNcIoyyy0VKPkM3E7pi5qoK0ebAq2UXefucE/n8ZvWP+47/IuCVxdZlK8R4P23QLyAiY+WmF/zQJ5ZbEuoBszyy+ryHxF+yKeWZ6Z+IhPOJdCpP9I9tmkICqnqexg5PZHPEJGWSGraxyaGmzGEe9Fof0Fawpl58w2nixsMR4YwQdqeMl8HjEi0ABgWeEEf7is2hYU4PyK2sl31ie+gcnYMDG/dFgEH37KZ4PVzwFmUfJFJrZhUAOa7gr3lzfnIJXDa4T8TeqVAkDOFpGBhNPLt5YmeWr/+UCZVA8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261102123227099003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261022075727099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261102130727099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zl2DbYvfLtUVa8+/vayHYTJwCOENJ9rXQ4GpiFczaS3+apaClmzkvdDpajAi?=
 =?us-ascii?Q?FUxvF2eDVnGDPMwy/YRDUu0aqbDNA1KU3AlE+2zTHckpLAXrd2e/WDtFzMnL?=
 =?us-ascii?Q?yYsn1NpXMhXXHJf+rld9DumMxEnyHV4fCbhPoecHhRWWjnlsJaqCvBtNKXkc?=
 =?us-ascii?Q?zGEFr//W6N1P6MCFxirfa+nASrpaEP6bGUOSmeJDWsfnpRRhyaHlhbe/spP4?=
 =?us-ascii?Q?0WYA0Abgaou0BKLHGpCPJxO7jv37dTzZfb6wUudF/5uUCzNsEtnJahaaADMh?=
 =?us-ascii?Q?ccld0PS/MRLLRps067WqsVpQ4YxdvK1183OfjTZOrt85/WrnJ9I8BkNJ65O6?=
 =?us-ascii?Q?RXCC70BnthifeVfLgwJgO0MnQX5+3AW29oCTwHInKcNwWQTWY8caakL8147Z?=
 =?us-ascii?Q?fsYyHHC8Ix7rMLeSUmXChvzQCiJWAeMSj3UffcGlBlJpcgjnaf6WZsBgndPc?=
 =?us-ascii?Q?eFV3rn+NGsuwZGZdED4SbjhuM/eBGaWkamoD9Mes2NyyZVtGfSnC+/woPXT0?=
 =?us-ascii?Q?7q44Tfm4q9LWVtTVU5U6/DoPO1KpLEMlizBMaJyhcBJYHCDRpfKgZWtE6EW3?=
 =?us-ascii?Q?kY9F8VvTzHf0slP8v+T/NzCN9VABXBo5NQv4XREcvrqQsltakJbspmIkChp5?=
 =?us-ascii?Q?8fjDB0PmHNpRdpwAfA5yGYfj0dUidrZSd8ciIW4tr1oN/J1qvWq/w4u9gfWY?=
 =?us-ascii?Q?cGmCVPb2vxhd2Rul5sUbjlrucLZr2SV4n/dGug1d6GCkzuQuVG//wTVp0nOU?=
 =?us-ascii?Q?TzQyykMzbjyaYsuUt8e5ZqC2EwWRPDP8oRojAsuQPgNIzdWkGvz8zGfSoWHi?=
 =?us-ascii?Q?BakHR9ws3S42aDEAZdVe/wK8OpmJrPmdodJTtsk8YS/8YKhRK8JJS6peK8aC?=
 =?us-ascii?Q?sar8X4L6yeW+Fsu/lIOeXbRgjTyXDumtqwTBNyfe8P2ej67jWV2oVd+JhQF3?=
 =?us-ascii?Q?AYZg/VWBMVB3VDP5hkzkJuvr5PBX2N9Y0AUwNT2cjEQ3s0f9+QugoenkO1xt?=
 =?us-ascii?Q?BMv3j820rCWQrMJB6N66h5ujwd+lbF8RCCvpIo5ekwU9qpouXDFU89Q5cxeh?=
 =?us-ascii?Q?seuw2mSIK8Zua8yZU7W2xyafu1XhwNjmTXQ0zYOsUuRZGUvToxWv8M+Q/+IC?=
 =?us-ascii?Q?BdXelPaYsOX37T65LzoAsYQwO8XSV/TCTlWyM9VB6RJwrTwdMoBsGU+AeQzZ?=
 =?us-ascii?Q?cITqKH9vPakZ5MLtBYHLMPEUW9qdK1LUh2OAkQnoii0i4VVGJduECrT77itI?=
 =?us-ascii?Q?7/kbd0RviaEMGRcdx2VlSuKRWcb9AkN+LUYoiyIaQM3f41OIHrY3K0CsuWOY?=
 =?us-ascii?Q?WG0DqfVNfch70CjW3JyDExXzCc3Eub79JTjl9X73VR0McbcUEWUOMmCLfRu7?=
 =?us-ascii?Q?9wf170J6bREBJhf8Obz+kOvfNr/td+4CAiWnYLhUGazWKNarZgIMFt99FPWn?=
 =?us-ascii?Q?O3egQycuuivRnw31zaIviD93ape3dSpaXWZfL5CDWx6uZQKlirsWEtM/twMp?=
 =?us-ascii?Q?XprLy9BXnuZoXST5z4uoIEOLsokkfF2/InoGiU1apMDd5W7EgiYs4hrRIawO?=
 =?us-ascii?Q?YIvNkfNOvrX6LLBm7BoLoA5aFN0M+SMy3Dx8UpxgFmy+Ru4Syxvk0aKjy2ip?=
 =?us-ascii?Q?qYPCfFON21+FTpsFdNhvJdweUmSMv8HyF74sQLIUymXyNRzF1lhEnNVQHsGW?=
 =?us-ascii?Q?ODX1I5Ad4r5e8Eb6zbt1e2fKCFYI2k1Tv3aPI7cslYkvR+niHc9AUQxQWeSb?=
 =?us-ascii?Q?GF4z61Vc8A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d45fbce7-24e5-4d8f-8e9d-08df3fe65c0e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:24:33.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcJF4WPqn0aJPlCQFzl4GdT8lJ7Kvxx+4fFOcj4CyqR/DTqmXAxvkmmY0Pk10jI8d9axTqgs897mnT0Z76XZYkeZZRZ4db635MTwonISi7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250019
Content-Type: text/plain; charset="utf-8"

Git v2.50.2 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This addresses the security issues CVE-2026-111760, CVE-2026-113408,
CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437.

This release also backports fixes necessary to let the CI builds pass
successfully.

Fixes since v2.50.1
-------------------

   Recursive clones are susceptible to Remote Code Execution: an
   attacker-controlled repository can be crafted in a way that exploits
   a bug in Git whereby Git can be fooled into overwriting a gitfile
   (used for submodules) with a symbolic link that then points to a
   directory with malicious config or hooks. The config or hooks may
   have attacker-specified code.

   See <https://github.com/git/git/security/advisories/GHSA-vp2w-7xxj-jvxr>
   for details.

   It is possible for a server to advertise an unborn HEAD that contains
   path-traversal characters (e.g., `refs/heads/../../../TARGET`). With
   the files ref backend that can lead to ref-updating actions to write
   to unwanted files.

   See <https://gitlab.com/gitlab-org/git/-/work_items/809> for details.

   When Git strips the GPG signatures from a commit message, it only
   accounts for two signatures. A commit message containing more than
   two signatures therefore causes a stack memory corruption.

   This can be triggered when using `git merge` with a tag which
   contains more than two signatures. As such, this makes way for a DoS
   attack which can potentially also affect forges when such a tag is
   pushed to a remote and a merge action is initiated.

   See <https://gitlab.com/gitlab-org/git/-/work_items/810> for details.

   Git rejects patches larger than ~1 GiB, because its patch application
   code does not work well with large files. That check, however, only
   considered the size of the patch as it appears in the input, which for
   binary patches is much smaller than the size of the file the patch
   describes, as binary patches are compressed and encoded. A binary
   patch that inflates to a very large size therefore slipped past the
   check and crashed Git with an out-of-bounds read.

   See <https://gitlab.com/gitlab-org/git/-/work_items/811> for details.

   When merging, Git computes the size of the buffer holding the merge
   result in a way that can overflow for very large merges, which can be
   triggered by a large number of conflicts combined with a large
   `conflict-marker-size`. The resulting buffer can then be too small,
   and Git writes past its end (and, before and after that, before its
   start), corrupting the heap.

   See <https://gitlab.com/gitlab-org/git/-/work_items/814> for details.

   In response to CVE-2019-1348, `fast-import` disallows the
   `export-marks` feature by default. The features
   `rewrite-submodules-to` and `rewrite-submodules-from` as well as the
   option `export-pack-edges` that were introduced in the meantime also
   allow reading from arbitrary paths, and are therefore now also
   disallowed by default.

   See <https://gitlab.com/gitlab-org/git/-/work_items/812> for details.

Git v2.51.3 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release merges up the fix that appears in v2.50.2 to address
CVE-2026-111760, CVE-2026-113408, CVE-2026-114466, CVE-2026-114467,
CVE-2026-114469 and CVE-2026-105437; see the release notes for that
version for details.

Git v2.52.1 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release merges up the fix that appears in v2.50.2 and v2.51.3
to address CVE-2026-111760, CVE-2026-113408, CVE-2026-114466,
CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437; see the
release notes for these versions for details.

Git v2.53.1 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release merges up the fix that appears in v2.50.2, v2.51.3 and
v2.52.1 to address CVE-2026-111760, CVE-2026-113408, CVE-2026-114466,
CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437; see the
release notes for these versions for details.

Git v2.54.1 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1 and v2.53.1 to address CVE-2026-111760, CVE-2026-113408,
CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and
CVE-2026-105437; see the release notes for these versions for
details.

Also contains minor documentation updates and code clean-ups.

Git v2.55.1 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1, v2.53.1 and v2.54.1 to address CVE-2026-111760,
CVE-2026-113408, CVE-2026-114466, CVE-2026-114467, CVE-2026-114469
and CVE-2026-105437; see the release notes for these versions for
details.

Git v2.56.1 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release merges up the fix that appears in v2.50.2, v2.51.3,
v2.52.1, v2.53.1, v2.54.1 and v2.55.1 to address CVE-2026-111760,
CVE-2026-113408, CVE-2026-114466, CVE-2026-114467, CVE-2026-114469
and CVE-2026-105437; see the release notes for these versions for
details.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/git/git/fixsort.patch                | 2 +-
 meta/recipes-devtools/git/{git_2.56.0.bb =3D> git_2.56.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.56.0.bb =3D> git_2.56.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-dev=
tools/git/git/fixsort.patch
index 6dda82dbdec..c68f7be5d3b 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From dbc552db68ca945a24d3cd15f39c6f9982cc317c Mon Sep 17 00:00:00 2001
+From d6a4fa6fa4529f37856913b598d4b3760d64e7a3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
diff --git a/meta/recipes-devtools/git/git_2.56.0.bb b/meta/recipes-devtool=
s/git/git_2.56.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.56.0.bb
rename to meta/recipes-devtools/git/git_2.56.1.bb
index 6fc2d5d78e4..48a92673cfa 100644
--- a/meta/recipes-devtools/git/git_2.56.0.bb
+++ b/meta/recipes-devtools/git/git_2.56.1.bb
@@ -175,7 +175,7 @@ EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno \
                  "
 EXTRA_OEMAKE +=3D "NO_GETTEXT=3D1"
=20
-SRC_URI[tarball.sha256sum] =3D "826817fd3671b8565586d6d49f688298de8354ab11=
db829c02720e5c74b9b39f"
+SRC_URI[tarball.sha256sum] =3D "fd0c0495427dc9ac445fdced8e36bb5eb6f233a14d=
a5db3c6dfd8dcfa7f85761"
=20
 CVE_STATUS[CVE-2024-32002] =3D "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] =3D "fixed-version: fixed since v2.49.0"
