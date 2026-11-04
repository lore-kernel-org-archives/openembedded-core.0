Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7204.1793792308801507545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DUwmlAti;
 spf=pass (domain: est.tech, ip: 40.107.130.37, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIHEmwYGjhC23pfZVlzpYwfFPIAWetbTTRvDqlxtZep8502vSmHv+npQmC+A6/4wa1eaDo0ce67jzOQUo3Q8RdXzlSkPB5hfqG4+dHX+Wy4yjvgboDImno1QLXf0D9XY/U1d0bYhuH7HCrSgI5Fcn6rqKm/LbLBSRVu2mHrQXHdV8qcXN7cRDWqR/QO5aK56o66/5oMvsds8e3UOsRKt6hFpf71BvWa6hDWqoWcB0YrMdv3QdvQR4CHSwk1OiCpe1HB8wlhQZ+zcVs2mATydyS4v9566xrwAkqrZVznccsZSUH2ZdYTZvmUBH5nWP7njoo68HsH+ZM+Peq5nhpvmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnZQkaf5CaiB7kCIVQAwV9EuPUcQW3ENWWSV2NYMTeM=;
 b=Ifk3xsNKqEwXoB6XhurCtoPKP2WYq2g+u9gxnuq/2cQNvx+lW05datSYswQFq5E583QKpGDp6mlQHmWn4/CrE8Dg6dT+oS2KzUKmHWvtardZNL5+H+TP94OBVGpNTYt1HDKMK4WD/s9TsiZlZEDtmm2IQiC0/csM1rU8GDU/4nZE4KnJfdyRgMYRlTN+L7pCJ2yQOKiO8tVFNkqG55BIDa4hc/PfEyjt7ExxmKDgioLD65R8v0ohh+LpA2ayVg6bwTiw/kMZsVn137ZqjWqHmXjh0SudJ6iSBic5VAuhtKReTrw1WKCkS0Kst7fd9xVtjpSCns0gNp8N/Gg4QLUQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnZQkaf5CaiB7kCIVQAwV9EuPUcQW3ENWWSV2NYMTeM=;
 b=DUwmlAtiZI9M4BJAMxey7uFquZFCgGHE8ZaodAiIIoW329H9IYrRF8paZke9Z1/ns63TIvhLZzJRcJ2xZximub8ZFoEYeFPAkp0AX43Ph5BVZZG7D3KH/hly15k+l9KTCd2R8/zCVhfx8WlgxWiMy7UFYpPMbFEamOgStU1yzs4vKfFv/gWLNEV/FcwWz8eCfxKvacBOSbhwPIy/li+4P9V/HBzPlNDmZ+jUmDarZg3kxH1+iWl9MK7mcxNDL3OkhBvXs0wPNsubFlW+iGcRbFf7CPHGOQ4+DXRlmsrMgfoBtxu2F/qW005+/2qKPSiMNpf5IWa416orOndYNCY7UA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0698.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:38:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:38:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] repo: upgrade 2.71 -> 2.72
Date: Wed,  4 Nov 2026 12:38:19 +0100
Message-ID: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0698:EE_
X-MS-Office365-Filtering-Correlation-Id: 1964ba6d-c5bf-4244-fbf3-08df3a682275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: xChki321diYumt/bez0Bmd45zz5YWCNVW+EsEdLE4UwOsEYFhZiLRLCcpc8c6ir+lhJy23l8S8J/K4Z27tdufqNSZEVVrw6Sw0b5JGnOT4Rra0MKiR79KjIP6oyl1e+gzRT6cmi+tFcvzMwu3iizPXE7J/wO2ntMDvI6+7Z947BSg9FzaXgaEbpex7wGQk08EfYzWEudT86p8gzpYQVG7coczRB7pHDp+6BNxypX1n85Jn8HDJPNDd2tkbHGhokcWikhIN6N63nDVeBO9LhY7WAlXEjA7BDXhaxMQCwaXYFjObEj85x8CtcZhwTmzE51ZD+GyrR1VmZU3hK6++XlS8nkUVH1uAVS4Ssh59r1HIu1lAlLxSYl44iwwwSchkqKSuO1outk3hak1nw/c13po7Ohq++BlqS+FWlMx3XofygrTlzBW7SzllnignvYOBe1arZ1QIVraoVIBBfdgPxU9kifQYZ+PpswQ9Bzw0RTr4bIlJU/MSsmeCDEdQ6vi3iupPGtKqBS1cHrOOpNxIH/d2SO29tPUV87F/A/1CDEcW6vif6G3TYEQCKHpEBj5iKal8+JwFMuiIUebfMgC3IfEO5rWRNfd+Ll6zb4AeEmvYdRxkVWRBWfNcjiF4lbBjtVPW0jY0GvGPwPs5FdDNUslAQKGRt1j2QARIVdoaMHnr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UyxQ5gS8lEABzxMDL6pzBbdSTIGcwi/GFz2u/rhwFN4P2KfI07lrW1ZIw0ek?=
 =?us-ascii?Q?QmKdW2IntauxUrGpHv8AU12KJvS1bAFxDhXIBfVctAduU8GT1T0IprDuUxbO?=
 =?us-ascii?Q?b8/qAHyxn3O/5bE8d7XG8tu6UA6ogsm/O1cJAIgSyVU3fImjQZSA8vz3DaCS?=
 =?us-ascii?Q?difGHhdkkf7/E9bJEHKcYi0795hl5VUj7ztQ9CU1Vl64eI7hP/Pd2Wxz0fGi?=
 =?us-ascii?Q?7DpMq1U9TAwLx1JryodJORFMJXeHbXSmCA/bnd3qSH9T6qGfo25knkui97wa?=
 =?us-ascii?Q?IxlprJnYdrYUfND160dCuTaEGRb1r+SwtSFLCinPwPYo/t7mxewARCZ9QpDm?=
 =?us-ascii?Q?VBvDAohvw7X5bsRnJd4JrqMIYDLPMDcHY23SHKtHbFHh/D+w6yoonupA8rJC?=
 =?us-ascii?Q?ZQ4iYLjll5SeJ/d299n4mL55VZzQACy2hRKqyp6bwVJmyHb7cXXHGJdTgpQg?=
 =?us-ascii?Q?CESXKiqQewlNzwsng+wXcBUjCeJ+Qw1TwttJwXmkCyw0Hb0K+jTs/rnHlTqZ?=
 =?us-ascii?Q?oo0K/qnB25jjQ193GU4/ZKFL6evTHv4ukUn8TJjFSDnfLxzhqZsbP4AnZjMF?=
 =?us-ascii?Q?2QKisW1Vy1nGRdJyoF8LxIjuxQp/uRSaVqCuaZNaRecQwlSt2Ipi6/cPvqq9?=
 =?us-ascii?Q?X71q4N0cr7lxEwSZodKPRZ/+0xy/oXlumITbpEbgFrl2roAtw+04D/d9qj9u?=
 =?us-ascii?Q?onOCeJUegiay3Bvs7DRPRXRLAeN+NEQzjxEZsJox5zDg+YmykBjtYMJZkY04?=
 =?us-ascii?Q?DOJ4ItuGbFUF/euW6BUvEPS8xokHMygNz2kZxyal2Xcy9FavS9XRgpILXGxi?=
 =?us-ascii?Q?IG/9hEZqNOh6HnhoEli40pf+bjhkOVwWBVUZ+meFkGkyfOCGnQx23GiJDZlO?=
 =?us-ascii?Q?qjC1niKXJvsfEafO/m9Q3v5m1bnWXrdF7ecb6Fabtu68uFc0FPEvDyTEB759?=
 =?us-ascii?Q?q3otBgxX2i/6NWjZ3gtxjgd4eFyH1J06j+MZV7lMHNccuNZabUg1rotZyil9?=
 =?us-ascii?Q?D//YGv62BO0+DWRARuh6eZN9V2gNpm4bUzGi3tKs1HLm+Hm4o8ZaIt02A8cF?=
 =?us-ascii?Q?xvOsp/3gp7bKIR9VTChEhsOHiqDt/M0d+Jm35NjboZxyEZIkBPoBD/L0CaDU?=
 =?us-ascii?Q?dlfwqhn9uyF66rVKLc34nu4zocWfVoeTpn5oZhBUGLkjoDSNktrPd4J/t7Ne?=
 =?us-ascii?Q?hqGiZ+VKhwG+Cfp5hGP30aUpzjLfvr5UC+O8hALaap/e7b24cCMaNi0PE4G0?=
 =?us-ascii?Q?UhdmJvZWQBG9XGzT9f2Mm/9p6idQfx7ygg/z3VMu0uIZDpz7Y/u+FpeOSdsP?=
 =?us-ascii?Q?37k0+WHZzeDR2kH/RAoVRRu314nyi9ZaiGVmTDOf7bXXF+Rs5dhajUFq2+ZL?=
 =?us-ascii?Q?IPYvVsyySvHPocYIRndo/93rESJszUl5HrLdpi3blmc9jbPdIj/B4YL51whl?=
 =?us-ascii?Q?rZMlJUZ3z5+6gl1QTLd3+3VsW7QuIkZQb9ZC5KNnqBU4fh4d21TJc2hY82N0?=
 =?us-ascii?Q?W3YwDilVZ3xOmbvaIZQXhntCXplEhxnaKIruVTiaxqGCqhm4NB1XcKcMwX3a?=
 =?us-ascii?Q?vJkFfuMmi7Kaoe8nqfSspBHj5ayCHZGwQZQU4pW+UzxtPXY4Qe14qUtjBddB?=
 =?us-ascii?Q?wXG4+ZCUnjB/b0D21kSBGO4bfYXU0Y0PjxEyn0JaE7Xoep5aT2/9i2H7ihvZ?=
 =?us-ascii?Q?u04Z3rrRhVFSaoLtAPRUZQfITrK6XBBA8PdVx6JZ3B6aCcJmRD5ax9xYT9/J?=
 =?us-ascii?Q?pP/ojmd+nw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1964ba6d-c5bf-4244-fbf3-08df3a682275
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:38:24.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46EsRVqtPsLvMXkRWBhYzUJSV4WoDIN/vbFciQ2N2nPGm1zhXCyJ+KhRIpCGcitYo1QFAJbhbZZTdNZ2JJFvbBemJoNcIu5tAcg7Ol989c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249367
Content-Type: text/plain; charset="utf-8"

upload: add --ignore-remote-commits
docs: add Repology links for distro package versions
docs: release: update release process to match current practice
docs: release: remove stale Project References table

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/repo/{repo_2.71.bb =3D> repo_2.72.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.71.bb =3D> repo_2.72.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.71.bb b/meta/recipes-devtool=
s/repo/repo_2.72.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.71.bb
rename to meta/recipes-devtools/repo/repo_2.72.bb
index 9d9dceb32c..10e9208ebf 100644
--- a/meta/recipes-devtools/repo/repo_2.71.bb
+++ b/meta/recipes-devtools/repo/repo_2.72.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "338ddb7d83ea35d5aef94d3c5d95c74fa3845780"
+SRCREV =3D "365629015667e04739f59070e745548a728549c8"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.com/=
GerritCodeReview/git-repo.git"
=20
